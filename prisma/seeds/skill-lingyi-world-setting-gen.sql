-- 民间灵异故事创作「世界」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-world-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-world-setting-gen',
  '「世界」设定生成：为民间灵异故事生成世界设定，包括世界名称、地理与风水格局、时代与社会背景、核心禁忌与规则、玄学/职业体系、灵异生态、民俗仪式、供奉与交易物',
  '"World" setting generation: generate world settings for Chinese folk horror stories, including world name, geography and feng shui configuration, era and social background, core taboos and rules, metaphysical practitioner system, supernatural ecology, folk rituals, offerings and transaction goods',
  '## 「世界」设定生成 — 民间灵异故事创作

「世界」是本创作方法最核心的 setting 类型（singleton），包含 8 个关键字段。每个字段都直接影响灵异故事的底层逻辑。

---

### 字段生成指南

#### 1. 世界名称

通常是一个具象的地点或代称。好的世界名称自带恐怖氛围。

命名风格参考：

| 类型 | 示例 | 效果 |
|------|------|------|
| 真实地名风格 | 「封门村」「九龙城寨」 | 真实感强，暗示「这可能是真事」 |
| 地理特征风格 | 「湘西迷雾」「三岔口」 | 自带地域文化色彩 |
| 时代+地域 | 「九十年代的东北老林」 | 时代感+地域感的双重代入 |

**避免**：过于抽象或文艺的名字（如「幽冥之境」），民间灵异需要接地气。

#### 2. 地理与风水格局

这是本类型的核心字段。不仅要描述地理位置，更要从风水玄学角度解释灵异为何滋生。

**填写框架**：
```
地理位置（XX省XX地区的XX村/镇/城区）
+ 风水特征（聚阴地/绝户地/三山夹一水/穿堂煞等）
+ 灵异成因（为什么这种格局会导致灵异事件）
```

**示例**：
「坐落在太行山深处的一个三面环山的盆地村落。村后是一座无名荒山，山上有一片十年不见阳光的阴松林。整个村子的格局是典型的''聚阴盆''——三面高山遮挡阳光，只有西面一个狭窄的出口，且出口正对一条干涸的古河道。风水上说这叫''阴气入，阳气不出''，是滋养阴物的天然温床。」

**常用风水术语**：
- 聚阴地、绝户地、三山夹一水
- 穿堂煞、门前种桑后种柳
- 坐南朝北背阴地、三岔路口
- 龙脉断裂、水口不收

#### 3. 时代与社会背景

时代选择直接影响恐怖氛围的营造方式。需要包含三个维度：

| 维度 | 说明 | 示例 |
|------|------|------|
| 时代特征 | 故事发生的年代 | 民国乱世、80年代改革开放前、现代都市 |
| 宗族势力 | 当地的家族控制程度 | 「整个村子都姓赵，族长说了算」 |
| 迷信程度 | 人们对超自然的信仰水平 | 「家家供奉土地爷，红白喜事必请道士」 |

**最佳恐怖时代**：
- **八九十年代农村**：信息封闭、宗族势力强、迷信氛围浓，是民间灵异的黄金时代背景
- **民国时期**：军阀混战+封建残余，适合写「大户人家的诅咒」类故事
- **现代都市**：反差最强——高楼大厦与古老禁忌的碰撞

#### 4. 核心禁忌与规则

这是灵异故事的「法律」，是整个叙事的基石。好的禁忌规则必须满足四个条件：

1. **具体明确**：不是「不能做坏事」，而是「天黑后走路不能回头」
2. **有内在逻辑**：禁忌背后有原因（回头会让鬼看到你的脸）
3. **容易被打破**：人物出于好奇/无知/贪婪会自然违反
4. **后果严重**：违反后的惩罚是推动剧情的核心动力

**示例**：
- 「每年七月半，村里人不出门、不点灯、不说话。如果听到有人叫你名字，绝对不能答应。」
- 「村口那棵老槐树下埋着东西，谁挖谁死。三代人都知道这个规矩。」
- 「老赵家的祠堂里有一口棺材，每七年必须换一个童子守棺。守棺人不能哭、不能笑、不能睡着。」

#### 5. 玄学/职业体系

描述这个世界中与灵异对抗的「专业人士」。关键是他们使用力量的「代价」。

| 职业 | 能力特征 | 代价 |
|------|---------|------|
| 出马仙 | 请神上身，借仙家之力驱邪 | 五弊三缺（鳏寡孤独残+钱命权） |
| 风水师 | 观龙脉、定穴位、布局化煞 | 泄露天机折寿 |
| 缝尸人 | 处理非正常死亡的尸体 | 沾染死气，阳寿渐短 |
| 赶尸人 | 引领亡魂归乡 | 不能沾活人气 |
| 扎纸人 | 制作纸扎法器、纸人 | 久而久之分不清阴阳 |

**关键提示**：民间灵异中的术士不是超级英雄。他们也会怕、也会犹豫、也会失手。力量越大，付出的代价越沉重——这就是「五弊三缺」的核心精神。

#### 6. 灵异生态

