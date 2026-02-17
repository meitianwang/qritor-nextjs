const MAX_JSON_PARSE_DEPTH = 3

function normalizeTags(value: unknown): string[] {
  if (value === null || value === undefined) return []

  let current: unknown = value

  for (let i = 0; i < MAX_JSON_PARSE_DEPTH && typeof current === 'string'; i++) {
    const trimmed = current.trim()
    if (!trimmed) return []

    try {
      current = JSON.parse(trimmed)
      continue
    } catch {
      current = trimmed
      break
    }
  }

  if (Array.isArray(current)) {
    return current
      .filter((tag): tag is string => typeof tag === 'string')
      .map((tag) => tag.trim())
      .filter((tag) => tag.length > 0)
  }

  if (typeof current === 'string' && current.length > 0) {
    return current.split(',').map((t) => t.trim()).filter((t) => t.length > 0)
  }

  return []
}

/**
 * Convert db `llm_config.tags` to stable API shape.
 */
export function parseLlmTags(rawTags: string | null | undefined): string[] {
  return normalizeTags(rawTags)
}

/**
 * Convert incoming API payload into db `llm_config.tags` format.
 */
export function serializeLlmTags(input: unknown): string | null {
  const tags = normalizeTags(input)
  return tags.length > 0 ? JSON.stringify(tags) : null
}

