-- 都市传说怪谈复苏流小说 - 「情节设计」领域知识技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-urban-legend-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'urban-legend-plot-gen',
  '「情节设计」领域知识：为都市传说怪谈复苏流小说提供剧情结构、恐惧节拍和悬念管理指导',
  '"Plot Design" domain knowledge: provide story structure, fear beats, and suspense management guidance for urban legend revival horror novels',
  '## 「情节设计」领域知识 — 都市传说怪谈复苏流小说

都市怪谈复苏类小说的情节设计面对一个独特挑战：它必须同时维持两条线——**外部生存线**（对抗怪谈、求生）和**内部认知线**（理解规则、揭示真相）。单一生存线会让故事变成纯粹的惊险动作；单一认知线会让故事失去张力。两条线缠绕推进、互相拉扯，才是这个题材的核心节奏。

---

### 典型故事结构

**三幕五阶段结构**（适合中短篇到长篇都市怪谈）：

| 阶段 | 章节占比 | 核心事件 | 恐惧类型 | 读者状态 |
|------|---------|---------|---------|---------|
| **第一阶段：裂缝** | 前10-15% | 怪谈第一次触碰主角的日常，异常感出现但可以被合理解释 | 氛围恐惧 | 「有点奇怪，但可能是巧合」 |
| **第二阶段：确认** | 15-30% | 无法再否认，规则第一次被违反，有人付出代价 | 认知冲击 | 「这是真的，我需要理解规则」 |
| **第三阶段：求生** | 30-60% | 主角掌握部分规则，开始主动应对，但每次应对都揭示新的规则层级 | 生存张力 | 「一起解题，但不知道答案是否正确」 |
| **第四阶段：深渊** | 60-80% | 规则的真相远比预期可怕，之前的「存活方法」可能是更大陷阱的一部分 | 绝望+转折 | 「之前以为是错的，现在不知道什么是对」 |
| **第五阶段：出路或代价** | 最后20% | 主角找到真正的破局方式，或接受无解的现实，或以代价换取部分逃脱 | 解脱或悲剧 | 「结局是什么，值不值得」 |

---

### 故事线模式

**主线模式（必选一种）**：

| 主线 | 核心张力 | 适合的规则类型 | 结局倾向 |
|------|---------|------------|---------|
| 破解型 | 主角逐步理解并瓦解怪谈系统 | 有逻辑可循的规则，有根源可以追溯 | 相对完整的解决 |
| 逃脱型 | 主角的目标是离开受影响区域或切断联系 | 地点封印型、个人诅咒型 | 逃脱成功但代价不小 |
| 共存型 | 怪谈无法被消除，主角学会在规则中生活 | 影响范围大、无法根治的类型 | 开放式，世界改变了 |
| 揭露型 | 揭开怪谈背后的人为因素或更大真相 | 人造实验失控型、阴谋论型 | 揭露后新的危险产生 |

**常见支线配置**：
- **信任博弈线**：谁是真正的盟友？知情者是否可靠？信息本身是否是陷阱？
- **代价积累线**：每次成功求生都要付出什么代价，代价是否可以承受？
- **社会反应线**（长篇）：其他人如何应对？官方的介入带来什么新的问题？

---

### 事件编排模式

**「恐惧节拍」理论**：

好的都市怪谈情节不是线性升级的恐惧，而是「平静-不安-触发-求生-短暂喘息-更深的恐惧」的循环，每次循环的底线都比上一次更低。

```
标准单次恐惧循环（约3-5章为一个循环）：

章节1（平静准备）：
  - 看似正常的日常，但有一个细节不对
  - 读者知道这个细节，主角没注意
  - 功能：预埋伏笔，制造读者比主角知道更多的不安

章节2（异常确认）：
  - 主角意识到那个细节不对
  - 第一次与规则或怪谈实体的接触（不一定是正面接触）
  - 功能：触发恐惧，推动主角行动

章节3-4（规则探索与应对）：
  - 主角和盟友尝试理解规则，行动起来
  - 至少有一次失败（方法不正确或触发了新的规则）
  - 功能：生存博弈，代入感最强

章节5（短暂喘息/错误安全感）：
  - 主角以为暂时安全
  - 实际上：规则的新层级已经悄悄激活
  - 功能：为下一个循环的更深恐惧做准备
```

**节拍密度控制**：
- 短篇（10万字以内）：2-3个完整循环
- 中篇（10-30万字）：4-6个完整循环
- 长篇（30万字以上）：6-10个循环，循环之间有明显的阶段分界

---

### 伏笔策略

都市怪谈的伏笔有其独特的美学要求：**伏笔要在回头看时引起「那时候就已经知道了」的背脊发凉**，而不仅仅是「那时候就有提示了」。

