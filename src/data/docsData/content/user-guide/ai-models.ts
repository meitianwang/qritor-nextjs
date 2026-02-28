import type { DocsContentEntry } from "../../types";

export const zhAiModels: DocsContentEntry = {
    title: "AI 模型",
    description:
      "Qritor 集成了多款顶尖 AI 语言模型，覆盖从经济实用到旗舰高能的全系需求，满足不同场景和预算的创作要求。",
    body: `
## 模型等级

Qritor 将 AI 模型划分为四个等级。等级越高，综合能力越强，积分消耗也相应增加。

| 等级 | 说明 |
|------|------|
| **经济型** | 性价比最高，适合日常续写、快速测试、短对话 |
| **标准型** | 能力均衡，适合常规中长篇创作 |
| **高级型** | 超强上下文，适合超长篇、全文风格控制 |
| **旗舰型** | 综合能力最强，适合高品质精品创作 |

---

## 经济型

### DeepSeek（默认模型）

DeepSeek V3.2 Thinking 是 Qritor 的**默认模型**，国产推理模型代表作。内置思维链（Chain-of-Thought）能力，在中文创作推理上表现出色，是性价比最高的选择。

- **特点**：思维链推理、中文优化、快速响应、富有创意
- **适合**：日常续写、剧情构思、角色对话
- **上下文窗口**：131K tokens
- **倍率**：0.4x / 0.6x

### GLM-4.7 Flash

智谱 AI 的轻量快速模型，响应速度极快，适合需要即时反馈的短任务。

- **特点**：极速响应、轻量高效、中文友好
- **适合**：快速测试、即时灵感、短对话
- **上下文窗口**：128K tokens
- **倍率**：0.3x / 0.5x

### MiniMax M2.5

MiniMax 的中文叙事专项模型，超长上下文配合叙事能力，擅长维护长篇创作的连贯性。

- **特点**：超长上下文、叙事连贯、中文优化
- **适合**：长篇章节续写、叙事一致性维护
- **上下文窗口**：200K tokens
- **倍率**：0.5x / 1.4x

---

## 标准型

### Gemini 3 Flash

Google 的快速大上下文模型，200K tokens 上下文，流式响应迅速，擅长长文档理解与生成。

- **特点**：大上下文、快速流式、多语言
- **适合**：全文参考续写、长章节生成
- **上下文窗口**：200K tokens
- **倍率**：0.7x / 3.5x

### Kimi K2.5

月之暗面（Moonshot AI）的创意对话模型，对中文语境理解深入，角色塑造能力出色。

- **特点**：中文对话自然、角色塑造、富有创意
- **适合**：角色设计、对话生成、情感描写
- **上下文窗口**：131K tokens
- **倍率**：0.8x / 3x

### GLM-5

智谱 AI 的中文叙事旗舰，风格稳定，输出质量高，是对文风一致性有要求时的首选。

- **特点**：风格稳定、中文叙事流畅、输出质量高
- **适合**：正式章节写作、需要稳定文风的场景
- **上下文窗口**：128K tokens
- **倍率**：1x / 3.2x

---

## 高级型

### Gemini 3.1 Pro

Google 最新旗舰模型，具备惊人的 **100 万 tokens** 超长上下文，可以将整部长篇小说都纳入单次对话，风格稳定，创意叙事能力突出。

- **特点**：100 万 tokens 超长上下文、风格稳定、创意叙事
- **适合**：百万字超长篇全文参考续写、全书风格一致性控制
- **上下文窗口**：1,000,000 tokens
- **倍率**：2x / 12x

---

## 旗舰型

### Claude Sonnet 4.6

Anthropic 旗舰中级模型，在创意写作领域表现顶尖。角色心理刻画细腻，情感层次丰富，文风稳定可控，是高品质创作的主力之选。

- **特点**：创意写作顶尖、角色塑造深入、风格精细控制
- **适合**：精品章节写作、复杂人物设计、高品质续写
- **上下文窗口**：200K tokens
- **倍率**：3x / 15x

### Claude Opus 4.6

Anthropic 最强旗舰模型，综合能力全面领先。在叙事深度、角色心理描写、文风把控方面均处于业界顶尖水平，适合追求文学质感的高要求创作。

- **特点**：全面最强、叙事深度、角色心理、文风极佳
- **适合**：高要求精品创作、复杂剧情设计、文学性写作
- **上下文窗口**：200K tokens
- **倍率**：5x / 25x

---

## 如何选择模型

| 场景 | 推荐模型 |
|------|---------|
| 日常续写，性价比优先 | DeepSeek（默认） |
| 快速测试和即时灵感 | GLM-4.7 Flash |
| 长篇叙事连贯性维护 | MiniMax M2.5 |
| 角色设计与对话生成 | Kimi K2.5 |
| 稳定文风写作 | GLM-5 |
| 百万字全文参考续写 | Gemini 3.1 Pro |
| 高品质精品章节 | Claude Sonnet 4.6 |
| 极致文学质感 | Claude Opus 4.6 |

## 倍率说明

模型选择器中每个模型名称右侧显示的 **输入倍率 / 输出倍率**，反映该模型相对的积分消耗比例——倍率越高，同等长度的文本消耗积分越多。

---

## 遇到网络错误时

AI 调用失败时，对话框中会显示错误提示。常见情况及处理方式如下：

| 错误提示 | 原因 | 处理方式 |
|---------|------|---------|
| 网络连接失败，请检查网络后重试 | 本地网络问题或服务器无法访问 | 检查网络，或切换到其他模型重试 |
| 网络连接超时，请检查网络后重试 | 请求超时，模型响应较慢 | 稍后重试，或切换到响应更快的模型 |
| AI 服务暂时不可用，请稍后再试 | 模型提供商服务器故障 | 切换到其他提供商的模型 |
| 所选模型不可用，请切换其他模型 | 当前模型已下线或暂停服务 | 在模型选择器中切换到其他模型 |

### 如何切换模型

遇到错误后，点击 AI 助手输入框左侧的**模型选择器**，选择其他模型即可继续创作。切换后的选择会自动保存，下次打开时沿用。

### 备用模型推荐

不同提供商独立运营，单一提供商故障不影响其他模型。遇到错误时，优先切换到不同提供商的模型：

- **DeepSeek / GLM 不可用**：切换到 Gemini 3 Flash 或 Kimi K2.5
- **Gemini 不可用**：切换到 DeepSeek 或 Claude 系列
- **Claude 不可用**：切换到 GLM-5 或 Gemini 3.1 Pro
        `,
  };

