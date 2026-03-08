type JsonPrimitive = string | number | boolean | null;
type JsonValue = JsonPrimitive | JsonObject | JsonArray;
type JsonObject = { [key: string]: JsonValue | undefined };
type JsonArray = JsonValue[];

export type ReasoningProviderOptions = Record<string, JsonObject>;

export interface ModelRequestPolicy {
  providerOptions?: ReasoningProviderOptions;
  maxTokens?: number;
  allowTools: boolean;
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
  };
}

export function shouldSendTools(modelName: string, provider: string): boolean {
  return resolveModelRequestPolicy(modelName, provider).allowTools;
}

export function buildReasoningProviderOptions(
  modelName: string,
  provider: string,
): ReasoningProviderOptions | undefined {
  return resolveModelRequestPolicy(modelName, provider).providerOptions;
}

/**
 * 按模型名称返回固定采样参数（temperature / topP / topK）。
 */
export function calibrateTemperatureForProvider(modelName: string): {
  temperature: number | undefined;
  topP?: number;
  topK?: number;
} {
  const id = (modelName ?? "").toLowerCase();

  // temperature
  let temperature: number | undefined;
  if (id.includes("claude")) {
    temperature = undefined;
  } else if (id.includes("qwen")) {
    temperature = 0.55;
  } else if (id.includes("gemini")) {
    temperature = 1.0;
  } else if (id.includes("glm-4")) {
    temperature = 1.0;
  } else if (id.includes("minimax-m2")) {
    temperature = 1.0;
  } else if (id.includes("kimi-k2")) {
    if (["thinking", "k2.", "k2p", "k2-5"].some((s) => id.includes(s))) {
      temperature = 1.0;
    } else {
      temperature = 0.6;
    }
  } else {
    temperature = undefined;
  }

  // topP
  let topP: number | undefined;
  if (id.includes("qwen")) {
    topP = 1;
  } else if (
    ["minimax-m2", "gemini", "kimi-k2.5", "kimi-k2p5", "kimi-k2-5"].some((s) =>
      id.includes(s),
    )
  ) {
    topP = 0.95;
  }

  // topK
  let topK: number | undefined;
  if (id.includes("minimax-m2")) {
    if (["m2.", "m25", "m21"].some((s) => id.includes(s))) {
      topK = 40;
    } else {
      topK = 20;
    }
  } else if (id.includes("gemini")) {
    topK = 64;
  }

  return { temperature, topP, topK };
}
