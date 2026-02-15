import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params

    const workflows = await prisma.workflow.findMany({
      where: { novel_creation_method_id: BigInt(id) },
    })

    return apiSuccess(
      workflows.map((w) => ({
        id: Number(w.id),
        name: w.name,
        description: w.description,
        novelCreationMethodId: w.novel_creation_method_id
          ? Number(w.novel_creation_method_id)
          : null,
        nodesJson: w.nodes_json,
        edgesJson: w.edges_json,
      }))
    )
  } catch (error) {
    return apiError(500, '获取工作流列表失败')
  }
}
