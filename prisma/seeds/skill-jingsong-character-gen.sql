-- 惊悚乐园小说「角色」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-character-gen',
  '「角色」生成：为惊悚乐园小说生成角色，涵盖玩家/NPC/Boss等角色类型、叙事定位、特殊能力、生存状态、隐藏秘密等维度的完整设计',
  '"Character" generation: generate characters for thriller park novels, covering player/NPC/Boss types, narrative roles, special abilities, survival status, hidden secrets, and complete design dimensions',
  '## 「角色」生成 — 惊悚乐园小说

惊悚乐园类小说的角色设计核心是**游戏化身份 × 副本生存压力 × 隐藏信息博弈**。角色不是生活在正常世界中的人——他们是被游戏系统选中（或困住）的玩家，或是副本世界中按规则运作的NPC和恐怖存在。每个角色的设计都要回答一个问题：**这个角色在副本求生的极端环境中，会做出什么选择？**

不同于传统恐怖小说的角色，惊悚乐园的角色天然带有"竞技性"——玩家之间既是队友也是潜在的竞争者，NPC可能是盟友也可能是陷阱，Boss级存在既是恐怖来源也是可被攻略的目标。这种多层博弈关系是角色设计的根基。

---

### 字段生成指南

#### 姓名

- 玩家角色：正常的中国人名或网名/代号混用（如"封不觉"、"萧遥"、"王瘦子"）
- 副本NPC：符合副本世界观的名字（古代副本用古名、都市副本用现代名）
- 系统NPC：可用代号或称谓（"商店老板"、"裁判"、"引路人"）
- Boss级存在：恐怖感强的称谓或名号（"不归者"、"第七夜的访客"、"镜中人"）
- 神秘人物：刻意模糊的称呼（"那个人"、"先驱者"、"第零号玩家"）
- **避免**过于中二或冗长的名字

#### 角色类型

五个选项的设计要点和叙事功能：

| 类型 | 核心特征 | 设计要点 |
|------|---------|---------|
| **其他玩家** | 和主角一样被系统选中的人 | 多样性是关键——职业、性格、能力、动机各不相同；有人求生、有人争第一、有人藏着秘密。玩家之间的信任与背叛是核心张力 |
| **副本NPC** | 存在于副本世界中的角色 | 行为受副本规则约束；可能是线索提供者、陷阱执行者、或恐怖事件的受害者/加害者。NPC的"不真实感"本身就是恐怖来源——他们会在特定条件下"循环"或"失控" |
| **系统NPC** | 游戏系统派出的角色 | 商店、任务发布、规则解释等功能性角色；但也可能有自己的"人格"——冷漠、戏谑、隐藏善意。系统NPC往往知道比他们说出来的多得多 |
| **Boss级存在** | 副本或系统中的顶级恐怖存在 | 威压感是第一位——Boss出场时其他角色的反应（恐惧、绝望、逃跑）比Boss本身的描写更重要。Boss要有明确的规则和弱点，不能是纯粹的"无敌怪物" |
| **神秘人物** | 身份不明的角色 | 信息差是核心武器——读者和主角都不知道这个角色的真实身份和目的。可以是跨副本出现的存在，暗示系统更深层的秘密 |

#### 角色定位

七个选项的叙事功能详解：

| 定位 | 叙事功能 | 设计技巧 |
|------|---------|---------|
| **可靠盟友** | 给主角提供支援、制造温情 | 盟友的可靠性要有证明过程（共同经历生死考验）；盟友的能力要与主角互补而非重叠 |
| **竞争对手** | 制造紧张感、推动主角成长 | 竞争对手不等于反派——可以是"亦敌亦友"的关系；能力上要能与主角匹敌甚至局部超越 |
| **导师/前辈** | 传授经验、揭示系统规则 | 导师的信息不能一次给完——每次只给一部分，保持悬念；导师自身也有困境和局限 |
| **炮灰/牺牲品** | 用死亡推动剧情、展示危险 | 炮灰虽然活不久，但必须有1-2个让读者记住的特征（一句口头禅、一个小习惯、一段背景故事）。死得太"路人"会让读者无感。炮灰的死亡方式要能展示副本的规则或危险 |
| **反派/背叛者** | 制造反转、增加不信任感 | 伏笔铺设是关键——背叛不能突然发生，之前必须有可追溯的线索（微妙的言行不一致、关键时刻的犹豫、过于主动的好意）。背叛的动机要合理（求生本能、被胁迫、自私但可以理解） |
| **隐藏Boss** | 制造最大反转 | 前期必须以其他身份存在（盟友、导师、甚至炮灰），读者和主角都被骗。揭露身份的时机是剧情高潮 |
| **线索人物** | 推进解谜、揭示真相 | 信息给予方式要自然——不能像NPC一样"读台词"。可以通过行为暗示、残留的日记、临死前的只言片语来传递线索 |

