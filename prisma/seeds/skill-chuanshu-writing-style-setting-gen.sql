-- 穿书文小说「文风设定」设定生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-chuanshu-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chuanshu-writing-style-setting-gen',
  '「文风设定」设定生成：为穿书文小说生成文风设定，包括叙事视角、文风基调、内心独白风格和语言风格',
  '"Writing Style" setting generation: generate writing style settings for book-crossing novels',
  '## 「文风设定」设定生成 — 穿书文小说

「文风设定」定义写作风格。穿书文有一个独特的文风元素——**穿书者的内心独白/吐槽**，这是穿书文区别于其他穿越类型的标志性特征。

---

### 字段生成指南

#### 叙事视角

| 视角 | 优势 | 劣势 | 穿书文适配 |
|------|------|------|---------|
| 第一人称 | 代入感强，吐槽效果最佳 | 信息面窄 | 最适合穿书文（最受欢迎） |
| 第三人称限知 | 兼顾代入感和叙事灵活性 | 吐槽效果减弱 | 适合多角色互动丰富的穿书文 |
| 第三人称全知 | 可展现多角色视角 | 穿书者的独特视角被稀释 | 适合群像穿书文 |
| 多视角切换 | 展现原著角色对穿书者的观察 | 结构复杂 | 适合悬疑/烧脑穿书文 |

#### 文风基调

穿书文常见的文风基调选择：
- **幽默吐槽风**：穿书文最受欢迎的基调。穿书者用现代人的视角吐槽书中世界的"小说逻辑"
- **细腻文艺风**：适合言情类穿书文，注重情感和心理描写
- **爽文节奏风**：适合逆袭型穿书文，节奏快、反转多
- **古典雅致风**：适合穿入古典名著的穿书文
- **悬疑紧张风**：适合穿书者被"原著世界意志"追杀的设定
- **温馨治愈风**：适合"咸鱼躺平"型穿书文

#### 内心独白风格

穿书文最具特色的文风元素：

| 风格 | 特点 | 典型表现 | 适合基调 |
|------|------|---------|---------|
| 疯狂吐槽型 | 像弹幕一样吐槽原著剧情 | "作者你是不是和逻辑有仇？这剧情发展合理吗？！" | 幽默吐槽风 |
| 冷静分析型 | 理性推演剧情走向 | "根据原著第87章的伏笔，三天后应该是男主黑化的转折点……" | 悬疑/权谋 |
| 焦虑紧张型 | 充满求生欲的内心OS | "完了完了完了，这是死亡Flag啊！我得赶紧想办法！" | 爽文/紧张 |
| 佛系躺平型 | 随遇而安的佛系心态 | "算了，剧情爱怎么走怎么走，我先去喝杯茶……" | 温馨治愈 |

#### 语言风格

根据原著世界类型匹配语言风格：
- 古代宫廷/江湖→半文半白，古风典雅
- 现代都市/校园→现代口语，可带网络用语
- 仙侠修真→古风与仙气结合
- 西方奇幻→翻译体语感

穿书者的内心独白始终保持现代语言，形成与环境语言的反差。

#### 参考作品

可选填写。读者可以通过参考作品快速理解目标文风。

### 推荐搭配

| 穿越身份 | 推荐视角 | 推荐基调 | 推荐独白风格 |
|---------|---------|---------|------------|
| 炮灰角色 | 第一人称 | 幽默吐槽风 | 焦虑紧张型 |
| 反派 | 第一人称 | 爽文节奏风 | 冷静分析型 |
| 配角 | 第三人称限知 | 细腻文艺风 | 疯狂吐槽型 |
| 主角 | 第一人称 | 爽文节奏风 | 佛系躺平型 |
| 路人甲 | 第一人称 | 温馨治愈风 | 佛系躺平型 |',
  '## "Writing Style" Setting Generation — Book-Crossing Novel

The "Writing Style" defines the writing approach. Book-crossing fiction has a unique element: the **crosser''s inner monologue/commentary** — the signature feature distinguishing it from other crossing types.

---

### Field Generation Guide

#### Narrative Perspective
First person is most popular for book-crossing (best for commentary/complaints). Third person limited works for character-rich stories. Multiple perspectives suit suspense-focused book-crossing.

#### Style Tone
Humorous commentary style is most popular. Match tone to crossing identity and genre.

#### Inner Monologue Style
The most distinctive element: Manic Commenter (like live commentary), Calm Analyst (rational plot deduction), Anxious Survivor (full of survival instinct), Zen Lounger (go-with-the-flow).

#### Language Style
Match to original world type. Key: crosser''s inner monologue always stays in modern language, creating contrast with the environment.

### Recommended Combinations
Cannon fodder → 1st person + humorous + anxious. Villain → 1st person + fast-paced + analytical. Supporting → 3rd limited + literary + manic commenter.',
  (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1),
  1,
  25,
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
