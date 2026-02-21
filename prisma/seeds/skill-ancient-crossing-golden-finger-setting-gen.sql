-- 古代架空穿越小说「金手指」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-ancient-crossing-golden-finger-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ancient-crossing-golden-finger-setting-gen',
  '「金手指」设定生成：为古代架空穿越小说生成金手指设定，包括金手指类型、能力描述、使用限制、成长空间、获得方式',
  '"Golden Finger" setting generation: generate cheat ability settings for ancient fictional crossing novels, including cheat ability type, ability description, usage limitations, growth potential, and acquisition method',
  '## 「金手指」设定生成 — 古代架空穿越小说

「金手指」是主角区别于普通古人的核心优势。设计得当的金手指能让主角光环合理化，但**关键设计原则是：主角的成功至少50%必须来自自身智谋，而非金手指能力**。金手指是辅助工具，不是万能钥匙。

---

### 字段生成指南

#### 金手指类型

古代架空穿越小说的金手指类型需要与架空世界观和穿越身份相匹配：

| 类型 | 特点 | 适合主线 |
|------|------|---------|
| **空间/储物能力** | 拥有独立空间，可存储物品甚至种植 | 种田发家、经商致富 |
| **医术/毒术** | 精通医术或毒术，能救人也能害人 | 宅斗逆袭、宫斗夺嫡 |
| **预知未来/读心** | 能预见未来事件或读取他人想法 | 权谋争霸、宫斗夺嫡 |
| **系统辅助** | 拥有任务系统、商城系统或属性面板 | 各种主线均可搭配 |
| **前世记忆（历史知识）** | 拥有丰富的现代知识作为信息优势 | 经商致富、种田发家 |
| **武功/内力** | 拥有超凡武力，能在武斗中占优 | 江湖恩怨、权谋争霸 |
| **无金手指（纯智商）** | 完全依靠现代思维和知识，无额外能力 | 宅斗逆袭、经商致富 |

生成时应与已有的穿越身份和主线剧情相匹配。

#### 能力描述

能力描述需要将金手指的功能**具体化**——不是"主角很强"，而是明确"能做什么、不能做什么"：

- **空间/储物能力**：空间有多大？能存什么？有没有特殊功能（如时间加速让作物快速生长）？能否带活物？是否需要意念触发？
- **医术/毒术**：医术到什么程度？能治什么病不能治什么病？是否有现代医学知识辅助？毒术来源是什么？解药是否受限？
- **预知未来/读心**：预知多远的未来？精确度如何？是片段式还是完整画面？读心的距离和触发条件？能否屏蔽？
- **系统辅助**：系统提供什么功能？任务类型是什么？奖励是什么？有没有商城？积分怎么获取？
- **前世记忆**：记得多少现代知识？哪些领域最精通？记忆是否会随时间模糊？
- **武功/内力**：武功到什么水平？是否有特定招式？内力恢复速度？能否传授他人？
- **无金手指**：依靠哪些具体的现代知识和思维方式？（管理学、经济学、心理学、营销学等）

#### 使用限制

**这是金手指设计中最重要的部分**。没有限制的金手指会让故事失去张力。限制类型：

- **使用频率**：每天/每月只能用几次，超过则有惩罚
- **体力消耗**：使用后极度疲劳，甚至昏迷
- **触发条件**：只有特定情况下才能使用（如只有在危险时、只有在特定地点）
- **暴露风险**：被人发现金手指的存在会招来杀身之祸——必须隐藏使用
- **成长阶段**：初期功能有限，需逐步解锁（如空间初始只有一平方米）
- **副作用**：使用后有不良反应（如读心后头痛、预知后记忆混乱）

**设计原则**：限制要足够严格，让主角不能靠金手指解决所有问题，必须同时运用智谋和人际关系。至少要有2-3种不同类型的限制叠加。

#### 成长空间

