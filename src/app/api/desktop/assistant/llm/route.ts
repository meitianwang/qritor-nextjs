import { NextRequest, NextResponse } from "next/server";
import { jsonSchema } from "ai";
import { getCurrentUser } from "@/lib/middleware/auth-middleware";
import { getConfigById } from "@/lib/services/ai-service";
import { resolveModelRequestPolicy } from "@/lib/services/reasoning-options";
import {
  calculateCredits,
  estimateMessagesTokens,
  getConfigParams,
} from "@/lib/services/token-calculator";
import { hasEnoughCredits } from "@/lib/services/credit-service";
import { classifyAIError } from "@/lib/services/ai-error-classifier";
import { sanitizeToolMessages } from "@/lib/services/llm-message-preprocessor";
import {
  preprocessAnthropicMessages,
  handleAnthropicStream,
} from "@/lib/services/desktop-llm-handler-anthropic";
import { handleOpenAIStream } from "@/lib/services/desktop-llm-handler-openai";
import { handleGoogleStream } from "@/lib/services/desktop-llm-handler-google";
import { handleVercelStream } from "@/lib/services/desktop-llm-handler-vercel";

export const dynamic = "force-dynamic";

function jsonError(status: number, message: string) {
  return NextResponse.json({ code: status, data: null, message }, { status });
}

/**
 * 桌面端 LLM 代理 — 纯透传 + 积分扣减
 *
 * 桌面端发送 AI SDK CoreMessage 格式的 messages，
 * 服务端直传给 streamText，用 toUIMessageStreamResponse() 返回。
 * 积分扣减在流结束后异步执行。
 */
export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request);
    const body = await request.json();

    const configId: number | undefined = body.llm_config_id ?? body.llmConfigId;

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const messages = body.messages as any[];
    if (!messages?.length) return jsonError(400, "缺少 messages");

    // tools: 桌面端发来 { name: { description, inputSchema } }
    // 仅需 jsonSchema() 恢复为 AI SDK schema（跨 HTTP 无法直接传递 symbol）
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    let tools: any = undefined;
    if (body.tools && typeof body.tools === "object") {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      tools = {} as Record<string, any>;
      for (const [name, def] of Object.entries(
        body.tools as Record<
          string,
          {
            description?: string;
            inputSchema?: Record<string, unknown>;
          }
        >,
      )) {
        if (!def.inputSchema) {
          return jsonError(400, `工具 ${name} 缺少 inputSchema`);
        }

        tools[name] = {
          ...(def.description ? { description: def.description } : {}),
          inputSchema: jsonSchema(def.inputSchema),
        };
      }
    }

    const config = await getConfigById(configId);
    if (!config) return jsonError(400, "没有可用的 LLM 配置");

    // Check model tier access
    const configTier = config.model_tier || "economy";
    const { canUserAccessModelTier } =
      await import("@/lib/services/subscription-service");
    if (!(await canUserAccessModelTier(user.id, configTier))) {
      return jsonError(403, "当前订阅计划不支持使用该模型，请升级订阅");
    }

    const modelPolicy = resolveModelRequestPolicy(
      config.model_name,
      config.provider,
    );
    const toolsForModel = modelPolicy.allowTools ? tools : undefined;

    // Anthropic 预处理（prompt caching + 内容清洗）
    const isAnthropic = config.provider?.toLowerCase() === "anthropic";
    if (isAnthropic) {
      preprocessAnthropicMessages(messages, toolsForModel);
    }

    console.log(
      `[LLM] Request: model=${config.model_name}, messages=${messages.length}, toolsIn=${tools ? Object.keys(tools).length : 0}, toolsForwarded=${toolsForModel ? Object.keys(toolsForModel).length : 0}`,
    );

    // 积分预检
    const est = estimateMessagesTokens(messages);
    const { inputPricePerM, outputPricePerM } = await getConfigParams(configId);
    if (
      !(await hasEnoughCredits(
        user.id,
        calculateCredits(est, 800, inputPricePerM, outputPricePerM),
      ))
    ) {
      return jsonError(403, "积分不足，请充值后再试");
    }

    // 透传给 AI Gateway，积分在 onFinish 回调中扣减
    const systemPrompt: string | undefined = body.systemPrompt || body.system;

    // 采样参数由桌面端按场景传入，服务端校验范围后透传
    const temperature: number =
      typeof body.temperature === "number"
        ? Math.max(0, Math.min(2, body.temperature))
        : 0.7;
    const topP: number | undefined =
      typeof body.topP === "number"
        ? Math.max(0, Math.min(1, body.topP))
        : undefined;
    const topK: number | undefined =
      typeof body.topK === "number" && body.topK > 0
        ? Math.floor(body.topK)
        : undefined;

    // 校验 tool-call / tool-result 配对，移除孤立项（所有平台通用）
    sanitizeToolMessages(messages);

    // -----------------------------------------------------------------------
    // 平台路由
    // -----------------------------------------------------------------------

    if (config.platform === "google") {
      return handleGoogleStream({
        modelName: config.model_name,
        messages,
        systemPrompt,
        rawTools: body.tools,
        temperature,
        maxTokens: modelPolicy.maxTokens,
        topP,
        topK,
        userId: user.id,
        configId,
      });
    }

    if (config.platform === "anthropic") {
      return handleAnthropicStream({
        modelName: config.model_name,
        messages,
        systemPrompt,
        rawTools: body.tools,
        temperature,
        maxTokens: modelPolicy.maxTokens ?? 16000,
        userId: user.id,
        configId,
      });
    }

    if (config.platform === "openai") {
      return handleOpenAIStream({
        modelName: config.model_name,
        messages,
        systemPrompt,
        rawTools: body.tools,
        temperature,
        maxTokens: modelPolicy.maxTokens,
        userId: user.id,
        configId,
      });
    }

    return handleVercelStream({
      modelName: config.model_name,
      platform: config.platform,
      messages,
      systemPrompt,
      tools: toolsForModel,
      providerOptions: modelPolicy.providerOptions,
      maxTokens: modelPolicy.maxTokens,
      allowTemperature: true,
      temperature,
      userId: user.id,
      configId,
    });
  } catch (error) {
    if (error instanceof Response) return error;
    const classified = classifyAIError(error);
    const httpStatus = classified.code === "PROVIDER_AUTH_FAILED" ? 502 : 500;
    return NextResponse.json(
      {
        code: httpStatus,
        data: null,
        message: classified.message,
        errorCode: classified.code,
        retryable: classified.retryable,
      },
      { status: httpStatus },
    );
  }
}
