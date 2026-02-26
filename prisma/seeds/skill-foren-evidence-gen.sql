-- Paranormal Forensics Novel「Evidence & Artifact」generation skill (Layer 3 domain knowledge)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-foren-evidence-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'foren-evidence-gen',
  '「Evidence & Artifact」生成：为超自然法证小说设计证据物品——每件重要物品必须同时携带法证意义与超自然意义，且二者最好形成张力（法证解读与超自然解读相互矛盾），监管链问题与危险等级则是叙事压力的持续来源',
  '"Evidence & Artifact" generation: design physical items where forensic meaning and paranormal meaning coexist — ideally in tension, where the forensic reading contradicts the paranormal reading — with chain of custody issues and danger levels as sustained narrative pressure',
  '## 「Evidence & Artifact」生成 — 超自然法证小说

超自然法证类型中的证据物品承担着双重叙事功能：它们既是常规犯罪调查中的物证，也是理解超自然运作规则的关键线索。最有力的证据物品在两个层面上同时起作用，且这两个层面相互矛盾——法证实验室说这件物品告诉我们X，而超自然研究说同一件物品告诉我们完全相反的Y。调查者必须在两套解释框架之间做出选择，或者找到一种两者都能容纳的解释，而那种解释的存在通常意味着这个世界比任何人愿意承认的更加复杂。

---

### 字段生成指南

#### Item Name（物品名称）

名称应该准确反映物品的性质，而不过于戏剧化。「发现于第四分局证据室的#3709号证物」比「诅咒的铁盒」更有法证类型的质感——即使该铁盒确实有某种诅咒。证据在实验室里有编号，有条形码，存放在密封袋里；名称应该反映这个机构现实。

#### Item Type（物品类型）

七种类型，每种在超自然调查中的功能不同。见下方详细讨论。

#### Forensic Significance（法证意义）

物品经过专业分析后，常规法证学揭示了什么？这个字段需要专业密度，而不是简单陈述。不是「这是凶器」，而是「刀刃上的切割痕迹与单刃刀具一致；血迹DNA与被害人吻合；但刀刃上的指纹分析显示所有指纹均指向同一人——而该人在案发当晚有多个独立证人确认其位于距现场180公里外」。法证意义的终点应该是一个边界：分析揭示了什么，分析在哪里停止了，以及分析无法解释的部分是什么。

#### Paranormal Significance（超自然意义）

物品的超自然历史、功能或力量是什么？这个字段应该回答：这件物品在超自然层面上是什么，以及为什么这件特定的物品出现在这个特定的案件中不是偶然的。超自然意义可以有多种来源：物品的历史（它经历了什么）、物品的材质（某些材料在超自然实践中有特定用途）、物品与特定实体或事件的关联。

#### Current Location（当前位置）

六个选项，每个选项对叙事产生不同的压力。见下方讨论。

#### Chain of Custody Issues（监管链问题）

这个字段是将证据物品从静态物件变为叙事动力的关键。监管链中断不仅是程序问题，它本身就是证据——有人（或某物）干预了。见下方详细讨论。

#### Danger Level（危险等级）

五个层级，危险的来源和性质各不相同——物理危险、心理危险、机构危险，以及未知风险的特殊不安。见下方详细讨论。

---

### 七种物品类型及其功能

#### Physical Evidence (forensic)（物理证据·法证类）

标准法证证据：凶器、现场遗留物、痕迹物质（血液、纤维、土壤）、现场重建相关物品。在超自然案件中，物理证据的特殊功能在于它是「两个世界之间的桥梁」——它同时存在于常规调查框架和超自然解释框架中，而两个框架对它的解读往往相互矛盾。

设计物理法证证据时，关键是找到「矛盾的汇聚点」：物品的物理状态（可以测量、分析、技术上确认）和物品应该怎样才能造成这种状态（物理上不可能）之间的鸿沟。

#### Paranormal Artifact (supernatural object)（超自然器物）

