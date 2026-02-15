import nodemailer from 'nodemailer'

// ---------------------------------------------------------------------------
// Email Service
// ---------------------------------------------------------------------------

class EmailService {
  private transporter: nodemailer.Transporter
  private fromEmail: string
  private fromName = 'Qritor'

  constructor() {
    this.fromEmail = process.env.MAIL_FROM || 'noreply@qritor.cn'
    this.transporter = nodemailer.createTransport({
      host: process.env.MAIL_SERVER || 'smtpdm.aliyun.com',
      port: parseInt(process.env.MAIL_PORT || '465'),
      secure: true,
      auth: {
        user: process.env.MAIL_USERNAME,
        pass: process.env.MAIL_PASSWORD,
      },
    })
  }

  // -------------------------------------------------------------------------
  // Template builders
  // -------------------------------------------------------------------------

  private _buildCodeContent(action: string, code: string): string {
    return `您好，

您正在进行${action}操作，验证码是：

${code}

此验证码 5 分钟内有效，请勿泄露给他人。

如非本人操作，请忽略此邮件。

Qritor 团队
`
  }

  private _buildNotificationHtml(content: string): string {
    const htmlContent = content.replace(/\n/g, '<br>')
    return `<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 20px;
            line-height: 1.6;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: #ffffff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 40px 30px;
            text-align: center;
        }
        .header h1 {
            color: #ffffff;
            margin: 0;
            font-size: 28px;
            font-weight: 700;
            letter-spacing: 1px;
        }
        .header p {
            color: rgba(255, 255, 255, 0.85);
            margin: 10px 0 0 0;
            font-size: 14px;
        }
        .content {
            padding: 40px 30px;
            color: #333333;
            font-size: 15px;
        }
        .content p {
            margin: 0 0 16px 0;
        }
        .footer {
            padding: 25px 30px;
            background: #f9f9f9;
            text-align: center;
            border-top: 1px solid #eee;
        }
        .footer p {
            margin: 0 0 8px 0;
            color: #888888;
            font-size: 12px;
        }
        .footer a {
            color: #667eea;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Qritor</h1>
            <p>AI 智能创作平台</p>
        </div>
        <div class="content">
            ${htmlContent}
        </div>
        <div class="footer">
            <p>&copy; 2025 Pixel Harbor LLC. All rights reserved.</p>
            <p>如不想再收到此类邮件，请在 <a href="https://qritor.com/profile">个人设置</a> 中关闭通知。</p>
        </div>
    </div>
</body>
</html>`
  }

  // -------------------------------------------------------------------------
  // Low-level send methods
  // -------------------------------------------------------------------------

  private async _sendEmail(
    toEmail: string,
    subject: string,
    content: string,
  ): Promise<void> {
    try {
      await this.transporter.sendMail({
        from: `${this.fromName} <${this.fromEmail}>`,
        to: toEmail,
        subject,
        text: content,
      })
      console.log(`Email sent: to=${toEmail}, subject=${subject}`)
    } catch (error) {
      console.error(`Email send failed: to=${toEmail}, error=${error}`)
      throw new Error(`邮件发送失败: ${String(error)}`)
    }
  }

  private async _sendHtmlEmail(
    toEmail: string,
    subject: string,
    htmlContent: string,
  ): Promise<boolean> {
    try {
      await this.transporter.sendMail({
        from: `${this.fromName} <${this.fromEmail}>`,
        to: toEmail,
        subject,
        html: htmlContent,
      })
      console.log(`HTML Email sent: to=${toEmail}, subject=${subject}`)
      return true
    } catch (error) {
      console.error(`HTML Email send failed: to=${toEmail}, error=${error}`)
      return false
    }
  }

  // -------------------------------------------------------------------------
  // Public API
  // -------------------------------------------------------------------------

  async sendRegisterCode(toEmail: string, code: string): Promise<void> {
    const subject = '[Qritor] 邮箱验证码'
    const content = this._buildCodeContent('注册', code)
    await this._sendEmail(toEmail, subject, content)
  }

  async sendResetPasswordCode(toEmail: string, code: string): Promise<void> {
    const subject = '[Qritor] 密码重置验证码'
    const content = this._buildCodeContent('密码重置', code)
    await this._sendEmail(toEmail, subject, content)
  }

  async sendDeleteAccountCode(toEmail: string, code: string): Promise<void> {
    const subject = '[Qritor] 账号删除验证码'
    const content = this._buildCodeContent('账号删除', code)
    await this._sendEmail(toEmail, subject, content)
  }

  async sendNotificationEmail(
    toEmail: string,
    subject: string,
    content: string,
  ): Promise<boolean> {
    const fullSubject = `[Qritor] ${subject}`
    const htmlContent = this._buildNotificationHtml(content)
    return this._sendHtmlEmail(toEmail, fullSubject, htmlContent)
  }
}

export const emailService = new EmailService()
