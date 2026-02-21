-- 异世界玄幻穿越小说「角色」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xuanhuan-crossing-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xuanhuan-crossing-character-gen',
  '「角色」生成：为异世界玄幻穿越小说生成角色，涵盖多种族体系、修炼境界设计、势力归属和人物弧光规划',
  '"Character" generation: generate characters for isekai xuanhuan crossing novels, covering multi-race system, cultivation realm design, faction affiliation, and character arc planning',
  '## 「角色」生成 — 异世界玄幻穿越小说

异世界玄幻穿越小说的角色设计核心是**多种族 × 修炼体系 × 势力博弈**。穿越者进入一个全新的玄幻世界，这个世界有独立的种族、修炼体系和势力格局。角色的实力等级直接决定其社会地位和话语权。

角色设计必须与世界观、修炼体系和穿越设定紧密联动。每个角色的种族、境界、所属势力构成其核心身份标签。

---

### 字段生成指南

#### 姓名

- 风格要符合玄幻世界观：人族可用中式古风名，妖族/魔族/精灵等可用异域风格名
- 姓氏可体现家族传承（如"龙"、"凤"暗示血脉）
- 强者常有道号或尊称，但姓名字段只填本名
- **禁止名字带括号说明**

#### 角色定位

| 定位 | 说明 | 玄幻特色 |
|------|------|---------|
| **主角** | 穿越者 | 必须与穿越设定一致；起点通常较低，拥有成长型金手指 |
| **男主/女主** | 感情对象 | 实力通常与主角互补，可以是高境界的存在 |
| **反派** | 核心对手 | 当前实力高于主角，可分阶段设置多个（小反派→中反派→终极反派） |
| **重要配角** | 盟友/导师 | 在关键节点提供帮助，但不能抢主角风头 |
| **工具人** | 功能角色 | 引发冲突或提供信息的触发器 |

#### 性别

三个选项：男 / 女 / 其他（部分种族可能无明确性别概念）

#### 年龄

玄幻世界的年龄与现实差异极大：
- 修炼者寿命可达数百至数千年
- 高境界者外貌不反映真实年龄
- 用描述性表达更好（如"看似少年，实则已活千年"）

#### 种族

七个选项的设计要点：

| 种族 | 典型特征 | 角色设计侧重 |
|------|---------|------------|
| **人族** | 数量多、天赋低、潜力大 | 以智取胜，群体优势 |
| **妖族** | 化形修炼、兽性本能 | 野性与人性的冲突 |
| **魔族** | 实力强、好战、层级分明 | 力量崇拜，弱肉强食 |
| **精灵** | 亲近自然、寿命长、高傲 | 种族自尊与偏见 |
| **兽人** | 体魄强健、崇尚武力 | 直接粗暴的行事风格 |
| **龙族** | 天赋最强、数量最少 | 血脉传承，种族骄傲 |
| **其他** | 自定义种族 | 与世界观设定中的种族体系一致 |

主角通常为人族（穿越者），但种族选择要与穿越设定中的穿越目标一致。

#### 身份地位（嵌套对象）

四个子字段：

**所属势力**：角色隶属的门派/家族/王朝/组织
- 参考世界观设定中的势力分布
- 主角初期可无势力（散修），后期加入或创建

**职业/宗门**：修炼方向或社会角色
- 如"剑修"、"炼丹师"、"符师"、"阵法师"
- 参考修炼体系设定中的修炼方向

**境界/等级**：当前修炼境界
- 必须使用修炼体系设定中定义的境界名称
- 主角起始境界通常最低
- 反派境界通常高于主角当前境界

**称号**：因实力或事迹获得的称号
- 如"剑痴"、"魔帝"、"天才少年"
- 低境界角色可不设称号

#### 外貌特征

- 非人族要有种族特征（妖族的兽耳、龙族的龙角等）
- 修炼者的外貌受境界影响（高境界者气质超凡）
- 反派可有标志性的阴暗特征

#### 性格特点

- 种族特性影响基础性格（妖族狡猾、兽人直率、精灵高傲）
- 穿越者保留现代人的思维方式但逐渐适应
- 反派的性格要有层次，不只是"坏"

#### 人物背景

- 穿越者：穿越前的身份 + 穿越后的起始处境
- 本土角色：家族传承、修炼经历、重要事件
- 背景要与世界观和修炼体系的设定一致

#### 人物目标

- 穿越者：与穿越设定中的核心目标一致
- 反派：对资源/权力/传承的渴望
- 配角：各自的修炼目标或生存需求

#### 人物弧光

- 穿越者：从弱小到强大的成长线（同时内心从现代人到修炼者的转变）
- 反派：可设计"由正转邪"的背景，增加深度
- 配角：在主角影响下的变化

---

### 角色阵容建议

