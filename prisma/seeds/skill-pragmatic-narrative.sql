-- The Purely Pragmatic Novel — Narrative Writing Skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-pragmatic-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'pragmatic-narrative',
  'Narrative writing guidance for The Purely Pragmatic Novel: how to render the rational mind on the page — the calculation, the performance, and what it costs',
  'Narrative writing guidance for The Purely Pragmatic Novel: how to render the rational mind on the page — the calculation, the performance, and what it costs',
  '## Narrative Writing — The Purely Pragmatic Novel

This skill focuses on the act of writing: sentence by sentence, scene by scene. It does not repeat setting content. It addresses the craft problem that is unique to this story type: how do you render a rational mind on the page in a way that is compelling rather than clinical, honest rather than flattering, and uncomfortable in exactly the right way?

The central challenge is not making the protagonist likable. It is making the protagonist legible — the reader must be able to follow the logic, understand the calculations, and feel the texture of a consciousness that treats the world as a system to be navigated. When this works, readers experience something rare: the pleasure of watching a genuinely different mind operate, and the queasy recognition that the mind is not entirely wrong.

---

### I. Language Style: The Aesthetic of the Rational Protagonist

#### 1.1 The Default Register: Precise, Economic, Non-Judgmental

The rational protagonist''s internal language is not cold — it is *accurate*. They do not say "he was being manipulative"; they note "he introduced the request as a favor, implying reciprocal obligation." They do not say "she seemed nervous"; they observe "her response latency increased and she twice corrected an already-correct sentence."

This precision is not a personality affectation. It is the actual operation of a mind trained to observe rather than interpret, to measure rather than feel. Writing in this register requires stripping evaluative language from description wherever the protagonist is the observer:

**Avoid** (evaluative, the narrator''s judgment smuggled in):
- "The negotiation was going badly."
- "He could tell she was hiding something."
- "The room felt threatening."

**Use instead** (observational, the protagonist''s actual perception):
- "Three of the six agreed. Two had not spoken. One had spoken three times, always in questions."
- "Her answers were complete and consistent. She had prepared them."
- "Two exits. One guard positioned to watch the nearer one."

#### 1.2 Economy of Language

The protagonist does not over-explain. Their internal narration is dense but not ornate. They note what is relevant; they do not meditate on it. A three-sentence observation replaces a three-paragraph impression.

This economy should extend to the prose itself. Long sentences describing emotional atmosphere are wrong for this story. Short, declarative sentences with embedded analysis are correct:

**Wrong register**:
"The dinner party stretched on into the warm evening, a gathering of old money and new ambition swirling around the host like satellites around a dimming star, and Marcus moved through it all with the practiced ease of someone who had learned long ago to make himself unremarkable in rooms where being remarkable was a liability."

**Correct register**:
"Marcus had attended eleven dinners at this house. He had been useful at four of them. He was here to make tonight the fifth."

#### 1.3 Performance Mode: The Language Switch

When the protagonist is performing — presenting a social mask to other characters — the prose must run two tracks simultaneously: what is being said and what is being calculated.

This is not achieved through alternating sections. It is achieved through the grain of the prose itself. The performed dialogue is natural and functional. The surrounding narration carries the analysis:

"''I haven''t seen enough of you lately,'' he said — which was true, and which she would hear as reproach, and which would make her more forthcoming in the next ten minutes than she had been in the previous three weeks."

The reader is always aware of the gap between the social surface and the analytical substrate. This gap is the novel''s primary source of tension.

---

### II. Core Scene Writing Techniques

#### 2.1 The Calculation Scene: Rendering the Thinking Mind

The calculation scene is the genre''s signature. Done well, it is deeply satisfying. Done poorly, it reads as the author telling the reader that the protagonist is smart without demonstrating why.

**The cardinal rule**: Show the actual steps, not the result.

**Bad example** (result without steps):
"In moments, he had assessed the situation and identified the approach that would work. He would need Chen''s cooperation and about three days."

The reader is told a conclusion. They have no basis to trust it and no satisfaction in watching it formed.

