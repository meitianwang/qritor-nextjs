import { prisma } from '@/lib/prisma'

// ---------------------------------------------------------------------------
// Credit calculation (based on real model pricing)
// ---------------------------------------------------------------------------

/**
 * Calculate the number of credits consumed for a given token usage.
 *
 * Pricing model: 1 USD = 1000 credits
 *
 * Formula:
 *   credits = (inputTokens × inputPricePerM + outputTokens × outputPricePerM) / 1000
 *
 * Where:
 *   - inputPricePerM: Price per million input tokens in USD
 *   - outputPricePerM: Price per million output tokens in USD
 *
 * @param inputTokens - Number of input (prompt) tokens.
 * @param outputTokens - Number of output (completion) tokens.
 * @param inputPricePerM - Price per million input tokens in USD (e.g., 0.10 for GLM-5).
 * @param outputPricePerM - Price per million output tokens in USD (e.g., 0.40 for GLM-5).
 * @returns The credit cost (minimum 1, rounded up).
 */
export function calculateCredits(
  inputTokens: number,
  outputTokens: number,
  inputPricePerM: number,
  outputPricePerM: number,
): number {
  // Calculate cost in USD
  const costInUSD =
    (inputTokens * inputPricePerM + outputTokens * outputPricePerM) / 1_000_000

  // Convert to credits (1 USD = 1000 credits)
  const credits = costInUSD * 1000

  // Round up and ensure minimum of 1 credit
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
 * Falls back to GLM-5 pricing when no matching config is found:
 *   - inputPricePerM: $0.10/1M tokens
 *   - outputPricePerM: $0.40/1M tokens
 */
export async function getConfigParams(
  configId?: number,
): Promise<ConfigParams> {
  const fallback: ConfigParams = {
    inputPricePerM: 0.1, // GLM-5 input price as fallback
    outputPricePerM: 0.4, // GLM-5 output price as fallback
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
