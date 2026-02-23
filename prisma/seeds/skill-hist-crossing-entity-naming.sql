-- 历史人物穿越小说「实体命名」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-hist-crossing-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'hist-crossing-entity-naming',
  '实体命名：为历史人物穿越小说中的角色、场景、势力等实体提供符合历史朝代规范的专业命名指导，区分真实历史名称与架空创作名称',
  '"Entity Naming": Provide period-accurate naming guidance for characters, locations, and factions in historical figure crossing novels, distinguishing between historical names and fictional ones',
  '## 实体命名 — 历史人物穿越小说

历史人物穿越小说的实体命名面临独特挑战：**真实性与创作性的平衡**。真实历史人物和地名有严格约束，而架空配角和虚构场所则必须符合所在历史时期的命名规范，两类元素并存于同一故事中，名称风格必须保持一致的历史质感。

---

## 一、角色命名

### 历史真实人物（硬约束）

- **使用历史真实姓名，不可创造或更改**
- 同一历史人物有多个称谓时，选择在故事时间段内最通用的称谓：
  - 李世民在即位前，臣下称"秦王"，即位后称"圣上"或以年号"贞观"指代
  - 历史人物的字号在正式/亲密场合有不同使用规范（如苏轼字子瞻，亲友可称字）
- **绝对错误**：给历史人物安错姓氏、写错名字（如将李渊写成李源）、用错字号

---

### 架空配角命名（核心规则）

**必须参照故事所处历史时期的命名规范**：

| 朝代 | 姓名特征 | 典型示例 |
|------|---------|---------|
| **先秦 / 汉代** | 单字名为主，双字名稀少 | 项羽、刘邦、张良、陈平 |
| **魏晋南北朝** | 单字名为主，少数双字；有字号习惯 | 曹操（字孟德）、司马懿（字仲达） |
| **唐代** | 单字名常见；文人重字号；意象词入名 | 李白（字太白）、杜甫（字子美） |
| **宋代** | 双字名渐多；文人雅号盛行；武人名质朴 | 苏轼（字子瞻）、岳飞（字鹏举） |
| **明代** | 双字名为主流；朱氏皇族严格字辈制度 | 朱允炆（炆字辈）、徐达、戚继光 |

**朝代细则**：

**唐代架空配角**：
- 文官雅士：意象词入名，多用玉、云、青、墨等字（如崔云墨、李青砚）
- 武将边将：质朴有力的词（如王铁柱、张勇），也有豪气意象（如马惊涛）
- 宦官：多无字号，名字有时较奇特（历史上有王承恩、高力士等）
- 女性：带花草香料意象（如秋娘、桂娘、芙蓉），也有雅名（如婉仪、容娘）

**宋代架空配角**：
- 士大夫：名字雅致，有字号习惯（如林怀礼，字子敬）
- 武人：质朴直白（如牛大、铁牛、王猛），也有带豪气的词
- 商人：带财货气息（如金宝、四海）

**明代架空配角**：
- 汉人官员：双字名，较少用生僻字（如赵廷礼、钱惟忠）
- 朱氏旁支：严格字辈，字辈表有明确规定，不可随意使用
- 锦衣卫/特务：平实名字，部分有代号（如"影一"）

---

### 姓氏多样化原则

不要让全书角色都姓"李""王""张"。结合故事背景选用：

- **唐代**：崔、卢、郑、王、李（五姓七望，高门望族）；寒门多朴实大姓
- **宋代**：苏、欧阳（复姓）、范、王、赵
- **明代**：朱（皇族）、徐、戚、袁、魏
- **少数民族背景**：可有汉化的少数民族姓名（如慕容、宇文、赫连适用于南北朝背景）

---

## 二、场景命名

### 历史真实地名（优先使用）

| 朝代 | 首都 | 重要城市 |
|------|------|---------|
| 汉代 | 长安（西汉）/ 洛阳（东汉） | 成都、江陵、邯郸 |
| 唐代 | 长安 | 洛阳（东都）、扬州、成都、凉州 |
| 宋代 | 汴京（东京）/ 临安（南宋） | 苏州、杭州、明州 |
| 明代 | 北京（京师）/ 南京（应天府） | 苏州、杭州、西安（长安） |

**注意**：同一地理位置在不同朝代的官方名称不同，需严格对应。

---

