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
 * 根据模型名称推断 Vercel AI SDK 的 thinking/reasoning 选项。
 * 不再依赖 llm_config.provider（该字段现在只表示上游 API 协议）。
 */
function createProviderOptions(
  modelName: string,
): ReasoningProviderOptions | undefined {
  const id = modelName.toLowerCase();

  if (id.includes("claude")) {
    return {
      anthropic: {
        thinking: { type: "adaptive" },
      },
    };
  }

  if (id.includes("gpt") || id.includes("o1") || id.includes("o3") || id.includes("o4")) {
    return {
      openai: {
        reasoningEffort: "high",
        reasoningSummary: "detailed",
      },
    };
  }

  if (id.includes("deepseek")) {
    return {
      deepseek: {
        thinking: { type: "enabled" },
      },
    };
  }

  if (id.includes("kimi") || id.includes("moonshot")) {
    return {
      moonshotai: {
        thinking: { type: "enabled", budgetTokens: 16000 },
        reasoningHistory: "interleaved",
      },
    };
  }

  return undefined;
}

export function resolveModelRequestPolicy(
  modelName: string,
): ModelRequestPolicy {
  const providerOptions = createProviderOptions(modelName);

  return {
    providerOptions,
    maxTokens: providerOptions ? 16000 : undefined,
    allowTools: true,
  };
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
