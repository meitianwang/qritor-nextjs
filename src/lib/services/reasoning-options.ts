type JsonPrimitive = string | number | boolean | null
type JsonValue = JsonPrimitive | JsonObject | JsonArray
type JsonObject = { [key: string]: JsonValue | undefined }
type JsonArray = JsonValue[]

export type ReasoningProviderOptions = Record<string, JsonObject>
type ReasoningProviderName =
  | 'anthropic'
  | 'openai'
  | 'google'
  | 'xai'
  | 'deepseek'
  | 'moonshotai'

export interface ModelRequestPolicy {
  resolvedModelName: string
  providerOptions?: ReasoningProviderOptions
  allowTools: boolean
  allowTemperature: boolean
}

type ModelPolicyOverride = Partial<Omit<ModelRequestPolicy, 'resolvedModelName'>>

const MODEL_ALIASES: Record<string, string> = {
  // Gateway currently exposes this as preview model id.
  'google/gemini-3-pro': 'google/gemini-3-pro-preview',
}

const TEMPERATURE_DISABLED_MODELS = new Set<string>([
  'xai/grok-4-fast-reasoning',
  'xai/grok-4.1-fast-reasoning',
  'xai/grok-4-fast-non-reasoning',
  'xai/grok-4.1-fast-non-reasoning',
])

function createOpenAIReasoningOptions(
  isGpt5Family: boolean,
): ReasoningProviderOptions {
  return {
    openai: {
      reasoningEffort: isGpt5Family ? 'high' : 'medium',
      reasoningSummary: isGpt5Family ? 'detailed' : 'auto',
    },
  }
}

function createAnthropicThinkingOptions(
  budgetTokens = 12000,
): ReasoningProviderOptions {
  return {
    anthropic: {
      thinking: { type: 'enabled', budgetTokens },
    },
  }
}

function createGoogleThinkingOptions(
  thinkingLevel: 'minimal' | 'low' | 'medium' | 'high' = 'medium',
): ReasoningProviderOptions {
  return {
    google: {
      // Official AI SDK pattern: google.thinkingConfig
      thinkingConfig: {
        includeThoughts: true,
        thinkingLevel,
      },
    },
  }
}

function createDeepSeekReasoningOptions(): ReasoningProviderOptions {
  return {
    deepseek: {
      thinking: { type: 'enabled' },
    },
  }
}

function createMoonshotThinkingOptions(
  budgetTokens = 2048,
): ReasoningProviderOptions {
  return {
    moonshotai: {
      thinking: { type: 'enabled', budgetTokens },
      reasoningHistory: 'interleaved',
    },
  }
}

// Explicit policy matrix for currently integrated models (excluding GLM on purpose).
const MODEL_POLICY_OVERRIDES: Record<string, ModelPolicyOverride> = {
  'xai/grok-4.1-fast-reasoning': {
    // Gateway routes this family through xAI Responses API.
    // Responses API tools are server-side only and cannot use client function tools.
    allowTools: false,
    allowTemperature: false,
  },
  'xai/grok-4.1-fast-non-reasoning': {
    allowTools: false,
    allowTemperature: false,
  },
  'xai/grok-4-fast-reasoning': {
    allowTools: false,
    allowTemperature: false,
  },
  'xai/grok-4-fast-non-reasoning': {
    allowTools: false,
    allowTemperature: false,
  },
  'deepseek/deepseek-v3.2-thinking': {
    allowTools: true,
    allowTemperature: true,
    providerOptions: createDeepSeekReasoningOptions(),
  },
  'minimax/minimax-m2.5': {
    allowTools: true,
    allowTemperature: true,
  },
  'google/gemini-3-flash': {
    allowTools: true,
    allowTemperature: true,
    providerOptions: createGoogleThinkingOptions('medium'),
  },
  'moonshotai/kimi-k2.5': {
    allowTools: true,
    allowTemperature: true,
    providerOptions: createMoonshotThinkingOptions(),
  },
  'openai/gpt-5.2': {
    allowTools: true,
    allowTemperature: false,
    providerOptions: createOpenAIReasoningOptions(true),
  },
  'google/gemini-3-pro-preview': {
    allowTools: true,
    allowTemperature: true,
    providerOptions: createGoogleThinkingOptions('high'),
  },
  'anthropic/claude-sonnet-4.5': {
    allowTools: true,
    allowTemperature: false,
    providerOptions: createAnthropicThinkingOptions(),
  },
  'anthropic/claude-opus-4.6': {
    allowTools: true,
    allowTemperature: false,
    providerOptions: createAnthropicThinkingOptions(),
  },
}

