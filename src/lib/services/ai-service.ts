import { streamText, createGateway } from "ai";
import { createOpenAICompatible } from "@ai-sdk/openai-compatible";
import Anthropic from "@anthropic-ai/sdk";
import OpenAI from "openai";
import { GoogleGenAI } from "@google/genai";
import { prisma } from "@/lib/prisma";
import {
  calculateCredits,
  estimateMessagesTokens,
  getConfigParams,
} from "./token-calculator";
import {
  resolveModelRequestPolicy,
  calibrateTemperatureForProvider,
} from "./reasoning-options";
import { AI_ERROR_CODE, type AIErrorCode } from "./ai-error-codes";
import { classifyAIError } from "./ai-error-classifier";

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

interface StreamChunkEvent {
  type: "chunk";
  content: string;
}

interface StreamReasoningEvent {
  type: "reasoning";
  content: string;
}

interface StreamUsageEvent {
  type: "usage";
  inputTokens: number;
  outputTokens: number;
}

interface StreamErrorEvent {
  type: "error";
  code: AIErrorCode;
  message: string;
  retryable: boolean;
}

type StreamEvent =
  | StreamChunkEvent
  | StreamReasoningEvent
  | StreamUsageEvent
  | StreamErrorEvent;

interface GenerateChunkEvent {
  event: "chunk";
  data: { content: string };
}

interface GenerateReasoningEvent {
  event: "reasoning";
  data: { content: string };
}

interface GenerateJsonEvent {
  event: "json";
  data: { content: string };
}

interface GenerateCompleteEvent {
  event: "complete";
  data: {
    status: string;
    usage: {
      inputTokens: number;
      outputTokens: number;
      creditsConsumed: number;
    };
  };
}

interface GenerateErrorEvent {
  event: "error";
  data: { error: string; code: string; retryable?: boolean };
}

type GenerateEvent =
  | GenerateChunkEvent
  | GenerateReasoningEvent
  | GenerateJsonEvent
  | GenerateCompleteEvent
  | GenerateErrorEvent;

export interface LlmConfigRow {
  id: bigint;
  model_name: string;
  provider: string;
  platform: string | null;
  model_tier: string | null;
  is_default: number | null;
  enabled: number | null;
  input_price_per_m: number | null;
  output_price_per_m: number | null;
}

// ---------------------------------------------------------------------------
// Utility: extract JSON from LLM output
// ---------------------------------------------------------------------------

export function extractJson(content: string): string | null {
  // Try ```json ... ``` blocks first
  const jsonBlockPattern = /```json\s*([\s\S]*?)```/i;
  const blockMatch = jsonBlockPattern.exec(content);
  if (blockMatch) {
    return blockMatch[1].trim();
  }

  // Fall back to the outermost { ... }
  const jsonPattern = /(\{[\s\S]*\})/;
  const objMatch = jsonPattern.exec(content);
  if (objMatch) {
    const jsonStr = objMatch[1].trim();
    try {
      JSON.parse(jsonStr);
      return jsonStr;
    } catch {
      // not valid JSON
    }
  }

  return null;
}

// ---------------------------------------------------------------------------
// Utility: resolve LLM config
// ---------------------------------------------------------------------------

export async function getConfigById(
  configId?: number,
): Promise<LlmConfigRow | null> {
  // 1. By explicit id
  if (configId) {
    const config = await prisma.llm_config.findUnique({
      where: { id: BigInt(configId) },
    });
    if (config) return config as unknown as LlmConfigRow;
  }

  // 2. Default + enabled
  const defaultConfig = await prisma.llm_config.findFirst({
    where: { is_default: 1, enabled: 1 },
  });
  if (defaultConfig) return defaultConfig as unknown as LlmConfigRow;

  // 3. Any enabled
  const enabledConfig = await prisma.llm_config.findFirst({
    where: { enabled: 1 },
  });
  if (enabledConfig) return enabledConfig as unknown as LlmConfigRow;

  // 4. Any at all
  const anyConfig = await prisma.llm_config.findFirst();
  return anyConfig as unknown as LlmConfigRow | null;
}

// ---------------------------------------------------------------------------
// Vercel AI Gateway instance
// ---------------------------------------------------------------------------

