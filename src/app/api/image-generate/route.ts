import { randomUUID } from 'crypto'
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

    const width = body.width || 1024
    const height = body.height || 1024

    // Validate config exists and is enabled
    const config = await prisma.image_gen_config.findUnique({
      where: { id: BigInt(body.config_id) },
    })

    if (!config) {
      return apiError(404, '生图模型配置不存在')
    }
    if (config.enabled !== 1) {
      return apiError(400, '该生图模型已禁用')
    }

    // Calculate credit consumption
    const baseCredits = Math.max(1.0, (width * height) / 1000000)
    const creditRate = config.credit_rate ?? 1.0
    const creditsToConsume = baseCredits * creditRate

    // Credit check - import dynamically to avoid circular dependencies
    const { hasEnoughCredits } = await import('@/lib/services/credit-service')
    if (!(await hasEnoughCredits(user.id, creditsToConsume))) {
      return apiError(402, '积分不足，请充值后再试')
    }

    // Create async task
    const taskId = randomUUID()

    await prisma.image_generation_task.create({
      data: {
        id: taskId,
        user_id: user.id,
        status: 'pending',
        prompt: body.prompt,
        config_id: BigInt(body.config_id),
        width: width,
        height: height,
        style: body.style || null,
        reference_images: body.reference_images
          ? JSON.stringify(body.reference_images)
          : null,
        strength: body.strength ?? 0.7,
        created_at: new Date(),
      },
    })

    // Note: Background task processing is handled separately
    // In Next.js, we would use a queue or cron-based approach

    return apiSuccess({
      taskId: taskId,
      message: '任务已创建，请轮询获取结果',
    })
  } catch (error) {
    if (error instanceof Response) return error
    const message =
      error instanceof Error ? error.message : '创建任务失败'
    return apiError(500, message)
  }
}
