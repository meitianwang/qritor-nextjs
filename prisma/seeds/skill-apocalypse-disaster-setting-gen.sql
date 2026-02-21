-- 末世天灾囤货流「天灾档案」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '末世天灾囤货流' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-apocalypse-disaster-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'apocalypse-disaster-setting-gen',
  '「天灾档案」设定生成：为末世天灾囤货流生成天灾档案设定，包括灾难名称（EventName）、灾难类型（Type）、灾难阶段（Phase）和环境影响（Impact）',
  '"Disaster Archive" setting generation: generate disaster archive settings for the post-apocalyptic hoarding genre, including disaster name (EventName), disaster type (Type), disaster phase (Phase), and environmental impact (Impact)',
  '## 「天灾档案」设定生成 — 末世天灾囤货流

天灾档案是本创作方法的核心驱动力。每一场天灾都是 event 类别的非 singleton 实体，可以创建多个。天灾档案定义了故事中的灾难事件，驱动物资消耗、人际冲突和叙事节奏。

---

### 字段生成指南

#### EventName（灾难名称）

灾难名称必须具体且有画面感，让读者一看就能联想到灾难场景。

好的命名方式：
- 带序号标记递进："第一次极寒浪潮"、"第二次酸雨季"
- 带地域或特征修饰："北方大冰封"、"赤道热浪"
- 带情感色彩的别名："黑色暴风雪"、"死亡酸雾"

避免：
- 过于笼统的名称（"天灾"、"灾难"）
- 没有辨识度的编号（"灾难1号"、"事件A"）

#### Type（灾难类型）

从以下八种类型中选择。每种类型有不同的核心威胁、关键物资需求和叙事功能：

| Type | 核心威胁 | 关键物资需求 | 叙事功能 |
|------|---------|-------------|---------|
| **极寒** | 冻死、取暖困难 | 燃料、保暖衣物、食物热量 | 困守基地、考验储备 |
| **极热** | 中暑、水源蒸发 | 水、制冷设备、遮阳材料 | 水资源争夺战 |
| **洪涝** | 淹没、疾病、交通断绝 | 高地、船只、净水设备 | 迫使迁移、分离角色 |
| **酸雨** | 腐蚀、空气污染 | 防护服、密封材料、室内农业 | 限制户外活动、困境感 |
| **虫灾** | 农作物毁灭、疾病传播 | 杀虫剂、密封粮仓、医疗用品 | 食物危机的催化剂 |
| **地震** | 建筑倒塌、地形改变 | 建材、工具、应急医疗 | 摧毁基地、重建叙事 |
| **尸潮** | 直接人身威胁 | 武器、防御工事、弹药 | 战斗场景、牺牲与英雄主义 |
| **瘟疫** | 传染死亡、隔离 | 医药、隔离设施、防护装备 | 信任危机、要不要接纳外人 |

**选择建议**：
- 第一场天灾建议选单一型（极寒或极热），检验基本储备
- 后续天灾应与前面的类型形成互补或叠加，避免重复同一类型
- 考虑天灾类型与避难所选址的匹配度——选址的弱点对应的天灾最能制造戏剧张力

#### Phase（灾难阶段）— isDynamic 字段

Phase 是标记为 isDynamic 的字段，其值随故事推进而变化。初始创建天灾档案时需要设定当前阶段，之后在关键剧情节点更新。

阶段流转路径：**前兆期 → 爆发期 → 持续期 → 消退期**

| Phase | 叙事功能 | 典型事件 |
|-------|---------|---------|
| **前兆期** | 制造紧张、最后的准备窗口 | 异常天象、动物迁徙、温度骤变、气压反常 |
| **爆发期** | 高潮、生存危机 | 灾难正面袭来、第一批伤亡、社会秩序崩塌 |
| **持续期** | 消耗战、人际矛盾激化 | 物资持续消耗、士气下降、叛逃者出现、内部分裂 |
| **消退期** | 短暂喘息、评估损失 | 清点物资、修复设施、决定下一步、为下一灾做铺垫 |

**Phase 设定建议**：
- 新创建的天灾档案通常从"前兆期"开始
- 如果故事直接从灾难中开始（如第一章就是灾难爆发），可以设为"爆发期"
- 在创作过程中，当灾难阶段发生转变时，必须使用 `update_field_dynamic_info` 更新 Phase 字段
- 前兆期建议持续 1-3 章，爆发期 2-5 章，持续期 5-10 章，消退期 1-3 章

**Phase 动态管理要点**：
- Phase 是时间线标记器——通过 Phase 的变化可以追踪故事进展到哪个阶段
- Phase 是张力调节器——爆发期是最高张力，消退期是喘息，前兆期是酝酿
- Phase 是决策触发器——不同阶段角色的行为重心完全不同（前兆期是准备、爆发期是应急、持续期是管理、消退期是重建）
- 多灾并行时，每场天灾的 Phase 独立追踪，可能出现"第一灾消退期 + 第二灾爆发期"的叠加

