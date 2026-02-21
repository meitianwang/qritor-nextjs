-- 异世界玄幻穿越小说「穿越设定」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xuanhuan-crossing-crossing-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xuanhuan-crossing-crossing-setting-gen',
  '「穿越设定」设定生成：为异世界玄幻穿越小说生成穿越设定，包括穿越方式、目的地类型、穿越身份、核心目标、故事基调、感情线',
  '"Crossing Setting" setting generation: generate crossing settings for isekai xuanhuan crossing novels, including crossing method, destination type, crossing identity, core goal, story tone, and romance arc',
  '## 「穿越设定」设定生成 — 异世界玄幻穿越小说

穿越设定定义了主角如何来到这个世界、以什么身份开始、追求什么目标。穿越设定与金手指是紧密耦合的两个设定类型，应当配合设计。

---

### 字段生成指南

#### 穿越方式

「穿越方式」字段支持 7 种选项，每种方式有不同的叙事优势和适合搭配的金手指：

| 穿越方式 | 叙事优势 | 适合搭配的金手指 |
|---------|---------|---------------|
| **意外身亡后重生** | 有前身记忆和人际关系，可利用原有社会关系 | 前世记忆、重生先知 |
| **被神秘力量召唤** | 带有使命感，适合宏大剧情线 | 系统、神器 |
| **触碰古物穿越** | 有回归可能性，增加悬念和情感张力 | 神器、科技道具 |
| **睡梦中穿越** | 过渡平缓，适合日常向开局 | 天赋、血脉 |
| **雷击穿越** | 经典方式，干脆利落，快速进入正题 | 各类均可 |
| **游戏/小说世界穿越** | 主角对世界有先知信息，可以利用剧情知识 | 系统、外挂记忆 |
| **集体穿越** | 多主角或竞争格局，增加社交复杂度 | 各类均可 |

**设计建议**：
- 穿越方式应让读者觉得"如果是我也能这样"——代入感是关键
- "游戏/小说世界穿越"自带先知优势，金手指设计时要注意不要叠加过多
- "集体穿越"适合群像叙事，但增加了写作难度

#### 目的地类型

「目的地类型」决定了世界观的整体风格，与修炼体系的力量体系类型应保持一致：

| 目的地 | 风格特点 | 适合的力量体系 |
|--------|---------|-------------|
| **玄幻世界** | 东方元素为主，修炼体系自由度高 | 修真、混合 |
| **修真世界** | 纯道教修仙体系 | 修真 |
| **西方奇幻** | 魔法/剑与魔法世界观 | 魔法、斗气 |
| **末日异界** | 生存压力大，修炼是唯一出路 | 异能、混合 |
| **高武世界** | 武道为尊，偏格斗 | 斗气 |
| **异族主导** | 人族弱势，种族矛盾为核心 | 各类均可 |

**设计建议**：目的地类型是世界观设定的"总纲"，选定后其他设定应围绕它展开。

#### 穿越身份

「穿越身份」影响起点和初始资源，是逆袭感的起点：

| 身份 | 起始资源 | 叙事效果 | 适合的金手指搭配 |
|------|---------|---------|---------------|
| **宗门弟子** | 中等（有师门庇护） | 宗门内斗 + 宗门大比 | 天赋、系统 |
| **散修** | 低（自由但无靠山） | 独行冒险 + 奇遇 | 神器、外挂记忆 |
| **贵族** | 高（家族资源） | 家族势力 + 联姻政治 | 血脉、系统 |
| **平民** | 极低（白手起家） | 典型逆袭路线 | 系统、天赋（高潜力） |
| **冒险者** | 中（自由+任务系统） | 打怪升级 + 探索 | 系统、灵宠 |
| **异族** | 特殊（种族天赋） | 种族冲突 + 身份隐藏 | 血脉、天赋 |
| **奴隶** | 无 | 极致逆袭 | 系统（高潜力金手指） |
| **学徒** | 低（学习阶段） | 成长型叙事 | 天赋、外挂记忆 |

**经典搭配公式**：身份越低 + 金手指潜力越大 = 逆袭感越强。"废柴开局 + 逆天金手指"是最经典的玄幻穿越组合。

#### 核心目标

「核心目标」定义主角的长期驱动力，与「故事基调」应搭配选择：

