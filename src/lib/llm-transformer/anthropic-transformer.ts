/**
 * Anthropic ↔ OpenAI 协议转换器。
 * 从 claude-code-router AnthropicTransformer 迁移，去掉外部依赖。
 *
 * - transformRequestOut: Anthropic Messages API 请求 → UnifiedChatRequest (OpenAI 格式)
 * - transformResponseIn: OpenAI 响应 → Anthropic Messages API 响应 (含流式 SSE 翻译)
 */

import type { UnifiedChatRequest, UnifiedMessage, UnifiedTool } from "./types";
import { getThinkLevel, formatBase64, simpleId } from "./utils";

export class AnthropicTransformer {
  async transformRequestOut(request: Record<string, any>): Promise<UnifiedChatRequest> {
    const messages: UnifiedMessage[] = [];

    // system prompt
    if (request.system) {
      if (typeof request.system === "string") {
        messages.push({ role: "system", content: request.system });
      } else if (Array.isArray(request.system) && request.system.length) {
        const textParts = request.system
          .filter((item: any) => item.type === "text" && item.text)
          .map((item: any) => ({
            type: "text" as const,
            text: item.text,
            cache_control: item.cache_control,
          }));
        messages.push({ role: "system", content: textParts });
      }
    }

    const requestMessages = JSON.parse(JSON.stringify(request.messages || []));

    requestMessages?.forEach((msg: any) => {
      if (msg.role === "user" || msg.role === "assistant") {
        if (typeof msg.content === "string") {
          messages.push({ role: msg.role, content: msg.content });
          return;
        }

        if (Array.isArray(msg.content)) {
          if (msg.role === "user") {
            // tool_result → role: "tool"
            const toolParts = msg.content.filter(
              (c: any) => c.type === "tool_result" && c.tool_use_id,
            );
            if (toolParts.length) {
              toolParts.forEach((tool: any) => {
                messages.push({
                  role: "tool",
                  content:
                    typeof tool.content === "string"
                      ? tool.content
                      : JSON.stringify(tool.content),
                  tool_call_id: tool.tool_use_id,
                  cache_control: tool.cache_control,
                });
              });
            }

            // text + image
            const textAndMediaParts = msg.content.filter(
              (c: any) =>
                (c.type === "text" && c.text) ||
                (c.type === "image" && c.source),
            );
            if (textAndMediaParts.length) {
              messages.push({
                role: "user",
                content: textAndMediaParts.map((part: any) => {
                  if (part?.type === "image") {
                    return {
                      type: "image_url",
                      image_url: {
                        url:
                          part.source?.type === "base64"
                            ? formatBase64(part.source.data, part.source.media_type)
                            : part.source.url,
                      },
                      media_type: part.source.media_type,
                    };
                  }
                  return part;
                }),
              });
            }
          } else if (msg.role === "assistant") {
            const assistantMessage: UnifiedMessage = { role: "assistant", content: "" };

            const textParts = msg.content.filter((c: any) => c.type === "text" && c.text);
            if (textParts.length) {
              assistantMessage.content = textParts.map((t: any) => t.text).join("\n");
            }

            const toolCallParts = msg.content.filter((c: any) => c.type === "tool_use" && c.id);
            if (toolCallParts.length) {
              assistantMessage.tool_calls = toolCallParts.map((tool: any) => ({
                id: tool.id,
                type: "function" as const,
                function: { name: tool.name, arguments: JSON.stringify(tool.input || {}) },
              }));
            }

            const thinkingPart = msg.content.find(
              (c: any) => c.type === "thinking" && c.signature,
            );
            if (thinkingPart) {
              assistantMessage.thinking = {
                content: thinkingPart.thinking,
                signature: thinkingPart.signature,
              };
            }

            messages.push(assistantMessage);
          }
          return;
        }
      }
    });

    const result: UnifiedChatRequest = {
      messages,
      model: request.model,
      max_tokens: request.max_tokens,
      temperature: request.temperature,
      stream: request.stream,
      tools: request.tools?.length ? convertAnthropicToolsToUnified(request.tools) : undefined,
      tool_choice: request.tool_choice,
    };

    if (request.thinking) {
      result.reasoning = {
        effort: getThinkLevel(request.thinking.budget_tokens),
        enabled: request.thinking.type === "enabled",
      };
    }

    if (request.tool_choice) {
      if (request.tool_choice.type === "tool") {
        result.tool_choice = { type: "function", function: { name: request.tool_choice.name } };
      } else {
        result.tool_choice = request.tool_choice.type;
      }
    }

    return result;
  }

