-- Grim-Politics Novel「Plot Design」domain knowledge skill (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-grim-politics-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'grim-politics-plot-gen',
  '「情节设计」领域知识：为 Grim-Politics Novel 提供剧情设计指导，涵盖权谋博弈结构、政治转折节奏、背叛弧线设计与伏笔策略',
  '"Plot Design" domain knowledge: plot design guidance for Grim-Politics novels, covering political scheme structure, betrayal arc design, power-shift timing, and foreshadow strategy',
  '## "Plot Design" Domain Knowledge — Grim-Politics Novel

Grim-Politics plots are not driven by quests or battles — they are driven by **schemes encountering counterschemes**, by the accumulation of position and leverage, and by the inevitable moment when someone''s carefully constructed edifice collapses, usually from within. The signature emotional experience is not triumph but the feeling of watching something both inevitable and terrible unfold, with the reader understanding exactly how it happened.

The key structural tension is between **information and action**: political stories live in the gap between what characters know, what they think they know, and what the reader knows. Plot design in this genre is fundamentally information architecture.

---

### Typical Story Structure

Grim-Politics stories typically follow a "construction-complication-collapse" structure rather than the hero''s journey:

| Phase | Chapter Ratio | Core Task | Dominant Event Types |
|-------|--------------|-----------|---------------------|
| **Establishment** | 10-15% | Introduce the board — who the players are, what they want, what the current balance is | Exposition via action; the first betrayal that sets the rules; reveals of existing schemes |
| **Accumulation** | 20-25% | Protagonists build position; factions make their moves; alliances form and first fractures appear | Scheme execution; recruitment; leverage-building; the first costs appear |
| **Escalation** | 25-30% | The board becomes unstable; multiple schemes begin to interact; the cost of maintaining positions rises | Betrayals; reversals; escalating stakes; the price of past decisions comes due |
| **Crisis** | 15-20% | The moment when the schemes snap shut — or shatter; someone wins, someone loses, nothing is the same | The great betrayal; the fall of a major player; the revelation that changes everything |
| **Aftermath** | 10-15% | What victory looks like; what it cost; what the new order is — and what''s wrong with it | Resolution of remaining threads; the "winning is losing" moment; the new balance, already unstable |

**Grim-Politics pacing note**: The most important chapters are the ones where the reader understands what is about to happen before the characters do. The accumulation phase should be building dread, not suspense — dread because the reader can see where this is going.

---

### Story Line Patterns

#### Main Line (typically 1-2)

- **The Central Scheme**: The protagonist''s primary political project — the thing they are building and protecting
- **The Counter-Scheme**: What the antagonist (individual or structural) is doing in response, or independently
- **The Larger Game**: The overarching political situation that the individual schemes are nested within

#### Common Branch Lines

| Branch Type | Description | Relationship to Main |
|------------|-------------|---------------------|
| **The Betrayal Arc** | A secondary character''s journey from ally to enemy (or vice versa) | Often the emotional heart of the story; should run parallel and intersect at a climactic moment |
| **The Idealist Thread** | A character who believes in the official ideology encountering reality | Provides moral counterweight; their failure or corruption is part of the genre''s argument |
| **The Information Arc** | Who knows what — a line of information that reveals the true shape of the game | The structural spine; resolves at the Crisis phase |
| **The Price Line** | The accumulating cost of the protagonist''s choices — what they are becoming | The character arc; should make the Aftermath phase feel earned |
| **The External Threat** | Something beyond the current factional struggle that everyone is ignoring or exploiting | Used to force unexpected alliances or to reveal who cares about anything beyond personal gain |

---

### Event Arrangement Patterns

#### Establishment Phase

- **The opening betrayal**: The first scene should establish the rules — not through exposition but through event; show someone being betrayed and how everyone around them processes it
- **The board introduction**: Each major faction and player is introduced in action, not description; each introduction should reveal something about the political balance
- **The protagonist''s position**: Where the central player sits, what they want, and what the first obstacle is — clearly established before the accumulation phase begins
- Event importance: 2-4 (the opening betrayal is 4-5, establishing events are 2-3)

#### Accumulation Phase

- **Scheme moves**: Each chapter should advance at least one scheme by one move; readers should be able to track the game
- **Recruitment and leverage-building**: The protagonist acquires allies and assets; each acquisition should cost something and create a vulnerability
- **First fractures**: Alliances that seemed stable should show their first cracks; trust is expensive and the reader should start to feel the cost
- **The planted reversal**: Something introduced in accumulation that will detonate in escalation — the audience may not see it, but it should be visible on re-read
- Event importance: 2-4

#### Escalation Phase

- **The triggered betrayal**: Someone the protagonist trusted — or relied on — chooses differently; this should be both surprising and inevitable in retrospect
- **The cost comes due**: A decision made in accumulation produces its consequence; the price of past choices becomes concrete
- **Multiple schemes collide**: At least two running plots should intersect in a way neither party planned; the interaction creates new information and new problems
- **The false resolution**: A moment where it appears the crisis has been resolved — but the reader (if not the character) should sense that the real problem hasn''t been addressed
- Event importance: 3-5

#### Crisis Phase

- **The great revelation**: The full shape of the game becomes visible — the player who has been running the board is revealed; the scheme that encompassed all other schemes completes
- **The cost of winning**: If the protagonist wins, the cost of their victory is made concrete here; the throne is a cage; the enemy''s defeat has unintended consequences
- **The structural inevitability**: The reader should feel that this outcome was built into the initial conditions — not that the plot manipulated characters into it, but that the characters'' choices, consistently followed, produced this result
- Event importance: 4-5

#### Aftermath Phase

- **The new order**: What the world looks like after the crisis; who won and what winning means
- **The remaining vulnerabilities**: The new power structure should already contain the seeds of its own eventual collapse — Grim-Politics stories don''t end in stability
- **The final note**: The last scene should resonate with the opening — either rhyming with it (the same betrayal pattern, now the protagonist performing it) or providing ironic counterpoint
- Event importance: 3-4

---

### Foreshadow Strategy

#### Core Types

| Foreshadow Type | How to Use | When to Plant | When to Detonate |
|----------------|-----------|--------------|-----------------|
| **The Established Rule** | State explicitly how the game works; this rule will be broken at a decisive moment | Accumulation | Crisis |
| **The Planted Loyalty** | Show a character making a small choice that reveals where their true loyalty lies | Establishment | Escalation or Crisis |
| **The Unused Asset** | A resource or relationship introduced early that seems minor; becomes decisive later | Accumulation | Crisis |
| **The Suppressed Fracture** | An internal division in a faction that the leadership is actively managing; it will stop being manageable | Accumulation | Escalation |
| **The Introduced Weakness** | A character''s fatal flaw, shown in low-stakes context first | Establishment | Crisis |
| **The Second Meeting** | A minor character met in accumulation who turns out to be the pivot point | Accumulation | Escalation |

#### Grim-Politics specific techniques

- **The visible betrayal setup**: Unlike mystery plots, Grim-Politics often lets the reader see the betrayal coming; the dread is not "will it happen" but "when will the victim realize" — plant the evidence in plain sight
- **The ideology as foreshadow**: A character''s stated beliefs are a promise of what they will refuse to do — and in Grim-Politics, that refusal will eventually destroy them
- **The cost prophecy**: When a character makes a choice, have someone (or the character themselves) articulate what it will cost — this foreshadow is fulfilled when the cost actually comes due
- **The structural rhyme**: An early event that mirrors a later, more consequential one — the second time, the reader recognizes the pattern

---

### Common Errors

1. **The scheme works because the adversary is stupid**: Political adversaries in Grim-Politics should be competent; the protagonist should win through superior information, position, or willingness to pay a higher cost — not because the villain makes convenient mistakes
2. **Betrayals that are purely shocking**: In Grim-Politics, betrayals should be both surprising and inevitable in retrospect; if the reader didn''t see it coming but can''t understand it on reflection, it''s a trick, not a plot
3. **The protagonists achieve clean victories**: In this genre, winning should cost more than the reader expected; the aftermath should make the victory feel ambiguous
4. **Information reveals that stop the story**: When the full shape of the game is revealed, it should accelerate the story, not pause it for exposition
5. **Factions that act as monoliths**: Real political bodies have internal politics; faction decisions should reflect internal debate and compromise, not unified command
6. **The idealist succeeds without cost**: The idealist arc in Grim-Politics ends in failure, corruption, or tragic success that produces something worse than what they were fighting',
  '"Plot Design" domain knowledge for Grim-Politics novels.

Plots driven by schemes encountering counterschemes; accumulation of position and leverage; the inevitable moment when a carefully constructed edifice collapses from within. Core experience: watching something both inevitable and terrible unfold.

### Typical Story Structure
Establishment (introduce the board; the first betrayal sets the rules) → Accumulation (build position; first costs appear; plant the reversal) → Escalation (schemes interact; betrayals; cost comes due) → Crisis (the great revelation; winning is a cage) → Aftermath (new order already containing seeds of collapse).

### Story Lines
Main: The Central Scheme + The Counter-Scheme + The Larger Game. Branches: Betrayal Arc (emotional heart), Idealist Thread (their failure is the genre''s argument), Information Arc (who knows what), Price Line (what the protagonist is becoming), External Threat (reveals who cares about anything beyond personal gain).

### Foreshadowing
The Established Rule (will be broken at Crisis), The Planted Loyalty, The Unused Asset, The Suppressed Fracture, The Introduced Weakness, The Second Meeting. Key technique: visible betrayal setup — let the reader see it coming; the dread is "when will the victim realize," not "will it happen."

### Common Errors
Adversary stupidity wins the day; betrayals that are only shocking (not inevitable in retrospect); clean victories; monolithic factions; the idealist succeeds without cost.',
  (SELECT id FROM novel_creation_method WHERE name = 'Grim-Politics Novel' LIMIT 1),
  1,
  30,
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
