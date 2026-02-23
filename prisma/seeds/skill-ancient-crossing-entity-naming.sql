-- 古代架空穿越小说「实体命名」技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ancient-crossing-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ancient-crossing-entity-naming',
  '实体命名：为古代架空穿越小说中的角色、场景、势力等实体提供古风美学的专业命名指导，兼顾辨识度与不千篇一律',
  '"Entity Naming": Provide classical Chinese aesthetics naming guidance for characters, locations, and factions in ancient alternate-history transmigration novels',
  '## 实体命名 — 古代架空穿越小说

古代架空穿越小说的实体命名核心是**古风美感与辨识度**。世界完全架空，命名自由度高，但必须保持内部一致的"古代质感"，不能出现朝代混乱或风格断层。不同阶层的角色命名应有明显差异，宫廷/江湖/底层三个层次各有规范。

---

## 一、角色命名

### 文官士族（雅名系）

名字应有意象层次，多用玉器、植物、天象、方位等字：
- 单字名（雅）：珏、晏、竹、澜、砚、霁
- 双字名（意象叠加）：云晏、青竹、明珏、霁月、沧澜
- 示例姓名：苏明珏、谢云晏、沈青竹、裴霁月、顾澜声

### 武将边将（豪气系）

多用强硬有力的词，讲究音节铿锵：
- 常用字：铁、烈、风、雷、霆、虎、龙、戈、刃
- 示例：赵铁山、霍烈风、马惊雷、秦铁戈、韩虎啸

### 皇室成员（封号/尊号系）

皇室角色有封号制度，直接称呼其封号或尊号：
- 皇帝：年号+天子（贞元帝、永兴帝）；或直接称"陛下"
- 亲王：方位/美德+王（靖王、宸王、安王、瑞王）
- 公主：美好词汇+公主（嘉宁公主、云曦公主）
- 妃嫔：封号+妃/贵妃（贵妃、淑妃、嘉妃）；以封号传达地位和性格

### 女性主角（两极风格）

- **婉约型**：林浅浅、慕容华、柔嘉、凌波、盈袖
- **强势型**：凤千羽、宸月、傲雪、凌霄、天璇
- 注意：名字本身可以预示人物性格，读者看书名即有印象

### 底层角色（朴实系）

平民、丫鬟、侍卫等用朴实通俗的名字：
- 男：张三、李四、狗蛋、旺财、二虎
- 女：翠儿、桃儿、杏花、春桃、小梅
- 这类名字与贵族名字的反差本身就是阶层感的体现

### 多样化原则

- **姓氏分散**：不要让重要角色都姓李、王、张。架空小说可用：谢、顾、裴、沈、苏（江南系）；赵、霍、秦（边将系）；慕容、宇文（异族汉化系）
- **辨识度**：每个重要角色的名字音节感不同，不要多个角色名读起来相近（如"明珏""明珩""明璃"集中出现）
- **不要叠字名泛滥**：芸芸、朵朵、妮妮等叠字名只适合丫鬟小厮，重要角色不宜过多使用

---

## 二、场景命名

### 宫城建筑

核心原则：方位/五行/吉祥词 + 宫/殿/阁/台/苑

- **正殿/朝堂**：气势宏大（含元殿、奉天殿、明德殿）
- **后宫**：柔美意象（凤仪宫、翠微宫、永寿宫、漪澜殿）
- **书房/书院**：文气（养心斋、问道阁、悟真台）
- **侧殿/偏院**：较低格调（冷宫用荒废感的名字——废明院、寒玉轩）
- **禁区/密室**：神秘感（幽明台、玄机阁）

### 城市街市

- **坊市**：方位+功能/人群（东市、西街、锦绣坊、百工巷、商贾里）
- **酒楼茶馆**：带文气或地名（醉仙楼、听雨轩、揽月楼、聚贤居）
- **青楼/风尘**：带诗意（倚红楼、落花馆、烟柳院）

### 郊野与自然

