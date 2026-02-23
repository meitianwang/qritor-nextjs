-- 民间灵异故事创作「实体命名」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-entity-naming',
  '实体命名：为民间灵异故事创作中的角色、场景、道具等实体提供符合中国民俗文化的专业命名指导，区分普通人、灵异存在与法师的命名规范',
  '"Entity Naming": Provide Chinese folk culture naming guidance for characters, locations, and props in folk horror stories, distinguishing ordinary people, supernatural entities, and ritual practitioners',
  '## 实体命名 — 民间灵异故事创作

民间灵异故事的实体命名核心是**真实感与民俗感**。角色名要让读者相信这是真实的人（普通的农村人名）或真实的民间鬼怪（有来历、有故事的名字）。场景名要有地域感和历史感。道具名要来自中国传统民俗，不能出现日式或西方的元素。

---

## 一、角色命名

### 普通村民/农村人物（真实感系）

这类角色是民间灵异故事的"地基"，名字要朴实、有地方感：

**中原/北方风格**：
- 男性：张大爷、李铁柱、王二狗、老黑、赵三
- 女性：翠花、秀芬、桂兰、改霞、六婶
- 老年人：多用辈分称呼（大爷、二奶、老黑叔）而不是名字，更有真实感

**湘西/苗寨风格**：
- 汉化苗族名：多音节（阿妹、阿尤、龙七），或汉名中带地方特色
- 法师/巫师：有传承感（某某术士传几代）

**东北风格**：
- 男：大强、铁蛋、二憨、老刘头
- 女：翠花、香秀、淑芬

**规律**：名字要接地气，完全符合当地真实起名习惯，不能有"现代精英感"（如陈哲、王俊凯）

### 现代人主角（当代感系）

现代背景的主角（进城打工者、大学生下乡等）：
- 普通现代名即可（可略带个性）：张明、李辉、陈晨、苏晓月
- 外来者的普通感正好与当地的民俗感形成对比

### 灵异存在（来历感系）

这是民间灵异故事命名最有讲究的部分。灵异存在的名字要有**来历感**，让读者相信这个存在有它自己的故事：

**以地名为名**（最常见、最有真实感）：
- 居住地的地名（老宅的那只、古井边上来的那个）
- 有时不给名字，只有称谓（那个东西、老宅里的、井底的）

**以特征/外貌为名**：
- 描述性（断腿的、哑姑、白衣女）
- 这类称呼来自村民的口耳相传，有真实的口语感

**以节气/天干地支/动植物为名**（有来历、有仪式感）：
- 节气：夏至、清明、冬月（以死亡时间为名）
- 天干：甲子、丙午（道士或老鬼用）
- 动植物：黑柳（柳树旁死去的）、蒿草（荒坟上长的）

**仿古名**（有来历的老鬼用）：
- 简单两字，朴实有古味：苦娘、哑姑、老铁头、枯骨婆

**绝对避免**：
- ❌ 日本鬼名风格（贞子、花子、四百年的守门人）
- ❌ 西方恐怖名字（莎拉、玛丽）
- ❌ 现代名字（一看就是虚构的人物）
- ❌ 太戏剧化的名字（血女、魂灵之王——不像民间传说，像小说）

### 道士/法师/术士（专业感系）

有道号或传承感：
- 道号：白云子、铁山道人、青阳子、无极老道
- 民间称谓：王道士、张师父、苦禅和尚（身份+姓）
- 代际传承感：第几代（如"我师父的师父那代就碰见过这个"）

---

## 二、场景命名

### 自然地理（阴邃感）

地名要让读者感受到阴邃、荒凉、有故事：

**有禁忌感**：
- 枯骨岭（骨气暗示）、望乡台（传说死者驻足）、不归林、绝户坟地
- 名字本身就带着不吉利的历史（村民起这个名必有原因）

**有历史感**：
- 百年老松旁、无名河（没有名字本身就诡异）、三岔路口
- 有时不起名反而更恐怖（"村东头那片地"比"阴魂地"更真实）

**有地域感**：
- 结合真实的地方地理特征（湘西的溶洞、东北的林场、岭南的湿地）

### 人文场所（历史沧桑感）

**祠堂/庙宇**：
- 姓氏祠堂（王家祠堂、陈氏宗祠）
- 地方神庙（土地庙、城隍庙、关帝庙）——具体到庙号更有真实感

**旧宅/老建筑**：
- 带年代感（百年老宅、三代之前的院子、民国时的地主庄园）
- 带主人历史（某某家的老宅子）

**特殊场所**：
- 乱葬岗（有明确历史背景的，如战乱或瘟疫时的）
- 废弃的学校、厂房（现代灵异故事）

---

## 三、道具命名

民间灵异故事的道具来自中国传统民俗，不能出现日式或西方元素。

### 传统驱邪道具

