import { createGateway } from "ai";
import { prisma } from "@/lib/prisma";

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

export interface LlmConfigRow {
  id: bigint;
  model_name: string;
  display_name: string | null;
  provider: string;
  base_url: string | null;
  api_key: string | null;
  model_tier: string | null;
  is_default: number | null;
  enabled: number | null;
  input_price_per_m: number | null;
  output_price_per_m: number | null;
  context_window: number | null;
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

const gateway = createGateway({
  apiKey: process.env.AI_GATEWAY_API_KEY ?? "",
});

export function resolveModel(modelName: string) {
  const resolved = gateway(modelName);

  console.log(
    `[resolveModel] model=${modelName}, provider=${resolved.provider}, modelId=${resolved.modelId}`,
  );
  return resolved;
}
