-- Entity Naming — The Vengeance Soul Novel
-- Layer 3 domain knowledge skill for naming characters, scenes, and factions
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-vengeance-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'vengeance-entity-naming',
  'Entity naming: provides naming guidance for characters, scenes, and enemy factions in The Vengeance Soul Novel',
  'Entity naming: provides naming guidance for characters, scenes, and enemy factions in The Vengeance Soul Novel',
  '## Entity Naming — The Vengeance Soul Novel

Naming in Vengeance Driven English fiction requires a specific aesthetic discipline. Names must carry weight without being theatrical, signal without announcing, and remain distinct in a cast that may be encountered over a long narrative. The naming philosophy across all entity types should reflect the genre''s core aesthetic: nothing is decorative. Everything serves the weight.

---

## I. Character Naming

### Naming Philosophy
Characters in Vengeance Driven fiction should have names that feel like they could belong to a real person in a real world — which makes the story''s weight more credible. Avoid names that feel borrowed from high fantasy, romance, or action thriller. The genre lives in a space where the mundane and the terrible coexist: ordinary names can carry extraordinary weight.

The protagonist may have two names: the name they were born with, and an identity they have constructed for the purposes of the revenge. Both should be considered.

### The Protagonist
- **The original name**: Something with genuine weight but no operatic flourish. Consider names that sound like they belong to a person rather than a character type.
- **Possible naming patterns**: Single strong syllable names (*Gareth*, *Cole*, *Maren*, *Saren*), or names with a plainness that stands out in a cast of grander names
- **The constructed identity**: If the protagonist operates under a false name, this name should be subtly different in register — slightly more ordinary, slightly more forgettable, specifically designed to not be remembered

### Primary Targets
- Names that connote establishment, legitimacy, and inherited status without being obviously villainous
- Consider: names that sound trustworthy, that carry the weight of old families or old institutions
- The target''s name should feel solid and comfortable — because that comfort is exactly what the protagonist is going to destroy
- Patterns: surnames with institutional resonance (*Vane*, *Aldric*, *Carew*, *Thornton*), given names from an older generation (*Edmund*, *Harlan*, *Cecily*, *Corvin*)

### Accomplices and Secondary Characters
- Accomplices should have names that blend in: not memorable enough to raise suspicion, but specific enough to be tracked across the narrative
- For characters whose guilt is ambiguous, consider names with a quality of ordinariness — they are not obviously villains because they are not obviously anything
- For characters who will be destroyed: their names should feel like they belong to a person, not a symbol

### The Ghost / Former Self Character
- A name that resonates with the protagonist''s pre-trauma identity
- If this character is from the same world as the protagonist was, their name may share an aesthetic register with the protagonist''s original name
- If this character represents the life the protagonist could have had, their name may suggest normalcy, domesticity, continuity

### Collateral Victims
- Deliberately ordinary names: the naming signals that this person is not a player in the protagonist''s drama, they are simply a life
- Give them full names, including surnames — this makes their accidental position in the narrative more painful

### Diversity Principles
- Do not make all targets share the same ethnicity or name origin
- Mix name origins within the same faction to reflect realistic institutional composition
- The protagonist''s original name and reconstructed identity can reflect any cultural background — vengeance is not culturally specific

---

## II. Scene Naming

### Naming Philosophy
Scenes in Vengeance Driven fiction should be named for what they are, not for what they feel like. The affect is carried by the scene''s content; the name should be direct and grounded. A name that announces "this is a sinister place" is doing work the prose should do.

### The Place It Happened
Name it as it was known when it was a neutral location:
- A house known by the family name: *Caldwell House*, *The Vane Estate*
- A location known by geography: *The Lower Mill*, *Thornfield Market*, *Aldric''s Bridge*
- Avoid names that announce its significance: "The Place of Betrayal" is not a name, it is a label

### Sanctuary of Obsession
- Named for what the protagonist uses it as, not what it is architecturally
- Often an inherited or rented space with a plain name: *The Room above the Tannery*, *No. 4 Winter Lane*, *The Cellar Workshop*
- May have a personal designation the protagonist uses internally that readers never see in narration

### Enemy Domain
- Named with the legitimacy the enemy has constructed: *Vane Hall*, *The Thornton Seat*, *The Order House*, *House Carew*
- The name should sound like the enemy''s public face — solid, established, respectable
- Avoid names with obviously gothic or sinister overtones: *Blackthorn Manor* announces its function

### Public Stage
- Named for its public function: *The Great Market of —*, *The Cathedral of —*, *The Assizes*
- The more ordinary the name, the more powerful the contrast when it becomes the site of the reckoning

### Final Confrontation Site
- Should echo the name of the place it happened, or invert it
- If the protagonist is choosing the site, the name may be chosen with deliberate significance
- If the enemy is choosing the site, the name should feel like their territory — which is why the protagonist winning there matters

