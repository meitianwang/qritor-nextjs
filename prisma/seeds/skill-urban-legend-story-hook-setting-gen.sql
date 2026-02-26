-- 都市传说怪谈复苏流小说 - 「故事钩子」设定生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-urban-legend-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'urban-legend-story-hook-setting-gen',
  '「故事钩子」设定生成：为都市传说怪谈复苏流小说生成抓住读者的核心恐惧钩子',
  '"Story Hook" setting generation: generate the core fear hook for urban legend revival horror novels',
  '## 「故事钩子」设定生成 — 都市传说怪谈复苏流小说

故事钩子是这类小说与读者签订的第一份恐惧合同。都市怪谈复苏类的钩子有其独特逻辑：它必须让读者在看完第一段后，立刻检查自己手边的手机屏幕，或者想起今晚要坐的那班地铁。**代入感是这个题材的核心武器**，而代入感来自「日常之物的背叛」。

---

### 字段生成指南

#### 故事钩子
这一句话要完成三件事：点名日常元素、引入异常、暗示威胁。

**优秀钩子的结构公式**：[具体日常场景] + [被破坏的常规] + [隐含的恐惧]

参考方向：
- 「某款打车软件的客服在凌晨给你回电，说司机已经到了——但你根本没叫车」
- 「小区11楼的灯从来不亮，不是因为没人住，而是因为上去的人都不会再按电梯下来」
- 「群里有人@了一个你不认识的账号，但那个账号十年前就已经注销了」

**避免的写法**：
- ❌ 太宏大：「一股神秘力量席卷全城」→ 读者没有代入点
- ❌ 太抽象：「黑暗降临」→ 缺乏具体形象
- ❌ 太游戏化：「系统提示：你已进入死亡副本」→ 破坏现实感

#### 恐怖核心
识别这个故事真正让人不安的是什么——它比怪物本身更重要。

都市怪谈的恐怖核心通常属于以下几类：
- **被侵入感**：私人空间（家、手机、记忆）被未知力量渗透
- **失控感**：日常规则突然失效，自己的行为不再可预测
- **见证成本**：「知道」本身就是危险，越了解越深陷
- **孤立无援**：怪谈只影响「已知情者」，求助等于传染
- **真相更可怕**：揭开之后，比起不知道更难受

生成时，识别这个具体故事钩子背后是哪种恐惧核心，并确保后续设定强化它。

#### 代入钩子
让普通读者感到「这就是我的日常」的具体元素。

**高代入感的都市元素**（按类别）：
| 类别 | 高代入元素 |
|------|----------|
| 交通 | 末班车、深夜地铁、滴滴/出租车、停车场 |
| 居住 | 电梯、楼道灯、隔壁邻居、深夜外卖 |
| 数字 | 微信消息、陌生来电、App推送、抖音视频 |
| 工作 | 深夜加班、空办公室、打印机、打卡机 |
| 公共空间 | 便利店、24小时洗手间、医院走廊、停车场 |

选择最能引发「我也经历过类似情景」的元素，越具体越好（不是「某条地铁」而是「最后一班、只剩你一个人的那列车」）。

#### 读者期待
这是与读者的隐性合约——你承诺给他们什么样的体验？

常见的都市怪谈读者期待：
- **「我要知道规则」**：解谜型满足感，每章都揭示一条新规则
- **「我要活下去」**：代入生存博弈，跟主角一起找出路
- **「我要知道真相」**：真相比怪物更可怕的震撼
- **「我要被吓到、但安全着」**：纯粹的恐惧体验消费

生成时要选定一个主要期待，避免同时承诺所有类型导致焦点模糊。

---

### 字段联动关系

- **故事钩子 → 怪谈起源**：钩子中提到的「日常元素」（App、地铁、楼道）应该成为后续怪谈起源模块中传播媒介的核心
- **恐怖核心 → 禁忌规则**：恐怖核心决定了规则设计的方向（被侵入感 → 规则应强调主动触发的代价；失控感 → 规则应有随机元素）
- **代入钩子 → 都市场景**：代入钩子中的日常元素应该在场景模块中得到充分的细节展开
- **读者期待 → 文风设定**：「解谜型」期待对应信息密度「知道得越多越恐惧」；「未知型」期待对应「不知道才恐怖」

---

### 常见错误

- ❌ 把「故事梗概」当成「故事钩子」——钩子是悬念，不是剧情介绍
- ❌ 「代入钩子」使用过于特殊的职业或情境（考古学家、特种兵），失去日常代入感
- ❌ 「恐怖核心」太模糊（「令人不安的黑暗力量」），没有识别出具体的恐惧类型
- ❌ 「读者期待」写成结局预告，破坏悬念',
  '"Story Hook" Setting Generation — Urban Legend Revival Horror Novels

The story hook is the first fear contract made with the reader. The key is everyday betrayal: make readers instinctively check their phones or recall their next subway ride after reading one sentence.

**Hook formula**: [Specific daily scene] + [Broken routine] + [Implied threat]

Good examples:
- "A ride-hailing app''s customer service calls you at 3am to say your driver has arrived — but you never ordered a ride"
- "The lights on the 11th floor have never worked, not because no one lives there, but because no one who goes up ever comes back down"

**Core Fear types**: invasion (private space violated), loss of control (daily rules suddenly broken), witness cost (knowing IS the danger), isolation (seeking help means spreading it), truth-is-worse (revelation is more horrifying than ignorance).

**High-immersion urban elements**: last subway, midnight delivery, elevator, WeChat messages, unknown calls, empty office buildings, 24-hour convenience stores.

**Reader expectation contract**: pick ONE primary promise — rule-learning satisfaction, survival gameplay, truth-seeking revelation, or pure fear consumption. Mixing all four creates an unfocused story.

**Field linkages**:
- Hook → Origin: the daily element in the hook should become the transmission vector in the Origin module
- Core Fear → Taboo Rules: invasion fear requires rules about active triggering; loss of control requires random elements
- Hook elements → Urban Scenes: flesh out the hook''s daily elements in the Scene module
- Reader expectation → Writing Style: "know more = more fear" corresponds to the "more you know, the worse it gets" information density setting',
  (SELECT id FROM novel_creation_method WHERE name = '都市传说怪谈复苏流小说' LIMIT 1),
  1,
  10,
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
