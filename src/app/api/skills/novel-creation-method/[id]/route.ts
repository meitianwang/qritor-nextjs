import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'

function serializeSkill(skill: {
  id: bigint
  name: string
  description: string
  instructions: string
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
    instructions: skill.instructions,
    novelCreationMethodId: skill.novel_creation_method_id ? Number(skill.novel_creation_method_id) : null,
    isActive: skill.is_active,
    sortOrder: skill.sort_order,
    createdAt: skill.created_at.toISOString(),
    updatedAt: skill.updated_at?.toISOString() || null,
  }
}

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    await getCurrentUser(request)
    const { id } = await params
    const skills = await prisma.skill.findMany({
      where: {
        is_active: true,
        OR: [
          { novel_creation_method_id: BigInt(id) },
          { novel_creation_method_id: null },
        ],
      },
      orderBy: [{ sort_order: 'asc' }, { name: 'asc' }],
    })

    return apiSuccess(skills.map(serializeSkill))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, '获取创作方法技能列表失败')
  }
}