**Good example** (steps shown):
"Chen had introduced the project as requiring external review — which meant internal sign-off had already failed at least once. Someone above Chen had already said no. Whoever had said no was either still in the room (in which case the ask would fail again the same way) or no longer in the room (in which case Chen was hoping the new situation had changed the calculation). Marcus looked at the table. Ferris was gone. Ferris had been the one blocking the budget expansion six months ago. Three days, he estimated. Enough time for Chen to brief whoever had replaced Ferris''s function."

The reader can follow this. They can verify it. When the three days prove accurate, they experience the satisfaction of a model confirmed.

**Structure for calculation scenes**:
1. Open with the problem as it presents to other characters (apparently complex)
2. Show the protagonist isolating the key variable (the one thing that determines everything else)
3. Show the chain of inference that follows from that variable
4. Land on the strategic insight — what the protagonist can now do
5. Move immediately to action based on the insight

#### 2.2 The Social Performance Scene: Double-Layer Writing

The protagonist moves through social environments wearing a performed version of themselves. This performance is not deception for its own sake — it is a necessary interface, because the protagonist has learned that operating as themselves would be inefficient or dangerous in most contexts.

Writing this requires holding two realities simultaneously:

**Layer 1**: The performed surface — what the protagonist says, the warmth in their voice, the appropriate emotional responses they produce. This must be convincing. It must read as normal human social interaction to other characters.

**Layer 2**: The analytical substrate — what the protagonist is actually thinking, observing, and calculating while the performance runs.

The technique is to write the dialogue straight, but embed the analysis in the surrounding narration without breaking the scene''s rhythm:

"''You look tired,'' Maya said.

''It''s been a difficult month,'' he agreed — slightly more than she had implied, enough to seem honest without offering detail. She would feel she had seen something real.

''For all of us,'' she said.

Which meant she had not been following the project''s timeline closely. Good."

The reader watches the performance and the analysis at the same time. Neither is hidden from the reader — only the analysis is hidden from the other characters. This creates a specific kind of dramatic irony: the reader is inside the performance watching it operate.

**Calibration notes**:
- Do not over-annotate. Not every line of dialogue needs an analytical note. Only annotate what is strategically significant.
- The protagonist''s performed warmth should be competent, not perfect. They are good at this, not flawless. Occasional slight miscalibrations keep the performance human.
- Other characters do not notice the performance. If they notice, it is a plot event, not a stylistic failure.

#### 2.3 The Investment Payoff Scene: Why It Should Not Feel Clean

When the protagonist''s earlier investment returns — the contact delivers, the positioned piece moves, the prepared argument lands — the reader expects satisfaction. Give them the satisfaction, but seed it with a discrepancy.

The payoff arrives. It is roughly what was modeled. But something is slightly off: the contact delivered but included an unsolicited addition. The positioned piece moved but left a trace the protagonist had not accounted for. The argument landed but changed the target''s relationship to the protagonist in a way that was not calculated.

This is not sabotage of the reader''s satisfaction. It is honest accounting. Perfect returns do not exist. Every payoff scene that is too clean is training the reader to expect a frictionless world — which will make the eventual blind spot feel like a betrayal rather than a natural consequence.

**Structure**:
1. Show the protagonist in the moment just before the payoff (brief — they are waiting, but it does not feel like waiting to them, it feels like monitoring)
2. The payoff arrives — write it concisely, match the energy the protagonist would give it (not excitement, recognition)
3. The discrepancy appears — note it through the protagonist''s observation, not through alarm
4. The protagonist incorporates the discrepancy into the model and moves on

The discrepancy is not a problem yet. It is a data point. Its significance will only be clear later.

#### 2.4 The Unexpected Variable Scene: Analysis, Not Shock

When something happens outside the model''s predictions, the protagonist does not freeze, panic, or reel. They analyze.

This is one of the hardest scenes to write correctly, because human readers naturally expect a shock response. The protagonist''s analytical response can feel wrong — inhuman, even — which is part of the genre''s discomfort.

**The key**: Show the analysis happening fast enough that it reads as reflex. The protagonist does not stop to think. They immediately begin decomposing the event into implications.

"The car was not where it was supposed to be.

He looked at the space — empty, a slight oil stain, one hour of parking remaining on the meter. The car had been moved, not towed. Someone had moved it since morning. Which meant someone had been here, had the key, and had reasons they had not shared.

