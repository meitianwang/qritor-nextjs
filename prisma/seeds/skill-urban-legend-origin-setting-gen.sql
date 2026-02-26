-- 都市传说怪谈复苏流小说 - 「怪谈起源」设定生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-urban-legend-origin-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'urban-legend-origin-setting-gen',
  '「怪谈起源」设定生成：为都市传说怪谈复苏流小说设计怪谈/禁忌的复苏根源与传播方式',
  '"Paranormal Origin" setting generation: design the revival source and transmission method for urban legend horror novels',
  '## 「怪谈起源」设定生成 — 都市传说怪谈复苏流小说

怪谈起源是整个故事世界观的基础框架。它回答读者心里最急迫的那个问题：**「这是怎么开始的？」**。好的起源设定有两个特质：第一，它在现代都市背景下有合理的触发逻辑；第二，它与当代读者的日常生活存在真实的交汇点——不是古老的灵异现象，而是利用了现代文明的某个裂缝。

---

### 字段生成指南

#### 怪谈类型
六种类型代表了不同的叙事逻辑，选择时要考虑整体故事想要讲述的核心问题：

| 类型 | 叙事逻辑 | 适合的恐惧核心 | 典型案例参考 |
|------|---------|-------------|------------|
| 网络诅咒/转发类 | 信息本身即传染物 | 见证成本、孤立无援 | 「不转不行」类怪谈、《午夜凶铃》变体 |
| 地点封印破除 | 被压制的存在重新浮现 | 被侵入感、领域意识 | 废弃医院、老小区改造引出的怪谈 |
| 古老禁忌复苏 | 人们遗忘了规则，规则仍然生效 | 失控感、文明的脆弱 | 民俗禁忌在现代的失效与激活 |
| 人造实验失控 | 人类创造了无法控制的东西 | 技术异化、知情困境 | AI、算法、城市改造引发的意外 |
| 集体无意识具现 | 足够多人相信的东西变成现实 | 社会性恐惧、信息传播 | 谣言成真、网络迷因的物质化 |
| 其他 | 自定义 | 自定义 | — |

**关键原则**：怪谈类型要与「传播媒介」高度匹配。网络诅咒类的传播媒介天然是社交媒体；古老禁忌类可以是实物或口耳相传。不匹配会破坏世界观的内在逻辑。

#### 复苏原因
这是现代都市怪谈最重要的设计点之一。复苏原因需要满足：
1. **可信度**：在现代背景下说得通（不需要超自然解释，模糊最好）
2. **时机感**：为什么是「现在」？现代生活的什么特质使这成为可能？
3. **不可逆性**：封印一旦破除/规则一旦激活，很难回头

**优秀复苏原因的参考方向**：
- 城市改造触发地点记忆（拆除了某栋楼/某条路，解除了某种平衡）
- 数字传播速度超过了人类理解的阈值（某个帖子/视频达到某个传播量）
- 现代社会独有的空洞（孤独死亡率上升、深夜独居者增多）
- 某个人的特定行为（无心之举，后来发现有致命意义）
- 周年或轮回（某件事发生后X年，规律再次触发）

#### 传播媒介
传播媒介决定了这个怪谈的「感染路径」，也决定了它在现代都市中的可信度。

**高代入感的现代传播媒介**：

| 媒介类型 | 典型形式 | 叙事功能 |
|---------|---------|---------|
| 社交媒体 | 微信群转发、微博话题、抖音视频 | 传播速度快，知情者多，无法溯源 |
| 私信/短信 | 陌生号码、已注销账号发来的消息 | 个人化，难以证明给他人看 |
| 实物接触 | 电梯按钮、废弃手机、二手物品 | 物理传播，有明确的接触时间点 |
| 目击经历 | 在场者被「标记」 | 无法主动选择，无辜感强 |
| 信息知晓 | 听到/读到某个故事后自动卷入 | 知识即负担，信息即危险 |

**设计原则**：传播媒介越日常越危险。「电梯按钮」比「古代咒器」更能让读者背脊发凉，因为读者今天就要按。

#### 影响范围
影响范围直接决定故事的规模感和主角的行动空间：

- **个人诅咒**：亲密感最强，与主角形成一对一的命运绑定；情节张力来自个人奋斗
- **局部区域**：小区/楼/街道，可以设计空间边界和「界外」的相对安全感
- **全城**：主角是众多受害者之一，社会反应成为重要叙事元素
- **全国/全球**：通常用于高潮或反转，开篇设置过大会削弱代入感

**建议**：复苏初期将影响范围设置为局部，随剧情扩大——这样读者和主角都有「还有机会」的幻觉，被一点点剥夺。

#### 开始时间
故事开始时怪谈的复苏阶段决定了主角的信息起点：

- **刚刚开始（0-72小时）**：主角是最早的受害者/目击者之一，无前人经验可循
- **扩散期（数周）**：已有流言、有人死亡、但大多数人仍不相信
- **爆发期**：官方已无法掩盖，社会开始出现应对行为
- **适应期（长时间后）**：人们学会了某些规则，但规则本身仍在变化

**注意**：避免在「刚刚开始」阶段就让主角拥有完整的信息，这会破坏探索的节奏感。

---

### 字段联动关系

- **怪谈类型 + 传播媒介 → 禁忌规则**：类型决定规则的性质（网络类的规则通常与信息行为有关），传播媒介决定规则的触发方式
- **复苏原因 → 都市世界观中的异变区域**：最初的复苏地点应该成为最危险/最神秘的区域
- **影响范围 + 开始时间 → 都市世界观中的事件阶段**：两者共同确定故事开始时的社会状态

---

### 常见错误

- ❌ 复苏原因是「远古邪神苏醒」——脱离都市代入感，变成奇幻小说
- ❌ 传播媒介太晦涩（「古代卷轴」），与现代都市背景脱节
- ❌ 「开始时间」设置为「已经过去了很久」，主角已有完整信息——消解了探索感
- ❌ 网络诅咒类型搭配「口耳相传」的传播媒介——逻辑自洽性低',
  '"Paranormal Origin" Setting Generation — Urban Legend Revival Horror Novels

The origin establishes the world''s foundational logic. Key principle: the revival cause must leverage something specific about modern urban life — not ancient supernatural forces reawakening generically, but something that exploits a crack in contemporary civilization.

**Type selection guide**:
- Network curse: information itself is the contagion — spreads through social media, DMs, viral content
- Location unsealing: suppressed presence resurfaces when construction/demolition disturbs a site
- Ancient taboo revival: people forgot the rules, but the rules still apply
- Man-made experiment failure: technology or social engineering created something uncontrollable
- Collective unconscious manifestation: enough people believing something makes it real

**Revival cause design principles**: 1) Plausible in modern context; 2) Explains WHY NOW (what makes contemporary life vulnerable); 3) Irreversible once triggered.

**High-immersion transmission vectors**: WeChat group forwards, unknown caller IDs, elevator buttons, second-hand objects, being present at a location, simply knowing the story.

**Design principle**: the more mundane the transmission vector, the more terrifying. An elevator button is more frightening than an ancient artifact because readers touch one today.

**Scope recommendation**: start with local scope (building/neighborhood), expand with the plot — this creates the illusion of hope that gets systematically stripped away.

**Timeline**: starting at "just happened (0-72 hours)" means the protagonist has no prior knowledge — maximum exploration tension. Starting at "outbreak" means social responses become a major narrative element.',
  (SELECT id FROM novel_creation_method WHERE name = '都市传说怪谈复苏流小说' LIMIT 1),
  1,
  11,
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
