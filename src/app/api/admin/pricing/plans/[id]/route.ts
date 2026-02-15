import { NextRequest } from 'next/server'
import { apiSuccess, apiError, apiNotFound } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { serialize } from '@/lib/serialize'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { id } = await params

    const plan = await prisma.subscription_plans.findUnique({
      where: { id: BigInt(id) },
    })

    if (!plan) {
      return apiNotFound('套餐不存在')
    }

    return apiSuccess(serialize(plan))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取套餐详情失败: ${String(error)}`)
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

    const existing = await prisma.subscription_plans.findUnique({
      where: { id: BigInt(id) },
    })
    if (!existing) {
      return apiNotFound('套餐不存在')
    }

    const {
      display_name,
      price,
      monthly_credits,
      max_projects,
      descriptions,
      features_i18n,
      is_active,
    } = body as {
      display_name?: string
      price?: number
      monthly_credits?: number
      max_projects?: number
      descriptions?: unknown
      features_i18n?: unknown
      is_active?: boolean
    }

    const updateData: Record<string, unknown> = {}
    if (display_name !== undefined) updateData.display_name = display_name
    if (price !== undefined) updateData.price = price
    if (monthly_credits !== undefined) updateData.monthly_credits = BigInt(monthly_credits)
    if (max_projects !== undefined) updateData.max_projects = BigInt(max_projects)
    if (descriptions !== undefined) updateData.descriptions = descriptions
    if (features_i18n !== undefined) updateData.features_i18n = features_i18n
    if (is_active !== undefined) updateData.is_active = is_active

    const updated = await prisma.subscription_plans.update({
      where: { id: BigInt(id) },
      data: updateData,
    })

    return apiSuccess(serialize(updated))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `更新套餐失败: ${String(error)}`)
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    await getCurrentAdminUser(request)
    const { id } = await params

    const existing = await prisma.subscription_plans.findUnique({
      where: { id: BigInt(id) },
    })
    if (!existing) {
      return apiNotFound('套餐不存在')
    }

    await prisma.subscription_plans.delete({
      where: { id: BigInt(id) },
    })

    return apiSuccess(null, '套餐已删除')
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `删除套餐失败: ${String(error)}`)
  }
}
