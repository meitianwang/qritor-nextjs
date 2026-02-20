import {
  APICallError,
  LoadAPIKeyError,
  NoContentGeneratedError,
} from '@ai-sdk/provider'
import { RetryError } from 'ai'
import { AI_ERROR_CODE, type ClassifiedAIError } from './ai-error-codes'

/**
 * 将 AI SDK 抛出的错误分类为结构化错误码。
 *
 * 优先通过 AI SDK 提供的 isInstance 方法精确识别错误类型，
 * 再按 HTTP 状态码和错误消息做细分。
 */
export function classifyAIError(error: unknown): ClassifiedAIError {
  // Vercel AI SDK: API 调用错误（含 HTTP 状态码）
  if (APICallError.isInstance(error)) {
    return classifyAPICallError(error as APICallError)
  }

  // Vercel AI SDK: API Key 未配置或为空
  if (LoadAPIKeyError.isInstance(error)) {
    return {
      code: AI_ERROR_CODE.PROVIDER_AUTH_FAILED,
      message: 'AI provider API key not configured',
      retryable: false,
    }
  }

  // Vercel AI SDK: 模型未返回任何内容
  if (NoContentGeneratedError.isInstance(error)) {
    return {
      code: AI_ERROR_CODE.PROVIDER_SERVER_ERROR,
      message: 'AI provider returned empty response',
      retryable: true,
    }
  }

  // Vercel AI SDK: 重试耗尽
  if (RetryError.isInstance(error)) {
    const retryErr = error as RetryError
    const lastError = retryErr.lastError ?? retryErr.cause
    if (lastError && lastError !== error) {
      return classifyAIError(lastError)
    }
    return {
      code: AI_ERROR_CODE.PROVIDER_SERVER_ERROR,
      message: 'All retry attempts failed',
      retryable: true,
    }
  }

  // 标准 Error
  if (error instanceof Error) {
    if (error.name === 'AbortError') {
      return {
        code: AI_ERROR_CODE.STREAM_ERROR,
        message: 'Request aborted',
        retryable: false,
      }
    }

    const msg = error.message.toLowerCase()

    if (
      msg.includes('timeout') ||
      msg.includes('timed out') ||
      error.name === 'TimeoutError'
    ) {
      return {
        code: AI_ERROR_CODE.REQUEST_TIMEOUT,
        message: 'Request timed out',
        retryable: true,
      }
    }

    if (
      msg.includes('fetch failed') ||
      msg.includes('econnrefused') ||
      msg.includes('econnreset') ||
      msg.includes('enotfound')
    ) {
      return {
        code: AI_ERROR_CODE.NETWORK_ERROR,
        message: 'Network connection failed',
        retryable: true,
      }
    }
  }

  return {
    code: AI_ERROR_CODE.UNKNOWN_ERROR,
    message: String(error),
    retryable: false,
  }
}

function classifyAPICallError(error: APICallError): ClassifiedAIError {
  const status = error.statusCode
  const body = (error.responseBody ?? '').toLowerCase()

  // 401: provider 认证失败
  if (status === 401) {
    return {
      code: AI_ERROR_CODE.PROVIDER_AUTH_FAILED,
      message: `AI provider authentication failed (${status})`,
      retryable: false,
    }
  }

  // 403: 可能是内容过滤或 provider 权限
  if (status === 403) {
    if (hasContentFilterKeywords(body)) {
      return {
        code: AI_ERROR_CODE.CONTENT_FILTERED,
        message: 'Content was filtered by safety policy',
        retryable: false,
      }
    }
    return {
      code: AI_ERROR_CODE.PROVIDER_AUTH_FAILED,
      message: `AI provider access denied (${status})`,
      retryable: false,
    }
  }

  // 429: 限流
  if (status === 429) {
    return {
      code: AI_ERROR_CODE.RATE_LIMITED,
      message: 'Rate limited by AI provider',
      retryable: true,
    }
  }

  // 超时类状态码
  if (status === 408 || status === 504 || status === 524) {
    return {
      code: AI_ERROR_CODE.REQUEST_TIMEOUT,
      message: `Request timeout (${status})`,
      retryable: true,
    }
  }

  // 上下文长度超限（常见于 400 响应体）
  if (hasContextLengthKeywords(body)) {
    return {
      code: AI_ERROR_CODE.CONTEXT_LENGTH_EXCEEDED,
      message: 'Context length exceeded',
      retryable: false,
    }
  }

  // 内容过滤（响应体关键词）
  if (hasContentFilterKeywords(body)) {
    return {
      code: AI_ERROR_CODE.CONTENT_FILTERED,
      message: 'Content was filtered by safety policy',
      retryable: false,
    }
  }

  // 5xx: provider 服务器错误
  if (status && status >= 500) {
    return {
      code: AI_ERROR_CODE.PROVIDER_SERVER_ERROR,
      message: `AI provider server error (${status})`,
      retryable: true,
    }
  }

  return {
    code: AI_ERROR_CODE.STREAM_ERROR,
    message: error.message,
    retryable: error.isRetryable ?? false,
  }
}

function hasContextLengthKeywords(text: string): boolean {
  return (
    text.includes('context_length') ||
    text.includes('context length') ||
    text.includes('maximum context') ||
    (text.includes('too long') && text.includes('token'))
  )
}

function hasContentFilterKeywords(text: string): boolean {
  return (
    (text.includes('content') || text.includes('output')) &&
    (text.includes('filter') ||
      text.includes('policy') ||
      text.includes('safety') ||
      text.includes('blocked'))
  )
}
