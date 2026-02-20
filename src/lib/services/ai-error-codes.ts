/**
 * AI 生成过程中的结构化错误码。
 *
 * 后端通过 SSE error 事件的 code 字段传递给客户端，
 * 客户端根据 code 展示本地化的用户友好消息。
 */
export const AI_ERROR_CODE = {
  // 认证与权限
  AUTH_EXPIRED: 'AUTH_EXPIRED',
  PROVIDER_AUTH_FAILED: 'PROVIDER_AUTH_FAILED',
  MODEL_TIER_RESTRICTED: 'MODEL_TIER_RESTRICTED',

  // 积分
  INSUFFICIENT_CREDITS: 'INSUFFICIENT_CREDITS',

  // 配置
  NO_LLM_CONFIG: 'NO_LLM_CONFIG',
  MODEL_NOT_FOUND: 'MODEL_NOT_FOUND',

  // 网络与限流
  RATE_LIMITED: 'RATE_LIMITED',
  REQUEST_TIMEOUT: 'REQUEST_TIMEOUT',
  NETWORK_ERROR: 'NETWORK_ERROR',

  // AI Provider 错误
  PROVIDER_SERVER_ERROR: 'PROVIDER_SERVER_ERROR',
  CONTENT_FILTERED: 'CONTENT_FILTERED',
  CONTEXT_LENGTH_EXCEEDED: 'CONTEXT_LENGTH_EXCEEDED',

  // 流式传输
  STREAM_ERROR: 'STREAM_ERROR',

  // 兜底
  UNKNOWN_ERROR: 'UNKNOWN_ERROR',
} as const

export type AIErrorCode = (typeof AI_ERROR_CODE)[keyof typeof AI_ERROR_CODE]

export interface ClassifiedAIError {
  code: AIErrorCode
  message: string
  retryable: boolean
}
