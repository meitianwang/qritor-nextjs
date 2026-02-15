import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError, apiValidationError } from '@/lib/api-response'

function serializeModuleType(mt: any) {
  return {
    id: Number(mt.id),
    name: mt.name,
    description: mt.description,
    jsonSchema: mt.json_schema,
    temperature: mt.temperature,
    promptId: mt.prompt_id ? Number(mt.prompt_id) : null,
    novelCreationMethodId: mt.novel_creation_method_id
      ? Number(mt.novel_creation_method_id)
      : null,
    saveWorkflowId: mt.save_workflow_id ? Number(mt.save_workflow_id) : null,
    createWorkflowId: mt.create_workflow_id
      ? Number(mt.create_workflow_id)
      : null,
    enableAi: mt.enable_ai === 1,
    singleton: mt.singleton === 1,
    builtIn: mt.built_in === 1,
    aiContextTemplate: mt.ai_context_template,
    entityCategory: mt.entity_category,
    createdAt: mt.created_at.toISOString(),
    updatedAt: mt.updated_at?.toISOString() || null,
  }
}

export async function GET() {
  try {
    const moduleTypes = await prisma.module_type.findMany({
      orderBy: { created_at: 'desc' },
    })

    return apiSuccess(moduleTypes.map(serializeModuleType))
  } catch (error) {
    return apiError(500, '获取模块类型列表失败')
  }
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()

    if (!body.name) {
      return apiValidationError('名称不能为空')
    }

    const moduleType = await prisma.module_type.create({
      data: {
        name: body.name,
        description: body.description || null,
        json_schema: body.jsonSchema || null,
        temperature: body.temperature ?? null,
        prompt_id: body.promptId ? BigInt(body.promptId) : null,
        novel_creation_method_id: body.novelCreationMethodId
          ? BigInt(body.novelCreationMethodId)
          : null,
        save_workflow_id: body.saveWorkflowId
          ? BigInt(body.saveWorkflowId)
          : null,
        create_workflow_id: body.createWorkflowId
          ? BigInt(body.createWorkflowId)
          : null,
        enable_ai: body.enableAi ? 1 : 0,
        singleton: body.singleton ? 1 : 0,
        built_in: body.builtIn ? 1 : 0,
        ai_context_template: body.aiContextTemplate || null,
        entity_category: body.entityCategory || null,
        created_at: new Date(),
      },
    })

    return apiSuccess(serializeModuleType(moduleType))
  } catch (error) {
    return apiError(500, '创建模块类型失败')
  }
}
