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

    const plan = await prisma.subscription_plans.findUnique({
      where: { id: BigInt(id) },
    })

    if (!plan) {
      return apiNotFound('套餐不存在')
    }

    return apiSuccess(serializeCamel(plan))
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

    const b = body as Record<string, unknown>

    const updateData: Record<string, unknown> = {}
    const dName = b.displayName ?? b.display_name
    if (dName !== undefined) updateData.display_name = dName
    if (b.price !== undefined) updateData.price = b.price
    const mCredits = b.monthlyCredits ?? b.monthly_credits
    if (mCredits !== undefined) updateData.monthly_credits = BigInt(mCredits as number)
    const mProjects = b.maxProjects ?? b.max_projects
    if (mProjects !== undefined) updateData.max_projects = BigInt(mProjects as number)
    if (b.descriptions !== undefined) updateData.descriptions = b.descriptions
    const fI18n = b.featuresI18n ?? b.features_i18n
    if (fI18n !== undefined) updateData.features_i18n = fI18n
    const active = b.isActive ?? b.is_active
    if (active !== undefined) updateData.is_active = active

    const updated = await prisma.subscription_plans.update({
      where: { id: BigInt(id) },
      data: updateData,
    })

    return apiSuccess(serializeCamel(updated))
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
