import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params
    const p = await prisma.prompt.findUnique({
      where: { id: BigInt(id) },
    })

    if (!p) {
      return apiNotFound('提示词不存在')
    }

    const sections: string[] = []
    if (p.role) sections.push(`## 角色\n${p.role}`)
    if (p.context) sections.push(`## 背景\n${p.context}`)
    if (p.workflow) sections.push(`## 工作流程\n${p.workflow}`)
    if (p.constraints) sections.push(`## 约束条件\n${p.constraints}`)
    if (p.format) sections.push(`## 输出格式\n${p.format}`)
    if (p.goal) sections.push(`## 目标\n${p.goal}`)
    if (p.positive_example) sections.push(`## 正面示例\n${p.positive_example}`)
    if (p.negative_example) sections.push(`## 反面示例\n${p.negative_example}`)

    const markdown = `# ${p.name}\n\n${sections.join('\n\n')}`

    return apiSuccess(markdown)
  } catch (error) {
    return apiError(500, '获取提示词 Markdown 失败')
  }
}