### 架空场所命名（参照历史建制）

**宫城与官署**：
- 宫殿多用方位 + 吉祥词：乾清宫、坤宁宫、养心殿（明清）；太极宫、大明宫（唐）
- 六部衙门：礼部、吏部、兵部、刑部、户部、工部（各朝叫法略有差异，需核对）
- 特殊机构（明代）：司礼监、东厂、西厂、锦衣卫（不可用于其他朝代）

**民间里坊与街市**：
- 唐代实行里坊制：以坊为单位（永宁坊、平康坊、西市）
- 宋代开放街市制：以街、巷、桥命名（相国寺附近、潘楼街、御街）
- 明清院落：以园、院、府、宅命名（国公府、某宅、花园）

**地理与军事**：
- 真实山川优先（渭水、黄河、太行山、祁连山）
- 架空关隘参照历史风格：XX关（雁门关式）、XX寨、XX营

---

## 三、势力命名

### 朝廷官方派系

- 以领袖人物或政治立场命名：太子党、秦王府旧部、清流派、阉党
- 不要使用现代政治术语（如"改革派""保守派"虽直观，但历史感弱）
- 参照故事所在朝代的实际政治生态选词

### 历史上真实存在的派系（直接使用原名）

- 唐初：太子建成一党、秦王李世民府旧部
- 北宋：新党（王安石变法派）、旧党（苏轼等保守派）
- 明末：东林党、阉党、浙党

### 武林 / 民间势力

历史穿越中武林势力要比纯武侠更贴近历史感：
- 带地域性：关中义士、江南盐帮、河北豪杰
- 带历史感：结合真实存在的帮会文化（漕帮、绿林）
- **避免**仙侠风格命名（"天剑宗""碧水派"在历史穿越中严重违和）

---

## 常见错误

- ❌ 历史人物写错姓名或字号（将李世民写成"李世文"）
- ❌ 朝代官职混用（宋朝角色担任明朝才有的"锦衣卫"）
- ❌ 架空配角用了错误时代的命名风格（汉代人取宋代式的双字名）
- ❌ 宫殿机构名称张冠李戴（用唐代宫殿名写宋代故事）
- ❌ 江湖势力全用仙侠风格命名（历史穿越中"天剑宗"严重违和）
- ❌ 所有角色都姓"李""王""张"，缺乏姓氏多样性
- ❌ 唐代五姓七望的贵族配角不用望族姓氏（崔、卢、郑），错失阶层质感
- ❌ 女性角色全用花名（芙蓉、桃花、梅儿），缺乏差异化',
  '## Entity Naming — Historical Figure Crossing Novel

The core challenge is balancing **authenticity and creativity**: real historical figures and places have strict constraints, while fictional characters and locations must conform to the naming conventions of the target historical period.

---

## I. Character Naming

### Real Historical Figures (Hard Rule)

Use their actual historical names — no alterations. When a figure has multiple titles, use the one appropriate to the story''s time period.

### Fictional Supporting Characters (Core Rules)

Must follow the naming conventions of the story''s historical era:

| Dynasty | Name Characteristics |
|---------|---------------------|
| Han | Single-character given names predominate |
| Tang | Single-char common; literary figures use courtesy names (zi) |
| Song | Two-char names increasing; scholars have elegant courtesy names |
| Ming | Two-char names standard; Zhu clan has strict generational characters |

**Surname diversity**: Don''t let all characters share a few common surnames. Use historically appropriate clan names for the setting.

---

## II. Location Naming

- **Real place names first**: Use the historically accurate name for the dynasty in question (same location may have different official names in different dynasties)
- **Fictional official buildings**: Follow the bureaucratic naming patterns of the era (six ministries, palace hall names)
- **Civilian areas**: Tang uses ward/fang system; Song uses open street system; Ming uses courtyard/residence naming

---

## III. Faction Naming

- Court factions: named after leaders or political stance
- Martial/folk groups: geographic + historical feel, avoid xianxia-style sect names
- Use actual historical faction names where they apply

---

## Common Errors

- Wrong historical figure names or titles
- Mixing official titles across dynasties
- Fictional characters with wrong-era naming styles
- Xianxia-style sect names in historical settings
- All characters sharing only a few common surnames',
  (SELECT id FROM novel_creation_method WHERE name = '历史人物穿越小说' LIMIT 1),
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