已知或怀疑具有超自然性质的物品——仪式用品、历史上与超自然事件相关的物件、通灵工具、或被认为具有主动力量的物品。这类物品在法证调查中的挑战在于：实验室分析只能告诉你它是什么材质、什么年代、有什么化学成分——但无法告诉你为什么接触过这件物品的所有人都经历了相似的神经系统异常。

设计超自然器物时，必须为它建立「法证外壳」：常规检测会发现什么，以及这些发现如何未能解释物品的真实性质。

#### Personal Effect (victim/suspect)（个人遗物·受害者/嫌疑人）

属于案件相关人的个人物品。在超自然案件中，个人遗物往往携带着超出个人历史的意义——它们可以是超自然事件的触发器（物品引起了某种关注），也可以是超自然影响的记录（物品的状态反映了所有者所经历的事情）。

个人遗物的独特叙事功能：它们是使案件保持人性的物品。一张照片、一封信、一个习惯性携带的小物件——这些物品将调查锚定在真实的人身上，即使调查的内容越来越不像普通人类经验。

#### Document or Record（文件或记录）

纸质或电子文件：案件档案、医疗记录、历史文献、信件、日记、报告。在超自然案件中，文件的关键叙事功能在于它们可以携带「被否定的知识」——某人知道这件事，写下来了，然后这个知识被系统地压制、修改或销毁。

设计文件类证据时，关注的不仅是文件的内容，还有文件的状态：谁写的，谁能读到，谁试图销毁它，以及它是如何幸存下来的（如果它幸存了）。

#### Digital Evidence（数字证据）

电子设备、录像、通信记录、数据文件。数字证据在超自然案件中具有特殊的矛盾性：数字记录被认为是客观的、可验证的、难以篡改的——这使得数字异常特别令人不安，因为它破坏了现代人对「客观记录」的信任。

设计数字证据时，关注时间戳的完整性、数据状态的不可解释变化、以及设备在「应该无法记录」的情况下记录到了什么。

#### Biological Sample（生物样本）

血液、组织、毛发、DNA提取物。生物样本在超自然法证中具有极高叙事价值，因为它们携带着关于「谁或什么」的最直接信息。当生物样本的分析结果在技术上完全可靠，但在生物学上完全不可能时，它制造了最纯粹的「法证确认的不可能性」。

#### Unknown Object（未知物体）

无法被分类到已知类别的物品——材质无法识别，功能无法确定，历史无法追溯。「未知」不是设计的终点，而是起点：这件物品的不可知性本身应该是设计的核心，围绕它建立一套调查者试图了解但无法完全了解的系统。

---

### 双重意义原则：最关键的设计规则

每件重要的证据物品应该同时有法证意义和超自然意义，且两者最好相互矛盾：

**法证解读**告诉调查者X。
**超自然解读**告诉调查者，同一件物品意味着完全相反的Y。
**两种解读都有具体证据支撑**，且都无法被轻易否定。

这个矛盾产生了调查者必须面对的真正认识论危机：不是「这很奇怪」，而是「如果这是真的，那么我理解这个案件的整个框架就是错的，我必须从头开始」。

**矛盾设计的具体例子**：

一件武器的刀口角度、力度和伤口特征，从法证角度完全一致地指向一个右手持刀、站立、身高约180厘米的施害者。但超自然调查揭示，这件武器与一个在30年前死亡的实体相关，该实体的已知受害者在物理上无法是这种伤口的施害来源——以任何物理现实的方式。调查者面对的不是「谁用了这把刀」，而是「如果没有人用它，刀口上的角度和力度是怎么来的」。

---

### 设计法证意义

法证意义描述必须达到专业可信度。关键组成部分：

**物品的物理状态分析**：
- 实验室可测量的属性（成分、年代、磨损模式、制造工艺）
- 与案件相关的特征（指纹、DNA、痕迹物质的位置和分布）
- 与其他证据的关联（此物品如何与现场的其他发现相互印证）

**分析结论及其边界**：

