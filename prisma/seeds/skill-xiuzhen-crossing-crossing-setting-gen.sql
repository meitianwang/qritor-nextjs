-- 异世界修真穿越小说「穿越设定」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xiuzhen-crossing-crossing-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiuzhen-crossing-crossing-setting-gen',
  '「穿越设定」设定生成：为异世界修真穿越小说生成穿越设定，包括穿越方式、目的地类型、穿越身份、核心目标、故事基调、感情线',
  '"Crossing Setting" setting generation: generate crossing settings for isekai cultivation crossing novels, including crossing method, destination type, crossing identity, core goal, story tone, romance arc',
  '## 「穿越设定」设定生成 — 异世界修真穿越小说

穿越设定是修真穿越文的起点，定义主角如何来到修真世界、以什么身份开始、追求什么目标。修真穿越的穿越设定与通用穿越的核心区别在于：目的地是以道家文化为基底的修真世界，目标指向修炼飞升而非权力争霸。

---

### 字段生成指南

#### 穿越方式

修真穿越常见方式及其叙事特点：

| 方式 | 特点 | 适合基调 |
|------|------|---------|
| 意外身亡后魂穿 | 继承原身记忆和人际关系，有废材逆袭感 | 宗门崛起、逆袭爽文 |
| 被神秘力量召唤 | 有使命感，暗示穿越背后有大手在推动 | 宏大叙事、天命之子 |
| 雷击穿越 | 经典干脆，可与天劫产生呼应（雷电是修真世界的核心意象） | 各类均可 |
| 梦中穿越 | 温和过渡，穿越过程不痛苦 | 轻松文、日常种田 |
| 触碰古物穿越 | 古物可能是仙器/法宝的碎片，为后续寻宝线埋伏笔 | 带有寻宝线索的故事 |

选择穿越方式时需考虑与金手指的关联——穿越方式往往决定了金手指的获得方式。例如触碰古物穿越，古物本身可能就是金手指的载体。

#### 目的地类型

穿越到什么类型的修真世界，直接决定修炼难度和故事基调：

| 目的地 | 特点 | 叙事效果 |
|-------|------|---------|
| 正统修真界 | 宗门林立、灵气充沛的经典修真世界 | 最通用，适合各类剧情 |
| 末法修真界 | 灵气稀薄、修真式微的衰落世界 | 增加修炼难度，凸显金手指价值 |
| 蛮荒修真界 | 未开化、危机四伏的原始修真世界 | 适合生存冒险类剧情 |
| 高武修真界 | 修为天花板极高、强者众多 | 适合热血战斗流，主角需要更长成长曲线 |

目的地类型应与世界设定中的时代背景保持一致。

#### 穿越身份

穿越后的身份决定了起点和叙事方向：

| 身份 | 起点 | 叙事优势 |
|------|------|---------|
| 宗门废材弟子 | 极低 | 逆袭感最强，读者代入感最好。最经典的修真穿越身份 |
| 世家旁系子弟 | 低 | 有基础资源但受排挤，有家族内部争斗线 |
| 散修 | 中 | 自由度高但无靠山，需要自己打拼一切 |
| 宗门核心弟子 | 高 | 起点高但树敌多，受关注度高导致金手指难以隐藏 |
| 凡人 | 极低 | 从零开始，成长曲线最完整，需要先获得修炼资格 |

最经典的穿越身份是「宗门废材弟子」——原身资质差（废灵根/杂灵根）、被人欺辱、修为低下，穿越者凭借金手指逆天改命。这个身份自带最强的逆袭爽感。

#### 核心目标

修真穿越的核心目标，决定故事的终极方向：

| 目标 | 叙事动力 | 适合搭配 |
|------|---------|---------|
| 飞升成仙 | 修真文的终极目标，提供持久的修炼动力 | 稳扎稳打型、修炼流 |
| 逆天改命 | 改变原身的悲惨命运（被废、被灭门、寿元将尽） | 热血爽文、紧迫型 |
| 守护所爱 | 保护师门、家人、道侣 | 情感向、有羁绊感 |
| 探索大道 | 纯粹追求修炼之道的真谛 | 文艺向、悟道流 |
| 复仇 | 为原身或师门报仇 | 暗黑向、有明确敌人 |

