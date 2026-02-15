import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError, apiValidationError } from '@/lib/api-response'

export async function GET() {
  try {
    const prompts = await prisma.prompt.findMany()

    return apiSuccess(
      prompts.map((p) => ({
        id: Number(p.id),
        name: p.name,
        role: p.role,
        novelCreationMethodId: p.novel_creation_method_id
          ? Number(p.novel_creation_method_id)
          : null,
      }))
    )
  } catch (error) {
    return apiError(500, '获取提示词列表失败')
  }
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()

    if (!body.name || !body.name.trim()) {
      return apiValidationError('提示词名称不能为空')
    }

    const fields = [
      body.role,
      body.context,
      body.workflow,
      body.constraints,
      body.format,
      body.goal,
      body.positiveExample,
      body.negativeExample,
    ]
    if (!fields.some((f) => f && f.trim())) {
      return apiValidationError('提示词内容不能全部为空')
    }

    const existing = await prisma.prompt.findFirst({
      where: { name: body.name },
    })
    if (existing) {
      return apiError(500, '提示词名称已存在')
    }

    const prompt = await prisma.prompt.create({
      data: {
        name: body.name,
        role: body.role || null,
        context: body.context || null,
        workflow: body.workflow || null,
        constraints: body.constraints || null,
        format: body.format || null,
        goal: body.goal || null,
        positive_example: body.positiveExample || null,
        negative_example: body.negativeExample || null,
        novel_creation_method_id: body.novelCreationMethodId
          ? BigInt(body.novelCreationMethodId)
          : null,
        built_in: body.builtIn ? 1 : 0,
        created_at: new Date(),
      },
    })

    return apiSuccess({ id: Number(prompt.id), name: prompt.name })
  } catch (error) {
    return apiError(500, '创建提示词失败')
  }
}
