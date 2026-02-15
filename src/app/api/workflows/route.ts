import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError, apiValidationError } from '@/lib/api-response'

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()

    if (!body.name || !body.name.trim()) {
      return apiValidationError('工作流名称不能为空')
    }

    const workflow = await prisma.workflow.create({
      data: {
        name: body.name,
        description: body.description || null,
        novel_creation_method_id: body.novelCreationMethodId
          ? BigInt(body.novelCreationMethodId)
          : null,
        nodes_json: body.nodesJson || '[]',
        edges_json: body.edgesJson || '[]',
        created_at: new Date(),
      },
    })

    return apiSuccess({ id: Number(workflow.id), name: workflow.name })
  } catch (error) {
    return apiError(500, '创建工作流失败')
  }
}