#### Impact（环境影响）

Impact 必须具体描述灾难对环境、生态和人类活动的影响。避免笼统描述，要有可量化的细节。

好的 Impact 示例：
- "气温降至-45°C，地表积雪超过2米，所有暴露管道冻裂，混凝土墙面出现冻融裂缝，户外停留超过15分钟即有冻伤风险"
- "降水pH值2.4，露天金属设施腐蚀速度加快20倍，植被在48小时内枯萎，未经过滤的空气吸入可导致化学性肺炎"
- "里氏8.2级地震，持续震动47秒，80%的低层建筑倒塌，地面出现宽达3米的裂缝，余震频率每天12-15次，防御工事损毁率超过60%"

**Impact 必须回答这些问题**：
- 灾难对避难所有什么直接威胁？
- 哪些物资的消耗会加速？
- 户外活动受到什么限制？
- 次生灾害有哪些可能？

**多灾叠加时的 Impact 写法**：当多灾叠加时，Impact 应记录叠加后的复合效果。例如："极寒风暴持续中叠加尸潮：气温-38°C，冻僵的尸体在室内热源处聚集，防御人员无法在户外停留超过10分钟进行射击清除，弹药在极低温下可能卡壳"。

---

### 天灾递进设计原则

**核心原则：天灾必须递进，不能平铺。**

推荐的递进模式：
- 第一灾（单一型）：极寒或极热 → 检验基本储备
- 第二灾（叠加型）：酸雨+虫灾 → 户外活动受限+食物危机
- 第三灾（升级型）：地震 → 摧毁现有基地，迫使重建
- 第四灾（复合型）：瘟疫+尸潮 → 内外夹击，最终考验

**递进维度**：
1. **强度递进**：每次天灾比上一次更严重（温度更低、震级更高、持续时间更长）
2. **类型叠加**：多种天灾同时或连续出现，应对方案互相矛盾
3. **覆盖范围扩大**：从局部到全域，无处可逃
4. **恢复期缩短**：还没喘过气下一灾就来了，前一灾的消退期和下一灾的前兆期重叠

**设计一场新天灾时的检查清单**：
- [ ] 这场天灾比上一场更严重吗？（强度递进）
- [ ] 这场天灾的 Type 与之前的不同或形成叠加吗？（类型多样性）
- [ ] Impact 是否具体描述了对避难所和物资的影响？
- [ ] Phase 的初始值是否合理？
- [ ] 这场天灾会触发哪些角色的道德困境？
- [ ] 哪些物资的 Quantity 会因此急剧下降？',
  '## "Disaster Archive" Setting Generation — Post-Apocalyptic Hoarding Genre

Disaster Archives are the core driver of this creation method. Each disaster is a non-singleton entity of the event category; multiple can be created. Disaster Archives define the catastrophic events in the story, driving supply consumption, interpersonal conflict, and narrative pacing.

---

### Field Generation Guide

#### EventName (Disaster Name)

The disaster name must be specific and evocative, enabling readers to immediately visualize the catastrophe.

Good naming approaches:
- Sequential markers showing escalation: "First Polar Vortex," "Second Acid Rain Season"
- Geographic or characteristic modifiers: "Northern Great Freeze," "Equatorial Heat Wave"
- Emotionally-charged aliases: "Black Blizzard," "Death Acid Fog"

Avoid:
- Overly generic names ("Disaster," "Catastrophe")
- Nondescript numbering ("Disaster No.1," "Event A")

#### Type (Disaster Type)

Choose from the following eight types. Each type has distinct core threats, key resource demands, and narrative functions:

| Type | Core Threat | Key Resource Demand | Narrative Function |
|------|-------------|--------------------|--------------------|
| **Extreme cold** | Freezing, heating difficulty | Fuel, warm clothing, calorie-dense food | Base siege, tests stockpile |
| **Extreme heat** | Heatstroke, water evaporation | Water, cooling equipment, shade materials | Water resource warfare |
| **Flood** | Drowning, disease, severed transport | High ground, boats, water purifiers | Forces migration, separates characters |
| **Acid rain** | Corrosion, air pollution | Protective suits, sealing materials, indoor farming | Restricts outdoor activity, claustrophobia |
| **Insect plague** | Crop destruction, disease spread | Pesticides, sealed granaries, medical supplies | Catalyst for food crisis |
| **Earthquake** | Building collapse, terrain change | Construction materials, tools, emergency medicine | Destroys the base, rebuilding arc |
| **Corpse tide** | Direct physical threat | Weapons, fortifications, ammunition | Combat scenes, sacrifice and heroism |
| **Pandemic** | Contagious death, isolation | Medicine, quarantine facilities, protective gear | Trust crisis — accept outsiders or not? |

**Selection advice**:
- The first disaster should be a single type (extreme cold or heat) to test basic stockpile
- Subsequent disasters should complement or compound previous types; avoid repeating the same type
- Consider the match between disaster type and shelter location — disasters targeting the shelter''s weaknesses create the most dramatic tension