法证分析的结论永远应该有一个边界——分析能够确定什么，分析在哪里停止。在超自然案件中，这个边界通常是一个悖论：「分析确认了这个，而这个在物理上意味着X，但X不可能是真的，因为Y」。不要省略这个边界，它是向超自然意义过渡的桥梁。

**法证意义的具体示例**：

弱：「血液DNA与被害人吻合」
强：「血液DNA与被害人完全吻合，线粒体单倍群、STR分型、Y染色体标记均一致；但血液中的蛋白质降解程度指示样本已保存超过15年，不符合案件时间线；储存状态与自然降解不符，与零下70度低温保存后解冻的样本一致；然而在案件相关的所有已知地点，均未发现任何符合此储存条件的设备」

---

### 设计超自然意义

超自然意义描述的标准是：物品的超自然历史和性质应该与案件的核心谜题有直接关联，而不是通用的「超自然道具」。

**超自然来源的三种主要类型**：

**历史性超自然**（物品承载着过去事件的残留）：这件物品经历过某件事，而那件事在某种意义上仍然在物品上继续。设计这类物品时，关键是建立历史事件与当前案件的具体平行——不是随机的恐怖传说，而是具体的、与当前调查有结构性联系的历史。

**功能性超自然**（物品具有主动的超自然功能）：仪式物品、通灵工具、约束器物。这类物品在设计时，关键是建立功能的具体规则——它做什么，对谁有效，需要什么条件。超自然功能应该与当前案件的超自然类型（实体、诅咒、灵魂等）兼容，而不是随机叠加。

**被动性超自然**（物品是超自然影响的容器或记录）：物品记录了超自然事件，或者成为了超自然影响的渗透点。这类物品的超自然意义在于它们携带的「信息」——不是危险，而是证据，但证据本身是超自然的。

---

### 监管链问题作为情节设计

「Chain of Custody Issues」字段是将证据物品从静态物件变为叙事动力的关键。监管链问题的叙事功能不只是程序性复杂——它是犯罪的证据。

**监管链中断的类型及叙事含义**：

**证据被篡改**（权衡是谁有动机）：有人在法定程序之外接触了这件证据。这立即引发两个问题：谁，以及为什么——而「为什么」的答案几乎总是指向机构掩盖的核心。

**证据消失后重新出现**：证据从证据室消失，然后在另一个位置被重新发现——或者它消失了，然后出现在它被拿走之前就不存在的位置。这类监管链问题是超自然介入证据的最直接形式。

**证据状态不一致**（验收时的状态与当前状态不符）：物品在入库时的记录状态与当前状态不一致，但没有任何授权操作记录解释这种变化。这类问题可以是人为的（有人修改了记录），也可以是超自然的（物品本身改变了）。

**监管链空白**（特定时段的保管无记录）：程序上应该有记录的时段没有记录。这类问题可以是系统性疏失，也可以是刻意的遮掩，也可以是完全无法解释的——即使所有人都按照程序行事，记录仍然消失了。

**设计监管链问题的关键**：问题的性质应该与物品的超自然意义相呼应。一件与「被遗忘」或「被消除」相关的超自然器物，其监管链问题最好也涉及某种系统性的「无法被记住」——调查者发现这件物品以某种方式不断从记录系统中脱落，而这个行为模式本身就是超自然性质的线索。

---

### 危险等级设计

危险不是单一维度的。超自然法证类型中，危险的来源和性质可以是物理的、心理的或机构的，而这些不同类型的危险产生不同的叙事压力。

**Safe to handle（可安全处理）**：这件物品在证据处理流程中没有已知风险。但「没有已知风险」不等于「没有风险」——这个等级的物品可能是最危险的，因为它让接触者放松了警惕。在超自然案件中，某件物品被评为「可安全处理」通常意味着没有人足够理解它来认识到危险。

