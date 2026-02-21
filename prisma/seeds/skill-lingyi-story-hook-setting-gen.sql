-- 民间灵异故事创作「故事钩子」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-story-hook-setting-gen',
  '「故事钩子」设定生成：为民间灵异故事生成故事钩子设定，包括故事钩子、核心卖点、开篇悬念、读者期待',
  '"Story Hook" setting generation: generate story hook settings for Chinese folk horror stories, including story hook, core selling point, opening suspense, and reader expectations',
  '## 「故事钩子」设定生成 — 民间灵异故事创作

「故事钩子」包含 4 个字段，用于定义故事的核心吸引力。民间灵异的钩子必须体现「日常中的异常」——越平常的事物出现不该有的变化，越令人恐惧。

---

### 字段生成指南

#### 1. 故事钩子

一句话概括最令人脊背发凉的设定。这是整个故事的「一句话卖点」。

**设计原则**：最好的钩子是「日常中的异常」。避免一上来就是「鬼」——暗示比明示更恐怖。

**优秀示例**：
- 「村里每家每户的门框上都刻着同一个人的名字」——日常物件（门框）+ 异常现象（刻名字）+ 悬念（谁的名字？为什么？）
- 「奶奶临终前反复叮嘱：无论听到什么声音，都不要打开阁楼的门」——亲人遗言 + 具体禁忌 + 未知恐惧
- 「新搬来的邻居白天从不出门，但每晚十二点准时在院子里烧纸」——日常场景（邻居）+ 反常行为（烧纸）+ 悬念

**避免**：
- 太直白的恐怖设定（「村子里有鬼」）——没有悬念
- 太抽象的设定（「一个关于因果轮回的故事」）——没有画面感
- 与民间灵异无关的设定——保持类型特色

#### 2. 核心卖点

读者为什么要看这个灵异故事？核心卖点需要差异化——区分你的故事与其他灵异小说的独特之处。

**卖点方向**：
- **民俗深度**：「东北出马仙实录风格+真实民俗考据」——以民俗真实感取胜
- **地域特色**：「湘西赶尸文化深度还原」——独特地域元素
- **因果震撼**：「三代人的因果纠缠，真相比鬼更可怕」——以因果链的重量感取胜
- **术士魅力**：「民间风水师vs百年厉鬼的智斗」——以术法对决的精彩程度取胜
- **氛围营造**：「八十年代农村夜晚的沉浸式恐怖体验」——以时代氛围取胜

**避免**：
- 过于笼统的卖点（「一个好看的灵异故事」）
- 与其他类型混淆的卖点（「热血战斗」「甜蜜恋爱」）

#### 3. 开篇悬念

开头几章就要呈现的悬念，让读者欲罢不能。

**开篇悬念设计原则**：
- 悬念必须具体——不是模糊的「有什么不对劲」，而是一个明确的、令人困惑的异常现象
- 悬念的答案必须与核心灵异事件直接关联
- 悬念应该在前三章内建立，但答案在中后期才揭晓

**优秀示例**：
- 「村里为什么没有老人？那口井为什么要用石板封住？」——两个具体的异常，暗示深层秘密
- 「为什么每到初一十五，全村人都要在门口放一碗生米？」——具体的民俗行为 + 未知原因
- 「祖屋的地下室里，为什么有一具保存完好的棺材？棺材上的锁链是从里面锁上的。」——具体物证 + 反常细节（从里面锁）

**避免**：
- 太快揭晓的悬念（第一章设悬，第二章就解了）
- 与主线无关的噱头悬念

#### 4. 读者期待

明确承诺给读者的核心体验。民间灵异读者的核心期待包括：

- **因果链揭露**：层层剥开真相，发现一切灵异背后令人唏嘘的因果——「原来三十年前发生过这样的事」
- **术士对决**：民间手艺人用术法与鬼怪斗智斗勇的精彩博弈——出马仙请神上身、风水师布阵化煞、缝尸人拼命缝合
- **民俗仪式场景**：冥婚、开坛作法、还阴债等仪式的沉浸式描写——仪式感是恐怖氛围的主要来源
- **脊背发凉的持续恐惧**：不是被吓一跳，而是看完后夜里不敢关灯的那种细思极恐——暗示比明示更可怕
- **文化共鸣**：「我小时候听过类似的故事」「我奶奶也说过这种规矩」——唤起读者集体记忆中的恐惧

**生成时应选取 2-3 个最匹配当前故事的期待项**，不必面面俱到。

---

### 生成要点

