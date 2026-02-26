-- 灵异司机职业流小说 - 角色生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ghost-driver-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ghost-driver-character-gen',
  '角色生成：为灵异司机职业流小说设计兼具职业代入感与灵异张力的多类型角色体系',
  'Character generation: design a multi-type character system balancing professional immersion and paranormal tension for ghost bus novels',
  '## 角色生成 — 灵异司机职业流小说

灵异职业流小说的角色体系有一个特殊性：**主角和其他所有人（无论活人还是鬼魂）之间始终存在职业隔离**。主角是「服务提供者」，乘客是「服务对象」，这种权力不对称和边界感是所有角色关系的底层逻辑。

---

### 角色体系概览

这类小说的角色按功能分为四个群组：

| 群组 | 代表角色 | 叙事功能 |
|------|---------|---------|
| 核心司机 | 主角 | 职业代入点，成长弧线的承载者 |
| 常客乘客 | 执念鬼/常驻灵魂 | 关系积累，副线故事来源 |
| 一次性乘客 | 每班次特殊存在 | 单集威胁，展示世界观规则 |
| 陆上关系 | 白天世界的人 | 对比/锚点，现实维度的代价 |

---

### 字段生成指南

#### 姓名

**命名原则**：

**主角**：
- 普通的两字或三字中文名（不要过于特殊）
- 普通中国姓氏（王/李/张/刘等），暗示「普通人误入此职」
- 可以有小名/外号，但正式场合（合同/记录）用全名

**亡魂乘客**：
- 生前用过的名字，不一定要说出来（可以只知道「第三排的那位」）
- 刚死的亡魂可能会自报姓名（因为还不适应），久远的存在可能没有名字
- 年代久远的存在可能是「姓氏+称谓」（如「老周」「赵大娘」）而非完整名

**非人类存在**：
- 不要给非人类强行命名，用描述性绰号更有力（「后排那位」「断手的」「每周二都来的」）
- 冥府官差可以有官职式称谓（「张检查」「王信差」）

#### 角色类型

这是一个 enum 字段，生成时选择一个类型，并确保其他字段与类型保持一致：

- **主角司机**：故事中心，主要成长角色
- **新亡之魂**：刚去世，行为接近活人，通常是单次乘客
- **执念鬼**：有未了事，固定目的，可成为常客
- **厉鬼/怨灵**：仇恨/愤怒驱动，高危，通常是危机来源
- **冥府官差**：冥府体制内存在，讲规矩，权力比主角大
- **非人存在**：妖怪/古老实体，遵循完全不同的规则
- **活人**：白天世界的人（同事/房东/家人），不知道主角工作内容

#### 生死状态

- **在世**：活人，受活人规则限制，也受活人的脆弱性限制
- **新亡**（不超过一年）：行为接近活人，但可能不知道自己死了
- **执念留魂**：有意识，有目的，但被执念锁定
- **已渡**：已经离开阳间，出现在故事中通常是例外情况
- **本质非人**：从未是人类

#### 外形特征

**生成要点**：
- **亡魂类**：保留死亡时刻的外形（死亡伤痕/着装），是识别线索
- **重点是「异常细节」而非全貌描述**：「她坐着，但我在后视镜里看不见她的倒影」比「她很苍白，头发凌乱」更有力
- **冥府官差**：可能穿着奇怪的「制服」，或者穿得极为普通但有某个细节不对
- **非人类**：避免过度描述，模糊感更恐怖（「我只确定那里坐着什么，但我不确定那是什么形状」）

#### 性格特质

**性格与角色类型的对应关系**：

| 类型 | 推荐性格基调 |
|------|------------|
| 新亡之魂 | 困惑/恐惧/过度配合（因为还以为在坐普通公交） |
| 执念鬼 | 目的导向，对不相关的事漠不关心；遇到执念相关的事高度敏感 |
| 厉鬼/怨灵 | 愤怒是底色，但愤怒可能有具体指向（不是随机暴力） |
| 冥府官差 | 职业化，效率优先，对「规则范围内」的事物态度明确 |
| 非人类 | 不以人类逻辑推测——可以是好奇的、漠然的、按照完全不同的逻辑行事的 |
| 活人 | 正常人，让主角记得自己的「另一面」 |

