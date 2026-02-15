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

  /**
   * Check whether a request identified by `key` is allowed under the given
   * rate limit policy.
   *
   * @param key       - Unique identifier for the client / endpoint combination
   *                    (e.g. `${userId}:POST:/api/orders`).
   * @param limit     - Maximum number of requests allowed within the window.
   * @param windowMs  - Length of the sliding window in milliseconds.
   *
   * @returns An object indicating whether the request is allowed, how many
   *          attempts remain, and when the window resets (epoch ms).
   */
  check(key: string, limit: number, windowMs: number): RateLimitResult {
    const now = Date.now()
    const entry = this.store.get(key)

    // No entry or window has expired -> start a new window
    if (!entry || now >= entry.resetAt) {
      const resetAt = now + windowMs
      this.store.set(key, { count: 1, resetAt })
      return { allowed: true, remaining: limit - 1, resetAt }
    }

    // Within the current window
    if (entry.count < limit) {
      entry.count++
      return { allowed: true, remaining: limit - entry.count, resetAt: entry.resetAt }
    }

    // Limit exceeded
    return { allowed: false, remaining: 0, resetAt: entry.resetAt }
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
