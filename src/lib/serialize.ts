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
    // Handle Prisma Decimal (decimal.js) — has toNumber() method
    if (typeof (obj as Record<string, unknown>).toNumber === 'function') {
      return Number(obj) as unknown as T
    }
    const result: Record<string, unknown> = {}
    for (const [key, value] of Object.entries(obj as Record<string, unknown>)) {
      result[key] = serialize(value)
    }
    return result as T
  }
  return obj
}

/**
 * Convert snake_case key to camelCase.
 */
function snakeToCamel(str: string): string {
  return str.replace(/_([a-z])/g, (_, c) => c.toUpperCase())
}

/**
 * Recursively serialize Prisma object with snake_case → camelCase key conversion.
 * Also converts BigInt to Number and Date to ISO string.
 */
export function serializeCamel<T>(obj: T): Record<string, unknown>
export function serializeCamel<T>(obj: T[]): Record<string, unknown>[]
export function serializeCamel<T>(obj: T | T[]): Record<string, unknown> | Record<string, unknown>[] {
  if (obj === null || obj === undefined) return obj as unknown as Record<string, unknown>
  if (Array.isArray(obj)) return obj.map(item => serializeCamel(item))
  if (typeof obj !== 'object') return obj as unknown as Record<string, unknown>

  const result: Record<string, unknown> = {}
  for (const [key, value] of Object.entries(obj as Record<string, unknown>)) {
    const camelKey = snakeToCamel(key)
    if (value === null || value === undefined) {
      result[camelKey] = value
    } else if (typeof value === 'bigint') {
      result[camelKey] = Number(value)
    } else if (value instanceof Date) {
      result[camelKey] = value.toISOString()
    } else if (typeof (value as Record<string, unknown>).toNumber === 'function') {
      // Handle Prisma Decimal (decimal.js)
      result[camelKey] = Number(value)
    } else if (Array.isArray(value)) {
      result[camelKey] = value.map(item =>
        typeof item === 'object' && item !== null ? serializeCamel(item) : item
      )
    } else if (typeof value === 'object') {
      result[camelKey] = serializeCamel(value)
    } else {
      result[camelKey] = value
    }
  }
  return result
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