成长空间描述金手指的升级路径，为故事提供持续的新鲜感：
- 随故事推进，金手指如何变强？（空间扩大、新功能解锁、限制放宽）
- 有哪些里程碑式的升级节点？（与剧情高潮绑定）
- 最终形态是什么样的？（不要一开始就是满级）
- 成长的触发条件是什么？（完成任务？积累经验？特定事件？）

#### 获得方式

获得方式说明主角如何得到金手指，可以成为剧情线索：
- **穿越时自带**：最常见，简化设定，穿越即获得
- **穿越后某个事件触发**：如触碰某个古物、遇到神秘人物、遭遇生死危机后觉醒
- **来自神秘人物的赠予**：暗示背后有更大的力量或阴谋
- **从某个遗迹或宝物中获得**：可以设计为寻宝支线
- 获得方式是否会成为后续剧情线索？是否有人追踪金手指的来源？

---

### 生成原则

1. **50%原则**：确保主角至少一半的成功来自智谋而非金手指
2. **限制优先**：先想好限制再描述能力，限制越精妙故事越好看
3. **匹配主线**：金手指类型必须与主线剧情类型形成有效配合
4. **避免万能**：金手指不能解决人际关系、情感问题和政治博弈——这些必须靠主角自己',
  '## "Golden Finger" Setting Generation — Ancient Fictional Crossing Novel

The "Golden Finger" (cheat ability) is the protagonist''s core advantage over ordinary ancient people. A well-designed cheat ability rationalizes the protagonist''s halo, but the **key design principle is: at least 50% of the protagonist''s success must come from personal wit, not cheat ability**. It is a support tool, not a master key.

---

### Field Generation Guide

#### Cheat Ability Type
Types specific to ancient fictional crossing, matched with worldview and crossing identity:
- Spatial/storage ability (independent space for storage or farming) -> farming, commerce
- Medical/poison arts (mastery of medicine or poisons) -> household rivalry, palace intrigue
- Foresight/mind-reading (foresee future or read thoughts) -> political strategy, palace intrigue
- System assistance (quest system, shop system, attribute panel) -> all main plot types
- Past-life memories/historical knowledge (rich modern knowledge) -> commerce, farming
- Martial arts/inner force (extraordinary martial prowess) -> martial arts feuds, political strategy
- No cheat ability/pure intellect (relies entirely on modern thinking) -> household rivalry, commerce

#### Ability Description
Must be specific — not "protagonist is strong" but "can do X, cannot do Y." Detail the scope, mechanics, and boundaries for each type: spatial dimensions, medical skill level, foresight range and accuracy, system functions, memory scope, martial level, or specific modern knowledge areas.

#### Usage Limitations
**The most important part of cheat ability design**. Limitation types:
- Frequency limits (uses per day/month)
- Physical drain (exhaustion or unconsciousness after use)
- Trigger conditions (only works in specific circumstances)
- Exposure risk (discovery brings mortal danger)
- Growth stages (limited at first, must gradually unlock)
- Side effects (adverse reactions after use)

Design principle: Limitations must be strict enough that the protagonist cannot solve every problem with the cheat ability. At least 2-3 limitation types should be stacked.

#### Growth Potential
Describes the upgrade path: how it grows stronger (space expands, new features unlock), milestone upgrade points tied to plot climaxes, final form, and growth triggers (quests, experience, events).

#### Acquisition Method
How the protagonist obtains the cheat ability: brought during crossing (most common), triggered by post-crossing event, gifted by mysterious figure, obtained from relic/treasure. Consider whether acquisition can become a plot thread.

---

### Generation Principles
1. **50% rule**: At least half of success must come from wit, not cheat ability
2. **Limitations first**: Design limitations before abilities; more elegant limitations make better stories
3. **Match the main plot**: Cheat ability type must effectively pair with the main plot type
4. **Avoid omnipotence**: Cannot solve interpersonal, emotional, or political problems',
  (SELECT id FROM novel_creation_method WHERE name = '古代架空穿越小说' LIMIT 1),
  1,
  53,
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
