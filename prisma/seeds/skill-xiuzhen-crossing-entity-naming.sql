-- 异世界修真穿越小说「实体命名」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xiuzhen-crossing-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiuzhen-crossing-entity-naming',
  '实体命名：为异世界修真穿越小说中的角色、场景、组织等实体提供符合道家美学与修炼体系的专业命名指导，区分俗家名与道号，正道与魔道',
  '"Entity Naming": Provide Daoist-aesthetic naming guidance for characters, locations, and factions in cultivation transmigration novels, distinguishing secular names from Dao titles, and righteous from demonic naming styles',
  '## 实体命名 — 异世界修真穿越小说

修真小说的实体命名有独特的双层结构：**俗家名与道号并存**。凡俗背景的角色有普通名字，入道后往往有道号；强者通常只以道号或尊号称谓。这种双层结构是修真小说区别于玄幻的重要特征，命名时必须维护这个体系。

---

## 一、角色命名

### 道号体系（核心规则）

修真角色的核心命名特征是**道号**，代替俗家名成为正式称谓：

**道号结构**：意象词 + 散人 / 真人 / 道人 / 道君 / 上人 / 子 / 老祖

| 修为层级 | 道号后缀 | 示例 |
|---------|---------|------|
| 初期修士（练气~金丹） | 散人、道人 | 清风散人、碧落道人 |
| 中期强者（元婴~化神） | 真人、上人 | 玄天真人、碧云上人 |
| 高阶强者（渡劫~大乘） | 道君、尊者 | 太清道君、苍穹尊者 |
| 顶级存在（飞仙、老祖） | 仙人、老祖、圣人 | 紫霄仙人、太古老祖 |

**道号前缀常用词**：
- 颜色+意象：玄、碧、青、紫、白、苍、黑（玄天、碧落、青云、紫霄）
- 自然意象：松、竹、梅、云、风、月、星（松云、竹风）
- 品德意象：清、净、虚、无、真、道（清虚、净真）

### 俗家名

- **穿越者主角**：来自现代，俗家名可以普通（李明、王浩、陈飞）或略带个性（叶辰、林枫），入道后起道号
- **土著修士**：俗家名参照古代中文命名风格，单字或双字均可；宗门弟子的俗家名可以带宗门特色（如某宗弟子多用山水意象）
- **凡俗平民**：朴实通俗（王铁柱、李大壮、翠花）

### 女性修士

- 修道气质：白鹿仙子、玉清师姐、天机子（道号体系同样适用）
- 俗家名：可以有温柔感（灵儿、月儿）也可以普通
- 强势女修/女魔：道号带煞气（煞月道君、血莲上人）

### 魔修/邪道

魔修的道号不遵循正道的意境，更强调煞气和黑暗：
- 前缀：血、煞、魔、幽、暗、邪、鬼
- 示例：血魔尊、煞魔老祖、幽冥道君、邪祖

### 多样化原则

- **道号不千篇一律**：不要全书道号都是"XX真人"，要根据修为层级用不同后缀
- **俗家名和道号风格分开**：俗家名可以普通，道号要有意境，不要让两者风格相同
- **阵营命名区分**：正道意象（青、玄、白、云）与魔道意象（血、煞、幽、暗）有明显差异

---

## 二、场景命名

### 修真圣地（仙门据点）

**宗门主峰/核心区域**：
- 有高远感和神圣感：凌霄峰、问道台、飞剑崖、望天台、虚极顶
- 功能性命名：藏经阁、炼丹峰、试剑场、传承殿

**修炼圣地**：
- 灵气丰盛感：灵泉洞、天池、紫气台、聚灵阵（带功能性）
- 神秘禁地：禁地通常不起名，或用简单恐怖的名称（死地、禁忌之地、不归境）

**外门/弟子区域**：
- 比内门低一档：外门峰、引气堂、新入峰

### 凡俗世界

**城镇**：朴实地名，与仙门截然不同，体现凡俗气息：
- 清源镇、白龙渡、铁匠铺街、集市、县城
- 不要用太有意境的名字（凡俗的城镇名不该比仙门还有仙气）

**凡人重要地点**：
- 集市、药材铺、客栈（这些地方普通朴实的名字更有真实感）

### 秘境/遗迹

**机缘秘境**：诱惑感和历史感：
- 古神秘境、天机洞天、上古遗迹、太古战场
- 可以带某人的名字（某某祖师的传承地）

**险地/禁区**：危险感：
- 绝仙台（传说曾杀死仙人的地方）、炼狱谷、魔族封印地

