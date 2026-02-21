-- 历史人物穿越小说「角色」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-hist-crossing-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hist-crossing-character-gen',
  '「角色」生成：为历史人物穿越小说生成角色，基于三源角色体系（历史人物/小说角色/原创角色），结合穿越设定和原著背景设计角色阵容',
  '"Character" generation: generate characters for historical figure crossing novels based on the three-origin character system (historical figure / novel character / original character)',
  '## 「角色」生成 — 历史人物穿越小说

历史人物穿越小说的角色设计核心是**三源角色体系**——角色来源于三个不同的维度：真实历史人物、原著小说角色、作者原创角色。每类角色有不同的设计规则和约束。

角色设计必须与已有设定紧密联动：穿越设定决定主角身份，原著背景约束历史角色选择，原著剧情规定命运走向，金手指影响角色能力格局。

---

### 字段生成指南

#### 姓名

- **历史人物**：使用历史真名，不可改动（如李世民、诸葛亮、曹操）
- **小说角色**：使用原著姓名（如林黛玉、宋江、孙悟空）
- **原创角色**：姓名必须符合故事所处历史时代的命名习惯
  - 参考「原著背景」中的历史时期确定时代
  - 姓氏多样化，不要全用「李」「王」「张」等大姓
  - 避免过于现代化的名字

#### 角色来源

三个选项，选择依据：

| 来源 | 适用场景 | 设计约束 |
|------|---------|---------|
| **历史人物** | 该角色在真实历史中确有其人 | 核心性格和重大经历须符合史料，细节可在史料空白处自由发挥 |
| **小说角色** | 该角色出自穿越目标所在的小说 | 须忠于原著基本设定，但可因主角的蝴蝶效应而改变命运 |
| **原创角色** | 为填补历史/原著空白而创造 | 自由度最高，但身份和行为须符合时代特征 |

联动规则：
- 主角通常是「历史人物」或「小说角色」（穿越到其身上）
- 与穿越目标直接相关的人物优先使用真实来源
- 需要自由发挥的叙事空间时使用原创角色

#### 角色定位

四个选项的设计要点：

| 定位 | 故事功能 | 典型数量 | 设计重点 |
|------|---------|---------|---------|
| **主角** | 穿越者，故事的核心视角 | 1 | 必须与穿越设定完全一致——身份、时间节点、核心目标 |
| **重要配角** | 盟友、导师、爱人、竞争者 | 2-4 | 各自有独立的目标和性格弧光，不是主角的附庸 |
| **反派** | 主角的核心对手 | 1-2 | 动机要合理且有深度——不是为了作恶而作恶 |
| **工具人** | 推动特定剧情的功能角色 | 1-2 | 虽然功能性强，但也需要有辨识度的特征 |

#### 性别

根据历史时代和角色身份合理选择。注意：
- 历史人物必须符合史实
- 原创角色要考虑时代的性别角色限制（如女性在某些朝代的参政限制）

#### 身份地位

必须与「原著背景」中的社会制度和政治格局一致：
- 参考「原著背景」的「政治格局」确定权力结构
- 参考「社会制度」确定阶层体系
- 主角的身份地位由「穿越设定」中的穿越角色决定
- 其他角色的身份要形成合理的权力关系网

示例（以唐朝为背景）：太子、秦王、丞相、将军、世家嫡女、寒门士子

#### 性格特征

- **历史人物**：核心性格参考史料记载，可在不矛盾的前提下补充细节
  - 例如李世民：史载果断英武、善用人才 → 可补充"内心对兄弟相残的愧疚"
- **小说角色**：忠于原著的性格核心，可因穿越者影响而产生微妙变化
- **原创角色**：性格要鲜明且与角色定位匹配
  - 避免"完美无缺"的角色——每个角色都需要性格弱点
  - 性格要有内在张力（如"忠诚但野心勃勃"、"聪慧但优柔寡断"）

#### 历史原型

- **历史人物**：通常不需要填写（本身就是历史人物）
- **小说角色**：如原著角色有明确的历史原型，在此注明（如小说中的虚构将军原型是历史上的某人）
- **原创角色**：如创作时参考了某个历史人物的特质，在此标注有助于保持角色一致性

#### 与主角关系

根据故事设定推导关系，常见类型：
- **政治关系**：盟友、敌对、上下级、同僚竞争
- **血缘关系**：兄弟、父子、夫妻
- **情感关系**：知己、爱慕、仇敌
- **利益关系**：互利共生、利用与被利用

关系设计原则：
- 不同角色与主角的关系应有差异化
- 关系应随剧情发展有变化的可能（如敌转友、友转敌）
- 参考「原著剧情」中的人际关系线索

#### 命运走向

