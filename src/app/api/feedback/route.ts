import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { emailService } from '@/lib/services/email-service'

const VALID_CATEGORIES = ['bug', 'suggestion', 'other']
const ADMIN_EMAIL = 'nick@qritor.com'

export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)
    const body = await request.json()
    const { category, subject, message, screenshotUrl } = body

    // Validate category
    if (!category || !VALID_CATEGORIES.includes(category)) {
      return apiError(400, '请选择反馈类别')
    }

    // Validate subject
    if (!subject || typeof subject !== 'string' || subject.trim().length === 0) {
      return apiError(400, '请输入反馈主题')
    }
    if (subject.length > 100) {
      return apiError(400, '主题不能超过 100 个字符')
    }

    // Validate message
    if (!message || typeof message !== 'string' || message.trim().length === 0) {
      return apiError(400, '请输入反馈内容')
    }
    if (message.length > 2000) {
      return apiError(400, '反馈内容不能超过 2000 个字符')
    }

    // Build category label
    const categoryLabels: Record<string, string> = {
      bug: 'Bug 报告',
      suggestion: '功能建议',
      other: '其他',
    }

    // Build email content
    const now = new Date().toLocaleString('zh-CN', { timeZone: 'Asia/Shanghai' })
    const screenshotLine = screenshotUrl ? `\n截图：${screenshotUrl}` : ''
    const content = `用户反馈通知

用户：${user.nickname || '未设置昵称'} (${user.email})
类别：${categoryLabels[category] || category}
主题：${subject.trim()}

详细描述：
${message.trim()}
${screenshotLine}

提交时间：${now}`

    await emailService.sendNotificationEmail(
      ADMIN_EMAIL,
      `用户反馈 - ${categoryLabels[category] || category}: ${subject.trim()}`,
      content,
    )

    return apiSuccess(null, '反馈提交成功')
  } catch (error) {
    if (error instanceof Response) {
      return error
    }
    console.error('Feedback submission error:', error)
    return apiError(500, '反馈提交失败，请稍后重试')
  }
}