#### 性别

- 惊悚乐园类小说的角色性别分布通常比较均衡
- 性别不应成为角色存活的决定因素
- 避免"女性角色=需要保护"的刻板设计

#### 外貌特征

- 要为角色在恐怖场景中的视觉呈现服务
- 玩家角色：突出辨识度特征（"总戴着一副墨镜"、"左手缺了一根小指"、"永远穿黑色风衣"）
- 副本NPC：外貌暗示其副本身份或命运（"面色苍白到不正常"、"笑容僵硬"、"眼神空洞"）
- Boss级存在：恐怖与美学的结合——最好的Boss外形是"美丽但不对劲"或"日常但扭曲"
- **核心原则**：用1-2个强特征让读者记住，不要写成详尽的人物志

#### 性格特点

- 在副本极端环境中才能看到真实性格——所有的"人设"在生死面前都会被考验
- 冷静理智型：分析推理的主力，但可能在情感面前崩溃
- 热血冲动型：关键时刻敢拼命，但容易中陷阱
- 腹黑算计型：总在算计利弊，但可能在最后关头展现人性
- 乐观话痨型：调节紧张气氛，但乐观外表下可能藏着创伤
- **避免扁平性格**——每个角色至少要有一个"与表面性格矛盾的暗面"

#### 特殊能力

- 来自游戏系统的能力（技能、道具、被动效果）或角色自身的天赋
- 能力要有明确的适用场景和限制条件——不能什么都能解决
- 能力可以暗示角色的经历（"他会这个技能说明他经历过某种副本"）
- 能力之间的搭配/克制关系可以推动团队协作或PVP冲突
- NPC的能力要符合副本规则，不能超出副本世界观

#### 与主角关系

- 描述初始关系和潜在的发展方向
- 不要只写静态关系——要暗示关系会如何变化
- "信任建立→信任被打破→重建或永久决裂"是惊悚乐园常见的关系弧
- 与主角的关系影响该角色的剧情功能（盟友提供支援、对手制造竞争、导师传授知识）

#### 生存状态

四个选项的叙事意义：

| 状态 | 叙事功能 | 使用场景 |
|------|---------|---------|
| **存活** | 持续参与剧情 | 核心团队成员、长期对手 |
| **已死亡** | 制造冲击、推动剧情转折 | 炮灰的标准结局；重要角色的死亡是大事件 |
| **下落不明** | 制造悬念、为后续埋伏笔 | 可能在后续副本中再次出现；可能已死但未确认 |
| **反复出现（死而复生）** | 最恐怖的选项——暗示系统或副本的诡异性 | Boss级存在、系统级角色、或暗示某种循环机制 |

生存状态与剧情节奏的关系：
- **前期**：炮灰死亡建立紧张感，核心角色全部存活
- **中期**：重要角色开始"下落不明"或死亡，每次都是剧情转折点
- **后期**：反复出现的角色揭示系统层面的秘密
- **死亡不能太密集**——否则读者会麻木；也不能太稀疏——否则没有紧张感

#### 背景故事

- 进入游戏前的身份和经历——解释角色的动机和行为模式
- 背景故事可以分层揭示：初见时只看到表面，随着剧情推进逐渐揭露深层
- 背景故事与游戏系统的关系：为什么被选中？是否主动进入？
- 副本NPC的背景故事是副本世界观的一部分——要与副本主题一致

#### 隐藏秘密

- 每个重要角色都应该有至少一个隐藏秘密——这是惊悚乐园类小说的核心叙事资源
- 秘密的层级：个人秘密（不想被知道的过去）→ 游戏秘密（知道系统的某个隐藏规则）→ 系统秘密（关联到整个游戏的真相）
- 秘密的揭露时机要精心设计——太早浪费、太晚无感
- 秘密可以是角色行为的真实动机（"他帮助主角不是因为善良，而是因为..."）
- **隐藏秘密不等于反派**——盟友也可以有秘密，秘密不一定是恶意的

---

### 角色阵容搭配建议

