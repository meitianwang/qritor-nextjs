-- 灵异司机职业流小说 - 「故事钩子」设定生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ghost-driver-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ghost-driver-story-hook-setting-gen',
  '「故事钩子」设定生成：为灵异司机职业流小说生成让读者上车的第一份恐惧合同',
  '"Story Hook" setting generation: create the first fear contract that makes readers board the ghost bus',
  '## 「故事钩子」设定生成 — 灵异司机职业流小说

故事钩子是这类小说与读者签订的第一份雇佣协议。灵异职业流的钩子有其独特逻辑：它必须同时激活两种矛盾情绪——**「我也想干这份工作」和「我绝对不敢干这份工作」**。代入感来自职业身份的真实性，恐惧来自职业义务的不可逃脱。

---

### 字段生成指南

#### 故事钩子

这一句话要完成三件事：点名职业处境、引入异常、暗示无法退出。

**优秀钩子的结构公式**：[具体职业场景] + [无法拒绝的义务] + [今晚上车的是什么]

参考方向：
- 「每晚十一点，我的公交准时出发。乘客没有票，我也不敢查票——因为有几个，已经死了十年」
- 「公司告诉我：这条线路薪水是别人的三倍。他们没告诉我为什么前三个司机都辞职了——准确说，两个辞职，一个失踪」
- 「按规定，我不能拒载任何乘客。但今晚坐在最后一排的那个，对着窗外笑，而窗外是高速路的护栏，距地面十米」

**避免的写法**：
- ❌ 太宏观：「黑暗降临」→ 没有职业代入点
- ❌ 太随意：「我发现车上有鬼」→ 缺乏职业压迫感
- ❌ 太游戏化：「系统提示：你已解锁鬼车司机职业」→ 破坏现实感（除非文风本就是系统流）

#### 职业钩子

识别让读者感到「我能理解这个处境」的职业元素。

**高代入感的职业元素**：
| 类别 | 代入点 |
|------|--------|
| 经济压力 | 月薪三倍、债务压身、找不到其他工作 |
| 职业义务 | 不能拒载、必须按班次、不能提前收班 |
| 职场规则 | 上级不解释、合同写死了、前任司机离职的理由含糊 |
| 孤立处境 | 深夜独自驾车、乘客不和司机交流、出了事没人知道 |

最有效的职业钩子是让读者在现实中也曾经历过类似的无力感：被工作困住、义务大于意愿、规则比人更强硬。

#### 恐惧核心

识别这个故事真正让人不安的是什么——不是鬼本身，是更深层的东西。

**灵异职业流常见恐惧核心**：
- **职业枷锁感**：不是怕鬼，是怕「不能拒载」这条规则——规则比鬼更可怕
- **载体恐惧**：密闭车厢，后视镜里的存在，门关上之后
- **失控危机**：乘客随时可能起冲突，司机是唯一的活人，没有援助
- **异常日常化**：最深的恐惧是「习惯了」——主角开始觉得这是正常工作，这才最可怕
- **身份困境**：活人夹在活与死之间，两边都不完全接受自己

生成时，识别这个具体故事背后是哪种核心，并确保后续设定强化它。

#### 读者期待

这是与读者的隐性合约——你承诺给他们什么样的体验？

**灵异职业流读者期待类型**：
- **升级爽感**：「我要看司机越来越强，装备越来越厉害」→ 进度系统要清晰，成长要有里程碑
- **危机求生**：「我要跟司机一起想办法应对今晚的乘客」→ 每班次要有具体挑战
- **荒诞共处**：「我要看司机跟鬼建立奇怪日常关系」→ 常客鬼魂要有立体性格
- **真相揭露**：「为什么会有这条线路，背后是什么」→ 主线谜题要设置得值得期待

**生成要求**：选定一个主要期待，避免同时承诺所有类型导致焦点模糊。

---

### 字段联动关系

- **故事钩子中的「职业义务」→ 契约规则的「基本守则」**：钩子里点名的那条规则应该在契约中有精确描述
- **恐惧核心 → 文风设定的「基调」**：职业枷锁感对应「职业恐惧」基调；荒诞共处对应「怪诞日常」
- **读者期待 → 公交系统设定的「升级体系」**：如果期待是升级爽感，升级系统要设计得清晰可见

---

### 常见错误

- ❌ 把「职业设定介绍」当成「故事钩子」——钩子是悬念，不是背景介绍
- ❌ 职业钩子使用过于特殊的处境（「我是全世界唯一的鬼车司机」），失去职业代入感
- ❌ 恐惧核心停留在「车上有鬼」的层面，没有挖掘到职业义务或人性困境
- ❌ 读者期待写成结局预告，破坏悬念',
  '"Story Hook" Setting Generation — Ghost Driver Paranormal Novel

The hook must activate two contradictory emotions: "I wish I had this job" and "I would never take this job." Immersion comes from the professional identity being relatable; horror comes from the inescapability of professional obligations.

**Hook formula**: [Specific professional scenario] + [Unavoidable obligation] + [What boarded the bus tonight]

Good examples:
- "Every night at 11pm, my bus departs on schedule. Passengers have no tickets, and I don''t dare check — because some of them have been dead for ten years."
- "The company told me this route pays triple. They didn''t mention why the previous three drivers quit — two quit, one disappeared."

**Core Fear types (deeper than the ghosts themselves)**:
- Professional bondage: the rule "cannot refuse passengers" is scarier than the passengers
- Confined vehicle: closed doors, rear-view mirror reflections, what''s in the last row
- Loss of control: passengers may fight, driver is the only living person, no backup
- Normalization horror: the protagonist starts treating this as a normal job — that''s the deepest fear
- Identity limbo: a living person caught between the living and the dead

**Reader expectation contract**: pick ONE primary promise — upgrade satisfaction (clear progression), crisis survival (per-shift challenges), absurd coexistence (ghost regulars with personality), or truth revelation (mystery behind the route).',
  (SELECT id FROM novel_creation_method WHERE name = '灵异司机职业流小说' LIMIT 1),
  1,
  10,
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
