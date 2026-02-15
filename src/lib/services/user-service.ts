import { prisma } from '@/lib/prisma'
import type { users } from '@/generated/prisma'
import { hashPassword } from './auth-service'

// ---------------------------------------------------------------------------
// Public API
// ---------------------------------------------------------------------------

export async function getById(id: bigint): Promise<users | null> {
  return prisma.users.findUnique({ where: { id } })
}

export async function getByEmail(email: string): Promise<users | null> {
  return prisma.users.findUnique({ where: { email } })
}

export async function create(
  email: string,
  password: string,
  nickname: string,
  avatar?: string,
): Promise<users> {
  const hashed = await hashPassword(password)
  const now = new Date()

  return prisma.users.create({
    data: {
      email,
      password: hashed,
      nickname,
      avatar: avatar ?? null,
      role: 'USER',
      created_at: now,
      updated_at: now,
    },
  })
}
