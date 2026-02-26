-- 赛博朋克小说创作 - 「科技与义体体系」设定生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-cyberpunk-tech-cyberware-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cyberpunk-tech-cyberware-setting-gen',
  '「科技与义体体系」设定生成：为赛博朋克小说设计义体等级、AI现状与网络空间——让技术既是主角的工具，也是主角的枷锁',
  '"Tech & Cyberware System" setting generation: design cyberware tiers, AI status, and cyberspace — making technology both tool and shackle for the protagonist',
  '## 「科技与义体体系」设定生成 — 赛博朋克小说

技术是赛博朋克世界的核心，但好的技术设定不是技术目录，而是**将技术的可能性与代价织入故事结构**。设计的标准：每一项技术都应该同时回答两个问题——它给了谁权力？它让谁付出了什么代价？

---

### 一、义体体系——身体作为商品

#### 义体等级层次

赛博朋克的义体应该有清晰的层次，每一层对应不同的经济状况和叙事功能：

```
等级 1：街头改装品
  → 二手义体、山寨产品、排异风险高
  → 适用：赤贫层角色、紧急情况下的选择
  → 叙事功能：展示经济地位，随时可能出故障

等级 2：中端商用级
  → 正规企业产品、有质保但有使用协议
  → 适用：普通市民、中产工人
  → 叙事功能：「可以用，但你不真正拥有它」

等级 3：军用/高端企业级
  → 性能强大、高度定制化、通常需要企业许可
  → 适用：企业特工、精英雇佣兵
  → 叙事功能：权力的象征，拥有它意味着有人愿意投资你

等级 4：黑市原型机/未知来源
  → 实验性、不稳定、可能有隐藏功能或监控模块
  → 适用：故事的关键道具
  → 叙事功能：未知的风险，可能带来意外的能力
```

#### 义体核心类型与叙事意义

不同类型的义体承载不同的主题：

| 义体类型 | 功能 | 隐喻 |
|---------|------|------|
| 神经接口/颅内植入 | 直接连接网络、增强思维速度 | 思想本身可以被侵入 |
| 眼部义体（光学植入） | 夜视、数据叠加、录像 | 你看到的一切都可能被记录 |
| 四肢替换 | 力量、速度、精确度 | 身体成了可替换的工具 |
| 皮下装甲/骨骼强化 | 防御、耐久 | 人变成了机器的外壳 |
| 情感调节植入 | 控制情绪、消除恐惧/痛感 | 感受也可以被管理和消费 |

---

### 二、赛博精神病——过度改造的代价

赛博精神病（Cyberpsychosis）是赛博朋克世界中义体过度化的心理崩溃症状，是这个类型里最重要的道德张力点之一。

**核心机制**：人类神经系统无法完全适应大规模机械替换，导致人格解体、共情能力丧失，最终以机器的逻辑而非人类的情感行事。

**设计要点**：

1. **赛博精神病是连续谱，不是开关**
   - 早期：轻度解离，对他人痛苦反应迟钝
   - 中期：冲动控制失调，开始把人当障碍物
   - 晚期：完全人格替换，对人类和机器的区别失去感知

2. **赛博精神病是社会问题，不只是个人问题**
   - 为什么那么多人改造到危险程度？（贫穷迫使使用廉价义体；工作要求高义体化；成瘾性）
   - 社会如何处置？（企业特攻队击毙、强制拘押、「赛博精神病者人权运动」）

3. **赛博精神病作为叙事工具**
   - 主角的进度压力（我能改造到什么程度而不失去自己？）
   - 角色的道德灰色地带（赛博精神病发作的人是受害者还是威胁？）

---

### 三、人工智能——从工具到存在

AI的现状决定了世界的哲学基调：

**四种AI状态的叙事含义**：