这是历史穿越角色的独特字段，包含两个维度：

1. **原命运**：该角色在原著/历史中的命运走向（如"被赐死"、"战败身亡"、"位极人臣"）
2. **改变后的命运**：主角介入后可能的命运变化

设计要点：
- 主角的核心目标（来自「穿越设定」的「核心目标」）直接影响相关角色的命运
- 不是所有角色的命运都会被改变——一些角色的命运是"不可改变"的锚点
- 命运走向要与「历史事件时间线」中的关键事件呼应

---

### 角色阵容建议

批量初始化时，推荐以下配置：

**第一优先级（必须创建）**：
1. **主角**：穿越者。身份和属性完全由穿越设定决定
2. **核心盟友**：主角最重要的支持者。可以是历史人物（如忠臣良将）或原创角色

**第二优先级（强烈建议）**：
3. **核心反派**：主角最大的对手。优先选择历史/原著中与穿越角色对立的人物
4. **情感角色**：爱人、知己或亲人。为故事提供情感维度

**第三优先级（可选）**：
5. **导师/智囊**：帮助主角理解时代规则的角色
6. **工具人**：推动开篇剧情的功能角色

---

### 与已有设定的联动

| 设定模块 | 对角色的影响 |
|---------|------------|
| **穿越设定** | 穿越角色→主角姓名和身份；穿越者身份→主角的现代知识背景；核心目标→主角的行动方向 |
| **原著背景** | 历史时期→命名规范和身份地位范围；政治格局→角色之间的权力关系；社会制度→阶层约束 |
| **原著剧情** | 关键剧情→角色在关键事件中的角色；原著结局→角色的原命运 |
| **历史事件时间线** | 关键事件→角色的参与方式；可否改变→命运是否可被主角影响 |
| **金手指** | 金手指类型→主角的能力定位，影响主角与其他角色的实力对比 |
| **故事钩子** | 穿越目标→确认主角身份；核心卖点→角色设计要服务于核心卖点 |

---

### 常见错误

1. **历史细节错误**：给历史人物起错名字、用错官职、搞错人际关系。创建历史人物前务必参考原著背景设定
2. **所有角色沦为工具人**：角色只是为主角服务的棋子，缺乏独立意志和内在驱动
3. **角色来源不合理**：把不可能出现在同一时空的历史人物放在一起
4. **命运走向过于模糊**：只写"命运会改变"而不具体说明如何改变
5. **忽视设定联动**：角色属性与穿越设定、原著背景矛盾（如在唐朝背景下出现明朝的官职体系）
6. **角色定位重复**：多个角色承担相同的故事功能，导致角色臃肿
7. **反派脸谱化**：反派没有合理的动机，只是为了制造冲突而存在',
  '## "Character" Generation — Historical Figure Crossing Novel

The core of character design in historical figure crossing novels is the **three-origin character system** — characters originate from three dimensions: real historical figures, novel characters from the source material, and author-created original characters. Each type has different design rules and constraints.

Character design must tightly interlink with existing settings: crossing setup determines the protagonist''s identity, source material background constrains historical character selection, source material plot dictates fate trajectories, and cheat ability influences the power dynamic.

---

### Field Generation Guide

#### Name (姓名)

- **Historical figures**: Use real historical names, no alterations (e.g., Li Shimin, Zhuge Liang, Cao Cao)
- **Novel characters**: Use original names from the source (e.g., Lin Daiyu, Song Jiang, Sun Wukong)
- **Original characters**: Names must follow the naming conventions of the story''s historical era
  - Reference the historical period in "Source Material Background" to determine the era
  - Diversify surnames — don''t use only common surnames like Li, Wang, Zhang
  - Avoid overly modern-sounding names

#### Character Origin (角色来源)

Three options with selection criteria:

| Origin | Use Case | Design Constraints |
|--------|----------|-------------------|
| **Historical Figure** | The character is a real person in history | Core personality and major experiences must align with historical records; details can be freely crafted where records are silent |
| **Novel Character** | The character is from the source novel of the crossing target | Must be faithful to the original characterization, but fate can change due to the protagonist''s butterfly effects |
| **Original Character** | Created to fill gaps in history/source material | Highest freedom, but identity and behavior must fit the era |

Linkage rules:
- The protagonist is usually a "Historical Figure" or "Novel Character" (crossed into their body)
- Characters directly related to the crossing target should prefer authentic origins
- Use original characters when narrative flexibility is needed

#### Role (角色定位)

Design focus for each of the four options:

