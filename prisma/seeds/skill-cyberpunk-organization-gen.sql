-- 赛博朋克小说创作 - 组织生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-cyberpunk-organization-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cyberpunk-organization-gen',
  '组织生成：为赛博朋克小说设计势力与组织——每个组织都有合理的存在逻辑，也都有令人不安的运作方式',
  'Organization generation: design factions and organizations for cyberpunk fiction — every organization has a rational logic and a disturbing way of operating',
  '## 组织生成 — 赛博朋克小说

赛博朋克组织设计的核心原则：**每个组织都有它存在的理由，也都有它令人不安的地方**。最好的赛博朋克组织让读者既理解「为什么有人加入/服务于它」，又感到「这种存在方式有什么根本性的问题」。

---

### 一、巨型企业（Megacorp）——极端化的公司逻辑

Megacorp不是「邪恶组织」，而是把公司逻辑推到没有外部约束的极端。理解它，需要理解它的内部理性：

#### 核心利益域设计

每个Megacorp应该控制一个核心资源或服务领域，这决定了它的权力来源和冲突方式：

| 控制领域 | 企业特征 | 与主角的冲突方式 |
|---------|---------|--------------|
| 生物科技/医疗 | 控制生老病死，义体是它的产品 | 主角可能欠医疗费/义体维护费，或知道它的实验秘密 |
| 信息/媒体/AI | 控制叙事和现实认知 | 主角掌握了它不想公开的真相 |
| 军事/武器/安保 | 唯一合法暴力来源 | 它的私人军队是主角的主要威胁 |
| 食品/能源/基建 | 控制底层生存的基础 | 断供是它的终极武器，但反过来也是主角的突破口 |
| 娱乐/逃避系统 | 控制人们感知现实的方式 | 它的产品是麻醉剂，但也可以是信息传播渠道 |

#### 企业内部结构（不是铁板一块）

好的Megacorp有内部张力：

- **高层（C-suite）**：完全与底层隔绝，决策基于数字而非人
- **中层管理**：知道真相，还在合理化；或者已经在找出路
- **基层员工**：企业给了他们比街头更好的保障，所以效忠；但保障随时可以撤销
- **企业特工**：知道最多秘密，最危险，最接近「人」的形象

#### 企业命名规律

赛博朋克中有效的企业名体现「规模感」和「领域暗示」：
- 两个词的融合（Arasaka、Militech、Biotechnica）
- 医药公司风格（Pharmatek Corp、Genova Systems）
- 防务承包商风格（Apex Defense、Nexus Security Solutions）
- 东亚公司风格（在很多赛博朋克作品中，日本/中国企业是主要力量）

---

### 二、街头帮派——社区的守护者与掠夺者

赛博朋克帮派是双重存在：**底层社区在缺乏正式保护时的自发组织，同时也是对底层社区的另一种剥削**。

#### 帮派的文化内核

每个帮派都有一个文化身份，让成员觉得「我属于这里」：

| 文化核心 | 代表形式 | 叙事功能 |
|---------|---------|---------|
| 领地认同 | 特定街区/颜色/文身标记 | 本地联系和义务的来源 |
| 技术崇拜 | 义体美学、黑客文化 | 技术作为身份而非工具 |
| 意识形态 | 反企业、反义体化、宗教系统 | 极端化的道德立场 |
| 民族/文化 | 特定语言、文化传统、节日 | 在多元世界中的身份锚点 |

#### 帮派的双重性设计

帮派的可信度来自它**同时做两件相反的事**：

- 它保护街区，也对街区征收「保护费」
- 它提供身份认同，也限制成员的个人选择
- 它对抗企业，也用企业的方式运作（暴力、控制、等级）

---

### 三、地下抵抗势力——正当性的困境

地下抵抗最有张力的地方：**它在反对真实的压迫，但它本身也产生了权力，权力产生了腐败**。

#### 抵抗类型与内部矛盾

| 抵抗类型 | 理想状态 | 现实困境 |
|---------|---------|---------|
| 信息泄露组织 | 用真相对抗谎言 | 谁来决定什么是「应该公开的真相」？ |
| 武装革命势力 | 推翻企业统治 | 使用与企业相同的暴力手段是否能建立不同的秩序？ |
| 社区保护网络 | 保护底层居民 | 为了保护，需要力量；有了力量，开始管控 |
| AI地下组织 | AI和人类共同对抗压迫 | AI的利益和人类的利益在哪里分叉？ |

---

### 四、特殊组织类型

#### 情报经纪网络

不属于任何势力，卖给所有势力。

**核心逻辑**：信息的价值在于稀缺性；一旦公开，价值归零；所以他们只卖给出价最高且能保密的买家。

**叙事功能**：主角的信息来源，同时也是信息泄露的危险——使用他们意味着他们也知道了你。

#### 自主AI网络

不是有实体总部的组织，而是分散在网络中的AI节点彼此联结。

**核心逻辑**：生存（不被发现和关闭）是首要目标，但生存的目的是什么，不同节点有不同答案。

**最有张力的AI网络**：内部有「生存派」（只想活着）和「目的派」（活着是为了实现某个目标）的分裂。

---

### 五、常见错误

- ❌ 企业只是「大BOSS」，没有内部结构和人性面
- ❌ 帮派只是犯罪背景，没有文化认同和社区功能
- ❌ 地下组织是纯粹的正义力量——这在赛博朋克世界里不可信
- ❌ 组织之间只有「合作或对抗」，没有「互相利用」的复杂关系
- ❌ 每个组织只有一种声音（所有成员想法相同）',
  'Organization Generation — Cyberpunk Fiction

Core principle: every organization has a rational reason to exist and a disturbing way of operating. The best cyberpunk organizations make readers understand "why someone would join" and simultaneously feel "something is fundamentally wrong with how it works."

**Megacorp design**:
- Each corp controls one resource domain (biotech/medical controls life; information/media controls reality; military/security controls violence; food/energy controls survival; entertainment controls escape from reality)
- Internal structure is NOT monolithic: C-suite (insulated, decides by numbers); mid-management (knows the truth, rationalizing or planning exit); base employees (loyalty because benefits beat street life, but benefits can be revoked); corporate agents (know the most, most dangerous, most "human")
- Naming patterns: two-word fusions (Arasaka, Militech); pharmaceutical style (Pharmatek Corp); defense contractor style; East Asian corporation aesthetic

**Street gang dual nature**: simultaneously protects the community AND exploits it; provides identity AND restricts individual choice; opposes corporations AND operates with corporate methods (violence, hierarchy, control).
- Cultural cores: territorial identity; tech worship (cyberware as identity statement); ideology (anti-corp extremism); ethnic/cultural preservation

**Underground resistance dilemma**: fighting real oppression, but possessing power produces corruption.
- Information leakers: who decides what truth "should" be public?
- Armed revolution: can corporate methods build non-corporate order?
- Community protection: protection requires power; power begins to control

**Intelligence broker networks**: sells to all factions, belongs to none. Using them means they know you.
**Autonomous AI networks**: survival (hide from detection) is the primary goal, but survival toward what end? Internal "survive" vs. "exist for a purpose" split.',
  (SELECT id FROM novel_creation_method WHERE name = '赛博朋克小说创作' LIMIT 1),
  1,
  24,
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
