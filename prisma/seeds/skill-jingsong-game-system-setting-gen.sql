-- 惊悚乐园小说「游戏系统」设定生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-game-system-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-game-system-setting-gen',
  '「游戏系统」设定生成：为惊悚乐园小说生成游戏化系统设定，包括系统名称、系统类型、进入机制、等级体系、积分货币、死亡惩罚、奖励机制、系统人格和其他规则',
  '"Game System" setting generation: generate gamified system settings for thriller park novels, including system name, type, entry mechanism, level system, currency, death penalty, rewards, system personality and other rules',
  '## 「游戏系统」设定生成 — 惊悚乐园小说

「游戏系统」是惊悚乐园类型小说的骨架，它定义了主角与恐怖世界之间的交互规则。一个设计精良的系统既能为恐怖叙事提供结构框架，又能通过规则本身制造额外的恐惧感。系统不是单纯的"游戏面板"，它是故事中一个隐性的角色。

---

### 字段生成指南

#### 系统名称

系统名称决定了读者对整个故事基调的第一印象。好的名称应当：
- **暗示恐怖**：名称本身带有不安感，如"噩梦游乐场""深渊竞技场""末日乐园"
- **暗示游戏化**：让读者意识到这是有规则的生存游戏，如"恐惧值测试系统""灵异任务大厅"
- **避免过于直白**：不要叫"恐怖游戏系统"这种毫无想象力的名字
- **考虑系统人格**：如果系统人格偏向幽默/癫狂，名称也可以反差萌，如"快乐恐惧乐园"

常见命名模式：
| 模式 | 示例 | 适合的基调 |
|------|------|-----------|
| 场所型 | 噩梦竞技场、深渊剧场 | 正统恐怖 |
| 抽象型 | 恐惧值系统、灵魂拍卖行 | 偏设定流 |
| 反差型 | 快乐恐惧乐园、阳光地狱 | 黑色幽默 |
| 代号型 | 系统-13、Project Nightmare | 科幻/悬疑 |

#### 系统类型

系统类型决定了故事的核心运行逻辑。主要类型包括：

- **积分生存型**：玩家通过完成副本获取积分，积分可兑换技能/道具/信息。这是最经典的类型，优点是读者容易理解，缺点是容易写成"打怪升级"。设计时要让积分体系与恐怖元素深度绑定——例如积分来源是"恐惧值"，你越害怕越能获得积分，但恐惧过度会精神崩溃。
- **任务驱动型**：系统发布任务，玩家必须完成否则受罚。优点是每个副本都有明确目标，推动力强；缺点是容易让故事变成"接任务→完成任务"的流水线。设计时要让任务本身带有道德困境或信息不对称。
- **竞技淘汰型**：玩家之间互相竞争，末位淘汰（死亡）。优点是人性冲突天然丰富；缺点是容易变成大逃杀而丧失恐怖感。设计时要让"恐怖环境"和"人际博弈"形成双重压力。
- **探索解密型**：副本是一个封闭空间，玩家需要找到出路或真相。优点是悬疑感强，适合伏笔铺设；缺点是如果解谜太难读者会失去耐心。设计时要分层设置线索：表层线索让读者跟得上，深层线索给二刷读者惊喜。
- **混合型**：综合以上多种。这是最灵活但也最容易失控的类型。建议以一种为主、一种为辅，不要贪多。

#### 进入机制

决定玩家如何被拉入系统。这直接影响故事的起点设计：

- **随机选召**：最常见，主角被莫名选中。优点是开篇快，不需要太多铺垫；缺点是缺乏宿命感。适合快节奏、副本量大的故事。
- **触发条件**：特定行为触发进入（如看到某个符号、说出某句话）。优点是有仪式感和悬念；缺点是需要解释触发逻辑。适合偏悬疑的故事。
- **血脉/天赋绑定**：特定人群才能进入。优点是有身世之谜可以挖掘；缺点是容易变成"血统论"。适合有家族秘密主线的故事。
- **死亡触发**：濒死或死亡后才能进入。优点是开篇冲击力极强；缺点是需要处理"死而复生"的逻辑。适合偏黑暗的故事。
- **自愿加入**：主角主动进入系统。这种方式让主角有更强的主体性，但需要解释"为什么一个正常人会主动加入恐怖游戏"——通常是为了某个无法拒绝的奖励（救回亲人、治好绝症等）。

#### 玩家等级体系

等级体系不只是数字，它应该与恐怖叙事深度绑定：
- 等级名称应有恐怖/游戏风味，如"见习者→猎魂者→噩梦行者→深渊漫步者"
- 等级提升的条件不应只是"积累经验"，应包含"面对更高级别的恐惧"
- 高等级不代表安全——可以设计"高等级解锁更恐怖的副本"机制
- 等级差距要产生叙事意义：低等级对高等级的恐惧、高等级玩家的傲慢和脆弱

#### 积分货币系统

积分的获取和消耗直接影响叙事节奏：
- **获取来源**要多元：不只是通关副本，还可以是"提供线索""击杀特定怪物""完成隐藏任务"
- **消耗方向**要有选择困境：治疗伤势、购买道具、获取情报——当积分不足时，选择本身就是恐怖
- **特殊货币**：除了通用积分，可以设计需要"代价"的特殊货币，如用寿命、记忆、感官换取的高级货币
- 避免通货膨胀：如果积分太容易获取，紧张感就会消失

#### 死亡惩罚

