import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { Prisma } from '@/generated/prisma/client'
import { serializeCamel } from '@/lib/serialize'

export async function GET(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)

    const plans = await prisma.subscription_plans.findMany({
      orderBy: { price: 'asc' },
    })

    return apiSuccess(serializeCamel(plans))
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
      displayName, display_name,
      price,
      monthlyCredits, monthly_credits,
      maxProjects, max_projects,
      descriptions,
      featuresI18n, features_i18n,
      isActive, is_active,
    } = body as Record<string, unknown>

    const dName = (displayName || display_name) as string
    const mCredits = (monthlyCredits || monthly_credits || 0) as number
    const mProjects = (maxProjects || max_projects || 0) as number
    const fI18n = featuresI18n || features_i18n
    const active = isActive ?? is_active ?? true

    if (!name || !dName || price === undefined) {
      return apiError(400, '缺少必要字段: name, displayName, price')
    }

    const plan = await prisma.subscription_plans.create({
      data: {
        name: name as string,
        display_name: dName,
        price: price as number,
        monthly_credits: BigInt(mCredits),
        max_projects: BigInt(mProjects),
        descriptions: descriptions ?? Prisma.DbNull,
        features_i18n: fI18n ?? Prisma.DbNull,
        is_active: active as boolean,
        created_at: new Date(),
      },
    })

    return apiSuccess(serializeCamel(plan))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `创建套餐失败: ${String(error)}`)
  }
}
