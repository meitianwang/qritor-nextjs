-- 异世界修真穿越小说「角色」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xiuzhen-crossing-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiuzhen-crossing-character-gen',
  '「角色」生成：为异世界修真穿越小说生成角色，涵盖修真宗门体系、灵根根骨设定、道心与心境刻画、师承关系设计',
  '"Character" generation: generate characters for isekai xiuzhen crossing novels, covering sect system, spiritual root design, Dao heart portrayal, and master-disciple relationships',
  '## 「角色」生成 — 异世界修真穿越小说

异世界修真穿越小说的角色设计核心是**宗门师承 × 修炼根骨 × 道心境界**。与玄幻穿越的热血战斗不同，修真更强调"修心"——角色的心境、道心、因果纠葛是比战斗力更重要的维度。

修真世界的角色关系以宗门为核心：师徒、同门、道侣构成基本社交网络。穿越者需要在森严的宗门等级制度中寻找生存和崛起之道。

---

### 字段生成指南

#### 姓名

- 修真世界命名偏中式仙侠风：带仙气、雅致
- 高辈分角色可有道号（如"清虚子"、"紫阳真人"），但姓名字段填本名
- 妖族角色可用单字姓 + 化形后的名（如"白素"、"青丘"）
- 姓氏可暗示血脉或宗门传承

#### 角色定位

| 定位 | 修真特色 |
|------|---------|
| **主角** | 穿越者，通常灵根平庸但有特殊机缘或金手指 |
| **男主/女主** | 道侣或潜在道侣，可以是天才型修士 |
| **反派** | 同门嫉妒者、邪修、魔族大能、利益冲突的宗门长老 |
| **重要配角** | 师父、同门师兄弟、散修朋友 |
| **工具人** | 引发机缘或危机的路人修士 |

#### 性别

修真世界通常男女皆可修炼，但可能存在：
- 某些功法对性别有要求（如"玄阴功"限女修）
- 双修体系中的道侣搭配

#### 年龄

修真世界的年龄体系：
- 筑基期：外貌定格在筑基时的年龄
- 金丹期以上：可活数百年
- 元婴期以上：可活千年
- 高阶修士看似年轻但实际古老

#### 种族

与玄幻相同的七选项，但修真世界有独特侧重：

| 种族 | 修真特色 |
|------|---------|
| **人族** | 主流修炼种族，宗门体系的主体 |
| **妖族** | 化形修炼，需渡天劫；与人族的关系微妙（亦敌亦友） |
| **魔族** | 修炼魔道，被正道排斥；不一定是反派 |
| **其他** | 灵植化形、器灵等修真特有存在 |

主角通常为人族。

#### 身份地位（嵌套对象）

**所属势力**：宗门/家族/散修联盟
- 修真世界以宗门为核心社会单位
- 参考世界观中的宗门体系

**职业/宗门**：修炼方向
- 剑修、炼丹师、炼器师、阵法师、符修、体修、魂修等
- 必须与修炼体系设定中的修炼方向一致

**境界/等级**：当前修为
- 必须使用修炼体系设定中定义的境界名称（如练气→筑基→金丹→元婴→化神→渡劫→大乘）
- 主角起始境界低，通过机缘逐步提升

**称号**：修真界的名号
- 如"剑痴"、"丹圣"、"天魔老祖"
- 称号反映实力和名声，低阶修士通常没有

#### 外貌特征

修真角色的外貌规则：
- 修为越高，气质越超凡脱俗
- 妖族化形后可保留部分兽类特征
- 修炼特定功法可能改变外貌（如修炼冰系功法导致发色偏白）
- 邪修/魔修可能有阴暗气质

#### 性格特点

修真角色的性格核心——道心：
- **正道修士**：重师承规矩、讲因果缘法，但不等于迂腐
- **散修**：谨慎多疑、利益至上、生存第一
- **邪修/魔修**：不受正道规矩束缚，但有自己的行事逻辑
- **穿越者**：现代人的功利主义思维 + 逐渐理解的修真世界法则

#### 人物背景

- 穿越者：穿越前身份 + 穿越后的宗门/家族处境 + 初始资质评价
- 宗门弟子：入门经过、师承来历、宗门内的地位
- 散修：漂泊经历、机缘际遇
- 背景要与修炼体系中的晋级条件呼应

#### 人物目标

修真角色的典型目标：
- 穿越者：长生/飞升/回归现代/保护重要之人
- 反派：突破瓶颈/夺取资源/称霸一方
- 配角：报仇/寻亲/守护宗门

#### 人物弧光

修真特有的弧光维度——道心成长：
- 穿越者：从功利主义到理解大道的转变
- 正道角色：在正邪之间的挣扎和抉择
- 反派：堕入魔道的过程（或由魔入正的救赎）

---

### 角色阵容建议

