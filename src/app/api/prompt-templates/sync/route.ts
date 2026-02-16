import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { prisma } from '@/lib/prisma'
import { serialize } from '@/lib/serialize'

export async function GET(request: NextRequest) {
  try {
    const { searchParams } = request.nextUrl
    const since = searchParams.get('since')

    const where: Record<string, unknown> = { is_active: 1 }

    if (since) {
      where.updated_at = { gt: new Date(since) }
    }

    const templates = await prisma.prompt_template.findMany({
      where,
      orderBy: { updated_at: 'desc' },
    })

    return apiSuccess(serialize(templates))
  } catch (error) {
    return apiError(500, `同步提示词模板失败: ${String(error)}`)
  }
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { slugs, updated_after } = body as {
      slugs?: string[]
      updated_after?: string
    }

    const where: Record<string, unknown> = { is_active: 1 }

    if (slugs && slugs.length > 0) {
      where.slug = { in: slugs }
    }

    if (updated_after) {
      where.updated_at = { gt: new Date(updated_after) }
    }

    const templates = await prisma.prompt_template.findMany({
      where,
      orderBy: { updated_at: 'desc' },
    })

    return apiSuccess(serialize(templates))
  } catch (error) {
    return apiError(500, `同步提示词模板失败: ${String(error)}`)
  }
}
