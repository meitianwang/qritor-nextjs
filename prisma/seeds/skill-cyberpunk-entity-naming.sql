-- 赛博朋克小说创作 - 实体命名技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-cyberpunk-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cyberpunk-entity-naming',
  '实体命名：为赛博朋克小说中的角色、地点、组织、装备等实体提供符合赛博风格的命名指导',
  'Entity naming: provide cyberpunk-style naming guidance for characters, locations, organizations, and equipment',
  '## 实体命名 — 赛博朋克小说

赛博朋克的命名原则：**名字应该感觉像这个世界真实存在的产物**，而不是「为了显得赛博朋克而堆砌的词汇」。一个在高度混合文化、多族裔都市中生活的人，他的名字可能是三种语言的混合；一家公司的名字，应该像真实的企业，而不是「科幻感」标签。

---

### 一、角色命名

#### 主角与核心角色

赛博朋克世界的人名反映了**多文化融合和高度流动**的城市特性：

**真实姓名（法律意义上的身份）**：
- 多文化混合名（中日韩/欧美/混合）：「陈·木村·瑞秋」「卡洛斯·郑」「Mika Ivanova」
- 普通现代姓名为主（未来不一定会发明全新的名字格式）
- 避免：完全虚构的英文名（「Zyx Kairo」），除非有明确的文化背景解释

**街头代号（职业/帮派身份）**：
- 功能描述性：「幽灵（Ghost）」「针（Needle）」「断路（Cutoff）」
- 技术相关：「三十二位（32-bit）」「黑屏（Blackout）」「数据流（DataStream）」
- 轻微讽刺的：「薪水（Paycheck）」「合同（Contract）」「公平（Fair）」
- 结合义体特征：「镀银（Silver-plated）」「玻璃眼（Glass-Eye）」

**AI角色的命名**：
- 可以是功能性代号（「Nexus-7」「Echo）」）
- 也可以是自己选择的人类名字（更有叙事张力——「它选择叫方然」）
- 避免：「OMEGA」「ZEUS」这类过于宏大的神名

#### 配角命名

- 同事/战友：简短、有力的称呼（「老刀」「Rey」「博士」）
- 企业人员：正式感（「陈副总裁」「Park博士」「安保主管Li」）
- 街头人员：绰号为主，真名可选（「卖义体的那个」「Cruz」）
- 情报人员：越无特征越好（「联系人」「那个女人」）

---

### 二、地点命名

#### 城市/区域名

**底层/贫民窟**：
- 功能性地名（「废钢区」「旧港湾」「市场下面」）
- 企业遗址改称（「前Arasaka仓储区」「旧医疗中心废墟」）
- 街头俚语（「坑底」「霓虹沼泽」「地下城」）

**企业飞地**：
- 公司命名（「Biotechnica园区」「Nexus安全区」）
- 正式行政区命名（「第七特别经济区」「A-1禁区」）

**上城区**：
- 纯洁化的地名（「观景台」「天穹商务区」「黎明园」——越美化越讽刺）
- 或者就是直接的企业命名（「Apex Tower」「Pharmatek Central」）

#### 具体场所

好的场所名感觉像真实存在的地方，而不是象征性的：
- 地下酒吧：「最后一班（Last Call）」「零层（Layer Zero）」「拆迁前（Before Demo）」
- 义体诊所：「一刀不误（Precision Cuts）」「旧金属（Old Chrome）」「博士的地方（Doc''s）」（用非正式称呼更真实）
- 黑市：地点描述而非名称（「第三隧道下的那个市场」「夜班之后的旧市政厅地下室」）

---

### 三、组织命名

#### 巨型企业（Megacorp）

**有效的企业命名结构**：
- 两个词融合（科学/技术词 + 公司后缀）：「Biotechnica」「Nexus Corp」「Pharmatek」
- 东亚公司风格（汉字/日语 + 公司化）：「荒坂重工」「联邦基因」「远景科技」
- 防务/军事风格：「Apex Defense Systems」「Iron Meridian」「Guardian Solutions」

**禁忌**：
- ❌「邪恶企业」「黑暗公司」（显而易见的恶名）
- ❌ 太过平淡（「科技有限公司」——没有Megacorp的压迫感）

