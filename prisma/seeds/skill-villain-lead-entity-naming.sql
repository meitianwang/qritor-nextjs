-- The Villainous Lead - 实体命名（Layer 3）
-- novel_creation_method: The Villainous Lead (Villainous Lead)
-- 执行方式 / Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-villain-lead-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'villain-lead-entity-naming',
  '实体命名：为 The Villainous Lead 提供角色、场景、势力的命名指导，设计能体现反派美学与世界秩序的名称体系',
  'Entity naming: naming guidance for The Villainous Lead, covering character names, location names, and faction names that reflect the villain''s aesthetic and the world''s power structure',
  '## 实体命名 — The Villainous Lead

反派视角小说的命名美学核心：**名字是权力的宣言，也是伪装的工具**。反派的名字风格、反派势力的名字风格、英雄阵营的名字风格——三者必须有意识地设计成可区分的风格系统。这个风格对比本身就是世界观的一部分，读者通过名字就能感受到不同阵营的运作逻辑。

---

### 角色命名

**反派主角的名字**

最强的反派主角名字具备两个层次：公众身份名（普通、被接受、甚至令人尊敬）和真实身份名（或真名，或称号，或外号）。

公众身份名设计原则：不能立刻听起来像「坏人」——这会破坏伪装效果，也削弱故事的解构层次。可以是普通商人、学者、官员、贵族的常用名，正常到不引人注意。真实身份名/称号设计原则：回望时应该感觉「名字里早有暗示」，但初次见到时不能一眼识破。好的做法：双重含义的字词、在该世界语境里有正面意义但在真正含义上有颠覆的字词。

称呼方式也是人物刻画工具：反派如何在心里称呼英雄（直接用名、用「当前的天命之子」这类类别称谓、还是用反派自己给英雄起的代号），揭示了反派对英雄的内心态度——分析性的、讽刺性的、还是偶尔有真实尊重的。

**英雄的名字**

英雄的名字应当是这个世界定义的「好名字」：响亮、正面词汇、有象征意义（光明/希望/正义/守护相关）。英雄的名字告诉读者这个世界对英雄的期待。

设计目的：英雄的名字是「英雄系统」的一部分。它本身就是反派所要解构的对象——这个名字承诺了什么，这个人实际做到了什么，以及这个名字所代表的系统有什么内在矛盾。

**反派下属的名字**

反派下属的命名逻辑反映反派的价值体系。效率优先的反派：下属用功能性代号或角色称谓（「向导」「调度」「分析员」），而非有诗意的个人名字。有剧场感的反派：核心圈子的成员可能有「赐名」，名字体现反派对他们能力的评估或某种私人幽默。外围成员：几乎不会被命名——他们是棋子，不是人物。

---

### 势力命名

**反派自身势力的双层命名**

最有效的命名策略：反派势力有两套名字。

对外名称：无害的、合法感的、甚至令人信任的——贸易公会、学术协会、文化组织、慈善机构。这个名字是安全屏障：敌人寻找反派的组织时会搜索错误的关键词。

内部名称：精准的、功能性的、可能有反派圈子内部才懂的私人讽刺——「清算局」「末日档案室」「棋子库」。内外名字之间的落差本身就是一种安全措施。

**英雄同盟的势力命名**

按照这个世界的英雄神话框架命名：神圣感、天命感、正义感、守护感。具体选择取决于这个世界的神话传统——修真世界用「正道」「天机」「浩然」；奇幻世界用「光之」「圣盟」「守护者」；现代都市用「正义」「卫士」「守望」。

这类名字的叙事功能：它承诺了什么，反派通过观察这个势力的实际行为来解构这个承诺。名字越宏大，反派揭示的虚伪就越有力量。

**中立势力**

以职能命名，无意识形态色彩：「东方商会」「铁匠协会」「消息处」「中间人联络网」。这类名字不参与善恶叙事，服务于情节功能。

---

### 场景命名

**反派领地**

两种有效策略：一是表面无害实则别有用意（一个商人工会总部的地名，但读者知道它实际是什么）；二是有掌控感的直接命名（「暗堡」「影阁」「无名院」），但应用在真正属于反派的私人空间而非公开活动场所。

最佳场景命名：回望时感觉「名字里早有暗示」，初次见到时是中性或稍有神秘感的。避免一眼看出是「坏人基地」的夸张命名——那破坏了整个故事的智识层次。

**英雄领地**

按照英雄神话命名：神圣的、被守护的、光明的。命名原则与英雄同盟相同——越宏大，反派的解构越有力。

**战略地点**

以功能或历史命名，中性的信息承载名字：「旧关隘」「断龙原」「三方边境」「龙脉会聚处」。这类地名不偏向任何一方，是地理的而非意识形态的。',

  '## Entity Naming — The Villainous Lead

In the Villainous Lead, names are infrastructure. They signal alignment, create expectation, and — for the villain''s faction specifically — function as a two-layer system: the public name that creates a false impression, and the real name known only to those inside the operation. The three naming registers of this genre (villain''s world, hero''s world, neutral territory) should be distinguishable by their aesthetic logic, not just their labels.

---

### Character Naming

**Villain Protagonist**

