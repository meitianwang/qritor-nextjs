/**
 * Anthropic Messages API 代理端点
 *
 * 所有模型统一走 Anthropic Messages API 协议。
 * 每个 provider 在 llm_config 中配置自己的 base_url 和 api_key。
 *
 * 职责：
 * 1. 验证用户身份（x-api-key = qritor access token）
 * 2. 根据 x-llm-config-id 查配置，获取上游 base_url 和 api_key
 * 3. 订阅等级检查 + 积分预检
 * 4. 透传 Anthropic Messages API 请求，流式转发响应
 * 5. 提取 token 用量，完成后扣费（失败记欠费）
 */

import { NextRequest, NextResponse } from "next/server";
import { decodeToken } from "@/lib/auth";
import { deductLlmCredits } from "@/lib/services/llm-credit-settle";
import { getConfigById } from "@/lib/services/ai-service";
import { canUserAccessModelTier } from "@/lib/services/subscription-service";
import { hasEnoughCredits } from "@/lib/services/credit-service";
import { calculateCredits, getConfigParams } from "@/lib/services/token-calculator";

export const dynamic = "force-dynamic";
export const maxDuration = 300;

// 默认 fallback（仅当 config 中无 base_url / api_key 时使用）
const FALLBACK_API_KEY = process.env.ANTHROPIC_API_KEY ?? "";
const FALLBACK_BASE_URL = (
  process.env.ANTHROPIC_BASE_URL ?? "https://api.anthropic.com"
).replace(/\/v1\/?$/, "");

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
  const upstreamBaseUrl = (config.base_url || FALLBACK_BASE_URL).replace(/\/v1\/?$/, "");
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

  // 6. 读取原始请求体
  const body = await request.text();

  // LiteLLM 要求 max_tokens 为必填，但新版 Anthropic SDK 可能不发送该字段
  // 根据模型的 context_window 推导合理默认值（输出上限一般为上下文窗口的 1/4，cap 在 64k）
  let finalBody = body;
  try {
    const parsed = JSON.parse(body);
    if (!parsed.max_tokens) {
      const ctxWindow = config.context_window || 200000;
      parsed.max_tokens = Math.min(Math.floor(ctxWindow / 4), 64000);
      finalBody = JSON.stringify(parsed);
    }
  } catch { /* ignore */ }

  // 7. 构建转发请求头
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

  // 8. 转发到上游
  const upstreamUrl = `${upstreamBaseUrl}/v1/messages`;

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

  // 9. 非 2xx 直接透传
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

  // 10. 判断是否流式
  const contentType = upstreamResponse.headers.get("content-type") ?? "";
  const isStreaming = contentType.includes("text/event-stream");

  if (!isStreaming) {
    const responseBody = await upstreamResponse.text();
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

  // 11. 流式：透传 + 提取 usage 扣费
  const upstreamBody = upstreamResponse.body;
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