| 核心目标 | 最适合的故事基调 | 剧情特点 |
|---------|---------------|---------|
| **修炼变强** | 热血爽文 | 持续升级、打脸、碾压 |
| **返回现实** | 轻松冒险 + 悬疑诡秘 | 寻找回归方法成为暗线 |
| **拯救世界** | 史诗宏大 | 宏大叙事、多线并行 |
| **复仇** | 黑暗残酷 | 目标明确、冲突激烈 |
| **探索真相** | 悬疑诡秘 | 解谜、揭秘、反转 |
| **建立势力** | 史诗宏大 + 热血爽文 | 招兵买马、势力扩张 |

#### 故事基调

与核心目标配合，定义故事的整体情感色彩。生成时应参考上表，选择与核心目标最匹配的基调。

#### 感情线

「感情线」字段定义主角的情感发展方向。玄幻穿越中感情线通常是辅线，设计原则：

- **与修炼主线交织**：共同冒险中产生感情，而非单独的恋爱剧情
- **不能拖慢主线节奏**：感情发展嵌入主线事件中
- **女主/男配应有独立实力和故事线**：不是花瓶，有自己的修炼路线和目标
- **感情线是爽点的辅助**：红颜知己在关键时刻的支援、为保护爱人而爆发等

---

### 穿越设定与金手指的搭配原则

1. **互补而非重叠**：穿越身份给出起点，金手指给出成长曲线；两者不应完全重叠（如贵族身份+财富型金手指就是重叠）
2. **限制匹配**：身份越低，金手指的潜力越大——废柴开局 + 逆天金手指是经典组合
3. **代入感**：穿越方式应让读者觉得"如果是我也能这样"
4. **故事基调一致**：热血爽文用系统/天赋型金手指，黑暗残酷用血脉/记忆型金手指

---

### 设计原则总结

1. **穿越设定是起点**：它决定了主角从哪里开始，但不决定主角能走多远——那是金手指和修炼体系的工作
2. **身份越低越好**：玄幻穿越的核心爽感是逆袭，起点越低逆袭越爽
3. **核心目标要清晰**：读者需要知道主角在追求什么
4. **感情线是调味料**：不能喧宾夺主，但能让故事更有温度',
  '## "Crossing Setting" Setting Generation — Isekai Xuanhuan Crossing Novel

The crossing setting defines how the protagonist arrives in the world, their starting identity, and goals. It is tightly coupled with the cheat ability and should be designed together.

---

### Field Generation Guide

#### Crossing Method
7 options with different narrative advantages: Rebirth after accidental death (prior relationships) / Summoned by mysterious force (mission-driven) / Touching artifact (return possibility) / Dream crossing (gentle transition) / Lightning crossing (classic, decisive) / Game/novel world (foreknowledge) / Group crossing (multi-protagonist). Each pairs best with specific cheat ability types.

#### Destination Type
Determines worldview style: Xuanhuan world (Eastern, free cultivation) / Cultivation world (pure Daoist) / Western fantasy (magic/sword-and-sorcery) / Post-apocalyptic (survival pressure) / High-martial (combat-focused) / Non-human dominant (racial conflict core). Should align with cultivation system power type.

#### Crossing Identity
Affects starting point and reversal impact: Sect disciple (medium start) / Rogue cultivator (low, free) / Noble (high, political) / Commoner (very low, classic underdog) / Adventurer (medium, quest-based) / Non-human (special racial talent) / Slave (none, ultimate underdog) / Apprentice (low, growth-oriented). Lower identity + higher cheat potential = stronger reversal satisfaction.

#### Core Goal
Long-term driver paired with story tone: Cultivate stronger (hot-blooded) / Return to reality (light adventure + mystery) / Save the world (epic) / Revenge (dark) / Explore truth (mystery) / Build faction (epic + hot-blooded).

#### Story Tone
Overall emotional color, should match the core goal. Generate based on the pairing table above.

#### Romance Arc
Usually a subplot in xuanhuan crossing: intertwined with cultivation main plot, must not slow pacing, love interests should have independent cultivation strength and story arcs.

### Pairing Principles
1. Complementary not overlapping: identity provides start, cheat provides growth curve
2. Limitation matching: lower start = greater cheat potential
3. Immersion: crossing method should feel relatable
4. Tonal consistency: hot-blooded uses system/talent cheats; dark uses bloodline/memory cheats',
  (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1),
  1,
  32,
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
