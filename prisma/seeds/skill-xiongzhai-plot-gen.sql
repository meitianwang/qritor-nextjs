-- 凶宅灵异租房「情节设计」领域知识技能（Layer 3）
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-xiongzhai-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiongzhai-plot-gen',
  '「情节设计」领域知识：为凶宅灵异租房小说提供剧情设计指导，涵盖典型故事结构、恐惧升级节奏、调查推进策略与结局设计',
  '"Plot Design" domain knowledge: plot design guidance for haunted rental horror, covering story structure, fear escalation pacing, investigation progression, and ending design',
  '## 「情节设计」领域知识 — 凶宅灵异租房小说创作

凶宅灵异租房的情节设计有一个核心结构张力：**恐惧升级**与**真相调查**是两条并行的驱动力，它们需要互相配合——恐惧升级驱动读者的情绪投入，真相调查驱动读者的智识参与。设计失败通常表现为两种：只有恐惧升级（故事变成"一直出事"，缺乏意义）；或者只有调查（故事变成悬疑推理，失去恐惧密度）。

---

### 典型故事结构

| 阶段 | 章节比例 | 核心任务 | 主导事件类型 |
|------|---------|---------|------------|
| **入住期** | 10-15% | 建立主角在这间房的日常感；植入第一个"可疑但可解释"的细节 | 租房谈判；第一次入住；房间探索；邻居/房东的初次接触 |
| **发现期** | 20-25% | 主角开始意识到"这间房有问题"；第一条调查线开始 | 恐惧现象升级（从轻微到中等）；主角第一次主动调查；第一次和外部联系人说起这件事被不信任 |
| **困境期** | 25-30% | 主角陷入"想跑但跑不了"的处境；调查有推进但也有反转 | 恐惧高峰事件；关键线索发现；某个之前信任的人（邻居/房东）行为变得可疑；主角第一次尝试离开并失败 |
| **危机期** | 15-20% | 最高强度的恐惧事件；真相的关键部分揭露 | 凶宅秘密的核心揭示；厉鬼意图明确化；主角面临明确的存活威胁 |
| **结局期** | 10-15% | 故事的解决方式（不一定是好的解决） | 主角的最终选择；厉鬼的命运；凶宅的结局 |

**凶宅流节奏注意事项**：
- 入住期不能太快进入高强度恐惧——日常感是恐惧的底色
- 每个阶段结束时要有一个情节钩子（一个未解决的悬念），让读者无法在那里停下

---

### 恐惧升级的节奏设计

凶宅流最常见的节奏错误是**过早推到最高强度，后续无法升级**。恐惧应该像水一样缓慢上涨，而不是从低潮直接跳到最高点。

**恐惧强度五阶梯**：

| 强度等级 | 恐惧特征 | 典型事件 | 适合阶段 |
|---------|---------|---------|---------|
| 1 级（不适感） | 轻微的"这间房感觉不对"，可以用日常理由解释 | 气味异常、声音奇怪但有理由、某件家具位置轻微偏移 | 入住期 |
| 2 级（疑虑） | 主角开始怀疑，但还没有确认超自然 | 镜子上的手印、电视自动开启、邻居奇怪的反应 | 发现期前半 |
| 3 级（确认） | 主角无法继续用理性解释发生的事情 | 被直接接触（被碰到）、看到无法解释的影子/形状 | 发现期后半 |
| 4 级（直面） | 主角直接面对厉鬼的存在，无法回避 | 完整的显形、主角被追、某个空间无法离开 | 困境期 |
| 5 级（生死边缘） | 主角的存活面临直接威胁 | 最高烈度的对抗，或发现真相带来的最大冲击 | 危机期 |

**升级原则**：
- 每次升级后，要有一段"相对平静"（喘息节点）
- 喘息节点不是"什么都没发生"，而是"发生的事情恐惧等级较低，但主角在思考和处理"
- 每次"以为安全了"之后的下一次升级，要比上一次更高

---

### 调查推进策略

调查是凶宅流的信息驱动力——读者和主角一起拼凑真相：

**调查线索的三层设计**：
```
表面层（前1/3发现）：
  - 凶宅的公开信息（网络搜索、邻居口述）
  - 主角对这间房的直接观察（遗留物、痕迹）
  - 这些线索指向的是"已知的死亡事件"

调查层（中1/3发现）：
  - 通过翻遍房间找到的私人遗留物（日记、照片、信件）
  - 通过不断和邻居/房东接触逼出的更具体信息
  - 这些线索开始指向"死亡事件背后的真相"

核心层（后1/3揭示）：
  - 厉鬼的死亡真相完整呈现
  - 凶宅秘密与主角自身的联结
  - 真正的幕后（房东的角色、前任租客的完整故事）
```

