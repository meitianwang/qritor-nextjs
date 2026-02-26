-- The Purely Pragmatic Novel — "Novel Naming" Skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-pragmatic-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'pragmatic-novel-naming',
  'Novel naming: generates titles and synopses for The Purely Pragmatic Novel — the aesthetics of the calculating mind in English fiction',
  'Novel naming: generates titles and synopses for The Purely Pragmatic Novel — the aesthetics of the calculating mind in English fiction',
  '## Novel Naming — The Purely Pragmatic Novel

The title of a rational protagonist novel is the first signal to the right reader. It must suggest that someone is thinking — without announcing it. The worst titles in this space tell the reader how to feel about the protagonist ("a genius like no other") or make explicit what should remain implicit ("The Perfect Strategy"). The best titles have intellectual weight, a slight unease, and an implication that something is being assessed or acquired that the reader has not yet understood.

---

### Naming Philosophy

The aesthetic direction for this story type sits at the intersection of three qualities:

**Precision** — The title means something specific. It refers to an actual thing in the story, not a vague atmosphere. A reader who finishes the book should understand the title more deeply than when they began.

**Implication** — Something is being calculated or assessed. The title implies agency, deliberateness, a mind at work — but does not declare it. The reader senses rather than reads the intelligence.

**Intellectual weight** — The title sounds like it came from someone who chooses words carefully. It is not decorative. It does not reach for drama. It states a fact that turns out to be more complex than it appeared.