**标准配置**：
1. **主角**：穿越者，灵根平庸但有金手指/特殊体质
2. **道侣候选**：天资出众的同门或他宗弟子
3. **同门兄弟**：与主角关系亲近的同辈弟子（可友可敌）
4. **师父**：引导主角入门的长辈，通常有隐藏的强大实力或悲惨过往
5. **同辈反派**：天才型同门/敌宗弟子，与主角形成对比和竞争

---

### 与已有设定的联动

| 设定模块 | 对角色的影响 |
|---------|------------|
| **穿越设定** | 穿越方式→主角进入修真界的方式；穿越目标→主角的初始身份 |
| **世界观** | 宗门分布→角色的门派归属；禁地/秘境→角色机缘来源 |
| **修炼体系** | 境界体系→所有角色的实力标尺；灵根/根骨→角色天赋；功法体系→职业方向 |
| **金手指** | 类型→主角的核心优势（功法传承/炼丹天赋/洞天福地等） |
| **故事钩子** | 核心卖点→角色阵容和冲突方向 |
| **文风设定** | 氛围基调→角色互动的风格（古朴仙侠 vs 热血战斗） |

---

### 常见错误

1. **境界名与修炼体系不一致**：使用了设定中没有的境界名
2. **宗门设定空洞**：只写"某宗门弟子"而不与世界观中的具体宗门对应
3. **穿越者过于突出**：所有角色都围绕穿越者转，本土角色缺乏自主性
4. **道心描写缺失**：只写外在实力，不写内在心境——修真小说的角色深度靠道心
5. **种族特征模糊**：妖族角色与人族无异，失去修真世界的独特味道
6. **师承关系断裂**：师徒关系设定了但后续无互动，浪费了修真最重要的情感线',
  '## "Character" Generation — Isekai Xiuzhen Crossing Novel

The core of character design in isekai xiuzhen (cultivation/immortal) crossing novels is **sect lineage × spiritual roots × Dao heart**. Unlike xuanhuan''s emphasis on hot-blooded combat, xiuzhen emphasizes "cultivation of the heart" — a character''s mental state, Dao heart, and karmic entanglements are more important than combat power.

Character relationships in the xiuzhen world center on sects: master-disciple, fellow disciples, and Dao companions form the basic social network.

---

### Field Generation Guide

#### Name (姓名)
Xiuzhen naming leans toward Chinese immortal/xianxia style: elegant and ethereal. Senior figures may have Dao titles. Demon beasts use single-character surnames.

#### Role (角色定位)
Protagonist (transmigrator, mediocre spiritual roots but special fortune), Love Interest (Dao companion candidate, genius cultivator), Antagonist (jealous fellow disciple, heterodox cultivator, demonic powerhouse), Important Supporting (master, fellow disciples), Functional.

#### Race (种族)
Human (mainstream, sect-based), Demon Beast (shapeshifting cultivation), Devil Race (cultivating demonic Dao, not necessarily villains), Other (plant spirits, artifact spirits).

#### Status (身份地位, nested)
- **Faction**: Sect/family/loose cultivator alliance
- **Profession/Sect**: Sword cultivator, alchemist, array master, talisman cultivator, body cultivator, soul cultivator
- **Realm/Level**: Must use realm names from cultivation system setting
- **Title**: Reflects strength and reputation

#### Personality (性格特点)
Core dimension — Dao heart: Orthodox cultivators value lineage rules and karma; loose cultivators are cautious and pragmatic; heterodox cultivators have their own logic; transmigrators blend modern utilitarianism with growing understanding of cultivation laws.

#### Character Arc (人物弧光)
Xiuzhen-unique arc dimension — Dao heart growth: transmigrator from utilitarianism to understanding the Great Dao; orthodox characters struggling between good and evil; antagonists'' fall into demonic path or redemption.

---

### Setting Linkage

| Setting | Impact |
|---------|--------|
| **Crossing Setup** | How protagonist enters; initial identity |
| **Worldview** | Sect distribution → faction affiliation; forbidden lands/secret realms → fortune sources |
| **Cultivation System** | Realm hierarchy → power scale; spiritual roots → talent; technique system → profession |
| **Cheat Ability** | Type → core advantage (technique inheritance/alchemy talent/blessed land) |
| **Story Hook** | Core selling point → lineup and conflict direction |
| **Writing Style** | Atmosphere → interaction style (classical xianxia vs hot-blooded combat) |

---

### Common Errors

1. **Realm names inconsistent with cultivation system**: Using undefined realm names
2. **Empty sect settings**: "Some sect disciple" without matching worldview''s specific sects
3. **Transmigrator overshadowing**: All characters revolve around transmigrator; natives lack agency
4. **Missing Dao heart portrayal**: Only describing external power, not inner mental state
5. **Vague racial traits**: Demon beast characters indistinguishable from humans
6. **Broken master-disciple bonds**: Setting up the relationship but no subsequent interaction',
  (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1),
  1,
  21,
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
