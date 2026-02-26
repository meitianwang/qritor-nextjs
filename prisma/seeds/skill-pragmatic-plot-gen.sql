-- The Purely Pragmatic Novel — "Plot Design" Domain Knowledge Skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-pragmatic-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'pragmatic-plot-gen',
  '"Plot Design" domain knowledge: provides plot structure and story design guidance for The Purely Pragmatic Novel',
  '"Plot Design" domain knowledge: provides plot structure and story design guidance for The Purely Pragmatic Novel',
  '## "Plot Design" Domain Knowledge — The Purely Pragmatic Novel

The core of The Purely Pragmatic Novel is not a hero''s journey. There is no call to adventure, no moment of self-doubt that awakens a hidden heart, no love that changes the protagonist''s fundamental nature. The rational protagonist does not grow in the traditional sense — they refine.

The engine of this story type is **the calculation cycle**: the protagonist builds a model of the world, acts on that model, watches the results, discovers where the model was incomplete, and rebuilds. Reader satisfaction comes from watching a high-intelligence mind at work — from the elegance of the plan, the precision of the execution, and the honesty of the cost assessment.

Plot design must respect this engine. Every structural element — every complication, every escalation, every blind spot — must feed back into the cycle rather than derail it into emotional crisis or conventional redemption.

---

### Typical Story Structure

The Purely Pragmatic Novel follows a "blueprint–execute–audit–revise" architecture rather than the conventional dramatic arc. The protagonist does not experience a low point that humbles them; they experience a discrepancy that requires model revision.

| Phase | Chapter Range (100-ch novel) | Core Function |
|-------|------------------------------|---------------|
| **Establishing the Mind** | Ch 1–8 | Readers learn how the protagonist thinks — observe one complete calculation cycle so they understand the logic before larger stakes begin |
| **First Major Investment** | Ch 9–18 | The protagonist makes the first significant strategic commitment; readers witness the methodology in full — preparation, execution, and initial returns |
| **Accumulation Phase** | Ch 19–38 | Assets grow; every gain is visible, but the hidden costs are only partially shown; readers begin to suspect what the protagonist has not yet noticed |
| **The Complication** | Ch 39–48 | A variable enters that the model did not predict — not a catastrophe, but a discrepancy; the protagonist notes it and adjusts |
| **The Audit** | Ch 49–56 | The protagonist reviews the framework itself: is the model sound? Are the premises correct? This is not a crisis of confidence but a rigorous internal examination |
| **Escalation and Expenditure** | Ch 57–72 | The protagonist begins spending things they had not budgeted — time, relationships, certain freedoms — because the goal requires it; the reader watches the tab grow |
| **The Blind Spot Activates** | Ch 73–84 | The one variable the protagonist could not see — by definition outside their model — begins affecting outcomes; the protagonist notices the effects but cannot yet identify the source |
| **The Final Calculation** | Ch 85–93 | The protagonist makes the decisive strategic move with full awareness of incomplete information; this is the most intellectually demanding scene in the novel |
| **Aftermath: What Was the Return?** | Ch 94–100 | The cost ledger is examined by both protagonist and reader; the novel does not declare whether it was worth it — it presents the numbers and allows judgment |

**Note**: These phases describe a full-length novel arc. For shorter works, compress phases while preserving all nine functions. Do not eliminate The Audit or the Aftermath — they are what distinguish this genre from a simple power fantasy.

---

### Story Line Patterns

#### Main Line

The main line is always the protagonist''s strategic campaign toward a single clearly defined objective. The objective must be concrete enough that progress can be measured: acquiring a position, controlling a resource, neutralizing a threat, building a system. Abstract objectives ("becoming powerful", "achieving freedom") are insufficient — the protagonist must be able to calculate whether they are winning.

Common main line types:
- **The Acquisition Arc**: securing something (influence, information, a specific position) through strategic accumulation
- **The Removal Arc**: neutralizing a threat or obstacle through systematic dismantling
- **The Construction Arc**: building a structure (organization, alliance, system) that will operate after the protagonist''s involvement ends
- **The Survival Arc**: remaining viable in an environment designed to eliminate people like the protagonist

#### Common Branch Lines

| Branch Type | Description | Relationship to Main Line |
|------------|-------------|--------------------------|
| **The Anomaly Branch** | A person or variable who does not respond to the protagonist''s calculations as predicted — not an enemy, but an outlier | Provides the material for The Blind Spot; this branch''s resolution is often the key to the final act |
| **The Cost Accumulation Branch** | A secondary character or relationship that tracks the accumulating price of the protagonist''s choices — often someone who cares about the protagonist in a way the protagonist acknowledges but does not prioritize | Reader''s emotional anchor; makes the Aftermath meaningful |
| **The Capability Ceiling Branch** | A domain where the protagonist''s intelligence is not a sufficient advantage — physical, institutional, or social ceilings they must route around | Tests the model''s adaptability; prevents the story from becoming frictionless |

