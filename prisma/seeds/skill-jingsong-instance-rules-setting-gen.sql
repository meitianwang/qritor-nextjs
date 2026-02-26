-- 惊悚乐园小说「副本机制」设定生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-instance-rules-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-instance-rules-setting-gen',
  '「副本机制」设定生成：为惊悚乐园小说生成副本运行规则，包括副本生成方式、时间限制、通关条件类型、失败后果、组队机制、副本间关联、难度分级、NPC规则和隐藏机制',
  '"Instance Rules" setting generation: generate instance operation rules for thriller park novels, including generation method, time limits, completion conditions, failure consequences, team mechanics, inter-instance links, difficulty tiers, NPC rules and hidden mechanics',
  '## 「副本机制」设定生成 — 惊悚乐园小说

副本是惊悚乐园小说的核心舞台。每个副本就是一个独立的恐怖故事，而副本机制则决定了这些故事的运行规则。好的副本机制既要提供足够的框架让作者有据可依，又要保留灵活性让每个副本都有独特的恐怖体验。副本机制是"游戏系统"在实战层面的延伸。

---

### 字段生成指南

#### 副本生成方式

副本如何产生？这个设定影响整个故事的世界观深度：

- **系统随机生成**：系统自动创建副本，玩家被分配进入。最简单的设定，适合"不需要深究系统本质"的故事。优点是灵活度极高，可以随时设计新副本；缺点是缺乏世界观深度。
- **现实事件映射**：副本来源于现实中的灵异事件、未解之谜或都市传说。优点是读者有认知基础，可以利用现实中的恐怖元素（如电梯游戏、笔仙、深夜公路传说）；缺点是需要作者有大量的灵异知识储备。
- **玩家记忆/恐惧具现化**：副本由玩家内心的恐惧生成。优点是极具心理恐怖深度，每个副本都能揭示角色内心；缺点是难以解释"多人副本"中到底用谁的恐惧。
- **死者怨念凝聚**：每个副本都是一个死者的怨灵所创造的领域。优点是每个副本都有一个"核心鬼怪"和背后的故事，叙事层次丰富；缺点是容易变成"每次都在解鬼怪身世"的套路。
- **维度裂隙**：副本是另一个维度入侵现实的节点。适合科幻/宇宙恐怖方向，可以引入克苏鲁式的不可名状存在。

#### 时间限制

时间限制是制造紧迫感的核心工具：

- **固定时限**：如72小时、7天。简单明了，读者容易追踪。但长时间限制会降低紧迫感
- **递减时限**：每完成一个阶段减少可用时间。递进式压力，越到后面越紧张
- **条件触发时限**：某些行为会启动倒计时（如被鬼看到后有30分钟逃跑时间）。最灵活，可以制造突发的紧迫感
- **无明确时限**：没有时间限制但有其他递进式危险（如每过一个小时副本中的怪物变强/增多）。适合探索型副本
- **现实时间同步**：副本中的一小时等于现实一小时，主角在现实中也会"消失"。增加现实层面的焦虑

设计要点：时间限制要与副本规模匹配。一个需要探索大型建筑的副本给2小时太短，一个小房间密室逃脱给7天太长。

#### 通关条件类型

通关条件的多样性直接决定副本的趣味度：

| 条件类型 | 示例 | 适合的副本 | 设计要点 |
|---------|------|-----------|---------|
| 生存型 | 活过指定时间 | 恐怖追逐副本 | 需要足够的躲藏/逃跑机制 |
| 解谜型 | 解开核心谜题 | 密室/悬疑副本 | 谜题难度要层层递进 |
| 击杀型 | 消灭核心恐怖实体 | 战斗型副本 | 需要弱点设计和信息获取 |
| 搜集型 | 收集指定物品/信息 | 探索型副本 | 物品分布要有逻辑 |
| 逃脱型 | 找到出口离开 | 封闭空间副本 | 出口位置本身就是谜题 |
| 任务型 | 完成系统指派的特定任务 | 剧情驱动副本 | 任务本身要有道德复杂度 |
| 社交型 | 获取NPC信任/说服某人 | 心理博弈副本 | NPC必须有合理的行为逻辑 |
| 隐藏型 | 真正的通关条件需要自己发现 | 高难度副本 | 必须留足线索让读者事后恍然 |