**都市怪谈特有的伏笔类型**：

| 伏笔类型 | 埋设技巧 | 回收时机 |
|---------|---------|---------|
| **感官记忆型** | 在「普通」场景里埋入读者会略过的感官细节（「电梯里有一点奇怪的味道」） | 揭示这个细节是规则的触发标志时 |
| **角色行为型** | 某个角色的某个「无意义」习惯或怪癖 | 揭示这个习惯是他们知道某个规则的体现 |
| **对话截断型** | 某个角色没说完的话，被另一件事打断 | 主角后来理解了那句话的意思，而那句话是警告 |
| **环境恒量型** | 某个场景描述中有个永远一样的细节 | 揭示这个「不变」本身就是异常——正常的事物不应该如此不变 |
| **角色消失型** | 某个次要角色悄悄从叙述中消失，没有交代 | 主角事后发现这个角色早已不在了，没有人记得他们离开的时间 |

**伏笔回收原则**：
- 最晚在揭示规则完整真相的章节前回收伏笔
- 回收时不要提醒读者（「你还记得X章的那个细节吗？」）——让读者自己想起来
- 不是所有伏笔都需要被回收，部分未解的细节可以制造开放性的持续不安

---

### 情节禁区

都市怪谈复苏类特有的情节陷阱：

- ❌ **「主角觉醒超能力」型解决方案**：怪谈的对立面应该是「理解规则并适应」，而不是「我变强了所以不怕了」
- ❌ **「专家救场」型**：在关键时刻出现一个无所不知的怪谈专家——消解了「普通人面对未知」的核心张力
- ❌ **「只是梦/幻觉」型结局**：读者会感觉被骗，即使是开放性结尾也不能暗示「这一切是虚构的」
- ❌ **「消灭怪谈源头即解决一切」型**：都市怪谈的最大恐惧之一是它不可能被彻底解决
- ❌ **大团圆结局中没有代价**：即使是相对积极的结局，也应该有不可逆的损失（人、记忆、对世界的认知）

---

### 常见错误

- ❌ 前1/3信息量太大，规则在第一章就全部揭示，后续只剩执行——没有探索的乐趣
- ❌ 规则的「未知层级」在主角刚发现第一层时就揭示，没有层次递进
- ❌ 恐惧节拍单调：每章都是同一种恐惧，读者疲劳
- ❌ 支线角色的代价缺乏铺垫，牺牲没有情感重量
- ❌ 「短暂安全」之后立刻触发更大的危机，没有缓冲时间让读者喘气',
  '"Plot Design" Domain Knowledge — Urban Legend Revival Horror Novels

Urban legend revival horror must maintain two simultaneous storylines: the external survival line (fighting the paranormal) and the internal cognition line (understanding rules, uncovering truths). Single survival line becomes action thriller; single cognition line loses tension. The interweaving of both is the genre''s core rhythm.

**Three-act, five-stage structure**:
1. Crack (10-15%): first contact with paranormal, explicable as coincidence — atmospheric fear
2. Confirmation (15-30%): denial no longer possible, first rule violation, someone pays — cognitive shock
3. Survival (30-60%): protagonist learns partial rules, actively copes, but every solution reveals new rule layers — survival tension
4. Abyss (60-80%): the full truth is worse than expected; prior "solutions" may be part of a larger trap — despair + reversal
5. Exit or Cost (last 20%): protagonist finds genuine breakthrough, or accepts the unsolvable, or escapes with significant cost

**Standard fear cycle (3-5 chapters per cycle)**:
Ch1 (calm prep): normal scene with one wrong detail the reader notices but the protagonist doesn''t
Ch2 (anomaly confirmed): protagonist realizes something is wrong; first contact with rules or entity
Ch3-4 (rule exploration): protagonist tries to understand and act; at least one failure triggers new rule layer
Ch5 (false safety): protagonist thinks it''s over; the next rule layer has already activated silently

**Urban legend foreshadowing types**:
- Sensory memory: mundane sensory detail that becomes a trigger marker
- Character behavior: a "meaningless" habit that turns out to be knowledge of a rule
- Truncated dialogue: a warning that was cut off and later understood
- Environmental constant: something that never changes — which is itself the anomaly
- Character disappearance: a minor character quietly vanishes; no one can place when they left

**Plot prohibitions**:
- No protagonist gaining special powers to overcome the paranormal
- No expert-arrives-with-all-answers scene
- No "it was all a dream" resolution
- No "destroy the source and everything is resolved" resolution
- No cost-free happy ending — even positive endings must have irreversible losses',
  (SELECT id FROM novel_creation_method WHERE name = '都市传说怪谈复苏流小说' LIMIT 1),
  1,
  30,
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