---

### Key Scene Types and How to Write Them

#### The Calculation Display Scene

This is the primary reader satisfaction scene. The protagonist is analyzing a situation, and the reader watches the analysis unfold.

**Function**: Establish that the protagonist is genuinely, verifiably smarter than the situation — not just told so.

**Structure**:
1. Present the situation with apparent complexity (multiple actors, unclear motives, time pressure)
2. Show the protagonist decomposing the situation into variables
3. Reveal the insight that others missed (the variable others overlooked, the connection that resolves the apparent complexity)
4. Show the resulting strategic position — what the protagonist can now do that others cannot

**Critical rule**: The calculation must be correct and demonstrable. If the reader cannot follow the logic and verify it, the scene fails. Do not use vague genius shortcuts ("somehow he knew"). Show the actual reasoning.

**Common error**: Displaying calculation without consequences. Every calculation display scene must end with the protagonist acting on the insight — the display is meaningless if nothing follows from it.

#### The Investment Payoff Scene

The protagonist''s earlier investment returns. Something they spent time, resources, or relationship capital on now delivers.

**Function**: Validate the protagonist''s methodology and give readers the satisfaction of a closed loop.

**Structure**:
1. Remind the reader (briefly, through action not exposition) of the original investment
2. Show the payoff arriving — the contact delivers, the resource activates, the positioned piece moves
3. Show the protagonist noting the return without celebration — this was expected
4. Immediately show what the protagonist does with the return (it feeds the next calculation)

**Critical rule**: Payoffs should not feel clean. Something in the return should be slightly different from what was modeled — a small discrepancy that the protagonist notes. This maintains realism and seeds future complications.

#### The Unexpected Variable Scene

Something happens that the protagonist''s model did not predict. This is not a defeat — it is information.

**Function**: Test the model and the protagonist''s relationship to uncertainty; demonstrate adaptive intelligence.

**Structure**:
1. Establish what the protagonist expected
2. Show the discrepancy — what actually happened
3. Show the protagonist''s response: not shock, not denial, but immediate analysis ("what does this imply about what I got wrong?")
4. Show the model being updated — the protagonist adjusting strategy, not just tactics

**Critical rule**: The protagonist must not respond to unexpected variables with emotion. Surprise is registered as data, not as feeling. This is not coldness — it is the correct application of the protagonist''s cognitive style. Readers who find this unsettling are having the intended experience.

#### The Cost Registration Scene

The protagonist notices a cost — something lost, someone hurt, a price paid — and continues anyway.

**Function**: Make the reader uncomfortable in the right way; establish that the protagonist''s rationality has a texture that most people cannot sustain.

**Structure**:
1. Present the cost clearly — do not obscure what has been lost or who has been affected
2. Show the protagonist processing it: they notice, they record it in their internal ledger, they assess whether it changes the calculation
3. Show the conclusion: it does not change the calculation. The protagonist continues.
4. Do not editorialize. Do not have another character voice the reader''s discomfort for them. Let the gap between "this is noticed" and "this changes nothing" do its work.

**Critical rule**: The protagonist must actually notice and acknowledge the cost — never simply fail to register it. The story''s tension lives in "they saw it and continued," not "they were too cold to notice."

#### The Final Reckoning Scene

The protagonist examines what the campaign cost against what it returned. This is not a confession and not a justification — it is an audit.

**Function**: Complete the calculation cycle; invite the reader to form their own judgment.

**Structure**:
1. Present the achieved objective — concretely, measurably. The protagonist got (or did not get) exactly what they set out to get.
2. Present the full cost ledger — everything spent, including what was not budgeted
3. Show the protagonist''s assessment of whether the model was sound (separate from whether the outcome was good)
4. End without resolution of the moral question. The reader holds the verdict.

---

### Foreshadow Strategy

