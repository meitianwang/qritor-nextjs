-- 异世界修真穿越小说「组织」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xiuzhen-crossing-org-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiuzhen-crossing-org-gen',
  '「组织」生成：为异世界修真穿越小说生成组织势力，涵盖宗门、王国、学院、佣兵团等九大类型，强调道统传承与灵脉资源争夺',
  '"Organization" generation: generate organizations for isekai xiuzhen crossover novels, covering nine types (sects, kingdoms, academies, mercenary groups, etc.) with emphasis on Dao lineage inheritance and spirit vein resource competition',
  '## 「组织」生成 — 异世界修真穿越小说

异世界修真穿越小说的组织设计核心是**道统传承 × 灵脉争夺 × 宗门体系**。与玄幻小说不同，修真世界的组织更强调道家哲学、天地法则、师承关系。每个宗门不仅是修炼的场所，更是一脉道统的传承者——功法、心法、道法的传承链条决定了宗门的底蕴和未来。

穿越者在修真世界中，需要通过拜师入门获得修炼资格，宗门的选择直接决定修炼路线。好的组织设计能体现修真世界的等级森严（仙凡之别、宗门高下）、资源有限（灵脉枯竭、天材地宝稀缺）、道统之争（正邪对立、道魔之分）。

---

### 字段生成指南

#### 名称

- 修真世界的命名要有道家韵味和仙气
- 宗门类：以修炼道路或祖师命名（「太清宫」「紫霄剑派」「天一道」「万象宗」「青云门」）
- 王国类：以修仙国度风格命名（「大晋修仙国」「九州仙朝」）
- 学院类：以修炼启蒙定位命名（「炼气学堂」「筑基书院」）
- 商会类：以修炼资源交易定位命名（「万宝阁」「百草堂」「天工坊」）
- 教会类：以信仰或教义命名（「净世宗」「万佛寺」）
- 名称要有意境和文化底蕴，体现修真世界的美学

#### 类型

九个选项在修真世界中的定位：

| 类型 | 修真世界对应 | 核心特征 | 叙事功能 |
|------|------------|---------|---------|
| **宗门** | 修炼门派 | 道统传承、功法体系、灵脉占有 | 核心组织形态，主角修炼之所 |
| **王国** | 修仙王朝/世俗国度 | 疆域治理、凡修混居 | 提供世俗权力维度 |
| **学院** | 修炼启蒙机构 | 筛选资质、基础教学 | 主角早期阶段 |
| **佣兵团** | 散修联盟/任务组织 | 无宗门的修士组成 | 散修生存方式 |
| **教会** | 佛道宗教势力 | 信仰修炼、普度众生 | 正道一脉的变体 |
| **商会** | 修炼资源交易 | 丹药器材灵石流通 | 资源获取渠道 |
| **异族部落** | 妖族/魔兽族群 | 血脉觉醒、化形修炼 | 种族冲突和跨族情缘 |
| **魔族势力** | 魔道修士/魔域势力 | 魔功、噬灵、邪法 | 正邪对立的核心 |
| **其他** | 隐世势力等 | 视具体类型而定 | 特殊组织形态 |

**修真世界的组织特色**：宗门是绝对核心——几乎所有重要角色都有宗门归属。散修存在但处于弱势。

#### 地位与影响力

- 必须用修真世界的等级标准衡量
- 好的描写：「正道六大宗门之一，坐拥三品灵脉，门主为元婴后期修士，有化神期太上长老坐镇，门下弟子三千余人」
- 差的描写：「一个厉害的宗门」
- 关键指标：
  - **最强修为**：门中最高境界的修士（筑基、金丹、元婴、化神、渡劫...）
  - **灵脉品阶**：所占灵脉的品质直接决定宗门的修炼上限
  - **弟子规模**：内门弟子、外门弟子、记名弟子的数量
  - **排名地位**：在正道/魔道/区域中的排名

#### 核心理念

- 修真组织的理念要与修炼道路呼应
- 剑修宗门：「以剑问道」「一剑破万法」
- 炼丹宗门：「以丹证道」「悬壶济世」
- 阵法宗门：「大道至简，以阵御敌」
- 正道宗门：「替天行道」「守护苍生」
- 魔道宗门：「天地不仁」「唯力至上」「大道无分善恶」
- 理念要影响宗门的修炼方向、收徒标准、行事风格

