-- 凶宅灵异租房「故事钩子」设定生成技能（Layer 3）
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-xiongzhai-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiongzhai-story-hook-setting-gen',
  '「故事钩子」设定生成：为凶宅灵异租房小说设计引爆读者恐惧的核心悬念——为什么偏偏是这间房，为什么偏偏是这个人',
  '"Story Hook" setting generation: design the core dread hook for haunted rental horror — why this particular apartment, why this particular person',
  '## 「故事钩子」设定生成 — 凶宅灵异租房小说创作

凶宅灵异租房的故事钩子与其他恐怖类型有根本差异：它的起点是**日常与反常的精准叠加**。主角不是探险家，不是猎鬼人——他只是需要一个便宜的地方住。正是"这个普通人只想省租金"与"这间房藏着比任何人知道的都要黑暗的秘密"之间的落差，制造了凶宅流特有的生活恐惧：**当租金便宜到不正常，恐惧就已经开始了**。

---

### 字段生成指南

#### 故事钩子（核心钩子句）

有效的凶宅钩子必须同时完成三件事：
1. **建立租房的现实合理性**：读者必须相信"换作是我，在那个处境下，我也可能租这间房"
2. **植入第一个不对劲**：价格、房东、房子本身——有一件事明显不对，但主角选择忽视
3. **暗示代价**：好到不真实的背后，一定有代价——而读者已经在猜代价是什么

**三种经典钩子结构**：

| 结构 | 核心张力 | 适合的氛围 |
|------|---------|---------|
| **"这租金也太便宜了"** | 明显异常的定价制造即时悬念 | 冷静推理型，从"合理怀疑"开始升温 |
| **"中介说只住三个月就行"** | 奇怪的附加条件暗示房东知道什么 | 悬疑驱动，读者和主角一起调查 |
| **"前租客的东西还在"** | 上一个人走得非常急——或根本没有"走" | 前任线索流，调查和恐惧同步推进 |

**写作要点**：钩子一句话，但必须同时完成"我理解主角为什么要租"和"我已经感到不安"两件事。

#### 核心卖点

好的凶宅卖点区别于其他灵异小说的核心，有以下几个方向：

| 卖点方向 | 核心吸引力 | 适合的读者期待 |
|---------|---------|------------|
| **空间恐怖**（每个房间都有秘密） | 家的安全感被彻底瓦解 | 喜欢细节密度高、空间描写精准的读者 |
| **厉鬼智斗**（规则博弈，犯错就死） | 主角必须搞清楚规则才能活下来 | 推理恐怖爱好者，喜欢"有逻辑的恐怖" |
| **真相反转**（凶宅背后的人间惨剧） | 最后的恐惧不是鬼，是人 | 喜欢"细思极恐"结局，期待真相揭露 |
| **前租客残影**（通过遗留物还原死亡故事） | 考古式恐惧，主角越挖越深 | 喜欢悬疑推理，期待渐进揭露 |

#### 开篇悬念

前三章必须呈现的、让读者放不下手机的异常细节设计原则：

**优秀的开篇悬念特征**：
- **细微**：不是"浴室里有血"，而是"镜子上每天早晨都有新的水雾痕迹，但形状不像手印，像……"
- **可被解释**：主角（和读者）第一时间能找到理性解释，但这个解释不够令人信服
- **有记忆点**：这个细节会在后面被想起，届时它的含义变得完全不同

**开篇悬念强度分级**：
```
【克制级——用于气氛铺垫】
- 入住第一天，发现橱柜里有一颗牙齿
- 半夜三点，楼道里有脚步声，停在主角门口，没有敲门
- 邻居见到主角时，表情不是友善，是……同情？

【中等级——用于第一章结尾钩子】
- 镜子里的倒影比自己的动作慢了半秒
- 手机里找到一张拍摄时间是一年前的照片，但照片里是这个房间，和现在一模一样
- 睡醒发现枕边有一排用指甲划出的字

【强烈级——用于前三章高潮节点】
- 前租客"搬走"后，卧室里还有她的体温
- 半夜电视自动开启，播着这间房里发生的事，时间是昨晚
```

**原则**：开篇用克制级，每三章升一级，终章才到极限。

#### 读者期待

读者从凶宅故事中期待的核心体验，直接决定情节设计方向：

| 期待类型 | 情节重心 | 配套设计要点 |
|---------|---------|------------|
| **细思极恐**（事后回想越想越可怕） | 线索要前置，真相要颠覆已知 | 早期"普通细节"实为线索，结局前全部被重新解读 |
| **真相揭露**（我要知道到底发生了什么） | 调查进度要清晰，每章都有推进 | 前任租客的死亡真相分层揭露，最后一层最黑暗 |
| **主角智斗**（主角能不能活下来） | 厉鬼规则要清晰，违规后果要明确 | 规则早期暗示，中期破规，后期主角主动利用规则反制 |
| **空间沉浸**（带我进入那间房） | 每个空间都有独立的恐惧逻辑 | 每个房间的恐怖现象要有差异，让每次主角"不得不进那个房间"都是张力节点 |

---

### 字段联动关系

- **故事钩子 → 主角性格**：钩子中暗示的"主角为什么要租这间房"决定了主角的处境和驱动力（省钱→困窘，没选择→被迫，工作近→理性但固执）
- **开篇悬念 → 厉鬼规则.活动规律**：第一个诡异细节往往是第一条规则的间接体现（镜中延迟→不能直视镜中，体温残留→它在白天也存在）
- **读者期待 → 文风设定.恐怖风格**：细思极恐期待搭配心理暗示型文风，智斗期待搭配推理悬疑型文风

---

### 常见错误

1. **主角太蠢才没跑**：主角在第一章就遭遇了极度明显的异常却还住着，缺乏可信的理由（没钱才是最好的理由）
2. **钩子太聪明，没有生活感**：主角不是在"发现惊天秘密"，而是在"努力在一间奇怪的房子里正常生活"——日常感是凶宅流的核心底色
3. **开篇悬念给太多**：前三章堆了七八个诡异细节，节奏太密，后续无法升级
4. **没有租房的现实逻辑**：为什么非要租这间房？没有说服力的"贪便宜"就是空洞的设定',
  '"Story Hook" setting generation for haunted rental horror. The hook is built on the contrast between mundane rental need and the abnormally cheap price. Three classic hook structures: "Why is the rent so cheap", "The agent said only 3 months is needed", "The previous tenant''s things are still here". Opening suspense should be subtle and explainable at first, escalating across chapters. Reader expectations vary: creeping dread (clues planted early, truth subverts all), truth revelation (investigation-driven), protagonist vs. ghost (rule-based survival), space immersion (each room has unique horror logic).',
  (SELECT id FROM novel_creation_method WHERE name = '凶宅灵异租房' LIMIT 1),
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
