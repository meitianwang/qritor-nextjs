-- 古代架空穿越小说「角色」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ancient-crossing-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ancient-crossing-character-gen',
  '「角色」生成：为古代架空穿越小说生成角色，涵盖穿越者身份设计、古代身份体系（嫡庶/官爵/家族）、人物弧光规划',
  '"Character" generation: generate characters for ancient fictional crossing novels, covering transmigrator identity, ancient status system, and character arc planning',
  '## 「角色」生成 — 古代架空穿越小说

古代架空穿越小说的角色设计核心是**穿越者与古代身份体系的碰撞**。主角带着现代记忆进入古代架空世界，需要在家族、官场、宫廷、江湖等复杂关系网络中生存和发展。

角色设计的关键在于：穿越者的前世记忆如何转化为古代世界的生存优势，以及古代社会的嫡庶尊卑、家族势力如何约束角色的行动空间。

---

### 字段生成指南

#### 姓名

- 必须符合古代架空世界的命名习惯
- 姓氏多样化，不要集中在少数大姓
- 名字风格要有古韵，避免现代化
- 穿越者使用穿越后身体的姓名，不是现代名字
- **禁止名字带括号说明**（如"张三（大小姐）"是错误的）

#### 角色定位

五个选项的设计要点：

| 定位 | 说明 | 设计重点 |
|------|------|---------|
| **主角** | 穿越者本人 | 必须与核心设定中的穿越方式、穿越身份一致 |
| **男主/女主** | 主要感情对象 | 与主角的感情线类型（核心设定中的感情线字段）匹配 |
| **反派** | 核心对手 | 有合理的利益冲突动机，不要脸谱化 |
| **重要配角** | 推动剧情的关键角色 | 有独立目标和性格弧光 |
| **工具人** | 功能性角色 | 也需要有辨识度的特征 |

#### 性别

根据角色定位和故事需要选择。注意古代社会性别角色约束：
- 女性角色的行动空间受后宅、宫廷等场景限制
- 但穿越者可通过现代思维突破部分限制（这本身就是看点）

#### 年龄

古代人的年龄感与现代不同：
- 十五六岁已可议亲
- 三四十岁可能已是朝中重臣
- 年龄影响可参与的社交场景

#### 身份地位（嵌套对象）

这是古代架空的核心字段，包含四个子字段：

**家族**：角色所属的家族或势力
- 参考世界观设定中的社会结构
- 主角的家族由核心设定中的穿越身份决定
- 不同家族之间要有明确的利益关系

**官职/爵位**：角色在朝中或地方的地位
- 参考世界观设定中的政治体系
- 与年龄和背景匹配
- 给出具体官职名，不要只写"大官"

**嫡庶**：嫡出 / 庶出 / 不适用
- 嫡庶身份直接影响家族内部地位和继承权
- 穿越者常见身份：庶出子女（逆袭主线）、嫡出但被欺压（宅斗主线）
- 男性角色或非世家角色选"不适用"

**排行**：在家中的排行
- 影响继承权和家庭关系
- 长子/长女 vs 幼子/幼女的地位差异

#### 外貌特征

- 符合古代审美描写风格
- 使用古风词汇（如"面若冠玉"、"眉目如画"），避免现代化描述
- 反派和配角也要有辨识度的外貌特征
- 外貌要与身份地位匹配（贵族精致，江湖粗犷）

#### 性格特点

- 穿越者：融合现代思维和古代角色原有性格
- 古代角色：性格要符合其身份和时代背景
- 每个角色至少有一个性格弱点
- 用具体行为举例说明性格，不要只写形容词

#### 前世记忆（仅穿越者）

- 描述穿越前的现代身份、专业技能、性格
- 与核心设定中的穿越方式呼应
- 前世记忆是穿越者的核心优势来源
- 其他角色此字段留空

#### 人物背景

- 穿越者：穿越后身体原主人的经历（穿越者继承的身份背景）
- 其他角色：成长经历、家族关系、重要转折事件
- 要与世界观设定中的时代背景一致

#### 人物目标

- 穿越者：与核心设定中的主线剧情一致（宫斗夺嫡/经商致富/种田发家等）
- 其他角色：各自有独立的目标，不要全围绕主角
- 目标要具体可衡量，不要写"活得更好"

#### 人物弧光

- 设计角色从开始到结束的成长变化
- 穿越者：从适应古代到驾驭古代的过程
- 反派：从表面强大到被主角逐步击败的过程
- 弧光要有起伏，不是线性成长

---

### 角色阵容建议

批量初始化时，根据核心设定中的主线剧情调整：

**宫斗夺嫡型**：
- 主角（穿越者，宫廷身份）
- 男主/女主（另一阵营的核心人物）
- 反派（争夺同一目标的对手）
- 重要配角×2（忠心侍女/侍卫 + 家族长辈）

**宅斗逆袭型**：
- 主角（穿越者，庶出/嫡出被欺压）
- 男主/女主（外部势力的核心人物）
- 反派（家族内部的对手，如嫡母/庶姐）
- 重要配角×2（知心丫鬟 + 暗中帮助的长辈）

**经商致富 / 种田发家型**：
- 主角（穿越者，平民或落魄身份）
- 男主/女主（合作伙伴或保护者）
- 反派（地方恶霸或竞争对手）
- 重要配角×2（忠诚帮手 + 商场导师）