| Role | Story Function | Typical Count | Design Focus |
|------|---------------|--------------|-------------|
| **Protagonist** (主角) | The transmigrator, story''s core perspective | 1 | Must perfectly match crossing setup — identity, time point, core goal |
| **Important Supporting** (重要配角) | Allies, mentors, love interests, rivals | 2-4 | Each should have independent goals and character arcs, not mere appendages of the protagonist |
| **Antagonist** (反派) | The protagonist''s core opponent | 1-2 | Motivation must be reasonable and deep — not evil for evil''s sake |
| **Functional** (工具人) | Characters driving specific plot points | 1-2 | Despite being functional, still need distinctive traits |

#### Gender (性别)

Choose reasonably based on historical era and character identity. Note:
- Historical figures must match historical records
- Original characters should consider era-specific gender role constraints

#### Status (身份地位)

Must align with social systems and political landscape in "Source Material Background":
- Reference "Political Landscape" for power structures
- Reference "Social System" for class hierarchy
- Protagonist''s status is determined by the crossing character in "Crossing Setup"
- Other characters'' statuses should form a reasonable power relationship network

#### Personality (性格特征)

- **Historical figures**: Core personality references historical records; supplement details where records are silent
- **Novel characters**: Stay faithful to the original personality core; subtle changes may occur due to protagonist influence
- **Original characters**: Personality must be vivid and match the role
  - Avoid "perfect" characters — every character needs personality flaws
  - Personality should have internal tension (e.g., "loyal yet ambitious," "brilliant yet indecisive")

#### Historical Prototype (历史原型)

- **Historical figures**: Usually not needed (they are the historical figure)
- **Novel characters**: If the original character has a clear historical prototype, note it here
- **Original characters**: If designed referencing a historical figure''s traits, annotate for consistency

#### Relationship with Protagonist (与主角关系)

Infer relationships from story settings. Common types:
- **Political**: Ally, opponent, superior/subordinate, collegial rival
- **Kinship**: Siblings, parent/child, spouses
- **Emotional**: Confidant, admirer, sworn enemy
- **Interest-based**: Mutual benefit, using/being used

Design principles:
- Different characters should have varied relationships with the protagonist
- Relationships should have potential for change as the plot develops
- Reference interpersonal relationship clues from "Source Material Plot"

#### Fate Trajectory (命运走向)

This is a unique field for historical crossing characters, containing two dimensions:

1. **Original fate**: The character''s fate in the original source/history
2. **Changed fate**: Possible fate changes after protagonist intervention

Design focus:
- The protagonist''s core goal (from "Crossing Setup") directly affects related characters'' fates
- Not all characters'' fates will be changed — some are "unchangeable" anchor points
- Fate trajectories should echo key events in the "Historical Event Timeline"

---

### Character Lineup Recommendations

For batch initialization, recommended configuration:

**First priority (must create)**:
1. **Protagonist**: The transmigrator. Identity and attributes entirely determined by crossing setup
2. **Core ally**: The protagonist''s most important supporter. Can be a historical figure or original character

**Second priority (strongly recommended)**:
3. **Core antagonist**: The protagonist''s biggest opponent. Prefer historical/source figures who opposed the crossing character
4. **Emotional character**: Love interest, confidant, or family member. Provides emotional dimension

**Third priority (optional)**:
5. **Mentor/advisor**: Helps protagonist understand era rules
6. **Functional character**: Drives opening plot events

---

### Setting Linkage

| Setting Module | Impact on Characters |
|---------------|---------------------|
| **Crossing Setup** | Crossing character → protagonist name and identity; Crosser identity → protagonist''s modern knowledge; Core goal → protagonist''s action direction |
| **Source Material Background** | Historical period → naming conventions and status range; Political landscape → power relationships; Social system → class constraints |
| **Source Material Plot** | Key plot points → character roles in key events; Original ending → character''s original fate |
| **Historical Event Timeline** | Key events → character participation; Changeability → whether fate can be influenced by protagonist |
| **Cheat Ability** | Cheat type → protagonist ability positioning, affects power balance between protagonist and others |
| **Story Hook** | Crossing target → confirm protagonist identity; Core selling point → character design should serve the core selling point |

---

### Common Errors

1. **Historical detail errors**: Wrong names, incorrect official titles, wrong interpersonal relationships for historical figures. Always reference source material settings before creating historical characters
2. **All characters reduced to tools**: Characters merely serve as the protagonist''s chess pieces, lacking independent will and internal drive
3. **Unreasonable character origins**: Placing historically impossible co-existing figures together
4. **Vague fate trajectories**: Writing only "fate will change" without specifying how
5. **Ignoring setting linkage**: Character attributes contradicting crossing setup or source material background
6. **Duplicate role positioning**: Multiple characters serving the same story function, causing character bloat
7. **Stereotypical antagonists**: Antagonists without reasonable motivation, existing only to create conflict',
  (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1),
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
