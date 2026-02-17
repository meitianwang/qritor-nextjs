import { NextRequest } from 'next/server'
import { decodeToken } from '@/lib/auth'
import { prisma } from '@/lib/prisma'
import { apiUnauthorized, apiForbidden } from '@/lib/api-response'
import { users, users_role } from '@/generated/prisma/client'

export async function getCurrentUser(request: NextRequest): Promise<users> {
  const authHeader = request.headers.get('authorization')
  if (!authHeader?.startsWith('Bearer ')) {
    throw apiUnauthorized()
  }

  const token = authHeader.slice(7)
  const payload = await decodeToken(token)
  if (!payload?.sub) {
    throw apiUnauthorized()
  }

  const user = await prisma.users.findUnique({
    where: { id: BigInt(payload.sub) },
  })
  if (!user) {
    throw apiUnauthorized('用户不存在')
  }

  return user
}

export async function getCurrentUserOptional(request: NextRequest): Promise<users | null> {
  const authHeader = request.headers.get('authorization')
  if (!authHeader?.startsWith('Bearer ')) {
    return null
  }

  const token = authHeader.slice(7)
  const payload = await decodeToken(token)
  if (!payload?.sub) {
    return null
  }

  const user = await prisma.users.findUnique({
    where: { id: BigInt(payload.sub) },
  })
  return user
}

export async function getCurrentAdminUser(request: NextRequest): Promise<users> {
  const user = await getCurrentUser(request)
  if (user.role !== users_role.ADMIN) {
    throw apiForbidden('需要管理员权限')
  }
  return user
}
