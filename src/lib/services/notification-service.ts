import { prisma } from '@/lib/prisma'
import { Prisma } from '@/generated/prisma/client'

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

interface NotifiableUser {
  id: number
  email: string
  nickname: string
}

interface SendResult {
  total: number
  success: number
  failed: number
  errors: string[]
}

// ---------------------------------------------------------------------------
// Public API
// ---------------------------------------------------------------------------

/**
 * Get all users who have notifications enabled.
 *
 * Users without a user_settings record default to notify_updates = true.
 * Uses a raw query to perform a LEFT JOIN between users and user_settings.
 */
export async function getUsersWithNotificationsEnabled(): Promise<
  NotifiableUser[]
> {
  const rows = await prisma.$queryRaw<
    Array<{
      id: bigint
      email: string
      nickname: string
      notify_updates: boolean | null
    }>
  >(
    Prisma.sql`
      SELECT u.id, u.email, u.nickname, us.notify_updates
      FROM users u
      LEFT JOIN user_settings us ON u.id = us.user_id
    `,
  )

  const users: NotifiableUser[] = []
  for (const row of rows) {
    // Default to true when no settings record exists (null)
    const notifyEnabled = row.notify_updates !== null ? row.notify_updates : true
    if (notifyEnabled) {
      users.push({
        id: Number(row.id),
        email: row.email,
        nickname: row.nickname,
      })
    }
  }

  return users
}

/**
 * Send a notification email to all users with notifications enabled.
 *
 * This is a stub that iterates through eligible users and calls a send
 * function. Integrate your email service (e.g. Resend, SES, Nodemailer)
 * by implementing `sendNotificationEmail`.
 */
export async function sendNotificationToAll(
  subject: string,
  content: string,
): Promise<SendResult> {
  const users = await getUsersWithNotificationsEnabled()

  let success = 0
  let failed = 0
  const errors: string[] = []

  for (const user of users) {
    try {
      const ok = await sendNotificationEmail(user.email, subject, content)
      if (ok) {
        success++
      } else {
        failed++
        errors.push(`Failed to send to ${user.email}`)
      }
    } catch (err) {
      failed++
      const msg = `Error sending to ${user.email}: ${err instanceof Error ? err.message : String(err)}`
      errors.push(msg)
    }
  }

  return {
    total: users.length,
    success,
    failed,
    errors: errors.slice(0, 10), // Return at most 10 errors
  }
}

// ---------------------------------------------------------------------------
// Email sending stub
// ---------------------------------------------------------------------------

/**
 * Send a single notification email. Replace with your actual email service.
 */
async function sendNotificationEmail(
  _toEmail: string,
  _subject: string,
  _content: string,
): Promise<boolean> {
  // TODO: integrate with Resend / SES / Nodemailer
  console.warn('sendNotificationEmail is not implemented yet')
  return false
}