| Type | Description | Planting Timing | Resolution Timing |
|------|-------------|-----------------|-------------------|
| **The Correct Calculation, Wrong Conclusion** | The protagonist''s logic is impeccable but a premise is false — the math is right, the model is wrong; this is the most sophisticated foreshadow in this genre | Accumulation Phase (plant the false premise as a reasonable assumption) | The Blind Spot Activates (the false premise surfaces) |
| **The Anomaly Signal** | The character who does not respond to the protagonist''s usual methods — early scenes show this person behaving unexpectedly in small ways that the protagonist dismisses | First Major Investment (introduce the Anomaly) | The Final Calculation (the Anomaly''s full significance becomes clear) |
| **The Unmeasured Cost** | Something the protagonist values but has not quantified — if it has no number in the ledger, the protagonist will not protect it | Establishing the Mind (show what the protagonist dismisses as unmeasurable) | Escalation and Expenditure (it is spent without the protagonist realizing) |
| **The Ceiling Signal** | An early scene where the protagonist reaches the edge of their capability and routes around it — the route they choose plants a structural weakness | The Complication (first appearance) | The Blind Spot Activates (the weakness is exploited) |
| **The Relationship Investment** | The protagonist invests in a relationship instrumentally — the foreshadow is that the other party may not behave instrumentally in return | Accumulation Phase | Aftermath (the relationship does not close as calculated) |

---

### Common Mistakes

1. **Removing the costs**: Making the protagonist so effective that nothing they spend is actually lost. The story becomes wish fulfillment rather than an examination of rational agency. Costs must be real and irreversible.

2. **Emotional revelation as climax**: Having the protagonist discover they had feelings all along. This is the conventional arc imposed on an unconventional premise and betrays the story''s core logic. The protagonist can acknowledge emotion as data — they cannot suddenly reorganize their priorities around it.

3. **Omniscience disguised as intelligence**: The protagonist knows things they could not have calculated. Genuine high-intelligence characters are brilliant within the limits of their information — they do not have miraculous insight, they have better analysis.

4. **Making the Anomaly a love interest without examining the calculation**: If the Anomaly becomes romantically important, the protagonist must still approach them analytically. The interest must be acknowledged, assessed, and either incorporated into the model or recognized as a factor affecting the model''s reliability.

5. **Resolving the Aftermath morally**: Having the story declare, through character or narration, whether the protagonist''s choices were right or wrong. The Aftermath presents the ledger. The reader closes the books.

6. **Skipping the Audit**: When the protagonist faces a setback and immediately responds with escalation rather than examination. The Audit phase is what distinguishes rational agency from mere competence. Without it, the protagonist is just very effective, not genuinely analytical.

7. **Blind spot that is too obvious**: If readers see the protagonist''s blind spot clearly from chapter ten, the tension drains. The blind spot should be genuinely invisible — something in the model''s structure that prevents the protagonist from seeing it, not mere arrogance or oversight.',
  '## "Plot Design" Domain Knowledge — The Purely Pragmatic Novel

The core of The Purely Pragmatic Novel is not a hero''s journey. There is no call to adventure, no moment of self-doubt that awakens a hidden heart, no love that changes the protagonist''s fundamental nature. The rational protagonist does not grow in the traditional sense — they refine.

The engine of this story type is **the calculation cycle**: the protagonist builds a model of the world, acts on that model, watches the results, discovers where the model was incomplete, and rebuilds. Reader satisfaction comes from watching a high-intelligence mind at work — from the elegance of the plan, the precision of the execution, and the honesty of the cost assessment.

Plot design must respect this engine. Every structural element — every complication, every escalation, every blind spot — must feed back into the cycle rather than derail it into emotional crisis or conventional redemption.

---

### Typical Story Structure

The Purely Pragmatic Novel follows a "blueprint–execute–audit–revise" architecture rather than the conventional dramatic arc. The protagonist does not experience a low point that humbles them; they experience a discrepancy that requires model revision.

| Phase | Chapter Range (100-ch novel) | Core Function |
|-------|------------------------------|---------------|
| **Establishing the Mind** | Ch 1–8 | Readers learn how the protagonist thinks — observe one complete calculation cycle so they understand the logic before larger stakes begin |
| **First Major Investment** | Ch 9–18 | The protagonist makes the first significant strategic commitment; readers witness the methodology in full — preparation, execution, and initial returns |
| **Accumulation Phase** | Ch 19–38 | Assets grow; every gain is visible, but the hidden costs are only partially shown; readers begin to suspect what the protagonist has not yet noticed |
| **The Complication** | Ch 39–48 | A variable enters that the model did not predict — not a catastrophe, but a discrepancy; the protagonist notes it and adjusts |
| **The Audit** | Ch 49–56 | The protagonist reviews the framework itself: is the model sound? Are the premises correct? This is not a crisis of confidence but a rigorous internal examination |
| **Escalation and Expenditure** | Ch 57–72 | The protagonist begins spending things they had not budgeted — time, relationships, certain freedoms — because the goal requires it; the reader watches the tab grow |
| **The Blind Spot Activates** | Ch 73–84 | The one variable the protagonist could not see — by definition outside their model — begins affecting outcomes; the protagonist notices the effects but cannot yet identify the source |
| **The Final Calculation** | Ch 85–93 | The protagonist makes the decisive strategic move with full awareness of incomplete information; this is the most intellectually demanding scene in the novel |
| **Aftermath: What Was the Return?** | Ch 94–100 | The cost ledger is examined by both protagonist and reader; the novel does not declare whether it was worth it — it presents the numbers and allows judgment |

