-- 灵异司机职业流小说 - 「文风设定」设定生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ghost-driver-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ghost-driver-writing-style-setting-gen',
  '「文风设定」设定生成：为灵异司机职业流小说定义区别于普通恐怖小说的独特叙事语言与节奏',
  '"Writing Style" setting generation: define the distinctive narrative voice and rhythm that separates ghost bus novels from generic horror fiction',
  '## 「文风设定」设定生成 — 灵异司机职业流小说

文风设定决定读者「感受到」的是什么——同样的情节，恐怖的文风让人战栗，怪诞的文风让人发笑，职业化的文风让人产生工作代入感。灵异司机职业流的文风有一个核心悖论：**用越平静、越职业化的语言描述越诡异的事物，恐惧感反而越强**。

---

### 字段生成指南

#### 叙事视角

**视角选择对职业代入感的影响**：

| 视角 | 优势 | 局限 |
|------|------|------|
| 第一人称（我） | 最强代入感，读者和主角同步获取信息 | 信息量受限，主角不在场的事无法描述 |
| 第三人称限知（他/她，只跟一个角色） | 灵活性稍强，仍有代入感 | 代入感略弱于第一人称 |
| 第三人称全知 | 可描述多角度，包括乘客视角 | 失去职业第一视角的孤立感 |

**推荐**：第一人称或第三限知。灵异职业流的恐惧来自信息不对称和孤立处境，第一人称能将这种效果最大化。

**第一人称的特殊技巧**：
- 主角「注意到」的信息 ≠ 读者需要注意的全部信息（可以设置明显的注意盲点）
- 主角职业化的自我描述（「按规定我应该……」「按流程这时候要……」）与实际状况的落差制造张力
- 主角开始把异常当成正常时（「又是一个这样的乘客」），这种语气转变本身就是叙事信号

#### 基调

**灵异职业流常见基调及其文风特征**：

| 基调 | 核心情绪 | 语言特征 | 适合的故事重心 |
|------|---------|---------|-------------|
| 职业恐惧 | 压迫与窒息 | 冷静、克制、规则感强，越平静越恐怖 | 契约压迫、规则带来的困境 |
| 怪诞日常 | 荒诞与共存 | 轻松口语化，异常被当成日常小事处理 | 常客关系、鬼怪的人情味 |
| 黑色幽默 | 自嘲与无奈 | 对荒诞处境的自我调侃，苦中作乐 | 「打工人」代入，职场式无力感 |
| 悬疑揭秘 | 好奇与紧张 | 信息碎片化，层层递进，线索感强 | 主线谜题（线路的秘密/雇主的真实目的） |

**基调不是非此即彼**：可以设定一个主基调（70%）和辅基调（30%），例如「以职业恐惧为主，偶有怪诞日常的喘息时刻」。

#### 语言风格

**职业化语言的运用技巧**：

灵异职业流的「职业感」不是简单地加入专业术语，而是主角用职业化的思维框架去理解和描述非职业化的现象。

```
❌ 「我看见了一个女鬼，她的头发很长，眼神很恐怖」
✅ 「第三排靠窗，按我的经验是执念类，手里捏着什么东西，今晚多半不好处理」
```

**推荐语言风格要素**：
- **感知克制**：不形容内心的恐惧，只描述观察到的外部细节（让读者自己恐惧）
- **职业词汇适配**：把鬼怪行为用「乘客行为」框架描述（「上车方式」「落座习惯」「下车的时间点」）
- **数字与细节感**：具体时间（23:07）、具体位置（第二排靠走廊）、具体数量，增强现实感
- **短句处理危机**：危机时刻句子变短，节奏加快，是生理反应的文字映射

#### 节奏把控

**班次结构的叙事节奏**：

灵异职业流有天然的节奏结构——每个班次就是一个「起伏单元」。每班次内部的节奏建议：

