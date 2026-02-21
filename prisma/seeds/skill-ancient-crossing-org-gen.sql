-- 古代架空穿越小说「势力」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ancient-crossing-org-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ancient-crossing-org-gen',
  '「势力」生成：为古代架空穿越小说生成势力组织，涵盖皇室宗亲、世家门阀、外戚势力、朝廷派系等七大类型，强调权力博弈与势力制衡',
  '"Faction" generation: generate factions for ancient dynasty crossover novels, covering seven types (imperial clan, noble houses, consort clans, court factions, etc.) with emphasis on power games and faction balance',
  '## 「势力」生成 — 古代架空穿越小说

古代架空穿越小说的势力设计核心是**权力博弈 × 利益纠葛 × 阶层分化**。每个势力不是孤立存在的，而是处于一张错综复杂的关系网中——皇权与世家的角力、外戚与朝臣的博弈、地方与中央的张力。

穿越者闯入这张关系网，必然打破原有平衡。好的势力设计能让穿越者面临选择（投靠哪方）、制造冲突（多方势力的利益碰撞）、推动剧情（势力此消彼长的动态变化）。

---

### 字段生成指南

#### 势力名称

- 符合古代命名规范，体现身份和地位
- 皇室宗亲：以封号、国号命名（「靖王府」「楚王一脉」）
- 世家门阀：以姓氏或郡望命名（「陈郡谢氏」「清河崔氏」「琅琊王氏」）
- 朝廷派系：以核心人物或政治主张命名（「太子党」「改革派」「主战派」）
- 地方豪强：以地名或家族命名（「江南沈家」「关中李氏」）
- 禁止现代感的命名（「第一集团」「联合会」）

#### 势力类型

七个选项的权力定位：

| 类型 | 权力来源 | 核心优势 | 典型弱点 |
|------|---------|---------|---------|
| **皇室宗亲** | 血统、宗法 | 天然的权力合法性 | 内部争嫡、宗法约束 |
| **世家门阀** | 累世经营、文化垄断 | 人才储备、社会声望 | 因循守旧、内部腐化 |
| **外戚势力** | 后宫关系 | 皇帝信任、后宫支持 | 依赖后宫、根基不稳 |
| **朝廷派系** | 政治理念、官僚网络 | 行政资源、政策影响 | 派系内斗、理念分歧 |
| **地方豪强** | 土地、武力 | 地方实控、军事力量 | 远离权力中心、朝廷猜忌 |
| **江湖门派** | 武力、江湖声望 | 武力值高、信息灵通 | 不受朝廷认可、内部松散 |
| **商业势力** | 财富 | 资金充裕、人脉广泛 | 社会地位低（士农工商）、依赖权力庇护 |

选择类型时要考虑势力在权力格局中的生态位——每种类型的优势和弱点构成天然的制衡。

#### 势力地位

五个等级的叙事含义：

| 地位 | 说明 | 叙事定位 |
|------|------|---------|
| **顶级势力** | 能影响朝局走向 | 最终 Boss 级或最强盟友 |
| **一流势力** | 有独立话语权 | 主要对手或重要盟友 |
| **二流势力** | 需要依附大势力 | 可拉拢的摇摆力量 |
| **新兴势力** | 正在崛起 | 穿越者可能加入或创建 |
| **没落势力** | 曾经辉煌 | 提供历史纵深和翻盘可能 |

势力地位决定其在剧情中的分量——顶级势力的动向是大事件，新兴势力的崛起是成长线。

#### 核心人物

- 每个势力需要有清晰的权力结构：领袖、二号人物、关键幕僚
- 人物性格要与势力风格匹配（世家重礼法、武将重忠义）
- 核心人物之间的关系也是势力内部的戏剧张力来源
- 写明人物在势力中的职位/身份，而非只列名字

#### 势力特点

- 必须写出该势力区别于其他势力的独特标签
- 好的特点：「以诗书传家，门下弟子遍布六部，擅长以舆论左右朝局」
- 差的特点：「很强大，资源很多」
- 特点要与势力类型匹配——世家重文化底蕴，军阀重武力值，商家重财力和人脉

#### 势力资源

- 必须具体化，不能泛泛而谈
- **兵权**：控制哪支军队、多少兵力、驻扎何处
- **财富**：产业类型、年收入级别、核心财源
- **人脉**：在哪些部门有人、与哪些势力有联姻关系
- **情报**：是否有暗桩、消息网络的覆盖范围
- **文化**：是否垄断科举、书院、舆论
- 资源类型要与势力类型匹配

#### 势力关系

- 必须写明与其他主要势力的具体关系：盟友、敌对、中立
- 关系不是静态的——要暗示可能的变化方向
- 好的关系描述：「与太子党表面结盟，实则各怀心思；与清河崔氏有三代联姻但近年渐生嫌隙」
- 差的关系描述：「和一些势力关系不好」
- 势力关系网是剧情推动的核心引擎

#### 势力目标

- 每个势力必须有明确的核心诉求——这是驱动势力行动的根本动力
- 目标要具体可执行：「扶持三皇子登基」比「获取更大权力」好
- 目标之间应有冲突——这是故事矛盾的来源
- 长期目标和短期目标可以并存

---

### 势力阵容建议