#### 代表人物

- 写出组织中最具代表性的 2-3 个人物
- **必须标明修为境界**——这是修真世界最核心的实力标识
- 好的描写：「门主玄清子，元婴后期，剑道通神，百年前曾一剑退化神期魔修；首席长老云霞真人，元婴中期，擅长阵法，性情温和」
- 人物的师承关系是修真世界的重要信息——「某某是某某的师弟」

#### 资源与特色

修真组织的核心资源：
- **灵脉**：品阶、数量、分布——灵脉是宗门的命根子
- **功法传承**：镇派功法、独门秘技、失传功法的残卷
- **丹药炼器**：炼丹炉、炼器坊、丹方、器谱
- **天材地宝**：灵药园、矿脉、灵兽山
- **阵法护山**：护山大阵的等级和覆盖范围
- **洞天福地**：是否拥有独立小世界或秘境入口
- 每个宗门必须有其「独门绝学」——这是宗门在修真界立足的根本

#### 与主角关系

- 修真世界中，宗门关系决定师承关系，师承关系决定修炼路线
- 可能的关系：
  - 所属宗门（主角的修炼根据地，拜师、修炼、历练）
  - 友好宗门（可能的合作对象、联姻盟友）
  - 敌对宗门（争夺资源、道统之争、正邪对立）
  - 未接触（未来可能产生交集的势力）
- 关系描述要结合修真世界的规则：「同为正道六大宗门，在百年大比中互有胜负，因丹阳灵脉归属问题存在嫌隙」

---

### 组织阵容建议

**标准配置**：
1. **主角宗门**（1 个，宗门类）：主角拜师修炼之所，是成长的根据地
2. **正道大宗**（1 个，宗门类）：正道领袖级别的宗门，代表实力天花板
3. **魔道势力**（1 个，魔族势力/宗门类）：正邪对立的核心对手
4. **中立势力**（1 个，商会/教会类）：在正邪之间保持中立的组织
5. **神秘势力**（0-1 个，其他/异族部落类）：隐世的古老势力，持有关键线索

**修真世界组织设计原则**：
- 正邪对立是修真世界的基本格局——但不是非黑即白
- 宗门之间有明确的辈分和排名——不能所有宗门都是顶级
- 灵脉资源的稀缺性是宗门冲突的根本原因
- 主角的宗门不宜太强——太强则缺少成长空间，太弱则缺少立足根基
- 散修势力作为补充——散修联盟可以提供不同视角

---

### 与已有设定的联动

| 设定模块 | 对组织的影响 |
|---------|------------|
| **世界** | 修炼体系→宗门的修为境界标准和功法路线；灵脉分布→宗门的地理位置和资源争夺；天地法则→修炼的上限和瓶颈 |
| **故事钩子** | 穿越方式→主角与初始宗门的关系；金手指→主角修炼的独特优势；核心冲突→正邪对立的焦点 |
| **小说梗概** | 修炼路线→主角需要经历的宗门和势力；关键战役→宗门间的大战节点；大道之争→道统之争的核心 |
| **文风设定** | 仙侠韵味→宗门描写的古典美感；升级爽感→宗门实力对比的爽点设计 |

---

### 常见错误

1. **缺少修为标注**：组织的代表人物和最强战力没有标注具体境界
2. **灵脉资源忽略**：宗门没有说明所占灵脉的品阶——这是宗门实力的根本
3. **正邪过于绝对**：正道全是好人、魔道全是坏人——好的修真小说中正邪都有灰色
4. **宗门同质化**：所有宗门都修剑或修气，缺少功法路线的多样性（丹道、器道、阵道、符道等）
5. **道统传承缺失**：宗门没有创派历史和传承脉络，缺少厚重感
6. **散修被忽视**：修真世界中散修是重要的生态位，完全不提会让世界显得单一
7. **命名缺少仙气**：使用过于普通或现代感的名称，缺少修真世界的美学意境',
  '## "Organization" Generation — Isekai Xiuzhen Crossover Novel

