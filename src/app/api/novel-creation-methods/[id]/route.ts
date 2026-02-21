import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'

function serializeMethod(
  method: {
    id: bigint
    name: string
    description: string | null
    novel_type: string | null
    language: string | null
    visible_categories: string | null
    created_at: Date
    updated_at: Date | null
  },
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
    novelType: method.novel_type,
    language: method.language,
    visibleCategories: parsedCategories,
    createdAt: method.created_at.toISOString(),
    updatedAt: method.updated_at?.toISOString() || null,
  }
}

export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params

    const method = await prisma.novel_creation_method.findUnique({
      where: { id: BigInt(id) },
    })

    if (!method) {
      return apiNotFound('创作方法不存在')
    }

    return apiSuccess(serializeMethod(method))
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
    await getCurrentAdminUser(request)
    const body = await request.json()

    const method = await prisma.novel_creation_method.findUnique({
      where: { id: BigInt(id) },
    })

    if (!method) {
      return apiNotFound('创作方法不存在')
    }

    const updateData: Record<string, unknown> = {
      updated_at: new Date(),
    }

    if (body.name !== undefined) updateData.name = body.name
    if (body.description !== undefined) updateData.description = body.description
    if (body.novelType !== undefined) updateData.novel_type = body.novelType
    if (body.language !== undefined) updateData.language = body.language
    if (body.visibleCategories !== undefined)
      updateData.visible_categories = body.visibleCategories
        ? JSON.stringify(body.visibleCategories)
        : null
    const updated = await prisma.novel_creation_method.update({
      where: { id: BigInt(id) },
      data: updateData,
    })

    return apiSuccess(serializeMethod(updated))
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
    await getCurrentAdminUser(request)

    const method = await prisma.novel_creation_method.findUnique({
      where: { id: BigInt(id) },
    })

    if (!method) {
      return apiNotFound('创作方法不存在')
    }

    await prisma.$transaction(async (tx) => {
      const methodId = BigInt(id)
      await tx.skill.deleteMany({ where: { novel_creation_method_id: methodId } })
      await tx.module_type.deleteMany({ where: { novel_creation_method_id: methodId } })
      await tx.novel_creation_method.delete({ where: { id: methodId } })
    })

    return apiSuccess(null, '删除成功')
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, '删除创作方法失败')
  }
}
