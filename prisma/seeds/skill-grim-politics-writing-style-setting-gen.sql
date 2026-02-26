-- Grim-Politics Novel「Writing Style」setting generation skill (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-grim-politics-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'grim-politics-writing-style-setting-gen',
  '「Writing Style」设定生成：为 Grim-Politics Novel 生成文风设定，包括叙事视角、文风、节奏、对话风格与道德模糊的处理方式',
  '"Writing Style" setting generation: generate writing style settings for Grim-Politics novels, covering narrative POV, prose style, pacing, dialogue, and handling of moral ambiguity',
  '## "Writing Style" Setting Generation — Grim-Politics Novel

The writing style in Grim-Politics is not just aesthetic — it is the mechanism by which the reader is drawn into complicity. The choices made here determine whether readers feel like observers of a corrupt system or participants in it; whether betrayals land as shocks or as inevitable completions of a logic the reader already understood.

---

### Field Generation Guide

#### Narrative POV

The single greatest structural choice. Each POV creates a fundamentally different relationship between reader and political game.

**Third Person — Multiple POVs (The Game of Thrones Approach)**
The most common approach for large-scale political intrigue. Readers know more than any single character; dramatic irony is structural. The reader watches different players'' private thoughts while they lie to each other''s faces.
- *Advantage*: Shows the game from all sides; creates information asymmetry; allows sympathy to shift
- *Risk*: Readers know who is going to be betrayed before the character does; requires management of pacing so foreknowledge creates dread rather than impatience
- *Best for*: Stories with many factions, no single protagonist, and a focus on systemic dynamics

**Third Person — Single POV (One Player''s Perspective)**
The reader is limited to what the protagonist knows. All other characters are opaque. This creates a different kind of paranoia: the reader shares the protagonist''s uncertainty.
- *Advantage*: Tighter identification with one political player; reversals hit harder; the reader is genuinely deceived alongside the protagonist
- *Risk*: The protagonist must be interesting enough to sustain the whole book; other characters are seen only as the protagonist sees them
- *Best for*: Stories centered on a single schemer or survivor; intimate-scale political intrigue

**First Person — The Schemer Narrates**
The narrator is a political player looking back on events. This creates an immediate question: why are they telling this story, and what are they concealing?
- *Advantage*: Intimacy; dark humor; the voice itself can be unreliable; confessional tone
- *Risk*: The narrator must be alive and safe enough to narrate, which limits tension; requires careful management of retrospective irony
- *Best for*: Memoirs, confessions, political histories told by one of the participants

**Unreliable Narrator — The Official History is a Lie**
The frame of the story is itself compromised: the narrator has reasons to deceive, or has deceived themselves. The reader must read against the grain.
- *Advantage*: The most politically sophisticated approach; the unreliability itself is part of the theme
- *Risk*: Requires very careful management; the reader must have access to enough information to triangulate the truth
- *Best for*: Stories about history, propaganda, and the construction of political legitimacy

#### Prose Style

How the story sounds. In Grim-Politics, prose style is part of the political argument.

**Dry and Precise — Like a Political Dispatch**
Sentences that report without editorializing. Atrocities described in the same register as protocol decisions. The horror of what is being calmly described is the point.
- Signals: Clinical detachment; the system normalizes the monstrous

**Dense and Layered — Every Sentence Hides Subtext**
Prose that rewards re-reading; where what characters say and what they mean are never the same thing; where the most important information is in the subordinate clauses.
- Signals: The reader is being put through the same interpretive labor as a courtier

**Sharp and Ironic — The Gap Between What''s Said and Done**
Authorial irony as structural principle. The prose notes the distance between ideology and reality with a kind of cold amusement.
- Signals: The author sees through the pretensions; cynicism as default mode

**Lush and Poisonous — Beauty Masking Rot**
Rich sensory prose that makes the court beautiful while the corruption is rendered in the same lush terms. The reader is seduced into finding the rottenness attractive.
- Signals: The aesthetic appeal of power and its corruption; the reader is implicated in finding it beautiful

**Sparse and Cold — Emotion Stripped Away**
Minimum viable prose; plot-driven; the reader supplies emotional response to events the text refuses to describe emotionally.
- Signals: The game is beyond sentiment; sentiment is a vulnerability

#### Pacing

How the story moves.

**Slow Boil — Tension Builds Scene by Scene**
Each scene advances a scheme by one move. The satisfaction is cumulative — by the climax, the reader has understood every piece that fell into place. Best for readers who want to trace the architecture.

**Intercutting — Multiple Schemes in Parallel**
Chapters alternate between different players moving their pieces. Each chapter ends on a point of tension that the next chapter doesn''t immediately resolve. Creates a sense of a board in motion.

**Episodic Escalation — Each Act Raises the Stakes**
The story is organized around distinct power-shifts; each shift is bigger than the last. Best for stories that want clear structural acts.

**Sudden Reversals — The Ground Shifts Without Warning**
Long stretches of apparent stability interrupted by moments of violent reorientation. The reader (like the characters) cannot see the reversal coming.

#### Dialogue Style

How characters speak to each other — and how much of what they say is real.

**Every Word a Weapon — Nothing Said Directly**
Court dialogue: requests are commands, questions are accusations, compliments are threats. Readers must translate. This is the most technically demanding dialogue style to write, but the most rewarding when executed.

**Formal and Coded — The Court Register**
Characters speak with formal precision because formality is armor. The register itself signals context and danger. Breaking formal register is itself a power move.

**Blunt Behind Closed Doors — Masks Drop in Private**
A two-register system: public performance in formal settings, private directness in trusted spaces. The gap between the registers reveals character.

**Performative — Characters Act for Unseen Audiences**
Every interaction is a performance — even "private" conversations are conducted with the awareness of who might be listening. This creates a world of infinite performance and zero authentic expression.

#### Moral Ambiguity Handling

How the text positions the reader relative to the characters'' moral choices.

**Reader Judges — No Authorial Comment**
The text presents; the reader decides. Characters do monstrous things without authorial editorializing. The reader is trusted to maintain their own moral position without help.

**Authorial Irony — We Know More Than Characters**
The author''s voice, through selection and framing, tells us these characters are wrong without characters ever knowing. The irony is structural: the reader knows what the characters cannot see.

**Tragic Framing — Sympathy Without Endorsement**
The reader is made to understand why characters make terrible choices, without the text endorsing those choices. The framing invites sympathy and horror simultaneously.

**Pure Observation — The Author Watches Without Feeling**
The most extreme option: the text genuinely doesn''t editorialize in any direction. The reader is on their own. This is the most disturbing approach because it refuses to provide any moral scaffolding.

#### Banned Words

Words and phrases that break the genre''s register. In Grim-Politics, these are typically:
- **Noble platitudes**: "honor," "glory," "just cause," "for the people" — unless used ironically
- **Fantasy action clichés**: "battle-fury," "heroic charge," "destiny," "chosen one"
- **Redemption vocabulary**: "learned from their mistakes," "changed," "became better" — the genre doesn''t do arcs in this direction
- **Clarity vocabulary**: In dialogue specifically, characters should rarely mean what they say; avoid "he meant to say" or "she finally admitted"

---

### Field Linkage

- Narrative POV → determines how much the reader knows vs. the characters; multiple POV creates dramatic irony, single POV creates shared uncertainty
- Prose Style → must match Story Tone (Cold and Calculating → Dry and Precise; Operatically Tragic → Lush and Poisonous)
- Dialogue Style → must be consistent with how corrupt the court is (the more corrupt, the more encoded the speech)
- Moral Ambiguity Handling → must be consistent with Moral Framework from Core Premise

### Common Errors

1. **POV inconsistency**: Starting as single POV and suddenly dipping into another character''s thoughts
2. **Dialogue that is too direct**: In a corrupt court, no one says what they mean in company
3. **Moral Ambiguity undermined by sentiment**: Claiming Pure Observation and then writing characters who feel profound guilt that the prose validates
4. **Pacing that frontloads reveals**: In political intrigue, the slow accumulation of information IS the genre experience',
  '"Writing Style" setting generation for Grim-Politics novels. Writing style determines whether readers feel like observers or participants in the corrupt system.

### Narrative POV
Multiple POVs (readers know more than any character — dramatic irony is structural), Single POV (reader shares protagonist''s paranoia — reversals hit harder), First Person Schemer (intimacy, dark humor, unreliability), Unreliable Narrator (the official history is a lie — reader must read against the grain).

### Prose Style
Dry and Precise (atrocities in the same register as protocol), Dense and Layered (every sentence hides subtext), Sharp and Ironic (the gap between what''s said and done), Lush and Poisonous (beauty masking rot — reader seduced into finding corruption attractive), Sparse and Cold (the game is beyond sentiment).

### Pacing
Slow Boil (each scene advances a scheme one move), Intercutting (multiple schemes in parallel, each chapter ends on tension), Episodic Escalation (distinct power-shifts, each bigger than last), Sudden Reversals (long stability interrupted by violent reorientation).

### Dialogue Style
Every Word a Weapon (nothing direct), Formal and Coded (register as armor), Blunt Behind Closed Doors (two-register system), Performative (even private conversations performed for unseen audiences).

### Moral Ambiguity Handling
Reader Judges (no authorial comment), Authorial Irony (we know more than characters), Tragic Framing (sympathy without endorsement), Pure Observation (the author watches without feeling).

### Banned Words
Noble platitudes (honor, glory, just cause), fantasy action clichés (destiny, chosen one), redemption vocabulary (changed, became better), clarity vocabulary in dialogue.',
  (SELECT id FROM novel_creation_method WHERE name = 'Grim-Politics Novel' LIMIT 1),
  1,
  14,
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
