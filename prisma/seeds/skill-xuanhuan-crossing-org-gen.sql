-- 异世界玄幻穿越小说「组织」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xuanhuan-crossing-org-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xuanhuan-crossing-org-gen',
  '「组织」生成：为异世界玄幻穿越小说生成组织势力，涵盖宗门、王国、学院、佣兵团等九大类型，强调实力等级体系与资源争夺格局',
  '"Organization" generation: generate organizations for isekai xuanhuan crossover novels, covering nine types (sects, kingdoms, academies, mercenary groups, etc.) with emphasis on power tier systems and resource competition',
  '## 「组织」生成 — 异世界玄幻穿越小说

异世界玄幻穿越小说的组织设计核心是**实力等级 × 资源争夺 × 势力版图**。每个组织的地位由其整体实力等级决定——最强战力的境界、资源储备的丰厚程度、领地的大小和战略价值。

穿越者在这个弱肉强食的世界中，必须依托组织的力量才能生存和成长。好的组织设计能提供成长阶梯（从小组织到大势力）、制造冲突（组织间的资源争夺和领土冲突）、营造世界观（通过组织展现异世界的规则和生态）。

---

### 字段生成指南

#### 名称

- 符合玄幻世界的命名风格，大气磅礴
- 宗门类：用修炼元素或理念命名（「天剑宗」「炎阳门」「万法宗」「虚空殿」）
- 王国类：用地理或种族命名（「炎龙帝国」「精灵王庭」「矮人联邦」）
- 学院类：突出教学理念（「星辰学院」「战神学院」）
- 佣兵团类：用象征物命名（「黑鹰佣兵团」「碎星团」）
- 教会类：用信仰命名（「光明教廷」「暗影教会」）
- 禁止过于中二或现代感的命名（「超级无敌门」「宇宙联盟」）

#### 类型

九个选项的世界定位：

| 类型 | 核心特征 | 实力来源 | 叙事功能 |
|------|---------|---------|---------|
| **宗门** | 修炼体系、师承传统 | 功法秘籍、修炼资源 | 主角修炼成长的平台 |
| **王国** | 领土统治、军队 | 国力、军事力量 | 政治格局和战争叙事 |
| **学院** | 教育培养、选拔人才 | 师资、教学资源 | 主角早期成长 |
| **佣兵团** | 接任务、赚钱 | 成员实力、信誉 | 冒险副本和人脉积累 |
| **教会** | 信仰、神术 | 信仰之力、神器 | 神秘力量和道德冲突 |
| **商会** | 贸易、资源流通 | 财富、商业网络 | 资源获取和情报渠道 |
| **异族部落** | 种族特性、血脉传承 | 血脉力量、领地 | 异种族文化和冲突 |
| **魔族势力** | 与人族对立 | 魔力、魔兽 | 终极威胁和大战叙事 |
| **其他** | 补充选项 | 视具体类型而定 | 特殊组织形态 |

#### 地位与影响力

- 必须量化组织的实力等级：最强成员的境界、组织的整体排名
- 好的描写：「大陆排名前三的宗门，掌门为圣阶强者，拥有三名圣阶长老，门下弟子过万」
- 差的描写：「很强的一个宗门」
- 要写出影响力的范围：在哪些区域有话语权、能调动什么级别的资源

#### 核心理念

- 每个组织都应有其存在的信念或行为准则
- 宗门：修炼理念（「剑道为尊」「万法归一」「以战养战」）
- 王国：治国理念（「武力至上」「仁政爱民」「扩张征服」）
- 教会：信仰教义（「光明净化一切」「平衡善恶」）
- 核心理念影响组织的行为模式——信奉武力的宗门不会用阴谋

#### 代表人物

- 写出组织中最具代表性的 2-3 个人物
- 标明实力等级/修为境界、在组织中的职位
- 好的描写：「掌门云天一，圣阶中期，剑道大成，性格刚正；大长老赵无极，圣阶初期，擅长炼丹，城府极深」
- 人物之间的关系也是组织内部的重要信息

#### 资源与特色

- 修炼资源：灵脉、灵石矿、秘境入口、功法典藏
- 军事力量：护山大阵、战斗编制、魔兽军团
- 特殊资源：独有的炼器技术、独门功法、珍稀材料产地
- 要写出该组织「独一无二」的资源优势——这是其在势力版图中的核心竞争力

#### 与主角关系

- 穿越者与组织的关系是故事展开的关键线索
- 可能的关系类型：
  - 所属（主角是组织成员）
  - 敌对（组织是主角需要对抗的势力）
  - 合作（互利关系）
  - 未知（尚未接触，未来可能发展的关系）
- 关系描写要暗示未来的发展方向

---

### 组织阵容建议