**标准配置**：
1. **皇权核心**（1 个，皇室宗亲/外戚类）：代表正统权力，是所有势力博弈的焦点
2. **世家大族**（1-2 个，世家门阀类）：代表旧秩序，与穿越者的新思维形成冲突
3. **主角势力**（1 个，可为新兴势力）：穿越者所属或创建的势力
4. **朝堂对立面**（1 个，朝廷派系类）：与主角阵营在政治路线上对立
5. **暗线势力**（0-1 个，任意类型）：隐藏的幕后推手，制造反转

**权力格局设计原则**：
- 至少三方势力形成三角制衡——两方对立太简单，三方以上才有纵横捭阖的空间
- 每个势力都应有「不得不」的理由——不是为了反对而反对
- 穿越者作为变量打破平衡——这是穿越文的核心叙事动力

---

### 与已有设定的联动

| 设定模块 | 对势力的影响 |
|---------|------------|
| **世界** | 政治体制→势力的权力来源和合法性；经济体系→势力的资源基础；军事体系→势力的武力配置 |
| **故事钩子** | 核心冲突→势力对立的根本原因；穿越设定→穿越者与势力的初始关系 |
| **小说梗概** | 关键转折→势力格局变化的节点；结局走向→最终的势力格局 |
| **文风设定** | 叙事基调→势力描写的风格（严肃朝堂 vs 轻松宫斗） |

---

### 常见错误

1. **势力同质化**：每个势力都是「很强大很有权势」，缺少差异化的定位和特色
2. **关系网单薄**：势力之间只有简单的「敌我」关系，缺少灰色地带和利益纠葛
3. **资源描写空洞**：只说「资源丰富」而不具体化——兵权、财富、人脉要有细节
4. **目标模糊**：势力没有明确的核心诉求，导致行动缺少动机
5. **权力失衡**：一个势力过于强大，其他势力沦为陪衬——失去博弈的紧张感
6. **忽略阶层特征**：古代社会有严格的等级制度，势力的行为模式必须符合其阶层身份
7. **命名不古风**：使用现代组织名称或过于直白的命名',
  '## "Faction" Generation — Ancient Dynasty Crossover Novel

The core of faction design in ancient dynasty crossover novels is **power games × interest entanglement × class stratification**. Every faction exists within an intricate web of relationships — imperial power vs noble houses, consort clans vs court officials, local vs central authority.

When the time-traveler enters this web, the original balance is inevitably disrupted. Good faction design creates choices (which side to join), generates conflict (clashing interests), and drives plot (dynamic power shifts).

---

### Field Generation Guide

#### Faction Name (势力名称)
Follow ancient naming conventions reflecting identity and status. Imperial: use titles/state names. Noble houses: use surnames/regional origins. Court factions: use key figures or political positions. No modern-sounding names.

#### Faction Type (势力类型)
Seven types with distinct power sources: Imperial Clan (legitimacy from bloodline), Noble Houses (cultural monopoly, talent reserves), Consort Clan (harem connections), Court Factions (bureaucratic networks), Local Powers (land and military), Martial Sects (martial prowess), Commercial Powers (wealth but low social status).

#### Faction Status (势力地位)
Five tiers with narrative implications: Top-tier (influences court direction), First-rate (independent voice), Second-rate (needs patron), Rising (protagonist may join/create), Declining (provides historical depth and comeback potential).

#### Key Figures (核心人物)
Clear power structure: leader, second-in-command, key advisors. Personalities should match faction style. Specify roles, not just names.

#### Faction Characteristics (势力特点)
Must differentiate from other factions. Be specific about unique traits, not generic "powerful."

#### Faction Resources (势力资源)
Must be concrete: military (which army, how many troops), wealth (industries, income), connections (which departments, marriage alliances), intelligence (spy networks), cultural (exam monopoly, academies).

#### Faction Relations (势力关系)
Must specify concrete relationships with other major factions. Relations are not static — hint at possible changes. Include complex, multi-layered dynamics.

#### Faction Goals (势力目标)
Every faction needs clear, actionable objectives. Goals should conflict with each other — this drives the story.

---

### Faction Lineup Suggestion

Standard configuration:
1. **Imperial core** (1, imperial/consort type): Focus of all power struggles
2. **Noble house(s)** (1-2): Represents old order, conflicts with traveler''s modern thinking
3. **Protagonist''s faction** (1, possibly rising): The traveler''s base
4. **Court opposition** (1): Politically opposed to protagonist
5. **Hidden faction** (0-1): Behind-the-scenes manipulator for plot twists

At least three factions should form a triangular balance for complex maneuvering.

---

### Setting Linkage

| Setting | Impact |
|---------|--------|
| **World** | Political system → power sources; economy → resource base; military → force configuration |
| **Story Hook** | Core conflict → root cause of opposition; crossover setting → initial relation with factions |
| **Synopsis** | Key turning points → faction shift moments; ending → final power landscape |
| **Writing Style** | Narrative tone → faction description style |

---

### Common Errors

1. **Homogeneous factions**: Every faction is "powerful" with no differentiation
2. **Thin relationship web**: Only simple "friend/foe" without gray areas
3. **Vague resources**: Just "rich in resources" without specifics
4. **Unclear goals**: No clear objectives driving faction actions
5. **Power imbalance**: One faction too dominant, others become decoration
6. **Ignoring class characteristics**: Ancient society has strict hierarchy
7. **Non-period naming**: Using modern organizational names',
  (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1),
  1,
  25,
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
