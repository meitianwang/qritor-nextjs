import type { DocsContentEntry } from "../types";

// ============== 支持与下载 ==============

export const zhSupportContent: Record<string, DocsContentEntry> = {
  "download-guide": {
    breadcrumb: "支持",
    title: "下载安装指南",
    description:
      "本指南将帮助您下载和安装 Qritor 桌面客户端，包含详细的系统要求和安装步骤。",
    body: `
## 系统要求

### macOS
- macOS 10.15 (Catalina) 或更高版本
- Apple Silicon (M1/M2/M3) 或 Intel 处理器
- 至少 4GB 内存
- 500MB 可用磁盘空间

### Windows
- Windows 10 (64位) 或更高版本
- 至少 4GB 内存
- 500MB 可用磁盘空间

## 下载地址

访问 [下载页面](/download) 获取最新版本的 Qritor 桌面客户端。

页面会自动检测您的操作系统，推荐最适合的版本。您也可以手动选择其他版本。

---

## macOS 安装指南

### 第一步：选择正确的版本

- **Apple Silicon (M1/M2/M3 芯片)** → 下载 **arm64** 版本
- **Intel 芯片** → 下载 **x64** 版本

不确定自己的芯片类型？点击左上角  → 「关于本机」查看。

### 第二步：安装应用

1. 双击下载的 \`.dmg\` 文件，打开安装镜像
2. 在弹出的窗口中，将 **Qritor 图标** 拖动到 **Applications 文件夹**
3. 等待复制完成

### 第三步：首次启动

1. 打开「访达」→「应用程序」文件夹
2. 双击 **Qritor** 启动应用
3. 应用已通过 Apple 公证，可直接运行

### macOS 常见问题

**Q: 提示"Qritor 已损坏，无法打开"怎么办？**

这通常是因为下载不完整。请重新下载安装包，确保下载完成后再安装。

**Q: 如何卸载？**

将「应用程序」文件夹中的 Qritor 拖入废纸篓即可。

---

## Windows 安装指南

### 重要提示：安全警告说明

由于 Qritor 是新发布的软件，Windows 和浏览器会显示安全警告。**这是正常现象**，不代表软件有问题。

原因：Windows SmartScreen 基于软件的下载量来判断信任度，新软件需要积累一定用户量后警告才会消失。

### 第一步：下载安装包

点击下载提示右侧的 **「...」** 按钮
2. 在弹出菜单中选择 **「保留」**

![选择保留文件](/images/docs/win-download-warning-2.png)

### 第二步：处理 SmartScreen 警告

双击安装包时，可能会看到 Microsoft Defender SmartScreen 警告：

![SmartScreen 警告](/images/docs/win-download-warning-1.png)

**解决方法：**

1. 点击弹窗右下角的 **「...」** 按钮
2. 选择 **「仍然保留」**
3. 再次双击安装包即可正常安装

### 第三步：完成安装

1. 在安装向导中，可以选择安装位置（建议保持默认）
2. 可以选择是否创建桌面快捷方式
3. 点击「安装」等待完成
4. 安装完成后，勾选「运行 Qritor」并点击「完成」

### 第四步：首次启动

安装完成后，可以通过以下方式启动 Qritor：
- 桌面快捷方式
- 开始菜单搜索「Qritor」
- 开始菜单 → 所有程序 → Qritor

### Windows 常见问题

**Q: 安装后打开是黑屏/白屏怎么办？**

尝试以下方法：
1. 完全关闭 Qritor（检查任务栏托盘图标）
2. 右键点击 Qritor 快捷方式 → 「以管理员身份运行」

**Q: 如何卸载？**

1. 打开「设置」→「应用」→「已安装的应用」
2. 找到 Qritor，点击「卸载」

---

## 自动更新

Qritor 支持自动更新功能：

1. 当有新版本发布时，应用会在启动时自动检测
2. 弹出更新提示后，点击「立即更新」
3. 下载完成后会自动安装并重启应用

您也可以在应用内手动检查更新：设置 → 关于 → 检查更新

---

## 数据安全

- **本地存储**：所有创作数据存储在您的本地设备
- **隐私保护**：我们不会收集您的创作内容

## 获取帮助

遇到问题？您可以：
- 查看 [常见问题](/docs/zh/support/faq)
- 通过 [联系我们](/docs/zh/support/contact) 获取支持
        `,
    quickLinks: [],
  },
  faq: {
    breadcrumb: "支持",
    title: "常见问题",
    description: "关于 Qritor 使用过程中的常见问题与解答。",
    body: `
## 账户与登录

### 如何注册 Qritor 账户？

访问 [Qritor 官网](https://qritor.com) 或打开桌面客户端，点击"注册"，使用邮箱完成注册。

### 忘记密码怎么办？

在登录页面点击 **「忘记密码」**，输入注册邮箱，系统会发送重置链接到您的邮箱。

### 桌面端和网页端的数据互通吗？

是的。您使用同一账户登录后，创作方法、模块类型、技能等配置数据会通过云端同步。小说内容存储在本地桌面端。

## AI 与创作

### AI 生成的内容质量不满意怎么办？

- **换个模型试试**：不同模型擅长的领域不同，可以在 AI 助手底部切换模型（详见 [模型](/docs/zh/user-guide/ai-models)）
- **提供更多上下文**：用 [@提及](/docs/zh/user-guide/ai-mention) 引用相关角色、场景等，帮助 AI 更好地理解需求
- **细化指令**：把笼统的要求拆分为具体的描述，例如"写一段紧张的追逐戏，主角在雨夜的巷子里逃跑"比"写下一段"效果更好
- **先写大纲**：设置章节大纲后，AI 续写时会参考大纲把控方向

### AI 会读取我的哪些内容？

在 Agent 模式下，AI 可以通过工具调用读取当前小说的所有内容（章节、角色、场景、设定等）。但 AI **不会**跨小说读取数据，也不会访问您的账户信息。

### 积分是怎么消耗的？

每次 AI 对话都会消耗积分，消耗量取决于使用的模型等级和对话长度。不同模型有不同的倍率，详见 [积分](/docs/zh/pricing/credits) 页面。

### 积分用完了怎么办？

您可以在 [定价](/docs/zh/pricing/plans) 页面购买积分套餐，或等待每月免费积分刷新。

## 桌面客户端

### 支持哪些操作系统？

- **macOS**：10.15 (Catalina) 或更高版本，支持 Apple Silicon 和 Intel
- **Windows**：Windows 10 (64位) 或更高版本

详见 [下载安装指南](/docs/zh/support/download-guide)。

### 安装时遇到安全警告怎么办？

这是正常现象。由于 Qritor 是新发布的软件，Windows SmartScreen 和浏览器可能会显示安全警告。详细的处理方法见 [下载安装指南](/docs/zh/support/download-guide)。

### 数据存储在哪里？

您的小说内容存储在**本地设备**上。创作方法、模块类型等配置数据同时存储在本地和云端，支持同步。

### 如何更新到最新版本？

Qritor 支持自动更新。您也可以在 设置 → 软件更新 中手动检查更新。详见 [系统配置](/docs/zh/config/configuration)。

## 更多帮助

如果以上内容没有解决您的问题，欢迎通过 [联系我们](/docs/zh/support/contact) 页面获取支持。
        `,
  },
  contact: {
    breadcrumb: "支持",
    title: "联系我们",
    description: "通过邮件、社交媒体或社区与 Qritor 团队取得联系。",
    body: `
## 邮件

如有任何问题、建议或合作意向，欢迎发送邮件至：

**nick@qritor.com**

我们的工作时间为周一至周五 9:00 - 18:00（美国山地时间），通常会在 1-2 个工作日内回复。

## 应用内反馈

在 Qritor 官网登录后，访问 [反馈页面](/feedback) 可以直接提交：

- **Bug 报告**：遇到程序错误或异常行为
- **功能建议**：希望 Qritor 增加的新功能
- **其他反馈**：任何想法和意见

支持上传截图，方便我们更快定位问题。

## 社区

加入 Qritor 社区，与其他创作者交流：

- **Discord**：[加入 Qritor Discord](https://discord.gg/V2hNwCZT3J) — 最活跃的社区，可以交流创作心得、提问和获取最新动态

## 社交媒体

关注我们的社交媒体账号，获取产品更新和创作资讯：

**国际平台**

- **X (Twitter)**：[@Qritor](https://x.com/Qritor)
- **Reddit**：[u/Qritor](https://www.reddit.com/u/Qritor)
- **YouTube**：[@Qritor](https://www.youtube.com/@Qritor)
- **TikTok**：[@.qritor](https://www.tiktok.com/@.qritor)

**中文平台**

- **抖音**：[Qritor](https://v.douyin.com/_HZRGSbarMc/)
- **小红书**：[Qritor](https://xhslink.com/m/7StwwqITQEH)

## 退款申请

如需申请退款，请发送邮件至 **nick@qritor.com**，邮件标题格式为：

**【退款申请】您的注册邮箱**

我们会在 3 个工作日内审核，退款将在 5-10 个工作日内原路返回。
        `,
  },
};

