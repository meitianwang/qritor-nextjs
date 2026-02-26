-- 赛博朋克小说创作 - 场景生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-cyberpunk-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cyberpunk-scene-gen',
  '场景生成：为赛博朋克小说设计感官化的霓虹都市地点——从底层贫民窟到赛博空间，每个地点都是「高科技低生活」的具体舞台',
  'Scene generation: design sensory cyberpunk locations — from ground-level sprawl to cyberspace, each location is a stage for the high-tech low-life contradiction',
  '## 场景生成 — 赛博朋克小说

赛博朋克场景设计的核心原则：**每个地点都是阶级的物理表达**。你在哪里，就能看出你处于什么阶层；你能去哪里，就能看出你拥有多少权力。好的场景设计不只是视觉美学，而是让「高科技低生活」的矛盾变得可以用感官感受到。

---

### 一、区域层级——空间即阶级

#### 上城区（企业精英区）

企业总部、精英住宅、人工公园。

**视觉特征**：洁白、玻璃、金属光泽、自然光（稀有）、广告是低调的而不是嘈杂的。

**气氛特征**：安静（声音被隔绝）、冷（空调、隔离感）、秩序（看不见安保但安保无处不在）。

**叙事功能**：主角进入上城区是一种越界——他能感受到自己「不属于这里」，或者他曾经属于这里（失去了）。

#### 中城区（中产过渡区）

混乱但有规则，进行中的生活，没有底层的压迫感也没有上层的安全感。

**视觉特征**：霓虹开始出现，广告变得嘈杂，人群密度增加，建筑是旧与新的混合。

**叙事功能**：信息交换、委托接洽的场所；两个世界之间的缓冲地带；危险的「仿安全感」（看起来正常，但规则不保护你）。

#### 底层贫民窟（Sprawl/底层）

**视觉特征**：
- 永远在下雨，或者感觉像在下雨（高湿度、水渍墙面）
- 霓虹灯是唯一的光源（广告主是唯一投资者）
- 垂直层叠的旧建筑加建（阳台变成房间，走廊变成市场）
- 人口密度极高，个人空间极小

**气味特征**：合成食品的油烟、金属和润滑剂、人群的汗味与香水的廉价混合。

**叙事功能**：主角的「根」（家、义务、认同）；或者主角正在逃离的地方；「高科技低生活」最直接的现场。

#### 企业飞地（封闭隔离区）

企业在城市中的殖民地——有独立的法律、安保和设施。

**视觉特征**：边界清晰（检查站、墙、力场）；内部是规划整齐的「另一个城市」；在底层贫民窟的中间突然出现一片整洁。

**叙事功能**：渗透目标、信息来源；高风险地带；内外的对比作为视觉化阶级批判。

#### 赛博空间节点

数字现实的物理入口——义体诊所的入侵椅、企业大楼地下室的神经连接装置、废弃公寓里的违法接入点。

**设计要点**：入侵点的物理环境往往与赛博空间内的感受形成对比——越破败的物理空间，进入越精密的数字世界，反差越强烈。

---

### 二、场所类型的感官模板

#### 夜市街道

赛博朋克最经典的场景。设计时要有「层次」：

```
顶层：建筑间悬挂的广告牌、霓虹招牌、露出一线天空
中层：店招、摊位顶棚、人群高度的噪音与光
地面：水坑、电缆、废弃物与人流
地下：下水道的声音、偶尔开启的地下通道入口
```

**感官密度建议**：视觉（5种颜色的霓虹）+ 听觉（3种不同音源）+ 嗅觉（1种主导气味）

#### 地下酒吧/夜店

信息交换的天然场所。设计时注意：
- 音乐震耳欲聋是刻意的（阻止窃听）
- 私密包厢存在，但「包厢费」本身就是权力的展示
- 调酒师/老板是信息源，同时也是多方的线人

#### 义体诊所

底层社区的心脏。设计要素：
- 合法门面（按摩/理疗）后的真实业务
- 等候区充满故事（各种改造程度的人）
- 义体医生的道具（修改手术台、旧型号的义体样品）

#### 赛博空间界面

物理空间（入侵点）和数字空间之间的过渡，两种空间的描写方式应该明显不同：

物理侧：主角的身体极度脆弱，环境是具体的（温度、气味、可能的干扰源）
数字侧：感知方式改变，「看到」的是数据的视觉化，危险来自程序而非物理

---

### 三、场景的叙事功能要明确

每个场景存在于故事中，都应该承担至少一种功能：

| 功能类型 | 如何实现 |
|---------|---------|
| 信息获取 | 渠道可信但有代价，信息是否完整存疑 |
| 行动展开 | 场景的物理特性影响行动可能性（逃跑路线、遮蔽物、监控盲点） |
| 关系发展 | 特定场所与特定关系绑定（每次出现这个地方，就想到某个人） |
| 阶级批判 | 场景的存在本身就是一种观点（上层的奢华与底层的对比） |
| 情绪着陆 | 主角回到某个地方时，场景的细节承载情绪重量 |

---

### 四、常见错误

- ❌ 所有底层场景都是「美丽的贫穷」——霓虹美学不能代替真实的苦难感
- ❌ 赛博空间场景和物理场景用同样的描写方式——数字空间应该有不同的感知逻辑
- ❌ 场景只是背景，没有势力控制和规则——每个地方都有谁在管的问题
- ❌ 上城区永远是恶的，底层永远是善的——每个阶层都有复杂性',
  'Scene Generation — Cyberpunk Fiction

Core principle: every location is a physical expression of class. Where you are reveals your social tier; where you can go reveals how much power you hold.

**Vertical zone system**:
- Upper city: white, glass, natural light (rare), quiet (sound-insulated), invisible security — protagonists entering feel "don''t belong here"
- Mid-city: chaotic but ruled, dangerous false sense of safety (looks normal, but rules don''t protect you)
- Bottom sprawl: permanent rain sensation, neon as only light source (advertisers are the only investors), stacked repurposed buildings, extreme population density — the most direct stage for high-tech low-life
- Corporate enclaves: hard borders, planned interior like a different city, sharp contrast appearing mid-slum
- Cyberspace nodes: the more decrepit the physical access point, the more precise the digital space entered — maximum contrast

**Sensory templates**:
- Night market street: layer it (overhead neon → mid-level crowd noise → ground-level water puddles and cables → underground sounds)
- Underground bar: music designed to prevent eavesdropping; booth fees as power display; bartender as multi-faction informant
- Ripperdoc clinic: legitimate front + real business behind; waiting room full of stories; organic/synthetic boundary
- Cyberspace interface: physical side (body extremely vulnerable, concrete environment) vs. digital side (perception method changes, danger comes from programs not physics)

**Scene narrative function**: every scene should carry at least one of: information acquisition (source credible but costly); action enablement (escape routes, cover, surveillance gaps); relationship anchoring (this place = that person); class critique (existence itself is a statement); emotional landing (details carry emotional weight on return visits).',
  (SELECT id FROM novel_creation_method WHERE name = '赛博朋克小说创作' LIMIT 1),
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
