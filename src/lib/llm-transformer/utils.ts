import type { ThinkLevel } from "./types";

export function getThinkLevel(budget: number): ThinkLevel {
  if (budget <= 0) return "none";
  if (budget <= 1024) return "low";
  if (budget <= 8192) return "medium";
  return "high";
}

export function formatBase64(data: string, mediaType: string): string {
  if (data.includes("base64")) {
    data = data.split("base64").pop()!;
    if (data.startsWith(",")) data = data.slice(1);
  }
  return `data:${mediaType};base64,${data}`;
}

let _counter = 0;
export function simpleId(): string {
  return `${Date.now()}_${++_counter}`;
}
