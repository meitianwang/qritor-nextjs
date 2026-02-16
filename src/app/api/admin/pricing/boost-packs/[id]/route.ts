import { NextRequest } from 'next/server'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { serializeCamel } from '@/lib/serialize'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { id } = await params

    const pack = await prisma.boost_packs.findUnique({
      where: { id: BigInt(id) },
    })

    if (!pack) {
      return apiNotFound('加油包不存在')
    }

    return apiSuccess(serializeCamel(pack))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取加油包详情失败: ${String(error)}`)
  }
}

export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { id } = await params
    const body = await request.json()

    const existing = await prisma.boost_packs.findUnique({
      where: { id: BigInt(id) },
    })
    if (!existing) {
      return apiNotFound('加油包不存在')
    }

    const b = body as Record<string, unknown>

    const updateData: Record<string, unknown> = { updated_at: new Date() }
    const dName = b.displayName ?? b.display_name
    if (dName !== undefined) updateData.display_name = dName
    if (b.price !== undefined) updateData.price = b.price
    if (b.credits !== undefined) updateData.credits = BigInt(b.credits as number)
    const vDays = b.validDays ?? b.valid_days
    if (vDays !== undefined) updateData.valid_days = BigInt(vDays as number)
    const sOrder = b.sortOrder ?? b.sort_order
    if (sOrder !== undefined) updateData.sort_order = BigInt(sOrder as number)
    const active = b.isActive ?? b.is_active
    if (active !== undefined) updateData.is_active = active
    const recommended = b.isRecommended ?? b.is_recommended
    if (recommended !== undefined) updateData.is_recommended = recommended
    if (b.description !== undefined) updateData.description = b.description

    const updated = await prisma.boost_packs.update({
      where: { id: BigInt(id) },
      data: updateData,
    })

    return apiSuccess(serializeCamel(updated))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `更新加油包失败: ${String(error)}`)
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { id } = await params

    const existing = await prisma.boost_packs.findUnique({
      where: { id: BigInt(id) },
    })
    if (!existing) {
      return apiNotFound('加油包不存在')
    }

    await prisma.boost_packs.delete({
      where: { id: BigInt(id) },
    })

    return apiSuccess(null, '加油包已删除')
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `删除加油包失败: ${String(error)}`)
  }
}
