import { NextRequest } from 'next/server'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { apiError } from '@/lib/api-response'
import { aiGenerateService } from '@/lib/services/ai-service'

export const dynamic = 'force-dynamic'

export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const body = await request.json()
    const {
      prompt,
      module_title,
      llm_config_id,
      model_tier,
    } = body as {
      prompt?: string
      module_title?: string
      llm_config_id?: number
      model_tier?: string
    }

    if (!prompt) {
      return apiError(400, '缺少 prompt')
    }

    const encoder = new TextEncoder()

    const stream = new ReadableStream({
      async start(controller) {
        try {
          for await (const event of aiGenerateService.generateDesktopPrompt(
            prompt,
            module_title || '未命名模块',
            llm_config_id,
            model_tier,
            Number(user.id),
          )) {
            controller.enqueue(
              encoder.encode(`data: ${JSON.stringify(event)}\n\n`),
            )
          }
        } catch (error) {
          controller.enqueue(
            encoder.encode(
              `data: ${JSON.stringify({
                event: 'error',
                data: { error: String(error), code: 'STREAM_ERROR' },
              })}\n\n`,
            ),
          )
        } finally {
          controller.close()
        }
      },
    })

    return new Response(stream, {
      headers: {
        'Content-Type': 'text/event-stream',
        'Cache-Control': 'no-cache',
        Connection: 'keep-alive',
      },
    })
  } catch (error) {
    if (error instanceof Response) return error
    return apiError(500, `桌面端提示词生成失败: ${String(error)}`)
  }
}
