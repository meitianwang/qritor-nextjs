import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiSuccess, apiError } from '@/lib/api-response'
import { prisma } from '@/lib/prisma'
import { serialize } from '@/lib/serialize'

const DEFAULT_SETTINGS = {
  language: 'zh',
  notifyUpdates: true,
}

export async function GET(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)

    const settings = await prisma.user_settings.findFirst({
      where: { user_id: user.id },
    })

    if (!settings) {
      return apiSuccess(DEFAULT_SETTINGS)
    }

    return apiSuccess(serialize({
      language: settings.language ?? DEFAULT_SETTINGS.language,
      notifyUpdates: settings.notify_updates ?? DEFAULT_SETTINGS.notifyUpdates,
    }))
  } catch (e) {
    if (e instanceof Response || (e && typeof e === 'object' && 'status' in e)) {
      return e as Response
    }
    return apiError(500, '获取用户设置失败')
  }
}

export async function PUT(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const body = await request.json()
    const { language, notify_updates } = body

    const now = new Date()
    const updateData: Record<string, unknown> = {
      updated_at: now,
    }

    if (language !== undefined) {
      updateData.language = language
    }

    if (notify_updates !== undefined) {
      updateData.notify_updates = notify_updates
    }

    const settings = await prisma.user_settings.upsert({
      where: { user_id: user.id },
      update: updateData,
      create: {
        user_id: user.id,
        language: language ?? DEFAULT_SETTINGS.language,
        notify_updates: notify_updates ?? DEFAULT_SETTINGS.notifyUpdates,
        created_at: now,
        updated_at: now,
      },
    })

    return apiSuccess(serialize({
      language: settings.language,
      notifyUpdates: settings.notify_updates,
    }))
  } catch (e) {
    if (e instanceof Response || (e && typeof e === 'object' && 'status' in e)) {
      return e as Response
    }
    return apiError(500, '更新用户设置失败')
  }
}
