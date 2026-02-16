import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { serializeCamel } from '@/lib/serialize'

export async function GET(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const packs = await prisma.boost_packs.findMany({
      orderBy: { sort_order: 'asc' },
    })

    return apiSuccess(serializeCamel(packs))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取加油包列表失败: ${String(error)}`)
  }
}
