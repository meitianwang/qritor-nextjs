-- 民间灵异故事创作「道具」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-prop-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-prop-gen',
  '「道具」生成：为民间灵异故事创作生成道具，涵盖法器、阴物、祭品、镇物、奇珍五类道具体系，强调能力与代价的平衡设计',
  '"Prop" generation: generate props for folk horror stories, covering five categories (ritual tools, yin objects, offerings, sealing objects, artifacts) with emphasis on power-cost balance design',
  '## 「道具」生成 — 民间灵异故事创作

民间灵异故事的道具设计核心是**能力 × 代价 × 禁忌**的三角平衡。每件道具都不是"拿来就用"的万能工具——法器消耗使用者的阳气，阴物本身带有灵异侵蚀，祭品需要许诺兑现，镇物不能移动破坏。

道具是灵异故事中"规则"的物化载体。好的道具设计能推动剧情（镇物被破坏→灾难爆发）、制造两难抉择（救人必须用阴物，但会招来更凶的东西）、塑造角色（术士的师承通过祖传法器体现）。

---

### 字段生成指南

#### 名称

- 用民间通俗称呼，朴实而有恐怖暗示
- 好的命名：「镇魂钉」「引魂灯」「黑狗血」「桃木剑」「阴阳铜钱」
- 差的命名：「超级法宝」「灵异神器」
- 名称可暗示道具的功能或来源（"镇魂"→镇压灵魂，"引魂"→引导灵魂）
- 法器类可用材质+形态命名（桃木剑、铜钱绳）
- 阴物类可用来源+特征命名（水鬼蜡烛、吊死鬼绳结）

#### 类别

五个选项的恐怖定位和设计原则：

| 类别 | 恐怖定位 | 能力上限 | 代价基调 | 典型数量 |
|------|---------|---------|---------|---------|
| **法器** | 对抗灵异的正面工具 | 中等 | 消耗阳气/精力 | 2-3 件 |
| **阴物** | 来自灵异世界的危险物品 | 高 | 接触本身就有风险 | 1-2 件 |
| **祭品** | 献给灵异存在的供品 | 低-中 | 许诺必须兑现 | 1-2 件 |
| **镇物** | 长期封印灵异的工具 | 持续性 | 需要定期维护 | 1-2 件 |
| **奇珍** | 超越善恶的特殊物品 | 极高 | 认知层面的代价 | 0-1 件 |

选择类别时要考虑道具在故事中的叙事功能——镇物适合做"剧情引爆点"（被破坏→灾难），法器适合做"术士标配"，阴物适合做"两难抉择"。

#### 外观描述（嵌套对象）

三个子字段共同营造恐怖氛围：

**材质**：
- 要有民间质感：老槐木、不知名的兽骨、生锈的铁、缝着头发的布偶
- 禁止科幻或西方魔幻材质（秘银、魔力水晶等）
- 材质本身可暗示来源（坟土→来自墓地，血迹→有人以血祭之）

**视觉特征**：
- 形状、颜色、表面纹路或咒文
- 恐怖暗示要含蓄：不说"恐怖的样子"，而是描述具体细节（"钉头刻有看不懂的古篆"、"绳结上缠着三根黑发"）
- 法器通常有道教符号，阴物通常有死亡痕迹

**气息状态**：
- 调动嗅觉和触觉的恐怖感
- 法器："隐约有檀香味"、"木面温润"
- 阴物："寒气逼人"、"有淡淡的尸臭"、"表面附着干涸的血迹"
- 镇物："年代久远的铁锈味"、"触手冰凉"

#### 由来背景

道具的故事——每件灵异道具都应有自己的"前传"：

- **制作方式**：民间法术制作过程（"用七七四十九天收集的绝户坟土烧制"）
- **历史来源**：谁造的、为什么造（"百年前一位出马仙为镇压水鬼而铸"）
- **传承链**：经过几手（"师父传给弟子，弟子传给主角"→体现师承关系）
- 由来背景越详细，道具的"分量感"越强——读者会觉得这件道具有故事、有规矩

