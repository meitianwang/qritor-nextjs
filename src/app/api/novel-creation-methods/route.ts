import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getCurrentUser, getCurrentUserOptional } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError, apiNotFound, apiValidationError } from '@/lib/api-response'
import { users_role } from '@/generated/prisma/client'

function serializeMethod(
  method: {
    id: bigint
    name: string
    description: string | null
    workflow_id: bigint | null
    novel_type: string | null
    language: string | null
    is_preset: number
    user_id: bigint | null
    status: string
    visible_categories: string | null
    created_at: Date
    updated_at: Date | null
  },
  creatorName: string | null,
  canEdit: boolean
) {
  let parsedCategories: string[] | null = null
  if (method.visible_categories) {
    try {
      parsedCategories = JSON.parse(method.visible_categories)
    } catch {
      parsedCategories = null
    }
  }

  return {
    id: Number(method.id),
    name: method.name,
    description: method.description,
    workflowId: method.workflow_id ? Number(method.workflow_id) : null,
    novelType: method.novel_type,
    language: method.language,
    isPreset: method.is_preset === 1,
    userId: method.user_id ? Number(method.user_id) : null,
    status: method.status,
    creatorName: creatorName,
    canEdit: canEdit,
    visibleCategories: parsedCategories,
    createdAt: method.created_at.toISOString(),
    updatedAt: method.updated_at?.toISOString() || null,
  }
}

export async function GET(request: NextRequest) {
  try {
    const user = await getCurrentUserOptional(request)

    let where = {}
    if (user) {
      where = {
        OR: [
          { is_preset: 1 },
          { user_id: user.id },
          { status: 'published' },
        ],
      }
    } else {
      where = {
        OR: [
          { is_preset: 1 },
          { status: 'published' },
        ],
      }
    }

    const methods = await prisma.novel_creation_method.findMany({
      where,
      orderBy: { created_at: 'desc' },
    })

    const userIds = methods
      .map((m) => m.user_id)
      .filter((id): id is bigint => id !== null)
    const uniqueUserIds = [...new Set(userIds.map((id) => id.toString()))].map(
      (id) => BigInt(id)
    )

    let usersMap: Record<string, string> = {}
    if (uniqueUserIds.length > 0) {
      const users = await prisma.users.findMany({
        where: { id: { in: uniqueUserIds } },
        select: { id: true, nickname: true },
      })
      usersMap = Object.fromEntries(
        users.map((u) => [u.id.toString(), u.nickname])
      )
    }

    const result = methods.map((method) => {
      const creatorName = method.user_id
        ? usersMap[method.user_id.toString()] || null
        : null
      const canEdit =
        user !== null &&
        (user.role === users_role.ADMIN ||
          (method.user_id !== null && method.user_id === user.id))
      return serializeMethod(method, creatorName, canEdit)
    })

    return apiSuccess(result)
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, '获取创作方法列表失败')
  }
}

