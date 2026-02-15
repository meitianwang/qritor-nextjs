import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError, apiNotFound, apiValidationError } from '@/lib/api-response'

function serializePrompt(p: any) {
  return {
    id: Number(p.id),
    name: p.name,
    role: p.role,
    context: p.context,
    workflow: p.workflow,
    constraints: p.constraints,
    format: p.format,
    goal: p.goal,
    positiveExample: p.positive_example,
    negativeExample: p.negative_example,
    novelCreationMethodId: p.novel_creation_method_id
      ? Number(p.novel_creation_method_id)
      : null,
    builtIn: p.built_in === 1,
  }
}

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params
    const prompt = await prisma.prompt.findUnique({
      where: { id: BigInt(id) },
    })

    if (!prompt) {
      return apiNotFound('提示词不存在')
    }

    return apiSuccess(serializePrompt(prompt))
  } catch (error) {
    return apiError(500, '获取提示词失败')
  }
}

export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params
    const body = await request.json()

    const existing = await prisma.prompt.findUnique({
      where: { id: BigInt(id) },
    })

    if (!existing) {
      return apiNotFound('提示词不存在')
    }

    if (!body.name || !body.name.trim()) {
      return apiValidationError('提示词名称不能为空')
    }

    const updateData: Record<string, any> = { updated_at: new Date() }

    if (body.name !== undefined) updateData.name = body.name
    if (body.role !== undefined) updateData.role = body.role
    if (body.context !== undefined) updateData.context = body.context
    if (body.workflow !== undefined) updateData.workflow = body.workflow
    if (body.constraints !== undefined) updateData.constraints = body.constraints
    if (body.format !== undefined) updateData.format = body.format
    if (body.goal !== undefined) updateData.goal = body.goal
    if (body.positiveExample !== undefined)
      updateData.positive_example = body.positiveExample
    if (body.negativeExample !== undefined)
      updateData.negative_example = body.negativeExample
    if (body.novelCreationMethodId !== undefined)
      updateData.novel_creation_method_id = body.novelCreationMethodId
        ? BigInt(body.novelCreationMethodId)
        : null
    if (body.builtIn !== undefined) updateData.built_in = body.builtIn ? 1 : 0

    const updated = await prisma.prompt.update({
      where: { id: BigInt(id) },
      data: updateData,
    })

    return apiSuccess({ id: Number(updated.id), name: updated.name })
  } catch (error) {
    return apiError(500, '更新提示词失败')
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params

    const existing = await prisma.prompt.findUnique({
      where: { id: BigInt(id) },
    })

    if (!existing) {
      return apiNotFound('提示词不存在')
    }

    await prisma.prompt.delete({ where: { id: BigInt(id) } })

    return apiSuccess(null)
  } catch (error) {
    return apiError(500, '删除提示词失败')
  }
}
