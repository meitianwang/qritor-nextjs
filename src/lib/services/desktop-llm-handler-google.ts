/**
 * Google 平台流式处理 handler
 *
 * @google/genai 直连 + createUIMessageStream SSE 输出。
 */

import { createUIMessageStream, createUIMessageStreamResponse } from "ai";
import { generateId } from "@ai-sdk/provider-utils";
import { normalizeToolName } from "./llm-message-preprocessor";
import { deductLlmCredits } from "./llm-credit-settle";

// ---------------------------------------------------------------------------
// Google stream handler
// ---------------------------------------------------------------------------

export interface HandleGoogleStreamParams {
  modelName: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  messages: any[];
  systemPrompt?: string;
  rawTools?: Record<
    string,
    { description?: string; inputSchema?: Record<string, unknown> }
  >;
  temperature: number;
  maxTokens?: number;
  topP?: number;
  topK?: number;
  userId: bigint;
  configId?: number;
}

export async function handleGoogleStream(
  params: HandleGoogleStreamParams,
): Promise<Response> {
  const {
    streamGoogleContent,
    convertMessagesToGoogleContents,
    convertToolsToGoogleFormat,
    classifyGoogleError,
  } = await import("@/lib/services/google-genai");

  const { contents, systemInstruction } = convertMessagesToGoogleContents(
    params.messages,
  );
  const mergedSystem = params.systemPrompt
    ? systemInstruction
      ? `${params.systemPrompt}\n\n${systemInstruction}`
      : params.systemPrompt
    : systemInstruction;

  const googleTools = params.rawTools
    ? convertToolsToGoogleFormat(params.rawTools)
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
        for await (const event of streamGoogleContent({
          modelName: params.modelName,
          contents,
          systemInstruction: mergedSystem,
          tools: googleTools,
          temperature: params.temperature,
          maxTokens: params.maxTokens,
          topP: params.topP,
          topK: params.topK,
          thinkingConfig: { includeThoughts: true, thinkingLevel: "HIGH" },
        })) {
          switch (event.type) {
            case "reasoning-delta": {
              if (!reasoningPartId) {
                reasoningPartId = generateId();
                writer.write({
                  type: "reasoning-start",
                  id: reasoningPartId,
                  providerMetadata: event.thoughtSignature
                    ? { google: { thoughtSignature: event.thoughtSignature } }
                    : undefined,
                });
              }
              writer.write({
                type: "reasoning-delta",
                id: reasoningPartId,
                delta: event.text,
                providerMetadata: event.thoughtSignature
                  ? { google: { thoughtSignature: event.thoughtSignature } }
                  : undefined,
              });
              break;
            }

            case "text-delta": {
              // 从 reasoning 过渡到 text 时，关闭 reasoning part
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
              // 关闭未关闭的 part
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
                providerMetadata: event.thoughtSignature
                  ? { google: { thoughtSignature: event.thoughtSignature } }
                  : undefined,
              });
              break;
            }

            case "finish": {
              // 关闭未关闭的 part
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
              const classified = classifyGoogleError(event.error);
              writer.write({ type: "error", errorText: classified.message });
              break;
            }
          }
        }
      } catch (error) {
        hasError = true;
        const classified = classifyGoogleError(error);
        writer.write({ type: "error", errorText: classified.message });
      }

      // 积分扣减
      if (!hasError && totalInputTokens + totalOutputTokens > 0) {
        console.log(
          `[LLM/Google] Finish: in=${totalInputTokens}, out=${totalOutputTokens}, reasoning=${totalReasoningTokens}`,
        );
        await deductLlmCredits({
          userId: params.userId,
          configId: params.configId,
          inputTokens: totalInputTokens,
          outputTokens: totalOutputTokens,
          logTag: "Google",
        });
      }
    },
  });

  return createUIMessageStreamResponse({ stream });
}
