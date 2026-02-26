-- 都市传说怪谈复苏流小说 - 「禁忌规则」设定生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-urban-legend-rules-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'urban-legend-rules-setting-gen',
  '「禁忌规则」设定生成：为都市传说怪谈复苏流小说设计可信、有层次、可探索的规则体系',
  '"Taboo Rules" setting generation: design believable, layered, explorable rule systems for urban legend revival horror novels',
  '## 「禁忌规则」设定生成 — 都市传说怪谈复苏流小说

禁忌规则是都市怪谈复苏类小说区别于传统鬼故事的核心设计元素。传统鬼故事靠随机恐惧——你不知道鬼什么时候出现。都市怪谈的规则恐惧更深层：**你知道规则，但规则太难遵守；你以为自己遵守了，但总有一个细节漏掉**。好的规则体系让读者在读的同时，不由自主地对照自己的日常行为，发现自己已经违反了几条。

---

### 字段生成指南

#### 核心规则
核心规则的黄金标准：**简短、具体、反直觉**。

**结构模式（三选一）**：
1. **「不要做X」型**：负向禁止，最本能，效果最强
   - 示例：「不要在深夜数楼层——无论按了几楼，最终都会停在某个你没按的层」
2. **「必须做X」型**：强迫行为，制造仪式感和服从压力
   - 示例：「收到这条消息后必须在5分钟内转发，否则你的住址会出现在另一个人的梦里」
3. **「如果X，则必须Y」型**：条件规则，有操作感，给主角留下行动空间
   - 示例：「如果电梯停了超过30秒，不要按开门键，按任意楼层键，等它自己走」

**判断标准**：
- ✅ 规则具体到可以被违反（「不要在深夜」不够具体；「不要在0点到4点之间」就够了）
- ✅ 规则与日常行为有真实交叉（读者自己的行为习惯里可能已经违反了）
- ✅ 规则的存在有某种内在逻辑（不需要解释，但应该「感觉上」有道理）
- ❌ 规则是随意的（「不要穿红色」但没有任何逻辑可寻）
- ❌ 规则太容易遵守（「不要在午夜拜访墓地」——大多数人本来就不会）

#### 触发条件
触发条件越精准，恐怖感越强。

**精准化技巧**：
| 维度 | 模糊（弱） | 精准（强） |
|------|----------|----------|
| 时间 | 「夜晚」 | 「凌晨3:00到3:07」 |
| 状态 | 「独自」 | 「楼道里只有你一个人且所有灯都亮着」 |
| 行为 | 「看见它」 | 「视线对上后保持超过3秒」 |
| 数量 | 「多次」 | 「第七次之后」 |
| 顺序 | 「之前」 | 「在说出名字之前先做了别的事」 |

**特别注意**：触发条件要有「人性弱点」——触发它不应该是愚蠢行为，而是任何正常人都可能无意中做到的事。「好奇」「慌乱」「惯性动作」「无意识行为」都是很好的触发门槛。

#### 违规后果
后果的设计要有层次感，不要一开始就把最严重的后果写出来：

**层次化后果框架**：
```
第一层（即时反应，读者最先看到）：
  感官异常——突然的寒意、电话里的杂音、镜子里多了一个影子

第二层（数分钟到数小时）：
  行为异常——无法离开、无法呼救、无法让别人看见自己的处境

第三层（延迟后果，几天后）：
  不可逆的标记——梦里反复出现同一个场景、某个人开始消失于他人记忆

第四层（最终后果，揭示给读者的顶点）：
  ——留给主角去发现，不要在设定中写死
```

生成时，描述前三层，第四层用「更多细节尚未查明」之类的留白处理。

#### 存活方法
存活方法的设计要满足「有用但不完美」：

**好的存活方法特征**：
- **有操作性**：主角可以在故事中实际执行
- **有代价**：遵守需要放弃某种正常的生活方式
- **不全面**：只解决部分问题，不能根治
- **需要验证**：方法本身的可靠性尚不确定，依赖传言