  async transformResponseIn(response: Response): Promise<Response> {
    const isStream = response.headers.get("Content-Type")?.includes("text/event-stream");

    if (isStream) {
      if (!response.body) throw new Error("Stream response body is null");
      const converted = convertOpenAIStreamToAnthropic(response.body);
      return new Response(converted, {
        headers: {
          "Content-Type": "text/event-stream",
          "Cache-Control": "no-cache",
          Connection: "keep-alive",
        },
      });
    }

    const data = await response.json();
    const anthropicResponse = convertOpenAIResponseToAnthropic(data);
    return new Response(JSON.stringify(anthropicResponse), {
      headers: { "Content-Type": "application/json" },
    });
  }
}

// ── helpers ──────────────────────────────────────────────────────────

function convertAnthropicToolsToUnified(tools: any[]): UnifiedTool[] {
  return tools.map((tool) => ({
    type: "function",
    function: {
      name: tool.name,
      description: tool.description || "",
      parameters: tool.input_schema,
    },
  }));
}

function convertOpenAIResponseToAnthropic(openaiResponse: any): any {
  const choice = openaiResponse.choices?.[0];
  if (!choice) throw new Error("No choices found in OpenAI response");

  const content: any[] = [];

  if (choice.message.annotations) {
    const id = `srvtoolu_${simpleId()}`;
    content.push({ type: "server_tool_use", id, name: "web_search", input: { query: "" } });
    content.push({
      type: "web_search_tool_result",
      tool_use_id: id,
      content: choice.message.annotations.map((item: any) => ({
        type: "web_search_result",
        url: item.url_citation.url,
        title: item.url_citation.title,
      })),
    });
  }

  if (choice.message.content) {
    content.push({ type: "text", text: choice.message.content });
  }

  if (choice.message.tool_calls?.length) {
    choice.message.tool_calls.forEach((tc: any) => {
      let parsedInput = {};
      try {
        const args = tc.function.arguments || "{}";
        parsedInput = typeof args === "object" ? args : JSON.parse(args);
      } catch {
        parsedInput = { text: tc.function.arguments || "" };
      }
      content.push({ type: "tool_use", id: tc.id, name: tc.function.name, input: parsedInput });
    });
  }

  if (choice.message?.thinking?.content) {
    content.push({
      type: "thinking",
      thinking: choice.message.thinking.content,
      signature: choice.message.thinking.signature,
    });
  }

  const stopReasonMap: Record<string, string> = {
    stop: "end_turn",
    length: "max_tokens",
    tool_calls: "tool_use",
    content_filter: "stop_sequence",
  };

  return {
    id: openaiResponse.id,
    type: "message",
    role: "assistant",
    model: openaiResponse.model,
    content,
    stop_reason: stopReasonMap[choice.finish_reason] || "end_turn",
    stop_sequence: null,
    usage: {
      input_tokens:
        (openaiResponse.usage?.prompt_tokens || 0) -
        (openaiResponse.usage?.prompt_tokens_details?.cached_tokens || 0),
      output_tokens: openaiResponse.usage?.completion_tokens || 0,
      cache_read_input_tokens:
        openaiResponse.usage?.prompt_tokens_details?.cached_tokens || 0,
    },
  };
}

// ── SSE stream converter: OpenAI → Anthropic ────────────────────────