The naming challenge: create a name with duality. The public-facing name should be unremarkable or even respected — something that wouldn''t raise a flag in a routine identity check. The real name, title, or earned designation should carry the weight of what the character actually is.

Qualities of effective villain protagonist names:
- Pronounceable and memorable across a full book (the reader tracks this character constantly)
- Public name doesn''t immediately read as "evil" — it shouldn''t undermine the character''s cover identity or signal the deconstruction too early
- Either retrospective significance (the name makes more sense after you know the character) or an earned title that marks a transformation point in the character''s history

Consider names from languages or traditions that the target readership doesn''t immediately process — this creates the right combination of memorability and slight wrongness that prevents the name from sounding generically heroic or generically villainous.

The question of how the villain refers to the hero internally is a characterization tool, not a naming question, but it intersects with naming: does the villain use the hero''s title (respectful acknowledgment of the hero''s position), their given name (treating the hero as an individual rather than a symbol), a codename the villain has assigned (the villain''s own analytical framework), or a pure categorical description ("the current Chosen," "target," "the prophesied one")? Each choice reveals something about the villain''s internal model of the hero.

**The Hero**

Design hero names according to the in-world standard for heroic names. This world believes in Chosen Ones — its heroes should have names that sound like Chosen One names: resonant, positive-valence syllables, often incorporating themes of light, dawn, hope, protection, or sacred materials from the setting''s mythology.

The hero''s name tells the reader what the world expects from them. It is part of the hero system the villain is deconstructing. The gap between what the name promises and what the hero actually does (and what the system that produced this hero actually does) is one of the story''s central analytical targets.

Naming principle: the hero''s name should feel like it belongs to someone the world considers admirable. Not because the hero is admirable (the villain''s perspective will complicate this), but because the hero is what the world has produced as its answer to the villain — and that answer should feel serious, not laughable.

**Villain''s Subordinates**

Subordinate naming discipline reflects the villain''s operational values.

Efficiency-first villain: subordinates use functional designations or role titles (Handler, Analyst, Route, the Courier, the Auditor) rather than personally meaningful names. Secondary operatives rarely receive full names — they are assets in an operation, not characters in a story.

Theatrically-inclined villain: the inner circle may have earned names or titles that reflect the villain''s personal assessment of their specific capabilities or contain private irony that only the inner circle understands. These should feel like the villain''s voice, not like standard fantasy villain naming.

Universal principle: the outer layers of the villain''s organization are barely named. Naming someone implies they matter. The villain''s naming conventions should reflect their actual view of which people matter.

---

### Faction Naming

**Villain''s Own Forces: The Two-Layer System**

Public name: designed to be unremarkable, legitimate-sounding, or positively associated. A trade guild. A scholarly society. A cultural preservation organization. A charitable foundation. The public name is a security measure — entities searching for the villain''s operation will be searching for the wrong name.

Internal name: precise, functional, possibly with private irony that only members of the operation understand. The internal name should sound like the villain named it — efficient, accurate, slightly cold. Examples of the tonal register: "The Clearance Division," "End-State Archive," "The Asset Registry," "Operations Bureau." The gap between the public name and the internal name is itself a piece of characterization: this is an organization that thinks carefully about the difference between what things appear to be and what they actually are.

**Hero''s Alliance**

Name according to the world''s heroic mythology framework. In a cultivation world: names invoking Heaven''s will, righteous paths, or sacred formations. In fantasy: names invoking light, justice, divine mandate, or historical heroic traditions. In contemporary settings: names invoking justice, protection, or civic duty.

The specific choice of mythological register reveals which aspect of heroism this faction has made central to its identity — and therefore which aspects of heroism the villain can deconstruct by showing this faction''s actual behavior. The more grandiose the name, the more effective the deconstruction when the villain demonstrates what the faction actually does.

**Neutral Factions**

Named by function or historical reference, without ideological valence: Eastern Merchant''s Association, the Arbitration House, the Information Brokerage, the Middle Road Council. These names serve plot function without participating in the good/evil axis. They are named by what they do, not by what they claim to represent.

---

### Location Naming

**Villain''s Domain**

Most effective approach: the villain''s primary domain carries a name that is either misleading (a perfectly ordinary-sounding merchant district that is actually the nerve center of the operation) or has a double meaning that reveals itself progressively (a name that initially reads as a physical description and later turns out to reference the villain''s actual purpose for the space).

Avoid the temptation to name the villain''s domain with obvious dark aesthetics ("The Shadow Fortress," "The Dark Tower," "The Cursed Keep") unless the villain is deliberately projecting this aesthetic for their own reasons. A villain who is operationally serious doesn''t name their base in ways that flag it to enemies.

The best villain location names: neutral on first reading, retroactively meaningful after the reader understands what the location actually is.

**Hero''s Territory**

Name according to the world''s heroic mythology — sacred, protected, luminous. The naming principle mirrors the hero faction naming: the more the name promises, the more effective the deconstruction when the villain''s perspective shows what the territory actually is and what it actually protects.

**Strategic Locations**

Named by function or historical significance, neutrally: "The Old Pass," "The Dragon''s Convergence Point," "Three-Border Territory," "The Contested Valley." These names carry information without alignment. They are geographic facts, not ideological statements.',

  (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1),
  1,
  36,
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