**Note**: These phases describe a full-length novel arc. For shorter works, compress phases while preserving all nine functions. Do not eliminate The Audit or the Aftermath — they are what distinguish this genre from a simple power fantasy.

---

### Story Line Patterns

#### Main Line

The main line is always the protagonist''s strategic campaign toward a single clearly defined objective. The objective must be concrete enough that progress can be measured: acquiring a position, controlling a resource, neutralizing a threat, building a system. Abstract objectives ("becoming powerful", "achieving freedom") are insufficient — the protagonist must be able to calculate whether they are winning.

Common main line types:
- **The Acquisition Arc**: securing something (influence, information, a specific position) through strategic accumulation
- **The Removal Arc**: neutralizing a threat or obstacle through systematic dismantling
- **The Construction Arc**: building a structure (organization, alliance, system) that will operate after the protagonist''s involvement ends
- **The Survival Arc**: remaining viable in an environment designed to eliminate people like the protagonist

#### Common Branch Lines

| Branch Type | Description | Relationship to Main Line |
|------------|-------------|--------------------------|
| **The Anomaly Branch** | A person or variable who does not respond to the protagonist''s calculations as predicted — not an enemy, but an outlier | Provides the material for The Blind Spot; this branch''s resolution is often the key to the final act |
| **The Cost Accumulation Branch** | A secondary character or relationship that tracks the accumulating price of the protagonist''s choices — often someone who cares about the protagonist in a way the protagonist acknowledges but does not prioritize | Reader''s emotional anchor; makes the Aftermath meaningful |
| **The Capability Ceiling Branch** | A domain where the protagonist''s intelligence is not a sufficient advantage — physical, institutional, or social ceilings they must route around | Tests the model''s adaptability; prevents the story from becoming frictionless |

---

### Key Scene Types and How to Write Them

#### The Calculation Display Scene

This is the primary reader satisfaction scene. The protagonist is analyzing a situation, and the reader watches the analysis unfold.

**Function**: Establish that the protagonist is genuinely, verifiably smarter than the situation — not just told so.

**Structure**:
1. Present the situation with apparent complexity (multiple actors, unclear motives, time pressure)
2. Show the protagonist decomposing the situation into variables
3. Reveal the insight that others missed (the variable others overlooked, the connection that resolves the apparent complexity)
4. Show the resulting strategic position — what the protagonist can now do that others cannot

**Critical rule**: The calculation must be correct and demonstrable. If the reader cannot follow the logic and verify it, the scene fails. Do not use vague genius shortcuts ("somehow he knew"). Show the actual reasoning.

**Common error**: Displaying calculation without consequences. Every calculation display scene must end with the protagonist acting on the insight — the display is meaningless if nothing follows from it.

#### The Investment Payoff Scene

The protagonist''s earlier investment returns. Something they spent time, resources, or relationship capital on now delivers.

**Function**: Validate the protagonist''s methodology and give readers the satisfaction of a closed loop.

**Structure**:
1. Remind the reader (briefly, through action not exposition) of the original investment
2. Show the payoff arriving — the contact delivers, the resource activates, the positioned piece moves
3. Show the protagonist noting the return without celebration — this was expected
4. Immediately show what the protagonist does with the return (it feeds the next calculation)

**Critical rule**: Payoffs should not feel clean. Something in the return should be slightly different from what was modeled — a small discrepancy that the protagonist notes. This maintains realism and seeds future complications.

#### The Unexpected Variable Scene

Something happens that the protagonist''s model did not predict. This is not a defeat — it is information.

**Function**: Test the model and the protagonist''s relationship to uncertainty; demonstrate adaptive intelligence.

**Structure**:
1. Establish what the protagonist expected
2. Show the discrepancy — what actually happened
3. Show the protagonist''s response: not shock, not denial, but immediate analysis ("what does this imply about what I got wrong?")
4. Show the model being updated — the protagonist adjusting strategy, not just tactics

