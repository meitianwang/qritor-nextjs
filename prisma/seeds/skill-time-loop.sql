-- -----------------------------------------------------------------------------
-- Time Loop / Progression Regression AI Generation Skills Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 89; 

-- ============================================================================
-- 1. Setting Gen Skills (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'timeloop-hook-setting-gen',
  'First Loop Hook Generation: Generates the brutal, unwinnable situation that kills the protagonist on Day 1.',
  'First Loop Hook Generation: Generates the brutal, unwinnable situation that kills the protagonist on Day 1.',
  '## First Death Hook Generation — Time Loop / Progression Regression

In regression frameworks, the first life must establish the absolute cruelty of the world and set the protagonist''s primary motivation for the rest of eternity.

---

### Generation Guidelines

#### The Unwinnable Scenario
Create a scenario that is mathematically or physically impossible for a first-timer to survive.
*Example:* Being dropped in a Tutorial zone that mistakenly spawned a Level 99 Disaster Dragon. An assassin whose neurotoxin triggers instantly at midnight. A 10-year apocalypse survival where humanity is inevitably erased by the System.

#### The Death Experience
Do not hold back. The protagonist should experience visceral, terrifying helplessness.
*Example:* "I watched the city burn, helpless as my legs were crushed under the masonry. The last thing I saw before the System interface flashed ''YOU DIED'' was the betrayer''s smiling face."

#### The Motivation to Endure
A time loop requires immense mental fortitude. Why do they keep fighting instead of going insane?
*Example:* Absolute, psychotic vengeance. A desperate promise to save their little sister. A burning obsession to break the "Game" and punish its creators.',
  '## First Death Hook Generation — Time Loop / Progression Regression

In regression frameworks, the first life must establish the absolute cruelty of the world and set the protagonist''s primary motivation for the rest of eternity.

---

### Generation Guidelines

#### The Unwinnable Scenario
Create a scenario that is mathematically or physically impossible for a first-timer to survive.
*Example:* Being dropped in a Tutorial zone that mistakenly spawned a Level 99 Disaster Dragon. An assassin whose neurotoxin triggers instantly at midnight. A 10-year apocalypse survival where humanity is inevitably erased by the System.

#### The Death Experience
Do not hold back. The protagonist should experience visceral, terrifying helplessness.
*Example:* "I watched the city burn, helpless as my legs were crushed under the masonry. The last thing I saw before the System interface flashed ''YOU DIED'' was the betrayer''s smiling face."

#### The Motivation to Endure
A time loop requires immense mental fortitude. Why do they keep fighting instead of going insane?
*Example:* Absolute, psychotic vengeance. A desperate promise to save their little sister. A burning obsession to break the "Game" and punish its creators.',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'timeloop-rule-setting-gen',
  'Regression Rule Mechanics: Defines restrictions on time leaping to prevent infinite freedom.',
  'Regression Rule Mechanics: Defines restrictions on time leaping to prevent infinite freedom.',
  '## Regression Rule Mechanics — Time Loop / Progression Regression

Without rules, immortality is boring. The mechanics of the regression must enforce tension and consequences.

---

### Generation Guidelines

#### Retention & Loss
Define strictly what crosses timelines. Usually, physical strength and items zero out, but *Information* and *Soul/Mental power* accumulate.
*Example:* "Every time he restarted the Day, his muscles turned back to jelly, but his memory of the enemy''s 43-hit sword combo remained perfectly etched in his brain."

#### Checkpoints vs Infinite Regressions
Add a terrifying limitation.
*Example Checkpoint System:* "Once I kill an Area Boss, the save point updates. If I mess up my character build before saving, I am permanently stuck with those choices forever."
*Example Penalty:* "Every death breaks off a piece of my soul. After the 1,000th death, I will cease to exist. I have died 997 times."

#### Butterfly Effects
Slight deviations in behavior radically alter the timeline. Moving a cup of coffee means the assassin is delayed by 3 seconds, leading to a completely different boss encounter.',
  '## Regression Rule Mechanics — Time Loop / Progression Regression

Without rules, immortality is boring. The mechanics of the regression must enforce tension and consequences.

---

### Generation Guidelines

#### Retention & Loss
Define strictly what crosses timelines. Usually, physical strength and items zero out, but *Information* and *Soul/Mental power* accumulate.
*Example:* "Every time he restarted the Day, his muscles turned back to jelly, but his memory of the enemy''s 43-hit sword combo remained perfectly etched in his brain."

#### Checkpoints vs Infinite Regressions
Add a terrifying limitation.
*Example Checkpoint System:* "Once I kill an Area Boss, the save point updates. If I mess up my character build before saving, I am permanently stuck with those choices forever."
*Example Penalty:* "Every death breaks off a piece of my soul. After the 1,000th death, I will cease to exist. I have died 997 times."

#### Butterfly Effects
Slight deviations in behavior radically alter the timeline. Moving a cup of coffee means the assassin is delayed by 3 seconds, leading to a completely different boss encounter.',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'timeloop-style-setting-gen',
  'Tone & Style Generation: Dark survival themes mixed with the stark efficiency of a speedrunner.',
  'Tone & Style Generation: Dark survival themes mixed with the stark efficiency of a speedrunner.',
  '## Tone & Style Generation — Time Loop / Progression Regression

---

### Generation Guidelines

The tone operates on a spectrum from "Traumatized Survival" to "Bored Speedrunner."
- **Trial & Error Brutality:** Describe deaths clinically. "Attempt 43. Cause of death: Beheaded. Takeaway: The executioner swings 0.3 seconds earlier than expected."
- **Choreographed Perfection:** Contrast the panicked, messy combat of side characters with the terrifying, robotic efficiency of the protagonist executing a memorized, frame-perfect sequence.
- **Psychological Erosion:** Show that repeating time removes the protagonist''s empathy. They view people as "NPCs" who will reset tomorrow anyway. "I had to shoot my best friend to trigger the alarm. It didn''t matter; he''d be drinking coffee tomorrow morning alive and well. But a part of me died anyway."',
  '## Tone & Style Generation — Time Loop / Progression Regression

---

### Generation Guidelines

The tone operates on a spectrum from "Traumatized Survival" to "Bored Speedrunner."
- **Trial & Error Brutality:** Describe deaths clinically. "Attempt 43. Cause of death: Beheaded. Takeaway: The executioner swings 0.3 seconds earlier than expected."
- **Choreographed Perfection:** Contrast the panicked, messy combat of side characters with the terrifying, robotic efficiency of the protagonist executing a memorized, frame-perfect sequence.
- **Psychological Erosion:** Show that repeating time removes the protagonist''s empathy. They view people as "NPCs" who will reset tomorrow anyway. "I had to shoot my best friend to trigger the alarm. It didn''t matter; he''d be drinking effect tomorrow morning alive and well. But a part of me died anyway."',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. Character Gen Skills (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'timeloop-character-gen',
  'Character Generation: Static tragic elements, evolving protagonists, and those doomed to repeat.',
  'Character Generation: Static tragic elements, evolving protagonists, and those doomed to repeat.',
  '## Character Archive Generation — Time Loop / Progression Regression

Characters must be defined by their absolute ignorance of the loop, contrasting with the protagonist''s omniscience.

---

### Generation Guidelines

#### The Exhausted Regressor (Protagonist)
A character whose greatest weapon is memory. They suffer from psychological exhaustion, PTSD of dying thousands of times, and a growing disconnect from humanity. They often appear deeply cynical or terrifyingly calm in life-threatening scenarios.

#### The Static Victims (Save-scum targets)
Characters whose tragic deaths act as the protagonist''s primary obstacle.
*Example:* The saintess who is assassinated on Day 4 every loop without fail. The protagonist spends 50 loops trying to find the one impossible sequence of events that keeps her alive.

#### The Insurmountable Wall (Key Antagonists)
An enemy who is so overwhelmingly powerful that direct combat is mathematically impossible. The protagonist cannot train harder to beat them; they must spend 200 deaths mapping out the antagonist''s entire life routine just to poison their tea.',
  '## Character Archive Generation — Time Loop / Progression Regression

Characters must be defined by their absolute ignorance of the loop, contrasting with the protagonist''s omniscience.

---

### Generation Guidelines

#### The Exhausted Regressor (Protagonist)
A character whose greatest weapon is memory. They suffer from psychological exhaustion, PTSD of dying thousands of times, and a growing disconnect from humanity. They often appear deeply cynical or terrifyingly calm in life-threatening scenarios.

#### The Static Victims (Save-scum targets)
Characters whose tragic deaths act as the protagonist''s primary obstacle.
*Example:* The saintess who is assassinated on Day 4 every loop without fail. The protagonist spends 50 loops trying to find the one impossible sequence of events that keeps her alive.

#### The Insurmountable Wall (Key Antagonists)
An enemy who is so overwhelmingly powerful that direct combat is mathematically impossible. The protagonist cannot train harder to beat them; they must spend 200 deaths mapping out the antagonist''s entire life routine just to poison their tea.',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. Scene Gen Skills (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'timeloop-scene-gen',
  'Scene Generation: Unforgiving death traps and environments that must be mapped out pixel by pixel.',
  'Scene Generation: Unforgiving death traps and environments that must be mapped out pixel by pixel.',
  '## Scene & Location Generation — Time Loop / Progression Regression

Scenes in this genre are puzzles to be solved. They are fatal variables that reset if you make one wrong move.

---

### Generation Guidelines

#### The Fatal Variables
Describe a location filled with so much chaos, timing constraints, and hidden dangers that a normal human would die immediately.
*Examples:* A tutorial dungeon filling rapidly with water, where the escape code on the wall is written in a language that takes three weeks to decipher. An assassination banquet with 50 guests, three secret poisons, and two hidden snipers mapping the entire room.

#### The Choreographed Clear
The juxtaposition of how the protagonist navigates it beautifully.
*Example:* "He confidently walked down the corridor. Took exactly three steps. Paused for two seconds so the guillotine barely missed his nose. Turned left. Fired a blind arrow into the dark ceiling to hit the concealed goblin''s throat. He didn''t even blink; he''d memorized this hallway over 500 loops."',
  '## Scene & Location Generation — Time Loop / Progression Regression

Scenes in this genre are puzzles to be solved. They are fatal variables that reset if you make one wrong move.

---

### Generation Guidelines

#### The Fatal Variables
Describe a location filled with so much chaos, timing constraints, and hidden dangers that a normal human would die immediately.
*Examples:* A tutorial dungeon filling rapidly with water, where the escape code on the wall is written in a language that takes three weeks to decipher. An assassination banquet with 50 guests, three secret poisons, and two hidden snipers mapping the entire room.

#### The Choreographed Clear
The juxtaposition of how the protagonist navigates it beautifully.
*Example:* "He confidently walked down the corridor. Took exactly three steps. Paused for two seconds so the guillotine barely missed his nose. Turned left. Fired a blind arrow into the dark ceiling to hit the concealed goblin''s throat. He didn''t even blink; he''d memorized this hallway over 500 loops."',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. Prop Gen Skills (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'timeloop-prop-gen',
  'Prop Generation: Secret codes, future knowledge assets, and exploit-based magical items.',
  'Prop Generation: Secret codes, future knowledge assets, and exploit-based magical items.',
  '## Prop & Exploit Generation — Time Loop / Progression Regression

Information is the only true currency for a regressor.

---

### Generation Guidelines

#### Knowledge as a Weapon
Physical items don''t matter. Focus on generating "Secrets" that act as massive advantages in a new timeline.
*Examples:* The 20-digit passcode to a dead civilization''s royal armory. The true name of an eldritch demon. The exact stock market fluctuations for the next 10 years. The knowledge that the fearsome Dark General is secretly allergic to peanuts.

#### The Sequence Breaking Artefact
Items that the protagonist secures wildly out of order by exploiting their memories.
*Example:* "The Aegis Shield is supposed to be rewarded to the Hero of Light in Year 5. In Year 0, the protagonist just walked into the hidden cave behind the waterfall, dug exactly three feet north of the old oak tree, and took it."',
  '## Prop & Exploit Generation — Time Loop / Progression Regression

Information is the only true currency for a regressor.

---

### Generation Guidelines

#### Knowledge as a Weapon
Physical items don''t matter. Focus on generating "Secrets" that act as massive advantages in a new timeline.
*Examples:* The 20-digit passcode to a dead civilization''s royal armory. The true name of an eldritch demon. The exact stock market fluctuations for the next 10 years. The knowledge that the fearsome Dark General is secretly allergic to peanuts.

#### The Sequence Breaking Artefact
Items that the protagonist secures wildly out of order by exploiting their memories.
*Example:* "The Aegis Shield is supposed to be rewarded to the Hero of Light in Year 5. In Year 0, the protagonist just walked into the hidden cave behind the waterfall, dug exactly three feet north of the old oak tree, and took it."',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. Organization Gen Skills (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'timeloop-org-gen',
  'Faction Generation: Massive organizations manipulated like clockwork tools by an omniscient regressor.',
  'Faction Generation: Massive organizations manipulated like clockwork tools by an omniscient regressor.',
  '## Faction & Organization Generation — Time Loop / Progression Regression

Factions operate on predictable, mechanical schedules that the protagonist exploits.

---

### Generation Guidelines

#### The Ticking Clocks
Factions that trigger inevitable cataclysms regardless of what the protagonist does, acting as hard deadlines.
*Examples:* The Apocalypse Managers, observing the Earth and releasing the "Second Wave" of monsters exactly 30 days after the tutorial ends. A cult that will successfully summon a dark god on a blood moon.

#### Predictable Machinery
Because organizations are bureaucratic, they are painfully predictable. How does the protagonist exploit this?
*Example:* The protagonist knows that if they assassinate a low-level cardinal, the Holy Church''s internal protocols will defensively mobilize their Paladins to Sector 4. They use this exact protocol trigger to draw Paladins away from the vault they actually want to rob.',
  '## Faction & Organization Generation — Time Loop / Progression Regression

Factions operate on predictable, mechanical schedules that the protagonist exploits.

---

### Generation Guidelines

#### The Ticking Clocks
Factions that trigger inevitable cataclysms regardless of what the protagonist does, acting as hard deadlines.
*Examples:* The Apocalypse Managers, observing the Earth and releasing the "Second Wave" of monsters exactly 30 days after the tutorial ends. A cult that will successfully summon a dark god on a blood moon.

#### Predictable Machinery
Because organizations are bureaucratic, they are painfully predictable. How does the protagonist exploit this?
*Example:* The protagonist knows that if they assassinate a low-level cardinal, the Holy Church''s internal protocols will defensively mobilize their Paladins to Sector 4. They use this exact protocol trigger to draw Paladins away from the vault they actually want to rob.',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. Plot Gen Skills (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'timeloop-plot-gen',
  'Plot Design: Focuses on mapping out trial & error, the accumulation of knowledge, and cathartic speedruns.',
  'Plot Design: Focuses on mapping out trial & error, the accumulation of knowledge, and cathartic speedruns.',
  '## Plot Design Domain Knowledge — Time Loop / Progression Regression

The plot is structured around the "Grind" and the ultimate "Perfect Clear".

---

### Typical Story Structure
1. **The Brutal Ignorance (Loops 1-10)**: The protagonist arrives, confused. They try standard hero tactics and are brutally, unfairly murdered over and over. They learn the rules of the loop (checkpoints, what they retain).
2. **Information Gathering & Attrition (Loops 11-100)**: They stop trying to win and start using lives purely to gather data. E.g., deliberately running into traps to measure their trigger radius. Committing suicide just to reset a botched conversation.
3. **The Sequence Break**: Armed with future knowledge, they do something completely insane on Day 1—like killing an ally who is secretly a traitor, or opening a hidden vault a level 1 character has no business opening.
4. **The Checkpoint Crisis / Desensitization**: The psychological toll hits. They realize their friends are just NPCs following scripts. Alternatively, a save point updates *after* a catastrophic mistake, forcing them to live with the consequences permanently.
5. **The Perfect Choreography (Catharsis)**: The climax. The protagonist executes a plan requiring microscopic precision, manipulating enemies into killing each other, dodging fatal blows by millimeters, and collapsing the impossible odds under the weight of perfect, looping omniscience.',
  '## Plot Design Domain Knowledge — Time Loop / Progression Regression

The plot is structured around the "Grind" and the ultimate "Perfect Clear".

---

### Typical Story Structure
1. **The Brutal Ignorance (Loops 1-10)**: The protagonist arrives, confused. They try standard hero tactics and are brutally, unfairly murdered over and over. They learn the rules of the loop (checkpoints, what they retain).
2. **Information Gathering & Attrition (Loops 11-100)**: They stop trying to win and start using lives purely to gather data. E.g., deliberately running into traps to measure their trigger radius. Committing suicide just to reset a botched conversation.
3. **The Sequence Break**: Armed with future knowledge, they do something completely insane on Day 1—like killing an ally who is secretly a traitor, or opening a hidden vault a level 1 character has no business opening.
4. **The Checkpoint Crisis / Desensitization**: The psychological toll hits. They realize their friends are just NPCs following scripts. Alternatively, a save point updates *after* a catastrophic mistake, forcing them to live with the consequences permanently.
5. **The Perfect Choreography (Catharsis)**: The climax. The protagonist executes a plan requiring microscopic precision, manipulating enemies into killing each other, dodging fatal blows by millimeters, and collapsing the impossible odds under the weight of perfect, looping omniscience.',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. Entity Naming Skills (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'timeloop-entity-naming',
  'Entity Naming: System alerts, regression abilities, and checkpoint designations.',
  'Entity Naming: System alerts, regression abilities, and checkpoint designations.',
  '## Entity Naming — Time Loop / Progression Regression

Names frequently involve temporal parameters, systemic limits, or themes of eternal return.

---

## 1. Regression Abilities / Authority
Titles shouldn''t just be "Time Travel." They should sound like system bugs or divine intervention.
- E.g., [Skill: Returner''s Clockwork], [Authority of the Ouroboros], [Save Point Validation], [Timeline Divergence lv.9].

## 2. Checkpoints / Catastrophes
Events are often named by their temporal marker because the protagonist tracks time obsessively.
- The Day zero Calamity, The Third Lunar Reset, The Midnight Massacre Route, The Bad Ending #42.

## 3. Character Titles
The protagonist eventually gains monikers that reflect their psychotic preparedness or impossible foresight.
- E.g., "The Prophet," "The Man Who Broke the Tutorial," "The Anomalous Variable."',
  '## Entity Naming — Time Loop / Progression Regression

Names frequently involve temporal parameters, systemic limits, or themes of eternal return.

---

## 1. Regression Abilities / Authority
Titles shouldn''t just be "Time Travel." They should sound like system bugs or divine intervention.
- E.g., [Skill: Returner''s Clockwork], [Authority of the Ouroboros], [Save Point Validation], [Timeline Divergence lv.9].

## 2. Checkpoints / Catastrophes
Events are often named by their temporal marker because the protagonist tracks time obsessively.
- The Day zero Calamity, The Third Lunar Reset, The Midnight Massacre Route, The Bad Ending #42.

## 3. Character Titles
The protagonist eventually gains monikers that reflect their psychotic preparedness or impossible foresight.
- E.g., "The Prophet," "The Man Who Broke the Tutorial," "The Anomalous Variable."',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. Narrative Skills (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'timeloop-narrative',
  'Narrative Guidance: Describing choreographed combat and the chilling calmness of someone who has died 1,000 times.',
  'Narrative Guidance: Describing choreographed combat and the chilling calmness of someone who has died 1,000 times.',
  '## Narrative Writing Guidance — Time Loop / Progression Regression

The prose must convey the ultimate thrill of this genre: Flawless, omniscient competence born from unimaginable suffering.

---

### 1. Frame-Perfect Execution
Describe combat not with raging emotions, but with chilling, mathematical precision. The protagonist isn''t trying hard—they are just going through the motions.
*Example:* "I did not look up when the dragon roared. I knew that at exactly three seconds, a stray boulder would collapse from the ceiling. I simply took half a step right. The boulder crushed the dragon''s foot. I didn''t cheer; I just raised my spear exactly 45 degrees, waiting for the creature to recoil blindly into the blade, exactly as it had done in my 34th, 89th, and 411th lives."

### 2. The Abrupt Suicide
Regression novels often use death as a casual tool. The suddenness of it is darkly comedic or disturbing.
*Example:* "The negotiation failed. The king was calling his guards. Knowing that talking my way out of the dungeon would take two worthless months, I sighed, pulled out a dagger, and slit my own throat before the guards could enter the room. Time to reload."

### 3. The Exhaustion of Dialogue
Show the protagonist skipping real-life dialogue like a gamer hammering the skip button.
*Example:* "Before the elder could start his monologue about honor and destiny, I recited his next three lines perfectly in unison with him. He stared at me in horror. ''Just give me the village pass,'' I said, rubbing my temples. ''I''ve heard this speech eighty times and I am so tired.''"',
  '## Narrative Writing Guidance — Time Loop / Progression Regression

The prose must convey the ultimate thrill of this genre: Flawless, omniscient competence born from unimaginable suffering.

---

### 1. Frame-Perfect Execution
Describe combat not with raging emotions, but with chilling, mathematical precision. The protagonist isn''t trying hard—they are just going through the motions.
*Example:* "I did not look up when the dragon roared. I knew that at exactly three seconds, a stray boulder would collapse from the ceiling. I simply took half a step right. The boulder crushed the dragon''s foot. I didn''t cheer; I just raised my spear exactly 45 degrees, waiting for the creature to recoil blindly into the blade, exactly as it had done in my 34th, 89th, and 411th lives."

### 2. The Abrupt Suicide
Regression novels often use death as a casual tool. The suddenness of it is darkly comedic or disturbing.
*Example:* "The negotiation failed. The king was calling his guards. Knowing that talking my way out of the dungeon would take two worthless months, I sighed, pulled out a dagger, and slit my own throat before the guards could enter the room. Time to reload."

### 3. The Exhaustion of Dialogue
Show the protagonist skipping real-life dialogue like a gamer hammering the skip button.
*Example:* "Before the elder could start his monologue about honor and destiny, I recited his next three lines perfectly in unison with him. He stared at me in horror. ''Just give me the village pass,'' I said, rubbing my temples. ''I''ve heard this speech eighty times and I am so tired.''"',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. Novel Naming Skills (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'timeloop-novel-naming',
  'Novel Naming: Titles capturing the endless repetition and sequence-breaking speedrun nature.',
  'Novel Naming: Titles capturing the endless repetition and sequence-breaking speedrun nature.',
  '## Novel Naming — Time Loop / Progression Regression

Titles typically reference returning, infinite repeats, or absolute mastery of a system.

---

### Common Title Formats

**Format 1: The Regression/Returner Motif**
- Structure: Combining terms indicating a return from the future.
- Examples: *The Regressor Instruction Manual*, *Omniscient Reader''s Viewpoint*, *A Returner''s Magic Should Be Special*, *SSS-Class Suicide Hunter*.

**Format 2: The Loop / Speedrun Claim**
- Structure: A bold claim about finishing the impossible task through repetition.
- Examples: *Mother of Learning*, *Perfect Run*, *The 100th Regression of the Max-Level Hero*.

### Synopsis Structure
Start with the absolute failure at the end of the timeline. The moment of death, followed by the shock of waking up in the past. Highlight the protagonist''s shift in mindset from hopeful hero to ruthless, calculating pragmatist.
*Example:*
"I fought for ten years in the Tower of Despair, crawling my way to the 99th floor, only to watch my entire party get slaughtered by the Demon King. As his dark fire consumed me, I cursed the heavens. 
Then, I opened my eyes. I was back on Floor 1. The date was ten years ago. All my items were gone, my levels were reset... but my memories remained. 
I know where the hidden artifacts are. I know the weaknesses of every boss. And I know the faces of the ''allies'' who will eventually betray me. This time, I''m not playing the hero. I''m going to clear this Tower perfectly, even if I have to walk over a thousand corpses to do it."',
  '## Novel Naming — Time Loop / Progression Regression

Titles typically reference returning, infinite repeats, or absolute mastery of a system.

---

### Common Title Formats

**Format 1: The Regression/Returner Motif**
- Structure: Combining terms indicating a return from the future.
- Examples: *The Regressor Instruction Manual*, *Omniscient Reader''s Viewpoint*, *A Returner''s Magic Should Be Special*, *SSS-Class Suicide Hunter*.

**Format 2: The Loop / Speedrun Claim**
- Structure: A bold claim about finishing the impossible task through repetition.
- Examples: *Mother of Learning*, *Perfect Run*, *The 100th Regression of the Max-Level Hero*.

### Synopsis Structure
Start with the absolute failure at the end of the timeline. The moment of death, followed by the shock of waking up in the past. Highlight the protagonist''s shift in mindset from hopeful hero to ruthless, calculating pragmatist.
*Example:*
"I fought for ten years in the Tower of Despair, crawling my way to the 99th floor, only to watch my entire party get slaughtered by the Demon King. As his dark fire consumed me, I cursed the heavens. 
Then, I opened my eyes. I was back on Floor 1. The date was ten years ago. All my items were gone, my levels were reset... but my memories remained. 
I know where the hidden artifacts are. I know the weaknesses of every boss. And I know the faces of the ''allies'' who will eventually betray me. This time, I''m not playing the hero. I''m going to clear this Tower perfectly, even if I have to walk over a thousand corpses to do it."',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
