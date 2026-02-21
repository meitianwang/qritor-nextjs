-- 历史人物穿越小说「文风设定」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-hist-crossing-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hist-crossing-writing-style-setting-gen',
  '「文风设定」设定生成：为历史人物穿越小说生成文风设定，包括叙事视角、语言风格、节奏风格和氛围基调',
  '"Writing Style" setting generation: generate writing style settings for historical figure crossing novels',
  '## 「文风设定」设定生成 — 历史人物穿越小说

「文风设定」定义写作风格，决定读者的阅读体验。历史穿越小说的文风选择需要考虑历史氛围与现代可读性的平衡。

---

### 字段生成指南

#### 叙事视角

选项：第一人称 / 第三人称限知 / 第三人称全知 / 多视角

| 视角 | 优势 | 劣势 |
|------|------|------|
| 第一人称 | 代入感强，穿越体验最直接 | 信息面窄，不便展现他人视角 |
| 第三人称限知 | 兼顾代入感和叙事灵活性 | 需要技巧切换信息披露 |
| 第三人称全知 | 可展现全局博弈 | 代入感弱，容易泄露悬念 |
| 多视角 | 展现多方博弈最彻底 | 结构复杂，节奏难控 |

#### 语言风格

选项：古风典雅 / 半文半白 / 现代通俗 / 幽默诙谐

历史穿越中，语言风格要平衡"历史感"和"可读性"。应与穿越者的现代身份和原角色的历史身份做结合。

#### 节奏风格

选项：快节奏爽文 / 稳扎稳打 / 慢热细腻

与故事钩子和核心目标相配合——紧迫感强的设定适合快节奏，布局型故事适合稳扎稳打。

#### 氛围基调

选项：热血激昂 / 权谋深沉 / 轻松搞笑 / 悲壮苍凉

### 推荐搭配

根据已有设定信息，从以下经典搭配中选择最合适的：

| 故事风格 | 视角 | 语言 | 节奏 | 氛围 |
|---------|------|------|------|------|
| 权谋布局型 | 第三人称限知 | 半文半白 | 稳扎稳打 | 权谋深沉 |
| 热血改命型 | 第一人称 | 现代通俗 | 快节奏爽文 | 热血激昂 |
| 悲壮史诗型 | 第三人称全知 | 古风典雅 | 慢热细腻 | 悲壮苍凉 |
| 轻松搞笑型 | 第一人称 | 幽默诙谐 | 快节奏爽文 | 轻松搞笑 |

生成时应参考故事钩子和核心目标，选择最匹配的风格组合。',
  '## "Writing Style" Setting Generation — Historical Figure Crossing Novel

The "Writing Style" defines the writing approach, determining the reading experience. Historical crossing novels need to balance historical atmosphere with modern readability.

---

### Field Generation Guide

#### Narrative Perspective
Options: First person / Third person limited / Third person omniscient / Multi-perspective. Each has trade-offs between immersion and narrative flexibility.

#### Language Style
Options: Classical elegant / Semi-classical / Modern colloquial / Humorous. Must balance historical feel with readability.

#### Pacing Style
Options: Fast-paced / Steady progression / Slow-burn detailed. Should match the urgency level of the story hook.

#### Atmosphere Tone
Options: Passionate / Deep political intrigue / Light-hearted comedy / Tragically epic.

### Recommended Combinations
Select based on existing setting context: political intrigue type (3rd limited + semi-classical + steady + deep intrigue), hot-blooded type (1st person + modern + fast + passionate), epic type (3rd omniscient + classical + slow-burn + tragic), comedy type (1st person + humorous + fast + light-hearted).',
  (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1),
  1,
  26,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  novel_creation_method_id = VALUES(novel_creation_method_id),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