| 道具 | 命名规范 |
|------|---------|
| 桃木制品 | 桃木剑、桃木符、桃木橛子 |
| 朱砂类 | 朱砂符、朱砂镇宅符、血朱砂 |
| 铜器类 | 镇煞铜镜、八卦铜镜、铜铃 |
| 纸钱/纸扎 | 冥币、阴司纸钱、纸马（地域各有不同叫法） |

### 有来历的特殊道具

名字要体现道具的来历或传承：
- 地域+功能：苗寨降头符、湘西蛊毒药、客家厌胜符
- 传承感：百年老桃木（几百年老树制的）、祖传驱邪镜
- 历史人物关联：某某道长留下的、某庙里镇庙的宝贝

### 道具命名忌讳

- ❌ 日式符咒名（御守、绘马、式神）
- ❌ 西方法器（圣水、十字架）
- ❌ 玄幻/修真道具名（法宝、法器、仙器——太玄幻，不像民俗）
- ❌ 自造无来历的名字（随便起一个听起来很厉害的名字，没有民俗根基）

---

## 常见错误

- ❌ 灵异存在起日本鬼怪式名字（破坏中国民俗感）
- ❌ 普通村民起现代精英名字（王博士、李教授——不符合乡村真实感）
- ❌ 场景名太过文学化反而失去真实感（"鬼气弥漫之所"比"村东头那片地"更假）
- ❌ 道具名来自日本或西方民俗
- ❌ 所有鬼怪都用相似的命名模式（全是两字仿古名），缺乏多样性
- ❌ 道士/法师没有专业感的道号或传承称呼（直接叫"驱鬼人"）',
  '## Entity Naming — Chinese Folk Horror / Anomaly Stories

Core: **authenticity + folk cultural feel**. Character names should feel like real people (ordinary rural names) or real folk entities (names with backstory and provenance). Location names need regional history. Prop names must come from Chinese folk tradition.

---

## I. Character Naming

### Ordinary Villagers (Authentic feel)

Plain, regionally specific names:
- **Central/North**: Zhang Daye, Li Tiezhu, Wang Ergou (males); Cuihua, Xiumei, Guilan (females)
- **Xiangxi/Miao**: Multi-syllable or sinicized names (A Mei, A You, Long Qi)
- **Northeast**: Da Qiang, Tie Dan (males); Cuihua, Xiang Xiu (females)
- Elderly often referred to by kinship terms (Elder Wang, Second Granny) rather than names

### Modern Protagonist

Ordinary modern names — their plain quality contrasts with the local folk atmosphere (Zhang Ming, Li Hui, Su Xiaoyue)

### Supernatural Entities (Provenance feel)

Most important and nuanced category. Names must feel like they came from oral folk tradition:
- **Place-origin names**: The thing from the old mansion, the one by the ancient well (sometimes no name is scarier)
- **Physical characteristic names**: The Limping One, Mute Girl, White Robes
- **Seasonal/cyclical names**: Xiazhi (Summer Solstice — died on that day), Jiaozi (stems and branches)
- **Simple classical names**: Ku Niang (Bitter Woman), Ya Gu (Mute Girl), Lao Tietou

**Never**: Japanese ghost names (Sadako, Hanako), Western names, dramatically invented names ("Blood Queen")

### Ritual Practitioners

Dao titles or professional designations: Baiyun Zi, Tieshan Daoren, Wang Daoshi (Daoist Wang)

---

## II. Location Naming

- **Foreboding nature**: Names implying dark history (Skeleton Ridge, Wangxiang Lookout, No-Return Forest)
- **Historical human sites**: Clan ancestral halls (Wang Family Shrine), regional temples (Earth God Temple)
- **Old structures**: With age and owner history (The Hundred-Year Old House, Landlord Zhang''s Old Compound)
- Note: Sometimes no name is scarier ("that plot of land east of the village")

---

## III. Prop Naming

Must come from Chinese folk tradition:
- **Peach wood items**: Peach wood sword, peach wood talisman
- **Cinnabar items**: Cinnabar talisman, cinnabar ward
- **Bronze items**: Demon-suppressing bronze mirror, Eight Trigrams mirror
- **Regionally inherited**: Miao voodoo talisman, Hakka warding charm
- **With provenance**: Century-old peach wood (from a hundred-year-old tree), the temple''s consecrated treasure

**Never**: Japanese charms (omamori, ema), Western items (holy water, crucifix), xianxia-style "spiritual treasures"

---

## Common Errors

- Supernatural entities given Japanese ghost names
- Village characters given modern professional names (Dr. Wang, Professor Li)
- Overly literary location names that feel less real than plain speech
- Props from Japanese or Western folk traditions
- All ghosts using identical two-character classical name format
- Ritual practitioners without professional titles or lineage references',
  (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1),
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