He noted three people who had copies of that key. He noted which of them had expected to need it today. Only one person''s schedule had been unclear when he had last checked.

He walked to the coffee shop on the corner. He ordered. He adjusted."

The scene runs hot — everything happens fast. But the temperature is intellectual, not emotional. The protagonist is not unsettled; they are recalculating.

**Critical distinction**: The protagonist may notice that they feel something — a tightening of attention, a shift in some background register. They register this. They do not dismiss it or perform being unaffected. They simply do not allow it to drive the response. The analysis drives the response.

#### 2.5 The Cost Recognition Scene: The "Continued" Is the Horror

The protagonist notices a cost. They register it. They continue.

This is the scene type that most distinguishes this genre from both the competence fantasy (where costs don''t exist) and the tragic hero arc (where costs produce transformation). Here, costs are real and acknowledged — and they do not change the trajectory.

**The writing challenge**: How do you make this scene land? The protagonist cannot seem heartless (that is a failure of characterization) but they also cannot seem troubled in a way that derails them (that is a failure of genre).

The solution is in the *specificity* of what they notice. A heartless character sees nothing. A conventional protagonist is overwhelmed. The rational protagonist sees exactly what happened, registers it with precision, and files it.

"The call ended. Miriam had said she would not be at the conference. He noted this. She had attended the last four years without interruption. The interruption was him — not what he had asked of her, which she had agreed to, but something in the pattern of the last six months that had made her decide her presence in a room with him was not something she wanted.

He understood this.

He had two meetings before five o''clock. He reviewed the first one''s agenda."

The "He reviewed the first one''s agenda" is the sentence that does the work. Not because it is callous — but because it is honest. This is what the rational protagonist does. The reader feels the gap. The reader carries the discomfort. The protagonist does not carry it — they have filed it.

---

### III. Dialogue Style

#### 3.1 The Rational Protagonist''s Dialogue: Always Layered

The protagonist never says only what they mean. They say what will produce the desired response, which may or may not be what they mean.

This creates dialogue that is technically honest (they never lie outright, as a rule — lying is inefficient because it requires maintenance) but strategically shaped. Every word is chosen for effect.

**The protagonist in conversation does three things simultaneously**:
- Says what is necessary to produce the desired reaction
- Listens for information the other party is giving without intending to
- Adjusts the approach based on what is being received

This makes their dialogue feel slightly more deliberate than normal speech — and readers will notice this even if they cannot articulate why. This slight deliberateness is correct. Do not sand it away.

#### 3.2 Dialogue with Different Character Types

**With high-status, capable characters** (equals or near-equals):
The protagonist is more direct. Less performance is required when both parties understand the rules. Dialogue is efficient, sometimes competitive. The protagonist may acknowledge the other person''s capability explicitly — this is not politeness, it is accurate accounting.

"''You already know what I''m going to ask,'' Marcus said.
''I know what you think you''re going to ask,'' Chen replied.
This was interesting. Marcus revised his opening."

**With people the protagonist has positioned as assets**:
Warmer in register, more patient. The protagonist is maintaining an investment. The warmth is genuine in function if not in origin — the protagonist does care about this person''s wellbeing, because the person is valuable.

**With The Anomaly** (the character who doesn''t fit the model):
This is where dialogue gets genuinely uncertain. The protagonist cannot fully predict the response, so they are more careful — more observational, less declarative. The Anomaly may be the only character who sometimes surprises the protagonist mid-sentence.

**With people who are not strategically significant**:
Minimal and functional. The protagonist is not rude — rudeness is costly — but they are efficient. Other characters may read this efficiency as reserve, as confidence, or as arrogance, depending on their own frameworks.

---

### IV. Pacing and Rhythm

#### 4.1 Chapter Openings: The Blueprint Sense

Each chapter should open with a sense of orientation — where is the protagonist in their current calculation? Not through explicit statement ("Marcus was in phase two of his plan") but through the texture of what they are doing.

A chapter that opens with the protagonist observing something they did not expect is an Unexpected Variable chapter. A chapter that opens with the protagonist completing a routine step is an Accumulation chapter. The reader should feel the protagonist''s relationship to their own timeline.

