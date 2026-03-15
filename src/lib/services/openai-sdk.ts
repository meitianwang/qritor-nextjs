import OpenAI from "openai";
import type {
  ResponseStreamEvent,
  ResponseInputItem,
  FunctionTool,
} from "openai/resources/responses/responses";
import { AI_ERROR_CODE, type ClassifiedAIError } from "./ai-error-codes";

// ---------------------------------------------------------------------------
// Client singleton
// ---------------------------------------------------------------------------

const openaiClient = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY ?? "",
  baseURL: process.env.OPENAI_BASE_URL ?? undefined,
});

// ---------------------------------------------------------------------------
// Internal stream event types (与 anthropic-sdk.ts / google-genai.ts 对称)
// ---------------------------------------------------------------------------

export interface OpenAITextDelta {
  type: "text-delta";
  text: string;
}

export interface OpenAIReasoningDelta {
  type: "reasoning-delta";
  text: string;
}

export interface OpenAIToolCall {
  type: "tool-call";
  toolCallId: string;
  toolName: string;
  args: Record<string, unknown>;
}

export interface OpenAIFinish {
  type: "finish";
  finishReason: string;
  usage: {
    inputTokens: number;
    outputTokens: number;
    reasoningTokens: number;
  };
}

export interface OpenAIStreamError {
  type: "error";
  error: unknown;
}

export type OpenAIStreamEvent =
  | OpenAITextDelta
  | OpenAIReasoningDelta
  | OpenAIToolCall
  | OpenAIFinish
  | OpenAIStreamError;

// ---------------------------------------------------------------------------
// Message format converter: AI SDK CoreMessage[] → OpenAI ResponseInputItem[]
// ---------------------------------------------------------------------------

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function convertMessagesToOpenAIInput(messages: any[]): {
  input: ResponseInputItem[];
  systemInstruction?: string;
} {
  let systemInstruction: string | undefined;
  const input: ResponseInputItem[] = [];

  for (const msg of messages) {
    if (msg.role === "system") {
      const text =
        typeof msg.content === "string"
          ? msg.content
          : msg.content?.map((p: { text?: string }) => p.text ?? "").join("\n");
      if (text) {
        systemInstruction = systemInstruction
          ? `${systemInstruction}\n\n${text}`
          : text;
      }
      continue;
    }

    if (msg.role === "tool") {
      // AI SDK tool role → OpenAI function_call_output items
      const outputs = convertToolResultItems(msg.content);
      input.push(...outputs);
      continue;
    }

    if (msg.role === "user") {
      const text = extractTextContent(msg.content);
      if (text) {
        input.push({ role: "user", content: text } as ResponseInputItem);
      }
      continue;
    }

    if (msg.role === "assistant") {
      convertAssistantMessage(msg.content, input);
      continue;
    }
  }

  return { input, systemInstruction };
}

