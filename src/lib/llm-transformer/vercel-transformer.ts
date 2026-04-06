/**
 * Vercel provider 适配器。
 * 从 claude-code-router VercelTransformer 迁移。
 *
 * - transformRequestIn: 适配 UnifiedChatRequest（去 cache_control、修 image URL 等）
 * - transformResponseOut: 适配 provider 响应（reasoning → thinking 翻译、tool call ID 修复等）
 */

import type { UnifiedChatRequest } from "./types";

export class VercelTransformer {
  async transformRequestIn(request: UnifiedChatRequest): Promise<UnifiedChatRequest> {
    if (!request.model.includes("claude")) {
      request.messages.forEach((msg) => {
        if (Array.isArray(msg.content)) {
          msg.content.forEach((item: any) => {
            if (item.cache_control) delete item.cache_control;
            if (item.type === "image_url") {
              if (!item.image_url.url.startsWith("http")) {
                item.image_url.url = `data:${item.media_type};base64,${item.image_url.url}`;
              }
              delete item.media_type;
            }
          });
        } else if (msg.cache_control) {
          delete msg.cache_control;
        }
      });
    } else {
      request.messages.forEach((msg) => {
        if (Array.isArray(msg.content)) {
          msg.content.forEach((item: any) => {
            if (item.type === "image_url") {
              if (!item.image_url.url.startsWith("http")) {
                item.image_url.url = `data:${item.media_type};base64,${item.image_url.url}`;
              }
              delete item.media_type;
            }
          });
        }
      });
    }
    return request;
  }

  async transformResponseOut(response: Response): Promise<Response> {
    if (response.headers.get("Content-Type")?.includes("application/json")) {
      const jsonResponse = await response.json();
      return new Response(JSON.stringify(jsonResponse), {
        status: response.status,
        statusText: response.statusText,
        headers: response.headers,
      });
    }

    if (!response.headers.get("Content-Type")?.includes("stream") || !response.body) {
      return response;
    }

    const decoder = new TextDecoder();
    const encoder = new TextEncoder();

    let hasTextContent = false;
    let reasoningContent = "";
    let isReasoningComplete = false;
    let hasToolCall = false;
    let buffer = "";

    const processLine = (
      line: string,
      controller: ReadableStreamDefaultController,
    ) => {
      if (line.startsWith("data: ") && line.trim() !== "data: [DONE]") {
        const jsonStr = line.slice(6);
        try {
          const data = JSON.parse(jsonStr);

          // usage 到达时修正 finish_reason
          if (data.usage) {
            data.choices[0].finish_reason = hasToolCall ? "tool_calls" : "stop";
          }

          // error
          if (data.choices?.[0]?.finish_reason === "error") {
            controller.enqueue(
              encoder.encode(`data: ${JSON.stringify({ error: data.choices?.[0].error })}\n\n`),
            );
          }

          if (data.choices?.[0]?.delta?.content && !hasTextContent) {
            hasTextContent = true;
          }

          // reasoning → thinking 翻译
          if (data.choices?.[0]?.delta?.reasoning) {
            reasoningContent += data.choices[0].delta.reasoning;
            const thinkingChunk = {
              ...data,
              choices: [
                {
                  ...data.choices[0],
                  delta: {
                    ...data.choices[0].delta,
                    thinking: { content: data.choices[0].delta.reasoning },
                  },
                },
              ],
            };
            delete thinkingChunk.choices[0].delta.reasoning;
            controller.enqueue(encoder.encode(`data: ${JSON.stringify(thinkingChunk)}\n\n`));
            return;
          }

          // reasoning 结束后第一个 content chunk：发送带 signature 的 thinking 结束信号
          if (data.choices?.[0]?.delta?.content && reasoningContent && !isReasoningComplete) {
            isReasoningComplete = true;
            const thinkingChunk = {
              ...data,
              choices: [
                {
                  ...data.choices[0],
                  delta: {
                    ...data.choices[0].delta,
                    content: null,
                    thinking: { content: reasoningContent, signature: Date.now().toString() },
                  },
                },
              ],
            };
            delete thinkingChunk.choices[0].delta.reasoning;
            controller.enqueue(encoder.encode(`data: ${JSON.stringify(thinkingChunk)}\n\n`));
          }

          if (data.choices?.[0]?.delta?.reasoning) {
            delete data.choices[0].delta.reasoning;
          }

          // tool call ID 修复（某些 provider 返回数字 ID）
          if (
            data.choices?.[0]?.delta?.tool_calls?.length &&
            !Number.isNaN(parseInt(data.choices[0].delta.tool_calls[0].id, 10))
          ) {
            data.choices[0].delta.tool_calls.forEach((tool: any) => {
              tool.id = `call_${crypto.randomUUID()}`;
            });
          }

          if (data.choices?.[0]?.delta?.tool_calls?.length && !hasToolCall) {
            hasToolCall = true;
          }

          // tool call 在 text 之后时调整 choice index
          if (data.choices?.[0]?.delta?.tool_calls?.length && hasTextContent) {
            data.choices[0].index =
              typeof data.choices[0].index === "number" ? data.choices[0].index + 1 : 1;
          }

          controller.enqueue(encoder.encode(`data: ${JSON.stringify(data)}\n\n`));
        } catch {
          controller.enqueue(encoder.encode(line + "\n"));
        }
      } else {
        controller.enqueue(encoder.encode(line + "\n"));
      }
    };

    const stream = new ReadableStream({
      start: async (controller) => {
        const reader = response.body!.getReader();
        try {
          while (true) {
            const { done, value } = await reader.read();
            if (done) {
              if (buffer.trim()) {
                for (const line of buffer.split("\n")) {
                  if (line.trim()) controller.enqueue(encoder.encode(line + "\n"));
                }
              }
              break;
            }

            if (!value || value.length === 0) continue;

            let chunk: string;
            try {
              chunk = decoder.decode(value, { stream: true });
            } catch {
              continue;
            }
            if (!chunk.length) continue;

            buffer += chunk;

            // 1MB 安全上限
            if (buffer.length > 1_000_000) {
              console.warn("[vercel-transformer] buffer exceeds 1MB, processing partial data");
              const lines = buffer.split("\n");
              buffer = lines.pop() || "";
              for (const line of lines) {
                if (line.trim()) processLine(line, controller);
              }
              continue;
            }

            const lines = buffer.split("\n");
            buffer = lines.pop() || "";
            for (const line of lines) {
              if (line.trim()) processLine(line, controller);
            }
          }
        } catch (error) {
          console.error("[vercel-transformer] stream error:", error);
          controller.error(error);
        } finally {
          try {
            reader.releaseLock();
          } catch {
            // ignore
          }
          controller.close();
        }
      },
    });

    return new Response(stream, {
      status: response.status,
      statusText: response.statusText,
      headers: {
        "Content-Type": "text/event-stream",
        "Cache-Control": "no-cache",
        Connection: "keep-alive",
      },
    });
  }
}
