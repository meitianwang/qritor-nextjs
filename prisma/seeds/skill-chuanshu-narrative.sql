-- 穿书文叙事与场景写作
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-chuanshu-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chuanshu-narrative',
  '穿书文叙事与场景写作：涵盖穿书者内心独白技巧、原著角色互动写法、身份维持与穿帮场景、剧情偏移的叙事张力、穿书文特有的节奏把控',
  'Book-crossing narrative and scene writing: covers crosser inner monologue techniques, original character interaction, identity maintenance scenes, plot deviation tension, and book-crossing specific pacing',
  '## 穿书文叙事与场景写作

本技能专为「穿书文小说」创作方法设计，聚焦于正文写作层面的叙事技巧。

---

### 一、穿书者内心独白——穿书文的核心特色

穿书者的内心独白是穿书文区别于所有其他穿越小说的标志性元素。它创造了一种独特的"双层叙事"——表面上的书中世界剧情 + 穿书者用现代视角的解读/吐槽。

#### 1.1 四种独白风格的写法

**疯狂吐槽型**：
- 把原著的"小说逻辑"当作槽点
- "这作者是不是没有感情线就不会写书？男主明明可以直接说清楚，非要误会三百章！"
- 适合轻松搞笑型穿书文

**冷静分析型**：
- 像在拆解剧情的推理小说
- "根据原著第十五章的描写，再过三天就是男主被陷害入狱的节点。我现在有两个选择……"
- 适合权谋/烧脑型穿书文

**焦虑紧张型**：
- 充满求生欲的OS
- "完了完了完了！这个场景我记得！原著里女配就是在这里说错话被打入冷宫的！我闭嘴！我什么都不说！"
- 适合炮灰求生型穿书文

**佛系躺平型**：
- 随遇而安的画风
- "算了，剧情爱怎么走怎么走。反正我又不是主角，我就在角落里吃我的瓜……等等，怎么所有人都在看我？"
- 适合日常治愈型穿书文

#### 1.2 独白频率控制

| 场景类型 | 独白频率 | 原因 |
|---------|---------|------|
| 日常场景 | 高（每1-2段一次） | 轻松吐槽建立代入感 |
| 剧情推进场景 | 中（每3-4段一次） | 平衡剧情和吐槽 |
| 高潮/紧张场景 | 低（每5-8段一次） | 不打断紧张感 |
| 感情场景 | 视情况 | 吐槽会破坏气氛，分析则增加深度 |

---

### 二、核心场景写作技巧

#### 2.1 与原著角色互动——"我知道你的结局"的微妙感

穿书者面对原著角色时，内心始终有一层额外的信息：我知道你在原著中的命运。

**与注定悲惨命运的角色互动**：
- 穿书者看着这个角色，知道他三个月后会被害死
- 内心的挣扎：要不要告诉他？告诉了他会信吗？改变他的命运会引发什么蝴蝶效应？
- 外在表现：异常的关心和温柔，让该角色感到困惑

**与原著反派互动**：
- 穿书者知道这个人最终是大反派，但此刻他正在微笑着递给你茶
- 写法：描写穿书者努力维持正常表情的同时，内心疯狂预警

**与原著主角互动**：
- 穿书者知道主角有"主角光环"，但不确定自己的改变是否影响了光环
- 写法：穿书者在主角身边总有一种"站在气运之子旁边"的微妙感觉

#### 2.2 身份维持与穿帮场景

**日常身份维持的描写**：
穿书者需要24小时扮演原角色。这种持续的表演需要在正文中体现：
- 每次要说话前先想一下"原角色会怎么说"
- 被问到只有原角色知道的事情时内心的慌张
- 习惯性用现代词汇后的尴尬补救

**穿帮场景的紧张感层次**：

| 层次 | 穿帮类型 | 紧张度 | 处理方式 |
|------|---------|--------|---------|
| 微穿帮 | 说了一个不合时宜的词 | 低 | 轻松带过，周围人不在意 |
| 小穿帮 | 展现了不该有的知识 | 中 | 需要编借口解释 |
| 大穿帮 | 被亲近的人发现性格大变 | 高 | 需要认真应对，可能影响关系 |
| 致命穿帮 | 被聪明角色察觉"你不是原来的人" | 极高 | 重大剧情转折点 |

#### 2.3 剧情偏移的叙事张力

**当原著剧情按计划发展时**：
穿书者有一种"一切尽在掌握"的从容感。叙事节奏平稳，内心独白带着得意。

