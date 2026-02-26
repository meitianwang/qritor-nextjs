-- The Villainous Lead「Worldbuilding」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1)
-- 执行方式 / Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-villain-lead-worldbuilding-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'villain-lead-worldbuilding-setting-gen',
  '「Worldbuilding」设定生成：为反派视角（Villainous Lead）小说生成世界观设定，核心是设计英雄生产系统及其可利用的结构性弱点',
  '"Worldbuilding" setting generation: generate world settings for Villainous Lead novels, centered on designing the hero production system and its exploitable structural weaknesses',
  '## 「Worldbuilding」设定生成 — 反派视角（Villainous Lead）

反派视角的世界观设计核心：**这个世界有一套「英雄生产系统」——天命、预言、神授能力——而反派对这套系统了解得比任何人都清楚，包括英雄自己**。

---

### 字段生成指南

#### World Type（世界类型）

World Type 决定英雄系统的具体形态：
- **奇幻王国**：神谕、勇者召唤、神圣血脉，英雄由神庙或王权认证
- **修真世界**：天命体质、大道认可、气运加身，英雄由天道选中并庇护
- **超级英雄宇宙**：命定英雄、异变赋能、宇宙使命，英雄系统可能有幕后机构
- **现代世界**：秘密骑士团、古老血脉传承、秘密组织，英雄往往不知道自己被选中

---

#### Hero System（英雄系统）——最核心字段，详细设计

英雄系统是世界观的核心战略地图，需从以下四个维度详细展开：

**一、英雄如何被「选中」**
神谕/异变/血脉/考验——每种选中机制都有管理者，管理者都有利益。谁解释预言？谁主持考验？谁认定"天命之人"？这些问题的答案就是反派可以渗透或操控的节点。

**二、英雄获得什么额外加成**
神的庇护/突破上限的天赋/关键时刻的好运——必须明确加成的具体范围和条件：是否保证不被秒杀？是否提升战斗力？是否需要保持信仰或美德？每个加成背后都有条件，条件背后都有漏洞。

**三、英雄系统的「成本」**
谁为英雄的胜利买单？什么东西被牺牲了但没有被历史记录？英雄扫荡魔王军时路过的三个村庄，英雄获得神力时神殿用来祭祀的人，英雄"净化"的土地里曾经生活的人——这些是道德账目的空白页，也是批判英雄系统的最有力证据。

**四、英雄系统的信息垄断**
谁控制「谁是英雄、谁是反派」的叙事？神庙？王权？预言传承者？反派能否渗透这个叙事控制机构？

---

#### Hero System Weaknesses（英雄系统弱点）——反派最重要的战略资产

- **预言盲区**：预言说英雄会胜利，但没说什么时候、用什么代价。反派在盲区里操作——在预言保证的胜利之外制造无法被覆盖的损失
- **神的利益冲突**：赋予英雄神力的神有自己的政治议程。研究神的议程，找到神与英雄目标不一致的时刻——那就是神不会出手相救的窗口
- **英雄数量瓶颈**：一个世界通常只能同时运转1-3个"真正"的英雄。多线程行动可以让英雄系统超载
- **正义叙事的脆弱性**：英雄的力量来源之一是"万众拥戴"。公众信任是可侵蚀的资产
- **英雄的人类弱点**：神的庇护覆盖不了情感被利用、信任被背叛

---

#### World''s Morality Framework（道德框架）

这个世界的道德框架通常对英雄有利——因为这个定义是由英雄系统的受益者制定的。反派需要对这个框架有具体的批判，不是虚无主义，而是政治分析：**这个道德定义服务了什么权力利益，压制了什么声音，使什么现实变得不可见？**

---

### 生成原则

- Hero System 是最重要的字段，必须具体到「谁管理」「条件是什么」「成本谁承担」
- Hero System Weaknesses 不是空泛的"英雄也会犯错"，而是结构性的可利用漏洞
- 反派对道德框架的批判必须来自具体的权力分析，不是"好坏都是谎言"的虚无论
- 整体世界观应让读者感受到：这个英雄系统确实存在，确实运转，但确实有裂缝',
  '## "Worldbuilding" Setting Generation — The Villainous Lead

The Villainous Lead worldbuilding centers on a single architectural question: how does this world produce heroes, and what are the exploitable flaws in that production system? The villain protagonist''s strategic intelligence requires a detailed understanding of the hero system that exceeds what the heroes themselves possess.

