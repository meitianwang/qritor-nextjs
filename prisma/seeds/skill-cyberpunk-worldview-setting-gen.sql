-- 赛博朋克小说创作 - 「世界观设定」设定生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-cyberpunk-worldview-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cyberpunk-worldview-setting-gen',
  '「世界观设定」设定生成：为赛博朋克小说构建霓虹都市的骨架——企业统治、阶层结构与环境崩溃',
  '"Worldview" setting generation: build the skeleton of the neon city — corporate control, social stratification, and environmental collapse',
  '## 「世界观设定」设定生成 — 赛博朋克小说

赛博朋克的世界观设计有一个核心原则：**世界应该感觉像一个「合乎逻辑的错误结果」**——是现实世界的某些趋势被放大到极端的产物，而不是凭空创造的幻想。读者看到这个世界时，应该感到「如果一切继续这样下去，这完全有可能发生」。

---

### 一、城市——赛博朋克的主角

在赛博朋克中，城市本身是一个角色。好的赛博朋克城市有以下特征：

#### 垂直分层（最重要的空间语言）

赛博朋克城市在垂直方向上是阶级的物理化：

```
顶层：企业总部、富人住宅区（永远阳光、人工植被、安静）
         ↕  几百米高差
中层：商业区、中产住宅、服务业（混乱但有规则）
         ↕  永远的遮蔽与阴影
底层：贫民窟（永远潮湿、噪音、霓虹、人口密集）
```

**关键设计原则**：上层看不见下层，下层却随时能看见上层（企业大楼的灯光永远亮着）。

#### 城市命名

好的赛博朋克城市名体现「大型/融合/公司化」：
- 原有城市名 + 规模化（「大东京联合都市圈」「新上海特区」）
- 企业命名（「Arasaka City」「Militech Control Zone」）
- 中性地理描述（「第四区」「夜城」「海湾聚落」）

**避免**：名字过于古风或过于梦幻化。

---

### 二、企业统治——权力的四种形态

**设计原则**：企业统治的深度决定了主角的「行动空间」。统治越彻底，主角能做的事越少，张力越大；统治越混乱，主角有更多操作空间，但也更危险。

| 统治类型 | 世界感受 | 主角处境 |
|---------|---------|---------|
| 全面控制 | 无处不在的监控，企业法律取代国家法律 | 连基本的生存都依赖企业授权 |
| 寡头竞争 | 不同势力的边界地带有短暂的自由缝隙 | 在巨头之间的夹缝中求生 |
| 架空政府 | 政府存在但无实权，企业通过收购立法者运作 | 表面上有「合法」选项，但法律不保护穷人 |
| 混乱割据 | 不同区域由不同势力管控，秩序因地而异 | 最危险，但也有最多的灰色地带 |

---

### 三、阶层结构——让不平等可见

好的赛博朋克阶层设计不是「富人 vs 穷人」的简单二分，而是多层次的：

**阶层细化方向**：
- **企业内部阶层**：高管（几乎不接触街头世界）→ 中层员工（有限的特权）→ 临时工/外包（企业皮但没有企业保护）
- **街头阶层**：独立运营者（自由但脆弱）→ 帮派成员（有保护但有义务）→ 底层无家可归者（完全被系统抛弃）
- **义体阶层**：义体等级作为新的阶级标志（能改造什么器官，反映经济状况）

**关键叙事功能**：阶层是主角「想去但去不了的地方」和「落下去就出不来的地方」的来源。

---

### 四、环境——世界的物理状态

赛博朋克的环境设计要服务于氛围，而不只是背景信息：

**「永远在下雨」的深层含义**：
- 物理层面：空气污染导致降水酸化，雨是污染的一部分
- 感官层面：雨水反射霓虹灯，制造视觉上的魔幻与真实混合
- 隐喻层面：干净的天空是只有上层才能看到的东西

**环境状态与叙事的关系**：
- 极度污染 → 义体肺、净化口罩成为日常，生存本身就需要技术支持
- 部分污染 → 阶级在字面意义上影响「你呼吸的空气的质量」
- 人工生态维持 → 大自然已经消失，只有企业管理的人工绿地（奢侈品）

---

### 五、底层生活细节——让世界感到真实

世界观不是地图和历史，而是让读者感到「这个地方真实存在」的细节：

**有价值的底层生活细节**：
- 食物来源（合成蛋白质、街头摊贩、企业配发的卡路里包）
- 居住方式（堆叠的旧建筑改建隔间、胶囊旅馆式的廉价住所、废弃工厂的自发定居区）
- 信息获取（破旧的二手数据终端、非法共享的网络节点、口耳相传的街头情报）
- 医疗（私人义体医生作为底层的「家庭医生」、在黑市买药、义体排异无钱处理）

**避免**：把底层生活写得过于「美丽的贫穷」（只有霓虹美学没有真实苦难），或过于猎奇（把贫困当成视觉素材而非叙事现实）。

---

### 六、常见错误

- ❌ 世界观设定里「高科技」只是装饰——如果去掉义体和AI，故事同样成立，说明科技没有深入世界观
- ❌ 阶级只是标签，没有体现在日常细节中（「底层很穷」不够，需要「底层的人用什么吃饭、怎么生病、如何被拒于门外」）
- ❌ 城市作为静态背景而非动态环境——赛博朋克城市应该在读者眼前「活着」
- ❌ 环境崩溃只是氛围，没有对角色行为产生实际影响',
  '"Worldview" Setting Generation — Cyberpunk Fiction

Core principle: the world should feel like "a logically valid bad outcome" — the end result of real-world trends pushed to extremes.

**Vertical city stratification** (the most important spatial language): top (corporate HQ, clean air, artificial greenery) → middle (commercial chaos, partial order) → bottom (slums, permanent rain, neon, overcrowding). Crucially: the upper class cannot see the lower class, but the lower class always sees the towers above.

**Four corporate control types**:
- Total control: existence itself requires corporate authorization
- Oligopolist competition: cracks between giants are the protagonist''s operating space
- Shell government: laws exist but protect no one without money
- Chaotic fragmentation: most dangerous, but most gray zones

**Multi-tier class design** (not simple rich/poor): corporate hierarchy (exec → employee → temp contractor with no protection); street hierarchy (independent operators → gang members with obligations → the abandoned); cyberware tier as new class marker (what organs you can afford to replace reflects economic status).

**Environmental design serving narrative**: rain reflects neon (magical realism of decay); air quality literally varies by class level; artificial ecologies as luxury goods.

**Ground-level authenticity details**: synthetic protein food; stacked repurposed buildings; second-hand data terminals; ripperdocs as bottom-tier family doctors.

**Avoid**: technology as decoration (if removing cyberware doesn''t affect the story, it''s not integrated); class as label without daily-life details; beautiful poverty (neon aesthetic without real suffering).',
  (SELECT id FROM novel_creation_method WHERE name = '赛博朋克小说创作' LIMIT 1),
  1,
  11,
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
