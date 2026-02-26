-- 灵异司机职业流小说 - 实体命名技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ghost-driver-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ghost-driver-entity-naming',
  '实体命名：为灵异司机职业流小说中的角色、站点、装备等实体提供符合职业风格的命名指导',
  'Entity naming: provide professional-style naming guidance for characters, stops, equipment, and other entities in ghost bus novels',
  '## 实体命名 — 灵异司机职业流小说

灵异职业流小说的命名原则与其他灵异类型不同：**命名要强化「普通现代都市」的基底**，让灵异元素和职业元素在普通的命名规范下相遇，而不是用特殊名字标注每个存在的「奇异属性」。

---

### 一、角色命名

#### 主角

主角的名字应该普通、有代入感，反映「被生活推着走」的状态：

**推荐方向**：
- 常见中国姓氏（王/李/张/刘/陈/赵）+ 简单二字名
- 避免罕见字、生僻字
- 可以有一个亲切的小名（老王/小张/阿陈）作为其他角色对他的称呼
- 职业外号（同行之间）：可以用「行号」（「X号线的那个」「夜班X」）

**禁忌**：
- ❌ 名字本身有仙侠/玄幻色彩（凌霄、苍穹、夜羽）
- ❌ 过于正式、书面的名字（显得不真实）

#### 亡魂乘客

**新亡之魂**（行为接近活人）：
- 用生前的真实姓名，是他们与「活人状态」最后的联结
- 中国人名规律：姓氏+名字（2-3字总长），不要生僻
- 示例：「宋明华」「陈爱莲」「刘国栋」

**执念鬼**（有执念，多次出现）：
- 可以有全名，但司机可能只记得称谓（「那个要找儿子的」「每周四的老太太」）
- 双重命名：全名用于档案/记录，称谓用于日常叙述

**年代久远的存在**（不完全适用现代人名逻辑）：
- 可用旧式起名方式（单名 + 旧式字辈：李福全、张氏、王二娘）
- 或不命名，用描述性称谓（「后排那位」「一直坐在第七排靠窗的那个」）

**非人类存在**：
- **不要强行起人名**——没有名字或用描述性绰号反而更有力
- 描述性绰号示例：「断指的」「对着窗外笑的那位」「每次都要窗边位的」
- 如果非人类主动报名，名字本身可以是一个谜题（「它说它叫''七''」）

#### 冥府官差

- 官职+姓氏：「张检查」「王信差」「李监察」
- 可有姓氏+职位的称呼（「赵大人」），但不要太仙侠化
- 避免使用明确的地狱职位名（「阎王」「黑白无常」直接登场会破坏世界观的模糊性）

#### 白天世界的人（活人）

- 普通现代都市人名
- 同事/老板用称谓（「王班长」「调度室的老郭」）
- 家人用关系称谓（「我妈」「我那个弟弟」）

---

### 二、场景命名（公交站/线路节点）

#### 站点命名

**真实公交站命名逻辑**：
- 地名+「站」：「青山路站」「县医院站」「旧城北路口站」
- 建筑/机构名+「站」：「第一人民医院站」「钢铁厂站」「旧货市场站」
- 地标+「附近」/「路口」：「古城墙附近」「十字路口」

**让站名有叙事暗示但不过于直白**：
- 好：「青龙古道站」（有历史感，但不说「这是鬼地方」）
- 差：「鬼门站」「阴界入口站」（太标注）
- 好：「城西废铁厂站」（功能暗示，读者能联想历史）

**幽灵站点**（只在阴间班次出现）的命名：
- 使用现实中已消失的地名（已拆迁的街道名）
- 使用残缺不全的地名（「×× 路」，前半部分模糊）
- 避免编造「阴间专属地名」

#### 线路命名

- 数字编号：「7路」「夜班27路」「X号线夜行班」
- 有历史意义的编号会增加背景深度（「这是城里最老的一条线」）

---

### 三、装备命名（公交装备）

#### 车体改装类

**命名原则**：像真实汽车改装名称，加上用途前缀

好的命名结构：
- 「[功能]型[部件名]」：「驱邪型后视镜涂层」「防渗型车门密封条」
- 「[材质/特殊属性]+[部件]」：「朱砂强化玻璃贴」「符文加固驾驶隔板」
- 行话/缩写（形成世界观细节）：「加强型后排灯」「新购驱邪符（4张/组）」

**禁忌**：
- ❌「圣光护盾」「神圣壁垒」（玄幻感）
- ❌ 纯数字型号（「X-9000型防鬼装置」），太科幻

#### 随身道具类

- 日常物品的特殊化命名（强调材质和来源）
- 示例：「老黄历（民国三十年版，第三页有手写批注）」
- 示例：「前任司机留下的铜哨（未知用途）」
- 来历不明的道具：可在括号内注明「（来源：第7班次特殊乘客馈赠）」

#### 消耗品类

- 按「批次」或「数量」命名，强调资源有限
- 示例：「驱邪符（剩余2张）」「月度标准补给包（已开封）」

---

### 命名整体原则

1. **普通 > 特殊**：名字本身不应该是吸引眼球的点，名字承载的故事才是
2. **描述性绰号 > 强行命名**：给不该有名字的存在起名字，会削弱它的神秘感
3. **职业化语言框架**：装备/站点都优先用「工作语言」命名，不用「灵异语言」命名
4. **命名与世界观知情程度一致**：如果主角世界里普通人不知道灵异存在，那么站名/装备名也不应该公开标注灵异属性',
  'Entity Naming — Ghost Driver Paranormal Novel

Core principle: naming should reinforce the "ordinary modern city" baseline. Supernatural and professional elements should meet under ordinary naming conventions, not announce themselves through exotic names.

**Protagonist**: common Chinese surname + simple given name. No mystical-sounding characters. Friendly nickname from coworkers acceptable.

**Ghost passengers**:
- Newly deceased: use their real living name (last connection to living state)
- Obsession ghosts (recurring): may have full name + descriptive alias ("the one looking for her son", "the old lady every Thursday")
- Ancient/unknown entities: NO forced human names — descriptive nicknames ("the broken-fingered one", "the one laughing at the window") are more powerful
- Underworld officials: official title + surname ("Inspector Zhang", "Courier Wang")

**Stop naming**: follow real transit conventions — "Qingshan Road Stop", "County Hospital Stop", "Old City North Intersection". Avoid overtly supernatural names. Ghost stops (night-only): use historically disappeared place names or incomplete/obscured names.

**Equipment naming**:
- Vehicle modifications: "[function]-type [part name]" or "[material/property] [component]" — "anti-seepage door seal", "cinnabar-reinforced glass decal"
- Personal items: everyday object + specific origin in parentheses ("1930 almanac with handwritten notes on page 3")
- Consumables: batch/quantity format ("protective talisman (2 remaining)")

**Overall rule**: ordinary > special; descriptive nickname > forced name; professional language framework > supernatural language framework.',
  (SELECT id FROM novel_creation_method WHERE name = '灵异司机职业流小说' LIMIT 1),
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