可以选择一个主目标 + 一到两个副目标。例如「飞升成仙」是终极目标，「逆天改命」是前期目标。

#### 故事基调

故事的整体氛围和节奏风格：

| 基调 | 特点 | 读者预期 |
|------|------|---------|
| 热血爽文 | 金手指强力，一路碾压，痛快升级 | 打脸、升级、爽快 |
| 稳扎稳打 | 注重修炼过程和领悟，慢热但有深度 | 沉浸感、真实感 |
| 险中求生 | 处处危机，步步为营，紧张刺激 | 紧张感、策略感 |
| 轻松日常 | 种田炼丹，悠闲修仙，偶尔冒险 | 治愈感、休闲感 |

基调决定了金手指的强度设计：热血爽文的金手指可以强一些，险中求生的金手指限制要多。

#### 感情线

修真文的感情线有独特特点，不同于现代言情或玄幻后宫：

- **道侣**：修真世界的伴侣概念。道侣不只是恋人，更是修炼路上的同行者。共同修炼、互相扶持、为对方护道
- **双修**：特殊的修炼方式，通过双人配合加速修炼。可作为感情线与修炼线的交汇点。不宜过度色情化，应侧重修炼意义
- **寿元差距**：修为不同导致寿命差异，是天然的感情冲突。练气期百年寿命 vs 元婴期千年寿命——一方老去另一方依然年轻
- **飞升抉择**：一方先达到飞升条件，另一方怎么办？等待意味着可能遭天劫，先飞升意味着分离。这是修真文最经典的虐点

感情线设计要点：
- 道侣需要有独立的修炼实力和人格，不能沦为花瓶
- 感情发展应伴随修炼历程——生死相依中建立羁绊
- 避免后宫化，修真世界讲究道侣一生一世',
  '## "Crossing Setting" Setting Generation — Isekai Cultivation Crossing Novel

The crossing setup is the starting point of the xiuzhen crossing novel, defining how the protagonist arrives in the cultivation world, what identity they start with, and what goals they pursue. The key difference from generic crossing: the destination is a Daoist-culture-based xiuzhen world, and the goal is cultivation and ascension rather than power domination.

---

### Field Generation Guide

#### Crossing Method

Common xiuzhen crossing methods and their narrative features:

| Method | Features | Suitable Tone |
|--------|----------|---------------|
| Soul transmigration after accidental death | Inherits original body''s memories and relationships; underdog comeback feel | Sect rise, power-fantasy |
| Summoned by mysterious force | Sense of destiny; implies a hidden hand behind the crossing | Grand narrative, chosen one |
| Lightning strike crossing | Classic and decisive; can echo heavenly tribulations (lightning is a core xiuzhen imagery) | Any type |
| Dream crossing | Gentle transition, painless crossing process | Light stories, casual farming |
| Artifact-touch crossing | The artifact may be a fragment of an immortal weapon; foreshadowing for treasure-hunting | Stories with treasure threads |

Consider the connection to the cheat ability when choosing -- the crossing method often determines how the cheat ability is acquired. For example, artifact-touch crossing means the artifact itself may be the cheat ability''s vessel.

#### Destination Type

What kind of xiuzhen world the protagonist crosses into, directly determining cultivation difficulty and story tone:

| Destination | Features | Narrative Effect |
|-------------|----------|-----------------|
| Orthodox xiuzhen world | Classic world with abundant sects and spiritual energy | Most versatile, suits all plot types |
| Dharma-Ending xiuzhen world | Sparse spiritual energy, declining cultivation | Increases difficulty, highlights cheat ability value |
| Wilderness xiuzhen world | Uncivilized, perilous primitive cultivation world | Suits survival-adventure plots |
| High-martial xiuzhen world | Extremely high power ceiling, many powerhouses | Suits hot-blooded combat; protagonist needs longer growth arc |

