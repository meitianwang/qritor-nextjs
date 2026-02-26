-- 末班车规则流「小说命名」技能（Layer 3）
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ghost-bus-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ghost-bus-novel-naming',
  '末班车规则流小说命名：书名的美学与简介的写法——末班车类型的书名应该像一块已经锈迹斑斑的路标，看起来普通，却让你感到不应该继续往那个方向走',
  'Ghost bus novel naming: title aesthetics and blurb writing — ghost bus titles should feel like a rusted road sign, appearing ordinary yet making you feel you shouldn\'t continue in that direction',
  '## 小说命名 — 末班车规则流小说创作

末班车规则流的书名是读者与故事的第一次接触。好的书名应该做到：**看起来足够普通，让人感到是都市日常；但某个细节让人感到「这不对」**。这种矛盾的感觉在读者点开故事之前就已经开始建立氛围。

---

### 命名哲学

末班车类型书名的美学与某些其他恐怖类型不同：
- **不要明显的恐怖感**：「血染末班车」「鬼魅深夜班」——过度直白，恐惧感反而最弱
- **要「几乎正常」的不安感**：「57路，末班」「夜班车到站了」「下一站还有多远」——普通到让人觉得可以是真实存在的公交信息，但某个细节不对劲

**核心原则**：末班车书名的恐惧来自于「它本该是普通的，但不是」——与整个类型的核心恐惧一致。

---

### 书名格式模板

#### 格式一：路线+时间（最贴近现实感）
- 结构：「[路线号] + [时间或状态]」
- 示例参考：「晚班 57 路」「X路，末班」「00:37，收班前的最后一班」
- 适用：强调「这辆车的具体存在」，都市传说感最强
- 要点：路线号可以是不存在的（X57）、刚好差一个数字的（本来是57路，这是570路），或者是现实存在的路线（代入感最强）

#### 格式二：规则碎片（直接引用规则的一条）
- 结构：「[一条规则的文字]」
- 示例参考：「不要看后视镜」「到站前请勿下车」「靠右就座，谢谢」
- 适用：强调规则流的类型特征，让读者立刻知道这是什么类型的故事
- 要点：规则本身应该在日常语境下听起来完全正常（公交广播常见语），但在规则流背景下变得令人不安

#### 格式三：时刻+状态（时间节点的冻结感）
- 结构：「[具体时刻] + [某个状态]」
- 示例参考：「十一点五十七分」「下一站，是终点」「等下班车的人」
- 适用：强调故事的时间性和压迫感，「时刻」的具体性制造了日志体的真实感
- 要点：时刻越具体越有效（「23:57」比「深夜」更令人不安）

#### 格式四：普通句子但语义偏移
- 结构：一句乍一看是日常交通告知的句子，但仔细想有另一层含义
- 示例参考：「这班车不去你要去的地方」「前方到站，请做好准备」「感谢您的乘坐，欢迎下次再来」
- 适用：玩文字游戏，有黑色幽默底色的故事
- 要点：两层含义的差距越大，效果越好

#### 格式五：角色的视角碎片
- 结构：主角在某个关键时刻的内心独白或观察
- 示例参考：「这辆车上只有我一个活人」「我数了，一共九条规则」「窗外的路灯已经很久没有变过了」
- 适用：强调主角视角的亲历感，制造悬疑

---

### 书名禁忌

- ❌ 「鬼车」「幽灵公交」「死亡末班车」：过度明确，恐怖感被命名本身消解
- ❌ 「XXX的恐怖之旅」：标题格式过时，且「恐怖」这个词本身比不描述恐怖弱得多
- ❌ 纯数字（「57」）：太简洁，缺乏氛围
- ❌ 过于文艺的意象（「黑暗的彼岸」「冥冥之中」）：与末班车类型的都市现代感不符

---

### 简介写法

末班车类型的简介遵循「规则流简介三段式」：

**第一段：建立日常（1-2句）**
描述主角的「普通的一夜」——加班、等车、深夜，读者能够代入。

> 「那天晚上加班到十一点半，他以为最难熬的事已经过去了。」

**第二段：钩子（1-2句）**
第一个「不对劲」，但不揭示太多。

> 「直到他发现，这辆 57 路，不在发车时刻表上。」

**第三段：规则揭示（1-3句）**
揭示核心设定，但不说清楚规则内容。

> 「车上有规则。他在第一站就发现了这一点——那一刻，他意识到无论这趟车要去哪里，他都没办法在到达之前下车。」

**禁忌**：
- 不要在简介里揭示任何具体的规则内容
- 不要在简介里揭示结局
- 不要用「恐怖小说」「规则流」等类型标签来代替真正的吸引力描述

---

### 书名与简介的整体一致性

书名和简介应该传达同一种氛围：
- 克制、日常感强的书名 → 简介也应该用「日常语言」描述异常
- 规则碎片书名 → 简介可以在描述场景后再次引用或回应这条规则
- 时刻型书名 → 简介的第一段可以从「那个具体的时刻」开始',
  'Ghost bus novel naming: title aesthetics and blurb writing — ghost bus titles should feel like a rusted road sign, appearing ordinary yet making you feel you shouldn\'t continue in that direction',
  (SELECT id FROM novel_creation_method WHERE name = '末班车规则流小说创作' LIMIT 1),
  1,
  35,
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
