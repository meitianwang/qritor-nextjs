import { prisma } from '@/lib/prisma'

// ---------------------------------------------------------------------------
// Credit calculation (based on real model pricing)
// ---------------------------------------------------------------------------

/**
 * Calculate the number of credits consumed for a given token usage.
 *
 * Formula:
 *   credits = ceil( (inputTokens × inputPricePerM + outputTokens × outputPricePerM)
 *                   / 1,000,000 × 200 )
 *
 * 200 = 100 (credits per USD) × 2 (markup for 50% profit margin)
 */
export function calculateCredits(
  inputTokens: number,
  outputTokens: number,
  inputPricePerM: number,
  outputPricePerM: number,
): number {
  const costInUSD =
    (inputTokens * inputPricePerM + outputTokens * outputPricePerM) / 1_000_000

  // 100 credits/USD × 2 markup = 200
  const credits = costInUSD * 200

  return Math.max(1, Math.ceil(credits))
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
  inputPricePerM: number
  outputPricePerM: number
  configId: number | null
}

/**
 * Retrieve the input and output pricing from `llm_config`.
 *
 * If `configId` is supplied the specific row is fetched; otherwise the default
 * enabled configuration is used.
 *
 * Falls back to GLM-4.7 Flash pricing when no matching config is found.
 */
export async function getConfigParams(
  configId?: number,
): Promise<ConfigParams> {
  const fallback: ConfigParams = {
    inputPricePerM: 0.20,
    outputPricePerM: 0.40,
    configId: null,
  }

  try {
    let config: {
      id: bigint
      input_price_per_m: number | null
      output_price_per_m: number | null
    } | null = null

    if (configId !== undefined) {
      config = await prisma.llm_config.findUnique({
        where: { id: BigInt(configId) },
        select: { id: true, input_price_per_m: true, output_price_per_m: true },
      })
    } else {
      config = await prisma.llm_config.findFirst({
        where: { is_default: 1, enabled: 1 },
        select: { id: true, input_price_per_m: true, output_price_per_m: true },
      })
    }

    if (!config) return fallback

    return {
      inputPricePerM: config.input_price_per_m ?? fallback.inputPricePerM,
      outputPricePerM: config.output_price_per_m ?? fallback.outputPricePerM,
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
