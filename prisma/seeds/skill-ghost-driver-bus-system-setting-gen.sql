-- 灵异司机职业流小说 - 「公交系统设定」设定生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ghost-driver-bus-system-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ghost-driver-bus-system-setting-gen',
  '「公交系统设定」设定生成：为灵异司机职业流小说设计有逻辑的运营体系、乘客生态与成长系统',
  '"Bus System" setting generation: design a logically consistent operational system, passenger ecology, and growth mechanics for ghost bus novels',
  '## 「公交系统设定」设定生成 — 灵异司机职业流小说

公交系统设定是这类小说的「世界物理规律」——它回答「这个系统为什么需要存在」「主角如何在其中生存和成长」。好的公交系统设定让读者感到这条线路是整个阴阳世界的有机组成部分，而不是为了故事而强行搭建的舞台。

---

### 字段生成指南

#### 线路概况

**线路命名建议**：
- 用真实公交线路的命名逻辑（「X路」「XX号线」），不要用「冥界特快」这种过度标注的名字
- 可以选择一个有历史意义的线路编号（如「7路」在很多城市是历史最久的线路）
- 线路经过的区域类型决定乘客生态：住宅区-医院-古迹-商业区 vs 全工业区

**起终点站的叙事意义**：

| 起点站类型 | 叙事含义 |
|----------|---------|
| 普通车库/停车场 | 平凡起点，对比感强 |
| 城郊某处无名地点 | 主角不知道这里「应该」是什么 |
| 终点站：城市边界 | 象征超出日常秩序的边缘 |
| 终点站：冥府入口 | 每趟都是将乘客送到那里 |

#### 运营时段

**阴间模式切换时机的设计**：
- **准时切换型**（23:00起，普通班次消失，阴间班次出现）：规则清晰，读者容易理解
- **渐进式切换型**（深夜后乘客逐渐从活人变为非人）：代入感更强，主角也不确定
- **触发式切换型**（当最后一个活人乘客下车后切换）：悬念更高，但规则更复杂

**时段乘客规律**（可参考）：
```
23:00-00:00：新亡之魂为主（刚去世，还不习惯，行为接近活人）
00:00-02:00：执念鬼为主（有未了的事，目的性强）
02:00-04:00：高危时段（年代久远的存在、厉鬼、非人存在）
04:00-05:00：收尾时段（少数留守的，或是来观察司机的）
```

#### 乘客来源

**乘客生态设计原则**：不同类型的乘客应该有不同的「乘客规矩」——它们上下车的方式、对司机的态度、相互之间的关系都不同。

**主要乘客类型及行为规律**：

| 类型 | 行为特征 | 对司机态度 | 潜在危险 |
|------|---------|----------|---------|
| 新亡之魂 | 困惑，可能不知道自己死了 | 以为在坐正常公交 | 低（但情绪不稳） |
| 执念鬼 | 目的明确，情绪强烈 | 把司机当工具 | 中（若任务未完成会烦躁） |
| 路过型妖怪 | 只是顺路，不感兴趣 | 无视司机 | 低（不要惹） |
| 来办事的神明/信差 | 公务在身，效率优先 | 高度警觉，严格审视 | 高（若冒犯） |
| 刻意找麻烦的存在 | 专门上这班车的目的不明 | 主动与司机互动 | 极高 |

#### 车辆初始状态

**初始设定的叙事功能**：车辆初始状态越差，升级的成就感越强；但不能差到「根本无法完成第一班次」。

**推荐的初始弱点配置**：
- 一个高频危险但可以临时应付的缺陷（如「后排灯坏了，看不清最后两排」）
- 一个让主角从一开始就知道必须赚钱来修的问题（如「驱邪符已过期，重新贴需要特定冥币」）
- 一个前任司机留下的改装（功能不明，是惊喜还是陷阱？）

#### 升级体系

**升级体系设计的三个关键原则**：

1. **进度可见**：主角和读者都能清楚看到当前状态和下一个目标（冥币余额、装备耐久度、解锁条件）

2. **选择有意义**：当有足够的冥币时，主角面临不同路线的选择（防御升级 vs 功能升级 vs 个人技能），每个选择都会影响后续班次的体验

3. **成长有代价**：某些升级不只是花钱——强力装备需要「特殊材料」，材料获取本身就是故事

**常见升级层级**：
```
第一阶段（生存基础）：
  - 补齐基础防护（驱邪符/防鬼玻璃/车门加固）

第二阶段（危机应对）：
  - 主动处理能力（威慑装备/谈判工具）
  - 信息收集（查询乘客背景/预测今晚班次）

第三阶段（掌控全局）：
  - 线路优化（跳过特定站点/修改班次时间窗口）
  - 关系网络（与特定常客建立交易关系）
```

#### 竞争者

**竞争者设定的叙事价值**：其他司机是镜子——他们的选择、失败、成功能告诉主角（和读者）这个世界的规则如何运作。

**竞争者类型**：
- 老司机（在职10年以上，能生存是因为从不多管闲事）：智慧的来源，但信息有代价
- 激进的同期新人（走捷径、冒险升级快）：反面教材，展示「赌赢了」和「赌输了」的结局
- 已离职/失联的前任司机（通过遗留物品讲故事）：悬念来源

---

### 字段联动关系

- **运营时段 → 站点设计（阴间特征）**：不同时段经过同一站台，出现的乘客类型不同
- **乘客来源类型 → 角色设计（危险等级）**：乘客生态决定了哪些角色会是高危存在
- **车辆初始状态缺陷 → 公交装备（获取方式）**：初始缺陷应该能用前几章赚到的冥币修复，给升级体系提供动力
- **升级体系 → 情节设计（事件编排）**：升级里程碑应该对应情节的转折点

---

### 常见错误

- ❌ 线路设计太超自然（「穿越维度」「时间逆流的站台」），失去日常职业感
- ❌ 乘客生态太单一（所有乘客都是凶恶厉鬼），缺乏生态多样性
- ❌ 升级系统没有限制，主角几章后就全部解锁，失去成长张力
- ❌ 竞争者设置得太相似，失去多样性叙事价值',
  '"Bus System" Setting Generation — Ghost Driver Paranormal Novel

The bus system is the "physics" of this story world — it answers why this system needs to exist and how the protagonist survives and grows within it.

**Route design**: use real transit naming conventions; the start/end points carry narrative meaning (depot=ordinary origin; city boundary=edge of normal order; underworld entrance=every trip delivers passengers there).

**Schedule switching**: fixed-time (clean, understandable), gradual (immersive, uncertain), trigger-based (dramatic but complex).

**Passenger ecology by time slot**: 11pm-midnight: newly deceased (confused, human-like behavior); midnight-2am: obsession ghosts (goal-driven); 2am-4am: high-danger period (ancient entities, vengeful spirits); 4am-5am: stragglers and observers.

**Upgrade system principles**: visible progress (clear current state and next milestone), meaningful choices (defense vs. offense vs. information), growth with cost (powerful equipment needs special materials that are themselves a story).

**Competitor types**: veteran driver (survival through non-intervention), aggressive newcomer (fast upgrades, high risk), missing/former driver (tells story through left-behind objects).',
  (SELECT id FROM novel_creation_method WHERE name = '灵异司机职业流小说' LIMIT 1),
  1,
  12,
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
