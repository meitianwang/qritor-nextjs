-- The Ruthless Protagonist Novel "Entity Naming" skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-ruthless-protag-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruthless-protag-entity-naming',
  '「实体命名」领域知识：为 Grimdark & Anti-Hero 小说中的角色、场景、势力组织提供符合黑暗奇幻美学的专业命名指导，覆盖 character、scene、organization 三类实体',
  '"Entity Naming" domain knowledge: naming guidance for characters, scenes, and factions in Grimdark & Anti-Hero fiction, covering the character, scene, and organization entity categories',
  '## 「实体命名」领域知识 — The Ruthless Protagonist Novel

Grimdark 小说的实体命名核心：**名字应该像伤疤一样——短、粗糙、有故事**。好的 grimdark 名字不华丽、不优雅，它们听起来像是从泥土和血液中诞生的。名字应该让读者在听到的瞬间就能感受到这个世界的质感。

---

## 一、角色命名

### 主角命名规范

Grimdark 主角的名字不应该是英雄式的响亮名字。它们应该：
- **简短有力**：1-2 个音节为佳（Kell, Logen, Jorg, Glokta）
- **粗糙感**：辅音重、发音有力度（硬辅音 k, g, z, r 优于软辅音 l, m, n）
- **不华丽**：避免精灵式的优雅长名（Aelindorian）或过度异域化
- **可能有绰号**：绰号往往比本名更有辨识度（"The Bloody-Nine", "The Thorn"）

**好的主角名**：Kell, Logen, Durzo, Jorg, Ferro, Monza
**差的主角名**：Aelrindel, Thalorion, Starkillian, Shadowblade

### 反派/对手命名规范

反派的名字应该暗示权力和威胁：
- **权力头衔感**：可以用头衔代替本名（The Magus, The Cripple, Lord Sult）
- **文雅外表下的危险**：名字可以显得优雅（暗示虚伪正义或贵族血统），形成与本性的反差
- **避免"邪恶标签"名**：不要叫 Darkblood, Shadowkill, Evilord——太直白会降低威胁感

**好的反派名**：Bayaz, Khalul, Glokta, Sult
**差的反派名**：Lord Darkevil, Shadowlord the Merciless

### 炮灰/配角命名规范

即将被牺牲的角色也需要真实感：
- **普通名字**：用这个世界中常见的名字，不要为了"不重要"就起随便的名字
- **一个记忆点**：给他们一个读者能记住的特征（结巴的 Rews, 瘸腿的 Collem）
- **命名经济**：次要角色不需要全名 + 姓氏 + 头衔，一个名字就够了

### 角色命名通用规则

| 规则 | 说明 |
|------|------|
| 避免谐音混淆 | 不要在同一阵营有 Kael 和 Kell、Theron 和 Therin |
| 文化一致性 | 同一地区/种族的角色名字应该有语言学上的相似感 |
| 辅音偏好 | Grimdark 名字倾向硬辅音（Gorst, Bethod）而非软辅音（Lalaiel, Melantha） |
| 长度控制 | 主要角色 1-3 音节，极少超过 3 音节 |
| 绰号系统 | 重要角色可以有绰号，但全书绰号不超过 5-6 个，否则读者记不住 |

---

## 二、场景命名

### 权力中心（Power Seats）

权力所在地的名字应传达统治和压迫感：
- **简洁 + 威胁**：用暗示力量或暴力的词汇（The Agriont, Adua, Styria, The Citadel）
- **历史感**：名字暗示这个地方有漫长的历史（"the old city", "the first fortress"）
- **具体化**：避免太通用的名字（"The Dark Castle"太模板化），用有独特感的词

**好的名字**：The Agriont, Dagoska, The House of the Maker
**差的名字**：Dark Fortress, Shadow Castle, Evil Tower

### 战场/荒野

战场和荒野的名字应该有死亡和荒凉感：
- **以事件命名**：用历史事件给地方命名最有真实感（The Killing Fields, Dunbrec, the Dry Side）
- **地理特征 + 情感色彩**：结合地形和暗示（The High Places, The Broken Coast, The Wastes）
- **民间称呼**：当地人怎么称呼这个地方比官方名字更有 grimdark 感（"那个没人回来的地方"比"死亡之谷"更真实）

### 黑市/地下场所

非法或危险场所的名字应该有街头智慧感：
- **讽刺式命名**：一个危险的地方叫 "The Sanctuary" 或 "Rest Easy Inn"——反差产生黑色幽默
- **地标性命名**：用建筑特征（"Under the Bridge", "The Pit", "The Hole"）
- **简称/行话**：地下场所往往有非官方的简称