The core of organization design in isekai xiuzhen crossover novels is **Dao lineage × spirit vein competition × sect system**. Unlike general xuanhuan, xiuzhen organizations emphasize Daoist philosophy, heavenly laws, and master-disciple relationships. Each sect is not just a training ground but a carrier of Dao lineage — the inheritance chain of techniques, mental cultivation methods, and Dao arts defines a sect''s heritage and future.

The time-traveler must join a sect through formal apprenticeship to qualify for cultivation. Good organization design reflects strict hierarchy (immortal-mortal divide, sect rankings), limited resources (spirit vein depletion, rare treasure scarcity), and Dao disputes (orthodox-demonic opposition).

---

### Field Generation Guide

#### Name (名称)
Xiuzhen names need Daoist charm and immortal aesthetics. Sects: cultivation paths or patriarch names ("Tai Qing Palace", "Purple Cloud Sword School"). Kingdoms: cultivation nation style. Trade guilds: cultivation resource focus ("Myriad Treasure Pavilion"). Names need cultural depth.

#### Type (类型)
Nine types in xiuzhen context: Sect (Dao lineage, technique systems, spirit veins — absolute core), Kingdom (mortal-cultivator mixed governance), Academy (qualification screening, basic training), Mercenary Group (rogue cultivator alliances), Church (Buddhist/Daoist religious forces), Trade Guild (pill/equipment/spirit stone trade), Tribal Clan (demon beasts, bloodline awakening), Demonic Faction (demonic arts, soul-devouring), Other (reclusive ancient forces).

#### Status & Influence (地位与影响力)
Must use xiuzhen-world metrics: peak cultivation realm, spirit vein grade, disciple count, ranking among orthodox/demonic sects. Be specific with realms (Foundation Building, Golden Core, Nascent Soul, Spirit Transformation, Tribulation Crossing...).

#### Core Ideology (核心理念)
Must resonate with cultivation paths. Sword sects: "Seek Dao through the sword." Alchemy sects: "Prove Dao through pills." Array sects: "Grand Dao in simplicity." Orthodox: "Protect all beings." Demonic: "Only power matters." Ideology affects cultivation direction, recruitment standards, and behavioral patterns.

#### Representative Figures (代表人物)
2-3 figures with **mandatory cultivation realm** marking. Include master-disciple relationships — crucial information in xiuzhen. Good: "Sect Master Xuan Qingzi, late Nascent Soul, sword Dao mastery, once repelled a Spirit Transformation demonic cultivator with one strike a century ago."

#### Resources & Specialties (资源与特色)
Core xiuzhen resources: spirit veins (grade, count), technique inheritance (signature techniques, lost manuals), alchemy/forging (furnaces, recipes), spiritual materials (herb gardens, mines, spirit beast mountains), protective arrays (grade and coverage), grotto-heavens (independent pocket dimensions). Every sect needs a unique specialty — the foundation for standing in the cultivation world.

#### Relation with Protagonist (与主角关系)
Sect relationship determines master-disciple relationship, which determines cultivation path. Types: home sect, friendly sect, hostile sect, uncontacted. Descriptions should incorporate xiuzhen rules: "Both among the Six Great Orthodox Sects, with rivalries in centennial tournaments and disputes over the Danyang Spirit Vein."

---

### Organization Lineup Suggestion

Standard: protagonist''s sect (1), orthodox leader (1), demonic force (1), neutral force (1, trade guild/church), mysterious force (0-1, ancient reclusive). Orthodox-demonic opposition is the basic framework but not black-and-white. Sect rankings must be clear. Spirit vein scarcity drives fundamental conflicts.

---

### Common Errors

1. **Missing cultivation realms**: No specific realm markers for representatives and peak strength
2. **Ignoring spirit veins**: Sect without spirit vein grade — this is the foundation of sect power
3. **Absolute good vs evil**: All orthodox = good, all demonic = evil — good xiuzhen has gray areas
4. **Homogeneous sects**: All sects practice sword or qi cultivation, lacking path diversity (alchemy, forging, arrays, talismans)
5. **Missing Dao lineage**: Sects without founding history and inheritance lineage, lacking depth
6. **Ignoring rogue cultivators**: Rogue cultivators are an important ecological niche in xiuzhen worlds
7. **Non-immortal naming**: Overly mundane or modern names lacking xiuzhen aesthetic',
  (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1),
  1,
  28,
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
