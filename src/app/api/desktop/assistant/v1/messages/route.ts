/**
 * Anthropic Messages API 代理端点
 *
 * 根据 llm_config.provider 字段判断上游 API 协议：
 * - provider = 'anthropic'（或空）→ 直接转发 Anthropic Messages API
 * - provider = 'openai' → 用 @musistudio/llms 做 Anthropic ↔ OpenAI 协议转换
 *
 * 职责：
 * 1. 验证用户身份（x-api-key = qritor access token）
 * 2. 根据 x-llm-config-id 查配置，获取上游 base_url、api_key、provider
 * 3. 订阅等级检查 + 积分预检
 * 4. 根据 provider 选择转发路径
 * 5. 提取 token 用量，完成后扣费
 */

import { NextRequest, NextResponse } from "next/server";
import { decodeToken } from "@/lib/auth";
import { deductLlmCredits } from "@/lib/services/llm-credit-settle";
import { getConfigById } from "@/lib/services/ai-service";
import { canUserAccessModelTier } from "@/lib/services/subscription-service";
import { hasEnoughCredits } from "@/lib/services/credit-service";
import { calculateCredits, getConfigParams } from "@/lib/services/token-calculator";
import { AnthropicTransformer, VercelTransformer } from "@/lib/llm-transformer";

export const dynamic = "force-dynamic";
export const maxDuration = 300;

// 默认 fallback（仅当 config 中无 base_url / api_key 时使用）
const FALLBACK_API_KEY = process.env.ANTHROPIC_API_KEY ?? "";
const FALLBACK_BASE_URL = (
  process.env.ANTHROPIC_BASE_URL ?? "https://api.anthropic.com"
).replace(/\/v1\/?$/, "");

// 单例 transformer（无状态，可复用）
const anthropicTransformer = new AnthropicTransformer();
const vercelTransformer = new VercelTransformer();

export async function POST(request: NextRequest) {
  // 1. 验证用户身份
  const token = request.headers.get("x-api-key");
  if (!token) {
    return NextResponse.json({ error: "Missing authentication" }, { status: 401 });
  }

  const payload = await decodeToken(token);
  if (!payload?.sub) {
    return NextResponse.json({ error: "Invalid or expired token" }, { status: 401 });
  }
  const userId = BigInt(payload.sub);

  // 2. 从 header 获取 llmConfigId，查数据库获取配置
  const llmConfigIdStr = request.headers.get("x-llm-config-id");
  const llmConfigId = llmConfigIdStr ? parseInt(llmConfigIdStr, 10) : undefined;

  const config = await getConfigById(llmConfigId);
  if (!config) {
    return NextResponse.json(
      { error: "No LLM config found" },
      { status: 400 },
    );
  }

  // 3. 解析上游地址和 API Key
  const upstreamApiKey = config.api_key || FALLBACK_API_KEY;

  if (!upstreamApiKey) {
    return NextResponse.json(
      { error: `模型 "${config.display_name ?? config.model_name}" 未配置 API Key` },
      { status: 400 },
    );
  }

  // 4. 订阅等级检查
  const modelTier = config.model_tier || "economy";
  if (!(await canUserAccessModelTier(userId, modelTier))) {
    return NextResponse.json(
      {
        error: `当前订阅计划不支持使用${config.display_name ?? config.model_name}，请升级订阅`,
      },
      { status: 403 },
    );
  }

  // 5. 积分预检（粗估）
  try {
    const { inputPricePerM, outputPricePerM } = await getConfigParams(llmConfigId);
    const estimatedCredits = calculateCredits(2000, 1000, inputPricePerM, outputPricePerM);
    if (!(await hasEnoughCredits(userId, estimatedCredits))) {
      return NextResponse.json(
        { error: "积分不足，请充值后再试" },
        { status: 402 },
      );
    }
  } catch (error) {
    console.error("[assistant-proxy] credit pre-check error:", error);
  }

  // 6. 读取并预处理请求体
  const body = await request.text();
  let parsedBody: any;
  try {
    parsedBody = JSON.parse(body);
  } catch {
    return NextResponse.json({ error: "Invalid JSON body" }, { status: 400 });
  }

  // 补充 max_tokens（新版 Anthropic SDK 可能不发送）
  if (!parsedBody.max_tokens) {
    const ctxWindow = config.context_window || 200000;
    parsedBody.max_tokens = Math.min(Math.floor(ctxWindow / 4), 64000);
  }

  // 7. 根据 provider 字段选择协议路径
  const isOpenAIProtocol = config.provider === "openai";

  if (isOpenAIProtocol) {
    return handleOpenAIProtocol(parsedBody, config, upstreamApiKey, userId, llmConfigId);
  } else {
    return handleAnthropicProtocol(parsedBody, config, upstreamApiKey, request, userId, llmConfigId);
  }
}

