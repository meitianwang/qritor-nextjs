import { prisma } from '@/lib/prisma'

// ---------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------

/** 积分/美元 × 加价倍率: 100 (credits per USD) × 2 (markup for 50% profit margin) */
const CREDITS_PER_USD = 200

// ---------------------------------------------------------------------------
// Credit calculation (based on real model pricing)
// ---------------------------------------------------------------------------

/**
 * Calculate the number of credits consumed for a given token usage.
 *
 * Formula:
 *   credits = ceil( (inputTokens × inputPricePerM + outputTokens × outputPricePerM)
 *                   / 1,000,000 × 200 )
 */
export function calculateCredits(
  inputTokens: number,
  outputTokens: number,
  inputPricePerM: number,
  outputPricePerM: number,
): number {
  const costInUSD =
    (inputTokens * inputPricePerM + outputTokens * outputPricePerM) / 1_000_000

  const credits = costInUSD * CREDITS_PER_USD

  return Math.max(1, Math.ceil(credits))
}

// ---------------------------------------------------------------------------
// Credits-per-million-token rate (pricing multiplier)
// ---------------------------------------------------------------------------

/**
 * 每 1M token 消耗的积分数。
 *
 * 公式: pricePerM × 200
 */
export function creditsPerMToken(pricePerM: number): number {
  return Math.round(pricePerM * CREDITS_PER_USD)
}

// ---------------------------------------------------------------------------
// Token estimation
// ---------------------------------------------------------------------------

/** Regex matching CJK Unified Ideographs (common Chinese characters). */
const CJK_REGEX = /[\u4e00-\u9fff]/g

/**
 * Estimate the number of tokens for a piece of text.
 *
 * Heuristic (aligned with desktop tokenEstimator):
 * - Chinese characters: ~1 token per 1.5 characters
 * - Other characters (Latin, punctuation, etc.): ~1 token per 4 characters
 */
function estimateTextTokens(text: string): number {
  if (!text) return 0
  const chineseMatches = text.match(CJK_REGEX)
  const chineseCharCount = chineseMatches ? chineseMatches.length : 0
  const otherCharCount = text.length - chineseCharCount

  return Math.round(chineseCharCount / 1.5 + otherCharCount / 4)
}

// ---------------------------------------------------------------------------
// Message-level token estimation (aligned with desktop tokenEstimator)
// ---------------------------------------------------------------------------

/** Per-message structural overhead: role marker, separators, etc. */
const MESSAGE_OVERHEAD_TOKENS = 4

function stringifyUnknown(value: unknown): string {
  if (typeof value === 'string') return value
  if (value == null) return ''
  try {
    return JSON.stringify(value)
  } catch {
    return String(value)
  }
}

/**
 * Estimate tokens for a single AI SDK CoreMessage.
 *
 * Handles all content types:
 * - string content (simple text)
 * - array content with parts: text, reasoning, tool-call, tool-result
 * - tool role messages
 */
// eslint-disable-next-line @typescript-eslint/no-explicit-any
function estimateMessageTokens(msg: any): number {
  let tokens = 0

  if (typeof msg.content === 'string') {
    tokens += estimateTextTokens(msg.content)
  } else if (Array.isArray(msg.content)) {
    for (const part of msg.content) {
      if (part.type === 'text' || part.type === 'reasoning') {
        tokens += estimateTextTokens(part.text ?? '')
      } else if (part.type === 'tool-call') {
        tokens += estimateTextTokens(part.toolName ?? '')
        tokens += estimateTextTokens(stringifyUnknown(part.args ?? part.input))
      } else if (part.type === 'tool-result') {
        tokens += estimateTextTokens(part.toolName ?? '')
        tokens += estimateTextTokens(stringifyUnknown(part.result ?? part.output))
      }
    }
  }

  tokens += MESSAGE_OVERHEAD_TOKENS
  return tokens
}

/**
 * Estimate total tokens for an array of messages.
 */
// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function estimateMessagesTokens(messages: any[]): number {
  let total = 0
  for (const msg of messages) {
    total += estimateMessageTokens(msg)
  }
  return total
}

// ---------------------------------------------------------------------------
// Config lookup
// ---------------------------------------------------------------------------

export interface ConfigParams {
  inputPricePerM: number
  outputPricePerM: number
  configId: number | null
  /** Model tier from llm_config (e.g. 'economy', 'pro', 'max') */
  modelTier?: string
}

/**
 * Retrieve the input and output pricing from `llm_config`.
 *
 * If `configId` is supplied the specific row is fetched; otherwise the default
 * enabled configuration is used.
 *
 * Falls back to GLM-4.7 Flash pricing when no matching config is found.
 */
/**
 * Retrieve pricing by Anthropic model name (e.g. "claude-sonnet-4-6-20250610").
 *
 * Used by the transparent Anthropic proxy to look up billing config without a
 * configId — the proxy only sees the raw Anthropic request body which contains
 * the model string.
 *
 * Falls back to Sonnet pricing when no matching config is found.
 */
export async function getConfigParamsByModelName(
  modelName: string,
): Promise<ConfigParams> {
  // Sonnet pricing as fallback for Anthropic-only proxy
  const fallback: ConfigParams = {
    inputPricePerM: 3.0,
    outputPricePerM: 15.0,
    configId: null,
    modelTier: 'economy',
  }

  try {
    const config = await prisma.llm_config.findFirst({
      where: { model_name: modelName, enabled: 1 },
      select: { id: true, input_price_per_m: true, output_price_per_m: true, model_tier: true },
    })

    if (!config) return fallback

    return {
      inputPricePerM: config.input_price_per_m ?? fallback.inputPricePerM,
      outputPricePerM: config.output_price_per_m ?? fallback.outputPricePerM,
      modelTier: (config as any).model_tier || 'economy',
      configId: Number(config.id),
    }
  } catch {
    return fallback
  }
}

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