#### Phase (Disaster Stage) — isDynamic Field

Phase is marked as isDynamic, meaning its value changes as the story progresses. When initially creating a Disaster Archive, set the current phase; update it at key plot points thereafter.

Phase progression path: **Precursor -> Outbreak -> Sustained -> Subsiding**

| Phase | Narrative Function | Typical Events |
|-------|--------------------|---------------|
| **Precursor** | Builds tension, last preparation window | Abnormal weather, animal migration, sudden temperature changes, barometric anomalies |
| **Outbreak** | Climax, survival crisis | Disaster strikes directly, first casualties, social order collapses |
| **Sustained** | War of attrition, interpersonal conflicts intensify | Ongoing resource depletion, morale drops, defectors appear, internal fractures |
| **Subsiding** | Brief respite, damage assessment | Inventory supplies, repair facilities, decide next steps, foreshadow next disaster |

**Phase setting advice**:
- Newly created Disaster Archives typically start at "Precursor"
- If the story begins mid-disaster (e.g., chapter one is the outbreak), set it to "Outbreak"
- During the creative process, when a disaster transitions between phases, use `update_field_dynamic_info` to update the Phase field
- Recommended durations: Precursor 1-3 chapters, Outbreak 2-5 chapters, Sustained 5-10 chapters, Subsiding 1-3 chapters

**Phase dynamic management key points**:
- Phase is a timeline marker — Phase changes track story progression
- Phase is a tension regulator — Outbreak is peak tension, Subsiding is respite, Precursor is buildup
- Phase is a decision trigger — characters'' behavioral focus differs entirely by phase (Precursor = preparation, Outbreak = emergency response, Sustained = management, Subsiding = rebuilding)
- When multiple disasters run in parallel, each disaster''s Phase is tracked independently; you may see "Disaster 1 Subsiding + Disaster 2 Outbreak" overlap

#### Impact (Environmental Impact)

Impact must specifically describe the disaster''s effects on environment, ecology, and human activity. Avoid vague descriptions; include quantifiable details.

Good Impact examples:
- "Temperature dropped to -45°C, ground snow exceeds 2 meters, all exposed pipes burst, concrete walls show freeze-thaw cracks, outdoor exposure beyond 15 minutes risks frostbite"
- "Precipitation pH 2.4, corrosion rate of exposed metal structures increased 20x, vegetation withered within 48 hours, unfiltered air inhalation can cause chemical pneumonia"
- "Magnitude 8.2 earthquake, 47 seconds of sustained shaking, 80% of low-rise buildings collapsed, ground fissures up to 3 meters wide, aftershock frequency 12-15 per day, defensive fortification destruction rate exceeds 60%"

**Impact must answer these questions**:
- What direct threat does the disaster pose to the shelter?
- Which supplies will see accelerated consumption?
- What restrictions are imposed on outdoor activity?
- What secondary disasters are possible?

**Impact for multi-disaster stacking**: When multiple disasters overlap, Impact should record the compound effect rather than individual impacts. For example: "Extreme cold storm ongoing with corpse tide overlay: temperature -38°C, frozen corpses congregate near indoor heat sources, defense personnel cannot remain outdoors for more than 10 minutes for shooting and clearing, ammunition may jam at extreme low temperatures."

---

### Disaster Escalation Design Principles

**Core principle: Disasters must escalate, never plateau.**

Recommended escalation pattern:
- Disaster 1 (single type): Extreme cold or heat -> Tests basic stockpile
- Disaster 2 (compound): Acid rain + insect plague -> Outdoor restriction + food crisis
- Disaster 3 (escalation): Earthquake -> Destroys existing base, forces rebuilding
- Disaster 4 (complex): Pandemic + corpse tide -> Siege from within and without, ultimate trial

**Escalation dimensions**:
1. **Intensity escalation**: Each disaster is more severe than the last (lower temperatures, higher magnitude, longer duration)
2. **Type stacking**: Multiple disaster types occur simultaneously or in rapid succession; countermeasures contradict each other
3. **Expanding coverage**: From local to regional to global, nowhere to flee
4. **Shortened recovery**: The next disaster hits before you catch your breath; the previous disaster''s Subsiding phase overlaps with the next''s Precursor

**Checklist when designing a new disaster**:
- [ ] Is this disaster more severe than the previous one? (intensity escalation)
- [ ] Does this disaster''s Type differ from or compound with previous ones? (type diversity)
- [ ] Does the Impact specifically describe effects on the shelter and supplies?
- [ ] Is the initial Phase value reasonable?
- [ ] Which characters'' moral dilemmas will this disaster trigger?
- [ ] Which supplies'' Quantity will drop sharply as a result?',
  (SELECT id FROM novel_creation_method WHERE name = '末世天灾囤货流' LIMIT 1),
  1,
  80,
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