**调查节奏的常见陷阱**：
- 信息给得太快：前三章把调查主线全部揭露，剩下的只是等待恐惧
- 信息给得太慢：中段推进停滞，恐惧升级了但调查没有动——读者只有情绪没有思考
- 正确节奏：每次恐惧升级后，总有一个新的信息碎片让主角（和读者）更接近真相

---

### 伏笔策略

| 伏笔类型 | 如何植入 | 何时收回 |
|---------|---------|---------|
| **第一印象细节** | 入住期主角看到某个"奇怪但可以解释"的细节，主角忽视了 | 危机期，这个细节的真实含义揭露 |
| **遗留物线索** | 发现期，主角找到前任租客的某件物品，暂时不知道意义 | 调查推进时，这件物品成为关键线索 |
| **邻居的奇怪反应** | 入住期，邻居说了某句奇怪的话或做了某个奇怪的动作 | 困境期或危机期，主角意识到邻居当时知道的 |
| **厉鬼的习惯行为** | 发现期，厉鬼的某个"习惯"被主角注意到但没有理解 | 危机期，主角利用这个习惯 |
| **主角自身的秘密** | 如果主角被选中是有原因的，早期植入主角背景的某个细节 | 核心层揭示时，这个背景成为联结 |

---

### 结局设计的几种模式

凶宅流的结局比普通恐怖故事更复杂——因为它同时需要解决**恐惧线**和**真相线**：

| 结局模式 | 核心逻辑 | 读者情感 | 适合的厉鬼类型 |
|---------|---------|---------|-------------|
| **平息/和解型** | 真相揭露→执念满足→厉鬼离开→主角活着离开 | 悲悯 + 释然 | 冤死怨灵、执念困守型 |
| **逃生型** | 主角找到逃脱方法，凶宅的秘密未必完全揭露 | 紧张的释放 | 恶意厉鬼、规则流 |
| **代价型** | 主角活下来，但付出了某种代价（记忆、某种能力、某段关系） | 沉重 + 余悸 | 任何类型 |
| **开放型** | 故事结束了，但凶宅的问题没有彻底解决，读者知道下一个租客会面对同样的处境 | 细思极恐 | 多重残留、非人存在型 |
| **主角命运未知型** | 叙事突然中断或主角发现自己已经成为凶宅的一部分 | 最深层的存在主义恐惧 | 非人存在型 |

**结局设计原则**：
- 结局要回答"真相到底是什么"（哪怕是通过不完整的揭示）
- 结局要回答"主角有没有活下来"（哪怕答案模糊）
- 结局不能是"全部都是梦"——这是最大的叙事违约

---

### 常见错误

1. **恐惧升级没有节奏**：从入住第一天就开始高强度，读者第五章就产生情感麻木
2. **调查停滞不前**：故事中段恐惧在升级，但真相调查毫无推进——读者的智识投入消失
3. **主角"离开尝试"不可信**：说主角"想跑但跑不了"，但没有具体的、可信的阻止理由
4. **伏笔无法收回**：前期设计了大量悬念，后期一一解答——解答质量低于悬念质量
5. **结局太廉价**："道士来了，念了咒语，厉鬼走了"——厉鬼的问题用外部工具解决，主角的主动性消失
6. **没有情感弧线**：故事结束时，主角没有发生任何内在变化——在这间房里经历了这一切，他/她变成了什么样的人？',
  '"Plot Design" domain knowledge for haunted rental horror. Two parallel drivers: fear escalation (emotional investment) + investigation (intellectual participation). Five-stage structure: settlement → discovery → entrapment → crisis → resolution. Fear intensity five-level ladder: discomfort → doubt → confirmation → direct confrontation → survival threat. Key rhythm rule: after each escalation, a relative calm period before the next (higher) escalation. Three-layer investigation design: surface (public information, direct observation) → investigation (personal relics, forced disclosures) → core (complete truth, protagonist connection). Foreshadow types: first-impression details, relic clues, neighbor''s strange reactions, ghost habit patterns, protagonist''s own secret. Ending modes: resolution/reconciliation, escape, cost-bearing, open-ended, fate-unknown. Critical error: escalating fear without advancing investigation causes reader''s intellectual disengagement.',
  (SELECT id FROM novel_creation_method WHERE name = '凶宅灵异租房' LIMIT 1),
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
