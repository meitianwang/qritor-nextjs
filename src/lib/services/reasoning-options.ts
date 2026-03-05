type JsonPrimitive = string | number | boolean | null;
type JsonValue = JsonPrimitive | JsonObject | JsonArray;
type JsonObject = { [key: string]: JsonValue | undefined };
type JsonArray = JsonValue[];

export type ReasoningProviderOptions = Record<string, JsonObject>;

export interface ModelRequestPolicy {
  providerOptions?: ReasoningProviderOptions;
  maxTokens?: number;
  allowTools: boolean;
  /** 服务端决定的温度，不依赖桌面端传入 */
  temperature: number;
}

/**
 * 根据 provider 生成对应的 thinking/reasoning 选项。
 */
function createProviderOptions(
  provider: string,
): ReasoningProviderOptions | undefined {
  switch (provider) {
    case "anthropic":
      return {
        anthropic: {
          thinking: { type: "adaptive" },
        },
      };

    case "openai":
      return {
        openai: {
          reasoningEffort: "high",
          reasoningSummary: "detailed",
        },
      };

    case "deepseek":
      return {
        deepseek: {
          thinking: { type: "enabled" },
        },
      };

    case "moonshotai":
      return {
        moonshotai: {
          thinking: { type: "enabled", budgetTokens: 16000 },
          reasoningHistory: "interleaved",
        },
      };

    default:
      return undefined;
  }
}

function getTemperature(provider: string): number {
  switch (provider) {
    case "moonshotai":
      return 1.0;
    default:
      return 0.7;
  }
}

export function resolveModelRequestPolicy(
  modelName: string,
  provider: string,
): ModelRequestPolicy {
  const normalizedProvider = provider.trim().toLowerCase();
  const providerOptions = createProviderOptions(normalizedProvider);

  return {
    providerOptions,
    maxTokens: providerOptions ? 16000 : undefined,
    allowTools: true,
    temperature: getTemperature(normalizedProvider),
  };
}

export function shouldSendTools(
  modelName: string,
  provider: string,
): boolean {
  return resolveModelRequestPolicy(modelName, provider).allowTools;
}

export function buildReasoningProviderOptions(
  modelName: string,
  provider: string,
): ReasoningProviderOptions | undefined {
  return resolveModelRequestPolicy(modelName, provider).providerOptions;
}
