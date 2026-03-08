import { NextRequest } from "next/server";
import { getCurrentUser } from "@/lib/middleware/auth-middleware";
import { apiError } from "@/lib/api-response";
import { aiGenerateService } from "@/lib/services/ai-service";
import { classifyAIError } from "@/lib/services/ai-error-classifier";

export const dynamic = "force-dynamic";

/** Encode a proper SSE event: `event: <type>\ndata: <json>\n\n` */
function sseEvent(eventType: string, data: unknown): Uint8Array {
  const encoder = new TextEncoder();
  return encoder.encode(
    `event: ${eventType}\ndata: ${JSON.stringify(data)}\n\n`,
  );
}

export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request);
    const body = await request.json();

    // Accept both camelCase (desktop) and snake_case field names
    const prompt = body.prompt as string | undefined;
    const moduleTitle = body.module_title || body.moduleTitle || "未命名模块";
    const configId = body.llm_config_id ?? body.llmConfigId;
    const modelTier = body.model_tier || body.modelTier;

    if (!prompt) {
      return apiError(400, "缺少 prompt");
    }

    const stream = new ReadableStream({
      async start(controller) {
        try {
          for await (const event of aiGenerateService.generateDesktopPrompt(
            prompt,
            moduleTitle,
            configId,
            modelTier,
            Number(user.id),
          )) {
            controller.enqueue(sseEvent(event.event, event.data));
          }
        } catch (error) {
          const classified = classifyAIError(error);
          controller.enqueue(
            sseEvent("error", {
              error: classified.message,
              code: classified.code,
              retryable: classified.retryable,
            }),
          );
        } finally {
          controller.close();
        }
      },
    });

    return new Response(stream, {
      headers: {
        "Content-Type": "text/event-stream",
        "Cache-Control": "no-cache",
        Connection: "keep-alive",
      },
    });
  } catch (error) {
    if (error instanceof Response) return error;
    return apiError(500, `桌面端提示词生成失败: ${String(error)}`);
  }
}
