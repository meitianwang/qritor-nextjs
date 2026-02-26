-- The Demon King / Monster Overlord Novel「实体命名」技能
-- 执行方式: mysql -u <user> -p <database> < skill-demon-king-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'demon-king-entity-naming',
  '「实体命名」：为魔物角色、深渊技能、邪恶领地和反派阵营提供命名词库和规则',
  '"Entity Naming": Provide naming lexicons and rules for monster characters, abyssal skills, evil territories, and villainous factions',
  '## 实体命名规则 — 魔王养成/被迫反派

在魔王养成与基建征服题材中，命名风格极其重要，它直接构建了作品的"反派史诗感"。魔族侧的名字要黑暗、粗犷或充满堕落贵族的优雅；而人类侧（敌方侧）的名字要极度神圣、光明，以达到讽刺的效果。

---

### 一、 角色命名 (Characters)

#### 1. The Demon King (魔王/主角)
如果主角保留人类意识，可用前世的人类名与现世的尊号结合；如果转生为魔物，通常会随着进化获得越来越恐怖的称号。
- **命名结构**：[灾厄头衔] + [真名]
- **词汇偏好**：原初 (Primordial)、烬灭 (Cinder)、绝望 (Despair)、无骨者 (The Boneless)、骸 (Corpse)
- **示例**：碎星者·阿兹加尔 (Azgar the Star-Shatterer)、终焉之主·法尔 (Farr, Lord of the End)

#### 2. Loyal Minions (忠诚魔将/部下)
魔将的名字需要带着所属种族的特征。
- **亡灵系/不死系**：发音干涩、常常指代墓地或寒冷的词。如：枯骨 (Marrow)、霜魂 (Frostsoul)、莫德凯 (Mordekai)。
- **深渊/恶魔系**：带有喉音，听起来古老且邪恶。如：巴洛 (Balor)、煞魔 (Zhar-rok)、卡扎克 (Kazak)。
- **魅魔/堕落精灵系**：发音优美但带有剧毒感、夜晚感。如：莉莉丝 (Lilith)、夜莺 (Nightingale)、伊芙琳 (Evelynn)。

#### 3. Human Enemies (人类敌人 - 勇者/教皇)
要起得极其光明伟岸，甚至有一种刻板印象的"虚伪神圣感"。
- **头衔**：光辉的 (Radiant)、圣洁的 (Holy)、神眷者 (God-Touched)、断罪的 (Sin-Breaker)
- **示例**：光之剑首·加拉哈特 (Galahad, First Sword of Light)、慈悲圣女·伊莲娜 (Elena the Merciful Maiden)。

---

### 二、 势力与称号命名 (Factions & Titles)

#### 1. The Demon Kingdom (魔物军团)
后缀多用"大军(Horde)"、"绝境(Abyss)"、"灾祸(Scourge)"。
- 示例：漆黑之潮 (The Black Tide)、腐朽王庭 (The Rotting Court)、第三深渊军团 (Third Abyssal Legion)。

#### 2. Human Empires (人类国家/教廷)
极度神圣化，带有一种傲慢的绝对统治感。
- 示例：光辉大教廷 (The Radiant Hegemony)、银白十字军 (The Silver Crusade)、圣耀罗兰帝国 (Holy Empire of Roland)。

---

### 三、 建筑与领地命名 (Territories & Scenes)

魔王城的基建与环境必须透露出凶险。

#### 1. 领地设施 (Kingdom Infrastructure)
主角基建的建筑，名字要能听出它血腥的工作原理。
- **转化类**：血肉熔炉 (Flesh Forge)、埋骨池 (Marrow Pit)、灵魂提炼塔 (Soul Extraction Spire)。
- **军事类**：龙骨城墙 (Wyrm-bone Rampart)、恶影堡垒 (Fortress of Ill-Shadow)、毒瘴护城河 (Miasma Moat)。

#### 2. 战场与遗迹 (Battlefields)
这些地点通常是魔王军碾压勇者的地方。
- 示例：终焉裂谷 (The Rift of the End)、诸神陨落之地 (Grave of the Gods)、叹息冰原 (The Wailing Tundra)。

---

### 四、 技能与系统机制命名 (Skills & Kingdom Mechanics)