---

## 三、组织命名

### 正道宗门

结构：[意象/品德] + [宗/派/阁/门/院]

清正、庄严、有道家气息：
- 太清宗、玄明派、青云门、紫府院、碧落宗、白云观
- 千年以上的大宗门可加"万古""上古"前缀（万古太清宗）

### 散修联盟

松散随意，体现散修的自由精神：
- 炼器盟（以功能命名）、云游会（以生活方式命名）、散修联盟（直白）

### 魔道宗门

阴暗、凶煞、有压迫感：
- 血煞宗、魔影教、幽冥宫、邪骨宗、鬼哭门
- 不要用与正道相似的命名风格

### 上古/远古势力

有沧桑感，体现漫长历史：
- 上古仙族、远古魔宗、太古妖族、天外来客
- 这类势力往往用"XX族""XX宗"的简洁形式

---

## 常见错误

- ❌ 道号不符合修为层级（练气期弟子自称"道君"）
- ❌ 俗家名和道号风格雷同（两者都用意象词，失去双层结构感）
- ❌ 仙门地名和凡俗地名无法区分（凡俗镇子名比仙门还有仙气）
- ❌ 正道和魔道宗门命名风格相同（读者分不清阵营）
- ❌ 魔修用正道命名风格（如魔修叫"青云真人"）
- ❌ 道号全部统一格式（全是"XX真人"，缺乏修为层次感）
- ❌ 仙门地名全用"XX峰"，没有其他类型（阁、台、殿、渡等）',
  '## Entity Naming — Xiu Zhen (Cultivation) Transmigration Novel

Core feature: **dual-layer naming** — secular names (俗家名) and Dao titles (道号) coexist. Ordinary mortals and early cultivators have secular names; advanced cultivators are known by their Dao titles. This dual structure distinguishes cultivation novels from xuan huan.

---

## I. Character Naming

### Dao Title System (Core Rule)

Structure: [imagery/virtue prefix] + [suffix indicating cultivation level]

| Cultivation Level | Suffix | Examples |
|------------------|--------|----------|
| Early (Qi~Golden Core) | 散人, 道人 | Qingfeng Sanren, Biluo Daoren |
| Mid (Nascent Soul~God Trans.) | 真人, 上人 | Xuantian Zhenren, Biyun Shangren |
| High (Tribulation~Mahayana) | 道君, 尊者 | Taiqing Daojun, Cangsong Zunzhe |
| Peak (Immortal, Ancestor) | 仙人, 老祖 | Zixiao Xianren, Taigu Laozu |

Common prefixes: colors (Xuan/black, Bi/jade-green, Qing/azure, Zi/purple) + nature imagery

### Secular Names

- **Transmigrator protagonist**: Modern ordinary name (Li Ming, Chen Fei) — gains Dao title after cultivation begins
- **Native cultivators**: Classical Chinese naming style
- **Common mortals**: Plain and rustic (Wang Tiezhu, Cuihua)

### Evil Cultivators (魔修)

Dao titles use dark, baleful imagery (blood, demon, shadow, ghost): Blood Demon Venerable, Shadow Ghost Ancestor

---

## II. Location Naming

- **Sect peaks/core areas**: Transcendent imagery (Lingxiao Peak, Wentao Platform, Feijian Cliff)
- **Mortal world**: Plain and grounded (Qingyuan Town, Bailong Ferry) — strong contrast with immortal locations
- **Secret realms**: Ancient + alluring (Ancient God Secret Realm, Primordial Battlefield)
- **Forbidden zones**: Fearsome (Extinction Platform, Hell Valley)

---

## III. Organization Naming

- **Righteous sects**: [virtue/nature imagery] + [Sect/Gate/Court] — Taiqing Sect, Qingyun Gate
- **Loose cultivator groups**: Function or lifestyle-named (Forging Alliance, Wandering Society)
- **Demonic sects**: [blood/shadow/demon imagery] + [Sect/Teaching/Palace] — Blood Sha Sect, Shadow Demon Temple
- **Ancient factions**: "Ancient" + clan/tribe (Ancient Immortal Clan, Primordial Demon Tribe)

---

## Common Errors

- Dao title doesn''t match cultivation level (Qi Condensation cultivator calling themselves "Daojun")
- Secular name and Dao title indistinguishable in style
- Immortal sect location names and mortal town names at the same aesthetic level
- Righteous and demonic sect naming styles indistinguishable
- All Dao titles follow identical "XX Zhenren" format, no level differentiation',
  (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1),
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
