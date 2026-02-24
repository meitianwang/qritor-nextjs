/**
 * LLM 请求完成后的统一积分扣减
 *
 * 所有平台 handler（Anthropic / OpenAI / Google / Vercel）共用。
 */

import {
  calculateCredits,
  getConfigParams,
} from '@/lib/services/token-calculator'
import {
  consumeCreditsWithTransaction,
  recordCreditDebt,
} from '@/lib/services/credit-service'

/**
 * LLM 请求完成后统一积分扣减。
 * 包含扣费失败时自动记入欠费的兜底逻辑。
 */
export async function deductLlmCredits(params: {
  userId: bigint
  configId?: number
  inputTokens: number
  outputTokens: number
  logTag: string
}): Promise<void> {
  const { userId, configId, inputTokens, outputTokens, logTag } = params

  const {
    inputPricePerM: ip,
    outputPricePerM: op,
    configId: cid,
  } = await getConfigParams(configId)
  const credits = calculateCredits(inputTokens, outputTokens, ip, op)

  try {
    const deducted = await consumeCreditsWithTransaction(
      userId,
      credits,
      'DESKTOP_ASSISTANT_LLM',
      cid ? BigInt(cid) : undefined,
      inputTokens,
      outputTokens,
      ip,
      op,
      '桌面端助手对话',
    )
    if (!deducted) {
      console.error(
        `[LLM/${logTag}] Credit deduction failed: user=${userId}, credits=${credits}`,
      )
      await recordCreditDebt(
        userId,
        credits,
        'DESKTOP_ASSISTANT_LLM',
        '桌面端助手扣费失败，已记入欠费',
      )
    }
  } catch (e) {
    console.error('积分扣减失败:', e)
    await recordCreditDebt(
      userId,
      credits,
      'DESKTOP_ASSISTANT_LLM',
      '桌面端助手扣费异常，已记入欠费',
    )
  }
}