魔王主角的金手指或者专属大招。
- **体系机制 (System)**：万物吞噬矩阵 (Omni-Devour Matrix)、深渊领主引擎 (Abyssal Lord Engine)、亡灵天灾树 (Scourge Evolution Tree)。
- **战斗技能 (Combat Skills)**：绝望凝视 (Gaze of Despair)、寂灭死印 (Seal of Oblivion)、万魂枯萎 (Wither of Ten Thousand Souls)。

### 🚫 避坑指南
1. **切忌中二过度**：名字太长、加太多毫无意义的破折号（如"暗黑-终极-破灭-死神大帝"）会显得幼稚掉价。
2. **人类名字不能拉胯**：如果勇者的名字听起来像个小混混，魔王击败他就毫无史诗感。人类敌人必须叫"光辉大骑士长"这样的名字，杀起来才有反差爽感。',
  '## Entity Naming Rules — The Demon King / Monster Overlord Novel

In the Demon King kingdom building and conquest genre, the naming style is critically important; it directly establishes the "villainous epic" feel. Demon-side names should be dark, brutal, or carry the elegance of corrupted nobility. Meanwhile, Human-side (enemy) names must be exceedingly holy and radiant, to achieve maximum ironic effect when they are slaughtered.

---

### I. Character Naming

#### 1. The Demon King (MC)
If the protagonist retains human consciousness, they might use their past human name combined with a present-world title. If reincarnated as a monster, they usually gain increasingly terrifying titles as they evolve.
- **Naming Structure**: [Calamity Title] + [True Name]
- **Vocabulary Preference**: Primordial, Cinder, Despair, Boneless, Corpse, Void.
- **Examples**: Azgar the Star-Shatterer, Farr, Lord of the End.

#### 2. Loyal Minions/Generals
Demon General names need to reflect their racial characteristics.
- **Undead/Necromantic**: Dry phonetics, referring to graveyards or bitter cold. e.g., Marrow, Frostsoul, Mordekai.
- **Abyssal/Demonic**: Guttural, sounding ancient and purely evil. e.g., Balor, Zhar-rok, Kazak.
- **Succubus/Dark Elf**: Melodic but laced with poison, shadows, and night. e.g., Lilith, Nightingale, Evelynn.

#### 3. Human Enemies (Heroes/Popes)
They must sound incredibly righteous and magnificent, almost carrying a stereotypical "hypocritical holiness."
- **Titles**: Radiant, Holy, God-Touched, Sin-Breaker.
- **Examples**: Galahad, First Sword of Light; Elena the Merciful Maiden.

---

### II. Factions & Titles

#### 1. The Demon Kingdom (Monster Legions)
Suffixes often use Horde, Abyss, Scourge, Court.
- **Examples**: The Black Tide, The Rotting Court, The Third Abyssal Legion.

#### 2. Human Empires (Nations/Church)
Overly sanctified, carrying an arrogant sense of absolute rule.
- **Examples**: The Radiant Hegemony, The Silver Crusade, The Holy Empire of Roland.

---

### III. Territories & Infrastructure (Scenes)

The environments and buildings of the Demon Lord Castle must exude danger and industrial evil.

#### 1. Kingdom Infrastructure
The buildings constructed by the protagonist should sound exactly like their bloody operational principles.
- **Conversion**: Flesh Forge, Marrow Pit, Soul Extraction Spire.
- **Military Defense**: Wyrm-bone Rampart, Fortress of Ill-Shadow, Miasma Moat.

#### 2. Battlefields and Ruins
These are typically the locations where the Demon Army crushes the Heroes.
- **Examples**: The Rift of the End, Grave of the Gods, The Wailing Tundra.

---

### IV. Skills & Kingdom Mechanics

The protagonist''s cheat system or ultimate moves.
- **System Mechanics**: Omni-Devour Matrix, Abyssal Lord Engine, Scourge Evolution Tree.
- **Combat Skills**: Gaze of Despair, Seal of Oblivion, Wither of Ten Thousand Souls.

### 🚫 Pitfalls to Avoid
1. **Do not overdo the "Edginess"**: Names that are too long or have meaningless dashes (e.g., "Dark-Ultimate-Destruction-Death Emperor") sound juvenile and cheap.
2. **Do not make Human names sound weak**: If the Hero sounds like a street thug, defeating them provides no epic payoff. The human enemies must be called things like "The Grand Knight of Splendor"—killing *them* creates the satisfying, dark contrast.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Demon King / Monster Overlord Novel' LIMIT 1),
  1,
  104,
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