export const gateway = createGateway({
  apiKey: process.env.AI_GATEWAY_API_KEY ?? "",
});

const packyapi = createOpenAICompatible({
  baseURL: process.env.PACKYAPI_BASE_URL
    ? `${process.env.PACKYAPI_BASE_URL}/v1`
    : "",
  apiKey: process.env.PACKYAPI_API_KEY ?? "",
  name: "packyapi",
  fetch: async (url: RequestInfo | URL, options?: RequestInit) => {
    // 注入火山引擎 thinking 参数到 chat/completions 请求体
    if (options?.body && typeof options.body === "string") {
      try {
        const body = JSON.parse(options.body);
        if (!body.thinking) {
          body.thinking = { type: "enabled" };
        }
        return fetch(url, { ...options, body: JSON.stringify(body) });
      } catch {
        // JSON 解析失败，透传原始请求
      }
    }
    return fetch(url, options);
  },
});

const oneproxy = createOpenAICompatible({
  baseURL: process.env.ONEPROXY_BASE_URL
    ? `${process.env.ONEPROXY_BASE_URL}/v1`
    : "http://localhost:8417/v1",
  apiKey: process.env.ONEPROXY_API_KEY ?? "",
  name: "oneproxy",
});

export function resolveModel(modelName: string, platform?: string | null) {
  const resolved = (() => {
    if (!platform || platform === "vercel") {
      return gateway(modelName);
    }
    switch (platform) {
      case "packyapi":
        return packyapi.chatModel(modelName);
      case "oneproxy":
        return oneproxy.chatModel(modelName);
      default:
        return gateway(modelName);
    }
  })();

  console.log(
    `[resolveModel] model=${modelName}, platform=${platform ?? "vercel"}, provider=${resolved.provider}, modelId=${resolved.modelId}`,
  );
  return resolved;
}

// ---------------------------------------------------------------------------
// OneProxy: 根据模型名称判断走哪个原生协议
// ---------------------------------------------------------------------------

const ONEPROXY_BASE = process.env.ONEPROXY_BASE_URL ?? "http://localhost:8417";
const ONEPROXY_KEY = process.env.ONEPROXY_API_KEY ?? "sk-placeholder";

export function resolveOneProxyProtocol(
  modelName: string,
): "anthropic" | "openai" | "google" | null {
  const name = modelName.toLowerCase();
  if (name.includes("claude")) return "anthropic";
  if (name.includes("gemini")) return "google";
  if (
    name.includes("gpt") ||
    name.startsWith("o3") ||
    name.startsWith("o4") ||
    name.startsWith("o1")
  )
    return "openai";
  return null;
}

let _oneproxyAnthropic: Anthropic | undefined;
let _oneproxyOpenAI: OpenAI | undefined;
let _oneproxyGoogle: GoogleGenAI | undefined;

export function getOneProxyAnthropicClient(): Anthropic {
  if (!_oneproxyAnthropic) {
    _oneproxyAnthropic = new Anthropic({
      apiKey: ONEPROXY_KEY,
      baseURL: ONEPROXY_BASE,
    });
  }
  return _oneproxyAnthropic;
}

export function getOneProxyOpenAIClient(): OpenAI {
  if (!_oneproxyOpenAI) {
    _oneproxyOpenAI = new OpenAI({
      apiKey: ONEPROXY_KEY,
      baseURL: `${ONEPROXY_BASE}/v1`,
    });
  }
  return _oneproxyOpenAI;
}

export function getOneProxyGoogleClient(): GoogleGenAI {
  if (!_oneproxyGoogle) {
    _oneproxyGoogle = new GoogleGenAI({
      apiKey: ONEPROXY_KEY,
      httpOptions: { baseUrl: ONEPROXY_BASE },
    });
  }
  return _oneproxyGoogle;
}

// ---------------------------------------------------------------------------
// GatewayAIService -- streams text via Vercel AI Gateway
// ---------------------------------------------------------------------------

