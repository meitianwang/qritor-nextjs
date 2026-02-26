-- Grim-Politics Novel「Core Premise」setting generation skill (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-grim-politics-core-premise-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'grim-politics-core-premise-setting-gen',
  '「Core Premise」设定生成：为 Grim-Politics Novel 生成核心前提设定，包括故事原型、权力斗争类型、道德框架与终局愿景',
  '"Core Premise" setting generation: generate core premise settings for Grim-Politics novels, covering story archetype, power struggle type, moral framework, and endgame vision',
  '## "Core Premise" Setting Generation — Grim-Politics Novel

The Core Premise establishes the fundamental architecture of the political game — what kind of struggle is being played, who the central player is, and what moral universe this story inhabits. In Grim-Politics, the premise must make one thing clear: there are no clean hands here. The question is only how far each player will go, and what it costs them.

---

### Field Generation Guide

#### Story Archetype

The structural shape of the power game. Each archetype implies a different kind of player, a different kind of endgame, and a different emotional register.

| Archetype | Core Dynamic | Emotional Register |
|-----------|-------------|-------------------|
| **The Usurper Rising** | Someone building power illegitimately — or legitimately, in a system that makes legitimacy meaningless | Cold ambition; the pleasure of watching someone build what they have no right to build |
| **The Puppetmaster''s Game** | The most powerful figure in the story is never the one on the throne | Paranoia; the unease of never knowing who is actually deciding |
| **The Kingmaker''s Gambit** | Someone whose power is entirely derived from installing others — and the trap that creates | The tragedy of power without authority; what happens when your puppet no longer needs you |
| **The Succession War** | Multiple claimants, multiple factions, a throne that will break whoever sits on it | Operatic scale; the mathematical elegance of watching coalitions form and shatter |
| **The Empire''s Twilight** | A system in terminal decline — the game is now about who controls the collapse, not who inherits a healthy state | Melancholy and complicity; everyone is looting a sinking ship and knows it |
| **The Revolutionary''s Betrayal** | Someone who set out to tear down the corrupt system and is now becoming it | The bitterest irony; structural determinism |
| **The Spy at the Center** | Information asymmetry as the primary power resource | Paranoia; the fun of knowing more than any other character |

**Archetype Details**: Elaborate on the specific variation — what makes this instance of the archetype fresh. What is the particular angle, the specific moral pressure point, the thing that makes this story different from the last succession war you read?

#### Central Power Struggle

The specific axis of conflict — what kind of institutions are grinding against each other.

- **Throne Succession**: Classic and endlessly generative — the crown is a curse that people kill for
- **Military vs. Court**: The tension between those who hold force and those who hold legitimacy
- **Old Nobility vs. New Order**: The resentment of displacement against the arrogance of novelty
- **Occupied Nation vs. Empire**: The collaboration problem — who is a patriot and who is a collaborator, and is there a difference?
- **Church vs. Crown**: Two claims to ultimate authority that cannot both be true
- **Merchant Class vs. Aristocracy**: Money dissolving the old hierarchies, and the violence of the reaction
- **Foreign Interference in Civil War**: Factions that don''t realize (or pretend not to realize) they''re proxies

#### Moral Framework

This is the engine of the story''s philosophy. Grim-Politics is built on a specific claim: that idealism is either a lie or a luxury. The moral framework specifies which flavor of this claim the story makes.

- **Pure Consequentialism — Results Are All That Matter**: The story validates its most ruthless actors. What works, works. The only sin is ineffectiveness. Readers who want vicarious strategic mastery should be here.
- **Pragmatism with Buried Guilt**: Players do what they must, but they know it. The cost is psychological, not systemic. This framework produces characters who are tragic in the classical sense.
- **Cycles of Revenge Mistaken for Justice**: No one is doing wrong — everyone is settling a score. The horror is that everyone is right and therefore nothing will ever stop. This produces a kind of systemic nihilism.
- **Everyone Believes Their Atrocities Are Necessary**: The most disturbing framework. No one is a villain in their own story. Every massacre has a manifesto. The reader is implicated in being able to understand everyone''s logic.
- **No One Believes in Anything Anymore**: Late-stage cynicism. The ideology is gone; only the mechanics of power remain. Characters maintain positions purely out of habit, self-interest, or inertia.

#### Story Tone

The emotional register of how the story is told — not what happens, but how it feels to read it.

- **Cold and Calculating**: The author''s eye is clinical. Events are described without heat. The reader admires the machinery even as it grinds people up.
- **Operatically Tragic**: The scale is large and the emotions are large. Betrayals have grandeur. Deaths are meaningful. The darkness is Shakespearean.
- **Cynical and Biting**: The story has a sharp sense of humor about its own bleakness. Irony is structural.
- **Creeping Dread**: Political horror played as dread. The reader knows something terrible is coming and cannot look away.
- **Bleak Inevitability**: The story is about systems producing outcomes that no individual wants. The feeling is of watching a slow-motion disaster.

#### The Endgame

What does winning look like in this story, and why might it be indistinguishable from losing?

**Grim-Politics endgames**:
- The throne is won — and the winner discovers it''s a cage
- The revolution succeeds — and becomes the thing it replaced
- The scheme is completed — and the schemer finds the result empty or monstrous
- The collapse is prevented — at a cost that makes the survival morally equivalent to the destruction
- The truth is revealed — and no one with power wants to act on it

**Write a specific vision of the endgame** — what is the concrete situation at the story''s end, and what does it cost the central player? A good Grim-Politics endgame should make the reader feel that the story was inevitable from the first page.

---

### Field Linkage

- Story Archetype → shapes the cast structure (a Puppetmaster story needs a visible front and an invisible back)
- Central Power Struggle → defines which institutions populate the organization module
- Moral Framework → must be consistent with what characters are willing to do (Pure Consequentialism cannot coexist with a character who sacrifices victory for principle)
- The Endgame → should already be implied in the Story Hook: the first page and the last page must belong to the same story

### Common Errors

1. **Choosing a moral framework but not committing**: Saying "Pure Consequentialism" and then having characters refuse to do things for no reason
2. **The Endgame is secretly optimistic**: A character learns, grows, or redeems themselves — this is a different genre
3. **Story Archetype without specificity**: "Succession War" with no detail about what makes this one interesting
4. **Tone inconsistency**: Calling it "Bleak Inevitability" and then writing scenes of heroic triumph
5. **The power struggle is generic**: "Good people vs. bad people for the throne" — Grim-Politics requires that both sides are morally compromised',
  '"Core Premise" setting generation for Grim-Politics novels.

## "Core Premise" Setting Generation — Grim-Politics Novel

Establishes the fundamental architecture of the political game. No clean hands. The question is only how far each player will go.

### Story Archetype
The Usurper Rising (illegitimate power-building), The Puppetmaster''s Game (the real power is never on the throne), The Kingmaker''s Gambit (power without authority), The Succession War (coalition mathematics), The Empire''s Twilight (looting the sinking ship), The Revolutionary''s Betrayal (becoming what you overthrew), The Spy at the Center (information asymmetry).

### Central Power Struggle
Throne Succession / Military vs. Court / Old Nobility vs. New Order / Occupied Nation vs. Empire / Church vs. Crown / Merchant vs. Aristocracy / Foreign Interference.

### Moral Framework
Pure Consequentialism (results only), Pragmatism with Buried Guilt (do what you must, know the cost), Cycles of Revenge Mistaken for Justice (everyone is settling a score), Everyone Believes Their Atrocities Are Necessary (most disturbing — no villain in their own story), No One Believes in Anything Anymore (pure mechanics, ideology gone).

### Story Tone
Cold and Calculating / Operatically Tragic / Cynical and Biting / Creeping Dread / Bleak Inevitability.

### The Endgame
Winning must be indistinguishable from losing. The throne is a cage; the revolution becomes what it replaced; the scheme completes and the result is monstrous. Endgame must be implied from page one.',
  (SELECT id FROM novel_creation_method WHERE name = 'Grim-Politics Novel' LIMIT 1),
  1,
  11,
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
