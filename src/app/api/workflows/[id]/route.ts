import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError, apiNotFound, apiValidationError } from '@/lib/api-response'

function serializeWorkflow(w: any) {
  return {
    id: Number(w.id),
    name: w.name,
    description: w.description,
    nodesJson: w.nodes_json,
    edgesJson: w.edges_json,
  }
}

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params
    const workflow = await prisma.workflow.findUnique({
      where: { id: BigInt(id) },
    })

    if (!workflow) {
      return apiNotFound('工作流不存在')
    }

    return apiSuccess(serializeWorkflow(workflow))
  } catch (error) {
    return apiError(500, '获取工作流失败')
  }
}

export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params
    const body = await request.json()

    const existing = await prisma.workflow.findUnique({
      where: { id: BigInt(id) },
    })

    if (!existing) {
      return apiNotFound('工作流不存在')
    }

    const updateData: Record<string, any> = { updated_at: new Date() }

    if (body.name) updateData.name = body.name
    if (body.description !== undefined) updateData.description = body.description
    if (body.nodesJson !== undefined) updateData.nodes_json = body.nodesJson
    if (body.edgesJson !== undefined) updateData.edges_json = body.edgesJson

    const updated = await prisma.workflow.update({
      where: { id: BigInt(id) },
      data: updateData,
    })

    return apiSuccess({ id: Number(updated.id), name: updated.name })
  } catch (error) {
    return apiError(500, '更新工作流失败')
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params

    const existing = await prisma.workflow.findUnique({
      where: { id: BigInt(id) },
    })

    if (!existing) {
      return apiNotFound('工作流不存在')
    }

    await prisma.workflow.delete({ where: { id: BigInt(id) } })

    return apiSuccess(null)
  } catch (error) {
    return apiError(500, '删除工作流失败')
  }
}
