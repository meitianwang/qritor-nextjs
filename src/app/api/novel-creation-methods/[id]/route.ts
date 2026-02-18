import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getCurrentUser, getCurrentUserOptional } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError, apiNotFound, apiForbidden } from '@/lib/api-response'
import { users_role } from '@/generated/prisma/client'

function serializeMethod(
  method: {
    id: bigint
    name: string
    description: string | null
    workflow_id: bigint | null
    novel_type: string | null
    language: string | null
    is_preset: number
    user_id: bigint | null
    status: string
    visible_categories: string | null
    created_at: Date
    updated_at: Date | null
  },
  creatorName: string | null,
  canEdit: boolean
) {
  let parsedCategories: string[] | null = null
  if (method.visible_categories) {
    try {
      parsedCategories = JSON.parse(method.visible_categories)
    } catch {
      parsedCategories = null
    }
  }

  return {
    id: Number(method.id),
    name: method.name,
    description: method.description,
    workflowId: method.workflow_id ? Number(method.workflow_id) : null,
    novelType: method.novel_type,
    language: method.language,
    isPreset: method.is_preset === 1,
    userId: method.user_id ? Number(method.user_id) : null,
    status: method.status,
    creatorName,
    canEdit,
    visibleCategories: parsedCategories,
    createdAt: method.created_at.toISOString(),
    updatedAt: method.updated_at?.toISOString() || null,
  }
}

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params
    const user = await getCurrentUserOptional(request)

    const method = await prisma.novel_creation_method.findUnique({
      where: { id: BigInt(id) },
    })

    if (!method) {
      return apiNotFound('创作方法不存在')
    }

    let creatorName: string | null = null
    if (method.user_id) {
      const creator = await prisma.users.findUnique({
        where: { id: method.user_id },
        select: { nickname: true },
      })
      creatorName = creator?.nickname || null
    }

    const canEdit =
      user !== null &&
      (user.role === users_role.ADMIN ||
        (method.user_id !== null && method.user_id === user.id))

    return apiSuccess(serializeMethod(method, creatorName, canEdit))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, '获取创作方法失败')
  }
}

export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params
    const user = await getCurrentUser(request)
    const body = await request.json()

    const method = await prisma.novel_creation_method.findUnique({
      where: { id: BigInt(id) },
    })

    if (!method) {
      return apiNotFound('创作方法不存在')
    }

    const canEdit =
      user.role === users_role.ADMIN ||
      (method.user_id !== null && method.user_id === user.id)

    if (!canEdit) {
      return apiForbidden('无权修改此创作方法')
    }

    const updateData: Record<string, unknown> = {
      updated_at: new Date(),
    }

    if (body.name !== undefined) updateData.name = body.name
    if (body.description !== undefined) updateData.description = body.description
    if (body.novelType !== undefined) updateData.novel_type = body.novelType
    if (body.language !== undefined) updateData.language = body.language
    if (body.workflowId !== undefined)
      updateData.workflow_id = body.workflowId ? BigInt(body.workflowId) : null
    if (body.visibleCategories !== undefined)
      updateData.visible_categories = body.visibleCategories
        ? JSON.stringify(body.visibleCategories)
        : null
    if (body.status !== undefined) updateData.status = body.status

    const updated = await prisma.novel_creation_method.update({
      where: { id: BigInt(id) },
      data: updateData,
    })

    let creatorName: string | null = null
    if (updated.user_id) {
      const creator = await prisma.users.findUnique({
        where: { id: updated.user_id },
        select: { nickname: true },
      })
      creatorName = creator?.nickname || null
    }

    return apiSuccess(serializeMethod(updated, creatorName, true))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, '更新创作方法失败')
  }
}

export async function DELETE(
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

    const canEdit =
      user.role === users_role.ADMIN ||
      (method.user_id !== null && method.user_id === user.id)

    if (!canEdit) {
      return apiForbidden('无权删除此创作方法')
    }

    await prisma.$transaction(async (tx) => {
      const methodId = BigInt(id)
      await tx.module_type.deleteMany({ where: { novel_creation_method_id: methodId } })
      await tx.workflow.deleteMany({ where: { novel_creation_method_id: methodId } })
      await tx.prompt.deleteMany({ where: { novel_creation_method_id: methodId } })
      await tx.novel_creation_method.delete({ where: { id: methodId } })
    })

    return apiSuccess(null, '删除成功')
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, '删除创作方法失败')
  }
}
