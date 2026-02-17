import * as crypto from 'crypto'
import { hash, compare } from 'bcryptjs'
import { prisma } from '@/lib/prisma'

// ---------------------------------------------------------------------------
// Password helpers
// ---------------------------------------------------------------------------

export async function hashPassword(plain: string): Promise<string> {
  return hash(plain, 10)
}

export async function verifyPassword(
  plain: string,
  hashed: string,
): Promise<boolean> {
  return compare(plain, hashed)
}

// ---------------------------------------------------------------------------
// Verification Code Service (in-memory)
// ---------------------------------------------------------------------------

interface StoredCode {
  code: string
  expiresAt: number // epoch ms
  createdAt: number // epoch ms
}

const CODE_EXPIRE_MS = 5 * 60 * 1000 // 5 minutes
const RESEND_COOLDOWN_MS = 60 * 1000 // 60 seconds

class VerificationCodeService {
  private codes: Map<string, StoredCode> = new Map()

  /**
   * Generate a 6-digit verification code for the given key (e.g. email).
   * Returns the code string, or `null` if within the resend cooldown.
   */
  generate(key: string): string | null {
    const existing = this.codes.get(key)
    if (existing) {
      const elapsed = Date.now() - existing.createdAt
      if (elapsed < RESEND_COOLDOWN_MS) {
        return null // cooldown not yet passed
      }
    }

    const code = String(
      crypto.randomInt(100000, 1000000), // [100000, 999999]
    )

    this.codes.set(key, {
      code,
      expiresAt: Date.now() + CODE_EXPIRE_MS,
      createdAt: Date.now(),
    })

    return code
  }

  /**
   * Validate a code for the given key. Consumes the code on success.
   */
  validate(key: string, code: string): boolean {
    const stored = this.codes.get(key)
    if (!stored) return false
    if (Date.now() > stored.expiresAt) {
      this.codes.delete(key)
      return false
    }
    if (stored.code !== code) return false

    // consume the code
    this.codes.delete(key)
    return true
  }

  /**
   * Return the number of seconds remaining in the resend cooldown, or 0 if
   * a new code can be sent immediately.
   */
  cooldownRemaining(key: string): number {
    const stored = this.codes.get(key)
    if (!stored) return 0
    const elapsed = Date.now() - stored.createdAt
    if (elapsed >= RESEND_COOLDOWN_MS) return 0
    return Math.ceil((RESEND_COOLDOWN_MS - elapsed) / 1000)
  }
}

// ---------------------------------------------------------------------------
// Refresh Token Service (Prisma-backed)
// ---------------------------------------------------------------------------

const REFRESH_TOKEN_EXPIRE_DAYS = parseInt(
  process.env.REFRESH_TOKEN_EXPIRE_DAYS || '7',
  10,
)

function hashToken(raw: string): string {
  return crypto.createHash('sha256').update(raw).digest('hex')
}

interface CreateTokenResult {
  rawToken: string
  familyId: string
  expiresAt: Date
}

interface RotateTokenResult {
  rawToken: string
  familyId: string
  expiresAt: Date
  userId: bigint
}

class RefreshTokenService {
  /**
   * Create a brand-new refresh token (e.g. at login).
   */
  async createToken(userId: bigint): Promise<CreateTokenResult> {
    const rawToken = crypto.randomBytes(32).toString('base64url')
    const tokenHash = hashToken(rawToken)
    const familyId = crypto.randomUUID()
    const now = new Date()
    const expiresAt = new Date(
      now.getTime() + REFRESH_TOKEN_EXPIRE_DAYS * 24 * 60 * 60 * 1000,
    )

    await prisma.refresh_tokens.create({
      data: {
        user_id: userId,
        token_hash: tokenHash,
        family_id: familyId,
        is_revoked: false,
        expires_at: expiresAt,
        created_at: now,
      },
    })

    return { rawToken, familyId, expiresAt }
  }

  /**
   * Validate an existing refresh token and rotate it (revoke old, issue new).
   * Returns `null` if the token is invalid, expired, or already revoked.
   *
   * If a revoked token from the same family is presented (replay attack),
   * the entire family is revoked.
   */
  async validateAndRotate(
    rawToken: string,
  ): Promise<RotateTokenResult | null> {
    const tokenHash = hashToken(rawToken)

    const existing = await prisma.refresh_tokens.findUnique({
      where: { token_hash: tokenHash },
    })

    if (!existing) return null

    // Replay detection: if the token was already revoked, revoke entire family
    if (existing.is_revoked) {
      await this.revokeFamily(existing.family_id)
      return null
    }

    // Check expiry
    if (new Date() > existing.expires_at) {
      await prisma.refresh_tokens.update({
        where: { id: existing.id },
        data: { is_revoked: true, revoked_at: new Date() },
      })
      return null
    }

    // Revoke the old token
    await prisma.refresh_tokens.update({
      where: { id: existing.id },
      data: { is_revoked: true, revoked_at: new Date() },
    })

    // Issue a new token in the same family
    const newRawToken = crypto.randomBytes(32).toString('base64url')
    const newTokenHash = hashToken(newRawToken)
    const now = new Date()
    const expiresAt = new Date(
      now.getTime() + REFRESH_TOKEN_EXPIRE_DAYS * 24 * 60 * 60 * 1000,
    )

    await prisma.refresh_tokens.create({
      data: {
        user_id: existing.user_id,
        token_hash: newTokenHash,
        family_id: existing.family_id,
        is_revoked: false,
        expires_at: expiresAt,
        created_at: now,
      },
    })

    return {
      rawToken: newRawToken,
      familyId: existing.family_id,
      expiresAt,
      userId: existing.user_id,
    }
  }

  /**
   * Revoke all refresh tokens belonging to a given family.
   */
  async revokeFamily(familyId: string): Promise<void> {
    await prisma.refresh_tokens.updateMany({
      where: { family_id: familyId, is_revoked: false },
      data: { is_revoked: true, revoked_at: new Date() },
    })
  }

  /**
   * Delete expired tokens and old revoked tokens (older than 7 days).
   * Intended to be called periodically (e.g. cron job).
   */
  async cleanupExpiredTokens(): Promise<number> {
    const now = new Date()
    const revokedCutoff = new Date(
      now.getTime() - 7 * 24 * 60 * 60 * 1000,
    )

    const result = await prisma.refresh_tokens.deleteMany({
      where: {
        OR: [
          { expires_at: { lt: now } },
          { is_revoked: true, revoked_at: { lt: revokedCutoff } },
        ],
      },
    })

    return result.count
  }

  /**
   * Revoke all tokens in the family of the provided raw refresh token.
   * Used by explicit logout flows (web and desktop).
   */
  async revokeByRawToken(rawToken: string): Promise<void> {
    const tokenHash = hashToken(rawToken)
    const existing = await prisma.refresh_tokens.findUnique({
      where: { token_hash: tokenHash },
      select: { family_id: true },
    })

    if (!existing) return
    await this.revokeFamily(existing.family_id)
  }
}

// ---------------------------------------------------------------------------
// Singleton export
// ---------------------------------------------------------------------------

export const authService = {
  verificationCode: new VerificationCodeService(),
  refreshToken: new RefreshTokenService(),
}
