-- 灵异司机职业流小说 - 「世界观」设定生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ghost-driver-worldview-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ghost-driver-worldview-setting-gen',
  '「世界观」设定生成：为灵异司机职业流小说构建有内在逻辑的现代阴阳共存世界体系',
  '"Worldview" setting generation: build an internally logical modern yin-yang coexistence world system for ghost bus novels',
  '## 「世界观」设定生成 — 灵异司机职业流小说

世界观是整个故事的隐形基础设施。灵异职业流最容易犯的错误是把世界观做成「鬼片设定」——只说有鬼、有阴间，但不解释这个世界怎么运作。好的世界观应该像现实世界的扩展版：大多数规则和现代都市一样，只是在特定条件下、特定地点、特定时间，「另一套规则」会叠加进来。

---

### 字段生成指南

#### 现代背景

**现代城市与灵异元素结合的写法**：

| 结合方式 | 效果 | 示例 |
|---------|------|------|
| 隐藏式（大多数人不知道） | 孤独感强，职业代入感高 | 公交司机独自知道，同事以为他在开普通班次 |
| 半公开式（相关从业者知道） | 建立职业群体感 | 有一个地下网络，特殊职业者（司机/殡仪馆工/急救员）之间互通消息 |
| 公开式（社会有某种机制） | 世界观更宏大，但减少孤立感 | 政府有专门机构管理，但普通人不主动接触 |

**推荐**：隐藏式或半公开式，保留职业孤立感，强化「只有你知道今晚发生了什么」的代入感。

**城市选择对叙事的影响**：
- 历史悠久的老城区：更多「年代久远的存在」，建筑和线路本身携带历史
- 现代新区/开发区：「不该在这里的存在」的错位感更强
- 混合型（老城+新区共存）：线路穿越两种区域，自然产生张力

#### 阴阳规则

**规则系统的设计原则**：规则不是作者为了方便情节设计的，规则应该有内在逻辑，甚至有规则起源的暗示（为什么是这些规则？）。

**四个必须回答的核心问题**：

1. **阴阳如何分隔**：
   - 时间分隔（夜间/特定时辰切换）
   - 空间分隔（特定场所有「阴界入口」）
   - 感知分隔（阴间存在一直在，但活人「看不见」）

2. **活人在阴间规则中的位置**：
   - 活人进入阴间规则会怎样？（只是被纳入规则 / 会有额外风险 / 需要特定资质才能承受）
   - 活人与阴间存在互动的代价是什么？（气运消耗 / 寿命/健康代价 / 特殊保护才能规避）

3. **信息流通规则**：
   - 阴间存在知道活人的情况吗？（知道但不在意 / 知道且有规矩不干涉 / 各自有利益考量）
   - 活人能主动获取阴间信息吗？（正常情况无法 / 需要媒介 / 主角职业本身是一种媒介）

4. **「规则的执行者」是谁**：
   - 是冥府官僚体系在执行
   - 是自然秩序（没有主体，规则就是规则）
   - 是某个古老存在在维持

**实用原则**：不需要在设定里回答所有问题，但自己要知道答案，这样遇到情节需要时能保持一致。

#### 鬼怪体系

**体系设计的两个维度**：

**纵向（危险等级）**：
```
普通留魂（刚死，意识混乱，危险性低）
→ 执念鬼（目的清晰，情绪化，中等危险）
→ 怨鬼/厉鬼（愤怒/仇恨驱动，行动性强，高危）
→ 年代久远的存在（超过X年，已不像人，规则与普通鬼不同）
→ 非人存在（本质上从未是人，遵循完全不同的规则）
```

**横向（来源/性质）**：
- 人类亡魂类：死因、留魂原因决定行为模式
- 自然演化类（精怪）：与人类历史/地理有联结
- 冥府体制内类（信差/官差）：有任务，讲规矩，但权力大
- 超出分类的古老存在：不适用正常的「鬼规则」

**对司机职业的实用建议**：
- 给乘客的危险等级写一套「司机实用判断标准」，而不是学术分类
- 标准应该是司机能观察到的外显特征（上车方式/坐姿/对窗外的反应）而非内在本质