**设计建议**：最好的副本往往有"表面条件"和"隐藏条件"。表面条件驱动基本行动，隐藏条件提供额外奖励或真正的最优解。

#### 失败后果

失败不等于死亡，多层次的后果设计能增加叙事丰富度：
- **直接死亡**：最简单粗暴。适合高压恐怖，但不利于角色长线发展
- **属性/能力损失**：失去部分能力或永久降低某项属性。痛苦但可承受，让角色带着"伤疤"前行
- **记忆消除**：忘记副本中的经历或现实中的某段记忆。独特且有叙事价值——主角发现自己"少了什么"
- **诅咒附着**：获得某种持续性的负面效果，可能在后续副本中触发。为跨副本叙事提供素材
- **强制转化**：变成副本中的NPC或怪物。最有戏剧性的后果
- **降级/积分清零**：经济惩罚，需要重新积累。适合偏游戏化的故事

#### 组队机制

组队机制直接影响人际关系的叙事层：

- **强制组队**：系统分配队伍。优点是可以制造"与陌生人绑定"的不信任感；缺点是队伍构成需要作者精心安排
- **自由组队**：玩家自行组队。优点是团队关系更自然；缺点是容易变成"固定团队冒险"失去新鲜感
- **随机匹配**：每次副本重新匹配队伍。优点是每次都有新的人际动态；缺点是角色发展的连续性差
- **单人副本**：独自面对。最纯粹的恐怖体验，没有依靠。但叙事上缺少对话和互动
- **混合制**：根据副本难度决定单人还是组队。最灵活的设计

**组队对剧情的影响**：
- 组队产生信任/背叛的空间——"队友可能是内鬼"是经典恐怖设定
- 组队带来能力互补的策略感——不同能力的玩家如何配合
- 队友的死亡比独自面对更有情感冲击力
- 组内的资源分配（谁拿治疗道具？谁当诱饵？）本身就是冲突来源

#### 副本间关联

副本不应该是完全独立的一次性体验，跨副本的关联是串联主线的关键：

- **完全独立**：每个副本互不相干。最简单但缺乏整体感。适合前期世界观建设阶段
- **线索串联**：不同副本中出现相同的符号、组织、或关键词。读者逐渐拼凑出更大的真相
- **NPC重现**：某个副本中的NPC在另一个副本中以不同身份出现。制造"世界是有连接的"感觉
- **因果链条**：前一个副本的选择影响后续副本的内容。增加选择的重量感
- **递进揭秘**：每个副本揭示系统真相的一个碎片。到最后拼出完整画面

**主线串联技巧**：
1. 在早期副本中埋下不起眼的细节（一个奇怪的符号、一句不经意的话）
2. 中期副本中让这些细节重复出现并获得新的含义
3. 后期副本中将所有碎片串联，揭示"原来从第一个副本开始就有预谋"
4. 注意不要在同一个副本中揭示太多主线信息——每次只给一块拼图

#### 难度分级

难度分级需要与游戏系统的等级体系对应：

- 难度名称要有恐怖氛围：如 S级-噩梦、A级-恐惧、B级-惊悚、C级-不安、D级-微恐
- 不同难度的区别不只是"怪更强"——可以是规则更复杂、信息更少、时限更短、陷阱更隐蔽
- 偶尔可以设计"名不副实"的副本——看似低难度实则极其危险，或看似高难度但有巧妙的简单解法
- 难度跃升点是故事转折的好时机——主角首次挑战高一级副本的章节通常是高潮

#### NPC规则

NPC是副本中除了环境之外最重要的交互对象：

- **固定型NPC**：有固定行为模式，可被预测和利用。适合解谜型副本
- **自适应型NPC**：会根据玩家行为改变策略。增加不确定性，适合高难度副本
- **伪装型NPC**：看似普通人实际是恐怖实体，或看似怪物实际是盟友。制造信任危机
- **可对话型NPC**：能与玩家交流并提供信息（但信息可能有误导）。增加社交博弈
- **规则性NPC**：遵循特定规则行动（如"不看它就不会攻击""只在黑暗中出现"）。最有"游戏感"的NPC