export const enAiModels: DocsContentEntry = {
    title: "AI Models",
    description:
      "Qritor integrates a curated selection of top-tier AI language models, from economical to flagship, to suit different creative needs and budgets.",
    body: `
## Model Tiers

Qritor organizes AI models into four tiers. Higher tiers offer stronger capabilities at a correspondingly higher credit cost.

| Tier | Description |
|------|-------------|
| **Economy** | Best value — daily writing, quick tests, short chats |
| **Standard** | Balanced — mid-to-long-form creative writing |
| **Advanced** | Massive context — ultra-long novels, full-book style control |
| **Flagship** | Top capability — premium, high-quality creative work |

---

## Economy

### DeepSeek (Default)

DeepSeek V3.2 Thinking is Qritor's **default model** — a leading Chinese-developed reasoning model. Built-in Chain-of-Thought capability delivers excellent reasoning for Chinese creative writing at the best value.

- **Strengths**: Chain-of-Thought reasoning, Chinese-optimized, fast, creative
- **Best for**: Daily continuation, plot brainstorming, character dialogue
- **Context window**: 131K tokens
- **Rate**: 0.4x / 0.6x

### GLM-4.7 Flash

A lightweight, ultra-fast model from Zhipu AI. Ideal for tasks where instant response matters most.

- **Strengths**: Ultra-fast response, lightweight, Chinese-friendly
- **Best for**: Quick tests, instant inspiration, short conversations
- **Context window**: 128K tokens
- **Rate**: 0.3x / 0.5x

### MiniMax M2.5

MiniMax's narrative-focused Chinese model. Excels at maintaining long-form narrative coherence.

- **Strengths**: Long context, narrative consistency, Chinese-optimized
- **Best for**: Long chapter continuation, narrative cohesion
- **Context window**: 200K tokens
- **Rate**: 0.5x / 1.4x

---

## Standard

### Gemini 3 Flash

Google's fast large-context model with 200K tokens context. Rapid streaming output with strong long-document comprehension.

- **Strengths**: Large context, fast streaming, multilingual
- **Best for**: Full-book reference continuation, long chapter generation
- **Context window**: 200K tokens
- **Rate**: 0.7x / 3.5x

### Kimi K2.5

Moonshot AI's creative dialogue model. Deep understanding of Chinese nuance with outstanding character portrayal.

- **Strengths**: Natural Chinese dialogue, character portrayal, creative
- **Best for**: Character design, dialogue generation, emotional writing
- **Context window**: 131K tokens
- **Rate**: 0.8x / 3x

### GLM-5

Zhipu AI's Chinese narrative flagship. Consistent style and high output quality, ideal when stylistic stability matters.

- **Strengths**: Stable style, fluent Chinese narrative, high output quality
- **Best for**: Formal chapter writing, style-consistent scenes
- **Context window**: 128K tokens
- **Rate**: 1x / 3.2x

---

## Advanced

### Gemini 3.1 Pro

Google's latest flagship model with an extraordinary **1 million token** context window — fit an entire long novel into a single conversation. Stable style with exceptional creative narrative.

- **Strengths**: 1M token context, stable style, creative narrative
- **Best for**: Million-word novels with full-book reference, global style consistency
- **Context window**: 1,000,000 tokens
- **Rate**: 2x / 12x

---

## Flagship

### Claude Sonnet 4.6

Anthropic's flagship mid-tier model — a top performer for creative writing. Nuanced character psychology, rich emotional depth, and precise style control make it the go-to for quality writing.

- **Strengths**: Top creative writing, deep character portrayal, precise style control
- **Best for**: Premium chapters, complex character design, high-quality continuation
- **Context window**: 200K tokens
- **Rate**: 3x / 15x

### Claude Opus 4.6

Anthropic's most powerful model — industry-leading across the board. Unmatched narrative depth, character psychology, and stylistic mastery for writers who demand the best.

- **Strengths**: All-around strongest, narrative depth, character psychology, exceptional style
- **Best for**: High-demand premium writing, complex plots, literary-quality prose
- **Context window**: 200K tokens
- **Rate**: 5x / 25x

---

## How to Choose

| Scenario | Recommended Model |
|----------|-------------------|
| Daily writing, best value | DeepSeek (default) |
| Quick tests & instant inspiration | GLM-4.7 Flash |
| Long-form narrative consistency | MiniMax M2.5 |
| Character design & dialogue | Kimi K2.5 |
| Consistent style writing | GLM-5 |
| Million-word full-book reference | Gemini 3.1 Pro |
| High-quality premium chapters | Claude Sonnet 4.6 |
| Literary excellence | Claude Opus 4.6 |

## About Rates

The **input rate / output rate** shown next to each model in the model selector reflects the relative credit cost — a higher rate means more credits consumed for the same amount of text.

---

## When You Encounter Network Errors

If an AI call fails, an error message appears in the chat. Common errors and how to handle them:

| Error Message | Cause | What to Do |
|--------------|-------|------------|
| Network connection failed, please check your network and retry | Local network issue or server unreachable | Check your connection, or switch to another model |
| Network connection timed out, please check your network and retry | Request timed out — model responding slowly | Wait and retry, or switch to a faster model |
| AI service temporarily unavailable, please try again later | Provider server outage | Switch to a model from a different provider |
| The selected model is unavailable. Please switch to another model | Model has been taken offline or suspended | Select a different model in the model selector |

### How to Switch Models

After an error, click the **model selector** to the left of the AI assistant input box and select a different model to continue writing. Your selection is saved automatically and will persist on next launch.

### Backup Model Suggestions

Each provider operates independently — an outage from one provider does not affect others. When errors occur, switch to a model from a different provider:

- **DeepSeek / GLM unavailable**: Switch to Gemini 3 Flash or Kimi K2.5
- **Gemini unavailable**: Switch to DeepSeek or the Claude series
- **Claude unavailable**: Switch to GLM-5 or Gemini 3.1 Pro
        `,
  };