#### 街头帮派

**有效的帮派名**：
- 短、有力、有视觉感（「断路器（Breakers）」「铬骨（Chrome Bones）」「空频（Dead Air）」）
- 可以是原来的区域名或讽刺性名称（「旧市政」「五层楼的」）
- 避免：太「邪恶感」的名字（会失去「社区感」），或太「酷」的名字（失去真实感）

#### 地下/抵抗组织

- 内部代号而非公开名（「项目」「那边的人」「你知道的那些人」）
- 正式名称有时故意模糊（「公民网络」「信息自由同盟」——听起来像NGO）
- 武装组织：直白的、有地方感的（「夜城解放阵线」「第七区兄弟会」）

---

### 四、装备与义体命名

#### 义体型号命名

真实感来自「像真实产品」：
- 公司名 + 型号：「Arasaka Neural Interface NI-7」「Biotechnica OptEye Series 3」
- 街头改装名：「改版的NI-7」「旧款光学（别用那个品牌）」
- 行话/简称：「七系接口」「博士做的那个眼」

#### 武器命名

- 枪械：用真实或近未来的型号感命名（「TKI-5」「Apex PDW」「改装的毫米波」）
- 刃器：街头名/功能名（「单分子刃」「震动刃（Vibro-blade）」）
- 黑客工具：技术词 + 版本（「Breaker套件 v3」「黑蛇入侵程序（Black Mamba）」）

---

### 五、命名整体原则

1. **多文化混搭是常态**：不要假设未来只有一种语言或文化
2. **街头代号比真名更常用**：在底层圈子里，知道一个人的真名是信任
3. **企业名要感觉真实**：像真正的大公司，不像虚构反派
4. **地点名要有故事感**：好的地名让读者觉得这个地方有历史
5. **义体型号要有品牌感**：用「系列」「版本」「型号」创造真实感',
  'Entity Naming — Cyberpunk Fiction

Core principle: names should feel like natural products of this world, not vocabulary stacked "to seem cyberpunk." In a hyper-multicultural, high-mobility urban environment, names reflect that reality.

**Character naming**:
- Legal names: multicultural mixed (Japanese-American, Chinese-European, etc. hybrids); avoid completely invented English names unless there''s a cultural explanation
- Street handles: functional ("Ghost," "Needle," "Cutoff"); tech-adjacent ("32-bit," "Blackout"); lightly ironic ("Paycheck," "Contract"); cyberware-based ("Glass-Eye," "Silver")
- AI names: functional designation (Nexus-7) OR self-chosen human name (narratively more powerful: "it chose to be called Fang Ran")

**Location naming**:
- Bottom/sprawl: functional geography ("Old Steel District," "Below the Market"); corporate ruin names ("Former Arasaka Warehouse"); street slang ("The Pit," "Neon Swamp")
- Corporate enclaves: company-branded ("Biotechnica Campus"); administrative district ("Special Economic Zone 7")
- Upper city: sanitized, ironic beautification ("Skyview," "Dawn Commercial District") — the more beautiful the name, the more satirical
- Specific venues: feel like real places (underground bar: "Last Call," "Layer Zero"; ripperdoc: "Doc''s," "Old Chrome"; black market: location description, not a name)

**Organization naming**:
- Megacorps: two-word fusion (Biotechnica, Nexus Corp, Pharmatek); East Asian corp style (荒坂重工, 联邦基因); defense contractor style (Apex Defense Systems)
- Street gangs: short, visual, not overtly "evil" (Breakers, Chrome Bones, Dead Air)
- Underground orgs: deliberately vague public names (Citizens Network, Free Information Alliance — sounds like NGO)

**Equipment naming**:
- Cyberware models: brand + designation (Arasaka NI-7, OptEye Series 3); street variants ("Modified NI-7," "the eye Doc made")
- Weapons: type + version (TKI-5, Apex PDW); street names for blades (Single-Molecule Blade, Vibro-blade)
- Hacker tools: technical + version (Breaker Kit v3, Black Mamba intrusion suite)',
  (SELECT id FROM novel_creation_method WHERE name = '赛博朋克小说创作' LIMIT 1),
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