### 场景命名通用规则

| 规则 | 说明 |
|------|------|
| 避免描述性名字 | "The Scary Dark Forest" 不如 "The Whispers"——名字暗示，不描述 |
| 规模感与名字匹配 | 帝国首都的名字应比村庄更有重量感 |
| 地理一致性 | 同一地区的地名应有语言学关联（像真实世界的地名一样） |
| 情感暗示 | 名字本身应让读者感受到这个地方的气氛（安全/危险/绝望） |

---

## 三、势力命名

### 军事势力

军事组织的名字应暗示暴力和纪律：
- **简称/番号**：真实军事风格（The Fifth, The First of the Magi, The Steadfast）
- **以特征命名**：根据标志性特征（The Blackbloods, The Ironheads, The Gray Wolves）
- **以地域命名**：组织与地域绑定（The Northern Host, The Gurkish Army）

### 宗教/教团组织

宗教势力的名字应暗示意识形态的力量：
- **信条式命名**：名字本身是信条或教义（The Order of the Light, The Cult of the Long Eye）
- **简称在民间**：普通人不会用全称，会有民间简称或蔑称
- **正面名称掩盖阴暗**：越是危险的宗教组织，名字越可能听起来正义和光明（这本身就是一种讽刺）

### 犯罪/秘密组织

地下势力的名字应有街头威胁感或神秘感：
- **动物/自然意象**：The Spiders, The Crows, The Vipers
- **反讽式命名**：一个残忍的组织叫 "The Charitable"——黑色幽默
- **极简命名**：只用一个词或短语，不解释（The Ring, The Board, The Firm）

### 贵族/政治势力

贵族家族和政治势力的名字应暗示历史传承和权力：
- **家族姓氏**：以家族名为势力名（House Brock, House Glokta, The dan Luthar line）
- **领地关联**：势力名和领地绑定（The Crown of Midderland, Lords of the North）
- **权力符号**：名字中包含权力象征（The Iron Throne Council, The High Table）

### 势力命名通用规则

| 规则 | 说明 |
|------|------|
| 名字暗示意识形态 | 读者从名字就能猜出这个组织相信什么 |
| 民间称呼 vs 官方名 | 同一组织在民间和官方有不同称呼，增加世界真实感 |
| 避免太通用 | "The Evil Guild" 没有任何辨识度——名字应该独特到能被记住 |
| 名字与实际的反差 | 名字越正义，实际越黑暗——这是 grimdark 的经典手法 |

---

## 四、忌讳与多样化原则

### 绝对忌讳

- 不要在名字中直接使用 Dark, Evil, Shadow, Death 等"标签词"作为前缀——太直白会降低世界的真实感
- 不要给角色起现代地球名字（John, Mike, Sarah）除非世界设定是现代
- 不要所有角色名都遵循同一种语言学模式——现实世界中不同地区的名字有明显不同
- 不要忽略性别差异——同一文化中男性名和女性名应有可辨识的差异（但这个差异可以因文化而异）
- 不要给不重要的角色起太复杂的名字——读者记不住，分散注意力

### 多样化原则

- **地域分化**：不同地区的名字应有不同的语音特征（北方人名粗犷、南方人名柔和、游牧民族名短促）
- **阶层分化**：贵族名和平民名应有明显差异（贵族名长、有头衔；平民名短、有绰号）
- **历史演变**：古老角色的名字应该和年轻角色的名字有时代感差异
- **功能性命名**：名字要服务于叙事——如果两个角色经常同时出现，他们的名字不应该以同一个字母开头
- **音节多样性**：全书主要角色的名字在音节数和重音模式上应该有变化，避免读起来节奏单调',
  '## "Entity Naming" Domain Knowledge — The Ruthless Protagonist Novel

The core of grimdark entity naming: **names should be like scars — short, rough, and carrying a story**. Good grimdark names are not elegant or beautiful. They sound like they were born from dirt and blood. A name should make the reader feel the texture of the world the moment they hear it.

---

## I. Character Naming

### Protagonist Naming

Grimdark protagonists should NOT have heroic, ringing names. Their names should be:
- **Short and punchy**: 1-2 syllables preferred (Kell, Logen, Jorg, Glokta)
- **Rough-textured**: Consonant-heavy, forceful pronunciation (hard consonants k, g, z, r preferred over soft consonants l, m, n)
- **Not pretty**: Avoid elvish-style elegant long names (Aelindorian) or over-exoticized constructions
- **Likely to have an epithet**: Epithets often carry more recognition than given names ("The Bloody-Nine," "The Thorn," "The Whisper")