export const enSupportContent: Record<string, DocsContentEntry> = {
  "download-guide": {
    breadcrumb: "Support",
    title: "Download & Install Guide",
    description:
      "This guide will help you download and install the Qritor desktop client, including detailed system requirements and installation steps.",
    body: `
## System Requirements

### macOS
- macOS 10.15 (Catalina) or later
- Apple Silicon (M1/M2/M3) or Intel processor
- At least 4GB RAM
- 500MB available disk space

### Windows
- Windows 10 (64-bit) or later
- At least 4GB RAM
- 500MB available disk space

## Download

Visit the [Download Page](/download) to get the latest version of Qritor desktop client.

The page will automatically detect your operating system and recommend the best version.

---

## macOS Installation Guide

### Step 1: Choose the Right Version

- **Apple Silicon (M1/M2/M3 chip)** → Download **arm64** version
- **Intel chip** → Download **x64** version

Not sure about your chip type? Click Apple menu → "About This Mac" to check.

### Step 2: Install the App

1. Double-click the downloaded \`.dmg\` file to open the disk image
2. Drag the **Qritor icon** to the **Applications folder**
3. Wait for the copy to complete

### Step 3: First Launch

1. Open "Finder" → "Applications" folder
2. Double-click **Qritor** to launch
3. The app is Apple notarized and will run directly

---

## Windows Installation Guide

### Important: About Security Warnings

Since Qritor is newly released software, Windows and browsers will display security warnings. **This is normal** and doesn't mean there's anything wrong with the software.

### Step 1: Download the Installer

After clicking download, your browser may show a warning:

![Browser download warning](/images/docs/win-download-warning-3.png)

**Solution:** Click the **"..."** button, then select **"Keep"**

![Select Keep file](/images/docs/win-download-warning-2.png)

### Step 2: Handle SmartScreen Warning

When opening the installer, you may see a SmartScreen warning:

![SmartScreen warning](/images/docs/win-download-warning-1.png)

**Solution:** Click **"..."** → **"Keep anyway"**

### Step 3: Complete Installation

1. Choose installation location (keep default recommended)
2. Choose whether to create desktop shortcut
3. Click "Install" and wait
4. Check "Run Qritor" and click "Finish"

---

## Auto Update

Qritor supports automatic updates. When a new version is released, the app will prompt you to update.

## Data Security

- **Local Storage**: All creative data is stored on your local device
- **Privacy**: We don't collect your creative content

## Get Help

- Check the [FAQ](/docs/en/support/faq)
- [Contact Us](/docs/en/support/contact) for support
        `,
    quickLinks: [],
  },
  faq: {
    breadcrumb: "Support",
    title: "FAQ",
    description: "Frequently asked questions about using Qritor.",
    body: `
## Account & Login

### How do I create a Qritor account?

Visit [qritor.com](https://qritor.com) or open the desktop client, click "Sign Up," and register with your email.

### I forgot my password. What should I do?

On the login page, click **"Forgot Password"**, enter your registered email, and the system will send a reset link to your inbox.

### Is data shared between the desktop app and website?

Yes. When you log in with the same account, configuration data such as creation methods, module types, and skills sync via the cloud. Novel content is stored locally on your desktop.

## AI & Writing

### What if I'm not satisfied with AI-generated content?

- **Try a different model**: Different models excel in different areas — switch models at the bottom of the AI assistant (see [AI Models](/docs/en/user-guide/ai-models))
- **Provide more context**: Use [@Mention](/docs/en/user-guide/ai-mention) to reference relevant characters, scenes, etc., helping AI better understand your needs
- **Be specific**: Break vague requests into concrete descriptions — "write a tense chase scene where the protagonist escapes through rainy alleyways at night" works better than "write the next part"
- **Set an outline first**: When you set a chapter outline, AI references it to maintain direction when continuing

### What content can AI access?

In Agent mode, AI can read all content in the current novel (chapters, characters, scenes, settings, etc.) through tool calls. However, AI **cannot** read data across different novels, nor can it access your account information.

### How are credits consumed?

Each AI conversation consumes credits. The amount depends on the model tier used and conversation length. Different models have different rate multipliers — see [Credits](/docs/en/pricing/credits) for details.

### What if I run out of credits?

You can purchase credit packages on the [Plans](/docs/en/pricing/plans) page, or wait for your monthly free credits to refresh.

## Desktop Client

### Which operating systems are supported?

- **macOS**: 10.15 (Catalina) or later, supports both Apple Silicon and Intel
- **Windows**: Windows 10 (64-bit) or later

See [Download & Install Guide](/docs/en/support/download-guide) for details.

### I see security warnings during installation. Is this normal?

Yes, this is normal. Since Qritor is newly released software, Windows SmartScreen and browsers may display security warnings. See [Download & Install Guide](/docs/en/support/download-guide) for step-by-step solutions.

### Where is my data stored?

Your novel content is stored **locally on your device**. Configuration data like creation methods and module types are stored both locally and in the cloud, supporting sync.

### How do I update to the latest version?

Qritor supports automatic updates. You can also manually check for updates in Settings → Software Updates. See [System Configuration](/docs/en/config/configuration) for details.

## More Help

If the above doesn't answer your question, feel free to reach out via our [Contact Us](/docs/en/support/contact) page.
        `,
  },
  contact: {
    breadcrumb: "Support",
    title: "Contact Us",
    description:
      "Get in touch with the Qritor team via email, social media, or community channels.",
    body: `
## Email

For any questions, suggestions, or partnership inquiries, feel free to email us at:

**nick@qritor.com**

Our working hours are Monday through Friday, 9:00 AM - 6:00 PM (US Mountain Time). We typically respond within 1-2 business days.

## In-App Feedback

After logging in to the Qritor website, visit the [Feedback page](/feedback) to submit:

- **Bug reports**: Program errors or unexpected behavior
- **Feature requests**: New features you'd like to see in Qritor
- **Other feedback**: Any thoughts and suggestions

Screenshot uploads are supported to help us identify issues faster.

## Community

Join the Qritor community to connect with other writers:

- **Discord**: [Join Qritor Discord](https://discord.gg/V2hNwCZT3J) — Our most active community for sharing creative tips, asking questions, and staying up to date

## Social Media

Follow us on social media for product updates and creative content:

**International**

- **X (Twitter)**: [@Qritor](https://x.com/Qritor)
- **Reddit**: [u/Qritor](https://www.reddit.com/u/Qritor)
- **YouTube**: [@Qritor](https://www.youtube.com/@Qritor)
- **TikTok**: [@.qritor](https://www.tiktok.com/@.qritor)

**Chinese Platforms**

- **Douyin**: [Qritor](https://v.douyin.com/_HZRGSbarMc/)
- **Xiaohongshu**: [Qritor](https://xhslink.com/m/7StwwqITQEH)

## Refund Requests

To request a refund, send an email to **nick@qritor.com** with the subject line:

**[Refund Request] Your registered email**

We will review your request within 3 business days, and refunds are processed within 5-10 business days via the original payment method.
        `,
  },
};