**标准配置**：
1. **主角**：人族穿越者，低境界起步，拥有金手指
2. **女主/男主**：高天赋的本土修炼者，可以是不同种族
3. **反派**：当前境界压制主角的强者（同辈天才或上一代强者）
4. **导师型配角**：指引主角初期修炼的老前辈
5. **兄弟型配角**：与主角同期修炼、互相扶持的同伴

---

### 与已有设定的联动

| 设定模块 | 对角色的影响 |
|---------|------------|
| **穿越设定** | 穿越方式→主角进入方式；穿越目标世界→种族和势力背景 |
| **世界观** | 大陆/国度→势力分布；种族体系→角色种族选择范围；天材地宝→角色成长资源 |
| **修炼体系** | 境界体系→角色实力等级；修炼方向→职业选择；突破条件→角色成长节点 |
| **金手指** | 类型和能力→主角的核心优势；限制→主角不是无敌的 |
| **故事钩子** | 核心卖点→角色阵容要服务于卖点 |
| **文风设定** | 节奏风格→角色冲突的密度和强度 |

---

### 常见错误

1. **种族设定与世界观矛盾**：使用了世界观中不存在的种族
2. **境界体系混乱**：使用了修炼体系设定中没有定义的境界名
3. **主角起点过高**：穿越后直接高境界，失去成长空间
4. **反派过于脸谱化**：所有反派都是"看主角不顺眼"，缺乏合理动机
5. **种族特征缺失**：非人族角色完全像人族，失去种族特色
6. **身份地位空泛**：只写"某门派弟子"而不给出具体门派名和地位',
  '## "Character" Generation — Isekai Xuanhuan Crossing Novel

The core of character design in isekai xuanhuan crossing novels is **multi-race × cultivation system × faction politics**. The transmigrator enters a brand-new xuanhuan world with independent races, cultivation systems, and power structures. A character''s cultivation level directly determines their social status and influence.

---

### Field Generation Guide

#### Name (姓名)
Style should match the xuanhuan worldview: classical Chinese for humans, exotic for other races. No parenthetical descriptions.

#### Role (角色定位)
Protagonist (transmigrator, low start with growth cheat), Love Interest (complementary strength), Antagonist (currently stronger, can be staged), Important Supporting (mentor/ally), Functional.

#### Gender (性别)
Three options: Male / Female / Other (some races may lack clear gender concepts).

#### Age (年龄)
Cultivation extends lifespan enormously. High-realm cultivators'' appearance doesn''t reflect true age.

#### Race (种族)
Seven options: Human (majority, great potential), Demon Beast (shapeshifting, animal instincts), Devil (strong, warlike), Elf (nature-aligned, proud), Beastman (physically strong), Dragon (strongest talent, fewest numbers), Other. Protagonist is usually human.

#### Status (身份地位, nested)
- **Faction**: Sect/family/kingdom/organization
- **Profession/Sect**: Cultivation direction (swordsman, alchemist, formation master)
- **Realm/Level**: Must use realm names from the cultivation system setting
- **Title**: Earned through strength or deeds

#### Appearance (外貌特征)
Non-human races should have racial traits. Cultivation level affects bearing.

#### Personality (性格特点)
Racial traits influence base personality. Transmigrator retains modern thinking but adapts.

#### Background (人物背景)
Transmigrator: pre-crossing identity + post-crossing situation. Natives: family legacy, cultivation history.

#### Goal (人物目标)
Must align with crossing setup''s core goal for protagonist. Others have independent goals.

#### Character Arc (人物弧光)
Protagonist: weak to strong (and modern human to cultivator mentality shift). Antagonists can have "fall from grace" backstories.

---

### Character Lineup Recommendations

1. **Protagonist**: Human transmigrator, lowest realm, with cheat ability
2. **Love Interest**: High-talent native cultivator, possibly different race
3. **Antagonist**: Currently realm-suppressing the protagonist
4. **Mentor**: Elder guiding early cultivation
5. **Companion**: Same-generation cultivator growing alongside protagonist

---

### Setting Linkage

| Setting | Impact |
|---------|--------|
| **Crossing Setup** | How protagonist enters; target world |
| **Worldview** | Continents/nations → faction distribution; racial system |
| **Cultivation System** | Realm hierarchy → power levels; cultivation paths → professions |
| **Cheat Ability** | Type and limits → protagonist''s core advantage |
| **Story Hook** | Core selling point → lineup must serve it |
| **Writing Style** | Pacing → conflict density |

---

### Common Errors

1. **Race contradicts worldview**: Using races not defined in the worldview
2. **Realm system confusion**: Using realm names not in the cultivation system setting
3. **Protagonist starts too strong**: Transmigrating directly into high realm, losing growth space
4. **Stereotypical antagonists**: All antagonists just "dislike the protagonist" without real motivation
5. **Missing racial traits**: Non-human characters behave entirely like humans
6. **Vague status**: Only "some sect disciple" without specific sect name and position',
  (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1),
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
