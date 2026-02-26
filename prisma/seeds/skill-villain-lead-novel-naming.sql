-- The Villainous Lead - 小说命名（Layer 3）
-- novel_creation_method: The Villainous Lead (Villainous Lead)
-- 执行方式 / Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-villain-lead-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'villain-lead-novel-naming',
  '小说命名：为 The Villainous Lead 提供命名指导，涵盖反派视角小说的标题风格、命名逻辑、以及书名如何暗示主角的独特视角',
  'Novel naming: naming guidance for The Villainous Lead, covering title styles that signal the villain protagonist''s perspective without revealing the deconstruction',
  '## 小说命名 — The Villainous Lead

反派视角小说标题的核心策略：**标题本身就是一个解构**——通常是一个在传统英雄叙事中代表「正义一方」的词汇或概念，但在这本书里是反派的视角和语境。好的标题对已经熟悉这个子类型的读者发出精准信号，同时对一般读者保持足够的神秘感。

---

### 三种命名策略

**策略一：反派身份直接命名**

用传统叙事中「反派」的身份标签作标题——「恶龙」「黑魔王」「反派」「终极boss」「大魔头」——但配合内容颠覆这些标签的含义。

这类标题对已经熟悉这个子类型的读者极具吸引力，因为标签+主角视角的组合立刻传达了「视角翻转」的承诺。风险：标签本身不能加修饰语（不能是「被误解的恶龙」「实际上是好人的黑魔王」）——就是标签，单独站立，用内容去颠覆而非在标题里提前道歉。

参考构成方式：标签 + 主动动词或角度（「说话」「视角」「策略」「棋局」），而非单独一个标签——后者偶尔有力但更多时候显得平淡。

**策略二：棋局/猎手隐喻命名**

用博弈论隐喻、猎手与猎物的倒置、或者棋局/游戏概念作标题。这类标题暗示故事的核心是策略和操控而非武力对决，精准对应「反派始终是主动方、主导者」的类型承诺。

这类标题对喜欢「看聪明人下棋」的读者最有吸引力。构成建议：避免太口语化的游戏术语（「开挂」「走位」「bug」）——这些暗示无脑爽文而非智识解构；使用有重量感的隐喻（「局」「棋」「猎」「弈」「围」）。

**策略三：讽刺式英雄主义命名**

用英雄叙事的语言，但加入微妙的讽刺层——「天命之子的终结」「最后一位勇者」「英雄的游戏」「关于一位英雄的覆灭」。

最高风险最高回报的策略：读者要进入故事才能完全理解标题的讽刺层次，但进入之后回望标题会产生「从一开始就写在标题里了」的精妙感。

设计要点：讽刺对正确的读者必须在第一次看到标题时就是可感知的（不需要清晰，但需要有一丝「这个标题不完全是字面意思」的感觉）。如果读者需要解释才能理解为什么是讽刺，标题已经失败了。

---

### 命名禁区

**不要让标题传达「我是被误解的好人」**
这会误导读者期待一个平反故事或救赎弧，而不是解构故事。「冤屈反派」「真正的英雄其实是我」类标题锁定了错误的受众。

**不要用纯粹强调力量的标题**
「最强反派」「无敌大魔王」「反派无敌」——这是无脑爽文的标签，传达的是「我碾压一切」而非「我比你聪明三步」。不同的承诺，不同的受众，不要混淆。

**不要让标题失去智识趣味**
即便是反派视角，标题也必须传达「这个故事值得思考」而非「这个故事很爽」。前者吸引来的读者会留下；后者吸引来的读者会在发现故事实际上在解构英雄主义时感到不满。

**不要用喜剧/戏谑感的标题**
「搞笑反派日常」「菜鸡黑魔王」类标题传达的是轻松喜剧，不是严肃解构。除非整本书的基调确实是喜剧，否则避免任何暗示轻松调侃的词汇。',

  '## Novel Naming — The Villainous Lead

The Villainous Lead title has one primary job: signal the genre to its audience while not revealing the specific deconstruction to general readers. This is a narrower audience than general fantasy — these readers are specifically looking for the "villain protagonist" experience, and the right title finds them efficiently.

The wrong title either attracts the wrong audience (people expecting redemption arcs or dark wish fulfillment without intelligence) or fails to attract the right audience (readers who would love this but don''t realize it''s their genre). Title failure is an acquisition problem: the book never reaches its natural readers.

---

### Three Title Strategies

**Strategy One: Direct Identity Inversion**

