-- 赛博朋克小说创作 - 「故事钩子」设定生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-cyberpunk-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cyberpunk-story-hook-setting-gen',
  '「故事钩子」设定生成：为赛博朋克小说设计一个高科技低生活的切入点，让主角处境和核心矛盾在第一章就成立',
  '"Story Hook" setting generation: design a high-tech-low-life entry point for cyberpunk fiction, establishing the protagonist''s situation and core conflict from chapter one',
  '## 「故事钩子」设定生成 — 赛博朋克小说

赛博朋克的故事钩子有一个根本标准：**读者在开场就能同时感受到「高科技」的震撼和「低生活」的压迫**。两者缺一不可——只有高科技，是科幻小说；只有低生活，是普通犯罪故事。二者并置，才是赛博朋克。

---

### 一、核心矛盾类型

选择核心矛盾时，应当评估它与「高科技低生活」主题的结合程度：

| 矛盾类型 | 代表场景 | 高科技体现 | 低生活体现 |
|---------|---------|----------|----------|
| 对抗企业 | 被企业追杀的前雇员、企图揭露阴谋的人 | 企业的私人武装/监控体系 | 无处可逃，没有法律保护 |
| 追寻真相 | 失忆调查、记忆被篡改 | 记忆芯片/神经植入技术 | 连自己的记忆也不可信 |
| 义体危机 | 义体被远程关闭、赛博精神病发作 | 义体改造技术 | 身体成了别人可控的商品 |
| 网络战争 | 企业间的数据战争、网络空间入侵 | 赛博空间/黑客技术 | 信息即权力，无权者什么都没有 |
| 失忆调查 | 醒来发现自己的记忆不完整 | 记忆修改/备份技术 | 身份本身成了不确定的东西 |
| 人工智能觉醒 | 与觉醒AI的相遇，或成为AI的庇护者 | AI技术的极限与禁区 | AI和穷人都是系统的弃民 |
| 地下革命 | 加入或遭遇反企业武装 | 企业军事化的统治 | 革命者与帮派的界限模糊 |
| 生存求存 | 纯粹的为了活下去 | 生活基础设施都依赖企业 | 生存本身就是一种反抗 |

---

### 二、开场切入点设计

赛博朋克的开场不需要世界观解释——**读者应该在主角的具体处境中感受世界，而不是被告知世界是什么样的**。

**有效的切入点格式**：
- 从一个正在进行的任务开始（「最后一单」「委托已经出了问题」）
- 从一个即将改变主角处境的时刻开始（「今晚之前，我还以为自己能全身而退」）
- 从一个小细节的异常感开始（「镜子里的眼睛不是我的颜色，这已经是第三双了」）

**无效的切入点**（避免）：
- ❌ 从主角叙述世界历史背景开始（「二十年前，巨型企业法案通过之后...」）
- ❌ 从主角在安全地点思考人生开始（「我坐在公寓里想着生活的意义」）
- ❌ 从全知视角俯瞰城市开始（「这座城市分为上下两层...」）

---

### 三、「高科技低生活」的对照写法

好的故事钩子在同一场景内制造技术与贫困的对比：

**对照结构**：

```
高科技元素（让人感到震撼或不安）
    ↕（同一场景/同一句话中）
低生活元素（让人感到压迫或悲哀）
```

**示例**：
- 「她的眼睛值五万元，但她三天没有吃饭了」（义体 × 贫困）
- 「他用军用级神经接口登录了垃圾堆里的破旧数据终端」（技术 × 处境）
- 「企业保安的义体手臂可以掰弯钢梁——他们用来驱逐住在地铁通道的无家可归者」（武力 × 阶级暴力）

---

### 四、主角身份与开场处境匹配

不同档案类型的主角，适合不同的开场处境：

| 档案类型 | 最有张力的开场处境 | 建立代入感的方式 |
|---------|----------------|--------------|
| 独行侠（Solo） | 任务出了问题，雇主已经消失 | 暴力能解决一切，但解决不了根本问题 |
| 网络黑客 | 入侵时发现了不该看到的东西 | 在数字世界无所不能，在现实中极度脆弱 |
| 掮客（Fixer） | 交易中途，两边的委托人都出现了问题 | 关系网是武器，关系网也是负担 |
| 企业特工 | 企业要求做出道德上无法接受的事 | 体制内的人才知道体制有多腐败 |
| 街头少年 | 被更大的事件卷入，无从脱身 | 无知即无辜，但无辜者死得最快 |

---

### 五、常见错误

- ❌ 核心矛盾太抽象（「对抗压迫」而不是「企业要关闭我的义体手臂因为我拖欠三个月维护费」）
- ❌ 「高科技」和「低生活」分别出现，而不是在同一场景中对照
- ❌ 主角处境太稳定——赛博朋克的主角在开场就应该已经处于压力之下
- ❌ 道德过于清晰——赛博朋克世界没有绝对的好人，主角应该在故事开始时就已经做过妥协',
  '"Story Hook" Setting Generation — Cyberpunk Fiction

The fundamental test for a cyberpunk hook: readers must simultaneously feel the awe of "high tech" and the oppression of "low life" from the opening. Neither alone is sufficient — one without the other misses the genre.

**Eight core conflict types**: anti-corporate (whistleblower, corporate fugitive); truth-seeking (memory tampering, conspiracy investigation); cyberware crisis (remote shutdown, cyberpsychosis); netwar (corporate cyberspace conflict, data heist); amnesia investigation (fragmented identity, memory editing); AI awakening (harboring illegal AI, AI rights); underground revolution (resistance vs. gang ambiguity); survival (existence itself as resistance).

**High-tech/low-life juxtaposition technique**: the contrast must appear within the same scene or sentence:
- "Her eyes cost fifty thousand, but she hadn''t eaten in three days" (cyberware × poverty)
- "He jacked a military-grade neural interface into a salvaged terminal from the garbage heap" (tech × desperation)

**Effective opening formats**: begin during an ongoing task that has already gone wrong; begin at a moment that is about to change everything; begin with a small anomaly that reveals the world.

**Avoid**: opening with world history exposition; protagonist reflecting in safety; omniscient city overview.

**Protagonist-to-opening matching**: Solo (job already compromised, employer gone); Netrunner (saw something they shouldn''t have during a run); Fixer (both clients of a deal have become problems); Corp (ordered to do something morally intolerable); Street Kid (pulled into something bigger with no exit).',
  (SELECT id FROM novel_creation_method WHERE name = '赛博朋克小说创作' LIMIT 1),
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
