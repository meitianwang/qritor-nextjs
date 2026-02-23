-- 异世界玄幻穿越小说「实体命名」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xuanhuan-crossing-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xuanhuan-crossing-entity-naming',
  '实体命名：为异世界玄幻穿越小说中的角色、场景、组织等实体提供具有力量感、世界层次感且不千篇一律的专业命名指导',
  '"Entity Naming": Provide powerful, world-layered, and distinctive naming guidance for characters, locations, and factions in xuan huan transmigration novels',
  '## 实体命名 — 异世界玄幻穿越小说

异世界玄幻穿越小说的实体命名核心是**力量感与异域感**。角色和地点的名字要传递力量层次，让读者通过名字就能感受到强弱差距；同时要有别于普通中国古代小说，有"异界"的陌生感。

---

## 一、角色命名

### 命名哲学

玄幻角色命名的基本逻辑：**名字反映力量和身份**。强者的名字往往有威压感，弱者（尤其是穿越来的主角初期）可以更普通，形成反差。

### 穿越者主角

穿越者来自现代，初期名字可以相对普通但不违和：
- 简洁有力：林峰、云逸、夜辰、沈青、叶枫
- 有一定个性但不违和：苍穹、云霄、夜殇（略微玄幻化但不夸张）
- 避免：完全现代化名字（张伟、王芳）或完全玄幻强者名字（初期用"魔皇"级别的名字）

### 异界强者

强者的名字要有威压感，多用：
- 力量词 + 单字：炎煌、龙渊、天绝、魔皇
- 称号式：魔帝炎煌、龙族圣女凤羽、血煞宗主
- 双字威压：煞天、屠神、破界

### 异界普通人

有异域感但不夸张：
- 意象词组合（偏自然/元素）：沧月、玄火、碧落、星渊、霜林
- 避免：完全与现代中文名相同（李明、张伟），或过于复杂的生僻字组合

### 女性角色

- 灵动型：冰雪、紫薇、幻灵、云裳、碧瑶
- 强势型：凤煞、天璇、煞月、魔女（力量感强）
- 温柔型：月儿、晴儿、雪儿（普通异界女性用叠字更合适）

### 多种族角色

如果故事涉及非人族：
- 龙族：名字多用龙相关词（龙渊、炎龙、苍龙）
- 魔族：阴暗感（血煞、黑月、暗影）
- 神族：高远感（天极、苍穹、太虚）
- 精灵类：轻盈感（月华、星雪、风叶）

### 多样化原则

- 不要全书重要角色名字都是两字（辨识度低）
- 不同阵营的角色名要有明显风格区分（正道/邪道/中立）
- 强者的名字和弱者的名字不能同一个模板（避免炎某、云某、天某泛滥）

---

## 二、场景命名

### 世界/大陆/区域（宏观层）

宏大感为主，体现世界的宽广：
- 大陆：神灵大陆、九天大陆、玄幻世界（这是世界本身的名字，不要太具体）
- 区域划分：圣地区域（圣域大陆、天圣州）、魔域区域（魔界、幽冥域）、蛮荒区域（荒古之地、混沌域）

### 城市/据点（中观层）

有力量等级感，读者通过城市名就能感受到这个地方的档次：
- 顶级圣地：圣域城、古神圣地、万神殿
- 中等城市：龙族圣都、炼器城、灵药城（以功能/种族命名）
- 普通城镇：青石城、流云镇、风火县（相对朴实，与强者地点形成层次）

### 特殊地点/秘境（微观层）

神秘感、危险感或诱惑感：
- 危险秘境：绝地炼狱、万古荒域、天魔洞窟、死亡禁地
- 机缘秘地：古神秘境、神龙秘藏、天机圣地
- 宗门核心：剑峰、炼丹峰、藏经阁（功能性命名）

---

## 三、组织命名

### 宗门/势力命名逻辑

结构：[意象/功法/地形] + [宗/派/阁/盟/教/会]

**力量层级要通过名字体现**：
- **顶级势力**：天字或"万/诸天/圣"前缀（万剑宗、天道圣殿、诸神神殿）
- **中等势力**：意象+宗/派（玄火宗、星月阁、碧剑派）
- **小势力**：地名+门/堂（青石门、风火堂）

### 正道宗门

清正有力，多用天/玄/圣等字：
- 天剑宗、玄武阁、圣火宗、青云门、万灵圣殿

### 邪道/魔道势力

阴暗煞气，多用血/魔/幽/煞等字：
- 血月教、魔域会、煞骨宗、幽冥宫、血灵宗

### 中立/商业/情报组织

- 情报：万象楼、天机阁、百晓堂
- 商业：万宝行、天材地宝阁
- 散修联盟：自在盟、云游会

### 世家大族

姓氏 + 家/氏（林家、古氏、魔皇血脉）；强大家族可在前加修饰词（上古林氏、神龙族）

---

## 常见错误

- ❌ 全书角色都用两字名（炎某、云某……辨识度极低）
- ❌ 主角初期就用强者名字（主角刚穿越就叫"魔帝"，失去成长弧）
- ❌ 正道和邪道势力命名风格完全相同（读者分不清阵营）
- ❌ 城市/场景全用"某某城"而没有层次感
- ❌ 普通异界人和顶级强者名字无法区分（都是意象双字，没有力量感差异）
- ❌ 组织名字太短或太随意（"强者组织""修炼门派"没有辨识度）',
  '## Entity Naming — Xuan Huan Transmigration Novel

Core principle: **power sense + alien-world feel**. Names should convey power hierarchy — readers should sense strength differences just from names. Must feel distinctly different from classical Chinese settings.

---

## I. Character Naming

- **Transmigrator protagonist**: Relatively plain initially (Lin Feng, Yun Yi) — creates contrast with the powerful world
- **Powerful native figures**: Imposing names (Yan Huang, Long Yuan, Mo Huang) — convey dominance
- **Ordinary natives**: Elemental/nature imagery (Cang Yue, Xuan Huo, Bi Luo)
- **Female characters**: Either graceful (Bing Xue, Zi Wei) or powerful (Feng Sha, Tian Xuan)
- **Multi-race**: Dragon names use dragon imagery; Demon names use dark tones; Divine names use celestial imagery

**Diversity**: Mix name lengths, different factions should have clearly distinct naming styles (righteous vs. evil vs. neutral)

---

## II. Location Naming

- **Macro (continent/realm)**: Grand scale (Sacred Realm Continent, Nine Heavens Domain, Chaos Domain)
- **Mid (cities)**: Power-level indicated by name (Ancient God Sacred Ground vs. ordinary Green Stone City)
- **Micro (special sites)**: Mystery/danger/temptation (Eternal Wasteland, Ancient God Ruins, Dragon Treasure Secret Realm)

---

## III. Organization Naming

Structure: [imagery/technique/geography] + [Sect/Alliance/Hall/Temple]

- **Top-tier**: "Heaven"/"Ten Thousand"/"Sacred" prefix (Ten Thousand Swords Sect, Sacred God Temple)
- **Mid-tier**: Imagery + sect suffix (Xuan Fire Sect, Star Moon Pavilion)
- **Evil factions**: Blood/demon/shadow/death imagery (Blood Moon Cult, Demon Domain Alliance)
- **Noble families**: Surname + Clan/Family (Lin Clan, Ancient Gu Family)

---

## Common Errors

- All important characters with identical two-character name format (indistinguishable)
- Protagonist having a powerful-sounding name before their power level justifies it
- Righteous and evil faction names indistinguishable in style
- No power-level differentiation in location names (all just "X City")',
  (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1),
  1,
  36,
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