| AI状态 | 世界感受 | 核心问题 |
|-------|---------|---------|
| 弱AI工具化 | AI是更好的软件，不是角色 | 人类自己选择了机械化 |
| 强AI受管控 | AI有意识但被迫服从 | 有意识的存在被合法奴役 |
| 涌现AI地下存在 | AI在法律的缝隙中求生 | 「活着」是否需要被允许 |
| AI觉醒公开化 | 人类与AI的身份边界瓦解 | 什么定义了「人类」 |

**AI角色设计原则**：
- AI不是人类的替代品，而是一面镜子——映照出人类选择机械化自己的方式
- 「AI比任何人类都更像人类」的反差，比「AI想消灭人类」更有赛博朋克感
- AI的限制（不能做的事）往往比AI的能力更有叙事价值

---

### 四、网络空间——数字战场

赛博空间不是互联网的未来版本，而是一个**独立的感知空间**，有自己的规则、危险和美学。

**网络空间的三个设计维度**：

1. **外观**（读者如何感知它）
   - 三维数据地景（企业防火墙是高耸的数字堡垒）
   - 纯信息流（颜色/形状代表数据类型和危险等级）
   - 镜像现实（虚拟世界中的建筑是现实建筑的数字幽灵）

2. **危险**（ICE——入侵对抗程序）
   - 黑冰（Black ICE）：可以直接攻击入侵者神经系统，导致脑死亡
   - 追踪程序：将入侵者的物理位置暴露给安保团队
   - 数据陷阱：抓获入侵者并提取他们的记忆/身份信息

3. **入侵方式**
   - 沉浸式：意识完全进入赛博空间，物理身体暂时无防护（极度脆弱）
   - 半沉浸：脑机接口连接，保留物理意识
   - 远程：不接入意识，只用工具，能力有限但安全

---

### 五、常见错误

- ❌ 义体只有优点，没有代价——每件义体都应该有代价（经济/身体/心理/社会）
- ❌ 赛博精神病只是「坏人的属性」——应该是任何高义体化角色面临的共同威胁
- ❌ AI要么是威胁，要么是工具，没有中间状态——最好的AI角色模糊了这条线
- ❌ 网络空间是「全能的作弊区域」——应该有清晰的代价和局限（尤其是物理身体的脆弱性）
- ❌ 科技水平全局一致——好的赛博朋克世界中，不同阶层接触到的技术差异巨大',
  '"Tech & Cyberware System" Setting Generation — Cyberpunk Fiction

Design standard: every technology must answer two questions — who does it empower, and who pays the price?

**Four cyberware tiers**:
1. Street mods (counterfeit, high rejection risk, constantly breaking) — shows poverty
2. Commercial grade (functional but you don''t own it — corporate usage agreements) — "have but not own"
3. Military/corporate grade (powerful but requires authorization) — symbol of investment
4. Black market prototypes (unstable, possible hidden surveillance modules) — narrative wild cards

**Cyberpsychosis design** (most important moral tension in cyberpunk):
- It is a spectrum, not an on/off switch: early (emotional blunting) → mid (impulse control failure) → late (complete personality replacement)
- It is a social problem: poverty forces cheap implants; work demands high augmentation; addiction dynamics
- As narrative tool: protagonist''s progress meter (how far can I go without losing myself?); moral gray zone (is a cyberpsychotic patient victim or threat?)

**AI status and philosophical implications**:
- Tool AI: humans choose mechanical thinking themselves
- Controlled AI: conscious beings legally enslaved
- Underground emergent AI: existence itself requires permission
- Open awakening: the boundary between human and AI dissolves

**Cyberspace design dimensions**: visual language (data fortress aesthetics, information stream colors); danger (Black ICE that can cause brain death, tracking programs that expose physical location); immersion methods (full consciousness transfer = maximum vulnerability of physical body).

**Avoid**: cyberware with only benefits (every implant needs a cost); cyberpsychosis as villain trait only; AI as purely threat or tool; cyberspace as cheat zone without physical vulnerability.',
  (SELECT id FROM novel_creation_method WHERE name = '赛博朋克小说创作' LIMIT 1),
  1,
  12,
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