function extractTextContent(content: unknown): string {
  if (typeof content === "string") return content || " ";
  if (!Array.isArray(content)) return " ";

  const texts: string[] = [];
  for (const part of content) {
    if (part.type === "text" && part.text) texts.push(part.text);
  }
  return texts.join("\n") || " ";
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function convertAssistantMessage(
  content: any,
  output: ResponseInputItem[],
): void {
  if (typeof content === "string") {
    if (content) {
      output.push({ role: "assistant", content } as ResponseInputItem);
    }
    return;
  }
  if (!Array.isArray(content)) return;

  // 收集文本和工具调用，分别输出
  const textParts: string[] = [];

  for (const part of content) {
    switch (part.type) {
      case "text":
        if (part.text) textParts.push(part.text);
        break;

      case "tool-call": {
        // 先输出累积的文本
        if (textParts.length > 0) {
          output.push({
            role: "assistant",
            content: textParts.join("\n"),
          } as ResponseInputItem);
          textParts.length = 0;
        }
        // 输出 function_call item
        const args = part.input ?? part.args ?? {};
        output.push({
          type: "function_call",
          call_id: part.toolCallId ?? "",
          name: part.toolName,
          arguments: typeof args === "string" ? args : JSON.stringify(args),
        } as ResponseInputItem);
        break;
      }

      case "reasoning":
        // OpenAI Responses API 内部管理 reasoning，跳过历史 reasoning
        break;

      default:
        if (part.text) textParts.push(part.text);
        break;
    }
  }

  // 输出剩余文本
  if (textParts.length > 0) {
    output.push({
      role: "assistant",
      content: textParts.join("\n"),
    } as ResponseInputItem);
  }
}

/**
 * 从 tool result 中提取内容字符串。
 * 兼容两种格式：
 * - AI SDK 格式：直接使用 `result` 字段
 * - Desktop AgentChatMessage 格式：`output` 字段，值为 `{ type: "json", value: {...} }` 包装
 */
// eslint-disable-next-line @typescript-eslint/no-explicit-any
function extractToolResultContent(part: any): string {
  const raw = part.result ?? part.output;
  if (raw == null) return "";
  if (typeof raw === "string") return raw;
  // Desktop wrapper format: { type: "json", value: {...} }
  if (typeof raw === "object" && raw.type === "json" && "value" in raw) {
    return typeof raw.value === "string"
      ? raw.value
      : JSON.stringify(raw.value);
  }
  return JSON.stringify(raw);
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function convertToolResultItems(content: any): ResponseInputItem[] {
  if (!Array.isArray(content)) {
    return [
      {
        type: "function_call_output",
        call_id: "unknown",
        output: String(content),
      } as ResponseInputItem,
    ];
  }

  return (
    content
      .filter((p: { type: string }) => p.type === "tool-result")
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      .map(
        (p: any) =>
          ({
            type: "function_call_output",
            call_id: p.toolCallId ?? "unknown",
            // 兼容 AI SDK (result) 和 Desktop (output) 两种格式
            output: extractToolResultContent(p),
          }) as ResponseInputItem,
      )
  );
}

// ---------------------------------------------------------------------------
// Tool definition converter
// ---------------------------------------------------------------------------

export function convertToolsToOpenAIFormat(
  tools: Record<
    string,
    { description?: string; inputSchema?: Record<string, unknown> }
  >,
): FunctionTool[] {
  return Object.entries(tools).map(([name, def]) => ({
    type: "function" as const,
    name,
    ...(def.description ? { description: def.description } : {}),
    parameters: (def.inputSchema ?? {
      type: "object",
      properties: {},
    }) as Record<string, unknown>,
    strict: false,
  }));
}

// ---------------------------------------------------------------------------
// Streaming helper
// ---------------------------------------------------------------------------

export interface StreamOpenAIOptions {
  modelName: string;
  input: ResponseInputItem[];
  instructions?: string;
  tools?: FunctionTool[];
  temperature?: number;
  maxTokens?: number;
  reasoning?: { effort: string; summary?: string };
  client?: OpenAI;
}

export async function* streamOpenAIContent(
  opts: StreamOpenAIOptions,
): AsyncGenerator<OpenAIStreamEvent> {
  console.log(
    `[OpenAI] Stream: model=${opts.modelName}, input=${opts.input.length} items, tools=${opts.tools?.length ?? 0}`,
  );

  let totalInputTokens = 0;
  let totalOutputTokens = 0;
  let reasoningTokens = 0;
  let hasToolCalls = false;
  // item_id → { call_id, name } 映射：response.function_call_arguments.done 只有 item_id，
  // 代理可能不传 name，需要从 output_item.added 事件中提前捕获
  const itemMeta = new Map<string, { callId: string; name: string }>();

  const client = opts.client ?? openaiClient;

  try {
    const stream = await client.responses.create({
      model: opts.modelName,
      input: opts.input,
      ...(opts.instructions ? { instructions: opts.instructions } : {}),
      ...(opts.tools?.length ? { tools: opts.tools } : {}),
      ...(opts.reasoning
        ? {
            reasoning: {
              effort: opts.reasoning.effort as "low" | "medium" | "high",
              ...(opts.reasoning.summary
                ? {
                    summary: opts.reasoning.summary as
                      | "auto"
                      | "concise"
                      | "detailed",
                  }
                : {}),
            },
          }
        : {}),
      ...(opts.temperature != null && !opts.reasoning
        ? { temperature: opts.temperature }
        : {}),
      ...(opts.maxTokens ? { max_output_tokens: opts.maxTokens } : {}),
      store: false,
      stream: true,
    });

    for await (const event of stream as AsyncIterable<ResponseStreamEvent>) {
      switch (event.type) {
        // 文本增量
        case "response.output_text.delta": {
          yield { type: "text-delta", text: event.delta };
          break;
        }

        // 推理增量（summary 和 full text）
        case "response.reasoning_summary_text.delta": {
          yield { type: "reasoning-delta", text: event.delta };
          break;
        }
        case "response.reasoning_text.delta": {
          yield { type: "reasoning-delta", text: event.delta };
          break;
        }

        // 捕获 function_call item 的 call_id 和 name
        case "response.output_item.added": {
          const item = event.item as {
            type?: string;
            id?: string;
            call_id?: string;
            name?: string;
          };
          if (item.type === "function_call" && item.id) {
            itemMeta.set(item.id, {
              callId: item.call_id ?? item.id,
              name: item.name ?? "",
            });
          }
          break;
        }

        // 工具调用完成
        case "response.function_call_arguments.done": {
          hasToolCalls = true;
          let args: Record<string, unknown> = {};
          try {
            args = JSON.parse(event.arguments);
          } catch {
            args = {};
          }
          const meta = itemMeta.get(event.item_id);
          yield {
            type: "tool-call",
            toolCallId: meta?.callId ?? event.item_id,
            toolName: event.name ?? meta?.name ?? "",
            args,
          };
          break;
        }

        // 完成事件
        case "response.completed": {
          const usage = event.response.usage;
          if (usage) {
            totalInputTokens = usage.input_tokens;
            totalOutputTokens = usage.output_tokens;
            reasoningTokens =
              usage.output_tokens_details?.reasoning_tokens ?? 0;
          }
          break;
        }

        // 错误事件
        case "error": {
          yield { type: "error", error: new Error(event.message) };
          break;
        }
      }
    }

    yield {
      type: "finish",
      finishReason: hasToolCalls ? "tool-calls" : "stop",
      usage: {
        inputTokens: totalInputTokens,
        outputTokens: totalOutputTokens,
        reasoningTokens,
      },
    };
  } catch (error) {
    console.error(`[OpenAI] Stream error for model=${opts.modelName}:`, error);
    yield { type: "error", error };
  }
}

// ---------------------------------------------------------------------------
// Error classification
// ---------------------------------------------------------------------------

export function classifyOpenAIError(error: unknown): ClassifiedAIError {
  if (error instanceof OpenAI.APIError) {
    const status = error.status;
    const message = extractOpenAIErrorMessage(error) ?? error.message;

    if (status === 401) {
      return {
        code: AI_ERROR_CODE.PROVIDER_AUTH_FAILED,
        message: message ?? `OpenAI authentication failed (${status})`,
        retryable: false,
      };
    }
    if (status === 403) {
      const msg = (error.message ?? "").toLowerCase();
      if (
        msg.includes("safety") ||
        msg.includes("filter") ||
        msg.includes("blocked")
      ) {
        return {
          code: AI_ERROR_CODE.CONTENT_FILTERED,
          message: message ?? "Content was filtered by safety policy",
          retryable: false,
        };
      }
      return {
        code: AI_ERROR_CODE.PROVIDER_AUTH_FAILED,
        message: message ?? `OpenAI access denied (${status})`,
        retryable: false,
      };
    }
    if (status === 429) {
      return {
        code: AI_ERROR_CODE.RATE_LIMITED,
        message: message ?? "Rate limited by OpenAI",
        retryable: true,
      };
    }
    if (status === 400) {
      const msg = (error.message ?? "").toLowerCase();
      if (
        msg.includes("token") &&
        (msg.includes("too long") ||
          msg.includes("exceed") ||
          msg.includes("limit"))
      ) {
        return {
          code: AI_ERROR_CODE.CONTEXT_LENGTH_EXCEEDED,
          message: message ?? "Context length exceeded",
          retryable: false,
        };
      }
    }
    if (status === 408 || status === 504 || status === 524) {
      return {
        code: AI_ERROR_CODE.REQUEST_TIMEOUT,
        message: message ?? `Request timeout (${status})`,
        retryable: true,
      };
    }
    if (status >= 500) {
      return {
        code: AI_ERROR_CODE.PROVIDER_SERVER_ERROR,
        message: message ?? `OpenAI server error (${status})`,
        retryable: true,
      };
    }
  }

  // Fallback: generic Error
  if (error instanceof Error) {
    const msg = error.message.toLowerCase();
    if (msg.includes("timeout") || msg.includes("timed out")) {
      return {
        code: AI_ERROR_CODE.REQUEST_TIMEOUT,
        message: "Request timed out",
        retryable: true,
      };
    }
    if (
      msg.includes("fetch failed") ||
      msg.includes("econnrefused") ||
      msg.includes("econnreset")
    ) {
      return {
        code: AI_ERROR_CODE.NETWORK_ERROR,
        message: "Network connection failed",
        retryable: true,
      };
    }
    if (
      msg.includes("terminated") ||
      msg.includes("other side closed") ||
      msg.includes("socket hang up")
    ) {
      return {
        code: AI_ERROR_CODE.STREAM_ERROR,
        message: "Stream connection was interrupted",
        retryable: true,
      };
    }
  }

  return {
    code: AI_ERROR_CODE.UNKNOWN_ERROR,
    message: String(error),
    retryable: false,
  };
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function extractOpenAIErrorMessage(
  error: InstanceType<typeof OpenAI.APIError>,
): string | null {
  try {
    const body = error.error as
      | { error?: { message?: string }; message?: string }
      | undefined;
    if (body?.error?.message) return body.error.message;
    if (body?.message) return body.message;
  } catch {
    // ignore
  }
  return null;
}

export { OpenAI };