**Strong protagonist names**: Kell, Logen, Durzo, Jorg, Ferro, Monza, Caul Shivers
**Weak protagonist names**: Aelrindel, Thalorion, Starkillian, Shadowblade

**Name construction technique**: Start with the character''s core trait and find a sound that evokes it. A calculating schemer gets sharp, clipped sounds (Glokta). A brute-force survivor gets thick, heavy sounds (Logen). The name should "sound like" the character before the reader knows anything about them.

### Antagonist / Rival Naming

Antagonist names should signal power and threat:
- **Title-as-name**: Titles can replace personal names entirely (The Magus, The Cripple, Lord Sult). This creates distance and mystique.
- **Elegant surface, dangerous core**: Names can appear refined (suggesting false righteousness or aristocratic blood), creating contrast with the character''s true nature. The more civilized the name, the more unsettling the character''s brutality.
- **No "evil label" names**: Do not name characters Darkblood, Shadowkill, or Evilord. Obvious evil names reduce threat — true danger comes from characters whose names don''t warn you.

**Strong antagonist names**: Bayaz, Khalul, Glokta, Sult, The Weaver
**Weak antagonist names**: Lord Darkevil, Shadowlord the Merciless, Deathbringer

### Expendable / Supporting Character Naming

Characters who will be sacrificed still need authenticity:
- **Ordinary names**: Use names common in the world''s culture. Don''t give throwaway characters throwaway names — it signals to the reader that the character doesn''t matter, which kills the emotional impact of their death.
- **One memory hook**: Give them a single memorable trait tied to their name (stuttering Rews, limping Collem, one-eyed Foscar). When they die, the reader remembers the trait and feels the loss.
- **Naming economy**: Minor characters don''t need full name + surname + title. One name is enough. Reserve complex naming for characters who will recur.

### Universal Character Naming Rules

| Rule | Explanation |
|------|-------------|
| Avoid phonetic confusion | Don''t have Kael and Kell in the same faction, or Theron and Therin in the same chapter. Characters whose names look or sound similar will blur in the reader''s memory. |
| Cultural consistency | Characters from the same region/culture should have names that feel linguistically related — similar vowel patterns, consonant preferences, or naming conventions. |
| Hard consonant preference | Grimdark names lean toward hard consonants (Gorst, Bethod, Calder) over soft ones (Lalaiel, Melantha). The sound palette should match the world''s harshness. |
| Length control | Major characters: 1-3 syllables. Very rarely exceed 3. Long names feel out of place in grimdark prose — they slow the reading pace and feel too ornamental. |
| Epithet system | Important characters may have epithets, but limit to 5-6 across the entire book. More than that and readers lose track. Each epithet should be immediately evocative and unique. |

---

## II. Scene / Location Naming

### Power Seats

Names for seats of power should convey dominion and oppression:
- **Concise + threatening**: Use words implying force or violence (The Agriont, Adua, Styria, The Citadel)
- **Historical weight**: The name should imply the place has a long and likely bloody history. Old-sounding names with archaic roots work well.
- **Specificity**: Avoid generic names ("The Dark Castle" is a template, not a place). Use names that feel unique to THIS world.

**Strong names**: The Agriont, Dagoska, The House of the Maker, Carleon
**Weak names**: Dark Fortress, Shadow Castle, Evil Tower, The Palace of Doom

### Battlefields / Wastelands

Battlefield and wilderness names should carry death and desolation:
- **Event-named locations**: Naming a place after what happened there is the most authentic approach (The Killing Fields, Dunbrec, The Dry Side, Black Well)
- **Geography + emotional color**: Combine terrain features with implication (The High Places, The Broken Coast, The Wastes, The Crinna)
- **Folk names**: What locals call a place is more grimdark than the official name. "The place no one comes back from" is more real than "Death Valley."
- **Understatement**: The most terrifying locations often have the most mundane names. "The field" or "the old bridge" — the understatement implies that what happened there is so well-known it doesn''t need a dramatic name.

### Black Markets / Underground Locations

Illegal or dangerous locations should have street-smart naming:
- **Ironic naming**: A dangerous place called "The Sanctuary" or "Rest Easy Inn" — the contrast produces dark humor that feels authentic.
- **Landmark naming**: Named for physical features (Under the Bridge, The Pit, The Hole, The Slab)
- **Slang / shorthand**: Underground places have unofficial abbreviations and code names that insiders use and outsiders don''t understand.

### Universal Location Naming Rules