#### 核心能力（嵌套对象）

**功能描述**：
- 必须具体、有边界，不能"什么都行"
- 好的描述："可照见五步内鬼物真身，但无法伤害"
- 差的描述："可以对付一切灵异"
- 功能要与类别匹配（法器→防御/驱除，阴物→强力但危险，镇物→持续封印）

**触发条件**：
- 怎么启动/使用这件道具
- 常见条件：以血点燃、子时方可生效、对准鬼物方向、口念咒语
- 触发条件增加使用门槛——不是拿起来就能用
- 复杂的触发条件可以成为紧张时刻的叙事张力（"他手忙脚乱地试图在黑暗中点燃引魂灯"）

#### 副作用与代价

**灵异道具设计的核心原则——没有免费的午餐**：

| 类别 | 典型代价 |
|------|---------|
| **法器** | 消耗阳气（头晕、虚弱）、折损寿命、短暂失去五感之一 |
| **阴物** | 招来更强的灵异、使用者被侵蚀（夜夜噩梦、听到耳语）、精神污染 |
| **祭品** | 许诺必须兑现（否则受害更深）、需要持续献祭 |
| **镇物** | 需要定期维护（换血、补刻符文）、维护者承受反噬 |
| **奇珍** | 看到不该看的东西、忘记重要记忆、改变使用者的性格 |

代价的严重程度要与能力强度成正比。

#### 使用禁忌

灵异道具的"红线"——违反会引发严重后果：
- **绝对禁忌**："不可对活人使用"、"不能让它见到阳光"
- **条件禁忌**："月圆之夜不可取出"、"使用时不能回头"
- **后续禁忌**："用后必须掩埋"、"三天内不能碰水"
- 禁忌是恐怖叙事的宝藏——角色不小心违反禁忌 = 灾难触发

#### 稀有度

四个选项的叙事含义：

| 稀有度 | 说明 | 适用道具 |
|--------|------|---------|
| **寻常** | 民间常见，术士人手一件 | 桃木剑、黑狗血、镇宅符 |
| **罕见** | 需要特殊渠道获取 | 特制法器、年代久远的镇物 |
| **孤品** | 世上仅此一件 | 与特定灵异事件绑定的道具 |
| **传世** | 代代相传的至宝 | 师门传承之物、镇派之宝 |

稀有度影响道具在剧情中的"分量"——孤品/传世道具的得失是大事件。

---

### 道具阵容建议

**标准配置**：
1. **术士法器**（1 件，法器类）：主角或术士角色的看家法器，如桃木剑、罗盘
2. **关键阴物**（1 件，阴物类）：推动核心剧情的危险道具，使用有重大代价
3. **镇物**（1 件，镇物类）：镇压核心灵异的道具——被破坏是剧情引爆点
4. **消耗品**（1-2 件，祭品/法器类）：解决具体问题的一次性道具
5. **线索道具**（1 件，奇珍/阴物类）：揭示真相的关键物品

**灵异故事道具的特殊规则**：
- 道具不能太多——5-7 件足够，太多会分散读者注意力
- 每件道具的代价和禁忌必须清晰——这是恐怖感的来源
- 至少有一件道具的禁忌会被角色违反——这是经典的叙事套路

---

### 与已有设定的联动

| 设定模块 | 对道具的影响 |
|---------|------------|
| **世界** | 灵异规则体系→道具的能力上限和运作逻辑；民俗体系→法器的流派和材质；道具法器体系→五类道具的设计基准 |
| **故事钩子** | 核心恐怖元素→道具的恐怖方向；故事类型→道具的叙事功能 |
| **小说梗概** | 关键事件→需要道具参与的剧情节点；转折点→可能由道具破坏/使用触发 |
| **文风设定** | 恐怖氛围→道具描写的恐怖程度；民俗质感→道具的材质和制作工艺描写 |

---

### 常见错误