#### 冥府机构

**机构设计的叙事功能**：冥府机构不是背景板——它是主角的「甲方」、是规则的来源、是威胁的来源，也是主角有时能利用的资源。

**设计要点**：
- **不要太早揭示机构全貌**：初期只让主角（和读者）看到直接相关的部分
- **机构内部要有矛盾**：不同部门之间的职权摩擦、规则冲突，能为故事提供空间
- **机构对主角的态度**：是工具（最低关注）、是例外（被特别注意）、还是麻烦（需要被管理）

**常见机构类型与叙事意涵**：
- 官僚体系（部门/司/局）：规则繁复，效率低，但有漏洞可钻
- 类公司结构（雇主/中间商/总部）：更像现代劳动关系，增强职业代入感
- 模糊结构（「上面」「规定」，没有具体机构）：张力更高，但后期发展受限

#### 普通人知情程度

这是一个 enum 字段，生成时选择一个并说明对故事节奏的影响：

| 选项 | 含义 | 叙事影响 |
|------|------|---------|
| 完全不知情 | 普通人对阴阳世界毫无概念 | 主角孤立无援，但日常部分真实感强 |
| 有民间传说 | 有些规矩/禁忌，人们知道但当迷信 | 主角能利用民间传说作线索 |
| 特定从业者知情 | 少数人（殡仪馆/急救/司机）知道 | 形成地下网络，主角能找到同伴 |
| 官方知情但封锁 | 有机构在管，普通人被隐瞒 | 主角可能面临机构压力 |

---

### 字段联动关系

- **阴阳规则中「活人代价」→ 文风设定的「基调」**：代价越重，基调越沉郁；代价可管理，基调可以更轻松
- **鬼怪体系 → 角色设计（危险等级）**：体系中的分类直接对应角色模块的危险等级字段
- **冥府机构 → 契约规则的「雇主」**：机构类型决定雇主的行事风格和主角的权力位置
- **普通人知情程度 → 故事钩子的「职业钩子」**：知情程度低则孤立感更强，知情程度高则有更多社会性矛盾可写

---

### 常见错误

- ❌ 阴阳规则自相矛盾（前期说活人看不见鬼，后期随便设定某人能看见）
- ❌ 鬼怪体系过于复杂，给每种类型写了五个属性，但实际故事里只用到两种
- ❌ 冥府机构太具体太宏大，读者对「整个冥府体系」的描述比对主角的处境更感兴趣
- ❌ 普通人知情程度在不同章节里飘移（前期完全不知，后期随意让路人识别鬼魂）',
  '"Worldview" Setting Generation — Ghost Driver Paranormal Novel

The worldview is the invisible infrastructure. The core error is treating it like a ghost movie — just saying "there are ghosts and an underworld" without explaining how this world operates.

**Modern backdrop**: Hidden (only the driver knows) vs. semi-public (underground network of special-job workers) vs. institutional (government manages it). Recommend hidden or semi-public for professional isolation effect.

**Four Yin-Yang rules to define**:
1. How yin and yang are separated (time, space, or perception-based)
2. Living person''s position in yin-world rules (exposure cost, protection requirements)
3. Information flow (can the dead observe the living? can the living access underworld information?)
4. Who enforces the rules (underworld bureaucracy, natural order, ancient entity)

**Ghost classification (two dimensions)**:
- Vertical (danger level): fresh soul → obsession ghost → vengeful spirit → ancient entity → non-human existence
- Horizontal (origin): human remnant, nature spirit, official underworld agents, uncategorized ancient beings

**Underworld institution design**: Don''t reveal too early. Internal friction between departments creates story space. Consider the institution''s attitude toward the protagonist: tool (low attention), exception (specially monitored), or problem (needs management).

**Civilian awareness level** (enum): completely unaware / folk legends only / specific workers know / officially managed but suppressed.',
  (SELECT id FROM novel_creation_method WHERE name = '灵异司机职业流小说' LIMIT 1),
  1,
  13,
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