#### 危险等级

这是司机视角的实用判断，不是客观等级标注：

- **低**：上车方式正常，行为可预测，无攻击迹象
- **中**：目的不明或情绪不稳，需要注意但不构成即时威胁
- **高**：明显敌意或行为越轨，当班需要重点应对
- **极高**：超出现有装备/经验的处理能力，完成班次的唯一目标
- **未知**：最危险的评级——无法用已知框架判断

#### 上车原因

这是角色行为逻辑的来源，要具体到可以推动故事的程度：

- 新亡之魂：习惯性（生前每天坐这路车上班）
- 执念鬼：目的地在这条线路上（要回家 / 要见某人 / 要看某个地方最后一眼）
- 厉鬼：找某人 / 找某物 / 找「去解决问题的路」
- 冥府官差：公务（核查这条线路/传达某项通知/追索某个目标）
- 非人类：顺路（最恐怖的答案——它对这辆车没有特别原因）

#### 与司机的关系

- **陌生/单次**：仅这班次有交集
- **常客**：固定出现，有建立的互动模式
- **甲方/管理方**：对主角有契约性权力
- **情报来源**：会提供信息，但信息的代价和可信度存疑
- **潜在威胁**：关系表面正常，但主角有隐约的不安全感
- **依赖/被保护**：主角对这个角色有一定责任感

#### 已知信息（isDynamic）

记录当前已知的、与这个角色相关的关键信息，随故事发展更新：
- 来源（怎么知道的）
- 可信度（谁提供的信息）
- 还不知道的关键问题

#### 当前状态（isDynamic）

该角色在故事当前时间点的状态，包括：
- 是否还活跃于这条线路
- 与主角的最新互动结果
- 未解决的事项

---

### 生成原则

**1. 乘客角色聚焦在「上车原因」**：一个角色最重要的设定不是她死于什么、有什么能力，而是她**为什么坐上了这辆车**，这个答案决定了司机如何跟她互动。

**2. 避免「一次性功能角色」**：即使是单次乘客，也应该有让读者记得住的一个细节（一个习惯、一句台词、一个不寻常的行为）。

**3. 常客需要「发展曲线」**：如果一个鬼魂固定出现，它和主角的关系应该随时间演变，不要停在第一次见面的状态。

**4. 主角的成长通过乘客映照**：每一类乘客都可以是主角某种内在状态的镜像——执念鬼的「放不下」可以映照主角对白天生活的执念，怨灵的「仇恨」可以映照主角内心压抑的情绪。',
  'Character Generation — Ghost Driver Paranormal Novel

The structural core: professional separation between protagonist (service provider) and all others (service recipients) — living or dead. All character relationships are built on this power asymmetry.

**Four character groups**:
1. Core driver (protagonist) — professional immersion anchor, growth arc carrier
2. Regular passengers (obsession ghosts/recurring spirits) — relationship accumulation, subplot sources
3. One-time passengers (per-shift threats) — worldbuilding, rule demonstrations
4. Surface-world contacts (daytime humans) — contrast anchors, real-world cost representation

**Character type enum**: protagonist driver / newly deceased / obsession ghost / vengeful spirit / underworld official / non-human entity / living person

**Design principles**:
- Focus on "reason for boarding" over supernatural abilities — this determines all driver-passenger interaction
- Even one-time passengers need one memorable detail
- Regular passengers must have an evolution arc over multiple appearances
- Each passenger type can mirror the protagonist''s internal states

**Danger level (driver''s practical judgment)**: low / medium / high / extreme / unknown (most dangerous — cannot be assessed by known frameworks)

**Appearance tip**: Don''t describe full appearance. Focus on specific anomalous detail: "I can''t see her reflection in the rear-view mirror" beats "she was pale with tangled hair."',
  (SELECT id FROM novel_creation_method WHERE name = '灵异司机职业流小说' LIMIT 1),
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
