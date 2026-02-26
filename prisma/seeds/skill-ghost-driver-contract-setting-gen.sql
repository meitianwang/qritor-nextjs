-- 灵异司机职业流小说 - 「契约规则」设定生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ghost-driver-contract-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ghost-driver-contract-setting-gen',
  '「契约规则」设定生成：为灵异司机职业流小说设计可信、有张力、可利用漏洞的职业契约体系',
  '"Contract Rules" setting generation: design believable, tension-filled, loophole-exploitable driver contracts for ghost bus novels',
  '## 「契约规则」设定生成 — 灵异司机职业流小说

契约规则是这类小说的核心叙事引擎。好的契约体系有一个反直觉的特点：**规则越合理越可怕，越像真实劳动合同越让人窒息**。读者不应该觉得「这是古代神明的莫名诅咒」，而应该觉得「这份合同的甲方乙方条款，我好像在自己公司签过类似的」。

---

### 字段生成指南

#### 契约内容

主角签约的动机决定了故事的情感底色。

**四种经典签约动机**：

| 动机类型 | 代表情景 | 情感基调 |
|---------|---------|---------|
| 高薪诱惑 | 月薪是正常工资五倍，主角急需钱 | 「都是为了钱」的自嘲 |
| 债务绑定 | 前任司机欠下冥府债务，主角继承 | 「我有什么选择」的无力 |
| 被迫签约 | 意外目击了不该看的东西，签约封口 | 「知情即绑定」的恐惧 |
| 自愿探寻 | 主角本身有秘密需要冥府资源 | 「各取所需」的紧张平衡 |

**判断标准**：签约动机要与主角的日常处境有真实交叉——读者应该理解「为什么这个人在这种情况下会签」。

#### 雇主

雇主的神秘程度决定主线谜题的深度。

**雇主设计原则**：
- **不要太早解释雇主是谁**——「神秘机构」比「冥府第四司」更有张力（初期）
- **雇主的要求应该有内在逻辑**：为什么要用活人开车？为什么不能是鬼来驾驶？答案本身可以成为谜题
- **雇主与主角的权力不对等是张力来源**：雇主知道的永远比主角多

**常见雇主类型及对应叙事张力**：
- 冥府官僚体系：制度压迫感，规则来自「上面有规定」
- 神秘中间商：动机不明，是否有背叛可能
- 古老存在（某个地点或概念本身）：规则的来源无法追问
- 已故前任（以某种方式继续影响）：情感层面的复杂性

#### 基本守则

守则的黄金标准：**具体、合理、在情急之下极难遵守**。

**三种守则结构模式**：
1. **「禁止型」**：不能做X
   - 示例：「不能在班次中途停车，无论发生什么」
   - 示例：「不能让任何乘客知道你是活人」
2. **「强制型」**：必须做X
   - 示例：「每到一站必须等足3分钟，即使没有乘客上下车」
   - 示例：「乘客落座后必须在30秒内关门出发」
3. **「条件型」**：如果X发生，必须Y
   - 示例：「如果乘客在车上发生冲突，必须停车而非加速」
   - 示例：「如果终点站没有乘客下车，必须等到天亮才能离开」

**守则设计要满足**：
- ✅ 具体到有明确的触发条件（「不能晚点」不够具体；「不能晚于班次时间2分钟到站」就够了）
- ✅ 在压力下正常人会本能违反（危急时想停车、想加速、想拒绝某个乘客）
- ✅ 守则之间可能产生冲突（「不能停车」遇上「乘客冲突必须停车」）

#### 违规后果

后果设计要有层次感，不要第一次违规就是最严重的惩罚。

**层次化后果框架**：
```
轻微违规（程序性错误）：
  当班扣除部分薪酬 / 下次班次乘客更难处理 / 收到「警告通知」

中度违规（实质性错误）：
  某种能力被限制 / 契约条款自动加重 / 产生「信用欠款」需要额外完成任务偿还

严重违规（拒绝履约）：
  人身威胁 / 亲近之人受波及 / 契约升级为无限期

极端情况（主动破坏契约）：
  留给主角去发现，设定中只写「后果不明」
```

生成时描述前三层，第四层用「据前任司机留下的记录，这种情况从未有人活着描述过」处理。

#### 司机待遇

报酬设计要满足「值得冒险但不足以消除风险」。

**冥币经济体系设计要点**：
- **基础薪酬**：完成正常班次的固定收入（能维持生活+有剩余投资升级）
- **奖励系统**：成功处理特殊乘客、超额完成特殊任务的额外奖励
- **扣除机制**：违规、车辆损坏、乘客不满等导致扣薪
- **稀有奖励**：特殊道具、信息、阳间利益（健康、运气、某人的保护）

**好的报酬设计**：让主角在「危险得不值得」和「值得冒险继续」之间摇摆，而不是稳定在任意一端。

#### 合同漏洞

漏洞是主角行动空间的来源，也是读者智识满足感的来源。

**好的漏洞设计原则**：
- 不违反规则的字面意思，但利用了规则没有预见的情况
- 发现漏洞本身要有代价（需要先遭遇危机才能发现）
- 漏洞被「察觉」后可能会失效或引发新条款

**示例**：
- 「规则是不能拒载——但没说不能在开门前假装没看见」（有效但只能用一次）
- 「规则说乘客必须在终点站下车——但这个乘客本来就住在终点站，它从未真正''上车''」（钻字面漏洞）

---

### 常见错误

- ❌ 规则太像玄幻神术规则，缺乏职业合同感（「违反者魂飞魄散」太直接）
- ❌ 违规后果太随机，主角无法预判，消解了策略性
- ❌ 报酬太丰厚，主角没有动力冒险（「反正赚够了就辞职」的想法出现就失去张力）
- ❌ 合同漏洞在第一章就全部揭示，主角后续没有成长空间
- ❌ 守则数量过多超过5条核心规则，读者和主角都记不住',
  '"Contract Rules" Setting Generation — Ghost Driver Paranormal Novel

The contract must feel like a real employment agreement — the more it resembles an actual labor contract, the more suffocating it becomes.

**Contract motivation types**: high-pay temptation (relatable economic desperation), debt inheritance (from previous driver), forced binding (witnessed something, must sign to seal knowledge), voluntary exchange (protagonist needs something only the employer has).

**Three rule structures**:
1. Prohibition: "Cannot stop mid-route, regardless of circumstances"
2. Mandate: "Must wait exactly 3 minutes at each stop, even with no passengers"
3. Conditional: "If passengers fight on board, must stop vehicle rather than accelerate"

Rules must be specific enough to trigger under pressure and plausibly violated by normal human instincts in crisis situations.

**Layered consequence framework**:
- Minor (procedural): pay docked, next shift has harder passengers
- Moderate (substantive): ability restricted, contract terms auto-escalate
- Severe (refusal): personal safety threatened, contract becomes indefinite
- Extreme: "No driver who reached this point has left a surviving account"

**Loophole design**: exploits the literal wording without violating its intent. Loopholes should cost something to discover and may become invalid once "noticed" by the contract system.',
  (SELECT id FROM novel_creation_method WHERE name = '灵异司机职业流小说' LIMIT 1),
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
