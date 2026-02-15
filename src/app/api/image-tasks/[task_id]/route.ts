import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ task_id: string }> }
) {
  try {
    const user = await getCurrentUser(request)
    const { task_id } = await params

    const task = await prisma.image_generation_task.findFirst({
      where: {
        id: task_id,
        user_id: user.id,
      },
    })

    if (!task) {
      return apiNotFound('任务不存在')
    }

    return apiSuccess({
      id: task.id,
      status: task.status,
      imageUrl: task.image_url,
      errorMessage: task.error_message,
      creditsConsumed: task.credits_consumed,
      createdAt: task.created_at?.toISOString() || null,
      startedAt: task.started_at?.toISOString() || null,
      completedAt: task.completed_at?.toISOString() || null,
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, '查询任务状态失败')
  }
}
