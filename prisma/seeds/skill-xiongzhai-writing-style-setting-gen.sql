-- 凶宅灵异租房「文风设定」设定生成技能（Layer 3）
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-xiongzhai-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiongzhai-writing-style-setting-gen',
  '「文风设定」设定生成：为凶宅灵异租房小说设计叙事视角、恐怖风格与节奏——文风决定读者如何体验这间房',
  '"Writing Style" setting generation: design narrative POV, horror style, and pacing for haunted rental horror — the writing style determines how readers experience the apartment',
  '## 「文风设定」设定生成 — 凶宅灵异租房小说创作

文风设定不是风格偏好——它是**读者如何感知恐惧的技术决定**。同一间凶宅，用不同的叙事视角和恐怖风格写出来，读者得到的体验可以截然不同。这四个字段的组合决定了你的小说是让人睡不着还是让人看不下去。

---

### 字段生成指南

#### 叙事视角

视角选择是凶宅流中最具决定性的单一技术选择：

| 视角类型 | 恐惧体验 | 叙事优势 | 主要挑战 |
|---------|---------|---------|---------|
| **第一人称（主角实时叙述）** | 最强烈的沉浸感；读者和主角同步感受恐惧 | 内心活动零过滤；恐惧的心理质感最强 | 主角必须活着叙述（限制死亡节点）；主角视野外的信息无法直接呈现 |
| **第一人称+日记/聊天记录插叙** | 现实与回忆交替；日记/聊天里的"之前的主角"和"现在的主角"形成对比 | 可以展示主角随时间的心理蜕变；插叙可以暗示未来 | 插叙部分节奏较慢；两个时间线要有意义的互相解释 |
| **第三人称限制视角（紧跟主角）** | 略有距离感，但叙事更灵活 | 可以描写主角自己没有意识到的细节（主角背后有什么，但主角在向前看） | 沉浸感弱于第一人称；"不知道主角在想什么"的时刻需要用动作弥补 |
| **双线叙事（现在的主角+过去的前租客）** | 两条线互相揭示；前租客线是主角的"先行版"，读者知道前租客的结局，但主角不知道 | 调查线和恐惧线双驱动；前租客的故事本身就是一个完整的悲剧 | 两条线的节奏要互相配合；切换频率要找到平衡（每章切换 vs 每隔几章切换） |

**第一人称视角的特殊价值**：
凶宅流的核心恐惧是"我一个人在这间房里"——第一人称视角是这种孤立感的最强表达。"我听到了床底的声音"和"他听到了床底的声音"，读者的生理反应是不同的。

#### 恐怖风格

四种风格在凶宅流中各有最适合的使用场景：

| 风格 | 核心机制 | 最适合的凶宅设定 | 写作要点 |
|------|---------|--------------|---------|
| **氛围压迫型** | 恐惧来自空间本身——光线、声音、气味的积累营造出"这间房不对劲"的弥漫感 | 空间描写驱动的故事；厉鬼活动频率偏低 | 细节要精准而不过度——三个精准细节比十个模糊细节更有效 |
| **细节恐怖型** | 精准的感官描写制造生理不适——"镜子上的手印大小不对，太小了，像一个孩子的" | 有具体恐惧事件的故事；厉鬼活动频率中等 | 细节越具体，越要克制——不要在同一段落堆三个恐怖细节 |
| **心理暗示型** | 读者脑补的比文字写的更可怕——留白、截止描写、主角"我不想知道那是什么"的刻意回避 | 悬疑主导的故事；读者聪明且愿意参与 | 最难写但最有效；留什么白比写什么更重要 |
| **推理悬疑型** | 厉鬼的出没有规律可循；主角（和读者）在恐惧中推理规律、验证规律、利用规律 | 智斗主导的故事；厉鬼规则设计清晰 | 规则要足够清晰，让读者和主角一起推理；破规要有前置理由 |

**风格组合建议**：
- 氛围压迫型 + 细节恐怖型：从模糊的不适感过渡到精准的恐惧点，经典渐进结构
- 心理暗示型 + 推理悬疑型：读者既要参与脑补，又要参与推理，参与感最强
- 单一风格通常不够丰富——建议选一主风格，搭配一副风格

#### 节奏设计

节奏选择决定了读者的阅读心理节律：