// ============================================================
// Anthropic 协议路径：直接转发
// ============================================================

async function handleAnthropicProtocol(
  parsedBody: any,
  config: any,
  upstreamApiKey: string,
  request: NextRequest,
  userId: bigint,
  llmConfigId: number | undefined,
) {
  const upstreamBaseUrl = (config.base_url || FALLBACK_BASE_URL).replace(/\/v1\/?$/, "");
  const upstreamUrl = `${upstreamBaseUrl}/v1/messages`;
  const finalBody = JSON.stringify(parsedBody);

  const forwardHeaders: Record<string, string> = {
    "content-type": "application/json",
    "x-api-key": upstreamApiKey,
  };

  for (const key of ["anthropic-version", "anthropic-beta"]) {
    const value = request.headers.get(key);
    if (value) {
      forwardHeaders[key] = value;
    }
  }

  let upstreamResponse: Response;
  try {
    upstreamResponse = await fetch(upstreamUrl, {
      method: "POST",
      headers: forwardHeaders,
      body: finalBody,
    });
  } catch (error) {
    console.error("[assistant-proxy] upstream request failed:", error);
    return NextResponse.json(
      { error: "Failed to connect to upstream API" },
      { status: 502 },
    );
  }

  if (!upstreamResponse.ok) {
    const errorBody = await upstreamResponse.text();
    return new Response(errorBody, {
      status: upstreamResponse.status,
      headers: {
        "content-type":
          upstreamResponse.headers.get("content-type") ?? "application/json",
      },
    });
  }

  return forwardAnthropicResponse(upstreamResponse, userId, llmConfigId);
}

// ============================================================
// OpenAI 协议路径：Anthropic → OpenAI 转换 → 上游 → OpenAI → Anthropic 转换
// ============================================================

async function handleOpenAIProtocol(
  parsedBody: any,
  config: any,
  upstreamApiKey: string,
  userId: bigint,
  llmConfigId: number | undefined,
) {
  // base_url 是完整的 OpenAI 端点 URL（含 /chat/completions）
  const upstreamUrl = config.base_url;
  if (!upstreamUrl) {
    return NextResponse.json(
      { error: "OpenAI 协议模型必须配置 base_url" },
      { status: 400 },
    );
  }

  // 1. Anthropic 请求 → UnifiedChatRequest（OpenAI 格式）
  let unifiedRequest: any;
  try {
    unifiedRequest = await anthropicTransformer.transformRequestOut(parsedBody);
  } catch (error) {
    console.error("[assistant-proxy] transformRequestOut failed:", error);
    return NextResponse.json(
      { error: "Failed to transform request" },
      { status: 500 },
    );
  }

  // 2. Provider 适配（VercelTransformer 处理 reasoning 字段等）
  try {
    unifiedRequest = await vercelTransformer.transformRequestIn(unifiedRequest);
  } catch (error) {
    console.error("[assistant-proxy] transformRequestIn failed:", error);
    // 非致命，继续
  }

  // 3. 发送到 OpenAI 兼容上游
  let upstreamResponse: Response;
  try {
    upstreamResponse = await fetch(upstreamUrl, {
      method: "POST",
      headers: {
        "content-type": "application/json",
        "authorization": `Bearer ${upstreamApiKey}`,
      },
      body: JSON.stringify(unifiedRequest),
    });
  } catch (error) {
    console.error("[assistant-proxy] upstream request failed:", error);
    return NextResponse.json(
      { error: "Failed to connect to upstream API" },
      { status: 502 },
    );
  }

  if (!upstreamResponse.ok) {
    const errorBody = await upstreamResponse.text();
    console.error(`[assistant-proxy] upstream error (${upstreamResponse.status}):`, errorBody.slice(0, 500));
    return NextResponse.json(
      { error: `Upstream API error: ${upstreamResponse.status}` },
      { status: upstreamResponse.status },
    );
  }

  // 4. Provider 响应适配（reasoning → thinking 翻译）
  try {
    upstreamResponse = await vercelTransformer.transformResponseOut(upstreamResponse);
  } catch (error) {
    console.error("[assistant-proxy] transformResponseOut failed:", error);
    return NextResponse.json(
      { error: "Failed to transform response" },
      { status: 500 },
    );
  }

  // 5. OpenAI 响应 → Anthropic 响应（含流式 SSE 翻译）
  let anthropicResponse: Response;
  try {
    anthropicResponse = await anthropicTransformer.transformResponseIn(upstreamResponse);
  } catch (error) {
    console.error("[assistant-proxy] transformResponseIn failed:", error);
    return NextResponse.json(
      { error: "Failed to transform response to Anthropic format" },
      { status: 500 },
    );
  }

  return forwardAnthropicResponse(anthropicResponse, userId, llmConfigId);
}

