import { prisma } from '@/lib/prisma'

// ---------------------------------------------------------------------------
// Credit calculation
// ---------------------------------------------------------------------------

/**
 * Calculate the number of credits consumed for a given token usage.
 *
 * @param inputTokens  - Number of input (prompt) tokens.
 * @param outputTokens - Number of output (completion) tokens.
 * @param normalizationFactor - Model-specific normalization factor (default 1.0).
 * @param creditRate - Credit rate multiplier (default 1.0).
 * @returns The credit cost (minimum 1).
 */
export function calculateCredits(
  inputTokens: number,
  outputTokens: number,
  normalizationFactor = 1.0,
  creditRate = 1.0,
): number {
  const credits =
    (inputTokens + outputTokens) * normalizationFactor * creditRate
  return Math.max(1, Math.round(credits))
}

// ---------------------------------------------------------------------------
// Token estimation
// ---------------------------------------------------------------------------

/** Regex matching CJK Unified Ideographs (common Chinese characters). */
const CJK_REGEX = /[\u4e00-\u9fff]/g

/**
 * Estimate the number of input tokens for a piece of text.
 *
 * Heuristic:
 * - Chinese characters are roughly 1 token per 1.5 characters.
 * - Other characters (Latin, punctuation, etc.) are roughly 1 token per 4 characters.
 *
 * @returns Estimated token count (minimum 1).
 */
export function estimateInputTokens(text: string): number {
  const chineseMatches = text.match(CJK_REGEX)
  const chineseCharCount = chineseMatches ? chineseMatches.length : 0
  const otherCharCount = text.length - chineseCharCount

  const estimated = chineseCharCount / 1.5 + otherCharCount / 4
  return Math.max(1, Math.floor(estimated))
}

// ---------------------------------------------------------------------------
// Config lookup
// ---------------------------------------------------------------------------

interface ConfigParams {
  normalizationFactor: number
  creditRate: number
  configId: number | null
}

/**
 * Retrieve the normalization factor and credit rate from `llm_config`.
 *
 * If `configId` is supplied the specific row is fetched; otherwise the default
 * enabled configuration is used.
 *
 * Falls back to `{ normalizationFactor: 1.0, creditRate: 1.0 }` when no
 * matching config is found.
 */
export async function getConfigParams(
  configId?: number,
): Promise<ConfigParams> {
  const fallback: ConfigParams = {
    normalizationFactor: 1.0,
    creditRate: 1.0,
    configId: null,
  }

  try {
    let config: {
      id: bigint
      normalization_factor: number | null
      credit_rate: number | null
    } | null = null

    if (configId !== undefined) {
      config = await prisma.llm_config.findUnique({
        where: { id: BigInt(configId) },
        select: { id: true, normalization_factor: true, credit_rate: true },
      })
    } else {
      config = await prisma.llm_config.findFirst({
        where: { is_default: 1, enabled: 1 },
        select: { id: true, normalization_factor: true, credit_rate: true },
      })
    }

    if (!config) return fallback

    return {
      normalizationFactor: config.normalization_factor ?? 1.0,
      creditRate: config.credit_rate ?? 1.0,
      configId: Number(config.id),
    }
  } catch {
    return fallback
  }
}

// ---------------------------------------------------------------------------
// Convenience aggregate export
// ---------------------------------------------------------------------------

export const tokenCalculator = {
  calculateCredits,
  estimateInputTokens,
  getConfigParams,
}
