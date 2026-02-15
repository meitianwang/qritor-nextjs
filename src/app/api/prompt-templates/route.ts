import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentAdminUser } from '@/lib/middleware/auth-middleware'
import { prisma } from '@/lib/prisma'
import { serialize } from '@/lib/serialize'

export async function GET(request: NextRequest) {
  try {
    const url = new URL(request.url)
    const category = url.searchParams.get('category')
    const is_active = url.searchParams.get('is_active')

    const where: Record<string, unknown> = {}
    if (category) where.category = category
    if (is_active !== null && is_active !== '') {
      where.is_active = parseInt(is_active)
    }

    const templates = await prisma.prompt_template.findMany({
      where,
      orderBy: { updated_at: 'desc' },
    })

    return apiSuccess(serialize(templates))
  } catch (error) {
    return apiError(500, `获取提示词模板列表失败: ${String(error)}`)
  }
}

export async function POST(request: NextRequest) {
  try {
    await getCurrentAdminUser(request)
    const body = await request.json()
    const { slug, name, category, content, variables, is_active } = body as {
      slug: string
      name: string
      category?: string
      content: string
      variables?: string
      is_active?: number
    }

    if (!slug || !name || !content) {
      return apiError(400, '缺少必要字段: slug, name, content')
    }

    // Check unique slug
    const existing = await prisma.prompt_template.findUnique({
      where: { slug },
    })
    if (existing) {
      return apiError(409, `slug "${slug}" 已存在`)
    }

    const template = await prisma.prompt_template.create({
      data: {
        slug,
        name,
        category: category ?? '',
        content,
        variables: variables ?? null,
        version: 1,
        is_active: is_active ?? 1,
        created_at: new Date(),
        updated_at: new Date(),
      },
    })

    return apiSuccess(serialize(template))
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `创建提示词模板失败: ${String(error)}`)
  }
}
