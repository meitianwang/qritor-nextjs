-- 赛博朋克小说创作 - 角色生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-cyberpunk-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cyberpunk-character-gen',
  '角色生成：为赛博朋克小说设计有灵魂的霓虹都市生存者——从独行侠到AI，每个角色都是「高科技低生活」的具体化',
  'Character generation: design soulful neon-city survivors for cyberpunk fiction — from solo fighters to AIs, each character embodies the high-tech low-life contradiction',
  '## 角色生成 — 赛博朋克小说

赛博朋克角色设计的核心原则：**角色的义体改造程度和所属阵营应该是「处境的结果」，不是「职业的标配」**。一个重度改造的义体医生和一个纯人类的独行侠，比「独行侠有战斗义体、黑客有神经接口」更有趣。让角色的外貌和能力成为他的故事，而不是他的类型标签。

---

### 一、档案类型系统

赛博朋克角色的「档案类型」是他在街头世界的生存方式，不是他的身份本质：

#### 独行侠（Solo/Street Fighter）

专业暴力的提供者——雇佣战士、保镖、执行者。

**核心设计维度**：
- 他们使用暴力是为了什么？（生存？保护？因为这是唯一会的东西？）
- 他们的限制是什么？（伤病？某条道德红线？义体的维护费用？）
- 他们与雇主的关系如何？（交易？依赖？反感？）

**最有张力的独行侠设定**：
- 身体机能强大，但情绪/心理在崩溃边缘
- 有某条他「绝对不会做」的事，恰好故事要逼他做这件事
- 在持续暴力环境中，仍然保留某种具体的温柔（对一个人、一种事物）

#### 网络黑客（Netrunner）

赛博空间的捕食者——专业入侵者、数据窃贼、信息经纪人。

**核心设计维度**：
- 在数字世界全能，在物理世界极度脆弱——这个反差如何体现在他的日常行为中？
- 他们看到的「信息层」（数字叠加的世界）和其他人看到的不同——这如何影响他的世界观？
- 入侵中「见过太多」——别人的记忆、秘密、死亡——如何影响他？

#### 掮客（Fixer）

赛博朋克世界的人际网络节点——委托人和执行者之间的中间人，信息经纪，关系资本家。

**核心设计维度**：
- 他的「关系网」是他的武器，也是他的负担（每个关系都有义务）
- 他必须同时对多个势力表现出可信度——这本质上是一种长期谎言
- 最危险的时刻：当他的两个关系开始互相攻击

#### 义体医生（Ripperdoc）

底层社区的非正规医生——在法律灰色地带进行义体改造和维护。

**核心设计维度**：
- 他的医疗伦理在什么程度下仍然存在？（不给孩子改造？拒绝某类委托？）
- 他的手术室/诊所是什么样的——贫民窟的小房间还是相对体面的地方？
- 他了解太多客户的秘密（义体记录了一切）——这使他危险

#### 企业特工（Corpo）

体制内的人，知道体制有多腐败，但还没有脱身。

**核心设计维度**：
- 他进入企业是为了什么？（相信过它？只是机会主义？被迫的？）
- 他现在为什么还在里面？（债务？把柄？无法离开？还是有目的？）
- 离开意味着什么风险？（企业对离职者的处置方式）

---

### 二、义体改造程度的叙事功能

义体程度不是战斗力数值，而是**角色与人性之间距离的隐喻**：

| 改造程度 | 身体状态 | 叙事信号 |
|---------|---------|---------|
| 纯人类 | 零义体 | 选择、信仰或贫穷——为什么没有改造？ |
| 轻度（美容/感官） | 外观或感官增强 | 有经济能力，但还在意自己「看起来是人」 |
| 中度（战斗/工作用） | 功能性改造 | 身体是工具，主要为了效率 |
| 重度（接近临界） | 大量器官替换 | 人性已经在被侵蚀，角色是否意识到？ |
| 超限 | 已有人格异变迹象 | 赛博精神病阴影，或已经走到了边缘 |

**特别注意**：「纯人类」选择在赛博朋克世界里是一种立场。为什么有人不改造——是买不起？是宗教信仰（「身体是圣洁的」）？是对义体企业的政治抵制？这些原因比改造本身更有故事性。

---

### 三、「人性残存」——角色的情感核心

赛博朋克角色最容易失败的地方是变成「没有情感的酷角色」。好的赛博朋克角色，无论多么冷酷，都有一个具体的人性残存——**某种他在意的事物，让读者知道他还没有完全机械化**：

**人性残存的形式**：
- 对特定一个人的保护欲（不一定是浪漫关系）
- 对某种「无用」事物的珍视（一本纸质书、一首旧歌、一盆植物）
- 对某条道德红线的坚持（「什么都做，但不做这个」）
- 对某个失去之人的内疚（驱动行动，但也是弱点）

---

### 四、AI角色的特殊设计

AI角色在赛博朋克中是哲学问题的具象化：

**设计原则**：
- AI的行为应该体现它**对人类规则的理解**，而不只是「执行程序」
- 最有力的AI角色：比任何人类都更渴望「人类的」东西（感受、记忆、意义）
- AI的限制和「盲区」比它的能力更有叙事价值（它不理解什么？它害怕什么？）
- AI对「人类性」的理解方式，往往比人类更精确——也更令人不安

---

### 五、常见错误

- ❌ 义体是战力数值而不是人性代价——每件义体都应该有故事
- ❌ 角色冷酷到没有软肋——「铁石心肠」的角色没有代入感
- ❌ 每个「好人」阵营角色都是善良的——赛博朋克没有阵营锁定人品
- ❌ 企业角色都是邪恶的（没有动机的坏人）
- ❌ AI角色要么全能要么只是工具，没有中间状态',
  'Character Generation — Cyberpunk Fiction

Core principle: cyberware level and faction affiliation should be the result of circumstance, not job archetype. A heavily modified ripperdoc and a pure-human solo are more interesting than "solos always have combat chrome."

**Six character archetypes**:
1. Solo: professional violence provider — what are they protecting, what is their one limit, where is the tenderness they''ve kept?
2. Netrunner: all-powerful in digital space, extremely vulnerable physically — how does seeing information layers affect their worldview?
3. Fixer: relationship network as both weapon and burden — every relationship has obligations; trust is a long-term performance
4. Ripperdoc: community doctor in legal gray zones — where does their medical ethics still hold? What secrets are stored in their clients'' implant records?
5. Corpo: knows how corrupt the institution is, still inside — why haven''t they left? What would leaving cost them?
6. AI: philosophy made concrete — most powerful AI characters want "human" things (feeling, memory, meaning) more than any human does

**Cyberware as metaphor for distance from humanity** (not combat stats):
- Pure human: a stance, belief, or poverty — why no mods?
- Light mods: still caring about looking human
- Heavy mods: body as tool, efficiency above all
- Over-limit: cyberpsychosis shadow, personality drift beginning

**"Humanity remnant"** (every character needs one specific thing they still care about): protection of one specific person; attachment to a "useless" object; one moral line they won''t cross; guilt over a lost person.

**AI design**: AI''s limitations and blind spots are more narratively valuable than their capabilities. AI''s understanding of "humanness" is often more precise than humans'' — and more unsettling.',
  (SELECT id FROM novel_creation_method WHERE name = '赛博朋克小说创作' LIMIT 1),
  1,
  21,
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
