/**
 * LLM 消息预处理工具
 *
 * 在发送给任何 AI 供应商之前，统一清洗消息数组。
 * 所有平台路径（OpenAI / Anthropic / Google / Vercel）共用。
 */

// ---------------------------------------------------------------------------
// 工具消息配对校验
// ---------------------------------------------------------------------------

/**
 * 校验消息中 tool-call / tool-result 的配对关系，移除孤立项。
 * 防止 DB 裁剪、上下文压缩、Gateway 转换等导致的不匹配，
 * 避免 provider 返回 "tool result's tool id not found" 等 400 错误。
 */
// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function sanitizeToolMessages(messages: any[]): void {
  // 1. 收集所有 tool-call IDs
  const toolCallIds = new Set<string>()
  for (const msg of messages) {
    if (msg.role === 'assistant' && Array.isArray(msg.content)) {
      for (const part of msg.content) {
        if (part.type === 'tool-call' && part.toolCallId) {
          toolCallIds.add(part.toolCallId)
        }
      }
    }
  }

  // 2. 收集所有 tool-result IDs
  const toolResultIds = new Set<string>()
  for (const msg of messages) {
    if (msg.role === 'tool' && Array.isArray(msg.content)) {
      for (const part of msg.content) {
        if (part.type === 'tool-result' && part.toolCallId) {
          toolResultIds.add(part.toolCallId)
        }
      }
    }
  }

  // 3. 找出孤立项
  const orphanedResultIds = new Set<string>()
  for (const id of toolResultIds) {
    if (!toolCallIds.has(id)) orphanedResultIds.add(id)
  }

  const orphanedCallIds = new Set<string>()
  for (const id of toolCallIds) {
    if (!toolResultIds.has(id)) orphanedCallIds.add(id)
  }

  if (orphanedResultIds.size === 0 && orphanedCallIds.size === 0) return

  console.warn(
    `[LLM] sanitizeToolMessages: orphaned results=[${[...orphanedResultIds]}], orphaned calls=[${[...orphanedCallIds]}]`,
  )

  // 4. 从后往前遍历，移除孤立消息部分
  for (let i = messages.length - 1; i >= 0; i--) {
    const msg = messages[i]

    if (msg.role === 'tool' && Array.isArray(msg.content)) {
      msg.content = msg.content.filter(
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        (p: any) => p.type !== 'tool-result' || !orphanedResultIds.has(p.toolCallId),
      )
      if (msg.content.length === 0) {
        messages.splice(i, 1)
      }
    }

    if (msg.role === 'assistant' && Array.isArray(msg.content)) {
      msg.content = msg.content.filter(
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        (p: any) => p.type !== 'tool-call' || !orphanedCallIds.has(p.toolCallId),
      )
      if (msg.content.length === 0) {
        msg.content = ' '
      }
    }
  }
}

// ---------------------------------------------------------------------------
// 工具名规范化（Anthropic / OpenAI / Google handler 使用）
// ---------------------------------------------------------------------------

/**
 * 规范化工具名：剥离模型可能添加的前缀。
 * - Claude 有时会加 "mcp_" 前缀
 * - Google SDK 有时会加 "default_api:" 前缀
 */
export function normalizeToolName(name: string): string {
  if (name.startsWith('mcp_')) return name.slice(4)
  if (name.startsWith('default_api:')) return name.slice('default_api:'.length)
  return name
}

// ---------------------------------------------------------------------------
// DeepSeek reasoning 模型兼容处理（仅 Vercel 路径使用）
// ---------------------------------------------------------------------------

/**
 * 检测是否为 DeepSeek reasoning 模型（如 deepseek-reasoner / deepseek-v3.2-thinking）。
 * 这类模型要求对话历史中所有含 tool-call 的 assistant 消息都携带 reasoning_content 字段。
 */
export function isDeepSeekReasoningModel(modelName: string): boolean {
  const lower = modelName.toLowerCase()
  return lower.includes('deepseek') && (lower.includes('thinking') || lower.includes('reasoner'))
}

/**
 * DeepSeek reasoning 模型消息预处理：
 * 为缺少 reasoning part 的 assistant tool-call 消息补充空 reasoning，
 * 防止 "Missing reasoning_content field in the assistant message" 400 错误。
 *
 * 背景：桌面端斜杠命令会在发送 LLM 请求前注入合成的 assistant tool-call 消息，
 * 这类消息没有 reasoning_content，DeepSeek reasoner 会拒绝包含此类消息的请求。
 */
// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function patchDeepSeekReasoningMessages(messages: any[]): void {
  for (const msg of messages) {
    if (msg.role === 'assistant' && Array.isArray(msg.content)) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const hasToolCall = msg.content.some((p: any) => p.type === 'tool-call')
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const hasReasoning = msg.content.some((p: any) => p.type === 'reasoning')
      if (hasToolCall && !hasReasoning) {
        msg.content.unshift({ type: 'reasoning', text: '' })
      }
    }
  }
}
