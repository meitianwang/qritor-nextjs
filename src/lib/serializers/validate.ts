import { apiError } from "@/lib/api-response";

export function parseBigIntId(id: string) {
  if (!/^\d+$/.test(id)) return null;
  return BigInt(id);
}

const SLUG_PATTERN = /^[a-z0-9][a-z0-9-_]{0,99}$/;

export function validateSlug(slug: unknown) {
  if (slug === null || slug === undefined) return { valid: true as const, value: slug as null };
  if (typeof slug !== "string" || !SLUG_PATTERN.test(slug)) {
    return {
      valid: false as const,
      error: apiError(400, "slug 格式无效，只允许小写字母、数字、连字符和下划线，长度 1-100"),
    };
  }
  return { valid: true as const, value: slug };
}