1. **无代价道具**：道具只有功能没有代价——灵异故事中所有超自然力量都有代价
2. **禁忌形同虚设**：设了禁忌但整个故事没人违反——浪费了最好的叙事机会
3. **类别与功能不匹配**：标为"法器"但功能像"阴物"（法器是正面工具，阴物自带危险）
4. **外观描写不恐怖**：道具的外观描写像普通物品，缺少灵异暗示
5. **由来背景空洞**：只说"一件古老的法器"而不交代来历——道具的"分量感"靠故事撑起来
6. **功能过于万能**：一件道具能解决所有灵异问题——这会消除故事的紧张感
7. **道具同质化**：每件道具都是"驱邪用的法器"，功能上没有差异化',
  '## "Prop" Generation — Folk Horror Story Creation

The core of prop design in folk horror stories is the **power × cost × taboo** triangle balance. No prop is a "pick up and use" universal tool — ritual tools consume the user''s yang energy, yin objects carry supernatural corruption, offerings require fulfilled promises, sealing objects cannot be moved.

Props are the materialized carriers of "rules" in horror stories. Good prop design drives plot (sealing object destroyed → disaster), creates dilemmas (saving someone requires a yin object, but it attracts worse things), and shapes characters (a sorcerer''s lineage shown through inherited ritual tools).

---

### Field Generation Guide

#### Name (名称)
Folk-style names with horror undertones. Good: "Soul-Sealing Nail", "Ghost-Guiding Lantern". Bad: "Super Artifact". Names can hint at function or origin.

#### Category (类别)
Five types: Ritual Tool (anti-supernatural, medium power, consumes yang), Yin Object (from supernatural world, high power, risky to touch), Offering (consumed sacrifice, must fulfill promises), Sealing Object (long-term containment, needs maintenance), Artifact (transcends good/evil, extreme power, cognitive cost).

#### Appearance (外观描述, nested)
Three sub-fields creating horror atmosphere:
- **Material**: Folk textures (old locust wood, unknown beast bone). No sci-fi/Western fantasy materials.
- **Visual Features**: Specific horror details, not abstract adjectives.
- **Aura/State**: Olfactory and tactile horror elements.

#### Origin (由来背景)
Every horror prop needs a backstory: creation method, historical source, inheritance chain.

#### Core Ability (核心能力, nested)
- **Function**: Must be specific with clear boundaries. Not "defeats all supernatural."
- **Trigger Condition**: How to activate. Adds usage barriers and narrative tension.

#### Side Effects & Cost (副作用与代价)
Core principle — no free lunch. Cost severity must match power level. Ritual tools: yang depletion. Yin objects: supernatural corruption. Offerings: must fulfill promises. Sealing objects: maintenance burden. Artifacts: cognitive price.

#### Usage Taboos (使用禁忌)
Red lines that trigger disasters when violated. Absolute, conditional, and post-use taboos. Taboo violation = classic horror narrative trigger.

#### Rarity (稀有度)
Four levels: Common (standard sorcerer equipment), Rare (special channels), Unique (one of a kind), Heirloom (generational treasure). Rarity affects narrative "weight."

---

### Setting Linkage

| Setting | Impact |
|---------|--------|
| **World** | Supernatural rules → ability ceiling; folk system → ritual tool schools; prop system → five-category design basis |
| **Story Hook** | Horror element → prop horror direction; story type → narrative function |
| **Synopsis** | Key events → plot points requiring props; turning points → possibly triggered by prop destruction/use |
| **Writing Style** | Horror atmosphere → description intensity; folk texture → material and craft descriptions |

---

### Common Errors

1. **Cost-free props**: Only function, no cost — all supernatural power has a price
2. **Decorative taboos**: Taboos set but never violated in the story
3. **Category-function mismatch**: Labeled "ritual tool" but functions like "yin object"
4. **Non-horror appearance**: Prop descriptions read like ordinary objects
5. **Empty origin**: Just "an ancient ritual tool" without backstory
6. **Omnipotent function**: One prop solves all supernatural problems
7. **Homogeneous props**: Every prop is "an exorcism tool" with no functional differentiation',
  (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1),
  1,
  23,
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