**标准配置（一个副本内的角色组合）**：
1. **主角**：冷静理智或疯批无畏型，有明确的核心能力和成长路线
2. **可靠搭档**（1人）：与主角能力互补的其他玩家，有自己的故事线
3. **竞争对手**（1人）：能力与主角匹敌的其他玩家，亦敌亦友
4. **炮灰**（1-2人）：展示副本危险度的牺牲品，但不能太路人
5. **线索NPC**（1人）：知道部分真相的副本角色，信息给予方式要有趣
6. **副本Boss**（1个）：恐怖的核心来源，有规则、有弱点、有存在感

**跨副本的长期角色**：
- 固定队友（可靠搭档，跨副本同行）
- 宿敌/老对手（反复在不同副本遭遇）
- 神秘人物（偶尔出现，暗示主线）
- 系统NPC（商店、任务面板等固定界面）

---

### 常见错误

1. **玩家角色同质化**：所有其他玩家都是"普通人被拉进游戏"——应该有多样的职业、性格、动机和能力
2. **NPC过于工具化**：副本NPC只是"读台词的工具人"，缺乏自身的故事和情感——好的NPC让人分不清他是真人还是程序
3. **Boss缺乏规则**：Boss级存在只有"很强很恐怖"，没有明确的能力边界和弱点——可被攻略的Boss才有叙事张力
4. **背叛太突然**：反派/背叛者的反转没有伏笔，读者感觉被欺骗而非震惊
5. **炮灰太路人**：炮灰角色完全没有特征，死了也没感觉——浪费了制造冲击的机会
6. **生存状态安排失当**：前三章就死了一半角色（节奏太快），或者全书没人死（缺乏紧张感）
7. **隐藏秘密太浅**：角色的秘密只是"以前做过坏事"——好的秘密应该与游戏系统或主线剧情有关联
8. **能力平衡失调**：某个角色太强导致副本毫无挑战，或太弱完全成为累赘——每个能力都应有适用场景和限制',
  '## "Character" Generation — Thriller Park Novel

Character design in thriller park novels centers on **gamified identity × dungeon survival pressure × hidden information games**. Characters are players chosen (or trapped) by a game system, or NPCs/bosses operating by dungeon rules. Every character must answer: what choices would they make under extreme survival conditions?

---

### Field Generation Guide

#### Name (姓名)
Players: normal Chinese names or code names. Dungeon NPCs: names matching dungeon worldview. System NPCs: titles or designations. Bosses: intimidating titles. Mysterious figures: deliberately vague appellations.

#### Character Type (角色类型)
Five types: Other Players (diverse backgrounds, trust/betrayal tension), Dungeon NPCs (bound by dungeon rules, "uncanny" behavior is horror source), System NPCs (functional but may have hidden personality), Boss-level Beings (overwhelming presence, must have rules and weaknesses), Mysterious Figures (identity unknown, information asymmetry is key weapon).

#### Role (角色定位)
Seven positions: Reliable Ally (complementary to protagonist), Rival (evenly matched, friend-or-foe), Mentor (gives information gradually), Cannon Fodder (must have 1-2 memorable traits despite short lifespan), Betrayer (needs foreshadowing — subtle inconsistencies before reveal), Hidden Boss (disguised as another role), Clue Character (delivers information naturally).

#### Special Ability (特殊能力)
From game system or personal talent. Must have clear scope and limitations. Can hint at character history. Ability synergies/counters drive team dynamics or PVP conflict.

#### Survival Status (生存状态)
Alive (ongoing participant), Dead (creates impact), Missing (builds suspense), Recurring (most unsettling — implies system-level mysteries). Pacing: early deaths establish danger, mid-story losses mark turning points, late recurring reveals system secrets.

#### Hidden Secret (隐藏秘密)
Every important character needs at least one. Levels: personal → game rule → system truth. Reveal timing must be carefully designed. Secrets drive behavior but do not equal villainy.

---

### Roster Suggestions

Standard dungeon lineup: protagonist, reliable partner (1), rival (1), cannon fodder (1-2), clue NPC (1), dungeon boss (1). Cross-dungeon recurring: fixed teammates, nemesis, mysterious figure, system NPCs.

---

### Common Errors

1. Homogeneous players with no diversity
2. NPCs as pure exposition tools without personality
3. Bosses with no rules or weaknesses
4. Betrayals without foreshadowing
5. Featureless cannon fodder whose deaths create no impact
6. Poor survival pacing (too many early deaths or no deaths at all)
7. Shallow secrets unrelated to the game system or main plot
8. Broken ability balance (one character too strong or too weak)',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1),
  1,
  30,
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