**What to avoid**: Titles that announce the protagonist''s intelligence ("The Mastermind'', "The Perfect Strategist"), titles that are purely atmospheric with no referent ("The Darkness Within"), and titles that could belong to any thriller ("The Last Gambit", "The Final Move"). These are generic. They do not signal the specific type of story.

---

### Five Title Formats

#### Format 1: The [Investment / Acquisition / Transaction]

Declares the transactional nature of what is at the story''s center. The title names the deal — the thing being pursued, acquired, or converted.

- *The Acquisition* — implies something is being taken; the reader wonders what and whether it was worth the price
- *The Return* — can mean financial return or a physical return; both meanings are active
- *The Position* — a held place, a held power, a chess piece; the word is both specific and resonant
- *The Arrangement* — a deal made; the word implies two parties and an implicit risk of renegotiation
- *The Portfolio* — borrowed from finance; suggests the protagonist treats relationships and assets identically

**Strength**: These titles are clean and slightly cold. They signal the story''s register immediately.

**Risk**: Can read as business nonfiction if the cover design does not signal fiction. Pair with a subtitle or visual that establishes stakes.

#### Format 2: The [Thing That Is Actually Not What It Seems]

Titles that present a word or concept with its surface meaning, where the story reveals the word carries a second, more complex meaning. The title is technically accurate in both senses.

- *The Gift* — a present, yes; also the German word for poison; also something given that creates obligation
- *The Asset* — a resource; also a person who has been converted into a resource; the ambiguity is the point
- *The Favor* — an act of goodwill; also the structure of obligation it creates; also what the protagonist calls the relationship
- *The Ally* — someone on your side; or someone positioned to appear that way; the protagonist would note the difference matters
- *The Debt* — money owed, or leverage held; one person''s debt is another''s instrument

**Strength**: These titles reward rereading. Readers who finish the book return to the title with new understanding.

**Risk**: The double meaning must be genuinely active in the story — both readings must be relevant, not forced.

#### Format 3: The Optimal [X]

The word "optimal" or words like it — efficient, sufficient, necessary, viable — carry the novel''s worldview in a single adjective. These are not the words emotional protagonists use. They are the words of someone who has already done the math.

- *The Optimal Distance* — from people, from risk, from commitment; the protagonist has calculated the right amount of closeness
- *The Necessary Loss* — acknowledges that something was lost while framing it as required; the framing is the protagonist''s, and it is unsettling
- *The Sufficient Proof* — not overwhelming proof, not definitive proof — sufficient; the protagonist works with what is needed, not what is comfortable
- *The Efficient Route* — can be literal or metaphorical; the efficiency is always both
- *The Viable Option* — not the good option, not the right option; the one that works

**Strength**: These titles immediately establish the protagonist''s cognitive register. Readers who understand what these words imply will know what kind of story they are reading.

**Risk**: Can feel clinical if the cover and blurb do not add human stakes. The title is the coldest element; everything else should add warmth.

#### Format 4: What [X] Is Worth

Frames the story as an assessment of value. Something is being evaluated. The reader does not yet know the answer — and may not agree with the protagonist''s conclusion.

- *What Loyalty Is Worth* — the protagonist has an answer; the reader may disagree
- *What He Paid For Her* — raises the uncomfortable implication immediately; the "her" is either a person who was treated as a commodity or someone the protagonist sacrificed everything to protect
- *What the Information Cost* — information always has a price; this title says the price was paid
- *What Remains After* — after the calculation, after the campaign, after the cost; the question is what was left
- *What She Was Owed* — justice, or the protagonist''s assessment of a debt; either reading is active

**Strength**: These titles put the reader in an evaluative position immediately. They are not watching a story — they are being asked to assess one.

**Risk**: The "What X Is Worth" construction can feel like a question the story answers definitively. The story should complicate the answer, not provide a clean one.

#### Format 5: The [Position / Title / Role] of [Name]

Places a specific character in a specific structural position. The position is often more significant than the name, which may be unfamiliar to the reader at the outset.

- *The Appointment of Marcus Veil* — "appointment" implies someone chose him; also implies a formal role; also implies the appointment may not last
- *The Education of Claire Ashford* — education by whom, in what, toward what end; the word "education" implies a teacher; that teacher may not be benevolent
- *The Succession* — who takes over, from whom, by what means; succession implies both continuation and displacement
- *The Agency of Nora Cain* — both her institutional role and her individual will; the double meaning is the book''s central tension
- *The Tenure of Daniel Frost* — how long something lasted; implies it ended; the reader wants to know why

**Strength**: These titles feel serious, literary, and specific. They signal that the story is about a person''s relationship to power and structure.

**Risk**: The name in the title must earn its place — the character must be worth naming. If the name is too ordinary without context, the title may not signal enough about the story''s nature.

---

### Thematic Word Bank

| Category | Words |
|----------|-------|
| Transaction / Exchange | acquisition, asset, debt, return, cost, investment, leverage, yield, exchange, capital, dividend, liability |
| Assessment / Analysis | audit, inventory, assessment, calculation, estimate, projection, review, margin, threshold, variable |
| Position / Structure | position, appointment, tenure, succession, arrangement, allocation, mandate, authority, jurisdiction |
| Precision / Sufficiency | optimal, sufficient, necessary, viable, efficient, calibrated, measured, targeted, contained |
| Value / Worth | worth, value, price, rate, loss, gain, premium, interest, principal, stake |
| Relationship as System | alliance, asset, contact, resource, obligation, leverage, proximity, distance, exposure |

---

### Title Comparison Table

| Effective Title | Ineffective Title | Why the Difference |
|----------------|------------------|-------------------|
| *The Asset* | *The Mastermind''s Game* | The first implies; the second announces. Readers should not be told they are watching a genius. |
| *What Loyalty Is Worth* | *Loyalty Is a Lie* | The first invites evaluation; the second provides a verdict. The rational protagonist assesses — they do not conclude for the reader. |
| *The Optimal Distance* | *Cold-Blooded Genius* | The first uses the protagonist''s own register; the second uses an outside judgment that flattens complexity. |
| *The Appointment of Marcus Veil* | *The Rise of the Shadow King* | The first is specific and structural; the second is generic power fantasy. |
| *The Necessary Loss* | *Sacrifice* | The first implies the protagonist made a calculation; the second implies tragedy. Same event, entirely different story. |
| *The Arrangement* | *The Perfect Plan* | "Perfect" promises frictionlessness the story cannot honestly deliver. "Arrangement" implies two parties and implicit risk. |

---

### Synopsis Structure

The synopsis must establish, in three paragraphs, that the reader is about to encounter a mind unlike most fictional protagonists. It does not describe the protagonist as "brilliant" or "calculating" — it demonstrates these qualities through the example it provides.

**Paragraph 1 — Establishing the Calculator''s Presence**

Introduce the protagonist through what they do, not who they are emotionally. The opening image or situation should immediately establish that this person observes the world differently. Avoid backstory in paragraph one. Show the protagonist in the act of assessment.

Example approach: "When Nora Cain accepted the director''s invitation, she had already identified three reasons he had extended it and one reason he hadn''t mentioned. She accepted for the fourth reason."

This tells the reader: this person reads situations like texts, operates on information others miss, and makes decisions on this basis. The reader now understands the story''s cognitive register.

**Paragraph 2 — Demonstrating the Framework at Work**

Describe one specific decision or action the protagonist takes that illustrates their methodology. The decision should be surprising but logical — counterintuitive by ordinary standards, but obviously correct given the protagonist''s framework. Do not explain the decision. Show it and let the reader puzzle at the logic. Then show it paying off — briefly, without celebration.

This paragraph shows the reader what reading this book will feel like: the puzzle of watching someone act on calculations you cannot fully see, followed by the satisfaction when the calculation is revealed.

**Paragraph 3 — Indicating the Cost Without Resolution**

The third paragraph introduces the story''s central tension: the framework is brilliant and the costs are real. Do not name the cost specifically — imply it. Do not promise resolution — imply that the protagonist''s approach makes certain costs inevitable, and let the reader wonder whether the objective will prove worth them.

Close the synopsis on a question the protagonist would ask, not a question a conventional protagonist would ask. Not "will she survive?" but "at what point does the model become more important than what the model was built to protect?"

**Length**: 150-220 words for the full synopsis.

---

### Common Mistakes

1. **Titles that declare the protagonist''s intelligence** ("The Genius Among Fools", "The Smartest Man in the Room"): These are the protagonist''s opponents'' mistake, not the author''s. The reader should conclude the protagonist is brilliant — they should not be told.

2. **Synopses that begin with backstory**: "After losing her family at age twelve..." This is not how this story begins. This story begins with the protagonist doing something. Start there.

3. **Synopses that describe the protagonist''s emotional journey**: "She will learn that not everything can be calculated." This is the wrong story. This story does not teach the protagonist that calculation has limits — it examines what it costs to live as though it does not.

4. **Titles borrowed from thriller convention**: "The Last Variable", "The Final Equation", "Checkmate". These signal a puzzle to be solved, not a mind to be inhabited. The genre distinction matters.

5. **Synopses that make the protagonist sound cold or villainous** through editorial description: "ruthless", "manipulative", "cold-blooded". These are outside judgments. Let the actions in the synopsis speak. The reader will form their own assessment.

6. **Titles with no referent in the story**: A beautiful title that does not connect to a specific element of the narrative fails its function. The title must mean something in the world of the book.',
  '## Novel Naming — The Purely Pragmatic Novel

The title of a rational protagonist novel is the first signal to the right reader. It must suggest that someone is thinking — without announcing it. The worst titles in this space tell the reader how to feel about the protagonist ("a genius like no other") or make explicit what should remain implicit ("The Perfect Strategy"). The best titles have intellectual weight, a slight unease, and an implication that something is being assessed or acquired that the reader has not yet understood.

---

### Naming Philosophy

The aesthetic direction sits at the intersection of three qualities:

**Precision** — The title means something specific. It refers to an actual thing in the story, not a vague atmosphere. A reader who finishes the book should understand the title more deeply than when they began.

**Implication** — Something is being calculated or assessed. The title implies agency, deliberateness, a mind at work — but does not declare it.

**Intellectual weight** — The title sounds like it came from someone who chooses words carefully. It states a fact that turns out to be more complex than it appeared.

**What to avoid**: Titles that announce the protagonist''s intelligence ("The Mastermind", "The Perfect Strategist"), titles that are purely atmospheric with no referent, and titles that could belong to any thriller. These do not signal the specific type of story.

---

### Five Title Formats

#### Format 1: The [Investment / Acquisition / Transaction]

Declares the transactional nature of what is at the story''s center.

- *The Acquisition* — something is being taken; the reader wonders what and whether it was worth the price
- *The Return* — financial return or a physical return; both meanings are active
- *The Position* — a held place, a held power; the word is both specific and resonant
- *The Arrangement* — a deal made; two parties; an implicit risk of renegotiation
- *The Portfolio* — borrowed from finance; suggests the protagonist treats relationships and assets identically

**Strength**: Clean and slightly cold. Signals the story''s register immediately.

#### Format 2: The [Thing That Is Actually Not What It Seems]

Titles where the surface meaning and the story''s revealed meaning are both accurate.

- *The Gift* — a present; also the German word for poison; also something that creates obligation
- *The Asset* — a resource; also a person converted into one; the ambiguity is the point
- *The Favor* — an act of goodwill; also the structure of obligation it creates
- *The Ally* — someone on your side; or positioned to appear that way
- *The Debt* — money owed, or leverage held

**Strength**: These titles reward rereading. The reader returns to the title after finishing with new understanding.

#### Format 3: The Optimal [X]

Words like "optimal", "sufficient", "necessary", "viable" carry the novel''s worldview in a single adjective. These are not the words emotional protagonists use.

- *The Optimal Distance* — the protagonist has calculated the right amount of closeness
- *The Necessary Loss* — acknowledges that something was lost while framing it as required
- *The Sufficient Proof* — not overwhelming, not definitive — sufficient; the protagonist works with what is needed
- *The Efficient Route* — can be literal or metaphorical; the efficiency is always both
- *The Viable Option* — not the good option, not the right option — the one that works

**Strength**: Immediately establishes the protagonist''s cognitive register.

#### Format 4: What [X] Is Worth

Frames the story as an assessment of value. Something is being evaluated and the reader may not agree with the protagonist''s answer.

- *What Loyalty Is Worth* — the protagonist has an answer; the reader may disagree
- *What He Paid For Her* — raises the uncomfortable implication immediately
- *What the Information Cost* — information always has a price; this says it was paid
- *What Remains After* — after the calculation, the campaign, the cost
- *What She Was Owed* — justice, or the protagonist''s assessment of a debt

**Strength**: Puts the reader in an evaluative position immediately.

#### Format 5: The [Position / Title / Role] of [Name]

Places a character in a structural position. The position is often more significant than the name.

- *The Appointment of Marcus Veil* — someone chose him; a formal role; may not last
- *The Education of Claire Ashford* — by whom, toward what end; implies a teacher who may not be benevolent
- *The Succession* — who takes over, from whom, by what means
- *The Agency of Nora Cain* — institutional role and individual will; the double meaning is the book''s tension
- *The Tenure of Daniel Frost* — how long something lasted; implies it ended; the reader wants to know why

**Strength**: Serious, literary, specific. Signals the story is about a person''s relationship to power and structure.

---

### Thematic Word Bank

| Category | Words |
|----------|-------|
| Transaction / Exchange | acquisition, asset, debt, return, cost, investment, leverage, yield, exchange, capital, dividend, liability |
| Assessment / Analysis | audit, inventory, assessment, calculation, estimate, projection, review, margin, threshold, variable |
| Position / Structure | position, appointment, tenure, succession, arrangement, allocation, mandate, authority, jurisdiction |
| Precision / Sufficiency | optimal, sufficient, necessary, viable, efficient, calibrated, measured, targeted, contained |
| Value / Worth | worth, value, price, rate, loss, gain, premium, interest, principal, stake |
| Relationship as System | alliance, asset, contact, resource, obligation, leverage, proximity, distance, exposure |

---

### Title Comparison Table

| Effective Title | Ineffective Title | Why the Difference |
|----------------|------------------|-------------------|
| *The Asset* | *The Mastermind''s Game* | The first implies; the second announces |
| *What Loyalty Is Worth* | *Loyalty Is a Lie* | The first invites evaluation; the second provides a verdict |
| *The Optimal Distance* | *Cold-Blooded Genius* | The first uses the protagonist''s register; the second is an outside judgment |
| *The Appointment of Marcus Veil* | *The Rise of the Shadow King* | The first is specific and structural; the second is generic power fantasy |
| *The Necessary Loss* | *Sacrifice* | "Sacrifice" implies tragedy; "Necessary Loss" implies calculation |
| *The Arrangement* | *The Perfect Plan* | "Perfect" promises frictionlessness the story cannot honestly deliver |

---

### Synopsis Structure

**Paragraph 1 — Establishing the Calculator''s Presence**

Introduce the protagonist through what they do, not who they are emotionally. The opening image should immediately establish that this person observes the world differently. Avoid backstory in paragraph one. Show the protagonist in the act of assessment.

Example: "When Nora Cain accepted the director''s invitation, she had already identified three reasons he had extended it and one reason he hadn''t mentioned. She accepted for the fourth reason."

**Paragraph 2 — Demonstrating the Framework at Work**

Describe one specific decision or action that illustrates the protagonist''s methodology. The decision should be counterintuitive by ordinary standards but obviously correct given the protagonist''s framework. Do not explain it — show it and let the reader puzzle at the logic. Show it paying off briefly, without celebration.

**Paragraph 3 — Indicating the Cost Without Resolution**

Introduce the story''s central tension: the framework is brilliant and the costs are real. Do not name the cost specifically — imply it. Close on a question the protagonist would ask, not a conventional protagonist. Not "will she survive?" but "at what point does the model become more important than what the model was built to protect?"

**Length**: 150-220 words total.

---

### Common Mistakes

1. **Titles that declare the protagonist''s intelligence** ("The Genius Among Fools"): The reader should conclude this — not be told.

2. **Synopses that begin with backstory**: "After losing her family at age twelve..." This story begins with the protagonist doing something. Start there.

3. **Synopses that describe the protagonist''s emotional journey**: "She will learn that not everything can be calculated." This is the wrong story. This story does not teach the protagonist that calculation has limits — it examines what it costs to live as though it does not.

4. **Titles borrowed from thriller convention**: "The Last Variable", "The Final Equation", "Checkmate". These signal a puzzle to be solved, not a mind to be inhabited.

5. **Synopses that make the protagonist sound villainous** through editorial adjectives: "ruthless", "manipulative", "cold-blooded". Let the actions speak. The reader will form their own assessment.

6. **Titles with no referent in the story**: A beautiful title that does not connect to a specific element of the narrative fails its function.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1),
  1,
  35,
  NOW()
)
ON DUPLICATE KEY UPDATE
  novel_creation_method_id = VALUES(novel_creation_method_id),
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
