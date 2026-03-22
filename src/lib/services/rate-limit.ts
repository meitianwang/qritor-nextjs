// ---------------------------------------------------------------------------
// In-memory rate limiter
// ---------------------------------------------------------------------------

interface RateLimitEntry {
  count: number
  resetAt: number // epoch ms
}

interface RateLimitResult {
  allowed: boolean
  remaining: number
  resetAt: number // epoch ms
}

class RateLimiter {
  private store: Map<string, RateLimitEntry> = new Map()

  private getActiveEntry(key: string, now: number): RateLimitEntry | null {
    const entry = this.store.get(key)
    if (!entry) return null
    if (now >= entry.resetAt) {
      this.store.delete(key)
      return null
    }
    return entry
  }

  /**
   * Read current rate-limit status without incrementing counters.
   */
  peek(key: string, limit: number, windowMs: number): RateLimitResult {
    const now = Date.now()
    const entry = this.getActiveEntry(key, now)
    if (!entry) {
      return { allowed: true, remaining: limit, resetAt: now + windowMs }
    }
    if (entry.count >= limit) {
      return { allowed: false, remaining: 0, resetAt: entry.resetAt }
    }
    return {
      allowed: true,
      remaining: limit - entry.count,
      resetAt: entry.resetAt,
    }
  }

  /**
   * Increment usage and return the updated rate-limit status.
   */
  consume(key: string, limit: number, windowMs: number): RateLimitResult {
    const now = Date.now()
    const entry = this.getActiveEntry(key, now)

    if (!entry) {
      const resetAt = now + windowMs
      this.store.set(key, { count: 1, resetAt })
      return { allowed: true, remaining: limit - 1, resetAt }
    }

    if (entry.count < limit) {
      entry.count++
      return { allowed: true, remaining: limit - entry.count, resetAt: entry.resetAt }
    }

    return { allowed: false, remaining: 0, resetAt: entry.resetAt }
  }

  /**
   * 检查并消耗一次请求配额（等同于 consume）。
   * 如果只需查询剩余配额而不消耗，请使用 peek()。
   */
  check(key: string, limit: number, windowMs: number): RateLimitResult {
    return this.consume(key, limit, windowMs)
  }

  /**
   * Reset a specific key (e.g. after a successful login verification).
   */
  reset(key: string): void {
    this.store.delete(key)
  }

  /**
   * Periodically prune expired entries to prevent unbounded memory growth.
   * Call this from a setInterval in your server bootstrap if desired.
   */
  cleanup(): void {
    const now = Date.now()
    for (const [key, entry] of this.store) {
      if (now >= entry.resetAt) {
        this.store.delete(key)
      }
    }
  }
}

// ---------------------------------------------------------------------------
// Singleton export
// ---------------------------------------------------------------------------

export const rateLimiter = new RateLimiter()