Destination type should be consistent with the era background in World Setting.

#### Crossing Identity

The post-crossing identity determines starting point and narrative direction:

| Identity | Starting Point | Narrative Advantage |
|----------|---------------|-------------------|
| Sect''s "trash" disciple | Very low | Strongest underdog feeling; best reader identification. The most classic xiuzhen crossing identity |
| Clan branch family scion | Low | Has basic resources but marginalized; includes intra-clan conflict line |
| Rogue cultivator | Medium | High freedom but no backing; must build everything independently |
| Sect core disciple | High | High starting point but many enemies; cheat ability harder to hide due to attention |
| Mortal | Very low | Starts from zero; most complete growth arc; must first qualify for cultivation |

The most classic identity is the "sect''s trash disciple" -- the original body has poor aptitude (waste/mixed spirit root), is bullied, and has low cultivation. The crosser uses a cheat ability to defy fate. This identity carries the strongest underdog satisfaction.

#### Core Goal

Core goals for xiuzhen crossing, determining the story''s ultimate direction:

| Goal | Narrative Drive | Suitable Pairing |
|------|----------------|-----------------|
| Ascension to immortality | The ultimate xiuzhen goal, provides enduring cultivation motivation | Steady type, cultivation-focused |
| Defy fate | Change the original body''s tragic destiny (crippled, clan destroyed, lifespan ending) | Hot-blooded, urgency-driven |
| Protect loved ones | Safeguard the sect, family, or Dao companion | Emotionally-driven, bond-focused |
| Explore the Great Dao | Purely pursue the truth of cultivation | Literary, Dao-comprehension focused |
| Revenge | Avenge the original body or the sect | Dark-toned, clear antagonists |

Can choose one main goal + one or two sub-goals. E.g., "Ascension" as ultimate goal, "Defy fate" as early goal.

#### Story Tone

Overall atmosphere and pacing style:

| Tone | Features | Reader Expectations |
|------|----------|-------------------|
| Hot-blooded power fantasy | Strong cheat ability, steamrolling enemies, satisfying level-ups | Face-slapping, leveling, satisfaction |
| Steady and methodical | Focus on cultivation process and comprehension; slow burn with depth | Immersion, authenticity |
| Survival thriller | Danger everywhere, every step calculated, tense and exciting | Tension, strategic feeling |
| Casual daily life | Farming, pill refining, leisurely cultivation | Healing, relaxation |

Tone determines cheat ability strength design: power fantasy cheat abilities can be stronger; survival thriller ones need more limitations.

#### Romance Arc

Xiuzhen fiction romance has unique characteristics, distinct from modern romance or xuanhuan harem:

- **Dao companion**: The xiuzhen concept of a partner. Not just lovers but fellow travelers on the cultivation path. Cultivating together, supporting each other, protecting each other during breakthroughs
- **Dual cultivation**: A special practice where two cultivators cooperate to accelerate cultivation. Can serve as the intersection of romance and cultivation arcs. Should emphasize cultivation significance, not be overly sexualized
- **Lifespan gap**: Different cultivation levels cause lifespan disparities -- a natural source of emotional conflict. Qi Refining: 100 years vs. Nascent Soul: 1000 years -- one ages while the other remains young
- **Ascension dilemma**: One partner reaches ascension conditions first -- what happens to the other? Waiting risks tribulation; ascending first means separation. The most classic emotional pain point in xiuzhen fiction

Romance design points:
- Dao companions need independent cultivation strength and personality; must not become decorative
- Feelings should develop alongside the cultivation journey -- bonds forged through shared life-and-death experiences
- Avoid harem-ization; the xiuzhen world values lifelong Dao companionship',
  (SELECT id FROM novel_creation_method WHERE name = '异世界修真穿越小说' LIMIT 1),
  1,
  42,
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