export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const body = await request.json()
    const { searchParams } = new URL(request.url)
    const templateMethodId = searchParams.get('templateMethodId')

    if (!body.name) {
      return apiValidationError('名称不能为空')
    }

    const result = await prisma.$transaction(async (tx) => {
      if (templateMethodId) {
        const template = await tx.novel_creation_method.findUnique({
          where: { id: BigInt(templateMethodId) },
        })
        if (!template) {
          throw new Error('模板创作方法不存在')
        }

        const newMethod = await tx.novel_creation_method.create({
          data: {
            name: body.name || template.name,
            description: body.description ?? template.description,
            novel_type: body.novelType ?? template.novel_type,
            language: body.language ?? template.language,
            visible_categories: template.visible_categories,
            is_preset: 0,
            user_id: user.id,
            status: 'draft',
            created_at: new Date(),
          },
        })

        // Copy workflows
        const templateWorkflows = await tx.workflow.findMany({
          where: { novel_creation_method_id: template.id },
        })
        const workflowIdMap: Record<string, bigint> = {}
        for (const wf of templateWorkflows) {
          const newWf = await tx.workflow.create({
            data: {
              name: wf.name,
              description: wf.description,
              novel_creation_method_id: newMethod.id,
              nodes_json: wf.nodes_json,
              edges_json: wf.edges_json,
              created_at: new Date(),
            },
          })
          workflowIdMap[wf.id.toString()] = newWf.id
        }

        // Update workflow_id if template had one
        if (template.workflow_id) {
          const newWorkflowId =
            workflowIdMap[template.workflow_id.toString()]
          if (newWorkflowId) {
            await tx.novel_creation_method.update({
              where: { id: newMethod.id },
              data: { workflow_id: newWorkflowId },
            })
          }
        }

        // Copy prompts
        const templatePrompts = await tx.prompt.findMany({
          where: { novel_creation_method_id: template.id },
        })
        const promptIdMap: Record<string, bigint> = {}
        for (const p of templatePrompts) {
          const newP = await tx.prompt.create({
            data: {
              name: p.name,
              role: p.role,
              context: p.context,
              workflow: p.workflow,
              constraints: p.constraints,
              format: p.format,
              goal: p.goal,
              positive_example: p.positive_example,
              negative_example: p.negative_example,
              novel_creation_method_id: newMethod.id,
              built_in: 0,
              created_at: new Date(),
            },
          })
          promptIdMap[p.id.toString()] = newP.id
        }

        // Copy module_types
        const templateModuleTypes = await tx.module_type.findMany({
          where: { novel_creation_method_id: template.id },
        })
        for (const mt of templateModuleTypes) {
          const newPromptId = mt.prompt_id
            ? promptIdMap[mt.prompt_id.toString()] || null
            : null
          const newSaveWorkflowId = mt.save_workflow_id
            ? workflowIdMap[mt.save_workflow_id.toString()] || null
            : null
          const newCreateWorkflowId = mt.create_workflow_id
            ? workflowIdMap[mt.create_workflow_id.toString()] || null
            : null

          await tx.module_type.create({
            data: {
              name: mt.name,
              description: mt.description,
              json_schema: mt.json_schema,
              temperature: mt.temperature,
              prompt_id: newPromptId,
              novel_creation_method_id: newMethod.id,
              save_workflow_id: newSaveWorkflowId,
              create_workflow_id: newCreateWorkflowId,
              enable_ai: mt.enable_ai,
              singleton: mt.singleton,
              built_in: 0,
              ai_context_template: mt.ai_context_template,
              entity_category: mt.entity_category,
              created_at: new Date(),
            },
          })
        }

        // Copy knowledges
        const templateKnowledges = await tx.knowledge.findMany({
          where: { novel_creation_method_id: template.id },
        })
        for (const k of templateKnowledges) {
          await tx.knowledge.create({
            data: {
              name: k.name,
              content: k.content,
              novel_creation_method_id: newMethod.id,
              built_in: 0,
              created_at: new Date(),
            },
          })
        }

        return newMethod
      } else {
        // Create new method with init workflow
        const initWorkflow = await tx.workflow.create({
          data: {
            name: '默认工作流',
            description: '初始化工作流',
            nodes_json: '[]',
            edges_json: '[]',
            created_at: new Date(),
          },
        })

        const newMethod = await tx.novel_creation_method.create({
          data: {
            name: body.name,
            description: body.description || null,
            novel_type: body.novelType || null,
            language: body.language || 'zh',
            visible_categories: body.visibleCategories
              ? JSON.stringify(body.visibleCategories)
              : null,
            is_preset: 0,
            user_id: user.id,
            status: 'draft',
            workflow_id: initWorkflow.id,
            created_at: new Date(),
          },
        })

        // Update workflow's novel_creation_method_id
        await tx.workflow.update({
          where: { id: initWorkflow.id },
          data: { novel_creation_method_id: newMethod.id },
        })

        return newMethod
      }
    })

    const canEdit = true
    return apiSuccess(
      serializeMethod(result, user.nickname, canEdit)
    )
  } catch (error) {
    if (error instanceof Response) return error
    const message =
      error instanceof Error ? error.message : '创建创作方法失败'
    return apiError(500, message)
  }
}
