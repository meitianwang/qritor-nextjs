/**
 * Recursively convert BigInt values to Number for JSON serialization.
 * Prisma returns BigInt for MySQL BIGINT columns, which can't be JSON.stringify'd.
 */
export function serialize<T>(obj: T): T {
  if (obj === null || obj === undefined) return obj
  if (typeof obj === 'bigint') return Number(obj) as unknown as T
  if (obj instanceof Date) return obj.toISOString() as unknown as T
  if (Array.isArray(obj)) return obj.map(serialize) as unknown as T
  if (typeof obj === 'object') {
    const result: Record<string, unknown> = {}
    for (const [key, value] of Object.entries(obj as Record<string, unknown>)) {
      result[key] = serialize(value)
    }
    return result as T
  }
  return obj
}

/**
 * Convert a Prisma user record to a safe JSON-serializable format.
 */
export function serializeUser(user: {
  id: bigint
  nickname: string
  email: string
  avatar: string | null
  role: string
  created_at: Date
  last_login_at: Date | null
}) {
  return {
    id: Number(user.id),
    nickname: user.nickname,
    email: user.email,
    avatar: user.avatar,
    role: user.role,
    createdAt: user.created_at.toISOString(),
    lastLoginAt: user.last_login_at?.toISOString() || null,
  }
}
