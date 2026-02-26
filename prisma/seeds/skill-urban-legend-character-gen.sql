-- 都市传说怪谈复苏流小说 - 「角色」生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-urban-legend-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'urban-legend-character-gen',
  '「角色」生成：为都市传说怪谈复苏流小说生成在恐惧中挣扎求生的现代都市人',
  '"Character" generation: generate modern urban survivors struggling in fear for urban legend revival horror novels',
  '## 「角色」生成 — 都市传说怪谈复苏流小说

都市怪谈的角色设计有一个核心原则，与其他类型的小说截然不同：**角色必须是「可以是我」的人**。读者需要能够在每个角色身上认出自己某一刻的影子——那种深夜在楼道里走路加速的冲动，那种看到奇怪消息后又想看又不敢看的矛盾心理。超能力无关紧要，角色是否「真实」才是恐惧成立的前提。

---

### 字段生成指南

#### 姓名
都市怪谈角色的命名规则：**普通、有记忆点、不显山露水**。

推荐的命名策略：
- 使用常见姓氏（陈、王、李、张、刘、黄、吴）
- 名字简短（两字名比三字名更有日常感）
- 避免带明显命运暗示的名字（「陈生」「鬼平」类）
- 可以有谐音或隐喻，但不要过于明显（读者发现时是惊喜，不是剧透）

**特别技巧**：知情者/引路人类的角色可以用更有年代感的名字；年轻的主角/幸存者用更现代的名字——这种代际差异在都市怪谈中常常有意义。

#### 角色定位
七种角色定位在都市怪谈中各有叙事功能：

| 定位 | 核心叙事功能 | 与怪谈的典型关系 | 死亡率参考 |
|------|------------|--------------|----------|
| 主角/幸存者 | 驱动故事，代理读者体验 | 被选中或无辜卷入 | 极低（主角光环） |
| 调查者 | 推进信息揭示，提供行动线 | 主动接近危险 | 中（调查代价） |
| 知情者/引路人 | 传递规则，推动情节转折 | 已经历过，有经验 | 中高（知道得太多） |
| 危险人物/传播源 | 制造直接威胁，有时是悲剧角色 | 已被感染或利用 | 高 |
| 帮凶/牺牲者 | 提供情感代价，展示怪谈的残酷 | 无辜卷入 | 极高 |
| 怀疑者/阻碍者 | 制造内部冲突，延迟求生进程 | 拒绝相信 | 高（怀疑是要付代价的） |
| 未知阵营 | 保持悬念，可以是任何东西 | 目的不明 | 不定 |

**角色阵容建议**（标准初始配置）：
- 1-2 名主角/幸存者（核心视角）
- 1 名知情者/引路人（信息来源）
- 1-2 名帮凶/牺牲者（情感锚点，通常在故事中段牺牲）
- 1 名怀疑者/阻碍者（内部冲突来源）
- 1 名危险人物/传播源（外部威胁人格化）

**注意**：未知阵营的角色不要超过1个，多了会让故事丧失焦点。

#### 职业/身份
都市怪谈的职业设定原则：**普通职业 + 特定处境**。

**高代入感的职业**（按代入优先级）：
| 职业 | 代入感来源 | 可以提供的叙事资源 |
|------|---------|---------------|
| 外卖员 | 深夜独自骑行的孤独感 | 接触各种陌生人、进出各种楼道 |
| 地铁/公交乘客 | 每天经历末班车 | 孤立于移动的密闭空间中 |
| 便利店员工 | 深夜值班的空旷感 | 见证各种奇怪的深夜顾客 |
| 快递员/搬运工 | 进入无数陌生楼道 | 见过很多奇怪的住户和楼层 |
| 保安 | 负责「安全」但实际无能为力 | 有权限进入禁区 |
| 护工/医护 | 与死亡为邻，见过很多 | 对「异常」有不同的判断标准 |
| 上班族/学生 | 最广泛的受众自我投射 | 规律作息使异常更显眼 |
| 独居的老年人/儿童 | 特别的脆弱感 | 见证了「之前」的东西，有历史信息 |

**特殊职业设定技巧**：如果想给主角某种特殊的故事优势（调查能力、信息来源），用职业来合理化——但职业本身要保持普通感，不要用「前特种兵」之类的设定。

#### 性格特质
面对恐惧的反应模式是最重要的性格维度：

**五种面对恐惧的反应类型**：