Take a term from conventional heroic narratives that labels the "bad side" — Dragon, Demon King, Villain, Evil Overlord, Final Boss — and make it the title without irony, qualifier, or apology. The power: in the current "villain POV" subgenre, experienced readers immediately recognize what this means and what it promises.

The critical constraint: the label must stand alone, not modified. Not "The Unlikely Demon King." Not "The Misunderstood Villain." Not "The Villain Who Was Actually Right." Just the label, daring the reader to engage with it. The content provides the deconstruction; the title just announces the vantage point.

Construction advice: a bare label as a title can be flat. Pair it with an active element that signals perspective and intelligence rather than simply category: "The Demon King''s Playbook," "How the Villain Thinks," "The Dark Lord Speaks," "A Villain''s Record." The active element converts a category label into a promised experience.

Examples of the pattern working: titles that use the villain-label combined with a word that implies methodology, strategy, or deliberate perspective (speaks, plans, acts, moves, calculates). Examples of the pattern failing: titles that add softening adjectives ("the kindhearted villain") or ironic distance markers ("the so-called villain") — these signal authorial discomfort with the premise.

**Strategy Two: Strategic/Chess Metaphor**

Titles that signal the intellectual game at the story''s core. These work especially well for Schemer-archetype villains because they promise a specific type of satisfaction (watching a superior intelligence at work) to readers who specifically enjoy that experience.

These readers know exactly what they want: they want to watch someone think three moves ahead and be right. The title should promise this. Effective vocabulary: "game," "move," "play," "hunt," "board," "position," "endgame," "gambit," "long game," "opening." Less effective: casual gaming vocabulary ("hack," "exploit," "cheat code," "speedrun") — these signal power fantasy rather than strategic fiction.

Construction examples: "The Long Game," "Playing Villain," "Against the Prophecy," "The Endgame," "The Hunt Reversed," "The Hunter''s Board." The best constructions combine a strategic vocabulary word with either an inversion signal (reversed, against, from the other side) or a specificity marker (villain''s, dark, the demon lord''s).

**Strategy Three: Ironic Heroism Framing**

Use the language of heroic narrative but introduce a subtle wrongness. This is the highest-risk, highest-reward approach. Done well, it''s the most elegant signal of the story''s deconstruction thesis; done poorly, it''s confusing or misleading.

The mechanics of the irony: take a phrase from the genre''s standard heroic vocabulary and either invert the subject (the hero as object of the villain''s story rather than its protagonist), mark it as concluded ("The Last Hero," "The Final Chosen One"), or frame it from an unexpected analytical distance ("A Record of the Hero''s Defeat," "On the Subject of Chosen Ones").

Examples: "The Hero Will Fail," "So the Chosen One Has Appeared," "The World''s Greatest Villain" (ironic: told from that villain''s perspective), "A Record of the Demon King''s Overthrow" (ironic: the Demon King is the narrator). The irony should be legible to the right reader on first look — not necessarily clear, but present as a quality of strangeness that invites a second reading.

Construction advice: test the title by asking whether a reader who has finished the book would look at the title and think "that was perfectly chosen." If the irony only becomes visible after reading, simplify the construction until the strangeness is perceptible from outside.

---

### What to Avoid

**"Misunderstood" Signals**
Any title element that suggests the villain is actually good, justified, or wrongly classified. This promises a redemption arc or a "the real villain was society" narrative — neither of which is what this story delivers. The Villainous Lead''s villain is not misunderstood; they are correctly understood as a villain and they embrace that status.

**Raw Power Emphasis**
"The Unbeatable Villain," "The Strongest Evil," "The Invincible Dark Lord" — these signal power fantasy, not strategic fiction. Different promise, different audience. Power fantasy readers want to watch a protagonist overwhelm opposition. Villainous Lead readers want to watch a protagonist outthink opposition. Do not attract readers who will be disappointed by the actual content.

**Comedy/Parody Markers**
"The Incompetent Dark Lord," "The Reluctant Villain," "The Bumbling Evil Overlord" — these signal comedy, not serious deconstruction. Unless the book is genuinely comedic in register, avoid any vocabulary that signals lightness or self-mockery.

**Apology Titles**
The worst category: titles that apologize for the villain''s villainy before the reader has even opened the book. "Evil for Good Reasons," "The Dark but Justified," "The Villain with a Heart." These tell the reader the story is uncomfortable with its own premise — which is exactly the wrong signal for a story whose premise requires full commitment.',

  (SELECT id FROM novel_creation_method WHERE name = 'The Villainous Lead' LIMIT 1),
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
