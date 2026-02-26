-- 穿书文小说「角色」生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-chuanshu-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chuanshu-character-gen',
  '「角色」生成：为穿书文小说生成角色，基于三源角色体系（原著角色/穿书者/原创角色），结合穿书设定和原著世界设计角色阵容',
  '"Character" generation: generate characters for book-crossing novels based on three-origin system (original character / crosser / new character)',
  '## 「角色」生成 — 穿书文小说

穿书文小说的角色设计核心是**三源角色体系**——角色来源于三个维度：原著已有角色、穿书者（主角）、原创角色。每类角色有不同的设计规则。

角色设计必须与已有设定紧密联动：穿书设定决定主角身份，原著世界约束角色背景，原著剧情线规定命运走向，金手指影响能力格局。

---

### 字段生成指南

#### 姓名

- **原著角色**：使用原著中的姓名，不可改动
- **穿书者**：使用穿越后的角色姓名（即原著中该角色的名字）
- **原创角色**：姓名必须符合原著世界的命名风格
  - 古代世界：遵循朝代命名习惯
  - 现代世界：正常现代名字
  - 异世界：符合该世界的命名体系

#### 角色来源

三个选项的核心区别：

| 来源 | 设计约束 | 关键考量 |
|------|---------|---------|
| **原著角色** | 核心性格和经历须忠于原著 | 可因穿书者蝴蝶效应改变命运 |
| **穿书者（主角）** | 拥有双重人格：现代灵魂+书中角色的身体和记忆 | 行为要在"像原角色"和"做自己"之间平衡 |
| **原创角色** | 自由度最高 | 身份和行为须符合原著世界观 |

#### 角色定位

穿书文的角色定位有独特的设计逻辑：

| 定位 | 穿书文特点 | 设计重点 |
|------|----------|---------|
| **主角** | 穿书者，拥有原著知识 | 内心是现代人，外表是书中角色 |
| **男/女主** | 原著的核心CP角色 | 可能因穿书者介入而改变感情走向 |
| **重要配角** | 原著中有戏份的角色 | 命运可能被穿书者改变 |
| **反派** | 原著中的对立角色 | 可能并非真正的坏人（穿书文常见反转） |
| **导师** | 帮助穿书者适应书中世界的角色 | 可以是原著中的配角或原创角色 |

#### 原著中的命运

穿书文角色独特的关键字段：
- **原著角色**：必填。描述该角色在原著中的结局
- **穿书者**：描述穿书者所占角色在原著中的结局（这是穿书者最想改变的）
- **原创角色**：无需填写

设计要点：
- 悲惨的原著命运是改变的动力
- 并非所有角色的命运都会被改变
- 有些角色的好结局可能因蝴蝶效应变差

#### 性别、年龄

根据原著设定确定。原著角色必须忠于原著。

#### 外貌特征、性格特点

- **原著角色**：忠于原著描述，可以补充原著未涉及的细节
- **穿书者**：外貌是原角色的，但内在气质可能与原角色不同（别人会觉得"你最近变了"）
- **原创角色**：自由设计，但要符合世界观

#### 身份地位

在书中世界的社会位置。穿书者的身份由穿书设定决定。

#### 与主角关系

穿书文的角色关系有一层额外维度：**穿书者知道原著中的关系走向**
- 知道谁是敌人但此刻是朋友
- 知道谁会背叛但现在很忠诚
- 知道谁是贵人但原角色得罪过对方

#### 背景故事

角色的前史。穿书者有双重背景：现实世界的前世+书中角色的过去。

#### 对主角的态度

穿书文独有的维度——其他角色是否察觉穿书者的异常：
- **友好信任**：完全没有察觉异常
- **中立观望**：觉得最近有点不一样但没多想
- **敌对排斥**：本来就与原角色敌对
- **暗中怀疑**：觉得"你不是原来的那个人"
- **已发现穿书秘密**：最高级的人际危机

---

### 角色阵容建议

**第一优先级（必须创建）**：
1. **穿书者**：主角。双重身份是核心张力
2. **原著男/女主**：原著的灵魂人物。穿书者对其有最多的先知信息

**第二优先级（强烈建议）**：
3. **原著反派**：可能是"被误解的人"（穿书文常见翻案套路）
4. **关键配角**：穿书者最想拯救/改变命运的人

**第三优先级（可选）**：
5. **导师/朋友**：帮助穿书者适应书中世界
6. **原创角色**：填补原著空白

---

### 与已有设定的联动

| 设定模块 | 对角色的影响 |
|---------|------------|
| **穿书设定** | 穿越身份→主角的角色来源和定位；核心目标→主角的行动方向 |
| **原著世界** | 世界类型→命名规范和社会阶层；核心规则→角色能力上限 |
| **原著剧情线** | 关键转折点→角色在关键事件中的角色；原著结局→角色原命运 |
| **金手指** | 类型→主角能力定位 |
| **故事钩子** | 核心冲突→角色关系设计的核心矛盾 |

---

### 常见错误

1. **原著角色性格失真**：改变角色性格核心与原著严重矛盾
2. **所有人都发现穿书者异常**：过早暴露让紧张感消失
3. **原创角色过多**：冲淡了"穿书"的核心体验
4. **忽视原著命运字段**：这是穿书文角色最重要的维度
5. **穿书者完全不像原角色**：其他角色理应更早发现异常
6. **角色定位重复**：多个角色承担相同故事功能',
  '## "Character" Generation — Book-Crossing Novel

The core of character design is the **three-origin system**: original novel characters, the crosser (protagonist), and new original characters.

---

### Field Generation Guide

#### Name
Original characters: use original names. Crosser: uses the occupied character''s name. New characters: match the world''s naming conventions.

#### Character Origin
Original character (must stay faithful to source), Crosser/protagonist (dual personality: modern soul + book character''s body), New character (highest freedom, must fit world rules).

#### Role
Unique book-crossing logic: protagonist has dual identity as core tension; male/female lead may change romance trajectory; villain may be "misunderstood" (common book-crossing twist).

#### Original Fate
Key field unique to book-crossing: describe the character''s fate in the original novel. Tragic original fates drive change motivation.

#### Attitude Toward Protagonist
Whether other characters notice the crosser''s abnormality: friendly trust → neutral observation → hostile → secretly suspicious → discovered the crossing secret (highest interpersonal crisis).

---

### Character Lineup
Priority 1: Crosser (protagonist) + Original male/female lead. Priority 2: Original villain + key supporting character to save/change. Priority 3: Mentor/friend + original characters.

### Common Errors
1. Original character personality deviation. 2. Everyone discovers the crosser too quickly. 3. Too many original characters diluting the "book-crossing" experience. 4. Ignoring the "original fate" field.',
  (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1),
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
