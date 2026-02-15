import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError, apiNotFound, apiForbidden } from '@/lib/api-response'

export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params
    const user = await getCurrentUser(request)

    const method = await prisma.novel_creation_method.findUnique({
      where: { id: BigInt(id) },
    })

    if (!method) {
      return apiNotFound('创作方法不存在')
    }

    if (method.is_preset === 1) {
      return apiForbidden('预设创作方法无法发布')
    }

    if (method.user_id === null || method.user_id !== user.id) {
      return apiForbidden('只能发布自己的创作方法')
    }

    const updated = await prisma.novel_creation_method.update({
      where: { id: BigInt(id) },
      data: {
        status: 'published',
        updated_at: new Date(),
      },
    })

    return apiSuccess({
      id: Number(updated.id),
      status: updated.status,
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, '发布创作方法失败')
  }
}
