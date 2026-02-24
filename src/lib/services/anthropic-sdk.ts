import Anthropic from '@anthropic-ai/sdk'
import type {
  MessageParam,
  ContentBlockParam,
  TextBlockParam,
  ThinkingBlockParam,
  ToolUseBlockParam,
  ToolResultBlockParam,
  Tool,
  RawMessageStreamEvent,
  ThinkingConfigParam,
  Usage,
} from '@anthropic-ai/sdk/resources/messages/messages'
import { AI_ERROR_CODE, type ClassifiedAIError } from './ai-error-codes'

// ---------------------------------------------------------------------------
// Client singleton
// ---------------------------------------------------------------------------

// @anthropic-ai/sdk 会自动追加 /v1/messages，
// 而 ANTHROPIC_BASE_URL 可能已经带有 /v1 后缀（给 @ai-sdk/anthropic 用的），
// 这里需要去掉末尾的 /v1 避免路径重复变成 /v1/v1/messages
function stripTrailingV1(url: string | undefined): string | undefined {
  if (!url) return undefined
  return url.replace(/\/v1\/?$/, '')
}

const anthropicClient = new Anthropic({
  apiKey: process.env.ANTHROPIC_API_KEY ?? '',
  baseURL: stripTrailingV1(process.env.ANTHROPIC_BASE_URL),
})

// ---------------------------------------------------------------------------
// Internal stream event types (与 google-genai.ts 对称)
// ---------------------------------------------------------------------------

export interface AnthropicTextDelta {
  type: 'text-delta'
  text: string
}

export interface AnthropicReasoningDelta {
  type: 'reasoning-delta'
  text: string
  signature?: string
}

export interface AnthropicToolCall {
  type: 'tool-call'
  toolCallId: string
  toolName: string
  args: Record<string, unknown>
}

export interface AnthropicFinish {
  type: 'finish'
  finishReason: string
  usage: {
    inputTokens: number
    outputTokens: number
    reasoningTokens: number
  }
}

export interface AnthropicStreamError {
  type: 'error'
  error: unknown
}

export type AnthropicStreamEvent =
  | AnthropicTextDelta
  | AnthropicReasoningDelta
  | AnthropicToolCall
  | AnthropicFinish
  | AnthropicStreamError

// ---------------------------------------------------------------------------
// Message format converter: AI SDK CoreMessage[] -> Anthropic MessageParam[]
// ---------------------------------------------------------------------------

