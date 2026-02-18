import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError, apiValidationError } from '@/lib/api-response'

export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const body = await request.json()

    if (!body.prompt) {
      return apiValidationError('prompt 不能为空')
    }
    if (!body.config_id) {
      return apiValidationError('config_id 不能为空')
    }

    const duration = body.duration || 5
    const aspectRatio = body.aspect_ratio || '16:9'

    // Validate config exists and is enabled
    const config = await prisma.video_gen_config.findUnique({
      where: { id: BigInt(body.config_id) },
    })

    if (!config) {
      return apiError(404, '生视频模型配置不存在')
    }
    if (config.enabled !== 1) {
      return apiError(400, '该生视频模型已禁用')
    }

    const provider = config.provider?.toLowerCase() || ''

    // Calculate credit consumption: ceil(duration × credit_rate), minimum 1
    const baseCredits = duration
    const creditRate = config.credit_rate ?? 1.0
    const creditsToConsume = Math.max(1, Math.ceil(baseCredits * creditRate))

    // Credit check
    const { hasEnoughCredits, consumeCreditsWithTransaction, recordCreditDebt } = await import(
      '@/lib/services/credit-service'
    )
    if (!(await hasEnoughCredits(user.id, creditsToConsume))) {
      return apiError(402, '积分不足，请充值后再试')
    }

    if (provider === 'apimart') {
      const apiBase = config.api_base || 'https://api.apimart.ai/v1'

      const requestBody: Record<string, unknown> = {
        model: config.model_name,
        prompt: body.prompt,
        duration: Math.min(duration, config.max_duration || 60),
        aspect_ratio: aspectRatio,
      }

      if (body.reference_image) {
        requestBody.image = body.reference_image
      }

      const endpoint = apiBase.trimEnd().endsWith('/v1')
        ? '/videos/generations'
        : '/v1/videos/generations'

      const response = await fetch(`${apiBase.replace(/\/+$/, '')}${endpoint}`, {
        method: 'POST',
        headers: {
          Authorization: `Bearer ${config.api_key}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(requestBody),
      })

      if (![200, 201, 202].includes(response.status)) {
        const text = await response.text()
        return apiError(response.status, `生视频失败: ${text}`)
      }

      const data = await response.json()

      // Parse task_id from various response formats
      let taskId: string | null = null
      if (data.id) {
        taskId = data.id
      } else if (data.task_id) {
        taskId = data.task_id
      } else if (Array.isArray(data.data) && data.data.length > 0) {
        const firstItem = data.data[0]
        taskId = firstItem.task_id || firstItem.id
      } else if (data.data && typeof data.data === 'object') {
        taskId = data.data.id || data.data.task_id
      }

      if (!taskId) {
        return apiError(
          500,
          `生视频返回数据异常：缺少任务 ID，原始响应: ${JSON.stringify(data)}`
        )
      }

      // Deduct credits after task creation. If deduction fails, still return taskId
      // to avoid creating an unreachable external task.
      const deducted = await consumeCreditsWithTransaction(
        user.id,
        creditsToConsume,
        'VIDEO_GENERATE',
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        `视频生成: ${config.provider}/${config.model_name} (${duration}s)`,
      )
      if (!deducted) {
        let debtRecorded = false
        try {
          await recordCreditDebt(
            user.id,
            creditsToConsume,
            'VIDEO_GENERATE',
            `视频任务已创建但积分扣减失败，已记入欠费: ${taskId}`,
          )
          debtRecorded = true
        } catch (debtError) {
          console.error(
            `视频任务欠费记录失败: user=${user.id}, taskId=${taskId}, credits=${creditsToConsume}, error=${String(debtError)}`,
          )
        }

        return apiSuccess({
          taskId: taskId,
          status: 'pending',
          creditsConsumed: creditsToConsume,
          creditsCharged: false,
          billingStatus: debtRecorded
            ? 'DEBT_RECORDED'
            : 'PENDING_RECONCILIATION',
          estimatedTime: duration * 10,
          warning: debtRecorded
            ? '任务已创建，但本次扣费失败，已记入欠费并将在后续消费时自动补扣'
            : '任务已创建，但积分扣减失败，请联系客服处理',
        })
      }

      return apiSuccess({
        taskId: taskId,
        status: 'pending',
        creditsConsumed: creditsToConsume,
        creditsCharged: true,
        billingStatus: 'CHARGED',
        estimatedTime: duration * 10,
      })
    } else {
      return apiError(400, `不支持的生视频服务商: ${provider}`)
    }
  } catch (error) {
    if (error instanceof Response) return error
    const message =
      error instanceof Error ? error.message : '生视频失败'
    return apiError(500, message)
  }
}