- 故事钩子必须是「日常中的异常」，避免直接出现「鬼」「灵异」等字眼
- 核心卖点要有差异化，突出这个故事区别于其他灵异小说的独特之处
- 开篇悬念必须具体，且答案与核心灵异事件直接关联
- 读者期待应聚焦 2-3 个与当前故事最匹配的方向
- 四个字段之间应形成逻辑自洽：故事钩子引出悬念，卖点支撑期待',
  '## "Story Hook" Setting Generation — Chinese Folk Horror Story

The "Story Hook" contains 4 fields that define the story''s core appeal. Folk horror hooks must embody "anomalies in the everyday" -- the more ordinary the thing, the more terrifying the unexpected change.

---

### Field Generation Guide

#### 1. Story Hook

One sentence summarizing the most spine-chilling premise. This is the story''s "one-line pitch."

**Design principle**: The best hooks are "anomalies in the everyday." Avoid starting directly with "ghost" -- suggestion is more frightening than explicit showing.

**Good examples**:
- "Every household''s door frame has the same person''s name carved on it" -- everyday object (door frame) + anomalous phenomenon (carved name) + suspense (whose name? why?)
- "Grandmother''s dying words, repeated over and over: no matter what sound you hear, never open the attic door" -- dying relative''s words + specific taboo + unknown fear
- "The new neighbor never goes out during the day, but burns paper offerings in the yard at exactly midnight every night" -- everyday scene (neighbor) + abnormal behavior (burning offerings) + suspense

**Avoid**:
- Overly explicit horror settings ("There are ghosts in the village") -- no suspense
- Overly abstract settings ("A story about karmic cycles") -- no visual imagery
- Settings unrelated to folk horror -- maintain genre identity

#### 2. Core Selling Point

Why should readers choose this horror story? The core selling point needs differentiation -- what distinguishes your story from other horror novels.

**Selling point directions**:
- **Folk depth**: "Northeast spirit medium documentary style + authentic folk research" -- winning with folk authenticity
- **Regional character**: "Deep recreation of Xiangxi corpse-herding culture" -- unique regional elements
- **Karmic impact**: "Three generations of karmic entanglement; the truth is more terrifying than the ghosts" -- winning with the weight of the karmic chain
- **Practitioner appeal**: "Folk feng shui master vs. century-old fierce ghost in a battle of wits" -- winning with thrilling occult duels
- **Atmosphere**: "Immersive horror experience of 1980s rural nights" -- winning with era atmosphere

**Avoid**:
- Overly generic selling points ("A good horror story")
- Selling points that confuse genres ("Hot-blooded battles," "Sweet romance")

#### 3. Opening Suspense

The suspense that must be presented in the first few chapters to hook readers.

**Opening suspense design principles**:
- Suspense must be specific -- not a vague "something feels off" but a clear, puzzling anomalous phenomenon
- The answer to the suspense must directly connect to the core supernatural event
- Suspense should be established within the first three chapters, but the answer revealed in the middle or late sections

**Good examples**:
- "Why are there no old people in the village? Why is that well sealed with a stone slab?" -- two specific anomalies hinting at a deep secret
- "Why does the entire village place a bowl of raw rice at the door on every first and fifteenth of the lunar month?" -- specific folk behavior + unknown reason
- "Why is there a perfectly preserved coffin in the ancestral house''s basement? The chains on the coffin were locked from the inside." -- specific physical evidence + abnormal detail (locked from inside)

**Avoid**:
- Suspense that resolves too quickly (set up in chapter 1, answered in chapter 2)
- Gimmick suspense unrelated to the main plot

#### 4. Reader Expectations

Core experiences promised to the reader. Folk horror readers'' core expectations include:

- **Karmic chain revelation**: Peeling back layers of truth to discover the poignant karma behind all supernatural events -- "So that''s what happened thirty years ago"
- **Practitioner duels**: Thrilling battles of wits between folk practitioners and ghosts -- spirit mediums channeling entities, feng shui masters laying formations, corpse stitchers desperately stitching
- **Folk ritual scenes**: Immersive descriptions of ghost marriages, altar ceremonies, yin debt repayment -- ritual atmosphere is the primary source of horror
- **Lingering persistent fear**: Not a jump scare, but the kind of fear that makes you leave the lights on -- suggestion is more terrifying than showing
- **Cultural resonance**: "I heard a story like this as a child," "My grandmother mentioned this rule too" -- evoking fear from readers'' collective memory

**When generating, select 2-3 expectations that best match the current story**; no need to cover all of them.

---

### Generation Notes

- The story hook must be an "anomaly in the everyday"; avoid words like "ghost" or "supernatural" directly
- The core selling point needs differentiation, highlighting what makes this story unique among horror novels
- Opening suspense must be specific, with its answer directly connected to the core supernatural event
- Reader expectations should focus on 2-3 directions that best match the current story
- The four fields should form a logically coherent whole: the hook leads to suspense, the selling point supports expectations',
  (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1),
  1,
  72,
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
