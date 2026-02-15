import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'

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

    const prompts = await prisma.prompt.findMany({
      where: { novel_creation_method_id: BigInt(id) },
    })

    return apiSuccess(prompts.map(serializePrompt))
  } catch (error) {
    return apiError(500, '获取提示词列表失败')
  }
}
