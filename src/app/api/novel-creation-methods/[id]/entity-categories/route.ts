import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params

    const method = await prisma.novel_creation_method.findUnique({
      where: { id: BigInt(id) },
    })

    if (!method) {
      return apiNotFound('创作方法不存在')
    }

    const moduleTypes = await prisma.module_type.findMany({
      where: { novel_creation_method_id: BigInt(id) },
      select: { entity_category: true },
    })

    const categories = [
      ...new Set(
        moduleTypes
          .map((mt) => mt.entity_category)
          .filter((c): c is string => c !== null)
      ),
    ]

    return apiSuccess(categories)
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, '获取实体类别失败')
  }
}
