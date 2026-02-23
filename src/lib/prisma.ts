import { PrismaClient } from '@/generated/prisma/client'
import { PrismaMariaDb } from '@prisma/adapter-mariadb'

function parseDbUrl(url: string) {
  const u = new URL(url.replace(/^mysql:\/\//, 'http://').replace(/^mariadb:\/\//, 'http://'))
  return {
    host: u.hostname,
    port: parseInt(u.port) || 3306,
    user: decodeURIComponent(u.username),
    password: decodeURIComponent(u.password),
    database: u.pathname.slice(1),
    connectTimeout: 5000,   // 连接超时 5s，避免连接挂起时等待过长
    acquireTimeout: 15000,  // 从池获取连接最多等待 15s
    connectionLimit: 10,
    idleTimeout: 60000,     // 60s 无用连接自动关闭
    minimumIdle: 1,         // 保持至少 1 个空闲连接
  }
}

function createPrismaClient(): PrismaClient {
  const config = parseDbUrl(process.env.DATABASE_URL!)
  const adapter = new PrismaMariaDb(config)
  return new PrismaClient({ adapter })
}

const globalForPrisma = globalThis as unknown as {
  prisma: PrismaClient | undefined
}

export const prisma = globalForPrisma.prisma ?? createPrismaClient()

if (process.env.NODE_ENV !== 'production') globalForPrisma.prisma = prisma
