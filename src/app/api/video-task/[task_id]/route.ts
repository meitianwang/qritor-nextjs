import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError, apiNotFound, apiValidationError } from '@/lib/api-response'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ task_id: string }> }
) {
  try {
    const user = await getCurrentUser(request)
    const { task_id } = await params
    const { searchParams } = new URL(request.url)
    const configId = searchParams.get('config_id')

    if (!configId) {
      return apiValidationError('config_id 参数必填')
    }

    // Get video gen config
    const config = await prisma.video_gen_config.findUnique({
      where: { id: BigInt(configId) },
    })

    if (!config) {
      return apiNotFound('生视频模型配置不存在')
    }

    const provider = config.provider?.toLowerCase() || ''

    if (provider === 'apimart') {
      const apiBase = config.api_base || 'https://api.apimart.ai/v1'

      const endpoint = apiBase.trimEnd().endsWith('/v1')
        ? `/tasks/${task_id}`
        : `/v1/tasks/${task_id}`

      const response = await fetch(`${apiBase.replace(/\/+$/, '')}${endpoint}`, {
        method: 'GET',
        headers: {
          Authorization: `Bearer ${config.api_key}`,
        },
        signal: AbortSignal.timeout(30000),
      })

      if (response.status !== 200) {
        const text = await response.text()
        return apiError(response.status, `查询任务状态失败: ${text}`)
      }

      const data = await response.json()

      // Parse APIMart response format
      const taskData = data.data || data
      const status = taskData.status || 'unknown'
      const progress = taskData.progress || 0

      const resultData: Record<string, any> = {
        taskId: task_id,
        status: status,
        progress: progress,
      }

      // If completed, get video URL
      if (status === 'completed') {
        const resultObj = taskData.result || {}
        const videos = resultObj.videos || resultObj.images || []
        if (videos.length > 0) {
          const videoItem = videos[0]
          let videoUrl = videoItem.url
          if (Array.isArray(videoUrl)) {
            videoUrl = videoUrl.length > 0 ? videoUrl[0] : null
          }
          resultData.videoUrl = videoUrl
          resultData.expiresAt = videoItem.expires_at
        }
      }

      // If failed, get error message
      if (status === 'failed') {
        resultData.error = taskData.error || '生成失败'
      }

      return apiSuccess(resultData)
    } else {
      return apiError(400, `不支持的生视频服务商: ${provider}`)
    }
  } catch (error) {
    if (error instanceof Response) return error
    if (
      error instanceof Error &&
      error.name === 'TimeoutError'
    ) {
      return apiError(504, '查询任务状态超时')
    }
    const message =
      error instanceof Error ? error.message : '查询任务状态失败'
    return apiError(500, message)
  }
}
