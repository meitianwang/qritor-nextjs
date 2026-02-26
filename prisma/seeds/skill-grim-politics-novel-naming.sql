-- Grim-Politics Novel「Novel Naming」skill (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-grim-politics-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'grim-politics-novel-naming',
  '小说命名：为 Grim-Politics Novel 生成书名和内容简介，提供政治阴谋类型美学与唯结果论风格的命名指导',
  '"Novel Naming": generate titles and synopses for Grim-Politics novels, providing naming guidance consistent with dark political intrigue aesthetics and consequentialist themes',
  '## Novel Naming — Grim-Politics Novel

The best Grim-Politics titles do one of two things: they name a political reality with cold precision, or they make an ironic promise. The title should signal to readers: this is a story about how power actually works, not how we wish it would. It should create appetite for a specific kind of darkness — not gore or horror, but the discomfort of recognition.

---

### Naming Philosophy

Three registers that work in this genre:

1. **Cold Precision**: The title states a political fact so cleanly that it implies a whole world — "The Kingmaker", "No Succession", "The Interim Council". The reader instantly knows what kind of story this is.

2. **Ironic Title**: The title names something the story will systematically undercut — a virtue, an ideal, a promise. "The Loyal Subject" as the title of a story about a spymaster; "The Good King" as the title of a story about a succession that produces only monsters.

3. **The Name of the Game**: The title names the specific form the political game takes in this story — "The Long Parliament", "Throne of Ash", "The Price of the Crown". It promises readers a specific kind of political drama.

---

### Common Title Formats

**Format 1: The Office or Title**
- Structure: A political position + optional modifier
- Examples: *The Spymaster*, *The Last Regent*, *The Kingmaker''s Apprentice*, *The Interim Council*
- Fits: Stories centered on a single political role and what it demands of the person who holds it
- Works because: Instantly signals the political register; readers of this genre know what these roles mean

**Format 2: The Abstracted Virtue or Quality (Ironic)**
- Structure: A single virtue or abstract quality — one that the story will subject to systematic pressure
- Examples: *Loyalty*, *The Good King*, *Justice*, *The Honest Man*
- Fits: Stories about the destruction of ideals; the corrupted idealist arc
- Works because: The gap between the title and the story is itself the argument

**Format 3: The Political Event**
- Structure: The name of the central event, crisis, or scheme
- Examples: *The Succession*, *The Winter Council*, *The Night of Seals* (a reference to a historic purge), *The Regency*
- Fits: Stories organized around a single central political event
- Works because: Promises a specific historical-feeling story

**Format 4: The Cost**
- Structure: A phrase naming what the game costs its players
- Examples: *The Price of the Throne*, *What the Crown Demands*, *The Weight of Loyalty*, *At the King''s Pleasure*
- Fits: Stories about characters being destroyed by the positions they occupy
- Works because: Promises the genre''s central emotional experience — watching power exact its price

**Format 5: The Specific Geographic or Political Descriptor**
- Structure: A place name or kingdom name that implies a specific political character
- Examples: *The Gates of Vael*, *The Ironmark Succession*, *Thrones of the Pale Kingdoms*
- Fits: Stories with strong world-building where the political geography is specific and meaningful
- Works because: Makes the story feel embedded in a real world

---

### Title Vocabulary

| Category | Words |
|----------|-------|
| Power roles | Regent, Kingmaker, Spymaster, Chancellor, Inquisitor, Arbiter |
| Power structures | Crown, Throne, Seal, Charter, Compact, Council |
| Political acts | Succession, Abdication, Exile, Purge, Coup, Treaty |
| Abstract qualities (ironic use) | Loyalty, Honor, Justice, Mercy, Order, Virtue |
| Costs and prices | Price, Weight, Burden, Debt, Reckoning, Cost |
| Time and process | Interim, Regency, Interregnum, After the Fall |
| Darkness without melodrama | Shadow, Winter, Ash, Silence, The Long Night |

---

### Title Quality Comparison

| Strong Title | Weak Title | Why |
|-------------|-----------|-----|
| *The Kingmaker''s Autumn* | *The Dark Throne* | Specific role + specific season implies declining power; "Dark Throne" is generic fantasy |
| *At the King''s Pleasure* | *Betrayed!* | Phrase captures the horror of absolute dependence with understatement; "Betrayed!" is melodrama |
| *The Loyalty of Wolves* | *Evil Politicians* | Implies a specific kind of conditional loyalty that the story will explore; the other is a plot summary |
| *The Interregnum* | *War for the Crown* | Single Latin word implies historical weight and a specific political condition; the alternative is action-focused |
| *What the Crown Costs* | *The Evil King* | Promises the genre''s central experience; the other makes the protagonist a hero by opposition |

---

### Synopsis Structure

**First Paragraph — The World and the Stakes**
Establish the political situation in concrete terms: what the power structure is, why it is unstable, and what the central player''s position within it is. Avoid adjectives like "dark" or "grim" — the setting should feel unstable through specific details, not through atmospheric adjectives. Don''t start with "In a world where..."

*Model*: Establish who holds power, who wants it, and what specific event has made the current arrangement unstable. One or two sentences of pure political situation.

**Second Paragraph — The Central Player and Their Problem**
Introduce the protagonist through their specific situation and specific dilemma. What do they want? What is standing in the way? What will they have to become to get it? Avoid framing the protagonist as morally superior — they should be interesting, capable, and compromised.

**Third Paragraph — The Escalating Price (Hook)**
The promise the story makes — not a plot spoiler, but the nature of the game. What is this person willing to do? What choice are they going to have to make? End on the question or the impossible position, not the answer.

**Length**: 200-350 words for full synopsis; 100-150 for short form.

---

### Common Errors

- ❌ "Dark" and "grim" as descriptors in the title or first line — the darkness should be implied by the situation, not labeled
- ❌ A protagonist described as the only one who can save the realm — this is a different genre
- ❌ The synopsis promises a hero''s journey arc (rise, fall, redemption) — Grim-Politics characters harden, they don''t redeem
- ❌ Fantasy clichés in the title (Dragon, Shadow Lord, Prophecy)
- ❌ Action-first synopsis that buries the political stakes
- ❌ Moral clarity in the synopsis — "the righteous struggle against the corrupt" describes epic fantasy, not Grim-Politics',
  '## Novel Naming — Grim-Politics Novel

Best titles either name a political reality with cold precision or make an ironic promise. Should signal: this is a story about how power actually works.

### Title Formats
1. **The Office or Title**: A political position + modifier (*The Spymaster*, *The Last Regent*, *The Kingmaker''s Apprentice*)
2. **Ironic Virtue**: A virtue the story systematically undercuts (*Loyalty*, *The Good King*, *The Honest Man*)
3. **The Political Event**: The central crisis or scheme (*The Succession*, *The Night of Seals*, *The Regency*)
4. **The Cost**: What the game costs its players (*The Price of the Throne*, *At the King''s Pleasure*, *What the Crown Demands*)
5. **Geographic/Political Descriptor**: Place name implying political character (*The Ironmark Succession*, *Gates of Vael*)

### Title Vocabulary
Roles: Regent, Kingmaker, Spymaster, Chancellor, Inquisitor. Structures: Crown, Throne, Seal, Charter, Council. Acts: Succession, Purge, Coup, Exile. Costs: Price, Weight, Burden, Debt, Reckoning. Ironic use: Loyalty, Honor, Justice, Mercy, Order.

### Synopsis Structure
1. **World and Stakes**: Political situation in concrete terms — who holds power, why it''s unstable, what the central player''s position is. No adjectives like "dark" or "grim" — instability through specifics.
2. **Central Player and Problem**: Who they are, what they want, what they''ll have to become. Not morally superior — interesting, capable, compromised.
3. **Escalating Price (Hook)**: What this person is willing to do; the impossible position. End on the question, not the answer.

### Common Errors
"Dark/grim" as descriptors; protagonist described as the realm''s only hope; redemption arc promised; fantasy clichés in title; moral clarity in synopsis.',
  (SELECT id FROM novel_creation_method WHERE name = 'Grim-Politics Novel' LIMIT 1),
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