**当剧情开始偏离时**：
三个递进阶段：
1. **小偏移**："咦？这个细节和我记忆中不太一样……算了可能是小事"
2. **中偏移**："等等，这不对！这个角色不应该出现在这里！剧情是从哪里开始跑偏的？"
3. **大偏移**："完了，我已经完全不知道接下来会发生什么了。我的先知优势消失了。"

每个阶段叙事节奏逐步加快，内心独白从从容变为焦虑。

---

### 三、穿书文特有的叙事技巧

#### 3.1 "读者上帝视角"的运用

穿书文有一个独特优势：穿书者和读者之间有一种"我们都知道原著"的默契。

利用这种默契：
- 穿书者可以用暗语引用原著情节，读者心领神会
- 当剧情偏离时，读者和穿书者一起紧张
- 穿书者的吐槽实际上是在替读者吐槽"这种小说套路"

#### 3.2 "小说逻辑"的吐槽与利用

穿书文可以大胆地对"小说套路"进行元叙事解构：
- "我就知道，在这种小说里，只要男女主有误会，肯定会有人在旁边偷听到错误的对话"
- "总裁文定律：只要下雨，就一定有人会淋雨生病然后男主来照顾"
- 穿书者既吐槽这些套路，又不得不在这些套路中生存

#### 3.3 双重身份的内心挣扎

穿书者有一个永恒的内心冲突：**做自己 vs 扮演原角色**

随时间推移的变化：
- 初期：刻意模仿原角色，内心抗拒
- 中期：逐渐融入角色，分不清哪些感情是自己的、哪些是原角色的
- 后期：在"我是谁"的问题上达成某种和解

---

### 四、节奏把控

#### 4.1 五阶段结构的节奏差异

| 阶段 | 节奏特征 | 独白密度 | 场景类型 |
|------|---------|---------|---------|
| **适应期** | 慢，沉浸式 | 最高（大量内心吐槽和回忆） | 日常+适应 |
| **试探期** | 渐快 | 高（分析+计划） | 日常+小冲突 |
| **蝴蝶效应期** | 加速 | 中（焦虑取代从容） | 多方冲突 |
| **剧情决战期** | 最快 | 低（行动优先） | 高潮场景 |
| **新结局期** | 减缓 | 中高（反思和总结） | 收束场景 |

---

### 五、常见写作错误

1. **内心独白喧宾夺主**：吐槽太多导致正文剧情推进缓慢
2. **穿书者没有代入感**：只把书中世界当游戏，对角色缺乏真实情感
3. **"小说逻辑"吐槽过度**：解构太多反而破坏故事的沉浸感
4. **身份维持缺乏挑战**：穿书者轻松扮演原角色，缺少紧张感
5. **剧情偏移无后果**：改变剧情但不处理连锁反应
6. **感情线不合逻辑**：穿书者瞬间爱上原著角色，缺乏感情铺垫
7. **结尾处理"回到现实"过于草率**：如果涉及回到现实世界，需要充分的情感处理',
  '## Book-Crossing Narrative and Scene Writing

Designed for the "Book-Crossing Novel" creation method, focusing on prose-level narrative techniques.

---

### I. Crosser''s Inner Monologue — Core Feature
Creates "dual-layer narration": surface book-world plot + crosser''s modern-perspective commentary.

Four styles: Manic Commenter (slot-machine commentary on "novel logic"), Calm Analyst (dissecting plot like mystery), Anxious Survivor (survival instinct), Zen Lounger (go-with-flow but always dragged back).

Frequency control: high in daily scenes, medium during plot advancement, low during climax/tension.

### II. Core Scene Techniques
2.1 Interacting with original characters: "I know your fate" — the subtle tension of foreknowledge when facing characters whose tragic destinies you know.

2.2 Identity maintenance and exposure: four levels from micro-slip to fatal exposure. Daily maintenance requires constant role-playing awareness.

2.3 Plot deviation tension: three progressive stages from minor drift to complete prophecy failure, with accelerating narrative pace.

### III. Unique Narrative Techniques
3.1 Reader-crosser complicity: shared knowledge of the original creates unique reader engagement.
3.2 "Novel logic" deconstruction: boldly lampshading genre tropes while being trapped within them.
3.3 Dual identity struggle: evolving from deliberate acting to genuine identity confusion.

### IV. Pacing
Five-phase structure with decreasing monologue density and increasing action density from adaptation through climax.

### V. Common Errors
1. Monologue overwhelming plot. 2. Crosser treating world as game. 3. Excessive meta-commentary. 4. Effortless identity maintenance. 5. Consequence-free plot changes. 6. Illogical romance. 7. Rushed ending.',
  (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1),
  1,
  101,
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