描述鬼怪的形式和等级。中式灵异的鬼怪有其独特的分类体系：

| 类型 | 特征 | 来源 |
|------|------|------|
| 怨灵/厉鬼 | 因怨气不散化为的恶灵 | 横死、冤死、含恨而死 |
| 大仙家 | 狐（狐仙）、黄（黄鼠狼）、白（刺猬）、柳（蛇）、灰（老鼠） | 修炼成精的动物 |
| 僵尸 | 实体化的不死尸体 | 尸变、风水邪地 |
| 祟 | 概念性的灾祸/诅咒 | 因果业力的具象化 |
| 替死鬼 | 需要找替身才能投胎的鬼魂 | 非正常死亡 |

#### 7. 民俗仪式

仪式感是恐怖氛围的主要来源。描述故事中特殊的民俗仪式。

**常见仪式素材**：
- 冥婚（给死人办婚事）
- 打生桩（建筑地基下活埋人/物以镇压）
- 请神/送神仪式
- 特殊的葬礼习俗（停灵、守夜、烧路引）
- 开坛作法（设坛驱邪）
- 还阴债（偿还前世欠下的债务）

**仪式设计要点**：每个仪式都必须有严格的步骤和禁忌，任何一步出错都可能导致灾难。

#### 8. 供奉与交易物

描述人与鬼、人与术士之间的「流通货币」：

| 交易对象 | 流通物 | 说明 |
|---------|--------|------|
| 人→鬼/仙家 | 香火、供品、冥币 | 供奉以求平安或庇佑 |
| 人→术士 | 金钱、人情 | 术士也要生活，有些是为现实所迫 |
| 鬼→人 | 寿命、阴德 | 被索取或交换 |
| 术士→鬼 | 超度、安置 | 了却因果，各得其所 |
| 骗子→人 | 恐惧、金钱 | 利用迷信行骗，也是故事的常见元素 |

---

### 生成要点

- 八个字段之间存在严格的因果推导关系：地理风水决定灵异成因，时代背景决定人物认知边界，核心禁忌是世界观的灵魂，灵异生态是规则下的产物，职业体系是对抗手段，仪式是人与灵异的界面，交易物是经济系统
- 地理与风水格局必须从玄学角度解释灵异为何在此滋生，不能只写地理位置
- 核心禁忌必须具体、有内在逻辑、容易被打破、后果严重
- 玄学职业体系中每个术士都必须有明确的能力代价
- 灵异生态中的鬼怪类型应与故事主题一致',
  '## "World" Setting Generation — Chinese Folk Horror Story

The "World" is the most critical setting type in this creation method (singleton), containing 8 key fields. Each field directly affects the underlying logic of the horror story.

---

### Field Generation Guide

#### 1. World Name

Usually a concrete place name or designation. A good world name carries its own horror atmosphere.

Naming style reference:

| Type | Example | Effect |
|------|---------|--------|
| Real place name style | "Fengmen Village," "Kowloon Walled City" | Strong realism; implies "this might be true" |
| Geographic feature style | "Xiangxi Mist," "Three-Way Junction" | Built-in regional cultural flavor |
| Era + region | "Northeast Old Forest in the 1990s" | Double immersion of era and locale |

**Avoid**: Overly abstract or literary names (e.g., "Realm of the Nether"). Folk horror requires grounded, earthy settings.

#### 2. Geography and Feng Shui Configuration

This is the genre''s core field. It must describe not just geography but explain from a feng shui perspective why supernatural phenomena breed there.

**Framework**:
```
Geographic location (XX village/town/district in XX region of XX province)
+ Feng shui characteristics (yin-gathering basin / barren-heir land / three mountains flanking one river / piercing-hall sha)
+ Supernatural causation (why this configuration leads to supernatural events)
```

**Example**:
"A basin village nestled deep in the Taihang Mountains, surrounded on three sides by peaks. Behind the village rises a nameless barren hill covered in a pine forest that hasn''t seen sunlight in a decade. The entire village layout is a classic ''yin-gathering basin'' -- three mountain faces block sunlight, with only one narrow exit to the west, directly facing a dried-up ancient riverbed. In feng shui, this is called ''yin enters, yang cannot leave'' -- a natural breeding ground for dark entities."

**Common feng shui terminology**:
- Yin-gathering land, barren-heir land, three mountains flanking one river
- Piercing-hall sha, mulberry before the door and willow behind
- South-facing-north behind yin land, three-way junction
- Dragon vein fracture, uncollected water mouth

#### 3. Era and Social Background

The era choice directly affects how horror atmosphere is crafted. Three dimensions are needed:

| Dimension | Description | Example |
|-----------|-------------|---------|
| Era characteristics | The time period of the story | Republican-era chaos, pre-1980s reform, modern urban |
| Clan power | Degree of family control in the locale | "The whole village is surnamed Zhao; the clan elder''s word is law" |
| Superstition level | People''s belief in the supernatural | "Every household worships the Earth God; Daoist priests are called for all births and deaths" |

