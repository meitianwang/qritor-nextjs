import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { Prisma } from '@/generated/prisma'
import { serialize } from '@/lib/serialize'

export async function GET(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const plans = await prisma.subscription_plans.findMany({
      orderBy: { price: 'asc' },
    })

    return apiSuccess(serialize(plans))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `获取套餐列表失败: ${String(error)}`)
  }
}

export async function POST(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)
    const body = await request.json()
    const {
      name,
      display_name,
      price,
      monthly_credits,
      max_projects,
      descriptions,
      features_i18n,
      is_active,
    } = body as {
      name: string
      display_name: string
      price: number
      monthly_credits: number
      max_projects: number
      descriptions?: unknown
      features_i18n?: unknown
      is_active?: boolean
    }

    if (!name || !display_name || price === undefined) {
      return apiError(400, '缺少必要字段: name, display_name, price')
    }

    const plan = await prisma.subscription_plans.create({
      data: {
        name,
        display_name,
        price,
        monthly_credits: BigInt(monthly_credits || 0),
        max_projects: BigInt(max_projects || 0),
        descriptions: descriptions ?? Prisma.DbNull,
        features_i18n: features_i18n ?? Prisma.DbNull,
        is_active: is_active ?? true,
        created_at: new Date(),
      },
    })

    return apiSuccess(serialize(plan))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `创建套餐失败: ${String(error)}`)
  }
}
