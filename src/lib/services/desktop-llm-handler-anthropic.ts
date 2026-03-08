/**
 * Anthropic 平台流式处理 handler
 *
 * 包含 Anthropic 消息预处理（prompt caching、内容清洗）和
 * @anthropic-ai/sdk 直连 + createUIMessageStream SSE 输出。
 */

import { createUIMessageStream, createUIMessageStreamResponse } from "ai";
import { generateId } from "@ai-sdk/provider-utils";
import { normalizeToolName } from "./llm-message-preprocessor";
import { deductLlmCredits } from "./llm-credit-settle";

// ---------------------------------------------------------------------------
// Anthropic 消息预处理（prompt caching + 内容清洗）
// ---------------------------------------------------------------------------

/**
 * Anthropic 消息预处理：
 * 1. 在最后一个 tool 上标记 cacheControl（缓存 tool 定义）
 * 2. 过滤空内容（Anthropic 拒绝空 content）
 * 3. 清洗 tool call ID（只允许 [a-zA-Z0-9_-]）
 * 4. 在最后 2 条非 system 消息上标记 cacheControl
 */
export function preprocessAnthropicMessages(
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  messages: any[],
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  toolsForModel?: Record<string, any>,
): void {
  // Tool prompt caching: 在最后一个 tool 上标记 cacheControl 断点，
  // 使 Anthropic API 缓存所有 tool 定义（~55k tokens），后续请求只计 cache read 费用（10%）
  if (toolsForModel) {
    const toolNames = Object.keys(toolsForModel);
    if (toolNames.length > 0) {
      const lastToolName = toolNames[toolNames.length - 1];
      toolsForModel[lastToolName] = {
        ...toolsForModel[lastToolName],
        providerOptions: {
          anthropic: { cacheControl: { type: "ephemeral" } },
        },
      };
    }
  }

  for (let i = 0; i < messages.length; i++) {
    const m = messages[i];

    // 1) 过滤空内容（Anthropic 会拒绝空 content）
    if (typeof m.content === "string" && m.content === "") {
      m.content = " ";
    } else if (Array.isArray(m.content)) {
      m.content = m.content.filter(
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        (p: any) => {
          if (p.type === "text" || p.type === "reasoning") return p.text !== "";
          return true;
        },
      );
      if (m.content.length === 0) m.content = " ";
    }

    // 2) 清洗 tool call ID（Anthropic 只接受 [a-zA-Z0-9_-]）
    if (Array.isArray(m.content)) {
      for (const part of m.content) {
        if (
          (part.type === "tool-call" || part.type === "tool-result") &&
          part.toolCallId
        ) {
          part.toolCallId = part.toolCallId.replace(/[^a-zA-Z0-9_-]/g, "_");
        }
      }
    }
  }

  // 3) 在最后 2 条非 system 消息上标记 cacheControl
  const nonSystemMsgs = messages.filter(
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    (m: any) => m.role !== "system",
  );
  const lastTwo = nonSystemMsgs.slice(-2);
  for (const msg of lastTwo) {
    msg.providerOptions = {
      ...(msg.providerOptions || {}),
      anthropic: {
        ...(msg.providerOptions?.anthropic || {}),
        cacheControl: { type: "ephemeral" },
      },
    };
  }
}

// ---------------------------------------------------------------------------
// Anthropic stream handler
// ---------------------------------------------------------------------------

export interface HandleAnthropicStreamParams {
  modelName: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  messages: any[];
  systemPrompt?: string;
  rawTools?: Record<
    string,
    { description?: string; inputSchema?: Record<string, unknown> }
  >;
  temperature: number | undefined;
  maxTokens: number;
  userId: bigint;
  configId?: number;
}