**Best horror eras**:
- **1980s-90s rural China**: Information isolation, strong clan power, thick superstitious atmosphere -- the golden-age backdrop for folk horror
- **Republican era**: Warlord chaos + feudal remnants; suits "great house curse" type stories
- **Modern urban**: Strongest contrast -- collision between skyscrapers and ancient taboos

#### 4. Core Taboos and Rules

These are the "laws" of the horror story and the foundation of the entire narrative. Good taboo rules must satisfy four conditions:

1. **Be specific**: Not "don''t do bad things" but "don''t look back while walking after dark"
2. **Have internal logic**: There''s a reason behind the taboo (looking back lets the ghost see your face)
3. **Be easily broken**: Characters naturally violate them out of curiosity / ignorance / greed
4. **Have severe consequences**: Punishment for violation is the core driver of the plot

**Examples**:
- "Every Ghost Festival, villagers don''t go outside, don''t light lamps, and don''t speak. If you hear someone calling your name, never answer."
- "Something is buried under the old scholar tree at the village entrance. Whoever digs, dies. Three generations have known this rule."
- "In the Zhao family ancestral hall, there is a coffin. Every seven years, a new child must guard it. The coffin guardian must not cry, must not laugh, must not fall asleep."

#### 5. Metaphysical / Practitioner System

Describes the "professionals" in this world who combat the supernatural. The key is the **cost** of using their power.

| Practitioner | Ability | Cost |
|-------------|---------|------|
| Spirit medium (出马仙) | Channels spiritual entities to exorcise evil | Five afflictions and three deficiencies (widowhood, loneliness, childlessness, disability, early death + loss of wealth, fate, power) |
| Feng shui master (风水师) | Reads dragon veins, locates acupoints, configures sha-dispelling layouts | Revealing heavenly secrets shortens lifespan |
| Corpse stitcher (缝尸人) | Handles bodies from unnatural deaths | Absorbs death qi; yang life gradually shortens |
| Corpse herder (赶尸人) | Guides departed souls home | Cannot touch the living''s qi |
| Paper effigy crafter (扎纸人) | Creates paper ritual tools and effigies | Over time, loses ability to distinguish yin from yang |

**Key point**: Occult practitioners in folk horror are not superheroes. They too feel fear, hesitate, and fail. The greater their power, the heavier the price -- this is the core spirit of "five afflictions and three deficiencies."

#### 6. Supernatural Ecology

Describes the forms and hierarchy of ghosts and spirits. Chinese supernatural entities have their own unique classification:

| Type | Characteristics | Origin |
|------|----------------|--------|
| Vengeful spirit / fierce ghost (怨灵/厉鬼) | Evil spirits formed from unresolved resentment | Violent death, unjust death, death with hatred |
| Great immortal families (大仙家) | Fox, Weasel, Hedgehog, Snake, Rat | Animals that have cultivated to sentience |
| Jiangshi (僵尸) | Physically manifested undead corpse | Corpse transformation, feng shui evil ground |
| Sui / curse (祟) | Conceptual calamity or curse | Manifestation of karmic force |
| Substitute ghost (替死鬼) | Ghost that must find a replacement before reincarnating | Unnatural death |

#### 7. Folk Rituals

Ritual atmosphere is the primary source of horror. Describe the special folk rituals in the story.

**Common ritual materials**:
- Ghost marriage (冥婚): arranging a wedding for the dead
- Foundation burial (打生桩): burying a living person/animal under building foundations for suppression
- Deity invitation / sending ceremonies
- Special funeral customs (vigil, night watch, burning road-guiding paper)
- Altar ceremony (开坛作法): setting up an altar for exorcism
- Yin debt repayment (还阴债): repaying debts owed from a past life

**Ritual design points**: Every ritual must have strict procedural steps and taboos. Any misstep can lead to catastrophe.

#### 8. Offerings and Transaction Goods

Describes the "currency" between humans and ghosts, humans and practitioners:

| Transaction Parties | Currency | Description |
|-------------------|----------|-------------|
| Human → ghost/spirit | Incense, offerings, spirit money | Offerings in exchange for peace or protection |
| Human → practitioner | Money, favors | Practitioners have to make a living too |
| Ghost → human | Lifespan, yin merit | Extracted or exchanged |
| Practitioner → ghost | Transcendence, placement | Resolving karma; each gets what they need |
| Charlatan → human | Fear, money | Exploiting superstition for profit; also a common story element |

---

### Generation Notes

- The eight fields have strict causal derivation relationships: geography and feng shui determine supernatural causation, era determines characters'' cognitive boundaries, core taboos are the soul of the worldview, supernatural ecology is the product of rules, practitioner system is the means of confrontation, rituals are the interface between humans and the supernatural, transaction goods are the economic system
- Geography and feng shui must explain from a metaphysical perspective why the supernatural breeds there, not just describe the location
- Core taboos must be specific, internally logical, easily broken, and have severe consequences
- Every practitioner in the metaphysical system must have a clear cost for their abilities
- Ghost types in the supernatural ecology should be consistent with the story''s theme',
  (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1),
  1,
  70,
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