**Psychologically hazardous（心理危害）**：接触此物品会产生认知或情感上的影响——幻视、强迫性思维、梦境侵入、对特定人或地点的异常执念。心理危害在法证工作中的特殊复杂性：调查者如何区分由物品产生的「超自然认知影响」和由压力大的调查产生的「正常心理反应」？这种不确定性本身就是一种危险。

**Physically dangerous（物理危险）**：接触会导致可测量的物理伤害。这类危险在记录上是最清晰的，但在机制上可能最不清楚——实验室报告说「接触者出现化学灼伤」，但物品的材质分析显示它不含任何腐蚀性物质。

**Lethally dangerous（致命危险）**：此物品与接触者的死亡直接相关。设计这个等级时，关键是建立清晰的接触-死亡机制（即使这个机制是超自然的），以及为什么尽管如此，调查者仍然需要与它工作。致命危险的物品通常是故事后期才揭示其危险程度的——前期观众和角色一样不知道。

**Unknown risk（未知风险）**：这是最叙事丰富的等级，因为不确定性本身就是一种持续的压力。调查者不知道这件物品能做什么，这意味着每一次接触都是风险计算，而风险参数是未知的。设计未知风险物品时，应该有一些线索指向风险的存在（过去接触者的异常经历，但没有清晰的模式），足以让调查者谨慎，但不足以让他们预测。

**危险的机构维度**：除了上述五个等级，某些物品还具有「政治敏感性危险」——持有此物品会使调查者面临来自机构的威胁，而不是来自物品本身的威胁。这类危险最好通过监管链问题字段和当前位置字段来表达，而不是危险等级。

---

### 当前位置作为情节装置

六个位置选项，每个对调查产生不同的叙事压力：

**Evidence locker（证据室）**：标准位置。物品在法证系统中，可以被访问，但需要正式程序。如果物品在证据室但监管链有问题，这个位置本身就成了问题的核心。

**Lab analysis（实验室分析中）**：物品正在被检测。这个位置意味着结果即将到来——可以是叙事中的到来（「实验室报告回来了，结果是……」）也可以是叙事紧迫性的来源（实验室员工接触了物品，如果物品有危险……）。

**Field (not yet recovered)（现场·未回收）**：物品已被识别但尚未回收。这个位置暗示调查者必须返回现场，而这个决定会有成本。未回收意味着物品仍然在超自然影响还活跃的环境中。

**Missing/Stolen（丢失/被盗）**：这是张力最高的位置之一。有人（或某物）需要这件证据消失——而它消失了。调查者面对的不仅是「证据去哪了」，还有「谁知道这件证据存在，谁有能力拿走它，以及他们为什么需要它」。

**Destroyed（已销毁）**：证据不再存在。这个位置看起来是调查的终点，实际上是新的起点：销毁本身是行为，行为留下记录，记录可以被追溯。谁销毁了它，什么时候，用什么授权，这些问题通常比物品本身更具叙事价值。

**Classified storage（机密存档）**：物品存在，但访问被封锁。这是机构掩盖的最直接形式——它承认物品的存在，同时阻止任何人接触它。调查者知道物品在哪里，但他们无法得到它。这个位置为机构对抗提供了具体的叙事焦点。

---

### 证据组合的设计建议

一套设计良好的证据物品组合，应该在整个案件中形成一个相互关联的叙事结构，而不是孤立的物件清单。

**建议的基础证据组合**（4-6件）：

- **核心法证证据**（1-2件）：直接与死亡或犯罪事件相关，具有高法证意义，其分析边界揭示了超自然介入的核心谜题
- **超自然器物**（1件）：历史可追溯，功能与案件的超自然类型直接相关，且其法证分析和超自然解读形成最大矛盾
- **文件类证据**（1件）：携带被压制的知识，监管链有问题，指向机构掩盖
- **个人遗物**（1件）：将案件锚定在具体的人，其超自然意义揭示了受害者与事件之间的个人历史
- **未知物体或生物样本**（0-1件）：危险等级「未知」，其不可知性是持续的叙事压力源