惊悚乐园类型的核心张力源——死亡必须有重量：
- **真实死亡**：副本里死了就是真死。最高张力但限制大，因为配角不能随便死（除非写成无限流那种大量新角色不断涌入）
- **复活机制**：可以复活但有代价（失去记忆、等级降级、肢体缺损）。推荐这种——死亡有痛感但故事能继续
- **惩罚递进**：第一次死亡扣积分，第二次降级，第三次真实死亡。递进式设计让每次濒死都越来越紧张
- **转化机制**：死亡后不是消失而是变成副本中的怪物/NPC。这是最有创意的设计之一，可以制造极大的情感冲击

平衡哲学：死亡惩罚太轻→读者不紧张；死亡惩罚太重→作者没法写（角色动不动就死绝了）。建议采用"看似能活但非常艰难"的平衡点。

#### 奖励机制

奖励是推动主角冒险的动力：
- 奖励类型：技能、道具、信息、属性提升、特殊权限
- 奖励应与副本主题相关：鬼屋副本的奖励可以是"阴眼"（看见灵体的能力）
- 稀有奖励应该有副作用或使用条件，增加决策深度
- 可以设计"诅咒道具"——强大但有隐患，让主角在贪婪和谨慎之间挣扎

#### 系统人格

系统不应是冰冷的机器，它的人格直接影响叙事体验：
- **冷漠理性型**：只陈述规则，不带感情。适合正统恐怖，系统本身就像一个不可知的高维存在
- **幽默癫狂型**：用轻松甚至嘲讽的语气播报恐怖事件。适合黑色幽默风格，如"恭喜你！你的队友已经被吃掉了~"
- **温和引导型**：看似善意地提供帮助，但帮助总是不够或有误导。适合制造"系统到底是敌是友"的悬念
- **恶意操控型**：系统明显在作弄玩家，享受他们的恐惧。适合高压恐怖，系统本身就是最大的反派

系统人格如何影响叙事：人格不同，同一个事件的文字表现完全不同。比如队友死亡——冷漠型："玩家张三已阵亡"；幽默型："哎呀，张三同学提前退场了呢~下一个是谁？"；恶意型："看到了吗？这就是弱者的下场。"

#### 其他规则

补充核心规则之外的特殊设定：
- 信息共享限制（能否向非玩家透露系统存在）
- 现实世界的时间流速差异
- 强制参与条件（连续不参加副本的惩罚）
- 隐藏规则（玩家需要自己发现的潜规则）

---

### 设计要点

1. **规则即恐怖**：好的系统设计让规则本身成为恐惧来源。当主角发现"原来规则不是他理解的那样"时，恐惧感会倍增。
2. **留白空间**：不要把所有规则在开篇就说清楚。随着副本推进逐渐揭示规则，让读者和主角一起探索系统的真面目。
3. **规则漏洞**：高智商主角的核心表现就是找到规则漏洞。设计系统时要预留一些"看似合理但可以被利用"的规则空间。
4. **系统可靠性**：系统是否总是遵守自己的规则？如果系统偶尔"犯错"或"作弊"，这本身就是一个巨大的悬念点。

### 常见错误

- **系统过于复杂**：规则太多读者记不住。核心规则控制在5-7条以内，其余通过剧情自然展现
- **系统过于公平**：真正的恐怖来自不公平。如果系统完全公平，就变成了普通的游戏小说
- **忽略系统与恐怖的结合**：系统不应只是"管理面板"，它应该与恐怖体验深度融合
- **奖惩失衡**：奖励太丰厚会让读者觉得"进系统也不错"，完全丧失恐怖感
- **系统人格前后不一致**：如果系统一会儿幽默一会儿冷漠，读者会感到违和（除非这种不一致本身是设定）',
  '## "Game System" Setting Generation — Thriller Park Novel

The "Game System" is the backbone of thriller park novels, defining interaction rules between protagonist and horror world. A well-designed system provides structural framework for horror narrative while creating additional fear through rules themselves.

---

### Field Generation Guide

#### System Name
Should imply both horror and gamification. Avoid overly literal names. Consider tone: formal horror (Nightmare Arena), dark humor (Happy Fear Park), sci-fi (Project Nightmare).

#### System Type
Main types: Score Survival (classic, earn points through instances), Task-Driven (system assigns missions), Competitive Elimination (PvP with elimination), Exploration Puzzle (find exits/truth in closed spaces), Hybrid (combine types, keep one primary).

#### Entry Mechanism
How players enter: Random Selection (fast start), Trigger Condition (ritualistic), Bloodline/Talent (mystery potential), Death Trigger (strong opening impact), Voluntary Entry (needs compelling motivation like saving loved ones).

#### Player Level System
Levels should bind to horror narrative. Higher levels unlock more terrifying instances. Level names should carry horror flavor. Level gaps create narrative tension.

#### Currency System
Multiple acquisition sources, spending creates dilemmas (heal vs buy vs intel). Special currencies with costs (trade lifespan/memories). Avoid inflation.

#### Death Penalty
Core tension source. Options: true death (highest stakes), revival with cost (recommended — pain but story continues), progressive penalty, transformation into monster/NPC (most creative).

#### Reward Mechanism
Rewards tied to instance themes. Rare rewards should have side effects. "Cursed items" create greed-vs-caution decisions.

#### System Personality
Cold rational, humorous/manic, gentle guide, or malicious manipulator. Personality shapes how every event is narrated and creates "friend or foe" suspense.

### Common Mistakes
- System too complex (keep core rules to 5-7)
- System too fair (real horror comes from unfairness)
- Ignoring system-horror integration
- Reward-punishment imbalance
- Inconsistent system personality',
  (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1),
  1,
  20,
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