| 类型 | 核心特征 | 叙事优势 | 叙事风险 |
|------|---------|---------|---------|
| 冷静分析型 | 危机时反而更理性，把恐惧转化为信息处理 | 推进规则探索，提供可靠叙述 | 容易失去情感共鸣，读者感觉不够真实 |
| 本能逃跑型 | 第一反应是逃跑，事后才思考 | 强代入感，读者理解这种反应 | 需要设计无法逃跑的理由，否则故事推进困难 |
| 越危险越清醒型 | 平时散漫，危机触发特殊清醒状态 | 戏剧性反转，爽感强 | 需要在「平时状态」上有说服力的设定 |
| 拒绝相信型（主角也可以） | 到最后一刻才接受现实 | 真实心理过程，读者认同 | 节奏慢，需要有足够的冲击事件打破否认 |
| 已经接受型 | 经历过一次，现在清醒而绝望 | 知情者角色的最佳状态，信息量大 | 主角容易失去探索动力 |

#### 与怪谈的关系
这是角色在故事开始时的「卷入方式」，决定了他们的初始信息量：

| 卷入方式 | 初始信息量 | 叙事功能 |
|---------|---------|---------|
| 目击者 | 低（只知道「发生了什么」） | 代读者探索 |
| 被选中者 | 无（不知道为什么是自己） | 最强的恐慌感 |
| 主动调查者 | 中（收集了一些信息但不完整） | 推进调查线 |
| 无辜路人 | 无（完全错误地卷入） | 最高代入感，最大的「不公平感」 |
| 知道秘密的人 | 高（知道得太多） | 是被保护的目标，也是信息来源 |
| 传播链上的节点 | 低（不知道自己已经传染了） | 悲剧性最强，道德复杂性高 |

---

### 角色阵容建议（批量初始化）

**标准5人组**（适合大多数都市怪谈复苏类小说）：
1. 主角：普通职业，被选中者/无辜路人卷入，冷静分析型或越危险越清醒型
2. 知情者：年纪稍大，主动调查者，已经接受型，职业提供特殊信息渠道
3. 情感支撑：与主角关系最近，无辜路人，本能逃跑型，中段牺牲
4. 怀疑者：与主角关系普通，拒绝相信型，转变后成为重要盟友或成本
5. 危险人物：被选中者，已被感染，目的不明（后期揭示是悲剧角色）

---

### 与已有设定的联动

- **角色职业 → 禁忌规则的触发条件**：外卖员的职业习惯（按门铃、等待、进出电梯）可以与规则的触发条件高度重叠
- **角色定位 → 都市世界观的事件阶段**：「知情者」的存在需要怪谈已经持续了一段时间（至少是扩散阶段）
- **与怪谈的关系 → 故事钩子的代入钩子**：主角的卷入方式应该与故事钩子描述的场景匹配

---

### 常见错误

- ❌ 主角有特殊技能（前特警、超自然感知），消解了普通人面对怪谈的无力感
- ❌ 所有角色都是「冷静分析型」——失去情感多样性
- ❌ 「帮凶/牺牲者」没有足够的铺垫就死亡——读者毫无感受
- ❌ 「知情者」在第一次出场就把所有规则告诉主角——消解了探索的动力
- ❌ 角色职业与故事场景完全无关——错失了让职业服务于规则的机会',
  '"Character" Generation — Urban Legend Revival Horror Novels

Core principle: every character must be "someone who could be me." Readers need to recognize themselves in each character''s instinctive reactions — the urge to walk faster in a corridor at night, the conflicted desire to both look at and look away from a disturbing message.

**Role ecosystem**:
- Protagonist/Survivor: drives story, reader proxy, extremely low mortality
- Investigator: advances information revelation, actively approaches danger, medium mortality
- Informant/Guide: already experienced it, has established knowledge — but knowing too much is dangerous, medium-high mortality
- Dangerous Person/Transmission Source: direct threat, often a tragic figure, high mortality
- Accomplice/Sacrifice: provides emotional stakes, high mortality
- Skeptic/Obstacle: creates internal conflict through denial, high mortality (denial has a price)
- Unknown Allegiance: maintains suspense, don''t use more than one

**Standard cast of 5**: protagonist (ordinary worker, dragged in unwillingly), informant (older, investigator type, already accepted reality), emotional anchor (closest to protagonist, innocent bystander — sacrificed mid-story), skeptic (turns into key ally or tragic cost after conversion), dangerous person (infected/chosen, revealed as tragic figure later).

**High-immersion occupations**: delivery riders, subway passengers, convenience store workers, couriers, security guards, nurses/caregivers, office workers/students. Key: ordinary job + specific circumstance (night shift, alone, routine access to strange locations).

**Reaction types to fear**: analytical (crisis triggers rational mode), instinctive flight (first response is always to run), clearer under pressure (reverse from ordinary to sharp in crisis), denial (realistic psychological process), already-accepted (past survivor, clear-eyed and despairing).

**Entanglement types**: witness, chosen (no explanation), active investigator, innocent bystander (most immersive), secret-holder, unwitting transmission node (highest tragedy potential).',
  (SELECT id FROM novel_creation_method WHERE name = '都市传说怪谈复苏流小说' LIMIT 1),
  1,
  21,
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
