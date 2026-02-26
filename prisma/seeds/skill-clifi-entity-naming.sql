-- Cli-Fi / Climate Fiction Novel「名物命名 Entity Naming」生成技能
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'clifi-entity-naming',
  '层级3(Domain Knowledge) - 「名词生成指南」：指导废土末日下幸存者绰号、寡头领地、巨型风暴与变异生物的起名规范',
  'Layer 3 (Domain Knowledge) - "Entity Naming Guide": Guide for generating survivor monikers, warlord territories, mega-storms, and mutated fauna in a wasteland setting',
  '## 专有名词生成指南 (Entity Naming) — 气候幻想 (Cli-Fi)

在一个失去文明教育的末日世界，名词应该是**极其直白、粗俗且依靠外观/功能来命名的**。因为活着就很艰难了，没人会去起充满诗意的名字。

### 1. 人物代号 (Scavengers & Barons)

末日的人很少用出生时的真实姓名，通常用身上的特征或职业作为代号。
- **废土拾荒者 (Scavengers)**：反映出他们低贱、顽强的生存状态。
  - *命名偏好*：[废品名词/身体缺陷] + [职业词汇]
  - *案例*：Rust-Eye (铁锈眼), Oil-Spill Max (溢油麦克斯), The Pipe (管子哥), Two-Fingers (两指), Scap-Rat (废料耗子)。
- **水阀霸主/寡头 (Warlords/Oligarchs)**：极其霸凌，彰显他们垄断的资源，带有原始部落式的崇拜感。
  - *案例*：Immortan Joe (不死老乔 - 《疯狂麦克斯》), The Water Duke (水公爵), Baron Air (空气男爵), Chief Rad (辐射酋长)。

### 2. 地点与领地 (Territories & Ruined Cities)

地点必须体现出"被扭曲的旧文明遗迹"。通常是旧世界的名称读错了，或者是根据毁坏后的外观重新命名的。
- **废弃遗址被重新命名**：
  - *案例*：把旧金山拼错叫成 "San-Fran-Sik" (通常带有生病 sick 的双关语); 将被沙埋了半截的自由女神像地带称为 "The Copper Spike" (生锈的纯铜尖刺)；一个被当作堡垒的废弃大型沃尔玛超市叫 "The Great Wall-Mart Hub"。
- **军阀驻地：狂野粗暴**：
  - *案例*：Bullet Farm (子弹农场), Gas Town (汽油镇), The Dry-Well (枯井要塞)。

### 3. 环境天灾与生物 (Mega-Storms & Mutants)

这种极端的自然力量应该具有一种"神话般的恐惧感"。
- **气候风暴/灾难**：不用气象学名字，用迷信和恐惧来命名。
  - *案例*：The Ash-Blind (致盲灰暴), The Bleeding Rain (泣血酸雨), The Hundred-Year Dry (百年大旱)。
- **变异生物/机械怪兽**：根据它们的杀人方式或恐怖外观直白命名。
  - *案例*：Sand-Crawlers (沙地爬行者 - 变异巨蜥), Rust-Hounds (铁锈猎犬 - 用电锯和狗尸体改造成的半机械保镖), Glass-Spiders (玻璃蜘蛛 - 能在极热沙地隐形的变异虫)。

**AI 动作要求**：在生成任何专有名词时，请务必保证其带有【工业生锈感】、【物资匮乏的直白感】或是【对旧时代遗物的误解和崇拜】。绝对不要使用华丽的魔法词汇或古典文学词汇。',
  '## Entity Naming Guide — Cli-Fi / Climate Fiction

In a post-apocalyptic world stripped of civilized education, nouns should be **extremely blunt, crude, and based entirely on visual or functional appearance.** Since just staying alive is hard enough, nobody has the energy to invent poetic names.

### 1. Character Aliases (Scavengers & Barons)

People in the apocalypse rarely use their birth names; they use monikers derived from physical traits or wasteland professions.
- **Wasteland Scavengers**: Their names reflect their lowly, tenacious survival status.
  - *Naming Preference*: [Junk Noun/Physical Defect] + [Profession/Action Term]
  - *Examples*: Rust-Eye, Oil-Spill Max, The Pipe, Two-Fingers, Scrap-Rat.
- **Warlords / Resource Oligarchs**: Extremely bullying and domineering, showcasing the vital resources they monopolize with a sense of primitive tribal worship.
  - *Examples*: Immortan Joe (from *Mad Max*), The Water Duke, Baron Air, Chief Rad.

### 2. Locations & Territories

Locations must reflect the "twisted remnants of old civilization." Usually, they are mispronunciations of old-world names or bluntly renamed based on their ruined appearance.
- **Re-named Ruins of the Old World**:
  - *Examples*: Misspelling San Francisco into "San-Fran-Sik"; renaming a half-buried Statue of Liberty as "The Copper Spike"; a gigantic abandoned Wal-Mart repurposed as a fortress called "The Great Wall-Mart Hub."
- **Warlord Citadels**: Wild, brutal, and industrial.
  - *Examples*: The Bullet Farm, Gas Town, The Dry-Well Citadel.

### 3. Catastrophes & Biological Anomalies (Mega-Storms & Mutants)

These extreme natural forces should carry a sense of "mythological dread."
- **Climate Storms / Disasters**: Do not use meteorological terms. Use names born of fear and superstition.
  - *Examples*: The Ash-Blind, The Bleeding Rain (acid rain), The Hundred-Year Dry.
- **Mutated Fauna / Cyborg Beasts**: Bluntly named strictly based on how they kill people or how terrifying they look.
  - *Examples*: Sand-Crawlers (mutated giant lizards), Rust-Hounds (cyborg bodyguards frankensteined from dog corpses and chainsaws), Glass-Spiders (mutant insects capable of thermoptic camouflage on boiling sand).

**AI Action Requirement**: When generating any proper noun, you MUST ensure it carries a [Rusty Industrial Vibe], a [Bluntness born of Resource Scarcity], or a [Misguided Worship/Misunderstanding of Old-World Relics]. Absolutely DO NOT use ornate magical vocabulary or classical literature terms.',
  (SELECT id FROM novel_creation_method WHERE name = 'Cli-Fi / Climate Fiction Novel' LIMIT 1),
  1,
  103,
  NOW()
)
ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
