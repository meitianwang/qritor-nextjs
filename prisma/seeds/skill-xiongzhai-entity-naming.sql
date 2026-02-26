-- 凶宅灵异租房实体命名技能（Layer 3）
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-xiongzhai-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiongzhai-entity-naming',
  '实体命名：为凶宅灵异租房小说中的角色、空间、凶宅本身提供符合都市灵异租房题材美学的专业命名指导',
  '"Entity Naming": provide professional naming guidance for characters, spaces, and the haunted apartment itself in haunted rental horror novels, consistent with urban supernatural aesthetics',
  '## 实体命名 — 凶宅灵异租房小说创作

凶宅灵异租房的命名有一个核心原则：**最恐惧的名字是最日常的名字**。一个叫"陈晓雯"的前租客比一个叫"怨灵女鬼"的存在更令人害怕——因为陈晓雯可以是任何人，可以是你认识的人，可以是你自己。

---

## 一、角色命名

### 主角（当前租客）

主角命名要体现**真实的普通感**——读者需要能代入，名字不能有任何特殊感或命定感：

**有效命名原则**：
- 姓名要够普通，不要生僻字，不要有特殊含义
- 适合凶宅主角的姓名范围：常见双字名（林晓、陈明、王洁、刘磊、张宇）
- 职业身份可以体现在叙事中，不需要在名字上暗示
- 避免：有特殊含义的名字（如直接对应"命运"主题的字）；过于古典或文学气的名字

**示例**：
```
林晓、陈晓雯、王少峰、刘佳、张明远
李思、赵敏、郑浩、韩雨、吴婷
```

### 房东

房东的名字要体现**表面正常、实则有信息量**：

**有效命名原则**：
- 房东名字可以有一丝"老一代"的感觉（50岁以上的命名风格）
- 避免直接暗示恶意或神秘的名字
- 房东可以只有姓氏（"陈老板"、"王女士"）——匿名感是设定的一部分
- 有时房东有一个过于普通、让人记不住的名字，反而更有效果

**示例**：
```
陈国华、王桂芬、李建国、张秀英、赵大明
邓远山、刘翠华、钱永贵、孙莲芬
```

### 邻居

邻居的名字反映**这个小区/这栋楼的居民构成**：

**有效命名原则**：
- 不同年龄层的邻居应该有不同时代的命名风格（60年代出生：建国/玉兰；80年代：晶晶/磊磊；00年代：子轩/紫萱）
- 邻居的名字要有地域感（高档小区的邻居，名字也可以更"精英"；老公寓的邻居，名字更接地气）

### 前任租客（已死亡或失踪）

前任租客的命名是凶宅流中最重要的命名选择——**他们的名字要在揭示时产生情感冲击**：

**有效命名原则**：
- 前任租客应该有完整的全名——他/她是一个有完整身份的人，不是符号
- 名字要够普通，让读者感到"这个人可以是真实存在的"
- 可以通过名字暗示前任租客的性别、大致年代（一个叫"张春燕"的前租客，可能是70年代生人）
- 死亡/失踪的前任租客的名字，在故事后期揭示时要能承载情感重量

**示例**：
```
女性：张春燕、陈美华、李月华、王小燕、刘玲玲
男性：赵建设、钱志强、孙国文、周明德
年轻一代：林子涵、陈思琪、王梓轩
```

---

## 二、空间命名

### 凶宅本身

凶宅的命名（小区名、楼栋号、房间号）要体现**日常与特殊的张力**：

**有效命名原则**：
- 小区名要有"高档感但不浮夸"（不要幻想型名字，要现实感的高档物业命名）
- 楼号和房间号要具体——具体的数字比笼统的"某某房间"更有现实感
- 某些数字可以有隐含意义（7楼、13号、18号等），但要克制使用，不要过于刻意

**中国典型高档小区命名模式**：
```
【品质型】万象城、翡翠华庭、棠湖花园、金色家园、绿城小区
【区位型】北区一号院、中央公园旁、CBD某某花园
【英文型】某某Place、某某Garden、City Walk（配合中文楼号）
【素雅型】雅苑、竹间、听雨、观云
```

**楼栋和房间号选择建议**：
- 中楼层（8-20层之间的某层）比顶层或底层更有代入感——大多数人住的是中楼层
- 房间号末尾的数字选择：01-03的边户（朝向固定，隔音差）比中间户更有孤立感

**示例**：
- 万象城·悦庭 19楼01室
- 天鹅湖花园 8栋7楼302
- 南区翡翠院 B1-1201

### 房间名称

凶宅内部各空间应该使用**完全日常化的名称**——恐惧不是来自名字，而是来自发生在里面的事：

```
不要使用：暗室、幽冥阁、灵魂之间
应该使用：储藏间、次卧、浴室B、阳台
```

唯一的例外：如果一个空间被前任租客在日记或刻字中给了一个名字，这个名字本身可以承载恐惧（"她把浴室称为''看得见的地方''"）。

---

## 三、厉鬼命名（或不命名）

厉鬼的命名策略是凶宅流命名中最特殊的部分：

**策略一：使用真实姓名（来自死亡历史）**
- 厉鬼曾是一个有名字的人；她的名字在真相揭示时揭露
- 这个策略让厉鬼保持人性；知道了名字之后，恐惧会转化为悲悯
- 适合：执念困守型、冤死怨灵型

**策略二：始终不给名字**
- 主角和读者始终不知道"它"叫什么，只能用"那个存在"、"浴室里的那个"来指代
- 这个策略保持厉鬼的异质感；不命名=不定义=不限制想象
- 适合：恶意厉鬼型、非人存在型

**策略三：给一个不完整的名字**
- 主角通过线索知道了姓，但不知道全名；或者知道全名，但这个名字本身成谜
- 例："前任租客的日记上只写了一个字：陈。"
- 适合：调查推理驱动的故事；真相分层揭露的结构

---

## 常见错误

- ❌ 主角名字有命定感（"紫琰"、"天命"之类暗示被选中的字）
- ❌ 前任租客没有全名，只是"那个女人"——缺失了情感重量
- ❌ 小区名字太明显的凶险（"幽冥小区"、"冥府花园"）——现实中不存在这样的小区
- ❌ 厉鬼名字过于古典或神秘（"莫清影"、"云若离"）——像网文人名，不像真实死去的人
- ❌ 空间名字过于标签化（"主角的安全房间"、"厉鬼的领地"）——用日常名称',
  'Entity naming for haunted rental horror. Core principle: the most frightening names are the most mundane. Protagonist names should be ordinary and forgettable (common two-character Chinese names). Landlord names should feel like an older generation (50+ naming conventions) or be partially anonymous ("Owner Chen"). Neighbor names should reflect residential demographics by age and social class. Previous tenant names must be complete full names — they were a real person; the name should carry emotional weight when revealed. Haunted apartment naming: use real-feeling high-end residential complex naming patterns (not fantasy names); specific floor and unit numbers increase realism. Room names: fully mundane (bathroom, storage room, second bedroom — never "the dark chamber"). Ghost naming strategy: use their real name (maintains humanity, transitions horror to pathos), keep unnamed (preserves alien quality), or partial name (drives investigation arc).',
  (SELECT id FROM novel_creation_method WHERE name = '凶宅灵异租房' LIMIT 1),
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
