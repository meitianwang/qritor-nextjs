-- 赛博朋克小说创作 - 道具生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-cyberpunk-prop-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cyberpunk-prop-gen',
  '道具生成：为赛博朋克小说设计义体与装备——每件道具都是一个关于代价与身份的叙事锚点',
  'Prop generation: design cyberware and equipment for cyberpunk fiction — every item is a narrative anchor about cost and identity',
  '## 道具生成 — 赛博朋克小说

赛博朋克道具设计的核心原则：**每一件装备，包括义体，都同时是工具和代价**。它让角色能做到什么，同时它让角色失去了什么、暴露了什么、依赖了什么。纯粹的「加强版武器」没有赛博朋克感；一个「让你变强但让你不确定自己是否还是人类」的义体，才是赛博朋克。

---

### 一、义体改造——身体作为选择的记录

义体不只是功能，而是角色关于自身的一系列决策：为什么改造这个部位？是被迫的还是主动的？改造之后发生了什么变化？

#### 感官增强类

**眼部义体（光学植入）**
- 功能：夜视、变焦、数据叠加显示、录像、X射线扫描等
- 代价：眼睛是「窗户」——改造后，别人也能通过它看进来（被黑客入侵、信号可追踪）
- 叙事价值：「用义体的眼睛看到的世界和用人类的眼睛看到的是不一样的」

**听觉植入**
- 功能：超声波听觉、指向性麦克风、降噪、语言实时翻译
- 代价：持续「听到太多」的信息过载；无法关闭时的失控感

#### 战斗改造类

**手臂/手部义体**
- 功能：力量增强、内置武器（刀刃、射击装置）、精密操作
- 代价：握手时对方能感受到金属的冷；无法「轻柔触碰」
- 叙事价值：暴力工具化的隐喻——身体的一部分成了武器

**脊柱/骨骼强化**
- 功能：速度提升、冲击吸收、负重增加
- 代价：维护费用高；旧型号在气温变化时发出噪音；手术失败率非零

**皮下装甲**
- 功能：防弹、防刺、减少物理伤害
- 代价：外观异常（皮肤下的金属轮廓可见）；触感不再「正常人」

#### 神经/认知类

**神经接口（Cyberlink）**
- 功能：直接连接设备、数据传输、思维加速
- 代价：入侵风险最高；一旦被入侵，意识可能被侵占；「接口感」（不断感到有信号在流动）

**记忆芯片/知识植入**
- 功能：即时获取某类知识或技能、记忆存储/备份
- 代价：植入的「技能」和真实的记忆混合——你怎么知道哪些是你真正的经历？

---

### 二、外置装备——工具即立场

装备的类型不只反映战斗风格，也反映角色的价值观和阵营：

#### 武器

**近战武器**
- 振动刃/单分子线：高端感，是精英的武器
- 街头改装刀/拆解工具改武器：真实感，是穷人的武器
- 义体内置刃：隐蔽性强，但隐藏着「身体本身就是武器」的问题

**远程武器**
- 智能枪（弹道计算、生物识别锁定）：依赖网络，被黑就废
- 非智能旧式枪械：不被数字系统识别，是黑市/老派风格
- 非致命武器（EMP、麻醉弹）：暗示角色还不想杀人，或者想保留目标有用

#### 黑客设备/套件

- 硬件入侵端（Cyberdeck）：掌上电脑大小的入侵工具，质量决定能破的ICE级别
- 信号干扰器：阻断通讯和追踪，同时让自己也断网（双刃）
- 数据刺针：直接插入系统的物理入侵工具（需要物理接触，高风险高收益）

#### 情报收集工具

- 微型摄像/录音装置：监视工具（使用它意味着主角也在用「企业的方式」运作）
- 信号嗅探器：截获无线数据（在法律上是犯罪，在街头是标配）
- 身份伪装套件：假证件、信号遮蔽、生物特征混淆

---

### 三、装备的「叙事象征」维度

好的道具设计让装备承载意义，不只是功能：

| 象征类型 | 实现方式 |
|---------|---------|
| 身份认同 | 某件装备是角色身份的标志（「没有人记得他，但记得那把刀」） |
| 过去的痕迹 | 装备来自某个人/某段经历（前任搭档的义体、死去恋人留下的枪） |
| 道德边界 | 角色拥有某件可怕装备但从不用（是什么让他下不了手？） |
| 技术依赖的焦虑 | 装备失灵/没电/被黑客攻击时，角色的反应揭示了他对技术的依赖程度 |

---

### 四、装备的代价类型

每件装备都应该有明确的代价，选择至少一种：

- **经济代价**：维护费用、定期更新、电池/能量消耗
- **身体代价**：排异反应、长期损耗、上瘾性（义体对神经系统的依赖）
- **身份代价**：携带它改变了别人对你的看法
- **法律代价**：持有某类装备在某些区域违法
- **数字安全代价**：联网设备都可能被追踪或入侵
- **人性代价**：使用它让你做了某件改变了你的事

---

### 五、常见错误

- ❌ 义体是纯粹的加强，没有限制和副作用
- ❌ 装备没有来历——每件重要道具都应该有一个简短的故事
- ❌ 黑科技像魔法一样运作，没有内在逻辑
- ❌ 装备只有使用场景，没有不使用时对角色的影响
- ❌ 所有装备功能列表式描述，没有感受性描写',
  'Prop Generation — Cyberpunk Fiction

Core principle: every piece of equipment, including cyberware, is simultaneously a tool and a cost. What it enables, and what it makes the character lose, expose, or become dependent on.

**Cyberware by type and narrative value**:
- Optical implants: functionality (night vision, data overlay, recording) vs. narrative inversion ("it can see in, too" — hack vulnerability, signal traceability)
- Combat limbs: power increase vs. "the handshake that feels like metal" — body parts become weapons
- Neural interface: direct network connection vs. highest intrusion risk, consciousness invasion possible
- Memory chips: instant knowledge access vs. "which memories are actually mine?"

**External equipment as stance**:
- Smart weapons (ballistic computing, bio-lock) depend on network — hackable; old mechanical guns are invisible to digital systems — old-school/underground
- Cyberdeck quality determines which ICE can be broken
- Signal jammer cuts tracking and comms — also cuts the user off from the net (double-edged)

**Symbolic dimensions of props**:
- Identity marker: nobody remembers him but everyone remembers the knife
- Past trace: weapon from a dead partner, cyberarm from someone who trusted you
- Moral boundary: character owns a terrible device but never uses it — what stops them?
- Technology dependency anxiety: how character responds when it fails reveals depth of reliance

**Cost categories** (every item needs at least one): economic (maintenance fees, updates); physical (rejection reactions, addiction); identity (changes how others see you); legal (illegal in certain zones); digital (networked = hackable); humanity (using it made you do something that changed you).',
  (SELECT id FROM novel_creation_method WHERE name = '赛博朋克小说创作' LIMIT 1),
  1,
  23,
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
