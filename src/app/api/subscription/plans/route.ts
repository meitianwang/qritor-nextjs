import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getAllPlans } from '@/lib/services/subscription-service'

export async function GET(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url)
    const lang = searchParams.get('lang') ?? 'zh'

    const plans = await getAllPlans(lang)
    return apiSuccess(plans)
  } catch (e) {
    console.error('获取订阅计划失败:', e)
    return apiError(500, '获取订阅计划失败')
  }
}