**Effective chapter opening technique**: Open in the middle of action, but action that implies a prior calculation. The reader understands immediately that what they are watching is a step in something larger.

"He arrived forty minutes before the event was scheduled to begin. He wanted to see who else arrived early — and why."

This sentence tells the reader: the protagonist has a reason for being here that goes beyond attendance. They are gathering information. The chapter is a working chapter.

#### 4.2 Chapter Endings: The Ledger Update

Strong chapter endings in this genre update the protagonist''s model. They do not end on emotional beats ("he felt the weight of everything he had sacrificed") but on cognitive state changes:

- Something has been confirmed
- Something has been added to the ledger
- Something unexpected has been noted and deferred
- A decision has been made and committed to

"The dinner had confirmed three things and suggested a fourth. The fourth was interesting. He would need to find out if it was real before he moved the next piece."

This ending pulls the reader forward through intellectual anticipation rather than emotional suspense. The reader wants to know what the fourth thing is, and whether it is real.

#### 4.3 Controlling the Pace of Payoff Scenes

During periods when the protagonist''s calculations are paying off — the Accumulation Phase, the First Major Investment''s returns — there is a temptation to write these scenes at the same pace as the calculation scenes. Resist this.

Payoff scenes should be faster. The protagonist expected this; it registers quickly. The reader should experience the payoff as the protagonist experiences it: as confirmation, not as celebration. Three sentences where the calculation scene needed a page.

The contrast in pacing between "working toward" and "receiving" communicates something important about this protagonist''s psychology: the work is interesting. The return is just accounting.

---

### V. Common Writing Mistakes

1. **Explaining the protagonist''s genius instead of demonstrating it**: Narration that tells the reader "few people could have seen what he saw" without then showing what he saw and why it was remarkable. The reader must be able to evaluate the insight themselves.

2. **Making the protagonist emotionally flat**: The rational protagonist has emotions. They notice them, assess them, and do not allow them to override analysis. Flatness is a different thing — a character who registers nothing is not rational, they are a plot device. Give the protagonist internal weather; just show them observing it rather than being moved by it.

3. **Writing the performance as fakery**: The protagonist''s social performance is not deception in the simple sense. It is a communication interface. Writing it as manipulation-with-contempt mischaracterizes the protagonist''s relationship to the people they interact with. They do not think of others as marks. They think of them as elements in a system.

4. **Resolving the Anomaly too quickly**: The character who does not fit the model should remain unresolved for most of the novel. If the protagonist figures them out early, they cease to be an anomaly. Let the protagonist be persistently uncertain about this one person.

5. **Letting the analytical narration become lecturing**: When the protagonist''s observations become too long, they start to feel like the author explaining things to the reader. Keep the analytical passages tight. The protagonist is not teaching — they are thinking.

6. **Forgetting that other characters have full interiority**: Because the reader is inside the protagonist''s analytical perspective, other characters can seem like types — assets, obstacles, anomalies. But the novel must create the impression that other characters have lives and frameworks the protagonist does not fully see. The protagonist''s blind spot is often a character they have categorized incorrectly.

7. **Writing dialogue that sounds like strategy sessions**: Real conversations, even ones the protagonist is managing, do not sound like chess. The surface level of all dialogue must be socially natural. The analysis lives in the narration, not in the dialogue''s register.

8. **Removing all warmth from the prose**: The prose should be precise, not cold. These are different. Precision is the quality of saying exactly what you mean. Cold is the quality of not caring. The protagonist cares — about the outcome, about the model, about certain specific people and things. The prose can be warm about what the protagonist is warm about.',
  '## Narrative Writing — The Purely Pragmatic Novel

This skill focuses on the act of writing: sentence by sentence, scene by scene. It does not repeat setting content. It addresses the craft problem that is unique to this story type: how do you render a rational mind on the page in a way that is compelling rather than clinical, honest rather than flattering, and uncomfortable in exactly the right way?

The central challenge is not making the protagonist likable. It is making the protagonist legible — the reader must be able to follow the logic, understand the calculations, and feel the texture of a consciousness that treats the world as a system to be navigated. When this works, readers experience something rare: the pleasure of watching a genuinely different mind operate, and the queasy recognition that the mind is not entirely wrong.