**证据组合的结构关系**：这些物品应该互相提供线索——了解了物品A的超自然意义，才能理解物品B的法证意义中原本无法解释的部分。证据是一个系统，而不是一个列表。

---

### 常见错误

- 法证意义只有「X与案件相关」，没有实际的法证分析内容（缺乏专业密度）
- 超自然意义过于通用（「这件物品被诅咒了」），没有与案件的超自然核心的具体关联
- 双重意义没有形成矛盾（两种解读指向同一方向，失去张力）
- 监管链问题只是程序性记录错误，没有叙事含义（问题应该指向某个主动行为）
- 危险等级只是标签，没有定义危险的具体机制和叙事影响
- 当前位置没有被用作情节装置（位置选择应该产生特定的叙事压力）
- 证据物品之间没有关联（它们应该是一个相互指涉的叙事系统）',
  '## "Evidence & Artifact" Generation — Paranormal Forensics Novel

Evidence items in paranormal forensic fiction carry a dual narrative function: they are simultaneously physical evidence in a conventional criminal investigation and keys to understanding how the paranormal operates. The most effective evidence items work on both levels at the same time — and those two levels contradict each other. The forensic lab says this item tells us X. The paranormal investigation says the same item means the opposite of X. The investigator must choose between frameworks, or find a framework that accommodates both, and that framework''s existence usually means the world is more complicated than anyone wants to admit.

---

### Field Generation Guide

#### Item Name

The name should accurately reflect the object''s nature without dramatizing it. "Item #3709, collected from the Fourth District evidence room, Shelf 7" carries more forensic genre texture than "The Cursed Iron Box" — even if the iron box does carry a curse. Evidence has reference numbers, barcodes, and chain of custody stickers in sealed bags; the naming should reflect this institutional reality.

#### Item Type

Seven types, each functioning differently in a paranormal investigation. See the Item Type Design section below.

#### Forensic Significance

What does conventional forensic analysis reveal about this item? This field requires professional density, not a simple assertion. Not "this is the murder weapon" but "the blade geometry is consistent with a single-edged instrument; bloodstain DNA matches the victim; fingerprint analysis returns a single individual''s prints across all grip surfaces — and that individual''s presence 180 kilometers away at the time of the incident has been confirmed by three independent witnesses who are not in contact with each other." The field should end at an analytic boundary: what analysis established, where analysis stopped, and what analysis cannot explain.

#### Paranormal Significance

What is this item''s supernatural history, function, or power? This field should answer: what is this object in paranormal terms, and why is its presence in this specific case not coincidental? Paranormal significance can derive from the object''s history (what it has been through), its material composition (certain materials carry specific functions in paranormal practice), or its association with specific entities or events.

#### Current Location

Six options, each generating different narrative pressure. See the dedicated section below.

#### Chain of Custody Issues

The field that transforms evidence items from static objects into narrative forces. A chain of custody break is not just a procedural problem — it is itself evidence. Someone (or something) intervened. See the dedicated section below.

#### Danger Level

Five levels, each with different sources and natures of danger — physical, psychological, institutional, and the particular unease of unknown risk. See the dedicated section below.

---

### Seven Item Types and Their Narrative Functions

#### Physical Evidence (forensic)

Standard forensic evidence: weapons, materials left at the scene, trace substances (blood, fiber, soil), scene reconstruction materials. In paranormal cases, physical forensic evidence''s special function is its role as a bridge between frameworks — it exists simultaneously within conventional investigation logic and paranormal interpretation logic, and those two frameworks typically produce irreconcilable readings from the same object.

Design physical forensic evidence by finding the "convergence of contradiction": the gap between the object''s physical state (measurable, analyzable, technically confirmable) and what physical state would be required to have produced what the analysis found (physically impossible).

#### Paranormal Artifact (supernatural object)

Objects known or suspected to have paranormal properties — ritual instruments, objects historically associated with paranormal events, spiritualist tools, or items believed to carry active power. The forensic challenge of this item type is fundamental: laboratory analysis can tell you the material composition, approximate age, and manufacturing method — but cannot tell you why everyone who handled this object experienced similar neurological anomalies within 48 hours of contact.