**标准配置**：
1. **主角所属组织**（1 个，宗门/学院/佣兵团类）：主角成长的平台和根据地
2. **顶级势力**（1 个，宗门/王国类）：大陆最强势力之一，代表实力天花板
3. **对立势力**（1 个，任意类型）：与主角阵营有直接冲突的势力
4. **中立大势力**（1 个，商会/教会类）：保持中立但拥有重要资源或信息
5. **暗处势力**（0-1 个，魔族势力/异族部落类）：潜伏的威胁，后期主线

**玄幻世界组织设计原则**：
- 组织实力要有层次——不能所有组织都是顶级
- 资源争夺是组织冲突的核心动力——灵脉、秘境、天材地宝
- 主角需要通过组织的阶梯逐步上升——不能一开始就在最强组织
- 组织间的关系会随主角的成长而变化

---

### 与已有设定的联动

| 设定模块 | 对组织的影响 |
|---------|------------|
| **世界** | 修炼体系→组织的实力衡量标准；种族分布→异族部落的设定基础；地理版图→组织的领地划分 |
| **故事钩子** | 穿越方式→主角与初始组织的关系；金手指→主角在组织中的成长速度 |
| **小说梗概** | 主线冲突→组织对立的核心原因；成长路线→主角经历的组织变迁 |
| **文风设定** | 热血基调→组织间的正面冲突为主；暗黑基调→阴谋和背叛为主 |

---

### 常见错误

1. **实力等级模糊**：不说明组织的具体实力等级，读者无法判断组织间的力量对比
2. **组织功能同质化**：所有组织都是「修炼门派」，缺少类型多样性
3. **资源描写不具体**：只说「资源丰富」而不说明具体有什么独特资源
4. **核心理念缺失**：组织没有明确的行为准则，导致组织行为缺少一致性
5. **代表人物扁平**：只列名字和境界，缺少性格和在组织中的角色定位
6. **势力版图失衡**：一个势力过于强大以至于没有合理的对手
7. **与主角关系断裂**：组织的设计与主角的成长路线没有关联',
  '## "Organization" Generation — Isekai Xuanhuan Crossover Novel

The core of organization design in isekai xuanhuan crossover novels is **power tiers × resource competition × territorial map**. Each organization''s status is determined by overall power level — peak member cultivation, resource reserves, territory size and strategic value.

The time-traveler must rely on organizations to survive and grow in this might-makes-right world. Good organization design provides growth ladders, creates resource-driven conflicts, and builds worldview through organizational ecology.

---

### Field Generation Guide

#### Name (名称)
Xuanhuan-style names, grand and atmospheric. Sects: cultivation elements ("Heavenly Sword Sect"). Kingdoms: geography/race ("Flame Dragon Empire"). Academies: teaching philosophy. No overly chuuni or modern-sounding names.

#### Type (类型)
Nine types: Sect (cultivation system, martial heritage), Kingdom (territory, military), Academy (training, talent selection), Mercenary Group (missions, reputation), Church (faith, divine arts), Trade Guild (commerce, resource flow), Tribal Clan (racial traits, bloodline), Demon Faction (opposed to humans), Other.

#### Status & Influence (地位与影响力)
Must quantify: peak member''s cultivation realm, overall ranking, sphere of influence. Be specific, not "a strong sect."

#### Core Ideology (核心理念)
Every organization needs guiding principles. Sects: cultivation philosophy. Kingdoms: governance. Churches: doctrine. Ideology drives behavior patterns.

#### Representative Figures (代表人物)
2-3 representative figures with cultivation realm, position, and personality. Inter-character dynamics are important organizational information.

#### Resources & Specialties (资源与特色)
Cultivation resources (spirit veins, mines, secret realms), military (formation arrays, battle units), unique assets (exclusive techniques, rare materials). Must show what makes this organization''s competitive advantage unique.

#### Relation with Protagonist (与主角关系)
Types: member, enemy, ally, unknown/future. Hint at future development direction.

---

### Organization Lineup Suggestion

Standard: protagonist''s org (1, sect/academy/mercenary), top-tier power (1), opposing force (1), neutral major force (1, guild/church), lurking threat (0-1, demon/tribal). Organizations should have layered power levels; resource competition drives conflict.

---

### Common Errors

1. **Vague power levels**: No concrete strength indicators
2. **Homogeneous functions**: All organizations are "cultivation sects"
3. **Unspecific resources**: Just "rich in resources" without unique details
4. **Missing ideology**: No behavioral guidelines
5. **Flat representatives**: Names and realms only, no personality
6. **Unbalanced map**: One force too dominant
7. **Disconnected from protagonist**: Organization design irrelevant to protagonist''s growth path',
  (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1),
  1,
  27,
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