| 节奏模式 | 适合的故事长度 | 恐惧体验 | 注意事项 |
|---------|------------|---------|---------|
| **慢热升温**（前期日常感强，恐惧逐渐侵入） | 中长篇（30万字+） | 最贴近真实的心理过程；前期越日常，后期越恐惧 | 前3章必须有至少一个"可疑但可解释"的细节，否则读者会等不及 |
| **紧凑直给**（第一章就上强度） | 短篇或网文快节奏 | 即时抓住读者，但后续升级空间受限 | 第一章的强度设定必须是整个故事的基准，后续只能更高 |
| **波浪型**（日常→恐惧→喘息→更深的恐惧） | 中篇（15-30万字） | 模仿真实的"以为没事了"心理循环 | 每次"喘息"的时长要递减——读者感受到每次安全的代价在上升 |

**凶宅流特有的节奏陷阱**：
- "一直在发生恐怖事件"反而会让读者麻木——日常感是恐惧的底色，没有日常就没有恐惧
- "天亮就安全"的节奏模式要谨慎使用——它限制了白天场景的恐惧可能性

#### 恐惧浓度

浓度选择决定目标读者群和作品定位：

| 浓度 | 适合的读者 | 内容标准 | 注意事项 |
|------|---------|---------|---------|
| **轻灵异** | 灵异文学入门读者；喜欢都市现代感的读者 | 氛围感为主；恐惧现象有的放矢，不会造成生理不适 | 厉鬼的活动频率低；即使出现也是"模糊的感知"而非直接接触 |
| **中等恐怖** | 标准都市灵异读者群 | 有明确的恐惧事件；感官描写精准；偶尔有生理不适的描写 | 最主流的市场浓度；可以有直视恐惧的场景，但不以生理恐惧为目的 |
| **高浓度恐怖** | 重度恐惧爱好者；喜欢极限沉浸的读者 | 大量精准的感官恐惧描写；直接接触场景；主角的心理崩溃有完整呈现 | 需要配合精准的文笔才能有效——恐惧描写失控就变成"恐惧感情用事"，反而不吓人 |

#### 禁止词汇

写作中需要避免的词汇和套路：

**结构性禁忌**：
- "突然"（过度使用会让读者预判，失去突然感）
- 连续超过三个感叹号描写恐惧（会变成漫画感，不再恐惧）
- "我不知道为什么，但我感到恐惧"（直接说出来的恐惧不如暗示的恐惧）

**凶宅流特有的禁忌**：
- 过于游戏化的鬼魂描写（鬼怪等级、技能树）
- 用现代网络词语描写古典恐惧（"OMG今晚又出现了"）
- 恐惧现象解决得太快（出现→主角害怕→天亮了→什么都没发生）

---

### 字段联动关系

- **叙事视角 → 角色.心理变化轨迹**：第一人称视角下，心理变化要通过内心独白直接呈现；双线叙事下，两个时间线的主角心理要形成有意义的对比
- **恐怖风格 → 空间.空间细节**：细节恐怖型风格要求每个空间的感官细节高度精准；心理暗示型风格下，空间细节应该有留白
- **节奏设计 → 情节设计.事件编排**：波浪型节奏要求情节中明确标注"喘息节点"；紧凑直给型要求每章末尾有张力钩子

---

### 常见错误

1. **视角在章节间漂移**：第一人称写着写着出现了"主角不在场也知道"的信息——视角一旦确定必须贯彻
2. **恐怖风格混乱**：同一章里，同一个场景用了三种不同的恐惧表达方式，读者无法找到情感节拍
3. **节奏太平**：全程相同密度的恐惧描写，没有喘息，读者产生情感疲劳而非恐惧
4. **浓度设定与执行不符**：说是"轻灵异"结果写了大量直接接触场景——设定和执行必须一致',
  '"Writing Style" setting generation for haunted rental horror. POV choice is the single most important technical decision: first person (most immersive), first person+diary inserts (shows psychological decay over time), third person limited (slightly more flexible), dual timeline (protagonist + previous tenant — reader knows the outcome, protagonist doesn''t). Horror style options: atmosphere/pressure, precise detail horror, psychological suggestion, mystery-deduction. Pacing: slow burn, immediate intensity, or wave pattern (daily→horror→relief→deeper horror). Horror density calibrates reader target. Key principle: ordinary daily life is the baseline against which horror is measured — without normalcy there is no dread.',
  (SELECT id FROM novel_creation_method WHERE name = '凶宅灵异租房' LIMIT 1),
  1,
  13,
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