---

### I. Language Style: The Aesthetic of the Rational Protagonist

#### 1.1 The Default Register: Precise, Economic, Non-Judgmental

The rational protagonist''s internal language is not cold — it is *accurate*. They do not say "he was being manipulative"; they note "he introduced the request as a favor, implying reciprocal obligation." They do not say "she seemed nervous"; they observe "her response latency increased and she twice corrected an already-correct sentence."

This precision is not a personality affectation. It is the actual operation of a mind trained to observe rather than interpret, to measure rather than feel. Writing in this register requires stripping evaluative language from description wherever the protagonist is the observer:

**Avoid** (evaluative, the narrator''s judgment smuggled in):
- "The negotiation was going badly."
- "He could tell she was hiding something."
- "The room felt threatening."

**Use instead** (observational, the protagonist''s actual perception):
- "Three of the six agreed. Two had not spoken. One had spoken three times, always in questions."
- "Her answers were complete and consistent. She had prepared them."
- "Two exits. One guard positioned to watch the nearer one."

#### 1.2 Economy of Language

The protagonist does not over-explain. Their internal narration is dense but not ornate. They note what is relevant; they do not meditate on it. A three-sentence observation replaces a three-paragraph impression.

This economy should extend to the prose itself. Long sentences describing emotional atmosphere are wrong for this story. Short, declarative sentences with embedded analysis are correct:

**Wrong register**:
"The dinner party stretched on into the warm evening, a gathering of old money and new ambition swirling around the host like satellites around a dimming star, and Marcus moved through it all with the practiced ease of someone who had learned long ago to make himself unremarkable in rooms where being remarkable was a liability."

**Correct register**:
"Marcus had attended eleven dinners at this house. He had been useful at four of them. He was here to make tonight the fifth."

#### 1.3 Performance Mode: The Language Switch

When the protagonist is performing — presenting a social mask to other characters — the prose must run two tracks simultaneously: what is being said and what is being calculated.

This is not achieved through alternating sections. It is achieved through the grain of the prose itself. The performed dialogue is natural and functional. The surrounding narration carries the analysis:

"''I haven''t seen enough of you lately,'' he said — which was true, and which she would hear as reproach, and which would make her more forthcoming in the next ten minutes than she had been in the previous three weeks."

The reader is always aware of the gap between the social surface and the analytical substrate. This gap is the novel''s primary source of tension.

---

### II. Core Scene Writing Techniques

#### 2.1 The Calculation Scene: Rendering the Thinking Mind

The calculation scene is the genre''s signature. Done well, it is deeply satisfying. Done poorly, it reads as the author telling the reader that the protagonist is smart without demonstrating why.

**The cardinal rule**: Show the actual steps, not the result.

**Bad example** (result without steps):
"In moments, he had assessed the situation and identified the approach that would work. He would need Chen''s cooperation and about three days."

The reader is told a conclusion. They have no basis to trust it and no satisfaction in watching it formed.

**Good example** (steps shown):
"Chen had introduced the project as requiring external review — which meant internal sign-off had already failed at least once. Someone above Chen had already said no. Whoever had said no was either still in the room (in which case the ask would fail again the same way) or no longer in the room (in which case Chen was hoping the new situation had changed the calculation). Marcus looked at the table. Ferris was gone. Ferris had been the one blocking the budget expansion six months ago. Three days, he estimated. Enough time for Chen to brief whoever had replaced Ferris''s function."

The reader can follow this. They can verify it. When the three days prove accurate, they experience the satisfaction of a model confirmed.

**Structure for calculation scenes**:
1. Open with the problem as it presents to other characters (apparently complex)
2. Show the protagonist isolating the key variable (the one thing that determines everything else)
3. Show the chain of inference that follows from that variable
4. Land on the strategic insight — what the protagonist can now do
5. Move immediately to action based on the insight

#### 2.2 The Social Performance Scene: Double-Layer Writing

The protagonist moves through social environments wearing a performed version of themselves. This performance is not deception for its own sake — it is a necessary interface, because the protagonist has learned that operating as themselves would be inefficient or dangerous in most contexts.

