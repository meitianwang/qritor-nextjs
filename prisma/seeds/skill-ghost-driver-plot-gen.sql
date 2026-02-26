-- 灵异司机职业流小说 - 情节设计技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ghost-driver-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ghost-driver-plot-gen',
  '情节设计：为灵异司机职业流小说编排以「班次」为单元的职业危机与升级成长',
  'Plot design: structure professional crises and upgrade progression using "shift" as the fundamental narrative unit for ghost bus novels',
  '## 情节设计 — 灵异司机职业流小说

灵异职业流小说的情节结构有一个天然的节拍器：**每个班次就是一个故事单元**。这类小说的核心叙事挑战是如何在「班次-班次-班次」的重复结构中制造递进感，让每次出班都有新意，同时让读者感受到主角在积累经验、解锁能力、揭开谜题。

---

### 故事结构模型

#### 宏观结构（整体故事弧）

灵异职业流通常遵循「职业成长三阶段」：

```
第一阶段：生存适应（前10-20班次）
目标：活下来，搞清楚基本规则
特征：被动应对，每班次都是险情，靠本能和运气，开始积累冥币修复初始缺陷

第二阶段：主动应对（中段）
目标：从被动变主动，开始有策略地处理乘客
特征：装备初步完善，开始理解特定乘客的规律，有条件的主动出击，主线谜题开始浮现

第三阶段：掌控全局（后期/高潮前）
目标：主动介入更大的故事，或试图找出/改变契约
特征：与冥府机构的直接互动，主线谜题走向揭示，主角的行动开始影响「这条线路的命运」
```

**生成情节时要能判断当前属于哪个阶段**，并确保情节密度和难度与阶段匹配。

---

### 班次故事设计模式

#### 模式一：「威胁型」班次（核心类型，40-50%）

结构：普通出发 → 发现今晚的特殊存在 → 局势升级 → 危机处理 → 代价与收获

**关键设计点**：
- 「今晚的威胁」要具体（不是泛指「很危险的鬼」，而是「有具体诉求/行为的存在」）
- 威胁解决方式要多样：谈判/利用规则/使用装备/放任通过/请求帮助（各有代价）
- 威胁后的「代价」是叙事重心之一：赚了多少/损失了什么/对明天的影响

#### 模式二：「关系型」班次（副线推进，20-30%）

结构：常客出现 → 新信息/新发展 → 关系深化或裂变 → 悬念留白

**关键设计点**：
- 常客乘客要有自己的故事线，司机只是见证者和参与者
- 关系型班次的「事件」不一定危险，但要有情绪重量
- 可以通过常客侧面揭示世界观（他们知道主角不知道的事）

#### 模式三：「信息型」班次（世界观揭示，10-20%）

结构：异常信号 → 主角主动或被动获取信息 → 谜题扩展 → 下一个问题

**关键设计点**：
- 每次信息揭示都应该同时回答一个旧问题和提出一个新问题
- 信息来源要多样（乘客/装备/前任遗留物/冥府官差）
- 避免「信息倾倒」——一次揭示太多，而不是给信息附带新的谜题

#### 模式四：「喘息型」班次（节奏调节，10-20%）

结构：相对平静的班次 → 日常互动/意外小事 → 主角思考/规划 → 对比后的温柔

**关键设计点**：
- 不是「没有事情发生」，而是「小事情带来不寻常的重量」
- 利用这类班次展示主角的内心世界和白天生活的对照
- 在喘息后立即安排高强度班次，对比制造新的张力

---

### 情节编排原则

#### 节奏管理

```
每5班次为一个「章节单元」，内部建议节奏：
班次1-2：普通或低强度
班次3-4：中强度（核心班次）
班次5：喘息或转折（小结）

每10-15班次：一次「里程碑事件」
里程碑类型：重要升级 / 谜题重大推进 / 关键角色改变 / 契约新发展
```

#### 伏笔策略

灵异职业流的伏笔应该通过「职业信息」植入，而不是突兀的神秘预兆：

- ✅ 「这条线路以前有三个司机，两个辞职，一个……」（职业背景信息，读者会记住）
- ✅ 某个站的规矩：「必须等满三分钟，不能早离开」→ 后来揭示为什么
- ❌ 「当时我还不知道，今晚会是改变一切的夜晚」（剧透式铺垫，破坏悬念）

**伏笔回收时机**：
- 短期伏笔（1-5班次内回收）：当班或次班的具体危机
- 中期伏笔（10-20班次）：乘客的执念结局，常客的故事线
- 长期伏笔（50班次以上）：主线谜题，契约的真实内容，雇主的目的

#### 升级里程碑与情节挂钩

升级不应该只是「存够了冥币然后买」，重要的升级要对应情节时机：

| 升级类型 | 对应情节触发 |
|---------|------------|
| 修复初始缺陷 | 第一次因为这个缺陷差点失败（危机后立即升级）|
| 主动防护装备 | 遭遇一类新威胁，意识到当前装备无效 |
| 信息类装备 | 信息缺失导致一次重大失误后 |
| 强力特殊装备 | 完成一条重要支线任务，作为奖励 |

---

### 故事线类型

**单班次线**（当班发生，当班解决）：适合威胁型班次，读者满足感强，是主体内容

**跨班次支线**（跟随某个常客角色）：执念鬼的未竟之事通常跨越多个班次，让读者形成投入感

**主线谜题**（全文贯穿）：「这条线路为什么存在」「雇主真实目的」「前任司机发生了什么」，每隔一段时间推进一点，是读者留存的核心动力

---

### 常见错误

- ❌ 每班次都是同等强度的危机，读者疲劳，失去节奏感
- ❌ 升级发生在「存够冥币」的时刻，而不是情节推动的时刻
- ❌ 伏笔植入太刻意（角色一出现就有大量铺垫），破坏日常感
- ❌ 主线谜题进展太慢（50章内没有实质性推进），读者流失
- ❌ 每个班次独立成篇，前一班的事件对后续没有影响（缺乏积累感）',
  'Plot Design — Ghost Driver Paranormal Novel

Core structure: the shift is the fundamental narrative unit. The challenge is creating progressive depth within a repeating "shift-shift-shift" pattern.

**Three-stage story arc**:
1. Survival/Adaptation (first 10-20 shifts): passive response, learning basic rules, fixing initial deficiencies
2. Active Management (middle): strategic passenger handling, preliminary equipment, main mystery begins emerging
3. Full Control (late/pre-climax): direct interaction with underworld institution, mystery revelation, protagonist actions affect the route''s fate

**Four shift story patterns**:
1. Threat shifts (40-50%): specific entity with specific intent → escalation → resolution method (negotiation/rules/equipment/letting pass) → cost and gain
2. Relationship shifts (20-30%): regular passenger story development → relationship deepening or rupture → mystery teaser
3. Information shifts (10-20%): each revelation answers one old question and raises one new one — never just dump information
4. Breather shifts (10-20%): relatively quiet → small events with unexpected emotional weight → contrast for next high-intensity shift

**Rhythm structure**: every 5 shifts = chapter unit (2 low → 2 medium → 1 breather/pivot); every 10-15 shifts = milestone event (major upgrade/mystery progress/key character change/contract development)

**Foreshadowing principle**: plant through "professional information," not ominous prophecy. "This route had three previous drivers — two quit, one..." is better than "I didn''t know that night would change everything."

**Upgrade-plot coupling**: major upgrades should be triggered by plot events (gap almost caused failure → fix it; new threat rendered existing equipment useless → acquire counter-equipment).',
  (SELECT id FROM novel_creation_method WHERE name = '灵异司机职业流小说' LIMIT 1),
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