interface ConvertResult {
  messages: MessageParam[]
  systemBlocks: TextBlockParam[]
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function convertMessagesToAnthropicFormat(messages: any[]): ConvertResult {
  const systemBlocks: TextBlockParam[] = []
  const anthropicMessages: MessageParam[] = []

  for (const msg of messages) {
    if (msg.role === 'system') {
      const text = typeof msg.content === 'string'
        ? msg.content
        : msg.content?.map((p: { text?: string }) => p.text ?? '').join('\n')
      if (text) {
        systemBlocks.push({ type: 'text', text })
      }
      continue
    }

    if (msg.role === 'tool') {
      // AI SDK tool role -> Anthropic user role with tool_result content blocks
      const blocks = convertToolResultMessage(msg.content)
      // Merge into last user message or create new one
      const last = anthropicMessages[anthropicMessages.length - 1]
      if (last?.role === 'user' && Array.isArray(last.content)) {
        last.content = [...last.content, ...blocks]
      } else {
        anthropicMessages.push({ role: 'user', content: blocks })
      }
      continue
    }

    const role = msg.role === 'assistant' ? 'assistant' as const : 'user' as const
    const content = convertContentToAnthropicBlocks(msg.content, role)
    anthropicMessages.push({ role, content })
  }

  return { messages: anthropicMessages, systemBlocks }
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function convertContentToAnthropicBlocks(content: any, role: 'user' | 'assistant'): ContentBlockParam[] {
  if (typeof content === 'string') {
    return content ? [{ type: 'text', text: content }] : [{ type: 'text', text: ' ' }]
  }
  if (!Array.isArray(content)) return [{ type: 'text', text: ' ' }]

  const blocks: ContentBlockParam[] = []
  for (const part of content) {
    switch (part.type) {
      case 'text':
        if (part.text) {
          blocks.push({ type: 'text', text: part.text })
        }
        break

      case 'reasoning': {
        // AI SDK reasoning -> Anthropic thinking block (only valid in assistant messages)
        if (role === 'assistant' && part.text) {
          const thinkingBlock: ThinkingBlockParam = {
            type: 'thinking',
            thinking: part.text,
            signature: part.signature
              ?? part.providerMetadata?.anthropic?.signature
              ?? '',
          }
          blocks.push(thinkingBlock)
        }
        break
      }

      case 'tool-call': {
        // AI SDK tool-call -> Anthropic tool_use
        const toolUseBlock: ToolUseBlockParam = {
          type: 'tool_use',
          id: sanitizeToolCallId(part.toolCallId),
          name: part.toolName,
          input: part.input ?? part.args ?? {},
        }
        blocks.push(toolUseBlock)
        break
      }

      case 'tool-result': {
        // AI SDK tool-result -> Anthropic tool_result
        // 兼容 AI SDK (result) 和 Desktop (output) 两种格式
        const resultContent = extractToolResultContent(part)
        const toolResultBlock: ToolResultBlockParam = {
          type: 'tool_result',
          tool_use_id: sanitizeToolCallId(part.toolCallId),
          content: resultContent,
          ...(part.isError ? { is_error: true } : {}),
        }
        blocks.push(toolResultBlock)
        break
      }

      default:
        if (part.text) blocks.push({ type: 'text', text: part.text })
        break
    }
  }

  return blocks.length > 0 ? blocks : [{ type: 'text', text: ' ' }]
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function convertToolResultMessage(content: any): ToolResultBlockParam[] {
  if (!Array.isArray(content)) {
    return [{
      type: 'tool_result',
      tool_use_id: 'unknown',
      content: String(content),
    }]
  }

  return content
    .filter((p: { type: string }) => p.type === 'tool-result')
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    .map((p: any) => {
      // 兼容 AI SDK (result) 和 Desktop (output) 两种格式
      const resultContent = extractToolResultContent(p)
      return {
        type: 'tool_result' as const,
        tool_use_id: sanitizeToolCallId(p.toolCallId ?? 'unknown'),
        content: resultContent,
        ...(p.isError ? { is_error: true } : {}),
      }
    })
}

/**
 * 从 tool result 中提取内容字符串。
 * 兼容两种格式：
 * - AI SDK 格式：直接使用 `result` 字段
 * - Desktop AgentChatMessage 格式：`output` 字段，值为 `{ type: "json", value: {...} }` 包装
 */
// eslint-disable-next-line @typescript-eslint/no-explicit-any
function extractToolResultContent(part: any): string {
  const raw = part.result ?? part.output
  if (raw == null) return ''
  if (typeof raw === 'string') return raw
  // Desktop wrapper format: { type: "json", value: {...} }
  if (typeof raw === 'object' && raw.type === 'json' && 'value' in raw) {
    return typeof raw.value === 'string' ? raw.value : JSON.stringify(raw.value)
  }
  return JSON.stringify(raw)
}

function sanitizeToolCallId(id: string): string {
  return id.replace(/[^a-zA-Z0-9_-]/g, '_')
}

// ---------------------------------------------------------------------------
// Tool definition converter
// ---------------------------------------------------------------------------

export function convertToolsToAnthropicFormat(
  tools: Record<string, { description?: string; inputSchema?: Record<string, unknown> }>,
): Tool[] {
  return Object.entries(tools).map(([name, def]) => ({
    name,
    ...(def.description ? { description: def.description } : {}),
    input_schema: (def.inputSchema ?? { type: 'object', properties: {} }) as Tool.InputSchema,
  }))
}

// ---------------------------------------------------------------------------
// Prompt Caching: 标记 cache_control 断点
// ---------------------------------------------------------------------------

function applyCacheControl(
  systemBlocks: TextBlockParam[],
  tools: Tool[],
  messages: MessageParam[],
): void {
  // 1) system prompt 最后一个 block 标记 cache_control
  if (systemBlocks.length > 0) {
    systemBlocks[systemBlocks.length - 1].cache_control = { type: 'ephemeral' }
  }

  // 2) 最后一个 tool 定义标记 cache_control
  if (tools.length > 0) {
    tools[tools.length - 1].cache_control = { type: 'ephemeral' }
  }

  // 3) 最后 2 条消息标记 cache_control（在最后一个 content block 上）
  const lastTwo = messages.slice(-2)
  for (const msg of lastTwo) {
    if (typeof msg.content === 'string') {
      // 转为 block 格式以便添加 cache_control
      msg.content = [{ type: 'text', text: msg.content, cache_control: { type: 'ephemeral' } }]
    } else if (Array.isArray(msg.content) && msg.content.length > 0) {
      const lastBlock = msg.content[msg.content.length - 1]
      if ('cache_control' in lastBlock || lastBlock.type === 'text' || lastBlock.type === 'tool_result' || lastBlock.type === 'tool_use') {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        ;(lastBlock as any).cache_control = { type: 'ephemeral' }
      }
    }
  }
}

// ---------------------------------------------------------------------------
// Streaming helper
// ---------------------------------------------------------------------------

export interface StreamAnthropicOptions {
  modelName: string
  messages: MessageParam[]
  systemBlocks: TextBlockParam[]
  tools?: Tool[]
  temperature?: number
  maxTokens: number
  thinking?: ThinkingConfigParam
}

export async function* streamAnthropicContent(
  opts: StreamAnthropicOptions,
): AsyncGenerator<AnthropicStreamEvent> {
  // Apply prompt caching
  applyCacheControl(opts.systemBlocks, opts.tools ?? [], opts.messages)

  console.log(
    `[Anthropic] Stream: model=${opts.modelName}, messages=${opts.messages.length} msgs, tools=${opts.tools?.length ?? 0}`,
  )

  // Track content blocks for assembling tool calls
  const blockState = new Map<number, {
    type: string
    toolCallId?: string
    toolName?: string
    inputJson: string
    thinkingText: string
    signature: string
  }>()

  let totalInputTokens = 0
  let totalOutputTokens = 0
  let stopReason = 'end_turn'

  try {
    const stream = await anthropicClient.messages.create({
      model: opts.modelName,
      max_tokens: opts.maxTokens,
      ...(opts.systemBlocks.length > 0 ? { system: opts.systemBlocks } : {}),
      messages: opts.messages,
      ...(opts.tools?.length ? { tools: opts.tools } : {}),
      ...(opts.thinking ? { thinking: opts.thinking } : {}),
      ...(opts.temperature != null && !opts.thinking ? { temperature: opts.temperature } : {}),
      stream: true,
    })

    for await (const event of stream as AsyncIterable<RawMessageStreamEvent>) {
      switch (event.type) {
        case 'message_start': {
          const usage = event.message.usage
          totalInputTokens = usage.input_tokens
          totalOutputTokens = usage.output_tokens
          break
        }

        case 'content_block_start': {
          const block = event.content_block
          const state = {
            type: block.type,
            inputJson: '',
            thinkingText: '',
            signature: '',
            toolCallId: undefined as string | undefined,
            toolName: undefined as string | undefined,
          }

          if (block.type === 'tool_use') {
            state.toolCallId = block.id
            state.toolName = block.name
          } else if (block.type === 'thinking') {
            state.thinkingText = block.thinking || ''
            state.signature = block.signature || ''
          }

          blockState.set(event.index, state)
          break
        }

        case 'content_block_delta': {
          const delta = event.delta
          const state = blockState.get(event.index)

          if (delta.type === 'text_delta') {
            yield { type: 'text-delta', text: delta.text }
          } else if (delta.type === 'thinking_delta') {
            if (state) state.thinkingText += delta.thinking
            yield { type: 'reasoning-delta', text: delta.thinking }
          } else if (delta.type === 'input_json_delta') {
            if (state) state.inputJson += delta.partial_json
          } else if (delta.type === 'signature_delta') {
            if (state) state.signature += delta.signature
          }
          break
        }

        case 'content_block_stop': {
          const state = blockState.get(event.index)
          if (!state) break

          if (state.type === 'thinking' && state.signature) {
            // Emit signature with the last reasoning delta
            yield {
              type: 'reasoning-delta',
              text: '',
              signature: state.signature,
            }
          }

          if (state.type === 'tool_use' && state.toolCallId && state.toolName) {
            let args: Record<string, unknown> = {}
            if (state.inputJson) {
              try {
                args = JSON.parse(state.inputJson)
              } catch {
                args = {}
              }
            }
            yield {
              type: 'tool-call',
              toolCallId: state.toolCallId,
              toolName: state.toolName,
              args,
            }
          }

          blockState.delete(event.index)
          break
        }

        case 'message_delta': {
          if (event.delta.stop_reason) {
            stopReason = event.delta.stop_reason
          }
          if (event.usage) {
            totalOutputTokens = (event.usage as { output_tokens: number }).output_tokens
          }
          break
        }

        case 'message_stop':
          break
      }
    }

    yield {
      type: 'finish',
      finishReason: mapFinishReason(stopReason),
      usage: {
        inputTokens: totalInputTokens,
        outputTokens: totalOutputTokens,
        reasoningTokens: 0,  // Anthropic 不单独报告 reasoning tokens
      },
    }
  } catch (error) {
    console.error(`[Anthropic] Stream error for model=${opts.modelName}:`, error)
    yield { type: 'error', error }
  }
}

// ---------------------------------------------------------------------------
// Error classification
// ---------------------------------------------------------------------------

export function classifyAnthropicError(error: unknown): ClassifiedAIError {
  if (error instanceof Anthropic.APIError) {
    const status = error.status
    const message = extractAnthropicErrorMessage(error) ?? error.message

    if (status === 401) {
      return {
        code: AI_ERROR_CODE.PROVIDER_AUTH_FAILED,
        message: message ?? `Anthropic authentication failed (${status})`,
        retryable: false,
      }
    }
    if (status === 403) {
      const msg = (error.message ?? '').toLowerCase()
      if (msg.includes('safety') || msg.includes('filter') || msg.includes('blocked')) {
        return {
          code: AI_ERROR_CODE.CONTENT_FILTERED,
          message: message ?? 'Content was filtered by safety policy',
          retryable: false,
        }
      }
      return {
        code: AI_ERROR_CODE.PROVIDER_AUTH_FAILED,
        message: message ?? `Anthropic access denied (${status})`,
        retryable: false,
      }
    }
    if (status === 429) {
      return {
        code: AI_ERROR_CODE.RATE_LIMITED,
        message: message ?? 'Rate limited by Anthropic',
        retryable: true,
      }
    }
    if (status === 400) {
      const msg = (error.message ?? '').toLowerCase()
      if (msg.includes('token') && (msg.includes('too long') || msg.includes('exceed') || msg.includes('limit'))) {
        return {
          code: AI_ERROR_CODE.CONTEXT_LENGTH_EXCEEDED,
          message: message ?? 'Context length exceeded',
          retryable: false,
        }
      }
    }
    if (status === 408 || status === 504 || status === 524) {
      return {
        code: AI_ERROR_CODE.REQUEST_TIMEOUT,
        message: message ?? `Request timeout (${status})`,
        retryable: true,
      }
    }
    if (status >= 500) {
      return {
        code: AI_ERROR_CODE.PROVIDER_SERVER_ERROR,
        message: message ?? `Anthropic server error (${status})`,
        retryable: true,
      }
    }
  }

  // Fallback: generic Error
  if (error instanceof Error) {
    const msg = error.message.toLowerCase()
    if (msg.includes('timeout') || msg.includes('timed out')) {
      return {
        code: AI_ERROR_CODE.REQUEST_TIMEOUT,
        message: 'Request timed out',
        retryable: true,
      }
    }
    if (msg.includes('fetch failed') || msg.includes('econnrefused') || msg.includes('econnreset')) {
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

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function extractAnthropicErrorMessage(error: InstanceType<typeof Anthropic.APIError>): string | null {
  try {
    // error.error 可能是 { type: 'error', error: { type: '...', message: '...' } }
    const body = error.error as { error?: { message?: string }; message?: string } | undefined
    if (body?.error?.message) return body.error.message
    if (body?.message) return body.message
  } catch {
    // ignore
  }
  return null
}

function mapFinishReason(stopReason: string): string {
  switch (stopReason) {
    case 'end_turn': return 'stop'
    case 'stop_sequence': return 'stop'
    case 'max_tokens': return 'length'
    case 'tool_use': return 'tool-calls'
    default: return 'stop'
  }
}