---

## III. Enemy Faction Naming

### Naming Philosophy
Enemy faction names in English-language vengeance fiction should sound like things people actually join and believe in — not like organizations designed to be destroyed. The most powerful institutional names are the ones that sound trustworthy, noble, or legitimate. Because that legitimacy is the crime: they used the appearance of virtue to do what they did.

### Noble Houses
- Pattern: *House [Surname]*, *The [Surname] Family*, *The [Surname] Estate*
- Surname qualities: sounds old, sounds landed, sounds like it has been written in legal documents for generations
- Good patterns: surnames ending in -ton, -field, -worth, -wick, -ley, -ford, -vane, -holt
- Examples: *House Aldric*, *The Thornfield Family*, *The Caldwell Estate*

### Criminal Syndicates
- Often named for something innocuous: a trade, a location, a saint
- The name should provide complete cover: *The River Merchants*, *The Westside Fellowship*, *The Brotherhood of Saint Giles*
- Avoid names that signal criminality: *The Shadow Organization* does not survive contact with reality

### Religious Institutions
- Named with the vocabulary of faith and mission: *The Order of —*, *The Brothers of —*, *The House of —*
- The name should sound like something people devote their lives to: *The Order of the Sacred Charter*, *The Brotherhood of the Waystone*, *The Warden Society*

### Military / Government Bodies
- Named with formal institutional vocabulary: *The [Adjective] Regiment*, *The Commissioners of —*, *The [Name] Council*
- Should sound bureaucratic and legitimate: *The Commissioners of Public Order*, *The Aldric Compact*, *The King''s Warden*

### Merchant Guilds and Empires
- Named for what they do, or for their founder: *The [Name] Trading Company*, *The Guild of [Trade]*, *The [Surname] Concern*
- Examples: *The Vane Mercantile Company*, *The Guild of River Factors*, *The Thornton Concern*

---

## Common Errors

- ❌ Names that announce guilt: *Lord Blackheart*, *The Shadow Order*, *The Evil Lord*. Name enemies as they would name themselves — as legitimate, respectable, and above reproach.
- ❌ The protagonist''s original name sounds like a hero: *Valor Steele*, *Iron Maren*. The pre-trauma protagonist should have a name that belonged to an ordinary person.
- ❌ All characters from the same faction have identical name origins: Realistic institutions are diverse. A noble house may have imported marriages, staff from different regions, allies from different backgrounds.
- ❌ Locations with "dark" names that pre-announce their significance: Every reader knows *Shadowmere Keep* is important. Let *Caldwell House* surprise them.
- ❌ Forgettable character names that blur together: In a cast where multiple secondary characters share similar name registers (all Old English, all Latin-derived), they will blend. Introduce naming differentiation that makes each character trackable.
',
  '## Entity Naming — The Vengeance Soul Novel

Nothing is decorative. Everything serves the weight. Names must carry gravity without theatrical flourish.

---

## I. Character Naming

**Protagonist**: Real-world weight without operatic quality. May have a constructed identity with a subtly forgettable register. (*Cole*, *Maren*, *Gareth*)

**Primary Targets**: Names that connote legitimacy and established status. Should sound trustworthy — that comfort is what will be destroyed. (*Edmund Vane*, *Harlan Carew*, *Corvin Thornton*)

**Secondary/Accomplices**: Names that blend in — not memorable enough to raise suspicion, specific enough to track across the narrative.

**Collateral Victims**: Deliberately ordinary, full names with surnames — their ordinariness signals they are not players in this drama.

---

## II. Scene Naming

Name scenes for what they are, not what they feel like. The affect is carried by prose, not by labels.

- **The Place It Happened**: Named as it was when neutral. (*Caldwell House*, *The Lower Mill*)
- **Enemy Domain**: Named with the legitimacy the enemy built. (*Vane Hall*, *The Thornton Seat*) — not gothic or sinister
- **Final Site**: Should echo or invert the place it happened

---

## III. Faction Naming

Name factions as their members would name them — as legitimate, respectable, and worth joining.

- **Noble Houses**: *House Aldric*, *The Thornfield Family* — old, landed, legal
- **Syndicates**: Named for something innocuous — *The River Merchants*, *The Westside Fellowship*
- **Religious Bodies**: *The Order of the Sacred Charter*, *The Brotherhood of the Waystone*
- **Government Bodies**: *The Commissioners of Public Order*, *The Aldric Compact*

---

## Common Errors

- ❌ Names that announce guilt (*Lord Blackheart*, *The Shadow Order*)
- ❌ Protagonist''s original name sounds heroic
- ❌ Locations with "dark" pre-announcing names (*Shadowmere Keep*)
',
  (SELECT id FROM novel_creation_method WHERE name = 'The Vengeance Soul Novel' LIMIT 1),
  1,
  36,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
