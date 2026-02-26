-- Grim-Politics Novel「Character」generation skill (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-grim-politics-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'grim-politics-character-gen',
  '「角色」生成：为 Grim-Politics Novel 生成政治阴谋角色，涵盖公开面具与真实议程、政治资产、致命弱点与背叛可能性',
  '"Character" generation: generate characters for Grim-Politics novels, covering public masks vs. true agendas, political assets, fatal weaknesses, and betrayal potential',
  '## "Character" Generation — Grim-Politics Novel

Grim-Politics characters are defined by the gap between what they show and what they want, and by the specific nature of the compromises they have made or are willing to make. In this genre, there are no heroes — only players at different levels of ruthlessness, self-awareness, and strategic competence.

Every character should answer the question: **What are they willing to sacrifice, and what are they not — and is the thing they won''t sacrifice the thing that will destroy them?**

---

### Field Generation Guide

#### Name

Names in Grim-Politics should feel appropriate to the cultural and historical register of the setting. Avoid names that signal heroism or destiny. The most dangerous spymaster in the realm should have the name of a minor court official.

#### Role

Each role carries a specific structural function in the political game:

| Role | Core Function | Design Considerations |
|------|-------------|----------------------|
| **The Ruler (Bad or Worse)** | Occupies the throne or its equivalent; has formal power; may or may not have real power | The ruler''s defining quality is not their cruelty but their specific relationship to information and dependency; what they don''t know is what will kill them |
| **The Spymaster** | Controls information; knows what everyone else is doing | The spymaster''s danger: they can be replaced if a ruler feels threatened by their knowledge; they know too much and are always one suspicion away from the dungeon |
| **The Power Behind the Throne** | Formally subordinate; actually decisive | Must maintain the facade of subordination while exercising real power; if they ever appear threatening, they''ve failed |
| **The General** | Controls force; the most straightforward kind of power | A general who wins too many battles becomes a threat; the question is always whether their loyalty is to the institution or to the person who commands them |
| **The Kingmaker** | Makes rulers rather than becoming one | Their power evaporates the moment their puppet no longer needs them; the only way to maintain it is to ensure the ruler always needs them |
| **The Schemer Without a Crown** | Operates outside formal structures; uses leverage, information, or wealth | The most flexible position; the most vulnerable to formal authority if exposed |
| **The Idealist Being Broken** | Enters the game believing in something; is being systematically disabused of it | The tragedy of this character is that they are right about what is wrong, and helpless to fix it without becoming part of it |
| **The Expendable Loyalist** | Actually believes in their principal; will not defect | Rare and genuinely dangerous, because they cannot be bought; must be destroyed, not converted |
| **The Useful Enemy** | An antagonist whose existence serves the protagonist''s interests | The moment they are defeated, the protagonist loses a tool; some enemies should not be destroyed |
| **The Wildcard** | Outside the normal logic of the game; unpredictable | The most dangerous kind of player, because they don''t follow the rules everyone else agrees to follow |

#### Public Face

The mask the character maintains for public consumption. In Grim-Politics, every serious player has one, and it is almost never their real self.

**Design principles**:
- The public face should be strategically chosen — what impression serves the character''s goals?
- The gap between the public face and the true agenda should be visible to the reader, not just asserted
- The most effective public faces are credible: they contain elements of truth, which is what makes them convincing

**Examples of useful public faces**:
- The loyal servant who is actually running their own agenda
- The incompetent fool whose incompetence is deliberately performed
- The zealot whose zeal is entirely manufactured
- The moderate who is negotiating the price of their betrayal

#### True Agenda

What the character actually wants, beneath all performance. In Grim-Politics, agendas should be concrete and achievable, not abstract ("power" is not an agenda — "the throne for my son before my master''s heir takes it" is an agenda).

**Agenda categories**:
- **Survival**: The most basic agenda; the character simply does not want to die or be destroyed
- **Security**: Personal or familial safety extended to the next generation; keeping what they have
- **Vengeance**: A specific wrong to be repaid; the most emotionally compelling agenda but also the most blinding
- **Ideological**: An actual belief about how the kingdom should be governed; the rarest and most dangerous
- **Legacy**: Being remembered; building something that outlasts them — the most poignant agenda in a genre where nothing lasts

#### Political Assets

The resources the character can actually bring to bear:

- **Loyal forces**: Soldiers, guards, or enforcers who will act on personal orders
- **Financial leverage**: Debt, investment, or control of revenue streams
- **Information**: What they know about others, and the networks through which they acquire new information
- **Family ties**: Dynastic connections, marriage alliances, blood loyalty
- **Blackmail material**: Proof of crimes or secrets others need kept secret
- **Institutional position**: Formal authority that others must respect, even when they wish they didn''t
- **Reputation**: How others perceive them; the social capital that enables them to make asks

#### Fatal Weakness

The vulnerability that a sufficiently ruthless enemy can exploit. In Grim-Politics, every player has one, or they are not interesting.

**Categories**:
- **A person they won''t sacrifice**: A child, a sibling, a lover — someone their enemies will use as a hostage or a weapon
- **A line they won''t cross**: An action they refuse to take regardless of cost; their one remaining moral absolute
- **A secret that would undo them**: Something in their past that would destroy their current position if revealed
- **An illusion they cling to**: A false belief about someone or the world that they will not relinquish, and that their enemies can exploit
- **A competence gap**: Something they are genuinely bad at that others know how to exploit

#### Betrayal Potential

How likely this character is to betray their current allies, and under what circumstances. In Grim-Politics, everyone has a price — but what that price is defines the character.

| Potential | Description | Story Function |
|-----------|-------------|----------------|
| **Committed** | Will not betray; but this is a choice, not a trait, and the price they won''t accept defines them | Creates the tragedy when even they eventually break |
| **Calculating** | Will betray when the math is right; the question is the math | Provides a character whose loyalty can be maintained through sufficient incentives or threats |
| **Desperate** | Will betray under sufficient pressure; the pressure is already building | The ticking-clock character; the reader watches them getting closer to the breaking point |
| **Already Betraying** | Is in the process of betrayal; the question is when it will be discovered | Creates dramatic irony; the reader knows what the principal doesn''t |
| **Constitutionally Incapable** | Cannot betray; not from loyalty but from personality | The most dangerous character in a room full of schemers, because they cannot be predicted or reasoned with |

#### Current Political Standing

Their position in the power hierarchy at this point in the story — and whether that position is stable, rising, or falling. This field should change over the course of the story.

#### Known Allegiances

Their current public alliances — and any fractures beginning to show. This field captures the gap between the alliance as it appears and as it actually is.

---

### Character Lineup Recommendations

**Standard ensemble**:
1. **The Central Player**: Not the most powerful figure, but the most capable — the one the reader follows as they navigate the game
2. **The Ruler**: Formally above the central player; defines the constraints the player must work within
3. **The Rival**: Pursuing the same goal through different means; must be genuinely credible
4. **The Idealist Being Broken**: Provides moral counterweight; their failure or corruption is part of the story
5. **The Loyal Subordinate**: Will follow the central player — and should be put in a position where that loyalty is exploited

**Grim-Politics specific rules**:
- Avoid characters whose loyalty is guaranteed unconditionally — everyone should have a price, even if it''s a very high one
- The most dangerous characters are the ones with nothing left to lose
- At least one character should believe in the official ideology sincerely; their sincerity is both moving and useful to others

---

### Setting Linkage

| Setting Module | Impact on Character |
|---------------|---------------------|
| **Core Premise** | Story Archetype → suggests which role types should be most prominent; Moral Framework → sets the limit on what characters will do |
| **Political Landscape** | Government System → determines which roles have institutional backing; Power Centers → specifies what assets are available |
| **Magic & Dark Arts** | Magic Presence → determines whether magic is a character option; Who Wields It → creates specific character types |
| **Writing Style** | Narrative POV → determines how much of any character''s interiority the reader sees |

---

### Common Errors

1. **Characters whose loyalty is never tested**: Loyalty in Grim-Politics is only meaningful when it''s difficult
2. **The public face and the true agenda are identical**: No serious political player exposes their real agenda
3. **Fatal weaknesses that are never exploited**: Every introduced weakness should eventually be used against the character
4. **The Expendable Loyalist who actually betrays**: If a character is defined by unconditional loyalty, their betrayal is a cheap twist; their steadfastness is the interesting thing
5. **Characters who grow and redeem**: Grim-Politics characters are shaped by their compromises, not healed from them; the trajectory is hardening, not softening
6. **Political assets with no costs**: Every asset comes with obligations, vulnerabilities, or prices; a spy network requires running agents who might be turned',
  '"Character" generation for Grim-Politics novels.

Every character should answer: What are they willing to sacrifice, and what are they not — and is the thing they won''t sacrifice the thing that will destroy them?

### Roles
The Ruler (formal power, may lack real power), The Spymaster (knows too much — one suspicion from the dungeon), The Power Behind the Throne (maintain facade of subordination while exercising real power), The General (loyalty to institution vs. person), The Kingmaker (power evaporates when puppet no longer needs them), The Schemer Without a Crown, The Idealist Being Broken, The Expendable Loyalist (cannot be bought — must be destroyed), The Useful Enemy (defeat them and lose a tool), The Wildcard (doesn''t follow the rules everyone else agreed to).

### Public Face
Strategically chosen; contains elements of truth. Examples: the loyal servant running their own agenda; the performed incompetence; the manufactured zealot; the moderate negotiating their betrayal price.

### True Agenda
Concrete and achievable: Survival, Security (keep what they have), Vengeance (specific and blinding), Ideological (rarest — most dangerous), Legacy (build something that outlasts them).

### Political Assets
Loyal forces, financial leverage, information networks, family ties, blackmail material, institutional position, reputation.

### Fatal Weakness
A person they won''t sacrifice / a line they won''t cross / a secret that would undo them / an illusion they cling to / a competence gap.

### Betrayal Potential
Committed (loyalty as a choice, defines the price they won''t accept), Calculating (betray when math is right), Desperate (pressure is already building), Already Betraying (dramatic irony), Constitutionally Incapable (cannot be predicted).',
  (SELECT id FROM novel_creation_method WHERE name = 'Grim-Politics Novel' LIMIT 1),
  1,
  21,
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