Design paranormal artifacts with a "forensic shell": what conventional testing finds, and how those findings fail to account for the object''s actual nature.

#### Personal Effect (victim/suspect)

Personal objects belonging to people connected to the case. In paranormal investigations, personal effects often carry significance beyond personal history — they can be paranormal triggers (the object attracted attention of a specific kind) or records of paranormal influence (the object''s condition reflects what the owner experienced).

The distinctive narrative function of personal effects: they are the objects that keep the case human. A photograph, a letter, a small object habitually carried — these items anchor the investigation in a specific person, even as the investigation''s content moves further from ordinary human experience.

#### Document or Record

Paper or electronic documents: case files, medical records, historical documents, letters, journals, reports. In paranormal cases, the key narrative function of documents is their capacity to carry "suppressed knowledge" — someone knew this, wrote it down, and that knowledge was systematically suppressed, modified, or destroyed.

When designing document evidence, focus not only on the document''s content but on its status: who wrote it, who could read it, who tried to destroy it, and how it survived (if it did).

#### Digital Evidence

Electronic devices, recordings, communications records, data files. Digital evidence carries a particular contradiction in paranormal cases: digital records are assumed to be objective, verifiable, tamper-resistant — which makes digital anomalies especially disturbing, because they undermine the modern faith in objective recording.

Design digital evidence by focusing on timestamp integrity, inexplicable state changes in data, and what the equipment recorded under conditions in which it should not have been able to record anything.

#### Biological Sample

Blood, tissue, hair, DNA extracts. Biological samples carry the most direct information about identity — "who or what." When the results of biological sample analysis are technically impeccable but biologically impossible, they create the purest form of forensic-confirmed impossibility the genre can produce.

#### Unknown Object

Items that cannot be classified into known categories — unidentifiable material, undeterminable function, untraceable history. "Unknown" is not a design endpoint but a starting point: the object''s unknowability should be designed as the central feature, with a system of failed attempts at classification built around it.

---

### The Dual Significance Principle: The Most Critical Design Rule

Every significant evidence item should simultaneously carry forensic meaning and paranormal meaning, and those meanings should ideally contradict each other:

**The forensic reading** tells the investigator X.
**The paranormal reading** tells the investigator the same object means the opposite of X.
**Both readings have specific evidentiary support**, and neither can be easily dismissed.

This contradiction creates the genuine epistemological crisis the investigator must face: not "this is strange" but "if this is true, then the entire framework I''ve been using to understand this case is wrong, and I have to start over."

**A concrete example of contradiction design**:

A weapon''s blade angle, force characteristics, and wound profile consistently indicate, by all forensic standards, a right-handed individual standing approximately 180cm tall, delivering a downward strike from the victim''s right side. The wound is textbook. The forensic conclusion is unambiguous. But paranormal investigation reveals this weapon is associated with an entity that died thirty years ago, and that entity''s known victims exhibit identical wound profiles under conditions where no living person was confirmed present. The investigator is not facing "who used this knife" but "if no one used it, how do the angle measurements and force calculations have the values they do?"

---

### Designing Forensic Significance

Forensic significance descriptions must reach professional credibility. Key components:

**Physical state analysis of the item**:
- Laboratory-measurable properties (composition, approximate age, wear patterns, manufacturing method)
- Case-relevant characteristics (fingerprints, DNA, trace material location and distribution)
- Relationship to other evidence (how this item corroborates or tensions against other scene findings)

**The analytic boundary**:

Forensic analysis conclusions should always have a defined limit — what analysis established, and where it stops. In paranormal cases, this limit is typically a paradox: "analysis confirmed X, and X forensically means Y, but Y is physically impossible because Z." Do not omit this boundary. It is the bridge to paranormal significance.

**Concrete contrast**:

Weak: "Blood DNA matched the victim."

