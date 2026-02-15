import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'

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

    const knowledges = await prisma.knowledge.findMany({
      where: { novel_creation_method_id: BigInt(id) },
    })

    return apiSuccess(knowledges.map(serializeKnowledge))
  } catch (error) {
    return apiError(500, '获取知识库列表失败')
  }
}
