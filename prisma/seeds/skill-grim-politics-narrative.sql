-- Grim-Politics Novel narrative writing guidance skill (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-grim-politics-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'grim-politics-narrative',
  'Grim-Politics Novel 叙事写作专项指导：正文写作层面的语言风格、政治场景写法、对话艺术、节奏控制，聚焦"怎么写"而非"写什么"',
  'Grim-Politics Novel narrative writing guidance: prose-level guidance on language style, political scene writing, dialogue craft, and pacing control — focused on HOW to write, not what to write',
  '## Grim-Politics Narrative Writing Guidance

This skill provides prose-level writing guidance for Grim-Politics fiction. It is specifically focused on **how to execute scenes on the page** — not world-building or plot design, but the actual sentences. The settings, characters, and events are defined elsewhere; this skill is about rendering them.

---

### I. Language Style

#### The Prose Register

Grim-Politics prose should feel **measured and precise** — as if the narrator has no illusions and no sentimentality, but is not performing coldness either. The best writing in this genre reads like a very good historian who has just decided to tell you what actually happened.

**What this means practically**:
- **Verbs over adjectives**: "He signed the order" is more powerful than "He coldly signed the inevitable order"
- **Passive voice as a tool**: "The prisoners were disposed of" — the passive voice here is not weakness, it''s a political statement; it mirrors how power prefers to discuss its own violence
- **Understatement for atrocity**: The greater the act, the more clinical the description. A massacre described in the same register as a grain shipment is more horrifying than explicit violence.
- **Short sentences at moments of consequence**: When a betrayal is executed, when a death is recorded, when a verdict is delivered — the sentence should be short. The weight is in the brevity.

#### The Gap Between Speech and Meaning

The most important prose skill in this genre: characters almost never say what they mean. The prose must convey both the surface meaning and the real meaning simultaneously, without making the subtext so obvious it becomes text.

**Technique**: Character A says something formally correct; the prose notes Character B''s reaction in physical terms (a stillness, an infinitesimal pause before a response) rather than interpreting it.

**Example**:
> "The council is grateful for Lord Vane''s counsel," the Chancellor said.
> Vane set down his cup.

The scene is over. No interpretation needed.

#### Prose Rhythm

Political intrigue prose should generally be controlled and rhythmically restrained — but the restraint should make moments of rupture more powerful.

- **Meetings, councils, negotiations**: Long sentences; dense subordinate clauses; the complexity mirrors the complexity of what''s being discussed and concealed
- **Moments of action or revelation**: Short sentences; declarative; abrupt. The rhythm of someone discovering they have been played.
- **Interior monologue (when used)**: Controlled, strategic — these characters think like they speak, which is to say: always calculating, rarely honest with themselves

---

### II. Core Scene Writing Techniques

#### 2.1 The Negotiation Scene

The most important scene type in Grim-Politics — and the hardest to write. Two or more players are trying to achieve incompatible goals, and both know the other knows this.

**Key principles**:
- **Subtext must be stable**: Both parties must have a clear internal objective; if you don''t know what each character actually wants from this conversation, the scene cannot be written
- **Power balance through physical staging**: Who stands, who sits, who has their back to the door, who pours the wine — these staging choices are negotiations about hierarchy
- **The concession that isn''t**: One party appears to give something; the reader should be able to see why this concession actually serves that party''s interests
- **Exit lines matter most**: The last thing said in a negotiation is the real message; it should be the most indirect and the most important

**Bad example**:
> "I want you to know that I have evidence of your involvement in the Hartley affair," Lord Vane said. "If you don''t cooperate, I will use it."

**Good example**:
> "I was sorry to hear about the difficulties at Hartley," Lord Vane said. He let the pause extend by one half-breath more than comfort permitted. "I imagine you''re managing them well."

#### 2.2 The Betrayal Scene

The betrayal is the genre''s signature moment. Writing it badly is the most common failure.

**Key principles**:
- **The betrayer must be right**: The character betrays for a reason that is understandable, even if not sympathetic. The reader should be able to trace the logic without endorsing it.
- **The victim''s realization**: Often more important than the betrayal itself. How a character processes being played is character revelation.
- **Do not explain**: When the betrayal happens, the prose should not explain why. Show the action; let the reader make the connection to the planted information from earlier chapters.
- **The physical before the emotional**: A character''s body registers betrayal before their mind does — a stillness, a change in posture, a hand that stops midway through a gesture

**The rhythm of a well-executed betrayal scene**:
1. The setup that feels routine (this masks the tension)
2. The moment of action (brief; almost offhand)
3. The pause — the physical registration
4. What the betrayed character does next (their response reveals everything)

#### 2.3 The Council or Court Scene

The set piece of political fiction — many players in a formal space, performing their public roles while pursuing private agendas.

**Key principles**:
- **The official agenda vs. the real agenda**: Every formal proceeding has both; the gap is the drama
- **Who is watching**: The most important person in a council scene is often not the one speaking but the one taking careful note of everyone else''s reactions
- **The absent player**: Someone not in the room is often the subject of the meeting; making their presence felt through absence is a powerful technique
- **Movement as power**: Who speaks first, who defers, who sits without being asked — the physical choreography of a court scene should be legible as a map of the current power balance

#### 2.4 The Private Conversation

Two characters, no audience, and presumably fewer masks. But in Grim-Politics, the masks rarely fully drop.

**Key principles**:
- **Different registers in private vs. public**: If two characters are formal in public and blunt in private, the transition should be visible — the first private conversation between two players should include the moment they downshift
- **The thing neither will say**: Even in private, there is often a central truth that neither character will name directly; this thing should be legible to the reader as the elephant in the room
- **Trust as a quantifiable thing**: Private conversations are where characters decide how much they trust each other. The reader should be able to track whether trust increases or decreases.

#### 2.5 The Aftermath Scene

After the major event — a betrayal, a death, a political reversal. The aftermath is where the genre''s argument is made.

**Key principles**:
- **Show the accounting**: Who won, who lost, what it actually cost — make the balance sheet concrete
- **The winner''s problem**: The aftermath scene should contain the seed of the next problem; winning creates the conditions for the next loss
- **Do not moralize**: The aftermath is not where the prose says "and so he learned that betrayal leads to betrayal." Show the outcome. Let the reader do the moral work.
- **Physical aftermath matters**: Bodies disposed of; documents sealed; positions vacated — the physical consequences make the political consequences feel real

---

### III. Dialogue Craft

#### The Performative Register

Court dialogue should read as if every sentence has been proofread before delivery. No character in a court scene speaks carelessly.

**Techniques**:
- **Honorifics as weapons**: Choosing which title to use for someone is itself a political act — using a lesser title is a slight; using the full formal title is a threat
- **Questions that aren''t questions**: "I wonder if His Grace has considered..." means "His Grace has made an error and everyone in this room knows it"
- **Compliments as threats**: "Lord Vane''s network has been so thorough in its intelligence-gathering" means "I know you''ve been watching me"

#### The Private Register

When characters drop the court register, the change should feel like a release of pressure. The private register is blunter — but still not fully honest.

**Techniques**:
- **Contractions appear**: Characters who speak in impeccable formal prose start using contractions in private — this is a legible signal
- **Names instead of titles**: First names or informal names as a signal of trust (or claimed trust)
- **Silence as communication**: In private, what isn''t said is as meaningful as what is

#### Dialogue Punctuation

The prose around dialogue matters as much as the dialogue itself:
- **No adverb said-bookisms**: Never "he said coldly," "she replied sarcastically" — the dialogue and staging should do this work
- **Action beats instead of attributions**: "Vane picked up the letter." as a beat before a line of dialogue, not "Vane said coldly"
- **The unfinished sentence**: Political speech often trails off — the character knows they don''t need to finish; everyone understood by the third word

---

### IV. Pacing Control

#### Chapter Structure

Each chapter in a Grim-Politics novel should advance at least one scheme by at least one move. A chapter where the political position is identical at the end to what it was at the beginning has not earned its place.

**Chapter opening**: Start in action or mid-conversation. Avoid establishing scenes that describe the setting before anything happens.

**Chapter closing**: The last line of a chapter should be the one the reader takes with them. In Grim-Politics, the best chapter endings are ones that recontextualize what just happened — a single piece of information that makes everything in the chapter mean something different.

#### Managing Multiple Plot Lines

When intercutting between multiple schemes:
- **Each POV/thread should have momentum**: Don''t cut to a thread that has nothing happening
- **Cut on rising action**: Leave each thread at a point of tension; return to it after the tension has had time to ferment in the reader''s mind
- **Create resonance between threads**: Events in one thread should cast light on events in another — the same betrayal logic playing out at different scales

#### Pacing the Information Release

The greatest pacing challenge in political fiction: information is the currency, and spending it too fast or too slow breaks the story.

**Too fast**: The reader knows everything by the midpoint; the second half is an execution of what they already understand. Dull.
**Too slow**: The reader doesn''t have enough information to generate their own theories; the story feels opaque rather than complex. Alienating.

**The right pace**: The reader always knows enough to have a theory. They are usually right about the shape but wrong about the scale or the specific mechanism. The revelation adjusts their understanding rather than overturning it.

---

### V. Common Writing Errors

1. **The dialogue explains the subtext**: Characters saying "I suspect you''re planning to betray me" instead of acting on that suspicion through maneuvering — the dialogue should be the performance, not the analysis
2. **The atrocity is described with horror vocabulary**: "The terrible massacre," "the horrifying order" — let the act speak. Descriptive horror vocabulary signals that the author is shocked; Grim-Politics narrators are never shocked.
3. **The protagonist wins through luck**: Any important plot development should follow from decisions and positioning; coincidence as a resolution feels cheap
4. **Interior monologue that is too honest**: Political characters lie to themselves as readily as they lie to others; a character''s interior monologue that fully acknowledges their own corruption is both psychologically false and narratively cheap
5. **Undifferentiated voices**: Every character in a court should have a recognizable speech register; if you cannot tell who is speaking from the line alone, the characterization is insufficient
6. **The moral lesson delivered**: At no point in Grim-Politics prose should the narrator, through word choice or framing, suggest that events are punishment or reward for the character''s moral choices — the prose should be clinically neutral about causality
7. **Description that stops the action**: Long environmental descriptions in the middle of tense scenes break the pacing; in a negotiation, the reader wants the dialogue and staging, not a detailed account of the tapestries',
  '## Grim-Politics Narrative Writing Guidance

Prose-level guidance: how to execute scenes, not what to write.

### I. Language Style
Measured and precise — like a very good historian telling you what actually happened. Verbs over adjectives; passive voice for political violence; understatement for atrocity; short sentences at moments of consequence. The gap between speech and meaning conveyed through physical reactions, not interpretation.

### II. Core Scene Types

**The Negotiation Scene**: Stable internal objectives for both parties; power balance through physical staging; the concession that actually serves the conceder; last line is the real message.

**The Betrayal Scene**: Betrayer must be right (understandable logic); victim''s realization often more important than the act; don''t explain — show; physical registration before emotional.

**The Council Scene**: Official vs. real agenda; who watches while others speak; the absent player as presence; physical choreography as power map.

**The Private Conversation**: Register shift from public to private is visible; the thing neither will name; trust as a quantifiable resource.

**The Aftermath Scene**: Show the accounting concretely; winner''s problem contains next loss; never moralize.

### III. Dialogue Craft
Honorifics as weapons; questions that aren''t questions; compliments as threats. Private register: contractions appear, names instead of titles, silence as communication. No adverb said-bookisms; action beats instead of attributions.

### IV. Pacing
Each chapter advances at least one scheme by one move. Cut chapters on rising action. Information release pace: reader always has enough to have a theory — usually right about shape, wrong about scale.

### V. Common Errors
Dialogue explains subtext; horror vocabulary for atrocity; protagonist wins through luck; interior monologue too honest; undifferentiated character voices; moral lesson delivered; description stopping action.',
  (SELECT id FROM novel_creation_method WHERE name = 'Grim-Politics Novel' LIMIT 1),
  1,
  100,
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
