-- 灵异司机职业流小说 - 场景生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ghost-driver-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ghost-driver-scene-gen',
  '场景生成：为灵异司机职业流小说设计具有双重属性（阳间/阴间）的公交站点与线路节点',
  'Scene generation: design dual-nature (living/ghost world) bus stops and route nodes for ghost bus novels',
  '## 场景生成 — 灵异司机职业流小说

灵异职业流小说的场景有一个独特属性：**每个地点在阳间和阴间有两张面孔**。司机在深夜驾驶时，同一个站点在不同时段呈现出不同的面貌，乘客生态也随之变化。好的站点设计让读者在读到某个地名时，既能看见现实城市，也能感受到那个地点的阴间回声。

---

### 字段生成指南

#### 站点名称

**命名原则**：

- 使用真实公交站命名逻辑（地名+「站」/「路口」/「广场」）
- 不要用「阴间X站」「鬼门XX」这类过度标注的名字
- 站名应该能召唤出城市记忆：
  - 医院站、殡仪馆路口、旧工厂区→ 功能性位置，乘客类型容易联想
  - 历史地名（「×朝遗址」「旧城门口」）→ 年代久远的存在
  - 普通居民区（「××花园」「幸福里」）→ 反差最强，普通名字下的不普通

**特殊站点类型**：
- **始发站/终点站**：叙事意义最重，应该花时间设计（见「公交系统设定」中的解释）
- **中途不停站**：某个站点主角「总是不停」或「不敢停」，本身就是一个悬念
- **幽灵站点**：只在阴间班次中出现的站点，白天根本不存在的地址

#### 站点类型

这是一个 enum 字段，选择一个主类型：

- **普通居民区站**：日常对比感最强，平静里藏危险
- **医疗机构站**（医院/诊所/急救中心）：新亡之魂集中地，高乘客密度
- **历史遗址站**（古迹/旧城区/历史建筑）：年代久远的存在，规则可能不同
- **工业区站**（工厂/仓库/码头）：事故史多，怨灵来源，深夜空旷感强
- **交通枢纽站**（火车站/汽车站附近）：来自远处的亡魂，「过路的」多
- **商业区站**（夜市/商场/娱乐场所）：执念类多（欠债/遗憾），活人与鬼混杂
- **终点/始发站**（特殊节点）：具有结构性叙事意义的站点

#### 阳间现状

描述这个地点白天（或者对普通人来说）的真实面貌：

- 功能性描述（现在用作什么）
- 地理位置和周边环境
- 可观察的历史痕迹（拆迁告示/旧建筑/废弃的东西）
- 普通人对这个地点的印象（便利、嘈杂、冷清还是繁华）

**叙事要点**：阳间现状越普通，阴间特征与之形成的落差越大。

#### 阴间特征

深夜班次中，这个站点呈现的不同面貌：

**从三个维度描述**：
1. **视觉变化**：光线/建筑外观/周边环境在阴间班次中如何变化（或不变化——有时候「什么都没变」反而更可怕）
2. **规则变化**：这个站点在阴间有什么特殊规则？（必须等满三分钟 / 不能往窗外看 / 某个时间段后禁止停靠）
3. **常驻特征**：这个站点固定会出现什么，还是每晚不同？

**阴间特征设计禁区**：
- ❌ 每个站都有「阴间镜像」（太复杂，读者记不住）
- ❌ 阴间特征太奇幻（「通往另一个维度的传送门」），失去城市感
- ✅ 大多数站只有细微异常，少数关键站有强烈的阴间属性

#### 常驻乘客类型

这个站点的「常规乘客生态」——不是单次出现的特殊存在，而是司机在这个站会预期遇到什么类型的乘客：

- 医院站：新亡之魂居多（刚从这里离开的）
- 旧城区：执念鬼（有历史遗留的未竟之事）
- 工业区：怨灵风险更高（工伤、意外历史）
- 普通居民区：新亡之魂 + 偶发的执念鬼

**设计原则**：常驻乘客类型应该能让司机提前有心理准备，但偶发的「不符合规律的乘客」才是故事真正的来源。

#### 已知风险

司机目前掌握的关于这个站点的危险信息：
- 某个时段某类存在更多
- 前任司机留下的警告
- 自己亲身经历总结的规律
- 不确定的模式（「好像每次满月这个站会……但我只碰到过两次」）

**设计要点**：已知风险越具体越有用，但刻意留白（「我不确定那次是偶然还是规律」）反而制造悬念。

#### 当前状态（isDynamic）

随故事发展更新：
- 该站点最近发生了什么
- 主角当前对它的态度（是否会主动跳过/格外注意）
- 未解决的疑问

---

### 站点设计的叙事功能

**站点 = 关系节点**：固定乘客会在固定站上车，站点和乘客绑定后，每次到这一站读者就会想起那个角色。

**站点 = 历史层积**：一个好的站点设计可以暗示这条线路的历史，主角随着经验增加，对每个站点的理解也会加深。

**站点 = 升级动机**：某些站点因为太危险而需要特定装备才能安全停靠，形成「先升级再去那个站」的自然目标链。

---

### 常见错误

- ❌ 站点没有区分度，每个都是「阴间气息浓厚的普通站台」
- ❌ 阴间特征描述重复（每个站都是「光线昏暗，有飘零的影子」）
- ❌ 站点数量太多，每个都用了等量的笔墨，没有主次
- ❌ 已知风险写成「这里非常危险」而不是「具体是什么危险」',
  'Scene Generation — Ghost Driver Paranormal Novel

Core principle: Every location has two faces — living-world appearance and ghost-world manifestation. The contrast between the ordinary daytime face and the night-shift anomalies is the primary source of dread.

**Stop naming**: Use real transit naming conventions (location + "stop/intersection/square"). Never use overtly supernatural names. Ordinary names create maximum contrast.

**Stop type enum**: residential district / medical facility / historical site / industrial zone / transport hub / commercial district / terminal/origin stop

**Three dimensions of ghost-world characteristics**:
1. Visual changes (lighting, architecture, environment — or "nothing changed at all," which is scarier)
2. Rule changes (must wait 3 minutes / cannot look out the window / closed after certain hour)
3. Permanent features vs. per-night variation

**Passenger ecology by stop type**:
- Hospital: newly deceased (just departed from here)
- Old city: obsession ghosts (historical unfinished business)
- Industrial zone: higher vengeful spirit risk (accident history)
- Residential: mixed newly deceased + occasional obsession ghost

**Narrative functions**:
- Stop = relationship node (fixed passengers board at fixed stops — readers anticipate)
- Stop = historical layer (protagonist''s understanding of each stop deepens over time)
- Stop = upgrade motivation (dangerous stops that require specific equipment to service safely)',
  (SELECT id FROM novel_creation_method WHERE name = '灵异司机职业流小说' LIMIT 1),
  1,
  22,
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