- **山川**：有历史感或传奇感（青龙山、碧水湖、断肠崖、忘忧谷、鸢尾峰）
- **边境要塞**：厚重历史感（铁血城、雁门寨、戍边营、北漠关）
- **江湖地点**：神秘或豪气（藏剑山庄、落英涧、云海渡、百晓堂）

---

## 三、势力命名

### 朝廷派系

- 以立场命名：清流一党、保皇派、变法派
- 以领袖命名：谢氏一党、裴相旧部、太子党
- 避免用现代政治术语（如"改革派""保守派"过于现代）

### 武林门派

遵循"功法/地形/意象 + 门/派/阁/宗/盟"的结构：
- **正道**：天剑阁、碧雨盟、云顶派、玄铁门、百晓楼
- **中立/神秘**：影卫堂、阴阳宗、暗哨司
- **邪道**：毒牙宫、幽冥教、血影楼
- 注意：同一故事内不同势力的命名风格要有差异，让读者一眼分辨正邪

### 商业/地方势力

- **地域+行业**：江南盐商、北地马帮、海陵粮行
- **姓氏+规模**：陈氏百年老字号、齐家钱庄、王氏商行
- **特殊组织**：带神秘色彩（百晓阁——情报；影楼——刺客）

---

## 常见错误

- ❌ 日式汉字名混入（心海、羽生、月詠、一叶知秋）
- ❌ 重要角色全用叠字名（芸芸、朵朵），缺乏贵气
- ❌ 所有武将都用相似的"虎""龙""豹"字，辨识度差
- ❌ 宫廷建筑名字与历史朝代真实宫殿重名（如直接用"乾清宫"——那是明清的）
- ❌ 江湖势力和宫廷派系风格混同（江湖门派名出现在朝廷，或朝廷机构名出现在江湖）
- ❌ 底层角色用了贵族式雅名（丫鬟叫"霁月"，破坏阶层感）',
  '## Entity Naming — Ancient Chinese Alternate-History Transmigration

Core principle: **classical aesthetics + distinctiveness**. The world is fictional, so naming is flexible, but must maintain consistent "ancient Chinese" feel. Different social strata should have clearly distinct naming styles.

---

## I. Character Naming

- **Literati/aristocrats**: Elegant imagery words (jade, plants, celestial bodies) — e.g., Su Mingjue, Xie Yunyan
- **Military generals**: Forceful, percussive syllables — e.g., Zhao Tieshan, Huo Liefeng
- **Royalty**: Use titles (Prince Ning, Empress Jia) rather than given names in formal contexts
- **Female leads**: Either gentle (Lin Qianqian) or powerful (Feng Qianyu) — name signals character
- **Commoners**: Plain, common names (Zhai San, Cuier) — contrast with nobility signals class

**Diversity**: Spread surnames across regional styles (Xie/Gu/Pei for southern gentry; Zhao/Huo/Qin for border generals; Murong/Yuwen for foreign-origin nobility)

---

## II. Location Naming

- **Palace buildings**: Direction/element + palace/hall/pavilion (e.g., Fengyi Palace, Hanyu Pavilion)
- **City districts**: Function/population + ward/street (e.g., East Market, Brocade Ward)
- **Nature/wilderness**: Legendary or atmospheric names (Broken Heart Cliff, Forget-Sorrow Valley)
- **Border fortresses**: Heavy and historical (Iron Blood City, North Desert Pass)

---

## III. Faction Naming

- **Court factions**: Named by leader or political stance (Xie Clan faction, Royalist party)
- **Martial sects**: [Style/geography/imagery] + [door/sect/alliance] — distinguish righteous vs. evil by tone
- **Commercial/regional**: [Region + trade] or [Surname + business] (Southern Salt Merchants, Chen Family Granary)

---

## Common Errors

- Japanese-style hanzi names (Koumi, Haruhi)
- All important characters using cutesy repeated-character names (Yungyun, Duoduo)
- Palace building names copied from real historical dynasties
- Court faction names and martial sect names indistinguishable in style',
  (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1),
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
