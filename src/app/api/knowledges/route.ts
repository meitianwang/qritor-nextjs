import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError, apiValidationError } from '@/lib/api-response'

export async function GET() {
  try {
    const knowledges = await prisma.knowledge.findMany()

    return apiSuccess(
      knowledges.map((k) => ({
        id: Number(k.id),
        name: k.name,
        novelCreationMethodId: k.novel_creation_method_id
          ? Number(k.novel_creation_method_id)
          : null,
      }))
    )
  } catch (error) {
    return apiError(500, '获取知识库列表失败')
  }
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()

    if (!body.name || !body.name.trim()) {
      return apiValidationError('知识库名称不能为空')
    }
    if (!body.content || !body.content.trim()) {
      return apiValidationError('知识库内容不能为空')
    }

    const existing = await prisma.knowledge.findFirst({
      where: { name: body.name },
    })
    if (existing) {
      return apiError(500, '知识库名称已存在')
    }

    const knowledge = await prisma.knowledge.create({
      data: {
        name: body.name,
        content: body.content,
        novel_creation_method_id: body.novelCreationMethodId
          ? BigInt(body.novelCreationMethodId)
          : null,
        built_in: body.builtIn ? 1 : 0,
        created_at: new Date(),
      },
    })

    return apiSuccess({ id: Number(knowledge.id), name: knowledge.name })
  } catch (error) {
    return apiError(500, '创建知识库失败')
  }
}
