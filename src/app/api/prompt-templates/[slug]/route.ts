import { NextRequest } from 'next/server'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { serializeCamel } from '@/lib/serialize'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  try {
    const { slug } = await params

    const template = await prisma.prompt_template.findUnique({
      where: { slug },
    })

    if (!template) {
      return apiNotFound('提示词模板不存在')
    }

    return apiSuccess(serializeCamel(template))
  } catch (error) {
    return apiError(500, `获取提示词模板失败: ${String(error)}`)
  }
}

export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { slug } = await params
    const body = await request.json()

    const existing = await prisma.prompt_template.findUnique({
      where: { slug },
    })
    if (!existing) {
      return apiNotFound('提示词模板不存在')
    }

    const { name, category, content, variables, is_active } = body as {
      name?: string
      category?: string
      content?: string
      variables?: string
      is_active?: number
    }

    const updateData: Record<string, unknown> = { updated_at: new Date() }
    if (name !== undefined) updateData.name = name
    if (category !== undefined) updateData.category = category
    if (content !== undefined) {
      updateData.content = content
      // Auto-increment version on content change
      updateData.version = (existing.version ?? 0) + 1
    }
    if (variables !== undefined) updateData.variables = variables
    if (is_active !== undefined) updateData.is_active = is_active

    const updated = await prisma.prompt_template.update({
      where: { slug },
      data: updateData,
    })

    return apiSuccess(serializeCamel(updated))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `更新提示词模板失败: ${String(error)}`)
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { slug } = await params

    const existing = await prisma.prompt_template.findUnique({
      where: { slug },
    })
    if (!existing) {
      return apiNotFound('提示词模板不存在')
    }

    await prisma.prompt_template.delete({
      where: { slug },
    })

    return apiSuccess(null, '提示词模板已删除')
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `删除提示词模板失败: ${String(error)}`)
  }
}
