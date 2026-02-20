import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'

function serializeModuleType(mt: any) {
  return {
    id: Number(mt.id),
    name: mt.name,
    description: mt.description,
    jsonSchema: mt.json_schema,
    temperature: mt.temperature,
    novelCreationMethodId: mt.novel_creation_method_id
      ? Number(mt.novel_creation_method_id)
      : null,
    enableAi: mt.enable_ai === 1,
    singleton: mt.singleton === 1,
    builtIn: mt.built_in === 1,
    entityCategory: mt.entity_category,
    createdAt: mt.created_at.toISOString(),
    updatedAt: mt.updated_at?.toISOString() || null,
  }
}

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params

    const moduleTypes = await prisma.module_type.findMany({
      where: { novel_creation_method_id: BigInt(id) },
      orderBy: { created_at: 'asc' },
    })

    return apiSuccess(moduleTypes.map(serializeModuleType))
  } catch (error) {
    return apiError(500, '获取模块类型列表失败')
  }
}