```
出发前（5%-10%）：状态检查，今晚什么感觉 → 建立基准线
第一站到第三站（30%-40%）：普通或略异常的乘客 → 读者入戏
中段（30-40%）：今晚的主要问题出现 → 张力上升
最高点（10-15%）：危机/决策时刻 → 信息最少，行动最快
收尾（5-10%）：处理结果，今晚的代价 → 下班，计算今晚收入，为下次埋伏笔
```

**长篇节奏**：
- 班次之间（白天时段）：主角的「正常人」时光，对比用，不宜过长
- 节奏标记：用「这是第X班次」或薪资结算作为自然章节分隔点
- 关键里程碑：每5-10班次应有一次升级或重要发现

#### 升级叙事方式

升级体系是这类小说的重要节拍器，叙事方式决定读者对升级的参与感。

**三种升级叙事模式**：

1. **流水账式**（避免）：「这次赚了300冥币，买了防鬼玻璃」→ 缺乏情绪重量

2. **决策场景式**（推荐）：用一段「购买/获取」场景描述升级，展示主角的选择逻辑
   - 示例：「我在清单上盯了很久。防鬼玻璃要450，驱邪符只要80但要重新贴，上次后排那个……我划掉了驱邪符，选了玻璃」
   - 这段话里有决策、有回忆、有优先级，升级变成了角色展示的机会

3. **效果对比式**（配合使用）：升级后的「首次使用」场景，主角（和读者）第一次感受到差异
   - 新的防鬼玻璃让后排的存在盯着它，盯了很久，最后回到座位——这比告诉读者「这个装备有效」更有说服力

#### 禁用词汇

以下写法会破坏职业代入感或过度标注，生成时提醒作者避免：

- ❌ 「突然」「猛然」（职业司机不该频繁感到突然）
- ❌ 直接写「我很害怕」「我恐惧极了」（用行为/生理反应代替）
- ❌ 「诡异的」「阴森的」「恐怖的」（反复使用的标注词，失去力量）
- ❌ 「xxx系统提示」类文字（系统流词汇，破坏现实感）
- ❌ 「根据我的经验，这是……」然后写一大段解释（卖弄设定）

---

### 字段联动关系

- **基调 → 故事钩子的「恐惧核心」**：职业恐惧基调对应职业枷锁感；怪诞日常基调对应异常日常化
- **叙事视角 → 角色设计**：第一人称时，所有NPC都通过主角的眼睛呈现，角色设计要考虑「主角视角的信息偏差」
- **节奏把控 → 情节设计（事件编排）**：每班次的节奏曲线是情节设计的基本单元',
  '"Writing Style" Setting Generation — Ghost Driver Paranormal Novel

The core paradox: the calmer and more professional the language, the stronger the horror effect.

**Narrative perspective**: First person (strongest immersion, maximum isolation effect) or close third. Avoid omniscient — the horror comes from information asymmetry and professional solitude.

**Tone options** (pick one primary + optional secondary):
- Professional dread: cold, rule-bound, restrained — calm descriptions of horrifying events
- Absurdist daily life: casual register, treating supernatural as routine workplace incidents
- Dark comedy: self-deprecating, working-class futility
- Mystery-revelation: fragmented information, layered clues

**Professionalized language technique**: Describe supernatural events through a professional framework:
- ❌ "I saw a ghost, her hair was long and terrifying"
- ✅ "Third row window seat — obsession type by my read, clutching something, tonight''s going to be trouble"

**Per-shift narrative rhythm**: departure prep (5-10%) → early stops with ordinary/slightly odd passengers (30-40%) → main problem emerges (30-40%) → crisis peak with minimum information, maximum action (10-15%) → resolution and tonight''s earnings (5-10%)

**Upgrade narration**: Use decision-scene style (show the protagonist''s choice logic with flashback and priority) + first-use effect contrast, not simple "bought X item" summaries.

**Banned phrases**: "Suddenly/abruptly" (professionals aren''t surprised), direct fear statements (use physical reactions), repeated horror adjectives, system-notification style text.',
  (SELECT id FROM novel_creation_method WHERE name = '灵异司机职业流小说' LIMIT 1),
  1,
  14,
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