**Critical rule**: The protagonist must not respond to unexpected variables with emotion. Surprise is registered as data, not as feeling. This is not coldness — it is the correct application of the protagonist''s cognitive style. Readers who find this unsettling are having the intended experience.

#### The Cost Registration Scene

The protagonist notices a cost — something lost, someone hurt, a price paid — and continues anyway.

**Function**: Make the reader uncomfortable in the right way; establish that the protagonist''s rationality has a texture that most people cannot sustain.

**Structure**:
1. Present the cost clearly — do not obscure what has been lost or who has been affected
2. Show the protagonist processing it: they notice, they record it in their internal ledger, they assess whether it changes the calculation
3. Show the conclusion: it does not change the calculation. The protagonist continues.
4. Do not editorialize. Do not have another character voice the reader''s discomfort for them. Let the gap between "this is noticed" and "this changes nothing" do its work.

**Critical rule**: The protagonist must actually notice and acknowledge the cost — never simply fail to register it. The story''s tension lives in "they saw it and continued," not "they were too cold to notice."

#### The Final Reckoning Scene

The protagonist examines what the campaign cost against what it returned. This is not a confession and not a justification — it is an audit.

**Function**: Complete the calculation cycle; invite the reader to form their own judgment.

**Structure**:
1. Present the achieved objective — concretely, measurably. The protagonist got (or did not get) exactly what they set out to get.
2. Present the full cost ledger — everything spent, including what was not budgeted
3. Show the protagonist''s assessment of whether the model was sound (separate from whether the outcome was good)
4. End without resolution of the moral question. The reader holds the verdict.

---

### Foreshadow Strategy

| Type | Description | Planting Timing | Resolution Timing |
|------|-------------|-----------------|-------------------|
| **The Correct Calculation, Wrong Conclusion** | The protagonist''s logic is impeccable but a premise is false — the math is right, the model is wrong; this is the most sophisticated foreshadow in this genre | Accumulation Phase (plant the false premise as a reasonable assumption) | The Blind Spot Activates (the false premise surfaces) |
| **The Anomaly Signal** | The character who does not respond to the protagonist''s usual methods — early scenes show this person behaving unexpectedly in small ways that the protagonist dismisses | First Major Investment (introduce the Anomaly) | The Final Calculation (the Anomaly''s full significance becomes clear) |
| **The Unmeasured Cost** | Something the protagonist values but has not quantified — if it has no number in the ledger, the protagonist will not protect it | Establishing the Mind (show what the protagonist dismisses as unmeasurable) | Escalation and Expenditure (it is spent without the protagonist realizing) |
| **The Ceiling Signal** | An early scene where the protagonist reaches the edge of their capability and routes around it — the route they choose plants a structural weakness | The Complication (first appearance) | The Blind Spot Activates (the weakness is exploited) |
| **The Relationship Investment** | The protagonist invests in a relationship instrumentally — the foreshadow is that the other party may not behave instrumentally in return | Accumulation Phase | Aftermath (the relationship does not close as calculated) |

---

### Common Mistakes

1. **Removing the costs**: Making the protagonist so effective that nothing they spend is actually lost. The story becomes wish fulfillment rather than an examination of rational agency. Costs must be real and irreversible.

2. **Emotional revelation as climax**: Having the protagonist discover they had feelings all along. This is the conventional arc imposed on an unconventional premise and betrays the story''s core logic. The protagonist can acknowledge emotion as data — they cannot suddenly reorganize their priorities around it.

3. **Omniscience disguised as intelligence**: The protagonist knows things they could not have calculated. Genuine high-intelligence characters are brilliant within the limits of their information — they do not have miraculous insight, they have better analysis.

4. **Making the Anomaly a love interest without examining the calculation**: If the Anomaly becomes romantically important, the protagonist must still approach them analytically. The interest must be acknowledged, assessed, and either incorporated into the model or recognized as a factor affecting the model''s reliability.

5. **Resolving the Aftermath morally**: Having the story declare, through character or narration, whether the protagonist''s choices were right or wrong. The Aftermath presents the ledger. The reader closes the books.

6. **Skipping the Audit**: When the protagonist faces a setback and immediately responds with escalation rather than examination. The Audit phase is what distinguishes rational agency from mere competence. Without it, the protagonist is just very effective, not genuinely analytical.

7. **Blind spot that is too obvious**: If readers see the protagonist''s blind spot clearly from chapter ten, the tension drains. The blind spot should be genuinely invisible — something in the model''s structure that prevents the protagonist from seeing it, not mere arrogance or oversight.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1),
  1,
  30,
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
