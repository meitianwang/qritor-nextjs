/**
 * Vercel AI Gateway 流式处理 handler
 *
 * Vercel AI SDK streamText 统一接口（DeepSeek 等模型走这条路径）。
 */

import { streamText } from "ai";
import { resolveModel } from "@/lib/services/ai-service";
import {
  isDeepSeekReasoningModel,
  patchDeepSeekReasoningMessages,
} from "@/lib/services/llm-message-preprocessor";
import { deductLlmCredits } from "@/lib/services/llm-credit-settle";

// ---------------------------------------------------------------------------
// Vercel stream handler
// ---------------------------------------------------------------------------

export interface HandleVercelStreamParams {
  modelName: string;
  platform?: string | null;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  messages: any[];
  systemPrompt?: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  tools?: any;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  providerOptions?: any;
  maxTokens?: number;
  temperature: number | undefined;
  userId: bigint;
  configId?: number;
}

export async function handleVercelStream(
  params: HandleVercelStreamParams,
): Promise<Response> {
  // DeepSeek reasoning 模型：为缺少 reasoning_content 的合成 tool-call 消息补充空 reasoning
  if (isDeepSeekReasoningModel(params.modelName)) {
    patchDeepSeekReasoningMessages(params.messages);
  }

  const systemOption = params.systemPrompt
    ? { system: params.systemPrompt }
    : {};

  const result = streamText({
    model: resolveModel(params.modelName, params.platform),
    ...systemOption,
    messages: params.messages,
    ...(params.tools ? { tools: params.tools } : {}),
    ...(params.providerOptions
      ? { providerOptions: params.providerOptions }
      : {}),
    ...(params.maxTokens ? { maxTokens: params.maxTokens } : {}),
    ...(params.temperature != null ? { temperature: params.temperature } : {}),
    onFinish: async ({ totalUsage, steps }) => {
      const inputTokens = totalUsage.inputTokens ?? 0;
      const outputTokens = totalUsage.outputTokens ?? 0;
      const reasoningTokens =
        totalUsage.outputTokenDetails?.reasoningTokens ??
        totalUsage.reasoningTokens ??
        0;
      const toolCallNames = steps
        ?.flatMap((s) => s.toolCalls?.map((tc) => tc.toolName) ?? [])
        .filter(Boolean);
      console.log(
        `[LLM/Vercel] Finish: in=${inputTokens}, out=${outputTokens}, reasoning=${reasoningTokens}${
          toolCallNames?.length ? `, tools=[${toolCallNames.join(",")}]` : ""
        }`,
      );
      await deductLlmCredits({
        userId: params.userId,
        configId: params.configId,
        inputTokens,
        outputTokens,
        logTag: "Vercel",
      });
    },
  });

  return result.toUIMessageStreamResponse({
    sendReasoning: true,
    sendSources: true,
    messageMetadata: ({ part }) => {
      if (part.type === "finish") {
        const reasoningTokens =
          part.totalUsage.outputTokenDetails?.reasoningTokens ??
          part.totalUsage.reasoningTokens ??
          0;

        return {
          usage: {
            inputTokens: part.totalUsage.inputTokens ?? 0,
            outputTokens: part.totalUsage.outputTokens ?? 0,
            ...(reasoningTokens > 0 ? { reasoningTokens } : {}),
          },
        };
      }
      return undefined;
    },
  });
}
