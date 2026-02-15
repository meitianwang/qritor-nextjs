import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError, apiValidationError } from '@/lib/api-response'

export async function GET(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url)
    const novelCreationMethodId = searchParams.get('novelCreationMethodId')

    if (!novelCreationMethodId) {
      return apiValidationError('novelCreationMethodId 参数必填')
    }

    const moduleTypes = await prisma.module_type.findMany({
      where: { novel_creation_method_id: BigInt(novelCreationMethodId) },
    })

    const moduleTypeOptions = moduleTypes.map((mt) => ({
      value: String(mt.id),
      label: mt.name,
    }))

    const moduleTypeNameOptions = moduleTypes.map((mt) => ({
      value: mt.name,
      label: mt.name,
    }))

    const llmConfigs = await prisma.llm_config.findMany()
    const llmOptions = llmConfigs.map((c) => ({
      value: String(c.id),
      label: c.model_name,
    }))

    const actions = [
      {
        action: 'CREATE_MODULE',
        title: '创建模块',
        description: '创建一个新的模块',
        parameters: [
          {
            name: 'moduleTypeId',
            label: '模块类型',
            type: 'select',
            required: true,
            defaultValue: null,
            options: moduleTypeOptions,
          },
        ],
      },
      {
        action: 'KG_UPDATE',
        title: '更新知识图谱',
        description: '利用AI提取信息更新知识图谱',
        parameters: [
          {
            name: 'extractionType',
            label: '提取类型',
            type: 'select',
            required: true,
            defaultValue: 'RELATION',
            options: [
              { value: 'RELATION', label: '关系提取' },
              { value: 'DYNAMIC_INFO', label: '动态信息提取' },
            ],
          },
          {
            name: 'llmConfigId',
            label: 'LLM配置',
            type: 'select',
            required: true,
            defaultValue: null,
            options: llmOptions,
          },
          {
            name: 'promptName',
            label: 'Prompt名称',
            type: 'text',
            required: false,
            defaultValue: null,
            options: null,
          },
        ],
      },
      {
        action: 'BATCH_CREATE',
        title: '批量创建',
        description: '根据数量字段批量创建子模块',
        parameters: [
          {
            name: 'countField',
            label: '数量字段',
            type: 'text',
            required: true,
            defaultValue: null,
            options: null,
          },
          {
            name: 'targetModuleTypeId',
            label: '目标模块类型',
            type: 'select',
            required: true,
            defaultValue: null,
            options: moduleTypeOptions,
          },
          {
            name: 'namePrefix',
            label: '名称前缀',
            type: 'text',
            required: false,
            defaultValue: null,
            options: null,
          },
        ],
      },
      {
        action: 'BUILD_MODULE_TITLE',
        title: '构造模块标题',
        description: '根据模板规则使用字段值构造模块标题',
        parameters: [
          {
            name: 'titleTemplate',
            label: '标题模板',
            type: 'text',
            required: true,
            defaultValue: null,
            options: null,
          },
        ],
      },
      {
        action: 'AUTO_UPDATE_CHAPTER_ENTITIES',
        title: '自动关联章节实体',
        description: '根据正文自动更新章节实体列表',
        parameters: [],
      },
    ]

    return apiSuccess(actions)
  } catch (error) {
    return apiError(500, '获取节点操作列表失败')
  }
}
