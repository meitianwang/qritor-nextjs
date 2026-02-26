-- -----------------------------------------------------------------------------
-- Otome Isekai / Villainess Reincarnation AI Generation Skills Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 93; 

-- ============================================================================
-- 1. Setting Gen Skills (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'otome-hook-setting-gen',
  'First Awakening Hook Generation: Develops the precise moment of condemnation or rebirth and their frantic new goal.',
  'First Awakening Hook Generation: Develops the precise moment of condemnation or rebirth and their frantic new goal.',
  '## Awakening Hook Generation — Otome Isekai / Villainess

The initial hook revolves around dodging a gruesome fate established by a pre-existing piece of media (like a dating sim or novel).

---

### Generation Guidelines

#### The Source Material & The Fate
Start by defining the ridiculous rules of the original game/novel. What was the protagonist''s destined crime and punishment?
*Example:* In "Love & Destiny Academy", the villainess Penelope is destined to be executed for bullying the sweet heroine, and her family is exiled to the frozen north.

#### The Moment of Awakening
When does the protagonist regain their past life memories?
*Example:* She gets pushed down the stairs at age 7 and hits her head. Or, more dramatically, during the Grand Ball where the Crown Prince publicly breaks their engagement—she suddenly realizes "Oh crap, I am the villainess of a game I played last week."

#### The Drastic Pivot
Her new goal shouldn''t be to "win the game" but to aggressively avoid the plot entirely.
*Example:* "I will gleefully accept this broken engagement, move to the countryside, invent modern agriculture, and live a quiet rich life."',
  '## Awakening Hook Generation — Otome Isekai / Villainess

The initial hook revolves around dodging a gruesome fate established by a pre-existing piece of media (like a dating sim or novel).

---

### Generation Guidelines

#### The Source Material & The Fate
Start by defining the ridiculous rules of the original game/novel. What was the protagonist''s destined crime and punishment?
*Example:* In "Love & Destiny Academy", the villainess Penelope is destined to be executed for bullying the sweet heroine, and her family is exiled to the frozen north.

#### The Moment of Awakening
When does the protagonist regain their past life memories?
*Example:* She gets pushed down the stairs at age 7 and hits her head. Or, more dramatically, during the Grand Ball where the Crown Prince publicly breaks their engagement—she suddenly realizes "Oh crap, I am the villainess of a game I played last week."

#### The Drastic Pivot
Her new goal shouldn''t be to "win the game" but to aggressively avoid the plot entirely.
*Example:* "I will gleefully accept this broken engagement, move to the countryside, invent modern agriculture, and live a quiet rich life."',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'otome-rule-setting-gen',
  'Narrative & Social Rules: Defines the oppressive social strictures of the aristocratic society and "Plot Gravity".',
  'Narrative & Social Rules: Defines the oppressive social strictures of the aristocratic society and "Plot Gravity".',
  '## Narrative & System Rules — Otome Isekai / Villainess

The protagonist is fighting two forces: The rigid patriarchy/aristocracy of the world, and "Plot Gravity"—the universe''s desire to follow the original script.

---

### Generation Guidelines

#### Plot Gravity (The Enforcer)
How does the world try to force her back into the Villainess role?
*Example:* No matter how kind she is, the Original Heroine ''trips'' near her, making everyone think the protagonist pushed her. Or the ''System'' literally deducts her lifespan if she refuses to insult the Crown Prince.

#### Social Constraints
Define the aristocratic laws she must outmaneuver.
*Example:* Women cannot inherit Dukedoms unless they are married, forcing her to find a contract marriage with a psychopathic Northern Duke just to keep her money. Magic is tied to bloodline purity, meaning her status as an illegitimate child creates constant assassination attempts.',
  '## Narrative & System Rules — Otome Isekai / Villainess

The protagonist is fighting two forces: The rigid patriarchy/aristocracy of the world, and "Plot Gravity"—the universe''s desire to follow the original script.

---

### Generation Guidelines

#### Plot Gravity (The Enforcer)
How does the world try to force her back into the Villainess role?
*Example:* No matter how kind she is, the Original Heroine ''trips'' near her, making everyone think the protagonist pushed her. Or the ''System'' literally deducts her lifespan if she refuses to insult the Crown Prince.

#### Social Constraints
Define the aristocratic laws she must outmaneuver.
*Example:* Women cannot inherit Dukedoms unless they are married, forcing her to find a contract marriage with a psychopathic Northern Duke just to keep her money. Magic is tied to bloodline purity, meaning her status as an illegitimate child creates constant assassination attempts.',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'otome-style-setting-gen',
  'Tone & Style Generation: Contrast between lavish tea parties and cold, calculated corporate/survival internal thoughts.',
  'Tone & Style Generation: Contrast between lavish tea parties and cold, calculated corporate/survival internal thoughts.',
  '## Tone & Style Generation — Otome Isekai / Villainess

---

### Generation Guidelines

 The tone thrives on the severe mismatch between beautiful external aesthetics and ruthless internal pragmatism.
- **The Visual Palette:** Describe gowns, gems, pastries, and handsome faces in exhausting, glowing detail. The world is disgustingly pretty.
- **The Emotional Disconnect:** The protagonist should evaluate everyone like a spreadsheet. "The Grand Duke smiled at me. His eyes were like rubies. All I could think about was that his smile meant my family''s mining stocks were about to plummet."
- **Obliviousness:** If dealing with romance, the protagonist must be hilariously dense, assuming every act of true love by the male leads is just them sticking to the "original game script" or plotting her murder.',
  '## Tone & Style Generation — Otome Isekai / Villainess

---

### Generation Guidelines

 The tone thrives on the severe mismatch between beautiful external aesthetics and ruthless internal pragmatism.
- **The Visual Palette:** Describe gowns, gems, pastries, and handsome faces in exhausting, glowing detail. The world is disgustingly pretty.
- **The Emotional Disconnect:** The protagonist should evaluate everyone like a spreadsheet. "The Grand Duke smiled at me. His eyes were like rubies. All I could think about was that his smile meant my family''s mining stocks were about to plummet."
- **Obliviousness:** If dealing with romance, the protagonist must be hilariously dense, assuming every act of true love by the male leads is just them sticking to the "original game script" or plotting her murder.',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. Character Gen Skills (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'otome-character-gen',
  'Character Generation: Cliché Otome love targets twisted by the Villainess'' new actions.',
  'Character Generation: Cliché Otome love targets twisted by the Villainess'' new actions.',
  '## Character Archive Generation — Otome Isekai / Villainess

The supporting cast begins as 1-dimensional game clichés but becomes dangerously obsessed or complex due to the "Butterfly Effect" of the protagonist''s actions.

---

### Generation Guidelines

#### The Trash Prince / Ex-Fiancé
He starts out despising the Villainess and loving the Heroine. But when the Villainess finally agrees to break the engagement without fighting, his ego shatters. He becomes obsessively regretful and tries to win her back when she no longer cares.

#### The Cold Duke of the North (Primary Male Lead)
Usually traumatized, cursed, or covered in blood. He expects everyone to fear him. The protagonist, who only sees him as a convenient "Contract Husband" to avoid death flags, treats him like a business partner. He falls violently in love with her pragmatism.

#### The Original Heroine (The White Lotus)
Generate two types:
1. *The Secret Villain:* She is a sociopathic transmigrator/regressor herself, furious that the Villainess is stealing "her" harem.
2. *The Unexpected Ally:* She falls in love with the cool, capable Villainess instead of the male leads, creating a hilarious yuri subtext.',
  '## Character Archive Generation — Otome Isekai / Villainess

The supporting cast begins as 1-dimensional game clichés but becomes dangerously obsessed or complex due to the "Butterfly Effect" of the protagonist''s actions.

---

### Generation Guidelines

#### The Trash Prince / Ex-Fiancé
He starts out despising the Villainess and loving the Heroine. But when the Villainess finally agrees to break the engagement without fighting, his ego shatters. He becomes obsessively regretful and tries to win her back when she no longer cares.

#### The Cold Duke of the North (Primary Male Lead)
Usually traumatized, cursed, or covered in blood. He expects everyone to fear him. The protagonist, who only sees him as a convenient "Contract Husband" to avoid death flags, treats him like a business partner. He falls violently in love with her pragmatism.

#### The Original Heroine (The White Lotus)
Generate two types:
1. *The Secret Villain:* She is a sociopathic transmigrator/regressor herself, furious that the Villainess is stealing "her" harem.
2. *The Unexpected Ally:* She falls in love with the cool, capable Villainess instead of the male leads, creating a hilarious yuri subtext.',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. Scene Gen Skills (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'otome-scene-gen',
  'Scene Generation: Ballrooms, tea parties, and academy grounds where social ruin is dealt.',
  'Scene Generation: Ballrooms, tea parties, and academy grounds where social ruin is dealt.',
  '## Scene & Location Generation — Otome Isekai / Villainess

Locations are battlegrounds of pure social capital, rumors, and prestige.

---

### Generation Guidelines

#### The Tea Party / Debutante Ball
Describe a setting dripping with lavish wealth—chandeliers, silk imported from the east, string quartets. The danger here is purely social. "If I accept bread from the Marquis before the Archduke speaks, I will offend the Empress Dowager''s faction and be poisoned by Tuesday."

#### The Desolate Northern Territory
If exiled or married off, describe a freezing, monster-infested wasteland. This serves as the protagonist''s blank canvas. They will use their modern knowledge (crop rotation, inventing heated floors, capitalism) to turn this frozen hell into an economic superpower, embarrassing the Royal Family.',
  '## Scene & Location Generation — Otome Isekai / Villainess

Locations are battlegrounds of pure social capital, rumors, and prestige.

---

### Generation Guidelines

#### The Tea Party / Debutante Ball
Describe a setting dripping with lavish wealth—chandeliers, silk imported from the east, string quartets. The danger here is purely social. "If I accept bread from the Marquis before the Archduke speaks, I will offend the Empress Dowager''s faction and be poisoned by Tuesday."

#### The Desolate Northern Territory
If exiled or married off, describe a freezing, monster-infested wasteland. This serves as the protagonist''s blank canvas. They will use their modern knowledge (crop rotation, inventing heated floors, capitalism) to turn this frozen hell into an economic superpower, embarrassing the Royal Family.',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. Prop Gen Skills (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'otome-prop-gen',
  'Prop Generation: Contracts, ledgers, ancient magical heirlooms, and items of political leverage.',
  'Prop Generation: Contracts, ledgers, ancient magical heirlooms, and items of political leverage.',
  '## Prop & Exploit Generation — Otome Isekai / Villainess

Weapons here are pieces of paper: ledgers, contracts, and embarrassing blackmail.

---

### Generation Guidelines

#### The Contract Marriage Clause
The ultimate tool. A perfectly drafted legal document stipulating "We will act as loving spouses in public to fool the Emperor, but I demand 50% of the territory''s income and a divorce in two years." (The Duke will inevitably refuse the divorce when the time comes).

#### The Original Plot Artefacts
Magical items that the Original Heroine was meant to find. The protagonist snatches them early.
*Example:* The Spirit King''s Tear. The Heroine was supposed to use it to heal the Prince and win his heart. The Villainess steals it just to cure her chronic fatigue syndrome so she can work more hours on her accounting ledgers.',
  '## Prop & Exploit Generation — Otome Isekai / Villainess

Weapons here are pieces of paper: ledgers, contracts, and embarrassing blackmail.

---

### Generation Guidelines

#### The Contract Marriage Clause
The ultimate tool. A perfectly drafted legal document stipulating "We will act as loving spouses in public to fool the Emperor, but I demand 50% of the territory''s income and a divorce in two years." (The Duke will inevitably refuse the divorce when the time comes).

#### The Original Plot Artefacts
Magical items that the Original Heroine was meant to find. The protagonist snatches them early.
*Example:* The Spirit King''s Tear. The Heroine was supposed to use it to heal the Prince and win his heart. The Villainess steals it just to cure her chronic fatigue syndrome so she can work more hours on her accounting ledgers.',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. Organization Gen Skills (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'otome-org-gen',
  'Faction Generation: Noble houses, merchant guilds, and information brokers.',
  'Faction Generation: Noble houses, merchant guilds, and information brokers.',
  '## Faction & Organization Generation — Otome Isekai / Villainess

Factions are deeply entrenched in old money, pride, and incompetence, ripe for a modern capitalist takeover.

---

### Generation Guidelines

#### The Dominant Noble Factions
Generate arrogant aristocratic houses that rely entirely on bloodline rather than skill.
*Example:* The Royal Faction is losing money. The Protagonist uses her past-life business degree to invent "coffee" or "double-entry bookkeeping" and completely monopolizes their economy within two years, buying out their loyalty.

#### The Shadow Guilds (Information/Assassins)
An underground organization run by a dangerous, charming leader (often a secondary love interest). The protagonist hires them using absurd amounts of money to plant rumors identifying the Heroine as a fraud or to spy on the Emperor.',
  '## Faction & Organization Generation — Otome Isekai / Villainess

Factions are deeply entrenched in old money, pride, and incompetence, ripe for a modern capitalist takeover.

---

### Generation Guidelines

#### The Dominant Noble Factions
Generate arrogant aristocratic houses that rely entirely on bloodline rather than skill.
*Example:* The Royal Faction is losing money. The Protagonist uses her past-life business degree to invent "coffee" or "double-entry bookkeeping" and completely monopolizes their economy within two years, buying out their loyalty.

#### The Shadow Guilds (Information/Assassins)
An underground organization run by a dangerous, charming leader (often a secondary love interest). The protagonist hires them using absurd amounts of money to plant rumors identifying the Heroine as a fraud or to spy on the Emperor.',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. Plot Gen Skills (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'otome-plot-gen',
  'Plot Design: Steering clear of execution flags, building an economic empire, and accidental romances.',
  'Plot Design: Steering clear of execution flags, building an economic empire, and accidental romances.',
  '## Plot Design Domain Knowledge — Otome Isekai / Villainess

The plot is a steady escalation from "dodging a guillotine" to "accidentally becoming the most loved/feared woman on the continent."

---

### Typical Story Structure
1. **The Panic Phase**: Discovering the reincarnation identity. Assessing the "Death Flags". The immediate goal is survival (e.g., getting disinherited peacefully, making a contract marriage to escape the brutal central capital).
2. **The Subversion & Economics**: Moving away from the main cast to start a quiet life. Utilizing modern knowledge to invent things (sweets, cosmetics, agricultural techniques). They accidentally build a massive corporate/noble empire.
3. **The Butterfly Effect Flocking**: As she becomes successful and acts coldly towards the male leads (unlike her original "clinger" persona), they all become obsessed with her. The Original Heroine begins to panic as the script falls apart.
4. **The Condemnation Event Fails**: The climax of the original game arrives. The Prince tries to publicly condemn her. However, the protagonist reveals she legally owns his castle, the Duke of the North has his army outside for her, and the kingdom''s economy relies on her trade routes. She casually destroys him intellectually without drawing a sword.',
  '## Plot Design Domain Knowledge — Otome Isekai / Villainess

The plot is a steady escalation from "dodging a guillotine" to "accidentally becoming the most loved/feared woman on the continent."

---

### Typical Story Structure
1. **The Panic Phase**: Discovering the reincarnation identity. Assessing the "Death Flags". The immediate goal is survival (e.g., getting disinherited peacefully, making a contract marriage to escape the brutal central capital).
2. **The Subversion & Economics**: Moving away from the main cast to start a quiet life. Utilizing modern knowledge to invent things (sweets, cosmetics, agricultural techniques). They accidentally build a massive corporate/noble empire.
3. **The Butterfly Effect Flocking**: As she becomes successful and acts coldly towards the male leads (unlike her original "clinger" persona), they all become obsessed with her. The Original Heroine begins to panic as the script falls apart.
4. **The Condemnation Event Fails**: The climax of the original game arrives. The Prince tries to publicly condemn her. However, the protagonist reveals she legally owns his castle, the Duke of the North has his army outside for her, and the kingdom''s economy relies on her trade routes. She casually destroys him intellectually without drawing a sword.',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. Entity Naming Skills (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'otome-entity-naming',
  'Entity Naming: Opulent Western European noble titles, overly romanticized family names.',
  'Entity Naming: Opulent Western European noble titles, overly romanticized family names.',
  '## Entity Naming — Otome Isekai / Villainess

Names should evoke excessive, opulent Western European aristocratic romance.

---

## 1. Noble Houses and Estates
Use archaic, multi-syllabic faux-European surnames.
- The Dukedom of Eckhart, The Marquisate of Valentina, The Obsidian Castle of the Winterlands.

## 2. Character Names
Male leads often have commanding or angelic names; Villainesses have sharp, elegant names.
- *Villainess:* Penelope, Roxana, Medea, Katarina, Eris.
- *Male Leads:* Callisto, Duke Cedric, Cassian, Crown Prince Alpheus.

## 3. Original Game/Novel Titles
The media they transmigrated into usually has a saccharine, generic shoujo title.
- *The Princess of the White Lilies*, *Love Tracker: Magical Academy*, *The Emperor''s Pet*.',
  '## Entity Naming — Otome Isekai / Villainess

Names should evoke excessive, opulent Western European aristocratic romance.

---

## 1. Noble Houses and Estates
Use archaic, multi-syllabic faux-European surnames.
- The Dukedom of Eckhart, The Marquisate of Valentina, The Obsidian Castle of the Winterlands.

## 2. Character Names
Male leads often have commanding or angelic names; Villainesses have sharp, elegant names.
- *Villainess:* Penelope, Roxana, Medea, Katarina, Eris.
- *Male Leads:* Callisto, Duke Cedric, Cassian, Crown Prince Alpheus.

## 3. Original Game/Novel Titles
The media they transmigrated into usually has a saccharine, generic shoujo title.
- *The Princess of the White Lilies*, *Love Tracker: Magical Academy*, *The Emperor''s Pet*.',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. Narrative Skills (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'otome-narrative',
  'Narrative Guidance: Emphasizing inner monologues of frustration mixed with flawless outer etiquette.',
  'Narrative Guidance: Emphasizing inner monologues of frustration mixed with flawless outer etiquette.',
  '## Narrative Writing Guidance — Otome Isekai / Villainess

The tension in the prose comes from the protagonist smiling gracefully while screaming internally.

---

### 1. The Etiquette Filter
Dialogue must be insanely polite and veiled with double meanings, followed by an inner translation of what they actually mean.
*Example:* "I am afraid I must decline your most generous invitation, Your Highness. I am feeling rather unwell," I said, hiding my yawn behind a laced silk fan. *Translation: If I attend your miserable boat party, I know I will be thrown overboard by your psychotic fanclub. I would rather stay home and review my tax returns.*

### 2. Oblivious Romantic Descriptions
When the male lead does something romantic, the protagonist describes it purely logically, missing the point entirely.
*Example:* The Duke pinned me against the wall, his crimson eyes burning with an intense, unreadable heat. His face was only inches from mine. "Why do you run from me?" he whispered. *I stared at him in horror. Oh no. Was he angry about the iron ore contract I swindled from him yesterday? I knew he was a ruthless businessman! He''s going to kill me right here!*

### 3. Competence Porn
Detail the meticulous, overwhelming competence of the protagonist solving administrative/business crises that the "magical" world doesn''t understand.',
  '## Narrative Writing Guidance — Otome Isekai / Villainess

The tension in the prose comes from the protagonist smiling gracefully while screaming internally.

---

### 1. The Etiquette Filter
Dialogue must be insanely polite and veiled with double meanings, followed by an inner translation of what they actually mean.
*Example:* "I am afraid I must decline your most generous invitation, Your Highness. I am feeling rather unwell," I said, hiding my yawn behind a laced silk fan. *Translation: If I attend your miserable boat party, I know I will be thrown overboard by your psychotic fanclub. I would rather stay home and review my tax returns.*

### 2. Oblivious Romantic Descriptions
When the male lead does something romantic, the protagonist describes it purely logically, missing the point entirely.
*Example:* The Duke pinned me against the wall, his crimson eyes burning with an intense, unreadable heat. His face was only inches from mine. "Why do you run from me?" he whispered. *I stared at him in horror. Oh no. Was he angry about the iron ore contract I swindled from him yesterday? I knew he was a ruthless businessman! He''s going to kill me right here!*

### 3. Competence Porn
Detail the meticulous, overwhelming competence of the protagonist solving administrative/business crises that the "magical" world doesn''t understand.',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. Novel Naming Skills (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'otome-novel-naming',
  'Novel Naming: Elaborate, descriptive titles outlining the absurd premise or contract marriage arrangement.',
  'Novel Naming: Elaborate, descriptive titles outlining the absurd premise or contract marriage arrangement.',
  '## Novel Naming — Otome Isekai / Villainess

Titles are practically full summaries. They explicitly declare the protagonist''s role, their impending doom, and their absurd solution.

---

### Common Title Formats

**Format 1: The Villainess Declaration**
- Structure: State the reincarnation status + the stubborn denial of the plot.
- Examples: *Death Is the Only Ending for the Villainess*, *I Reincarnated into an Otome Game as a Villainess With Only Destruction Flags*, *The Villainess Reverses the Hourglass*.

**Format 2: The Contract / Rejection Motif**
- Structure: Who they are rejecting + what ridiculous action they are taking.
- Examples: *I Tamed a Tyrant and Ran Away*, *50 Tea Recipes from the Duchess*, *Beware of the Villainess!*, *The Reason Why Raeliana Ended Up at the Duke''s Mansion*.

### Synopsis Structure
Start with the tragic realization of being inside a game/novel. Outline the inevitable execution/exile. Follow up with the protagonist''s brilliant, usually capitalist or hyper-pragmatic plan to survive. End with an exasperated complaint that the male leads won''t leave her alone.
*Example:*
"I woke up inside my favorite dating sim, but instead of the lovable heroine, I possessed the body of Lady Elara—the wicked villainess destined to be beheaded by the Crown Prince in exactly two years! 
To survive, I immediately broke the engagement, fled to the impoverished North, and signed a 3-year contract marriage with the terrifying ''Monster Duke'' just for his military protection. I promised him I''d manage his terrible finances and then divorce him quietly.
But now that I''ve doubled the duchy''s GDP by inventing coffee... why is the scary Monster Duke suddenly looking at me with obsessive puppy-dog eyes and burning the divorce papers? Please, I just want to retire rich and single!"',
  '## Novel Naming — Otome Isekai / Villainess

Titles are practically full summaries. They explicitly declare the protagonist''s role, their impending doom, and their absurd solution.

---

### Common Title Formats

**Format 1: The Villainess Declaration**
- Structure: State the reincarnation status + the stubborn denial of the plot.
- Examples: *Death Is the Only Ending for the Villainess*, *I Reincarnated into an Otome Game as a Villainess With Only Destruction Flags*, *The Villainess Reverses the Hourglass*.

**Format 2: The Contract / Rejection Motif**
- Structure: Who they are rejecting + what ridiculous action they are taking.
- Examples: *I Tamed a Tyrant and Ran Away*, *50 Tea Recipes from the Duchess*, *Beware of the Villainess!*, *The Reason Why Raeliana Ended Up at the Duke''s Mansion*.

### Synopsis Structure
Start with the tragic realization of being inside a game/novel. Outline the inevitable execution/exile. Follow up with the protagonist''s brilliant, usually capitalist or hyper-pragmatic plan to survive. End with an exasperated complaint that the male leads won''t leave her alone.
*Example:*
"I woke up inside my favorite dating sim, but instead of the lovable heroine, I possessed the body of Lady Elara—the wicked villainess destined to be beheaded by the Crown Prince in exactly two years! 
To survive, I immediately broke the engagement, fled to the impoverished North, and signed a 3-year contract marriage with the terrifying ''Monster Duke'' just for his military protection. I promised him I''d manage his terrible finances and then divorce him quietly.
But now that I''ve doubled the duchy''s GDP by inventing coffee... why is the scary Monster Duke suddenly looking at me with obsessive puppy-dog eyes and burning the divorce papers? Please, I just want to retire rich and single!"',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
