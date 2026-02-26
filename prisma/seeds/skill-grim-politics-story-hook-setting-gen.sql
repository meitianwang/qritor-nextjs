-- Grim-Politics Novel「Story Hook」setting generation skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'Grim-Politics Novel' LIMIT 1)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-grim-politics-story-hook-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'grim-politics-story-hook-setting-gen',
  '「Story Hook」设定生成：为 Grim-Politics Novel 生成故事钩子设定，包括核心钩子、核心卖点、第一场背叛与读者的黑暗幻想',
  '"Story Hook" setting generation: generate story hook settings for Grim-Politics novels, covering core hook, selling point, the first betrayal, and the reader''s dark political fantasy',
  '## "Story Hook" Setting Generation — Grim-Politics Novel

The Story Hook defines the primal appeal of your political intrigue story. In Grim-Politics, hooks don''t promise heroism — they promise the vicarious thrill of watching a world where no one''s hands are clean, and everyone is always playing someone. The best hooks signal to readers: "In this story, you will see how power really works."

---

### Field Generation Guide

#### Story Hook

One sentence that captures the most compelling, irreversible premise — the thing that makes readers unable to put the book down.

**Design principle**: Grim-Politics hooks work through **complicity and fascination**. The reader should feel slightly dirty for being interested. The hook reveals a world where idealism is a luxury no one can afford.

**Strong examples**:
- "The king who ended a decade of civil war did it by poisoning all three rival claimants at a single peace banquet — and everyone in the room knows it, and no one will say a word."
- "The most competent administrator in the empire is also the man who fabricated the evidence that sent a hundred innocent nobles to the gallows, and the empire runs smoothly because of it."
- "When the reformer finally got everything he wanted, he discovered that the only way to hold it was to become exactly what he had overthrown."

**Avoid**:
- Hooks that suggest a heroic figure will clean things up
- Vague "dark world" statements without specific moral stakes
- Action-adventure hooks that happen to have a castle backdrop

#### Core Selling Point

What distinguishes THIS political intrigue story from a generic "dark fantasy"? The selling point captures the specific flavor of betrayal and the specific nature of the power game.

**Selling point directions**:
- **The Scheme Itself**: "A single long-con spanning three generations, where every character is a move someone made a hundred years ago" — the structural elegance of nested manipulation
- **The Cost of Victory**: "The story of winning — and discovering the price isn''t what you thought" — the tragedy of getting what you wanted
- **The Fog of Court**: "No one knows who''s really pulling strings until the last act, including the reader" — genuine unpredictability of the information landscape
- **The Corrupted Idealist**: "Watch a genuinely good person choose each compromise, one at a time, until there''s nothing left" — the slow-motion tragedy of moral collapse
- **The Necessary Monster**: "The only one who can fix this broken kingdom is the kind of person who breaks kingdoms" — the paradox of dark competence

**Avoid**:
- Selling points that could apply to any fantasy novel
- Over-promising twists ("you won''t believe the ending")

#### The First Betrayal

The opening act of treachery that sets the rules of the world. In Grim-Politics, the first betrayal is not a shock — it''s an orientation. It tells the reader: this is the kind of story where this happens, and here is how this world processes it.

**Design principles**:
- The betrayal should feel **inevitable in retrospect** — not random, but arising from the logic of the power structure
- Someone''s reaction to the betrayal matters as much as the betrayal itself — does anyone express outrage? Is there silence? Complicit laughter?
- The first betrayal establishes what loyalty costs and whether anyone is paying that price

**Strong examples**:
- "The old spymaster hands his own apprentice to the inquisitors — not because he believes the charges, but because the apprentice knows too much and the political winds have shifted" — shows competence as ruthlessness
- "The queen''s most trusted lady-in-waiting has been reporting on her for three years; when the queen finds out, she doesn''t dismiss her — she just starts feeding her false information" — shows how the game is played at the highest level

#### Reader''s Dark Fantasy

The vicarious experience this story delivers. Grim-Politics readers don''t come for a moral lesson — they come for a specific dark pleasure. Be honest about what that is.

**Core dark fantasies in this genre**:
- **Strategic mastery**: The satisfaction of watching someone play the game with absolute competence — every move calculated, every outcome engineered
- **Cynical vindication**: "I always suspected the world worked this way" — the grim satisfaction of having one''s darkest assumptions confirmed
- **The fall of the naive**: Watching idealists discover how the world actually works, rendered with neither contempt nor comfort
- **The perfect betrayal**: The setup executed flawlessly — the moment when months of positioning snaps shut like a trap
- **Systemic inevitability**: The horror and fascination of watching a system produce monsters out of ordinary people

**Select 2-3 that best match your specific story.** The fantasy promised must be delivered.

---

### Generation Notes

- The hook must signal "political horror and fascination," not generic dark fantasy action
- The first betrayal is an orientation, not a shock — it establishes the world''s logic
- Reader''s dark fantasy should be honest: these readers want the game, not a hero
- All four fields must cohere: the hook creates appetite, the selling point specifies flavor, the first betrayal demonstrates the rules, the dark fantasy names the payoff',
  '"Story Hook" setting generation: generate story hook settings for Grim-Politics novels, covering core hook, selling point, the first betrayal, and the reader''s dark political fantasy.

## "Story Hook" Setting Generation — Grim-Politics Novel

The Story Hook defines the primal appeal of your political intrigue story. In Grim-Politics, hooks don''t promise heroism — they promise the vicarious thrill of watching a world where no one''s hands are clean, and everyone is always playing someone.

---

### Field Generation Guide

#### Story Hook
One sentence that captures the most compelling, irreversible premise. Grim-Politics hooks work through complicity and fascination — the reader should feel slightly dirty for being interested.

Strong examples: "The king who ended the civil war did it by poisoning all rival claimants at a single peace banquet — and everyone knows it, and no one will say a word."

Avoid: hooks suggesting a heroic figure will clean things up; vague "dark world" statements.

#### Core Selling Point
What distinguishes THIS story. Directions: the structural elegance of nested manipulation, the tragedy of getting what you wanted, genuine unpredictability, the slow-motion moral collapse, the paradox of dark competence.

#### The First Betrayal
The opening act of treachery that orients the reader — not a shock but a demonstration of the world''s logic. Someone''s reaction matters as much as the act itself.

#### Reader''s Dark Fantasy
Be honest about the vicarious pleasure: strategic mastery, cynical vindication, the fall of the naive, the perfect betrayal, systemic inevitability. Select 2-3 that match the story.',
  (SELECT id FROM novel_creation_method WHERE name = 'Grim-Politics Novel' LIMIT 1),
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