| Rule | Explanation |
|------|-------------|
| Evoke, don''t describe | "The Scary Dark Forest" is worse than "The Whispers" — names should suggest, not explain. |
| Scale matches weight | An imperial capital''s name should feel heavier than a village''s. More syllables, more historical resonance. |
| Geographic consistency | Place names in the same region should feel linguistically related, like real-world toponymy. |
| Emotional implication | The name alone should make readers sense the atmosphere: safe, dangerous, or hopeless. |

---

## III. Faction / Organization Naming

### Military Factions

Military organizations'' names should imply violence and discipline:
- **Designations / numbers**: Real military style (The Fifth, The Steadfast, The First of the Magi, Third Company)
- **Characteristic-based**: Named for a defining trait (The Blackbloods, The Ironheads, The Gray Wolves, The Named Men)
- **Region-based**: Organization tied to territory (The Northern Host, The Gurkish Army, The Union Army)
- **Reputation names**: What enemies call them is often more revealing than what they call themselves

### Religious / Cult Organizations

Religious factions'' names should imply ideological power:
- **Creed-as-name**: The name itself IS the doctrine (The Order of the Light, The Cult of the Long Eye, The Church of the Maker)
- **Folk shorthand**: Ordinary people don''t use the full name — they have colloquial abbreviations or derisive nicknames that reveal public sentiment
- **Righteous names hiding darkness**: The more dangerous the religious organization, the more likely its name sounds just and luminous. This irony IS the grimdark commentary. A benevolent-sounding name on a murderous organization is more chilling than "The Dark Cult."

### Criminal / Secret Organizations

Underground factions need street threat or mystery:
- **Animal / nature imagery**: The Spiders, The Crows, The Vipers — simple, predatory, memorable
- **Ironic naming**: A brutal organization called "The Charitable" or "The Merciful" — dark humor that simultaneously reveals the world''s cynicism
- **Minimalist naming**: One word or short phrase, no explanation needed (The Ring, The Board, The Firm, The Practice). The less the name explains, the more dangerous the organization feels.

### Noble / Political Factions

Noble houses and political factions'' names should imply legacy and power:
- **Family surname**: The family name IS the faction name (House Brock, House Glokta, The dan Luthar line)
- **Territory linkage**: Faction name bound to their domain (The Crown of Midderland, Lords of the North, The Open Council)
- **Power symbols**: Names containing power emblems (The Iron Throne Council, The High Table, The Closed Council)

### Universal Faction Naming Rules

| Rule | Explanation |
|------|-------------|
| Name implies ideology | Readers should be able to guess what the organization believes from its name alone. |
| Folk name vs. official name | The same organization having different names in different social contexts adds world authenticity. Nobles use the formal name; commoners use the nickname. |
| Avoid generic names | "The Evil Guild" has zero distinctiveness. Names must be unique enough to stick in memory after one encounter. |
| Name vs. reality contrast | The more righteous the name, the darker the reality — this is a classic grimdark technique. An organization called "The Protectors" that burns villages is more disturbing than one called "The Destroyers." |

---

## IV. Taboos and Diversity Principles

### Absolute Taboos

- Do not use Dark, Evil, Shadow, or Death as name prefixes. These are labels, not names. They flatten the world''s authenticity by signaling "this is the bad thing" instead of letting readers discover it.
- Do not use modern Earth names (John, Mike, Sarah) unless the world setting is explicitly modern. They shatter immersion in secondary-world fantasy.
- Do not have all character names follow the same linguistic pattern. In reality, different regions produce noticeably different naming conventions — your world should reflect this.
- Do not ignore gendered naming conventions within cultures. Men''s and women''s names should have recognizable differences within the same culture (though these differences can vary between cultures).
- Do not give unimportant characters overly complex names. Readers can''t remember them and it distracts from characters that matter.

### Diversity Principles

- **Regional differentiation**: Names from different regions should have distinct phonological profiles. Northern names should sound different from southern names — rougher vs. smoother, harder consonants vs. more vowels. This builds the world through sound alone.
- **Class differentiation**: Noble names and commoner names should be obviously different. Nobles get longer names with titles and lineage markers; commoners get short names with nicknames and occupational markers. A reader should sense a character''s social class from their name.
- **Historical layering**: Ancient characters'' names should feel stylistically different from young characters'' names — language evolves, and names from centuries ago should sound archaic.
- **Functional naming**: Names serve narrative. If two characters frequently appear together, their names should NOT start with the same letter or have similar syllable counts. The reader must be able to instantly distinguish who is who.
- **Syllabic variety**: Major characters'' names should vary in syllable count and stress pattern across the full cast. A book where every major character has a two-syllable name (Logen, Ferro, Bayaz, Jezal) needs at least one longer or shorter name to break the rhythm.',

  (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1),
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
