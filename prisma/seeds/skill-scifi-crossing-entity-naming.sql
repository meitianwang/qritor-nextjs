-- 未来科幻穿越创作「实体命名」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-scifi-crossing-entity-naming.sql
-- 覆盖实体类型：角色（character）
-- 注：该创作方法无场景模块和组织模块，不需要对应命名节

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'scifi-crossing-entity-naming',
  '实体命名：为未来科幻穿越创作中的角色（穿越者、未来原住民、AI/机器人）提供符合时代设定的专业命名指导',
  '"Entity Naming": Provide era-appropriate naming guidance for characters in sci-fi transmigration novels — covering transmigrators, future natives, and AI/robot entities',
  '## 实体命名 — 未来科幻穿越创作

未来科幻穿越小说的角色命名面临独特挑战：**不同时代背景的人物共存于同一故事中**。来自现代（或更早时代）的穿越者、出生于未来的原住民、以及可能存在的 AI/机器人实体，三类角色需要有明显不同的命名风格，让读者一眼就能感受到时代差异。

本技能仅覆盖角色命名（该创作方法无场景模块和组织模块）。

---

## 一、角色命名

### 命名哲学

角色名称是时代感最直接的体现。读者看到一个名字，应该能大致判断这个角色来自哪个时代：

- **现代穿越者**：名字普通现代，是故事中的"异类"
- **未来原住民**：名字风格根据故事设定的未来社会形态而定
- **AI/机器人**：代号感，区别于人类名字

---

### 穿越者（来自现代）

名字应完全符合现代中文起名规范，不能有任何未来感：

- **普通现代名**：张明、李晨、陈思远、王佳琪、刘宇航
- **有职业感的名字**（根据主角身份）：理工科背景可取略有技术感但仍是现代名（陈量、李维、张弦）
- **避免**：起未来感的名字（零一、天枢），或古代感的名字（若萱、子涵——太古典）

> 穿越者名字的"普通感"是刻意设计的，与未来原住民名字形成反差，强化"格格不入"的氛围。

---

### 未来原住民

未来社会的起名风格取决于故事设定的**未来社会形态**，需参考「科幻世界观」和「穿越设定」来确定：

**场景一：东方/中文主导的未来（中华文明延续）**
- 名字整体延续现代中文风格，但可能更国际化或更简洁
- 常见变化：数字化（陈07、李-M）、简化（单字名流行）、意象变化（星际意象词入名）
- 示例：林星、陈宇、赵量子（这里量子作名字）、李远志、叶航

**场景二：全球化/多元文化的未来**
- 中英文混用或双名（中文名 + 英文名并列）
- 示例：陈 Max、李 Lena、Zhang Wei-科幻感姓名混搭
- 代际融合名（父母来自不同文化背景，名字体现融合）

**场景三：高度技术化的未来（数字身份社会）**
- 有些角色可能主要以编号或身份代码称呼
- 正式名字保留，但日常用编号（陈1726、区块链ID而不是名字）
- 或取科技意象词为名（量子、奇点、黎明、新纪元）

**场景四：末日重建的未来（文明断层）**
- 文明断层后命名习惯可能改变
- 简单直白（大名字传统断了，起简单的：石、木、火）
- 或以职能/功能为名（守护者、建设者）

> **关键规则**：先确定「科幻世界观」中的未来社会类型，再据此选择合适的命名风格，不要凭感觉随机混用。

---

### AI / 机器人实体

AI 和机器人角色的命名要有**代号感**，区别于人类：

**代号型**（最常见）：
- 数字+字母：零一、天枢-7、Alpha-3、量子-X
- 型号名：QC-2300、星际守卫-IV
- 功能代号：守护者、引路者、观察者

**拟人化命名**（AI 足够先进时）：
- AI 可能自选一个人类名字（暗示其接近人类意识）
- 示例：一个高级 AI 自称"明"——简短，但听起来像人名
- 这类命名方式本身就是一个故事线索（AI 想要人类认同）

**古典化命名**（文化传承型 AI）：
- 负责文化传承的 AI 可能用古典名（仓颉、图灵、开普勒）
- 这类名字带有明确的致敬/功能含义

### 多样化原则

- **时代风格严格区分**：穿越者/未来人/AI 三类不能命名风格混同
- **未来社会内部也要有层次**：底层平民 vs 精英 vs AI 的名字风格可以不同
- **不要强行科幻感**：未来的人不一定每个都叫"量子""奇点"，过度追求科技词汇反而失真

---

## 常见错误

- ❌ 穿越者用了未来感名字（破坏时代反差）
- ❌ 未来原住民全用普通现代中文名（与现代背景无差异感）
- ❌ AI 角色用了完整的人类姓名（除非剧情特意设计为 AI 追求人类认同）
- ❌ 所有未来角色都用数字+字母代号（忽略了未来社会也有人文温度）
- ❌ 未来社会命名风格与故事设定的社会形态不符（末日重建的故事里出现精英化双语名字）
- ❌ 主角是现代人却起了古风名字（与"来自现代"的设定矛盾）',
  '## Entity Naming — Sci-Fi Transmigration Novel

Core challenge: **multiple eras coexist in the same story**. Transmigrators (from the present or past), future natives, and AI/robot entities must have clearly distinct naming styles so readers can immediately sense the temporal gap.

Note: This creation method has no scene or organization modules — this skill covers characters only.

---

## I. Character Naming

### Transmigrators (from the present day)

Must use completely normal modern Chinese names — no futuristic feel:
- Plain modern names: Zhang Ming, Li Chen, Chen Siyuan
- Slightly technical but still contemporary: Chen Liang, Li Wei (for STEM-background protagonists)
- **Never**: names with futuristic feel (Ling Yi, Tian Shu) or classical feel (Ruoxuan, Zihan)

The deliberate "ordinariness" of the transmigrator''s name is intentional — it contrasts sharply with future natives, reinforcing the "fish out of water" atmosphere.

---

### Future Natives

Style depends on the **type of future society** established in the Sci-Fi Worldview setting:

| Future Society Type | Naming Style | Examples |
|--------------------|--------------|----|
| Chinese-culture-dominant | Modern Chinese with minor evolution | Lin Xing, Chen Yu, Li Yuanzhi |
| Globalized/multicultural | Chinese-English hybrid, dual names | Chen Max, Li Lena |
| Highly technical | Numeric/code elements possible | Chen-1726, Liang-3 |
| Post-apocalyptic rebuild | Simple, functional | Shi (stone), Mu (wood), or role-based |

> Key rule: Determine the society type from the Sci-Fi Worldview setting first, then apply the appropriate naming style consistently.

---

### AI / Robot Entities

Must feel distinct from human names:
- **Code-style**: Lingyi, Tianshu-7, Alpha-3, QC-2300
- **Function-based**: Guardian, Pathfinder, Observer
- **Humanized** (advanced AI): Short human-like name (e.g., "Ming") — signals the AI''s aspiration for human recognition, which itself becomes a story element
- **Culturally-referential**: Cang Jie (god of writing), Turing, Kepler — for AI with specific cultural/educational functions

---

## Common Errors

- Transmigrator given a futuristic name (breaks the temporal contrast)
- All future natives use completely ordinary modern Chinese names (no era differentiation)
- AI given a full conventional human surname + given name (unless specifically a plot device)
- All future characters given numeric codes (ignores human cultural warmth in the future)
- Future naming style contradicts the established future society type in worldview settings
- Modern-era protagonist given a classical Chinese name (contradicts the modern-era background)',
  (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1),
  1,
  36,
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