function normalizeModelName(modelName: string): string {
  return modelName.trim().toLowerCase()
}

function splitModelName(modelName: string): {
  provider: string
  model: string
} {
  const [provider = '', ...rest] = normalizeModelName(modelName).split('/')
  return {
    provider,
    model: rest.join('/'),
  }
}

export function resolveGatewayModelName(modelName: string): string {
  const normalized = normalizeModelName(modelName)
  if (!normalized) return modelName
  return MODEL_ALIASES[normalized] ?? normalized
}

function createProviderOptions(
  provider: string,
  model: string,
): ReasoningProviderOptions | undefined {
  const isOpenAIReasoningModel =
    /(^|[-_])(gpt-?5|o1|o3|o4|codex)([._-]|$)/.test(model)
  const isOpenAIGpt5Family = /(^|[-_])gpt-?5([._-]|$)/.test(model)

  switch (provider as ReasoningProviderName) {
    case 'anthropic': {
      // Claude reasoning needs explicit thinking enablement + budget.
      if (/claude-(opus|sonnet|haiku)-4|claude-3-7/.test(model)) {
        return createAnthropicThinkingOptions()
      }
      return undefined
    }

    case 'openai': {
      // OpenAI reasoning summaries are not returned unless reasoningSummary is set.
      if (isOpenAIReasoningModel) {
        return createOpenAIReasoningOptions(isOpenAIGpt5Family)
      }
      return undefined
    }

    case 'google': {
      if (/gemini-(2\.5|3)/.test(model)) {
        return createGoogleThinkingOptions('high')
      }
      return undefined
    }

    case 'xai': {
      // Gateway xAI responses models currently do not need extra provider options.
      return undefined
    }

    case 'deepseek': {
      return undefined
    }

    case 'moonshotai': {
      if (/kimi-k2(\.5)?-thinking/.test(model)) {
        return createMoonshotThinkingOptions()
      }
      return undefined
    }

    default:
      return undefined
  }
}

export function resolveModelRequestPolicy(modelName: string): ModelRequestPolicy {
  const resolvedModelName = resolveGatewayModelName(modelName)
  const { provider, model } = splitModelName(resolvedModelName)
  const isOpenAIReasoningModel =
    provider === 'openai' &&
    /(^|[-_])(gpt-?5|o1|o3|o4|codex)([._-]|$)/.test(model)
  const isTemperatureDisabledByModel =
    TEMPERATURE_DISABLED_MODELS.has(resolvedModelName)

  const basePolicy: ModelRequestPolicy = {
    resolvedModelName,
    providerOptions: createProviderOptions(provider, model),
    allowTools: true,
    // OpenAI reasoning models and current Grok 4 fast variants are safest without temperature.
    allowTemperature: !isOpenAIReasoningModel && !isTemperatureDisabledByModel,
  }

  const override = MODEL_POLICY_OVERRIDES[resolvedModelName]
  if (!override) return basePolicy

  return {
    ...basePolicy,
    ...override,
  }
}

export function shouldSendTools(modelName: string): boolean {
  return resolveModelRequestPolicy(modelName).allowTools
}

/**
 * Build providerOptions that enable reasoning output for providers/models
 * that require explicit opt-in.
 */
export function buildReasoningProviderOptions(
  modelName: string,
): ReasoningProviderOptions | undefined {
  return resolveModelRequestPolicy(modelName).providerOptions
}
