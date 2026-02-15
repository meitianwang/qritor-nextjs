import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError, apiNotFound, apiValidationError } from '@/lib/api-response'

function serializeKnowledge(k: any) {
  return {
    id: Number(k.id),
    name: k.name,
    content: k.content,
    novelCreationMethodId: k.novel_creation_method_id
      ? Number(k.novel_creation_method_id)
      : null,
    builtIn: k.built_in === 1,
  }
}

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params
    const knowledge = await prisma.knowledge.findUnique({
      where: { id: BigInt(id) },
    })

    if (!knowledge) {
      return apiNotFound('知识库不存在')
    }

    return apiSuccess(serializeKnowledge(knowledge))
  } catch (error) {
    return apiError(500, '获取知识库失败')
  }
}

export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params
    const body = await request.json()

    const existing = await prisma.knowledge.findUnique({
      where: { id: BigInt(id) },
    })

    if (!existing) {
      return apiNotFound('知识库不存在')
    }

    if (!body.name || !body.name.trim()) {
      return apiValidationError('知识库名称不能为空')
    }
    if (!body.content || !body.content.trim()) {
      return apiValidationError('知识库内容不能为空')
    }

    const updateData: Record<string, any> = { updated_at: new Date() }

    if (body.name !== undefined) updateData.name = body.name
    if (body.content !== undefined) updateData.content = body.content
    if (body.novelCreationMethodId !== undefined)
      updateData.novel_creation_method_id = body.novelCreationMethodId
        ? BigInt(body.novelCreationMethodId)
        : null
    if (body.builtIn !== undefined) updateData.built_in = body.builtIn ? 1 : 0

    const updated = await prisma.knowledge.update({
      where: { id: BigInt(id) },
      data: updateData,
    })

    return apiSuccess({ id: Number(updated.id), name: updated.name })
  } catch (error) {
    return apiError(500, '更新知识库失败')
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params

    const existing = await prisma.knowledge.findUnique({
      where: { id: BigInt(id) },
    })

    if (!existing) {
      return apiNotFound('知识库不存在')
    }

    await prisma.knowledge.delete({ where: { id: BigInt(id) } })

    return apiSuccess(null)
  } catch (error) {
    return apiError(500, '删除知识库失败')
  }
}