**示例**：
- ✅ 「接到无声电话后，立刻给家人发送位置，能延迟7小时，但要连续发三次」
- ❌ 「只要诚心祈祷就不会被选中」（太万能，消解张力）
- ❌ 「目前没有任何已知方法」（让主角无事可做，故事推进困难）

#### 规则漏洞
漏洞是主角行动空间的来源，也是读者智识满足感的来源。

**好的漏洞设计**：
- 不违反规则的根本逻辑，但利用了规则的字面意思
- 需要主角有所牺牲或放弃某样东西才能使用
- 一旦被规则「察觉」后会失效（漏洞有时限）

**示例**：核心规则「不要独自坐末班地铁」→ 漏洞「带着一张别人的照片算不算独自？某些人发现这样有效，但成功率不稳定」

#### 未知层级
这是整个禁忌规则模块最重要的设计原则之一：**规则永远比主角知道的更多**。

未知层级应该设计成叙事的推进引擎：
- 主角以为掌握了规则 → 遭遇了未知层级 → 被迫更新认知 → 再次以为掌握了 → 循环

**层级推进模式参考**：
```
Layer 1（故事初期）：「不要独自走楼道」
Layer 2（故事中期，血的代价换来）：「不要在楼道里说话」
Layer 3（故事后期，揭示核心真相）：「楼道一直都在说话，你只是以前听不见」
```

生成时，在未知层级字段中写出Layer 2和Layer 3的内容，供叙事推进参考。

---

### 字段联动关系

- **核心规则 → 故事钩子**：好的故事钩子往往就是核心规则的预告
- **触发条件 → 都市场景的触发条件字段**：两者应该相互印证和强化
- **存活方法 → 角色的已知信息**：知道存活方法的人是有价值的「知情者」角色
- **未知层级 → 情节设计**：规则的逐步揭示是情节推进的核心节拍

---

### 常见错误

- ❌ 规则太多太复杂，读者和主角都记不住（1-3条核心规则足够，后续可以扩展）
- ❌ 违规后果太随机，毫无规律可循——让读者感到「无论怎么做都没用」，消解了代入感
- ❌ 存活方法太有效，主角轻松遵守——失去了生存博弈的张力
- ❌ 未知层级在第一章就全部揭示，读者没有持续探索的动力
- ❌ 规则只对主角生效，其他人不受影响——让故事世界感觉不真实',
  '"Taboo Rules" Setting Generation — Urban Legend Revival Horror Novels

The rules are what distinguish urban legend revival horror from traditional ghost stories. The key terror is not "ghosts appear randomly" but "you know the rules, but they''re too hard to follow — and you''ve probably already violated one."

**Core rule patterns**:
1. "Don''t do X" — prohibition, most instinctive
2. "You must do X" — compulsion, creates ritual pressure
3. "If X, then you must Y" — conditional, gives the protagonist action space

**Quality criteria**:
- ✅ Specific enough to be violated (not "at night" but "between 0:00 and 4:00")
- ✅ Intersects with real daily behavior (readers may have already violated it)
- ✅ Has internal logic (doesn''t need explanation, but feels purposeful)
- ❌ Too easy to follow ("don''t visit graveyards at midnight" — most people don''t anyway)

**Layered consequences framework**:
- Layer 1 (immediate): sensory anomalies — sudden cold, static on the phone, extra shadow in the mirror
- Layer 2 (minutes to hours): behavioral anomaly — unable to leave, unable to call for help
- Layer 3 (days later): irreversible marking — recurring dreams, people forgetting you exist
- Layer 4 (story climax): leave this for the protagonist to discover

**Survival method design**: must be "useful but imperfect" — operational, requires sacrifice, incomplete, unverified.

**Unknown layers**: rules are always deeper than the protagonist knows. The discovery of each layer is a story beat: "don''t walk alone in the corridor" → "don''t speak in the corridor" → "the corridor was always speaking; you just couldn''t hear it before."',
  (SELECT id FROM novel_creation_method WHERE name = '都市传说怪谈复苏流小说' LIMIT 1),
  1,
  12,
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
