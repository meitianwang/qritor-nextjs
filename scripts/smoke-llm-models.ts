import 'dotenv/config'

import { PrismaClient } from '../src/generated/prisma/client'
import { PrismaMariaDb } from '@prisma/adapter-mariadb'
import { createGateway, generateText, jsonSchema, streamText } from 'ai'
import { createAnthropic } from '@ai-sdk/anthropic'
import { createGoogleGenerativeAI } from '@ai-sdk/google'
import { resolveModelRequestPolicy } from '../src/lib/services/reasoning-options'

interface CliOptions {
  noTools: boolean
  includeDisabled: boolean
  modelFilter?: string
  limit?: number
}

interface StreamSmokeResult {
  ok: boolean
  latencyMs: number
  textChars: number
  reasoningChars: number
  reasoningTokens: number
  sourceParts: number
  error?: string
}

interface ToolSmokeResult {
  status: 'ok' | 'failed' | 'skipped' | 'disabled' | 'inconclusive'
  latencyMs: number
  toolCallCount: number
  error?: string
}

interface ModelSmokeResult {
  modelId: bigint
  modelName: string
  resolvedModelName: string
  provider: string
  allowTools: boolean
  allowTemperature: boolean
  stream: StreamSmokeResult
  tool: ToolSmokeResult
}

function parseArgs(argv: string[]): CliOptions {
  const options: CliOptions = {
    noTools: false,
    includeDisabled: false,
  }

  for (let i = 0; i < argv.length; i += 1) {
    const arg = argv[i]
    if (arg === '--no-tools') {
      options.noTools = true
      continue
    }
    if (arg === '--include-disabled') {
      options.includeDisabled = true
      continue
    }
    if (arg === '--model') {
      options.modelFilter = argv[i + 1]
      i += 1
      continue
    }
    if (arg === '--limit') {
      const value = Number(argv[i + 1] ?? '')
      if (Number.isFinite(value) && value > 0) {
        options.limit = Math.floor(value)
      }
      i += 1
      continue
    }
  }

  return options
}

function toErrorMessage(error: unknown): string {
  if (error instanceof Error) return `${error.name}: ${error.message}`
  return String(error)
}

function compactErrorMessage(message: string, maxLen = 240): string {
  const normalized = message.replace(/\s+/g, ' ').trim()
  if (normalized.length <= maxLen) return normalized
  return `${normalized.slice(0, maxLen - 3)}...`
}

function fixed(value: number): string {
  return value.toString().padStart(2, '0')
}

function nowClock(): string {
  const d = new Date()
  return `${fixed(d.getHours())}:${fixed(d.getMinutes())}:${fixed(d.getSeconds())}`
}

function getProvider(modelName: string): string {
  const [provider = 'unknown'] = modelName.split('/')
  return provider
}

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(resolve, ms)
  })
}

