/**
 * Anthropic ↔ OpenAI 协议转换所需的类型定义。
 * 从 claude-code-router 精简迁移，仅保留代理层用到的部分。
 */

export interface TextContent {
  type: "text";
  text: string;
  cache_control?: { type?: string };
}

export interface ImageContent {
  type: "image_url";
  image_url: { url: string };
  media_type: string;
}

export type MessageContent = TextContent | ImageContent;

export interface UnifiedMessage {
  role: "user" | "assistant" | "system" | "tool";
  content: string | null | MessageContent[];
  tool_calls?: Array<{
    id: string;
    type: "function";
    function: { name: string; arguments: string };
  }>;
  tool_call_id?: string;
  cache_control?: { type?: string };
  thinking?: { content: string; signature?: string };
}

export interface UnifiedTool {
  type: "function";
  function: {
    name: string;
    description: string;
    parameters: Record<string, any>;
  };
}

export type ThinkLevel = "none" | "low" | "medium" | "high";

export interface UnifiedChatRequest {
  messages: UnifiedMessage[];
  model: string;
  max_tokens?: number;
  temperature?: number;
  stream?: boolean;
  tools?: UnifiedTool[];
  tool_choice?:
    | "auto"
    | "none"
    | "required"
    | string
    | { type: "function"; function: { name: string } };
  reasoning?: {
    effort?: ThinkLevel;
    max_tokens?: number;
    enabled?: boolean;
  };
}