---

### 与已有设定的联动

| 设定模块 | 对角色的影响 |
|---------|------------|
| **核心设定** | 穿越方式→主角的前世记忆连接；穿越身份→主角的身份地位；主线剧情→全员的角色定位和目标；感情线→男主/女主的设计方向；故事基调→角色性格的整体风格 |
| **世界观** | 朝代设定→命名和官职体系；社会结构→家族和嫡庶体系；地理→角色活动范围 |
| **金手指** | 金手指类型→主角的额外能力，影响与他人的实力对比 |
| **故事钩子** | 核心卖点→角色设计要服务于核心卖点 |
| **文风设定** | 语言风格→角色对话风格（古风典雅 vs 现代轻松） |

---

### 常见错误

1. **身份体系混乱**：嫡庶设定与家族背景矛盾，官职称呼不符合架空朝代设定
2. **前世记忆万能**：穿越者的现代知识过于全面，失去成长空间
3. **性格同质化**：所有正面角色都善良正直，所有反派都阴险狡诈
4. **年龄设定不当**：用现代标准设定古代角色的年龄（如30岁的未婚女性在古代不合理）
5. **忽视嫡庶影响**：设定了嫡庶身份但角色行为完全不受此约束
6. **外貌描写现代化**：用"大长腿"、"高颜值"等现代词汇描述古代角色',
  '## "Character" Generation — Ancient Fictional Crossing Novel

The core of character design in ancient fictional crossing novels is the **collision between the transmigrator and the ancient status system**. The protagonist enters an ancient fictional world with modern memories, needing to survive and thrive within complex relationship networks of families, bureaucracy, palace, and jianghu.

The key lies in how the transmigrator''s past-life memories transform into survival advantages in the ancient world, and how the ancient society''s hierarchies constrain character actions.

---

### Field Generation Guide

#### Name (姓名)
- Must follow ancient-style naming conventions
- Diversify surnames
- Names should have classical elegance, avoid modern style
- Transmigrator uses the body''s name, not their modern name
- **No parenthetical descriptions in names**

#### Role (角色定位)
Five options: Protagonist (transmigrator), Male/Female Lead (romantic interest), Antagonist, Important Supporting, Functional Character. Each role must match the core setting''s main plotline.

#### Gender (性别)
Consider ancient gender role constraints, but transmigrators can break some through modern thinking.

#### Age (年龄)
Ancient age norms differ from modern ones (marriage at 15-16, ministers at 30-40).

#### Status (身份地位, nested object)
Core field with four sub-fields:
- **Family** (家族): Which family/faction. Protagonist determined by crossing identity.
- **Official Title** (官职/爵位): Position in court or local administration.
- **Legitimacy** (嫡庶): Legitimate/Illegitimate/N/A — directly affects inheritance and family standing.
- **Birth Order** (排行): Position among siblings.

#### Appearance (外貌特征)
Use classical Chinese aesthetic descriptions. Match appearance to status.

#### Personality (性格特点)
Transmigrator blends modern thinking with the original character''s personality. Every character needs at least one flaw.

#### Past-Life Memory (前世记忆, transmigrator only)
Modern identity, professional skills, personality before crossing. Source of the transmigrator''s core advantage.

#### Background (人物背景)
For transmigrator: the original body owner''s experiences. For others: growth, family relations, key events.

#### Goal (人物目标)
Must align with the core setting''s main plotline (palace intrigue, commerce, farming, etc.).

#### Character Arc (人物弧光)
Design the growth arc from beginning to end. Must have ups and downs, not linear growth.

---

### Character Lineup Recommendations

Adjust based on the main plotline in core setting:

**Palace Intrigue**: Protagonist + Love Interest (opposing camp) + Antagonist (rival claimant) + 2 Supporting (loyal servant + family elder)

**Household Struggle**: Protagonist (oppressed) + Love Interest (external ally) + Antagonist (family rival) + 2 Supporting (trusted maid + helpful elder)

**Commerce/Farming**: Protagonist (commoner) + Love Interest (partner/protector) + Antagonist (local bully/competitor) + 2 Supporting (loyal helper + mentor)

---

### Setting Linkage

| Setting | Impact |
|---------|--------|
| **Core Setting** | Crossing method → past-life connection; Crossing identity → status; Main plotline → all roles and goals; Romance type → love interest design; Story tone → personality style |
| **Worldview** | Dynasty → naming and official titles; Social structure → family and legitimacy system; Geography → activity range |
| **Cheat Ability** | Type → protagonist extra abilities |
| **Story Hook** | Core selling point → character design must serve it |
| **Writing Style** | Language style → character dialogue style |

---

### Common Errors

1. **Status system confusion**: Legitimacy contradicts family background, titles don''t match the fictional dynasty
2. **Omniscient past-life memory**: Modern knowledge too comprehensive, leaving no growth space
3. **Personality homogeneity**: All heroes virtuous, all villains scheming
4. **Inappropriate age settings**: Using modern standards for ancient ages
5. **Ignoring legitimacy impact**: Setting legitimacy status but character behavior unaffected
6. **Modern appearance descriptions**: Using modern slang for ancient characters',
  (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1),
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