function convertOpenAIStreamToAnthropic(openaiStream: ReadableStream): ReadableStream {
  return new ReadableStream({
    start: async (controller) => {
      const encoder = new TextEncoder();
      const messageId = `msg_${Date.now()}`;
      let stopReasonMessageDelta: Record<string, any> | null = null;
      let model = "unknown";
      let hasStarted = false;
      let hasTextContentStarted = false;
      let hasFinished = false;
      const toolCalls = new Map<number, any>();
      const toolCallIndexToContentBlockIndex = new Map<number, number>();
      let contentChunks = 0;
      let toolCallChunks = 0;
      let isClosed = false;
      let isThinkingStarted = false;
      let contentIndex = 0;
      let currentContentBlockIndex = -1;

      const assignContentBlockIndex = (): number => contentIndex++;

      const safeEnqueue = (data: Uint8Array) => {
        if (isClosed) return;
        try {
          controller.enqueue(data);
        } catch (error) {
          if (error instanceof TypeError && error.message.includes("Controller is already closed")) {
            isClosed = true;
          } else {
            throw error;
          }
        }
      };

      const safeClose = () => {
        if (isClosed) return;
        try {
          if (currentContentBlockIndex >= 0) {
            safeEnqueue(
              encoder.encode(
                `event: content_block_stop\ndata: ${JSON.stringify({
                  type: "content_block_stop",
                  index: currentContentBlockIndex,
                })}\n\n`,
              ),
            );
            currentContentBlockIndex = -1;
          }

          if (stopReasonMessageDelta) {
            safeEnqueue(encoder.encode(`event: message_delta\ndata: ${JSON.stringify(stopReasonMessageDelta)}\n\n`));
          } else {
            safeEnqueue(
              encoder.encode(
                `event: message_delta\ndata: ${JSON.stringify({
                  type: "message_delta",
                  delta: { stop_reason: "end_turn", stop_sequence: null },
                  usage: { input_tokens: 0, output_tokens: 0, cache_read_input_tokens: 0 },
                })}\n\n`,
              ),
            );
          }

          safeEnqueue(encoder.encode(`event: message_stop\ndata: ${JSON.stringify({ type: "message_stop" })}\n\n`));
          controller.close();
          isClosed = true;
        } catch (error) {
          if (error instanceof TypeError && error.message.includes("Controller is already closed")) {
            isClosed = true;
          } else {
            throw error;
          }
        }
      };

      let reader: ReadableStreamDefaultReader<Uint8Array> | null = null;

      try {
        reader = openaiStream.getReader();
        const decoder = new TextDecoder();
        let buffer = "";

        while (true) {
          if (isClosed) break;
          const { done, value } = await reader.read();
          if (done) break;

          buffer += decoder.decode(value, { stream: true });
          const lines = buffer.split("\n");
          buffer = lines.pop() || "";

          for (const line of lines) {
            if (isClosed || hasFinished) break;
            if (!line.startsWith("data:")) continue;
            const data = line.slice(5).trim();
            if (data === "[DONE]") continue;

            try {
              const chunk = JSON.parse(data);

              if (chunk.error) {
                safeEnqueue(
                  encoder.encode(
                    `event: error\ndata: ${JSON.stringify({
                      type: "error",
                      message: { type: "api_error", message: JSON.stringify(chunk.error) },
                    })}\n\n`,
                  ),
                );
                continue;
              }

              model = chunk.model || model;

              // message_start
              if (!hasStarted && !isClosed && !hasFinished) {
                hasStarted = true;
                safeEnqueue(
                  encoder.encode(
                    `event: message_start\ndata: ${JSON.stringify({
                      type: "message_start",
                      message: {
                        id: messageId,
                        type: "message",
                        role: "assistant",
                        content: [],
                        model,
                        stop_reason: null,
                        stop_sequence: null,
                        usage: { input_tokens: 0, output_tokens: 0 },
                      },
                    })}\n\n`,
                  ),
                );
              }

              const choice = chunk.choices?.[0];

              // usage
              if (chunk.usage) {
                const usageData = {
                  input_tokens:
                    (chunk.usage.prompt_tokens || 0) -
                    (chunk.usage.prompt_tokens_details?.cached_tokens || 0),
                  output_tokens: chunk.usage.completion_tokens || 0,
                  cache_read_input_tokens: chunk.usage.prompt_tokens_details?.cached_tokens || 0,
                };
                if (!stopReasonMessageDelta) {
                  stopReasonMessageDelta = {
                    type: "message_delta",
                    delta: { stop_reason: "end_turn", stop_sequence: null },
                    usage: usageData,
                  };
                } else {
                  stopReasonMessageDelta.usage = usageData;
                }
              }

              if (!choice) continue;

              // ── thinking ──
              if (choice.delta?.thinking && !isClosed && !hasFinished) {
                if (!isThinkingStarted) {
                  const idx = assignContentBlockIndex();
                  safeEnqueue(
                    encoder.encode(
                      `event: content_block_start\ndata: ${JSON.stringify({
                        type: "content_block_start",
                        index: idx,
                        content_block: { type: "thinking", thinking: "" },
                      })}\n\n`,
                    ),
                  );
                  currentContentBlockIndex = idx;
                  isThinkingStarted = true;
                }

                if (choice.delta.thinking.signature) {
                  safeEnqueue(
                    encoder.encode(
                      `event: content_block_delta\ndata: ${JSON.stringify({
                        type: "content_block_delta",
                        index: currentContentBlockIndex,
                        delta: { type: "signature_delta", signature: choice.delta.thinking.signature },
                      })}\n\n`,
                    ),
                  );
                  safeEnqueue(
                    encoder.encode(
                      `event: content_block_stop\ndata: ${JSON.stringify({
                        type: "content_block_stop",
                        index: currentContentBlockIndex,
                      })}\n\n`,
                    ),
                  );
                  currentContentBlockIndex = -1;
                } else if (choice.delta.thinking.content) {
                  safeEnqueue(
                    encoder.encode(
                      `event: content_block_delta\ndata: ${JSON.stringify({
                        type: "content_block_delta",
                        index: currentContentBlockIndex,
                        delta: { type: "thinking_delta", thinking: choice.delta.thinking.content },
                      })}\n\n`,
                    ),
                  );
                }
              }

              // ── text content ──
              if (choice.delta?.content && !isClosed && !hasFinished) {
                contentChunks++;

                if (currentContentBlockIndex >= 0 && !hasTextContentStarted) {
                  safeEnqueue(
                    encoder.encode(
                      `event: content_block_stop\ndata: ${JSON.stringify({
                        type: "content_block_stop",
                        index: currentContentBlockIndex,
                      })}\n\n`,
                    ),
                  );
                  currentContentBlockIndex = -1;
                }

                if (!hasTextContentStarted && !hasFinished) {
                  hasTextContentStarted = true;
                  const idx = assignContentBlockIndex();
                  safeEnqueue(
                    encoder.encode(
                      `event: content_block_start\ndata: ${JSON.stringify({
                        type: "content_block_start",
                        index: idx,
                        content_block: { type: "text", text: "" },
                      })}\n\n`,
                    ),
                  );
                  currentContentBlockIndex = idx;
                }

                if (!isClosed && !hasFinished) {
                  safeEnqueue(
                    encoder.encode(
                      `event: content_block_delta\ndata: ${JSON.stringify({
                        type: "content_block_delta",
                        index: currentContentBlockIndex,
                        delta: { type: "text_delta", text: choice.delta.content },
                      })}\n\n`,
                    ),
                  );
                }
              }

              // ── annotations ──
              if (choice.delta?.annotations?.length && !isClosed && !hasFinished) {
                if (currentContentBlockIndex >= 0 && hasTextContentStarted) {
                  safeEnqueue(
                    encoder.encode(
                      `event: content_block_stop\ndata: ${JSON.stringify({
                        type: "content_block_stop",
                        index: currentContentBlockIndex,
                      })}\n\n`,
                    ),
                  );
                  currentContentBlockIndex = -1;
                  hasTextContentStarted = false;
                }

                for (const annotation of choice.delta.annotations) {
                  const idx = assignContentBlockIndex();
                  safeEnqueue(
                    encoder.encode(
                      `event: content_block_start\ndata: ${JSON.stringify({
                        type: "content_block_start",
                        index: idx,
                        content_block: {
                          type: "web_search_tool_result",
                          tool_use_id: `srvtoolu_${simpleId()}`,
                          content: [
                            {
                              type: "web_search_result",
                              title: annotation.url_citation.title,
                              url: annotation.url_citation.url,
                            },
                          ],
                        },
                      })}\n\n`,
                    ),
                  );
                  safeEnqueue(
                    encoder.encode(
                      `event: content_block_stop\ndata: ${JSON.stringify({
                        type: "content_block_stop",
                        index: idx,
                      })}\n\n`,
                    ),
                  );
                  currentContentBlockIndex = -1;
                }
              }

              // ── tool calls ──
              if (choice.delta?.tool_calls && !isClosed && !hasFinished) {
                toolCallChunks++;
                const processedInThisChunk = new Set<number>();

                for (const toolCall of choice.delta.tool_calls) {
                  if (isClosed) break;
                  const toolCallIndex = toolCall.index ?? 0;
                  if (processedInThisChunk.has(toolCallIndex)) continue;
                  processedInThisChunk.add(toolCallIndex);

                  const isUnknownIndex = !toolCallIndexToContentBlockIndex.has(toolCallIndex);

                  if (isUnknownIndex) {
                    if (currentContentBlockIndex >= 0) {
                      safeEnqueue(
                        encoder.encode(
                          `event: content_block_stop\ndata: ${JSON.stringify({
                            type: "content_block_stop",
                            index: currentContentBlockIndex,
                          })}\n\n`,
                        ),
                      );
                      currentContentBlockIndex = -1;
                    }

                    const newIdx = assignContentBlockIndex();
                    toolCallIndexToContentBlockIndex.set(toolCallIndex, newIdx);
                    const toolCallId = toolCall.id || `call_${Date.now()}_${toolCallIndex}`;
                    const toolCallName = toolCall.function?.name || `tool_${toolCallIndex}`;

                    safeEnqueue(
                      encoder.encode(
                        `event: content_block_start\ndata: ${JSON.stringify({
                          type: "content_block_start",
                          index: newIdx,
                          content_block: { type: "tool_use", id: toolCallId, name: toolCallName, input: {} },
                        })}\n\n`,
                      ),
                    );
                    currentContentBlockIndex = newIdx;
                    toolCalls.set(toolCallIndex, {
                      id: toolCallId,
                      name: toolCallName,
                      arguments: "",
                      contentBlockIndex: newIdx,
                    });
                  } else if (toolCall.id && toolCall.function?.name) {
                    const existing = toolCalls.get(toolCallIndex)!;
                    if (existing.id.startsWith("call_") && existing.name.startsWith("tool_")) {
                      existing.id = toolCall.id;
                      existing.name = toolCall.function.name;
                    }
                  }

                  if (toolCall.function?.arguments && !isClosed && !hasFinished) {
                    const blockIndex = toolCallIndexToContentBlockIndex.get(toolCallIndex);
                    if (blockIndex === undefined) continue;
                    const currentToolCall = toolCalls.get(toolCallIndex);
                    if (currentToolCall) currentToolCall.arguments += toolCall.function.arguments;

                    try {
                      safeEnqueue(
                        encoder.encode(
                          `event: content_block_delta\ndata: ${JSON.stringify({
                            type: "content_block_delta",
                            index: blockIndex,
                            delta: { type: "input_json_delta", partial_json: toolCall.function.arguments },
                          })}\n\n`,
                        ),
                      );
                    } catch {
                      try {
                        const fixed = toolCall.function.arguments
                          .replace(/[\x00-\x1F\x7F-\x9F]/g, "")
                          .replace(/\\/g, "\\\\")
                          .replace(/"/g, '\\"');
                        safeEnqueue(
                          encoder.encode(
                            `event: content_block_delta\ndata: ${JSON.stringify({
                              type: "content_block_delta",
                              index: blockIndex,
                              delta: { type: "input_json_delta", partial_json: fixed },
                            })}\n\n`,
                          ),
                        );
                      } catch (fixError) {
                        console.error(fixError);
                      }
                    }
                  }
                }
              }

              // ── finish ──
              if (choice.finish_reason && !isClosed && !hasFinished) {
                if (currentContentBlockIndex >= 0) {
                  safeEnqueue(
                    encoder.encode(
                      `event: content_block_stop\ndata: ${JSON.stringify({
                        type: "content_block_stop",
                        index: currentContentBlockIndex,
                      })}\n\n`,
                    ),
                  );
                  currentContentBlockIndex = -1;
                }

                if (!isClosed) {
                  const stopReasonMap: Record<string, string> = {
                    stop: "end_turn",
                    length: "max_tokens",
                    tool_calls: "tool_use",
                    content_filter: "stop_sequence",
                  };
                  stopReasonMessageDelta = {
                    type: "message_delta",
                    delta: { stop_reason: stopReasonMap[choice.finish_reason] || "end_turn", stop_sequence: null },
                    usage: {
                      input_tokens:
                        (chunk.usage?.prompt_tokens || 0) -
                        (chunk.usage?.prompt_tokens_details?.cached_tokens || 0),
                      output_tokens: chunk.usage?.completion_tokens || 0,
                      cache_read_input_tokens: chunk.usage?.prompt_tokens_details?.cached_tokens || 0,
                    },
                  };
                }
                break;
              }
            } catch (parseError: any) {
              console.error(`[anthropic-transformer] parse error: ${parseError.message}, data: ${data}`);
            }
          }
        }
        safeClose();
      } catch (error) {
        if (!isClosed) {
          try {
            controller.error(error);
          } catch {
            // ignore
          }
        }
      } finally {
        if (reader) {
          try {
            reader.releaseLock();
          } catch {
            // ignore
          }
        }
      }
    },
  });
}
