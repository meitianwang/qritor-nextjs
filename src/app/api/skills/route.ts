import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'

function serializeSkill(skill: {
  id: bigint
  name: string
  description: string
  description_en: string | null
  instructions: string
  instructions_en: string | null
  novel_creation_method_id: bigint | null
  is_active: boolean
  sort_order: number
  created_at: Date
  updated_at: Date | null
}) {
  return {
    id: Number(skill.id),
    name: skill.name,
    description: skill.description,
    description_en: skill.description_en ?? null,
    instructions: skill.instructions,
    instructions_en: skill.instructions_en ?? null,
    novelCreationMethodId: skill.novel_creation_method_id ? Number(skill.novel_creation_method_id) : null,
    isActive: skill.is_active,
    sortOrder: skill.sort_order,
    createdAt: skill.created_at.toISOString(),
    updatedAt: skill.updated_at?.toISOString() || null,
  }
}

export async function GET(request: NextRequest) {
  try {
    await getCurrentUser(request)

    const skills = await prisma.skill.findMany({
      where: { is_active: true },
      orderBy: [{ sort_order: 'asc' }, { name: 'asc' }],
    })

    const result = skills.map((skill) => serializeSkill(skill))

    return apiSuccess(result)
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, '获取技能列表失败')
  }
}