class GatewayAIService {
  async *streamTextFromProxy(
    prompt: string,
    systemPrompt?: string,
    configId?: number,
  ): AsyncGenerator<StreamEvent> {
    const config = await getConfigById(configId);
    if (!config) {
      yield {
        type: "error",
        code: AI_ERROR_CODE.NO_LLM_CONFIG,
        message: "No LLM config available",
        retryable: false,
      };
      return;
    }

    // model_name should be in "provider/model" format, e.g. "deepseek/deepseek-chat"
    const modelPolicy = resolveModelRequestPolicy(
      config.model_name,
      config.provider,
    );

    // 按模型名称设置固定采样参数
    const calibrated = calibrateTemperatureForProvider(config.model_name);
    const calTemperature = calibrated.temperature;
    const calTopP = calibrated.topP;
    const calTopK = calibrated.topK;

    const messages: Array<{ role: "system" | "user"; content: string }> = [];
    if (systemPrompt) {
      messages.push({ role: "system", content: systemPrompt });
    }
    messages.push({ role: "user", content: prompt });

    // Google platform: 直接走 @google/genai SDK
    if (config.platform === "google") {
      const { streamGoogleContent, classifyGoogleError } =
        await import("./google-genai");
      let outputText = "";
      try {
        for await (const event of streamGoogleContent({
          modelName: config.model_name,
          contents: [{ role: "user", parts: [{ text: prompt }] }],
          systemInstruction: systemPrompt,
          thinkingConfig: { includeThoughts: true, thinkingLevel: "HIGH" },
          maxTokens: modelPolicy.maxTokens,
          temperature: calTemperature,
          topP: calTopP,
          topK: calTopK,
        })) {
          switch (event.type) {
            case "text-delta":
              outputText += event.text;
              yield { type: "chunk", content: event.text };
              break;
            case "reasoning-delta":
              yield { type: "reasoning", content: event.text };
              break;
            case "finish":
              yield {
                type: "usage",
                inputTokens: event.usage.inputTokens,
                outputTokens: event.usage.outputTokens,
              };
              break;
            case "error": {
              const classified = classifyGoogleError(event.error);
              console.error("Google AI stream error:", event.error);
              yield { type: "error", ...classified };
              return;
            }
          }
        }
      } catch (error) {
        console.error("Google AI service error:", error);
        const classified = classifyGoogleError(error);
        yield { type: "error", ...classified };
      }
      return;
    }

    // OpenAI platform: 直接走 openai 官方 SDK (Responses API)
    if (config.platform === "openai") {
      const {
        streamOpenAIContent,
        convertMessagesToOpenAIInput,
        classifyOpenAIError,
      } = await import("./openai-sdk");
      const { input } = convertMessagesToOpenAIInput([
        { role: "user", content: prompt },
      ]);
      let outputText = "";
      try {
        for await (const event of streamOpenAIContent({
          modelName: config.model_name,
          input,
          instructions: systemPrompt,
          maxTokens: modelPolicy.maxTokens,
          temperature: calTemperature,
          reasoning: { effort: "high", summary: "detailed" },
        })) {
          switch (event.type) {
            case "text-delta":
              outputText += event.text;
              yield { type: "chunk", content: event.text };
              break;
            case "reasoning-delta":
              yield { type: "reasoning", content: event.text };
              break;
            case "finish":
              yield {
                type: "usage",
                inputTokens: event.usage.inputTokens,
                outputTokens: event.usage.outputTokens,
              };
              break;
            case "error": {
              const classified = classifyOpenAIError(event.error);
              console.error("OpenAI stream error:", event.error);
              yield { type: "error", ...classified };
              return;
            }
          }
        }
      } catch (error) {
        console.error("OpenAI service error:", error);
        const classified = classifyOpenAIError(error);
        yield { type: "error", ...classified };
      }
      return;
    }

    // Anthropic platform: 直接走 @anthropic-ai/sdk
    if (config.platform === "anthropic") {
      const { streamAnthropicContent, classifyAnthropicError } =
        await import("./anthropic-sdk");
      let outputText = "";
      try {
        for await (const event of streamAnthropicContent({
          modelName: config.model_name,
          messages: [{ role: "user", content: prompt }],
          systemBlocks: systemPrompt
            ? [{ type: "text", text: systemPrompt }]
            : [],
          maxTokens: modelPolicy.maxTokens ?? 16000,
          temperature: calTemperature,
          thinking: {
            type: "enabled",
            budget_tokens: Math.max(1024, (modelPolicy.maxTokens ?? 16000) - 1),
          },
        })) {
          switch (event.type) {
            case "text-delta":
              outputText += event.text;
              yield { type: "chunk", content: event.text };
              break;
            case "reasoning-delta":
              yield { type: "reasoning", content: event.text };
              break;
            case "finish":
              yield {
                type: "usage",
                inputTokens: event.usage.inputTokens,
                outputTokens: event.usage.outputTokens,
              };
              break;
            case "error": {
              const classified = classifyAnthropicError(event.error);
              console.error("Anthropic AI stream error:", event.error);
              yield { type: "error", ...classified };
              return;
            }
          }
        }
      } catch (error) {
        console.error("Anthropic AI service error:", error);
        const classified = classifyAnthropicError(error);
        yield { type: "error", ...classified };
      }
      return;
    }

    // OneProxy platform: 根据 model_name 判断走哪个原生协议
    if (config.platform === "oneproxy") {
      const protocol = resolveOneProxyProtocol(config.model_name);

      if (protocol === "google") {
        const { streamGoogleContent, classifyGoogleError } =
          await import("./google-genai");
        try {
          for await (const event of streamGoogleContent({
            client: getOneProxyGoogleClient(),
            modelName: config.model_name,
            contents: [{ role: "user", parts: [{ text: prompt }] }],
            systemInstruction: systemPrompt,
            thinkingConfig: { includeThoughts: true, thinkingLevel: "HIGH" },
            maxTokens: modelPolicy.maxTokens,
            temperature: calTemperature,
            topP: calTopP,
            topK: calTopK,
          })) {
            switch (event.type) {
              case "text-delta":
                yield { type: "chunk", content: event.text };
                break;
              case "reasoning-delta":
                yield { type: "reasoning", content: event.text };
                break;
              case "finish":
                yield {
                  type: "usage",
                  inputTokens: event.usage.inputTokens,
                  outputTokens: event.usage.outputTokens,
                };
                break;
              case "error": {
                const classified = classifyGoogleError(event.error);
                console.error("OneProxy/Google stream error:", event.error);
                yield { type: "error", ...classified };
                return;
              }
            }
          }
        } catch (error) {
          console.error("OneProxy/Google service error:", error);
          const classified = classifyGoogleError(error);
          yield { type: "error", ...classified };
        }
        return;
      }

      if (protocol === "openai") {
        const {
          streamOpenAIContent,
          convertMessagesToOpenAIInput,
          classifyOpenAIError,
        } = await import("./openai-sdk");
        const { input } = convertMessagesToOpenAIInput([
          { role: "user", content: prompt },
        ]);
        try {
          for await (const event of streamOpenAIContent({
            client: getOneProxyOpenAIClient(),
            modelName: config.model_name,
            input,
            instructions: systemPrompt,
            maxTokens: modelPolicy.maxTokens,
            temperature: calTemperature,
            reasoning: { effort: "high", summary: "detailed" },
          })) {
            switch (event.type) {
              case "text-delta":
                yield { type: "chunk", content: event.text };
                break;
              case "reasoning-delta":
                yield { type: "reasoning", content: event.text };
                break;
              case "finish":
                yield {
                  type: "usage",
                  inputTokens: event.usage.inputTokens,
                  outputTokens: event.usage.outputTokens,
                };
                break;
              case "error": {
                const classified = classifyOpenAIError(event.error);
                console.error("OneProxy/OpenAI stream error:", event.error);
                yield { type: "error", ...classified };
                return;
              }
            }
          }
        } catch (error) {
          console.error("OneProxy/OpenAI service error:", error);
          const classified = classifyOpenAIError(error);
          yield { type: "error", ...classified };
        }
        return;
      }

      if (protocol === "anthropic") {
        const { streamAnthropicContent, classifyAnthropicError } =
          await import("./anthropic-sdk");
        try {
          for await (const event of streamAnthropicContent({
            client: getOneProxyAnthropicClient(),
            modelName: config.model_name,
            messages: [{ role: "user", content: prompt }],
            systemBlocks: systemPrompt
              ? [{ type: "text", text: systemPrompt }]
              : [],
            maxTokens: modelPolicy.maxTokens ?? 16000,
            temperature: calTemperature,
            thinking: {
              type: "enabled",
              budget_tokens: Math.max(
                1024,
                (modelPolicy.maxTokens ?? 16000) - 1,
              ),
            },
          })) {
            switch (event.type) {
              case "text-delta":
                yield { type: "chunk", content: event.text };
                break;
              case "reasoning-delta":
                yield { type: "reasoning", content: event.text };
                break;
              case "finish":
                yield {
                  type: "usage",
                  inputTokens: event.usage.inputTokens,
                  outputTokens: event.usage.outputTokens,
                };
                break;
              case "error": {
                const classified = classifyAnthropicError(event.error);
                console.error("OneProxy/Anthropic stream error:", event.error);
                yield { type: "error", ...classified };
                return;
              }
            }
          }
        } catch (error) {
          console.error("OneProxy/Anthropic service error:", error);
          const classified = classifyAnthropicError(error);
          yield { type: "error", ...classified };
        }
        return;
      }

      // protocol === null: 无法识别的模型，fallthrough 到 Vercel AI SDK（走 OpenAI 兼容）
    }

    let outputText = "";
    let usageInputTokens: number | undefined;
    let usageOutputTokens: number | undefined;

    try {
      const result = streamText({
        model: resolveModel(config.model_name, config.platform),
        messages,
        ...(modelPolicy.providerOptions
          ? { providerOptions: modelPolicy.providerOptions }
          : {}),
        ...(modelPolicy.maxTokens ? { maxTokens: modelPolicy.maxTokens } : {}),
        ...(calTemperature != null ? { temperature: calTemperature } : {}),
      });

      for await (const part of result.fullStream) {
        if (part.type === "text-delta") {
          outputText += part.text;
          yield { type: "chunk", content: part.text };
        } else if (part.type === "reasoning-delta") {
          yield { type: "reasoning", content: part.text };
        } else if (part.type === "finish") {
          usageInputTokens = part.totalUsage.inputTokens;
          usageOutputTokens = part.totalUsage.outputTokens;
        } else if (part.type === "error") {
          const classified = classifyAIError(part.error);
          console.error("AI stream error:", part.error);
          yield { type: "error", ...classified };
          return;
        }
      }
    } catch (error) {
      console.error("AI service error:", error);
      const classified = classifyAIError(error);
      yield { type: "error", ...classified };
      return;
    }

    const inputText = (systemPrompt || "") + "\n" + prompt;
    yield {
      type: "usage",
      inputTokens:
        usageInputTokens ??
        estimateMessagesTokens([{ role: "user", content: inputText }]),
      outputTokens:
        usageOutputTokens ??
        estimateMessagesTokens([{ role: "assistant", content: outputText }]),
    };
  }
}

