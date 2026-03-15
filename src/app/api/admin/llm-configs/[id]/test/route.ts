import { NextRequest } from "next/server";
import { apiSuccess, apiError, apiNotFound } from "@/lib/api-response";
import { getCurrentAdminUser } from "@/lib/middleware/auth-middleware";
import { prisma } from "@/lib/prisma";
import { generateText } from "ai";
import {
  resolveModel,
  resolveOneProxyProtocol,
  getOneProxyGoogleClient,
  getOneProxyOpenAIClient,
  getOneProxyAnthropicClient,
} from "@/lib/services/ai-service";
import { resolveModelRequestPolicy } from "@/lib/services/reasoning-options";

export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    await getCurrentAdminUser(request);
    const { id } = await params;

    const config = await prisma.llm_config.findUnique({
      where: { id: BigInt(id) },
    });

    if (!config) {
      return apiNotFound("LLM 配置不存在");
    }

    const modelPolicy = resolveModelRequestPolicy(
      config.model_name,
      config.provider,
    );
    const startTime = Date.now();

    // Google platform: 走 @google/genai SDK
    if (config.platform === "google") {
      const { generateGoogleContent } =
        await import("@/lib/services/google-genai");
      const { text } = await generateGoogleContent({
        modelName: config.model_name,
        contents: [
          { role: "user", parts: [{ text: 'Say "hello" in one word.' }] },
        ],
        thinkingConfig: { includeThoughts: true, thinkingLevel: "HIGH" },
        maxTokens: modelPolicy.maxTokens,
      });
      return apiSuccess({
        success: true,
        modelName: config.model_name,
        latencyMs: Date.now() - startTime,
        reply: (text ?? "").slice(0, 100),
      });
    }

    // OpenAI platform: 走 openai 官方 SDK (Responses API)
    if (config.platform === "openai") {
      const { streamOpenAIContent, convertMessagesToOpenAIInput } =
        await import("@/lib/services/openai-sdk");
      const { input } = convertMessagesToOpenAIInput([
        { role: "user", content: 'Say "hello" in one word.' },
      ]);
      let reply = "";
      for await (const event of streamOpenAIContent({
        modelName: config.model_name,
        input,
        maxTokens: modelPolicy.maxTokens,
      })) {
        if (event.type === "text-delta") reply += event.text;
        if (event.type === "error") throw event.error;
      }
      return apiSuccess({
        success: true,
        modelName: config.model_name,
        latencyMs: Date.now() - startTime,
        reply: reply.slice(0, 100),
      });
    }

    // OneProxy platform: 根据模型名称走对应原生协议
    if (config.platform === "oneproxy") {
      const protocol = resolveOneProxyProtocol(config.model_name);

      if (protocol === "google") {
        const { generateGoogleContent } =
          await import("@/lib/services/google-genai");
        const { text } = await generateGoogleContent({
          client: getOneProxyGoogleClient(),
          modelName: config.model_name,
          contents: [
            { role: "user", parts: [{ text: 'Say "hello" in one word.' }] },
          ],
          maxTokens: modelPolicy.maxTokens,
        });
        return apiSuccess({
          success: true,
          modelName: config.model_name,
          latencyMs: Date.now() - startTime,
          reply: (text ?? "").slice(0, 100),
        });
      }

      if (protocol === "openai") {
        const { streamOpenAIContent, convertMessagesToOpenAIInput } =
          await import("@/lib/services/openai-sdk");
        const { input } = convertMessagesToOpenAIInput([
          { role: "user", content: 'Say "hello" in one word.' },
        ]);
        let reply = "";
        for await (const event of streamOpenAIContent({
          client: getOneProxyOpenAIClient(),
          modelName: config.model_name,
          input,
          maxTokens: modelPolicy.maxTokens,
        })) {
          if (event.type === "text-delta") reply += event.text;
          if (event.type === "error") throw event.error;
        }
        return apiSuccess({
          success: true,
          modelName: config.model_name,
          latencyMs: Date.now() - startTime,
          reply: reply.slice(0, 100),
        });
      }

      if (protocol === "anthropic") {
        const { streamAnthropicContent } =
          await import("@/lib/services/anthropic-sdk");
        let reply = "";
        for await (const event of streamAnthropicContent({
          client: getOneProxyAnthropicClient(),
          modelName: config.model_name,
          messages: [{ role: "user", content: 'Say "hello" in one word.' }],
          systemBlocks: [],
          maxTokens: modelPolicy.maxTokens ?? 1024,
        })) {
          if (event.type === "text-delta") reply += event.text;
          if (event.type === "error") throw event.error;
        }
        return apiSuccess({
          success: true,
          modelName: config.model_name,
          latencyMs: Date.now() - startTime,
          reply: reply.slice(0, 100),
        });
      }

      // 无法识别的模型 → fallthrough 到 Vercel AI SDK
    }

    const { text } = await generateText({
      model: resolveModel(config.model_name, config.platform),
      messages: [{ role: "user", content: 'Say "hello" in one word.' }],
      ...(modelPolicy.providerOptions
        ? { providerOptions: modelPolicy.providerOptions }
        : {}),
      ...(modelPolicy.maxTokens ? { maxTokens: modelPolicy.maxTokens } : {}),
    });

    const latencyMs = Date.now() - startTime;

    return apiSuccess({
      success: true,
      modelName: config.model_name,
      latencyMs,
      reply: text.slice(0, 100),
    });
  } catch (error) {
    if (error instanceof Response) return error;

    const latencyMs = 0;
    const errorMsg = String(error);

    // Return structured failure instead of 500 for model-level errors
    if (errorMsg.includes("model") || errorMsg.includes("API")) {
      return apiSuccess({
        success: false,
        modelName: "",
        latencyMs,
        error: errorMsg.slice(0, 200),
      });
    }

    return apiError(500, `测试 LLM 模型失败: ${errorMsg}`);
  }
}