Strong: "Blood DNA is a complete match for the victim — mitochondrial haplogroup, STR profiling, and Y-chromosome markers are all consistent with the reference sample. However, protein degradation in the sample indicates it has been stored for over fifteen years, inconsistent with the case timeline. Degradation pattern is inconsistent with ambient environmental exposure and consistent with cryogenic storage at approximately -70°C followed by thaw. No equipment capable of these storage conditions has been identified at any location relevant to the case."

---

### Designing Paranormal Significance

The standard for paranormal significance: the object''s supernatural history and nature should have a direct and specific relationship to the case''s central mystery, not a generic "it is supernatural" assertion.

**Three primary categories of paranormal origin**:

**Historical paranormal** (the object carries residue of past events): Something happened to this object, and in some sense that event is still ongoing through it. When designing this type, the key is establishing a specific parallel between the historical event and the current case — not random horror mythology, but a structured historical connection to what the investigator is currently facing.

**Functional paranormal** (the object has active supernatural capability): Ritual instruments, binding objects, channeling tools. The key in designing this type is establishing specific rules for the function — what it does, to whom, under what conditions. The paranormal function should be compatible with the current case''s supernatural type (entity, curse, spirit, etc.), not randomly appended.

**Passive paranormal** (the object is a container or record of paranormal influence): The object recorded a paranormal event, or became a point of paranormal penetration. The significance here is informational — not danger, but evidence, where the evidence itself is paranormal in nature.

---

### Chain of Custody Issues as Plot Design

The Chain of Custody Issues field transforms evidence items from static objects into narrative forces. A chain of custody break is not merely procedural complexity — it is evidence of an act. Someone (or something) intervened in the handling of this object.

**Types of chain of custody breaks and their narrative implications**:

**Tampering** (weighing who had motive): Someone accessed this evidence outside of authorized procedure. This immediately generates two questions: who, and why — and the answer to "why" almost always points toward the core of the institutional cover-up.

**Disappearance followed by reappearance**: The item left the evidence system and returned — or left and appeared somewhere it could not have been before it was taken. This type of chain of custody break is the most direct form of paranormal intervention in evidence.

**Condition inconsistency** (documented intake state differs from current state): The item''s recorded condition at intake and its current state are inconsistent, with no authorized handling record explaining the change. This can be human (someone modified the records) or paranormal (the object itself changed).

**Custody gap** (no record of handling during a specific period): A period that should have documentation does not. This can be systematic oversight, deliberate concealment, or entirely inexplicable — even when everyone followed procedure, the record disappeared.

**The key to designing chain of custody issues**: the nature of the break should echo the item''s paranormal significance. An object associated with "being forgotten" or "erasure" should have chain of custody problems that involve some form of systematic inability to be recorded — the investigator finds that this object has a pattern of falling out of record systems, and that behavioral pattern is itself a clue to its paranormal nature.

---

### Danger Level Design

Danger is not a single dimension. In paranormal forensic fiction, the source and nature of danger can be physical, psychological, or institutional, and these different types generate different narrative pressures.

**Safe to handle**: No known risk in standard evidence handling procedures. But "no known risk" is not the same as "no risk" — this level may describe the most dangerous objects, precisely because it disarms the handler''s caution. In paranormal cases, an item rated "safe to handle" often means no one has understood it well enough to recognize the danger.

**Psychologically hazardous**: Contact produces cognitive or emotional effects — visions, compulsive ideation, dream intrusion, anomalous fixation on specific people or locations. The particular forensic complexity of psychological hazard: how does the investigator distinguish between "paranormal cognitive influence produced by the object" and "normal psychological stress response from a difficult investigation"? That uncertainty is itself a form of danger.

**Physically dangerous**: Contact produces measurable physical harm. This level is the most documentable, but often the least mechanically comprehensible — the lab report says "contact produced chemical burns," but the material analysis shows the object contains no corrosive substances.

