import type { DocsContentEntry } from "../types";

// ============== 价格与计费 ==============

export const zhPricingContent: Record<string, DocsContentEntry> = {
  credits: {
    title: "积分",
    description: "了解 Qritor 积分系统的运作方式、消耗规则和管理方法。",
    body: `
## 什么是 Qritor Credits？

Credits 是 Qritor 中高级 AI 模型的资源配额，用于衡量 AI 执行任务时消耗的计算资源。以下操作会消耗 Credits：

- **智能写作** — AI 续写、润色、修改章节内容
- **Ask 模式** — 在 AI 助手中进行对话和提问
- **Agent 模式** — AI 自主创建、修改模块和内容
- **图片生成** — AI 生成角色立绘、场景插图等
- **视频生成** — AI 生成短视频内容

实际消耗量取决于任务复杂度和所用模型。各功能的具体消耗可参考下方的消耗参考表。

## 扣减规则

- 系统会 **优先消耗最先到期的积分**。
- 积分仅在 AI 调用 **成功** 时扣除，调用失败不扣费。
- 积分用尽后，AI 功能将暂停，其他编辑功能不受影响。

## 消耗参考

积分按 AI 调用的实际 token 用量计费，不同模型的单价不同。以下为典型场景的消耗估算，**实际消耗以账单明细为准**。

### 智能写作（Agent 模式）

AI 写作通过 Agent 模式执行：先搜索大纲、参与实体、前文等上下文信息，经过多轮对话收集必要素材后，再生成章节内容。一次完整的写作任务通常包含多轮 AI 调用。

| 场景 | 轻量模型（如 DeepSeek V3.2） | 旗舰模型（如 Claude Sonnet 4.5） |
|------|---------------------------|------------------------------|
| 简单问答（1 轮） | ~1-2 积分 | ~5-8 积分 |
| 章节续写（多轮） | ~10-30 积分 | ~50-150 积分 |
| 模块批量初始化 | ~30-80 积分 | ~100-300 积分 |

### Ask 模式

Ask 模式为只读对话，不执行工具调用，消耗较低。单次对话通常消耗 1-5 积分，具体取决于上下文长度和所选模型。

## 查看用量

登录 Qritor 官网，进入 **个人中心 > 账单管理**，可查看积分余额和消费明细，包括每笔消耗的模型、token 用量和扣除积分。

## 积分类型

- **订阅积分**：订阅方案按月发放，周期结束后重置。
- **邀请积分**：通过邀请好友获得，有效期 30 天。
- **积分包**：单独购买的积分补充包，有效期 30 天（即将推出）。

## 积分用完了？

- **升级方案**：切换到更高级的订阅方案获取更多月度积分。
- **邀请好友**：邀请人获得 50 积分，受邀人获得 30 积分。
- **积分包**：后续将推出单独购买的积分包（敬请期待）。
        `,
    quickLinks: [
      {
        title: "定价方案",
        description: "选择适合你的方案",
        path: "/docs/zh/pricing/plans",
        icon: "arrow",
      },
      {
        title: "计费说明",
        description: "了解支付和账单管理",
        path: "/docs/zh/pricing/billing",
        icon: "arrow",
      },
    ],
  },
  plans: {
    title: "定价",
    description:
      "Qritor 提供四个订阅方案，均为月度自动续费。所有功能消耗以 Credits 计算。",
    body: `
## 个人方案

| 方案 | 月费 | 每月 Credits | 项目数量 | 模型权限 |
|------|------|------------|---------|---------|
| **Free** | $0 | 100 | 3 个 | 经济型模型 |
| **Plus** | $20 | 2,000 | 不限 | 经济型 + 标准型 |
| **Pro** | $60 | 6,000 | 不限 | 全部模型 |
| **Max** | $200 | 20,000 | 不限 | 全部模型 |

## 方案详情

### Free — 适合初次体验 AI 创作

- 每月 100 积分
- 基础 AI 续写功能
- 经济型模型可用
- 最多 3 个创作项目

### Plus — 个人创作者的日常之选

- 每月 2,000 积分
- 全部标准模型可用
- 无限创作项目
- 灵感助手完整功能
- 优先技术支持

### Pro — 专业创作者的不二之选

- 每月 6,000 积分
- 全部模型可用（含旗舰）
- 无限创作项目
- 漫画与分镜生成
- 优先体验新功能

### Max — 为重度创作者与工作室打造

- 每月 20,000 积分
- 全部旗舰模型无限制
- 无限创作项目
- 漫画、短剧、有声书全功能
- 最优先体验新功能
- 专属技术支持

## 所有方案通用功能

所有方案（含 Free）均包含以下功能：

- 模块化小说编辑器（章节、角色、场景、道具、组织等）
- AI 对话助手（Agent 模式 + Ask 模式）
- 世界观管理（实体管理、关系图谱、动态信息追踪）
- 剧情管理（故事线、伏笔追踪、剧情分析）
- AI 助手工具栏（续写、润色、信息提取、质量评估等）
- 本地数据存储，离线可用

## 模型等级

Qritor 将 AI 模型分为四个等级，不同方案可访问的等级不同：

| 等级 | 代表模型 | 可用方案 |
|------|---------|---------|
| **经济型** | Grok Fast、GLM Flash、DeepSeek（推荐）、MiniMax | 全部方案 |
| **标准型** | Kimi（推荐）、Gemini Flash | Plus 及以上 |
| **高级型** | GLM | Pro 及以上 |
| **旗舰型** | Claude Sonnet（推荐）、Claude Opus | Pro 及以上 |

## 积分包（即将推出）

除月度订阅积分外，后续将支持单独购买积分补充包：

- 按需购买，不影响当前订阅方案
- 有效期 30 天
- 系统优先消耗最先到期的积分

## Credits 耗尽后

Credits 用尽后，AI 功能将暂停使用，但编辑器、模块管理等非 AI 功能不受影响。你可以：

- **升级方案**：获取更多月度 Credits
- **邀请好友**：邀请人获得 50 Credits，受邀人获得 30 Credits
- **购买积分包**：即将推出

## 订阅管理

- **升级**：升级后立即生效，旧方案未使用的 Credits 自动结转，保留原到期日。
- **取消订阅**：方案在当前计费周期内保持有效，到期后自动降为 Free；未使用的订阅 Credits 将失效。
- **Credits 有效期**：订阅 Credits 在当前周期（30 天）内有效，不累计到下一周期。
        `,
    quickLinks: [
      {
        title: "立即订阅",
        description: "选择你的方案",
        path: "/pricing",
        icon: "arrow",
      },
      {
        title: "积分说明",
        description: "了解积分消耗明细",
        path: "/docs/zh/pricing/credits",
        icon: "arrow",
      },
    ],
  },
  billing: {
    title: "计费",
    description: "了解 Qritor 的计费周期、支付方式、订阅管理和退款政策。",
    body: `
## 管理订阅

登录 Qritor 官网，进入 **个人中心 > 账单管理**，可以查看当前订阅状态、Credits 余额、消费明细，以及管理支付方式。

## 计费周期

- 所有付费方案按 **30 天** 为一个计费周期。
- 付费方案到期后 **不会自动续费**，需手动续订。
- 未续订将降级为 Free 方案，未使用的订阅 Credits 过期失效。

## 支付方式

当前通过 Stripe 支持以下支付方式：

- **信用卡 / 借记卡**（Visa、Mastercard 等）
- **微信支付**

首次支付后可保存卡片信息，后续续费或升级时一键扣款，无需重复输入。

## 支付流程

1. 选择方案并创建订单
2. 跳转至 Stripe 安全支付页面完成付款
3. 支付成功后，订阅立即激活，Credits 即时到账
4. 订单创建后 **30 分钟内** 未支付将自动过期

## 升级方案

升级后立即生效。旧方案未使用的 Credits 会 **自动结转** 到新方案中，保留原到期日，不会浪费。

## 订单状态

| 状态 | 说明 |
|------|------|
| 待支付 | 订单已创建，等待支付（30 分钟内有效） |
| 支付中 | 正在通过 Stripe 处理支付 |
| 已支付 | 支付完成，订阅已激活 |
| 已取消 | 用户主动取消 |
| 已过期 | 超过 30 分钟未支付，订单自动失效 |

## 邀请奖励

通过专属邀请码邀请好友注册 Qritor，双方均可获得 Credits 奖励：

- **邀请人**：获得 50 Credits（有效期 30 天）
- **受邀人**：获得 30 Credits（有效期 30 天）

邀请码可在个人中心的邀请页面获取。达到邀请里程碑还有额外奖励。

## 常见问题

### 付款失败怎么办？
请检查卡片余额和有效期，或更换支付方式重试。微信支付请确保网络正常。如持续失败，请通过联系我们页面获取帮助。

### 可以退款吗？
订阅需在支付后 **24 小时内** 申请退款，且未使用 Credits。请通过联系我们页面提交退款申请。

### 升级后旧 Credits 怎么处理？
升级时，旧方案的剩余 Credits 会自动结转到新方案中，保留原到期日。

### 方案到期后会怎样？
到期后自动降级为 Free 方案，未使用的订阅 Credits 失效。编辑器和模块管理等非 AI 功能不受影响。
        `,
    quickLinks: [
      {
        title: "定价方案",
        description: "查看所有方案",
        path: "/docs/zh/pricing/plans",
        icon: "arrow",
      },
      {
        title: "联系我们",
        description: "获取支付帮助",
        path: "/docs/zh/support/contact",
        icon: "arrow",
      },
    ],
  },
};

