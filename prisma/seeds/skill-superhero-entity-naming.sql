-- Superhero / Cape Fiction Novel「名物命名 Entity Naming」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-superhero-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'superhero-entity-naming',
  '层级3(Domain Knowledge) - 「名词生成指南」：指导超能社会中各类英雄代号、公会财团与系统界面的起名规范',
  'Layer 3 (Domain Knowledge) - "Entity Naming Guide": Guide for generating hero aliases, corporate megacorps, and system interfaces in a superhuman society',
  '## 专有名词生成指南 (Entity Naming) — 超能英雄/反传统英雄

在此类小说中，名词往往被用作**反讽的工具**。英雄们的代号极其伟光正，系统或者主角的代号则充满了数字感、残缺感或极端的暴力美学。

### 1. 英雄代号命名逻辑 (Hero Aliases)

分为两种极端：
- **顶级伪善英雄（Megacorp Heroes）**：他们的代号是由财团公关部精心设计的，必须充满"美国梦、希望、星空、神明"的味道。
  - *命名偏好*：[正义形容词/自然元素] + [神话词汇/阶级词汇]
  - *案例*：Homelander (祖国人), Starlight (星光), Solar Aegis (太阳神盾), The Apex (顶点), Radiant Savior (闪耀救主)。
- **地下义警/反英雄主角（Underground Vigilantes/MC）**：名字极具隐喻性，通常与死亡、系统的错误代码或低贱的身份相关。
  - *命名偏好*：[机械感/边缘词语] + [终结/错误相关]
  - *案例*：Null (空), System Error (系统谬误), The Janitor (清道夫/处理垃圾的人), Butcher (屠夫), Zero-Point (零点)。

### 2. 势力与公会命名逻辑 (Factions and Guilds)

公会与财团的名字要听起来庞大且不可战胜，具有压倒性的资本气息。
- **垄断财团/巨企 (Megacorporations)**：通常很简短，像现代跨国公司。
  - *案例*：Vought International (沃特国际), Genesis Corp (创世纪集团), Pinnacle Heroics (顶点英雄公司), The Vanguard Trust (先锋信托)。
- **地下势力/罪犯联盟 (Black Market/Syndicates)**：听起来像帮派，或者更具有破坏性的意识形态。
  - *案例*：The Rust Syndicate (铁锈辛迪加), Tartarus Outcasts (塔耳塔洛斯流放者), Shadow-Net Brokerage (暗网经纪)。

### 3. 系统与技能命名逻辑 (System & Skills)

系统的名字是主角的金手指，必须有一种冰冷的、高等维度的机械感。而技能名则反映了力量的阶段。
- **系统名称 (System Names)**：通常带有升级、夺取或审判的意味。
  - *案例*：The Plunder System (掠夺系统), Villain Roleplay Interface (反派扮演界面), God-Slayer OS (弑神操作系统)。
- **技能名称 (Skill Strings)**：带有浓烈的赛博/网游风格。
  - *低配平庸版*（英雄们有的正常技能）：Flame Burst (火焰爆裂), Tier-3 Strength Enhancement (三阶力量强化)。
  - *主角的外挂版*（霸道、不讲理）：[Absolute Nullification] (绝对无效化), SSR-Rank: Devourer of Light (SSR级：噬光者), Override: Life Drain (最高覆写权：生命吸取)。

**AI 动作要求**：在为主体生成名称时，必须考虑其在世界观中的立场。如果它是由公会赞助的，名字越神圣反讽效果越好；如果是属于主角系统的，名字越打破常规、带有外挂色彩越好。',
  '## Entity Naming Guide — Superhero / Cape Fiction

In this genre, names are often used as **tools of satire**. The heroes'' aliases are overwhelmingly righteous and bright, while the system or the protagonist''s aliases are filled with digital aesthetics, a sense of incompletion, or extreme violent beauty.

### 1. Hero Alias Naming Logic

Divided into two extremes:
- **Top Hypocritical Heroes (Megacorp Heroes)**: Their aliases are meticulously designed by corporate PR departments. They must reek of the "American Dream, hope, stars, and divinity."
  - *Naming Preference*: [Righteous Adjective/Element] + [Mythological/Hierarchical Term]
  - *Examples*: Homelander, Starlight, Solar Aegis, The Apex, Radiant Savior.
- **Underground Vigilantes / Anti-Hero MC**: Names are highly metaphorical, usually related to death, system error codes, or lowly, discarded status.
  - *Naming Preference*: [Mechanical/Marginalized Term] + [Termination/Error Theme]
  - *Examples*: Null, System Error, The Janitor, Butcher, Zero-Point.

### 2. Factions and Guilds Naming Logic

The names of Guilds and Megacorps should sound imposing and invincible, carrying an overwhelming aura of capital.
- **Megacorporations**: Usually short, sounding like real modern multinational corporations.
  - *Examples*: Vought International, Genesis Corp, Pinnacle Heroics, The Vanguard Trust.
- **Black Market / Syndicate Factions**: Sound like gangs or carry destructive ideological weight.
  - *Examples*: The Rust Syndicate, Tartarus Outcasts, Shadow-Net Brokerage.

### 3. System & Skills Naming Logic

The system''s name is the protagonist''s golden cheat. It must have a cold, higher-dimensional mechanical feel. The skill names reflect the power tiers.
- **System Names**: Usually carry implications of plundering, leveling, or judgment.
  - *Examples*: The Plunder System, Villain Roleplay Interface, God-Slayer OS.
- **Skill Strings**: Carrying a heavy Cyber/LitRPG aesthetic.
  - *Standard Tier* (normal skills heroes have): Flame Burst, Tier-3 Strength Enhancement.
  - *Protagonist''s Cheat Tier* (domineering, logic-defying): [Absolute Nullification], SSR-Rank: Devourer of Light, Override: Life Drain.

**AI Action Requirement**: When generating a name for an entity, you MUST consider its standpoint in the worldview. If it is sponsored by a Guild, the holier it sounds, the better the satirical effect; if it belongs to the protagonist''s system, the more rule-breaking and "cheat-like" it sounds, the better.',
  (SELECT id FROM novel_creation_method WHERE name = 'Superhero / Cape Fiction Novel' LIMIT 1),
  1,
  103,
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