---

### The Hero System as a game board

The hero system is not just background worldbuilding — it is the primary arena in which the villain operates. Design it with the specificity of a system the villain has spent significant time analyzing.

**Production mechanism:** How are heroes identified? If prophecy — who controls interpretation? If divine selection — what are the selection criteria? If talent discovery — who administers testing? Every mechanism has administrators, and administrators have interests. The villain has already mapped these interests before the story begins.

**Enhancement infrastructure:** What specific advantages does the hero system confer? The villain needs to know not just "divine protection" but the precise scope and limits: Does it prevent the hero from being killed outright? Does it enhance combat ability? Does it require active maintenance — prayer, faith, sustained virtue? Every enhancement has conditions, and conditions have loopholes. Design the loopholes as carefully as the protections.

**Cost distribution:** Every hero victory has a cost. Where does that cost go? Who bears it but isn''t counted? The moral accounting of the world almost certainly has gaps — and those gaps are where the villain''s critique is most accurately aimed. "The hero saved the kingdom. No one counted the villages his passage destroyed, the people sacrificed in the ritual that granted his power, the communities ''cleansed'' from territories he purified." This is not cynicism — it is the villain''s forensic accounting.

**Narrative control:** Who decides who is the hero and who is the villain? A newspaper, a temple, a guild, a crown? The villain may not need to defeat the hero directly — they may be able to corrupt the labeling mechanism, so that the hero becomes the villain in the court of public opinion, while the villain occupies the hero''s structural position.

---

### Hero System Weaknesses — design for maximum exploitability

**Prophecy blind spots:** Prophecy says the hero wins. It does not say when, at what cost, who else loses, or what state the world is in when they "win." The villain operates in everything the prophecy doesn''t specify. Design the prophecy''s limitations as carefully as its guarantees — the gap between "the Chosen One will defeat the Dark Lord" and "everyone the villain wanted to eliminate is already dead" is the villain''s entire operational space.

**Divine interest conflicts:** The gods who empower heroes have their own agendas. Those agendas occasionally conflict with each other, and occasionally conflict with what the current hero actually wants. A villain who understands divine politics can create situations where the hero''s divine backing is strategically withdrawn or redirected. The god''s interest is not in the hero''s survival — it is in the god''s agenda being advanced. These occasionally diverge.

**The heroic bottleneck:** The system produces limited heroes. They can be in limited places. They operate on limited timeframes — they must sleep, recover, process grief, make decisions under uncertainty. A villain who simultaneously maintains multiple theaters of operations is always outpacing a system that concentrates power in one or two individuals. The villain does not need to defeat the hero — they need to keep the hero too busy at point B to respond to what is happening at points C, D, and E.

**Faith as a power source:** In worlds where heroic power flows through public belief or divine favor mediated by mortal worship — the villain''s most powerful weapon may be a sustained information campaign that does not defeat the hero but makes the public uncertain whether the hero deserves to win. An uncertain public prays less. A god with fewer prayers delivers less support.

**Genuine human vulnerability:** The divine protection does not extend to emotional exploitation, trusted relationships that can be turned, or the simple cognitive limits of a being operating under information the villain controls.

---

### World''s Morality Framework

The most useful framing for this module: the world''s moral framework is a political document, not a cosmic truth. Who wrote it? Who benefits from its acceptance as natural law? What questions does it not allow to be asked? The villain''s philosophy should answer these questions specifically, not gesture at moral relativism.

Strong example: "This kingdom''s moral framework designates as ''evil'' anything that challenges the concentration of divine power in the church-monarchy alliance. I challenge that concentration. Therefore I am evil. The circularity is perfect — and intentional."

The villain''s critique should be detailed enough that the reader can see the specific power interests the moral framework protects — and can understand why those interests need the framework to appear as cosmic law rather than political convenience.

---

### Generation Principles

- Hero System is the most important field: design it with the depth of a system the villain has spent years analyzing
- Hero System Weaknesses must be structural and operational, not character flaws ("the hero is overconfident")
- The moral framework critique must be a specific political analysis, not generic nihilism
- The overall worldbuilding should make the reader feel: this hero system is real, it functions, it genuinely empowers heroes — and it has specific, exploitable architectural gaps that a sufficiently intelligent villain can operate within',
  (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1),
  1,
  54,
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