**Lethally dangerous**: This item is directly associated with the deaths of people who contacted it. The key in designing this level is establishing a clear contact-to-death mechanism (even if that mechanism is paranormal), and a reason why the investigator must work with it regardless. Lethal danger is typically concealed from the investigator until mid-to-late story — the reader and the investigator discover the danger together.

**Unknown risk**: The most narratively generative level, because the uncertainty is itself ongoing pressure. The investigator does not know what this item can do, which means every contact is a risk calculation where the parameters are unknown. Design unknown risk items with signals of risk existence (anomalous experiences of past handlers, with no clear pattern) — enough to make the investigator cautious, not enough to let them predict.

**The institutional danger dimension**: Beyond the five formal levels, certain items carry "political sensitivity danger" — possessing or investigating this item exposes the investigator to institutional threat, not threat from the item itself. This form of danger is best expressed through the Chain of Custody Issues and Current Location fields rather than the Danger Level field.

---

### Current Location as Plot Device

Six location options, each generating specific narrative pressure:

**Evidence locker**: Standard position. The item is within the forensic system, accessible but requiring formal procedure. If the item is in the evidence locker but the chain of custody has problems, the location itself becomes the core of the problem.

**Lab analysis**: The item is currently being examined. This location carries temporal pressure — results are coming (narrative anticipation) or handlers are currently in contact with the item (danger pressure, if the item is hazardous).

**Field (not yet recovered)**: The item has been identified but not yet collected. The investigator must return to the scene — and that decision has a cost. Not yet recovered means the item remains in an environment where the paranormal influence may still be active.

**Missing/Stolen**: One of the highest-tension positions. Someone (or something) needed this evidence to disappear — and it did. The investigator faces not only "where did it go?" but "who knew this evidence existed, who had the capability to take it, and why do they need it?"

**Destroyed**: The evidence no longer exists. This position appears to be an investigative endpoint — it is actually a new beginning. Destruction is an act; acts leave records; records can be traced. Who destroyed it, when, with what authorization — these questions are often more narratively generative than the item itself was.

**Classified storage**: The item exists, but access is blocked. This is the most direct form of institutional concealment — it acknowledges the item''s existence while preventing anyone from touching it. The investigator knows where it is and cannot get to it. This provides a specific, concrete focal point for institutional conflict.

---

### Evidence Lineup Recommendations

A well-designed evidence set forms a mutually referential narrative system, not an isolated checklist.

**Recommended baseline evidence lineup** (4-6 items):

- **Core forensic evidence** (1-2 items): Directly connected to the death or criminal event; high forensic significance; the analytic boundary reveals the central paranormal mystery
- **Paranormal artifact** (1 item): Traceable history; function directly connected to the case''s supernatural type; forensic analysis and paranormal interpretation form maximum contradiction
- **Documentary evidence** (1 item): Carries suppressed knowledge; has chain of custody problems; points toward institutional concealment
- **Personal effect** (1 item): Anchors the case in a specific person; paranormal significance reveals the victim''s personal history with the event
- **Unknown object or biological sample** (0-1 item): Danger level "Unknown"; its unknowability is a sustained source of narrative pressure

**Structural relationships in the evidence set**: These items should provide clues to each other — understanding the paranormal significance of Item A unlocks what was previously inexplicable in the forensic significance of Item B. Evidence is a system, not a list.

---

### Common Mistakes

- Forensic significance consisting only of "X is connected to the case" without actual forensic analysis content: the professional density is what earns the genre''s credibility
- Paranormal significance too generic ("this item is cursed") without specific connection to the case''s paranormal core
- Dual significance failing to generate contradiction: both readings pointing in the same direction loses the tension
- Chain of custody issues as purely procedural recording errors with no narrative implication: the break should point toward a deliberate act
- Danger level as a label only, with no defined mechanism and narrative implication for the specific danger
- Current location not used as a plot device: the location choice should generate specific narrative pressure
- Evidence items with no relationship to each other: they should form a mutually referential investigative system',
  (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1),
  1,
  32,
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