export async function handleAnthropicStream(
  params: HandleAnthropicStreamParams,
): Promise<Response> {
  const {
    streamAnthropicContent,
    convertMessagesToAnthropicFormat,
    convertToolsToAnthropicFormat,
    classifyAnthropicError,
  } = await import("@/lib/services/anthropic-sdk");

  const { messages: anthropicMessages, systemBlocks } =
    convertMessagesToAnthropicFormat(params.messages);

  // 合并外部 system prompt 和消息中提取的 system blocks
  if (params.systemPrompt) {
    systemBlocks.unshift({ type: "text", text: params.systemPrompt });
  }

  const anthropicTools = params.rawTools
    ? convertToolsToAnthropicFormat(params.rawTools)
    : undefined;

  const stream = createUIMessageStream({
    execute: async ({ writer }) => {
      let totalInputTokens = 0;
      let totalOutputTokens = 0;
      let totalReasoningTokens = 0;

      let reasoningPartId = "";
      let textPartId = "";
      let hasError = false;

      writer.write({ type: "start" });
      writer.write({ type: "start-step" });

      try {
        for await (const event of streamAnthropicContent({
          modelName: params.modelName,
          messages: anthropicMessages,
          systemBlocks,
          tools: anthropicTools,
          temperature: params.temperature,
          maxTokens: params.maxTokens,
          thinking: {
            type: "enabled",
            budget_tokens: Math.max(1024, params.maxTokens - 1),
          },
        })) {
          switch (event.type) {
            case "reasoning-delta": {
              if (!reasoningPartId) {
                reasoningPartId = generateId();
                writer.write({ type: "reasoning-start", id: reasoningPartId });
              }
              if (event.text) {
                writer.write({
                  type: "reasoning-delta",
                  id: reasoningPartId,
                  delta: event.text,
                });
              }
              // signature 到达时通过 providerMetadata 传递
              if (event.signature) {
                writer.write({
                  type: "reasoning-end",
                  id: reasoningPartId,
                  providerMetadata: {
                    anthropic: { signature: event.signature },
                  },
                });
                reasoningPartId = "";
              }
              break;
            }

            case "text-delta": {
              if (reasoningPartId) {
                writer.write({ type: "reasoning-end", id: reasoningPartId });
                reasoningPartId = "";
              }
              if (!textPartId) {
                textPartId = generateId();
                writer.write({ type: "text-start", id: textPartId });
              }
              writer.write({
                type: "text-delta",
                id: textPartId,
                delta: event.text,
              });
              break;
            }

            case "tool-call": {
              if (textPartId) {
                writer.write({ type: "text-end", id: textPartId });
                textPartId = "";
              }
              if (reasoningPartId) {
                writer.write({ type: "reasoning-end", id: reasoningPartId });
                reasoningPartId = "";
              }
              writer.write({
                type: "tool-input-available",
                toolCallId: event.toolCallId,
                toolName: normalizeToolName(event.toolName),
                input: event.args,
              });
              break;
            }

            case "finish": {
              if (textPartId) {
                writer.write({ type: "text-end", id: textPartId });
                textPartId = "";
              }
              if (reasoningPartId) {
                writer.write({ type: "reasoning-end", id: reasoningPartId });
                reasoningPartId = "";
              }

              totalInputTokens = event.usage.inputTokens;
              totalOutputTokens = event.usage.outputTokens;
              totalReasoningTokens = event.usage.reasoningTokens;

              writer.write({ type: "finish-step" });
              writer.write({
                type: "finish",
                finishReason: event.finishReason as
                  | "stop"
                  | "length"
                  | "tool-calls",
                messageMetadata: {
                  usage: {
                    inputTokens: totalInputTokens,
                    outputTokens: totalOutputTokens,
                    ...(totalReasoningTokens > 0
                      ? { reasoningTokens: totalReasoningTokens }
                      : {}),
                  },
                },
              });
              break;
            }

            case "error": {
              hasError = true;
              const classified = classifyAnthropicError(event.error);
              writer.write({ type: "error", errorText: classified.message });
              break;
            }
          }
        }
      } catch (error) {
        hasError = true;
        const classified = classifyAnthropicError(error);
        writer.write({ type: "error", errorText: classified.message });
      }

      // 积分扣减
      if (!hasError && totalInputTokens + totalOutputTokens > 0) {
        console.log(
          `[LLM/Anthropic] Finish: in=${totalInputTokens}, out=${totalOutputTokens}, reasoning=${totalReasoningTokens}`,
        );
        await deductLlmCredits({
          userId: params.userId,
          configId: params.configId,
          inputTokens: totalInputTokens,
          outputTokens: totalOutputTokens,
          logTag: "Anthropic",
        });
      }
    },
  });

  return createUIMessageStreamResponse({ stream });
}