// ---------------------------------------------------------------------------
// AIGenerateService -- desktop prompt generation with credit management
// ---------------------------------------------------------------------------

class AIGenerateService {
  private ai = new GatewayAIService();

  async *generateDesktopPrompt(
    prompt: string,
    moduleTitle: string,
    llmConfigId?: number,
    modelTier?: string,
    userId?: number,
  ): AsyncGenerator<GenerateEvent> {
    console.log(
      `桌面端提示词直传生成: 模块=${moduleTitle}, model_tier=${modelTier}`,
    );

    // Resolve config id from model_tier when no explicit id is given
    let actualConfigId = llmConfigId;
    if (!llmConfigId && modelTier) {
      const tierConfig = await prisma.llm_config.findFirst({
        where: { model_tier: modelTier, enabled: 1 },
        orderBy: { id: "asc" },
        select: { id: true },
      });
      if (tierConfig) {
        actualConfigId = Number(tierConfig.id);
        console.log(
          `根据 model_tier=${modelTier} 选择模型配置 ID=${actualConfigId}`,
        );
      }
    }

    // Check model tier access
    if (userId && actualConfigId) {
      try {
        const configForTier = await prisma.llm_config.findUnique({
          where: { id: BigInt(actualConfigId) },
          select: { model_tier: true, display_name: true },
        });
        const tier = configForTier?.model_tier || "economy";
        const { canUserAccessModelTier } =
          await import("./subscription-service");
        if (!(await canUserAccessModelTier(BigInt(userId), tier))) {
          yield {
            event: "error",
            data: {
              error: `当前订阅计划不支持使用${configForTier?.display_name || "该模型"}，请升级订阅`,
              code: "MODEL_TIER_RESTRICTED",
            },
          };
          return;
        }
      } catch (error) {
        console.error(`模型等级权限检查异常: ${error}`);
      }
    }

    // Pre-check credits
    if (userId) {
      try {
        const estInputTokens = estimateMessagesTokens([
          { role: "user", content: prompt },
        ]);
        const { inputPricePerM, outputPricePerM } =
          await getConfigParams(actualConfigId);
        const estimatedCredits = calculateCredits(
          estInputTokens,
          800,
          inputPricePerM,
          outputPricePerM,
        );

        const { hasEnoughCredits } = await import("./credit-service");
        if (!(await hasEnoughCredits(BigInt(userId), estimatedCredits))) {
          yield {
            event: "error",
            data: {
              error: "积分不足，请充值后再试",
              code: "INSUFFICIENT_CREDITS",
            },
          };
          return;
        }
      } catch (error) {
        console.error(`积分预检异常: ${error}`);
      }
    }

    // Stream generation
    let fullContent = "";
    let inputTokens = 0;
    let outputTokens = 0;

    for await (const item of this.ai.streamTextFromProxy(
      prompt,
      undefined,
      actualConfigId,
    )) {
      if (item.type === "chunk") {
        fullContent += item.content;
        yield { event: "chunk", data: { content: item.content } };
      } else if (item.type === "reasoning") {
        yield { event: "reasoning", data: { content: item.content } };
      } else if (item.type === "usage") {
        inputTokens = item.inputTokens;
        outputTokens = item.outputTokens;
      } else if (item.type === "error") {
        yield {
          event: "error",
          data: {
            error: item.message,
            code: item.code,
            retryable: item.retryable,
          },
        };
        return;
      }
    }

    // Extract JSON from generated content
    const extractedJson = extractJson(fullContent);
    if (extractedJson) {
      yield { event: "json", data: { content: extractedJson } };
    }

    // Deduct credits
    let creditsConsumed = 0;
    let completionStatus = "done";
    if (userId) {
      const {
        inputPricePerM,
        outputPricePerM,
        configId: finalConfigId,
      } = await getConfigParams(actualConfigId);
      creditsConsumed = calculateCredits(
        inputTokens,
        outputTokens,
        inputPricePerM,
        outputPricePerM,
      );

      const { consumeCreditsWithTransaction, recordCreditDebt } =
        await import("./credit-service");

      try {
        const deducted = await consumeCreditsWithTransaction(
          BigInt(userId),
          creditsConsumed,
          "AI_GENERATE_DESKTOP_PROMPT",
          finalConfigId ? BigInt(finalConfigId) : undefined,
          inputTokens,
          outputTokens,
          inputPricePerM,
          outputPricePerM,
          `桌面端AI生成: ${moduleTitle}`,
        );
        if (!deducted) {
          await recordCreditDebt(
            BigInt(userId),
            creditsConsumed,
            "AI_GENERATE_DESKTOP_PROMPT",
            `桌面端AI生成扣费失败，已记入欠费: ${moduleTitle}`,
          );
          completionStatus = "done_with_debt";
        }
      } catch (error) {
        console.error(`积分扣减失败: ${error}`);
        try {
          await recordCreditDebt(
            BigInt(userId),
            creditsConsumed,
            "AI_GENERATE_DESKTOP_PROMPT",
            `桌面端AI生成扣费异常，已记入欠费: ${moduleTitle}`,
          );
          completionStatus = "done_with_debt";
        } catch (debtError) {
          console.error(`记录积分欠费失败: ${debtError}`);
        }
      }
    }

    yield {
      event: "complete",
      data: {
        status: completionStatus,
        usage: {
          inputTokens,
          outputTokens,
          creditsConsumed,
        },
      },
    };
  }
}

// ---------------------------------------------------------------------------
// Singleton exports
// ---------------------------------------------------------------------------

export const proxyAIService = new GatewayAIService();
export const aiGenerateService = new AIGenerateService();