export const enPricingContent: Record<string, DocsContentEntry> = {
  credits: {
    title: "Credits",
    description:
      "Learn how the Qritor credit system works, including consumption rules and management.",
    body: `
## What are Qritor Credits?

Credits are the resource quota for advanced AI models in Qritor, used to measure the computational resources consumed when AI executes tasks. The following operations consume Credits:

- **Smart Writing** — AI continue, polish, and modify chapter content
- **Ask Mode** — Conversations and questions in the AI Assistant
- **Agent Mode** — AI autonomously creates, modifies modules and content
- **Image Generation** — AI-generated character portraits, scene illustrations, etc.
- **Video Generation** — AI-generated short video content

Actual consumption depends on task complexity and the model used. See the consumption reference table below for specifics.

## Deduction Rules

- The system **prioritizes consuming credits that expire soonest**.
- Credits are only deducted on **successful** AI calls. Failed requests are not charged.
- When credits run out, AI features are paused, but other editing features remain available.

## Consumption Reference

Credits are billed based on actual token usage per AI call, with different rates for different models. The following are estimates for typical scenarios. **Actual consumption is based on your billing details.**

### Smart Writing (Agent Mode)

AI writing is executed via Agent mode: it first searches for outlines, participating entities, preceding text, and other contextual information, collecting necessary material through multiple dialogue rounds before generating chapter content. A complete writing task typically involves multiple AI calls.

| Scenario | Lightweight Model (e.g. DeepSeek V3.2) | Flagship Model (e.g. Claude Sonnet 4.5) |
|----------|----------------------------------------|------------------------------------------|
| Simple Q&A (1 round) | ~1-2 credits | ~5-8 credits |
| Chapter writing (multi-round) | ~10-30 credits | ~50-150 credits |
| Batch module initialization | ~30-80 credits | ~100-300 credits |

### Ask Mode

Ask mode is read-only conversation without tool calls, consuming fewer credits. A single conversation typically costs 1-5 credits, depending on context length and model selected.

## Usage Tracking

Sign in to the Qritor website, go to **Profile > Billing**, to view your credit balance and transaction history, including the model, token usage, and credits deducted for each call.

## Credit Types

- **Subscription Credits**: Issued monthly with your plan, reset at the end of each cycle.
- **Referral Credits**: Earned by inviting friends, valid for 30 days.
- **Credit Packs**: Standalone credit top-ups, valid for 30 days (coming soon).

## Running Out of Credits?

- **Upgrade your plan**: Switch to a higher subscription tier for more monthly credits.
- **Invite friends**: Referrer gets 50 credits, invitee gets 30 credits.
- **Credit packs**: Standalone credit packs will be available soon.
        `,
    quickLinks: [
      {
        title: "Plans",
        description: "Choose the plan that fits you",
        path: "/docs/en/pricing/plans",
        icon: "arrow",
      },
      {
        title: "Billing",
        description: "Learn about payments and invoices",
        path: "/docs/en/pricing/billing",
        icon: "arrow",
      },
    ],
  },
  plans: {
    title: "Plans",
    description:
      "Qritor offers four subscription tiers, all billed monthly with auto-renewal. All usage is measured in Credits.",
    body: `
## Individual Plans

| Plan | Monthly Fee | Monthly Credits | Projects | Model Access |
|------|------------|----------------|----------|-------------|
| **Free** | $0 | 100 | 3 | Economy models |
| **Plus** | $20 | 2,000 | Unlimited | Economy + Standard |
| **Pro** | $60 | 6,000 | Unlimited | All models |
| **Max** | $200 | 20,000 | Unlimited | All models |

## Plan Details

### Free — Perfect for trying AI-powered writing

- 100 credits/month
- Basic AI continuation
- Budget models available
- Up to 3 projects

### Plus — Ideal for everyday creative writing

- 2,000 credits/month
- All standard models available
- Unlimited projects
- Full Inspiration Assistant
- Priority support

### Pro — The go-to choice for professional writers

- 6,000 credits/month
- All models including flagships
- Unlimited projects
- Comic & storyboard generation
- Early access to new features

### Max — Built for power users and studios

- 20,000 credits/month
- All flagship models unlimited
- Unlimited projects
- Comics, scripts & audiobook features
- Highest priority for new features
- Dedicated support

## Features Included in All Plans

All plans (including Free) include the following:

- Modular novel editor (chapters, characters, scenes, props, organizations, etc.)
- AI assistant (Agent mode + Ask mode)
- Worldbuilding management (entity management, relation graph, dynamic info tracking)
- Plot management (storylines, foreshadowing tracking, plot analysis)
- AI assistant toolbar (continue, polish, information extraction, quality assessment, etc.)
- Local data storage, offline capable

## Model Tiers

Qritor organizes AI models into four tiers, with different plans granting access to different tiers:

| Tier | Representative Models | Available Plans |
|------|----------------------|----------------|
| **Economy** | Grok Fast, GLM Flash, DeepSeek (recommended), MiniMax | All plans |
| **Standard** | Kimi (recommended), Gemini Flash | Plus and above |
| **Advanced** | GLM | Pro and above |
| **Flagship** | Claude Sonnet (recommended), Claude Opus | Pro and above |

## Credit Packs (Coming Soon)

In addition to monthly subscription credits, standalone credit top-up packs will be available:

- Purchase on demand without affecting your current plan
- Valid for 30 days
- System prioritizes consuming credits that expire soonest

## When Credits Run Out

When credits are exhausted, AI features will be paused, but the editor, module management, and other non-AI features remain fully functional. You can:

- **Upgrade your plan**: Get more monthly Credits
- **Invite friends**: Referrer gets 50 Credits, invitee gets 30 Credits
- **Purchase credit packs**: Coming soon

## Subscription Management

- **Upgrade**: Takes effect immediately. Unused credits from the old plan carry over with their original expiry date.
- **Cancel**: Your plan remains active through the current billing cycle, then downgrades to Free. Unused subscription credits will expire.
- **Credit validity**: Subscription credits are valid for the current cycle (30 days) and do not roll over.
        `,
    quickLinks: [
      {
        title: "Subscribe Now",
        description: "Choose your plan",
        path: "/pricing",
        icon: "arrow",
      },
      {
        title: "Credits",
        description: "Learn about credit consumption",
        path: "/docs/en/pricing/credits",
        icon: "arrow",
      },
    ],
  },
  billing: {
    title: "Billing",
    description:
      "Learn about billing cycles, payment methods, subscription management, and refund policies in Qritor.",
    body: `
## Manage Subscription

Sign in to the Qritor website, go to **Profile > Billing** to view your current subscription status, Credits balance, spending history, and manage payment methods.

## Billing Cycle

- All paid plans use a **30-day** billing cycle.
- Paid plans **do not auto-renew**; manual renewal is required.
- Without renewal, you will be downgraded to the Free plan and unused subscription Credits will expire.

## Payment Methods

Payments are processed securely via Stripe with the following methods:

- **Credit / Debit Card** (Visa, Mastercard, etc.)
- **WeChat Pay**

After your first payment, you can save your card for one-click checkout on future renewals or upgrades.

## Payment Flow

1. Select a plan and create an order
2. Redirect to the Stripe secure checkout page to complete payment
3. Once payment succeeds, your subscription activates immediately and Credits are added to your account
4. Orders not paid within **30 minutes** will automatically expire

## Upgrading Plans

Upgrades take effect immediately. Unused Credits from your previous plan are **automatically carried over** to the new plan, retaining their original expiration date.

## Order Status

| Status | Description |
|--------|-------------|
| Pending | Order created, awaiting payment (valid for 30 minutes) |
| Processing | Payment is being processed via Stripe |
| Paid | Payment completed, subscription activated |
| Cancelled | Cancelled by the user |
| Expired | Order expired due to non-payment within 30 minutes |

## Referral Rewards

Invite friends to sign up for Qritor using your referral code, and both of you earn Credits:

- **Referrer**: 50 Credits (valid for 30 days)
- **Invitee**: 30 Credits (valid for 30 days)

Get your referral code from the referral page in your profile. Additional rewards are available for reaching invitation milestones.

## FAQ

### What if my payment fails?
Check your card balance and expiration date, or try a different payment method. For WeChat Pay, ensure your network connection is stable. If the issue persists, please reach out via the Contact Us page.

### Can I get a refund?
Refund requests must be submitted within **24 hours** of payment, with no Credits used. Please submit your request via the Contact Us page.

### What happens to my old Credits when I upgrade?
When you upgrade, remaining Credits from your old plan are automatically carried over to your new plan, retaining their original expiration date.

### What happens when my plan expires?
You will be downgraded to the Free plan, and unused subscription Credits will expire. Non-AI features such as the editor and module management remain unaffected.
        `,
    quickLinks: [
      {
        title: "Plans",
        description: "View all plans",
        path: "/docs/en/pricing/plans",
        icon: "arrow",
      },
      {
        title: "Contact Us",
        description: "Get payment help",
        path: "/docs/en/support/contact",
        icon: "arrow",
      },
    ],
  },
};