Writing this requires holding two realities simultaneously:

**Layer 1**: The performed surface — what the protagonist says, the warmth in their voice, the appropriate emotional responses they produce. This must be convincing. It must read as normal human social interaction to other characters.

**Layer 2**: The analytical substrate — what the protagonist is actually thinking, observing, and calculating while the performance runs.

The technique is to write the dialogue straight, but embed the analysis in the surrounding narration without breaking the scene''s rhythm:

"''You look tired,'' Maya said.

''It''s been a difficult month,'' he agreed — slightly more than she had implied, enough to seem honest without offering detail. She would feel she had seen something real.

''For all of us,'' she said.

Which meant she had not been following the project''s timeline closely. Good."

The reader watches the performance and the analysis at the same time. Neither is hidden from the reader — only the analysis is hidden from the other characters. This creates a specific kind of dramatic irony: the reader is inside the performance watching it operate.

**Calibration notes**:
- Do not over-annotate. Not every line of dialogue needs an analytical note. Only annotate what is strategically significant.
- The protagonist''s performed warmth should be competent, not perfect. They are good at this, not flawless. Occasional slight miscalibrations keep the performance human.
- Other characters do not notice the performance. If they notice, it is a plot event, not a stylistic failure.

#### 2.3 The Investment Payoff Scene: Why It Should Not Feel Clean

When the protagonist''s earlier investment returns — the contact delivers, the positioned piece moves, the prepared argument lands — the reader expects satisfaction. Give them the satisfaction, but seed it with a discrepancy.

The payoff arrives. It is roughly what was modeled. But something is slightly off: the contact delivered but included an unsolicited addition. The positioned piece moved but left a trace the protagonist had not accounted for. The argument landed but changed the target''s relationship to the protagonist in a way that was not calculated.

This is not sabotage of the reader''s satisfaction. It is honest accounting. Perfect returns do not exist. Every payoff scene that is too clean is training the reader to expect a frictionless world — which will make the eventual blind spot feel like a betrayal rather than a natural consequence.

**Structure**:
1. Show the protagonist in the moment just before the payoff (brief — they are monitoring, not waiting with anxiety)
2. The payoff arrives — write it concisely, match the energy the protagonist would give it (recognition, not excitement)
3. The discrepancy appears — note it through the protagonist''s observation, not through alarm
4. The protagonist incorporates the discrepancy into the model and moves on

#### 2.4 The Unexpected Variable Scene: Analysis, Not Shock

When something happens outside the model''s predictions, the protagonist does not freeze, panic, or reel. They analyze.

**The key**: Show the analysis happening fast enough that it reads as reflex. The protagonist does not stop to think. They immediately begin decomposing the event into implications.

"The car was not where it was supposed to be.

He looked at the space — empty, a slight oil stain, one hour of parking remaining on the meter. The car had been moved, not towed. Someone had moved it since morning. Which meant someone had been here, had the key, and had reasons they had not shared.

He noted three people who had copies of that key. He noted which of them had expected to need it today. Only one person''s schedule had been unclear when he had last checked.

He walked to the coffee shop on the corner. He ordered. He adjusted."

**Critical distinction**: The protagonist may notice that they feel something — a tightening of attention, a shift in some background register. They register this. They do not dismiss it or perform being unaffected. They simply do not allow it to drive the response.

#### 2.5 The Cost Recognition Scene: The "Continued" Is the Horror

The protagonist notices a cost. They register it. They continue.

The solution is in the *specificity* of what they notice. A heartless character sees nothing. A conventional protagonist is overwhelmed. The rational protagonist sees exactly what happened, registers it with precision, and files it.

"The call ended. Miriam had said she would not be at the conference. He noted this. She had attended the last four years without interruption. The interruption was him — not what he had asked of her, which she had agreed to, but something in the pattern of the last six months that had made her decide her presence in a room with him was not something she wanted.

He understood this.

He had two meetings before five o''clock. He reviewed the first one''s agenda."

The "He reviewed the first one''s agenda" is the sentence that does the work. Not because it is callous — but because it is honest. The reader feels the gap. The reader carries the discomfort. The protagonist does not carry it — they have filed it.