function isRetryableGatewayError(error: unknown): boolean {
  const message = toErrorMessage(error)
  return (
    /statusCode["':\s]+(429|500|502|503|504)/i.test(message) ||
    /service temporarily unavailable/i.test(message) ||
    /timeout/i.test(message)
  )
}

async function withRetry<T>(
  label: string,
  fn: () => Promise<T>,
  maxAttempts = 3,
): Promise<T> {
  let attempt = 1
  while (true) {
    try {
      return await fn()
    } catch (error) {
      if (attempt >= maxAttempts || !isRetryableGatewayError(error)) {
        throw error
      }

      const waitMs = attempt * 1200
      console.log(
        `[${nowClock()}] ${label} retry ${attempt}/${maxAttempts - 1} after ${waitMs}ms`,
      )
      await sleep(waitMs)
      attempt += 1
    }
  }
}

function parseToolCallCount(output: unknown): number {
  const result = output as Record<string, unknown> | null
  if (!result || typeof result !== 'object') return 0

  let count = 0

  const toolCalls = result.toolCalls
  if (Array.isArray(toolCalls)) count += toolCalls.length

  const steps = result.steps
  if (Array.isArray(steps)) {
    for (const step of steps) {
      if (
        step &&
        typeof step === 'object' &&
        Array.isArray((step as Record<string, unknown>).toolCalls)
      ) {
        count += ((step as Record<string, unknown>).toolCalls as unknown[]).length
      }
    }
  }

  return count
}

async function runStreamSmoke(
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  modelResolver: (name: string, platform?: string | null) => any,
  modelName: string,
  resolvedModelName: string,
  platform: string | null,
  providerOptions: Record<string, Record<string, unknown>> | undefined,
  allowTemperature: boolean,
): Promise<StreamSmokeResult> {
  const startedAt = Date.now()

  try {
    const payload = await withRetry(
      `${modelName} stream`,
      async () => {
        const result = streamText({
          model: modelResolver(resolvedModelName, platform),
          messages: [
            {
              role: 'user',
              content:
                '请先进行必要推理，然后用一句中文回答”冒烟测试通过”，并补 1 个 10 字以内短句。',
            },
          ],
          ...(providerOptions ? { providerOptions } : {}),
          ...(allowTemperature ? { temperature: 0.2 } : {}),
          maxOutputTokens: 120,
        })

        let textChars = 0
        let reasoningChars = 0
        let sourceParts = 0
        let reasoningTokens = 0

        for await (const part of result.fullStream) {
          if (part.type === 'text-delta') {
            textChars += part.text.length
          } else if (part.type === 'reasoning-delta') {
            reasoningChars += part.text.length
          } else if (
            part.type === 'source-url' ||
            part.type === 'source-document' ||
            part.type === 'file'
          ) {
            sourceParts += 1
          } else if (part.type === 'finish') {
            reasoningTokens =
              part.totalUsage.outputTokenDetails?.reasoningTokens ??
              part.totalUsage.reasoningTokens ??
              0
          } else if (part.type === 'error') {
            throw new Error(
              compactErrorMessage(
                typeof part.error === 'string'
                  ? part.error
                  : JSON.stringify(part.error),
              ),
            )
          }
        }

        return {
          textChars,
          reasoningChars,
          sourceParts,
          reasoningTokens,
        }
      },
      3,
    )

    return {
      ok: true,
      latencyMs: Date.now() - startedAt,
      textChars: payload.textChars,
      reasoningChars: payload.reasoningChars,
      reasoningTokens: payload.reasoningTokens,
      sourceParts: payload.sourceParts,
    }
  } catch (error) {
    return {
      ok: false,
      latencyMs: Date.now() - startedAt,
      textChars: 0,
      reasoningChars: 0,
      reasoningTokens: 0,
      sourceParts: 0,
      error: compactErrorMessage(toErrorMessage(error)),
    }
  }
}

async function runToolSmoke(
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  modelResolver: (name: string, platform?: string | null) => any,
  resolvedModelName: string,
  platform: string | null,
  providerOptions: Record<string, Record<string, unknown>> | undefined,
  allowTemperature: boolean,
  allowTools: boolean,
  noTools: boolean,
): Promise<ToolSmokeResult> {
  if (noTools) {
    return { status: 'skipped', latencyMs: 0, toolCallCount: 0 }
  }
  if (!allowTools) {
    return { status: 'disabled', latencyMs: 0, toolCallCount: 0 }
  }

  const startedAt = Date.now()

  const invokeToolTest = async (
    required: boolean,
  ): Promise<{
    toolCallCount: number
  }> => {
    const toolOutput = await withRetry(
      `${resolvedModelName} tool`,
      async () =>
        generateText({
          model: modelResolver(resolvedModelName, platform),
          messages: [
            {
              role: 'user',
              content:
                '必须调用 ping 工具一次，参数 value 传 "ok"。工具返回后，仅输出 done。',
            },
          ],
          tools: {
            ping: {
              description: 'Ping test tool',
              inputSchema: jsonSchema({
                type: 'object',
                properties: { value: { type: 'string' } },
                required: ['value'],
                additionalProperties: false,
              }),
              execute: async ({
                value,
              }: {
                value: string
              }): Promise<{ pong: string }> => ({ pong: value }),
            },
          },
          ...(required ? { toolChoice: 'required' as const } : {}),
          maxSteps: 2,
          maxOutputTokens: 40,
          ...(providerOptions ? { providerOptions } : {}),
          ...(allowTemperature ? { temperature: 0.2 } : {}),
        }),
      3,
    )

    return {
      toolCallCount: parseToolCallCount(toolOutput),
    }
  }

  try {
    const strict = await invokeToolTest(true)
    if (strict.toolCallCount > 0) {
      return {
        status: 'ok',
        latencyMs: Date.now() - startedAt,
        toolCallCount: strict.toolCallCount,
      }
    }

    const relaxed = await invokeToolTest(false)
    if (relaxed.toolCallCount > 0) {
      return {
        status: 'ok',
        latencyMs: Date.now() - startedAt,
        toolCallCount: relaxed.toolCallCount,
      }
    }

    return {
      status: 'inconclusive',
      latencyMs: Date.now() - startedAt,
      toolCallCount: 0,
      error: 'no tool call returned (required and auto both yielded none)',
    }
  } catch (error) {
    const firstError = compactErrorMessage(toErrorMessage(error))
    if (/tool[_-]?choice|does not support this tool_choice/i.test(firstError)) {
      try {
        const relaxed = await invokeToolTest(false)
        if (relaxed.toolCallCount > 0) {
          return {
            status: 'ok',
            latencyMs: Date.now() - startedAt,
            toolCallCount: relaxed.toolCallCount,
          }
        }
        return {
          status: 'inconclusive',
          latencyMs: Date.now() - startedAt,
          toolCallCount: 0,
          error: 'tool_choice unsupported and auto mode produced no tool call',
        }
      } catch (fallbackError) {
        return {
          status: 'failed',
          latencyMs: Date.now() - startedAt,
          toolCallCount: 0,
          error: compactErrorMessage(toErrorMessage(fallbackError)),
        }
      }
    }

    return {
      status: 'failed',
      latencyMs: Date.now() - startedAt,
      toolCallCount: 0,
      error: firstError,
    }
  }
}

function printResults(results: ModelSmokeResult[]): void {
  const rows = results.map((item) => {
    const reasoningState =
      item.stream.reasoningChars > 0
        ? 'visible'
        : item.stream.reasoningTokens > 0
          ? 'hidden'
          : 'none'

    const streamState = item.stream.ok
      ? `OK ${item.stream.latencyMs}ms`
      : `FAIL ${item.stream.latencyMs}ms`

    const toolState =
      item.tool.status === 'ok'
        ? `OK(${item.tool.toolCallCount})`
        : item.tool.status === 'disabled'
          ? 'DISABLED'
          : item.tool.status === 'skipped'
            ? 'SKIPPED'
            : item.tool.status === 'inconclusive'
              ? 'NO_CALL'
              : 'FAIL'

    return {
      id: String(item.modelId),
      model: item.modelName,
      resolved: item.resolvedModelName,
      stream: streamState,
      tool: toolState,
      reasoning: reasoningState,
      sources: String(item.stream.sourceParts),
      temp: item.allowTemperature ? 'ON' : 'OFF',
      tools: item.allowTools ? 'ON' : 'OFF',
      error:
        item.stream.error ??
        item.tool.error ??
        '',
    }
  })

  const headers = [
    'id',
    'model',
    'resolved',
    'stream',
    'tool',
    'reasoning',
    'sources',
    'temp',
    'tools',
    'error',
  ] as const

  const widths = headers.map((header) =>
    Math.max(
      header.length,
      ...rows.map((row) => row[header].length),
    ),
  )

  const line = headers
    .map((header, idx) => header.padEnd(widths[idx]))
    .join(' | ')
  const sep = widths.map((w) => '-'.repeat(w)).join('-|-')

  console.log(`\n${line}`)
  console.log(sep)
  for (const row of rows) {
    const content = headers
      .map((header, idx) => row[header].padEnd(widths[idx]))
      .join(' | ')
    console.log(content)
  }
}

async function main(): Promise<void> {
  const options = parseArgs(process.argv.slice(2))

  if (!process.env.AI_GATEWAY_API_KEY) {
    throw new Error('Missing AI_GATEWAY_API_KEY')
  }
  if (!process.env.DATABASE_URL) {
    throw new Error('Missing DATABASE_URL')
  }

  const adapter = new PrismaMariaDb(process.env.DATABASE_URL)
  const prisma = new PrismaClient({ adapter })
  const gateway = createGateway({ apiKey: process.env.AI_GATEWAY_API_KEY })

  const anthropic = createAnthropic({
    baseURL: 'https://api.aicodemirror.com/api/claudecode',
    apiKey: process.env.ANTHROPIC_API_KEY ?? '',
  })
  const googleAI = createGoogleGenerativeAI({
    baseURL: 'https://api.aicodemirror.com/api/gemini',
    apiKey: process.env.GOOGLE_GENERATIVE_AI_API_KEY ?? '',
  })

  const resolveModel = (modelName: string, platform?: string | null) => {
    if (!platform || platform === 'vercel') {
      return gateway(modelName)
    }
    switch (platform) {
      case 'anthropic':
        return anthropic(modelName)
      case 'google':
        return googleAI(modelName)
      default:
        return gateway(modelName)
    }
  }

  try {
    const where = options.includeDisabled ? {} : { enabled: 1 }
    const all = await prisma.llm_config.findMany({
      where,
      select: {
        id: true,
        model_name: true,
        owned_by: true,
      },
      orderBy: { id: 'asc' },
    })

    const filtered = all.filter((item) =>
      options.modelFilter
        ? item.model_name
            .toLowerCase()
            .includes(options.modelFilter.toLowerCase())
        : true,
    )

    const picked =
      options.limit && options.limit > 0
        ? filtered.slice(0, options.limit)
        : filtered

    if (picked.length === 0) {
      console.log('No models matched.')
      return
    }

    console.log(
      `[${nowClock()}] LLM smoke start: models=${picked.length}, noTools=${options.noTools ? 'true' : 'false'}`,
    )

    const results: ModelSmokeResult[] = []

    for (let i = 0; i < picked.length; i += 1) {
      const item = picked[i]
      const modelPolicy = resolveModelRequestPolicy(item.model_name)
      const provider = getProvider(item.model_name)
      const step = `[${i + 1}/${picked.length}]`

      console.log(
        `[${nowClock()}] ${step} ${item.model_name} -> ${modelPolicy.resolvedModelName}`,
      )

      const stream = await runStreamSmoke(
        resolveModel,
        item.model_name,
        modelPolicy.resolvedModelName,
        item.owned_by,
        modelPolicy.providerOptions,
        modelPolicy.allowTemperature,
      )

      const tool = await runToolSmoke(
        resolveModel,
        modelPolicy.resolvedModelName,
        item.owned_by,
        modelPolicy.providerOptions,
        modelPolicy.allowTemperature,
        modelPolicy.allowTools,
        options.noTools,
      )

      results.push({
        modelId: item.id,
        modelName: item.model_name,
        resolvedModelName: modelPolicy.resolvedModelName,
        provider,
        allowTools: modelPolicy.allowTools,
        allowTemperature: modelPolicy.allowTemperature,
        stream,
        tool,
      })
    }

    printResults(results)

    const streamFailures = results.filter((r) => !r.stream.ok).length
    const toolFailures = results.filter((r) => r.tool.status === 'failed').length
    const toolInconclusive = results.filter(
      (r) => r.tool.status === 'inconclusive',
    ).length
    const hiddenReasoning = results.filter(
      (r) => r.stream.reasoningChars === 0 && r.stream.reasoningTokens > 0,
    ).length

    console.log('\nSummary:')
    console.log(`- total models: ${results.length}`)
    console.log(`- stream failures: ${streamFailures}`)
    console.log(`- tool failures: ${toolFailures}`)
    console.log(`- tool inconclusive: ${toolInconclusive}`)
    console.log(`- hidden reasoning models: ${hiddenReasoning}`)

    if (streamFailures > 0 || toolFailures > 0) {
      process.exitCode = 2
    }
  } finally {
    await prisma.$disconnect()
  }
}

void main().catch((error) => {
  console.error(`[${nowClock()}] smoke failed: ${compactErrorMessage(toErrorMessage(error), 500)}`)
  process.exit(1)
})