#### 隐藏机制

副本中不会被明确告知但存在的暗规则：
- **隐藏通关条件**：完成隐藏条件可以获得额外奖励或真结局
- **禁忌规则**：做了某些事会触发灾难性后果（如说出某个名字、打开某扇门）
- **彩蛋关联**：与其他副本或主线相关的隐藏内容
- **环境响应**：玩家的行为会改变副本环境（如善良的行为让副本变温和，暴力行为让副本更凶残）

---

### 设计要点

1. **副本即故事**：每个副本本质上就是一个完整的短篇恐怖故事，有起承转合。不要把副本只当做"关卡"
2. **规则创造恐怖**：副本中最恐怖的往往不是鬼怪而是规则——"不能转头""不能说话""不能看到自己的影子"
3. **信息不对称**：好的副本永远不会在开头告诉你所有规则。信息的逐步揭示本身就是恐怖的一部分
4. **多解法设计**：不要让副本只有一种通关方式。高智商主角的乐趣在于找到出人意料的解法

### 常见错误

- **副本同质化**：每个副本都是"进鬼屋→找线索→打boss→通关"。要在结构上做变化
- **规则太多记不住**：单个副本的核心规则不要超过3-5条，其余通过体验自然展现
- **忽略副本间的衔接**：如果每个副本完全独立，读者会觉得在看短篇集而非长篇小说
- **NPC工具化**：NPC不应只是"提供线索的工具"，他们应该有自己的动机和恐惧
- **难度曲线不合理**：要么一直很难让读者疲惫，要么一直很简单让读者无聊。应有张弛有度的节奏
- **隐藏机制太隐蔽**：隐藏条件必须有线索可循，不能完全靠运气发现。读者在知道真相后应该能回溯到伏笔',
  '## "Instance Rules" Setting Generation — Thriller Park Novel

Instances are the core stages of thriller park novels. Each instance is an independent horror story, and instance rules define how these stories operate.

---

### Field Generation Guide

#### Instance Generation Method
System-generated (simplest, most flexible), reality-mapped (urban legends, real events), fear materialization (psychological depth), ghost resentment (layered narrative), or dimensional rifts (cosmic horror).

#### Time Limits
Fixed duration, decreasing phases, condition-triggered countdowns, no explicit limit but escalating danger, or real-time sync. Match time limits to instance scale.

#### Completion Conditions
Survival, puzzle-solving, elimination, collection, escape, task-based, social, or hidden conditions. Best instances have both surface conditions and hidden optimal solutions.

#### Failure Consequences
Direct death, attribute/ability loss, memory erasure, curse attachment, forced transformation, or rank/currency reset. Multiple layers add narrative richness.

#### Team Mechanics
Forced teams (distrust dynamics), free teams (natural bonds), random matching (fresh dynamics each time), solo (pure horror), or hybrid. Teams create trust/betrayal space and resource allocation conflicts.

#### Inter-Instance Links
Fully independent, clue threading (repeating symbols/keywords), NPC recurrence, causal chains (choices affect future instances), or progressive revelation. Plant details early, recontextualize mid-story, connect everything late.

#### Difficulty Tiers
Horror-themed names. Difficulty differences should include rule complexity, information scarcity, and trap subtlety — not just stronger monsters. Difficulty jumps make great story turning points.

#### NPC Rules
Fixed behavior (predictable), adaptive (responsive), disguised (trust crisis), conversational (social strategy), or rule-based (game-like patterns like "don''t look at it").

#### Hidden Mechanics
Hidden completion conditions, taboo rules, cross-instance Easter eggs, and environment responses to player behavior.

### Common Mistakes
- Homogeneous instances (vary structure)
- Too many rules per instance (keep to 3-5 core rules)
- No inter-instance connection (feels like short story collection)
- NPCs as pure tools (give them motivations)
- Unreasonable difficulty curve (needs rhythm)
- Hidden mechanics too obscure (must have traceable clues)',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1),
  1,
  22,
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