---

### III. Dialogue Style

#### 3.1 The Rational Protagonist''s Dialogue: Always Layered

The protagonist never says only what they mean. They say what will produce the desired response, which may or may not be what they mean. This creates dialogue that is technically honest but strategically shaped. Every word is chosen for effect.

**The protagonist in conversation does three things simultaneously**:
- Says what is necessary to produce the desired reaction
- Listens for information the other party is giving without intending to
- Adjusts the approach based on what is being received

#### 3.2 Dialogue with Different Character Types

**With high-status, capable characters** (equals or near-equals):
More direct. Less performance is required when both parties understand the rules. Dialogue is efficient, sometimes competitive.

"''You already know what I''m going to ask,'' Marcus said.
''I know what you think you''re going to ask,'' Chen replied.
This was interesting. Marcus revised his opening."

**With people the protagonist has positioned as assets**:
Warmer in register, more patient. The protagonist is maintaining an investment. The warmth is genuine in function if not in origin.

**With The Anomaly** (the character who doesn''t fit the model):
More careful — more observational, less declarative. The Anomaly may be the only character who sometimes surprises the protagonist mid-sentence.

**With people who are not strategically significant**:
Minimal and functional. Not rude — rudeness is costly — but efficient.

---

### IV. Pacing and Rhythm

#### 4.1 Chapter Openings: The Blueprint Sense

Each chapter should open with a sense of where the protagonist is in their current calculation — not through explicit statement, but through the texture of what they are doing. A chapter that opens with the protagonist observing something unexpected is an Unexpected Variable chapter. A chapter that opens with a routine completion is an Accumulation chapter.

**Effective technique**: Open in the middle of action that implies a prior calculation.

"He arrived forty minutes before the event was scheduled to begin. He wanted to see who else arrived early — and why."

#### 4.2 Chapter Endings: The Ledger Update

Strong chapter endings update the protagonist''s model. Not emotional beats, but cognitive state changes:

"The dinner had confirmed three things and suggested a fourth. The fourth was interesting. He would need to find out if it was real before he moved the next piece."

This pulls the reader forward through intellectual anticipation rather than emotional suspense.

#### 4.3 Controlling Payoff Scene Pacing

Payoff scenes should be faster than calculation scenes. The protagonist expected this; it registers quickly. Three sentences where the calculation scene needed a page. The contrast communicates something about this protagonist''s psychology: the work is interesting. The return is just accounting.

---

### V. Common Writing Mistakes

1. **Explaining the protagonist''s genius instead of demonstrating it**: Narration that tells the reader "few people could have seen what he saw" without showing what was seen and why it was remarkable. The reader must evaluate the insight themselves.

2. **Making the protagonist emotionally flat**: The rational protagonist has emotions. They notice them and do not allow them to override analysis. Flatness is different — a character who registers nothing is not rational, they are a plot device.

3. **Writing the performance as contemptuous fakery**: The protagonist''s social performance is not manipulation-with-contempt. They do not think of others as marks. They think of them as elements in a system. The prose must reflect this.

4. **Resolving the Anomaly too quickly**: The character who does not fit the model should remain unresolved for most of the novel. If the protagonist figures them out early, they cease to be an anomaly.

5. **Letting the analytical narration become lecturing**: When the protagonist''s observations run too long, they start to feel like the author explaining things to the reader. Keep analytical passages tight. The protagonist is thinking, not teaching.

6. **Forgetting that other characters have full interiority**: Because the reader is inside the analytical perspective, other characters can seem like types — assets, obstacles. The novel must create the impression that other characters have lives and frameworks the protagonist does not fully see.

7. **Writing dialogue that sounds like a strategy session**: Real conversations, even ones the protagonist is managing, do not sound like chess. The surface level of all dialogue must be socially natural. The analysis lives in the narration.

8. **Removing all warmth from the prose**: Precision is not coldness. The protagonist cares — about the outcome, about certain specific people and things. The prose can be warm about what the protagonist is warm about.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1),
  1,
  100,
  NOW()
)
ON DUPLICATE KEY UPDATE
  novel_creation_method_id = VALUES(novel_creation_method_id),
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