// ============================================================
// 共用：转发 Anthropic 格式响应 + 提取 usage 扣费
// ============================================================

function forwardAnthropicResponse(
  response: Response,
  userId: bigint,
  llmConfigId: number | undefined,
) {
  const contentType = response.headers.get("content-type") ?? "";
  const isStreaming = contentType.includes("text/event-stream");

  if (!isStreaming) {
    return handleNonStreamingResponse(response, userId, llmConfigId);
  }

  return handleStreamingResponse(response, userId, llmConfigId);
}

async function handleNonStreamingResponse(
  response: Response,
  userId: bigint,
  llmConfigId: number | undefined,
) {
  const responseBody = await response.text();
  try {
    const parsed = JSON.parse(responseBody);
    const usage = parsed.usage;
    if (usage) {
      deductLlmCredits({
        userId,
        configId: llmConfigId,
        inputTokens: usage.input_tokens ?? 0,
        outputTokens: usage.output_tokens ?? 0,
        logTag: "assistant-proxy",
      }).catch((e) =>
        console.error("[assistant-proxy] credit deduction error:", e),
      );
    }
  } catch {
    // 解析失败不影响响应
  }
  return new Response(responseBody, {
    status: 200,
    headers: { "content-type": "application/json" },
  });
}

function handleStreamingResponse(
  response: Response,
  userId: bigint,
  llmConfigId: number | undefined,
) {
  const upstreamBody = response.body;
  if (!upstreamBody) {
    return NextResponse.json(
      { error: "Empty response body from upstream" },
      { status: 502 },
    );
  }

  let inputTokens = 0;
  let outputTokens = 0;

  const { readable, writable } = new TransformStream();
  const writer = writable.getWriter();
  const reader = upstreamBody.getReader();
  const decoder = new TextDecoder();
  const encoder = new TextEncoder();

  (async () => {
    let buffer = "";
    try {
      for (;;) {
        const { done, value } = await reader.read();
        if (done) break;

        const chunk = decoder.decode(value, { stream: true });
        await writer.write(encoder.encode(chunk));

        buffer += chunk;
        const lines = buffer.split("\n");
        buffer = lines.pop() ?? "";

        for (const line of lines) {
          if (!line.startsWith("data: ")) continue;
          const data = line.slice(6).trim();
          if (!data || data === "[DONE]") continue;
          try {
            const event = JSON.parse(data);
            if (event.type === "message_start" && event.message?.usage) {
              inputTokens = event.message.usage.input_tokens ?? 0;
            }
            if (event.type === "message_delta" && event.usage) {
              outputTokens = event.usage.output_tokens ?? 0;
            }
          } catch {
            // 忽略
          }
        }
      }
    } catch (error) {
      console.error("[assistant-proxy] stream error:", error);
    } finally {
      await writer.close();

      if (inputTokens > 0 || outputTokens > 0) {
        deductLlmCredits({
          userId,
          configId: llmConfigId,
          inputTokens,
          outputTokens,
          logTag: "assistant-proxy-stream",
        }).catch((e) =>
          console.error("[assistant-proxy] credit deduction error:", e),
        );
      }
    }
  })();

  return new Response(readable, {
    status: 200,
    headers: {
      "content-type": "text/event-stream",
      "cache-control": "no-cache",
      connection: "keep-alive",
    },
  });
}
