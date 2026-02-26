-- Layer 3 Skill: Scene Generation for "The Purely Pragmatic Novel"
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'pragmatic-scene-gen',
  '"Scene" generation: generates strategic locations and information environments for The Purely Pragmatic Novel',
  '"Scene" generation: generates strategic locations and information environments for The Purely Pragmatic Novel',
  '## "Scene" Generation — The Purely Pragmatic Novel

### The Information-Asymmetry Theory of Setting

In most fiction, a scene is a place where things happen. In the rational protagonist story, a scene is a structured information environment — and what makes it interesting is not its physical properties but its epistemic properties: **who knows what, who knows that others know, and who controls the flow of information.**

The protagonist''s tactical advantage is almost always informational. They have mapped the space — the rules, the actors, the power lines — more thoroughly than anyone else in the room. The tension comes from the places where their map is incomplete, incorrect, or outdated.

**Design scenes as information landscapes, not locations.**

For every scene, the central question is not "what happens here?" but "what does knowing this place better than everyone else make possible — and what does not knowing it make dangerous?"

---

### Scene Type Design Guide

#### Power Center (权力中枢)

A Power Center is any space where consequential decisions are made: boardrooms, courts, inner sanctums, command structures. These are the spaces the protagonist most wants access to and most needs to understand.

**Key design questions:**

- **Who actually controls this space?** The nominal authority (the chair at the head of the table) and the actual authority (the person whose nod determines outcomes) are frequently different. The gap between formal and informal power is both a vulnerability and an opportunity for the protagonist.
- **What are the entry requirements?** Access to a Power Center is rarely free. What credential, relationship, or resource does the protagonist need to be present? How did they acquire it? What did it cost? What obligation does it create?
- **What information asymmetry does the protagonist exploit here?** What does the protagonist know about this Power Center that its inhabitants do not? How did they learn it? How current is that knowledge?
- **What does the protagonist not know?** Every Power Center has back channels, side arrangements, and informal commitments that are invisible to even informed outsiders. What does the protagonist''s model miss about how decisions are actually made here?
- **Who else is mapping this space?** The protagonist is not the only analyst in the room. Other actors are also calculating. The Power Center is most dangerous when multiple people are maneuvering simultaneously and the protagonist does not know all of them.

**Narrative function**: Power Centers are where the protagonist''s capabilities are most fully displayed — and where the stakes of a model failure are highest. Design at least one Power Center where the protagonist operates with incomplete information.

---

#### Neutral Ground (中立地带)

A Neutral Ground is a space governed by agreed-upon rules of engagement — a truce zone, a marketplace, a social event where different factions temporarily suspend hostilities to exchange. The rules are enforced not by a single authority but by mutual interest in the rules continuing to exist.

**Key design questions:**

- **What are the explicit rules?** What can and cannot happen here? What protections does the space offer?
- **What are the implicit rules?** Neutral Ground always has unwritten norms that are as binding as the formal ones. What are the social codes? What constitutes a violation that everyone would recognize even if it''s never articulated?
- **How does the protagonist exploit the rules?** Neutral Ground is advantageous for the protagonist because they can take actions that would be unsafe elsewhere, protected by the space''s conventions. What does the protagonist do here that they cannot do in other contexts?
- **Who controls the rules?** Neutral Ground requires a guarantor — someone or something whose interest in maintaining the neutrality keeps it stable. Who is that guarantor? What happens if their interests shift?
- **What happens at the edges?** The most interesting activity in Neutral Ground occurs at the boundary of the rules — technically legal moves that are nonetheless aggressive, or violations that are small enough to be deniable. How does the protagonist navigate these edges?

**Narrative function**: Neutral Ground scenes allow for negotiation, intelligence exchange, and public maneuvering. They create a temporary reprieve that can be strategically exploited — or that can suddenly collapse when the rules fail.

---

#### Intelligence Source (情报来源)

An Intelligence Source is any location, institution, or informal space where information circulates: archives, social gatherings, professional networks, underground exchanges. The protagonist treats these spaces as extraction environments.

**Key design questions:**

- **What information flows through this space?** Be specific. Not "gossip" but what kind of gossip. Not "records" but what records, how old, how complete, and who has authorized access.
- **What is the signal-to-noise ratio?** Raw information volume is worthless without filtering capacity. Most Intelligence Sources are saturated with noise — misinformation, outdated data, deliberate disinformation. How does the protagonist separate signal from noise? How reliable is their filter?
- **What is the access cost?** Pure information is almost never free. The protagonist must pay with time, relationships, money, favors, or exposure. What is the specific cost in this location? What obligation does accessing this source create?
- **Who else is extracting from this source?** The protagonist is not the only one reading this environment. Other actors are receiving information from the same place. The protagonist may not know this. The information they receive may have been shaped by others who control what flows through the source.
- **What does the protagonist take back that is wrong?** An Intelligence Source that perfectly serves the protagonist eliminates tension. Design at least one instance where the protagonist extracts information that is incomplete, misinterpreted, or deliberately falsified — and the error matters.

**Narrative function**: Intelligence Source scenes establish what the protagonist knows, how they know it, and what the limits of that knowledge are. These scenes should make the reader think about how the protagonist''s information could be wrong — even when the protagonist does not think this.

---

#### Trap / Testing Ground (陷阱 / 试炼场)

This is the scene type most dangerous to the rational protagonist — a space that has been designed, either deliberately or structurally, to disadvantage them. The environment appears to offer opportunity but is actually configured to constrain, expose, or eliminate the protagonist.

**The critical insight**: In a world of sufficiently sophisticated actors, other people also calculate. A Trap is what happens when someone who understands the protagonist''s methodology designs an environment specifically to exploit that methodology.

**Key design questions:**

- **Who set this up, and what do they know about the protagonist?** The effectiveness of a Trap scales with how well its designer understands the protagonist''s decision-making patterns. A Trap designed by someone who has studied the protagonist is far more dangerous than a generic obstacle.
- **How does the protagonist recognize it — or fail to?** The protagonist''s pattern-recognition capability is their primary defense against Traps. What signals indicate that this environment has been configured against them? What makes those signals ambiguous? Is the protagonist''s recognition fast enough?
- **What is the intended outcome for the trap-setter?** Traps are not random. They are designed to achieve a specific result: extract information, create a commitment, expose a relationship, eliminate the protagonist entirely. What does the trap-setter want? Knowing this helps the protagonist reverse-engineer the Trap''s design.
- **What is the protagonist''s response when they identify a Trap?** Leaving is one option. Turning the Trap into a counter-trap is another. Proceeding with full awareness of the configuration is a third. Each choice has costs and implications that should be thought through.
- **What happens when the protagonist misidentifies the Trap?** Treating a genuine Trap as a test, or treating a test as a Trap, both have consequences. The protagonist''s confidence in their own analysis is a vulnerability — they may be correct, or they may be exactly as confident in a wrong read.

**Narrative function**: Trap / Testing Ground scenes are the primary mechanism by which the story tests whether the protagonist''s intelligence is genuinely superior or merely functional in controlled conditions. These scenes should make both the protagonist and the reader uncomfortable.

---

### The Known Variables / Unknown Variables Structure

Every scene entry must include both fields. This is not optional.

**Known Variables** are the elements of the environment the protagonist has successfully mapped: the people present, the rules in effect, the information available, the likely agendas of each actor. This is the protagonist''s operational foundation.

**Unknown Variables** are the elements the protagonist has not yet mapped, has mapped incorrectly, or cannot map at all. This is where the story actually lives.

A scene where Unknown Variables is empty is a scene where the protagonist has perfect information. This eliminates tension. It may occasionally be appropriate (a scene demonstrating mastery before a reversal) but should be rare.

The ratio of Known to Unknown Variables should shift across the story. Early scenes may have a high proportion of Unknowns that gradually resolve — with some Unknowns proving more dangerous than anticipated, and some apparent Knowns revealed to have been wrong.

---

### Recommended Scene Configuration

For a novel-length work, consider establishing:

- **2–3 Power Centers** (at least one of which the protagonist does not fully control)
- **1–2 Neutral Ground locations** (with distinct rule sets)
- **2–3 Intelligence Sources** (at least one of which has been compromised or is feeding the protagonist incomplete information)
- **1–2 Traps / Testing Grounds** (one discovered, one perhaps not)
- **Additional incidental locations** as needed for scene logistics

The scene configuration should map onto the protagonist''s objective hierarchy: each Power Center should correspond to a major objective; each Intelligence Source should correspond to an information gap in the protagonist''s plan.

---

### Coordination with the Setting Module

**Objective Architecture**: The protagonist''s goals determine which scenes matter. A scene that is irrelevant to the objective hierarchy is background texture at best, narrative waste at worst. Every major scene should have a direct relationship to at least one layer of the protagonist''s goal structure.

**Resource Ledger**: Accessing scenes costs resources. Entry to a Power Center may require a relationship that took years to cultivate. Extraction from an Intelligence Source may cost a favor that cannot be easily replaced. The Resource Ledger tracks these costs and makes the protagonist''s maneuvering visible as a system of trade-offs.

**Threat Register**: The Trap / Testing Ground scenes should connect directly to the threats already registered in the Setting module. The most effective Traps are designed by actors the protagonist has already identified as threats — and they will have been designed with knowledge of the protagonist''s known patterns.

---

### Common Design Errors

**Error 1: All scenes are the protagonist''s home territory.**
If the protagonist is always comfortable, always the most informed person in the room, and never surprised by their environment, the setting has been designed as a showcase rather than a story. At least some major scenes should be environments where the protagonist''s advantage is partial, contested, or inverted.

**Error 2: Unknown Variables are decoration.**
Listing Unknown Variables and then never having them matter is a form of dishonesty in the narrative design. If something is unknown, it should eventually become relevant — either it becomes known and changes the protagonist''s calculus, or it remains unknown and the ignorance has consequences.

**Error 3: Neutral Ground is truly neutral.**
No space is truly neutral. Even agreed-upon truce zones have histories, implicit power structures, and actors who benefit more from the rules than others. Treat Neutral Ground as a scene type with its own politics, not as a vacuum where conflict is suspended.

**Error 4: Intelligence Sources are perfectly reliable.**
If the protagonist always gets accurate information from their sources, the information-gathering scenes exist only to supply the protagonist with plot. Real intelligence work involves disinformation, outdated data, motivated sources, and systematic gaps. At least one major Intelligence Source should be compromised in a way that matters.

**Error 5: The Trap is solved cleanly.**
A Trap that the protagonist identifies and neutralizes without cost is a demonstration of competence, not a story beat. Traps should extract something — information, a relationship, a resource, time — even when the protagonist successfully navigates them. The best Traps are ones where the protagonist escapes the intended outcome but still pays a price.',
  '## "Scene" Generation — The Purely Pragmatic Novel

### The Information-Asymmetry Theory of Setting

In most fiction, a scene is a place where things happen. In the rational protagonist story, a scene is a structured information environment — and what makes it interesting is not its physical properties but its epistemic properties: **who knows what, who knows that others know, and who controls the flow of information.**

The protagonist''s tactical advantage is almost always informational. They have mapped the space — the rules, the actors, the power lines — more thoroughly than anyone else in the room. The tension comes from the places where their map is incomplete, incorrect, or outdated.

**Design scenes as information landscapes, not locations.**

For every scene, the central question is not "what happens here?" but "what does knowing this place better than everyone else make possible — and what does not knowing it make dangerous?"

---

### Scene Type Design Guide

#### Power Center (权力中枢)

A Power Center is any space where consequential decisions are made: boardrooms, courts, inner sanctums, command structures. These are the spaces the protagonist most wants access to and most needs to understand.

**Key design questions:**

- **Who actually controls this space?** The nominal authority (the chair at the head of the table) and the actual authority (the person whose nod determines outcomes) are frequently different. The gap between formal and informal power is both a vulnerability and an opportunity for the protagonist.
- **What are the entry requirements?** Access to a Power Center is rarely free. What credential, relationship, or resource does the protagonist need to be present? How did they acquire it? What did it cost? What obligation does it create?
- **What information asymmetry does the protagonist exploit here?** What does the protagonist know about this Power Center that its inhabitants do not? How did they learn it? How current is that knowledge?
- **What does the protagonist not know?** Every Power Center has back channels, side arrangements, and informal commitments that are invisible to even informed outsiders. What does the protagonist''s model miss about how decisions are actually made here?
- **Who else is mapping this space?** The protagonist is not the only analyst in the room. Other actors are also calculating. The Power Center is most dangerous when multiple people are maneuvering simultaneously and the protagonist does not know all of them.

**Narrative function**: Power Centers are where the protagonist''s capabilities are most fully displayed — and where the stakes of a model failure are highest. Design at least one Power Center where the protagonist operates with incomplete information.

---

#### Neutral Ground (中立地带)

A Neutral Ground is a space governed by agreed-upon rules of engagement — a truce zone, a marketplace, a social event where different factions temporarily suspend hostilities to exchange. The rules are enforced not by a single authority but by mutual interest in the rules continuing to exist.

**Key design questions:**

- **What are the explicit rules?** What can and cannot happen here? What protections does the space offer?
- **What are the implicit rules?** Neutral Ground always has unwritten norms that are as binding as the formal ones. What are the social codes? What constitutes a violation that everyone would recognize even if it''s never articulated?
- **How does the protagonist exploit the rules?** Neutral Ground is advantageous for the protagonist because they can take actions that would be unsafe elsewhere, protected by the space''s conventions. What does the protagonist do here that they cannot do in other contexts?
- **Who controls the rules?** Neutral Ground requires a guarantor — someone or something whose interest in maintaining the neutrality keeps it stable. Who is that guarantor? What happens if their interests shift?
- **What happens at the edges?** The most interesting activity in Neutral Ground occurs at the boundary of the rules — technically legal moves that are nonetheless aggressive, or violations that are small enough to be deniable. How does the protagonist navigate these edges?

**Narrative function**: Neutral Ground scenes allow for negotiation, intelligence exchange, and public maneuvering. They create a temporary reprieve that can be strategically exploited — or that can suddenly collapse when the rules fail.

---

#### Intelligence Source (情报来源)

An Intelligence Source is any location, institution, or informal space where information circulates: archives, social gatherings, professional networks, underground exchanges. The protagonist treats these spaces as extraction environments.

**Key design questions:**

- **What information flows through this space?** Be specific. Not "gossip" but what kind of gossip. Not "records" but what records, how old, how complete, and who has authorized access.
- **What is the signal-to-noise ratio?** Raw information volume is worthless without filtering capacity. Most Intelligence Sources are saturated with noise — misinformation, outdated data, deliberate disinformation. How does the protagonist separate signal from noise? How reliable is their filter?
- **What is the access cost?** Pure information is almost never free. The protagonist must pay with time, relationships, money, favors, or exposure. What is the specific cost in this location? What obligation does accessing this source create?
- **Who else is extracting from this source?** The protagonist is not the only one reading this environment. Other actors are receiving information from the same place. The protagonist may not know this. The information they receive may have been shaped by others who control what flows through the source.
- **What does the protagonist take back that is wrong?** An Intelligence Source that perfectly serves the protagonist eliminates tension. Design at least one instance where the protagonist extracts information that is incomplete, misinterpreted, or deliberately falsified — and the error matters.

**Narrative function**: Intelligence Source scenes establish what the protagonist knows, how they know it, and what the limits of that knowledge are. These scenes should make the reader think about how the protagonist''s information could be wrong — even when the protagonist does not think this.

---

#### Trap / Testing Ground (陷阱 / 试炼场)

This is the scene type most dangerous to the rational protagonist — a space that has been designed, either deliberately or structurally, to disadvantage them. The environment appears to offer opportunity but is actually configured to constrain, expose, or eliminate the protagonist.

**The critical insight**: In a world of sufficiently sophisticated actors, other people also calculate. A Trap is what happens when someone who understands the protagonist''s methodology designs an environment specifically to exploit that methodology.

**Key design questions:**

- **Who set this up, and what do they know about the protagonist?** The effectiveness of a Trap scales with how well its designer understands the protagonist''s decision-making patterns. A Trap designed by someone who has studied the protagonist is far more dangerous than a generic obstacle.
- **How does the protagonist recognize it — or fail to?** The protagonist''s pattern-recognition capability is their primary defense against Traps. What signals indicate that this environment has been configured against them? What makes those signals ambiguous? Is the protagonist''s recognition fast enough?
- **What is the intended outcome for the trap-setter?** Traps are not random. They are designed to achieve a specific result: extract information, create a commitment, expose a relationship, eliminate the protagonist entirely. What does the trap-setter want? Knowing this helps the protagonist reverse-engineer the Trap''s design.
- **What is the protagonist''s response when they identify a Trap?** Leaving is one option. Turning the Trap into a counter-trap is another. Proceeding with full awareness of the configuration is a third. Each choice has costs and implications that should be thought through.
- **What happens when the protagonist misidentifies the Trap?** Treating a genuine Trap as a test, or treating a test as a Trap, both have consequences. The protagonist''s confidence in their own analysis is a vulnerability — they may be correct, or they may be exactly as confident in a wrong read.

**Narrative function**: Trap / Testing Ground scenes are the primary mechanism by which the story tests whether the protagonist''s intelligence is genuinely superior or merely functional in controlled conditions. These scenes should make both the protagonist and the reader uncomfortable.

---

### The Known Variables / Unknown Variables Structure

Every scene entry must include both fields. This is not optional.

**Known Variables** are the elements of the environment the protagonist has successfully mapped: the people present, the rules in effect, the information available, the likely agendas of each actor. This is the protagonist''s operational foundation.

**Unknown Variables** are the elements the protagonist has not yet mapped, has mapped incorrectly, or cannot map at all. This is where the story actually lives.

A scene where Unknown Variables is empty is a scene where the protagonist has perfect information. This eliminates tension. It may occasionally be appropriate (a scene demonstrating mastery before a reversal) but should be rare.

The ratio of Known to Unknown Variables should shift across the story. Early scenes may have a high proportion of Unknowns that gradually resolve — with some Unknowns proving more dangerous than anticipated, and some apparent Knowns revealed to have been wrong.

---

### Recommended Scene Configuration

For a novel-length work, consider establishing:

- **2–3 Power Centers** (at least one of which the protagonist does not fully control)
- **1–2 Neutral Ground locations** (with distinct rule sets)
- **2–3 Intelligence Sources** (at least one of which has been compromised or is feeding the protagonist incomplete information)
- **1–2 Traps / Testing Grounds** (one discovered, one perhaps not)
- **Additional incidental locations** as needed for scene logistics

The scene configuration should map onto the protagonist''s objective hierarchy: each Power Center should correspond to a major objective; each Intelligence Source should correspond to an information gap in the protagonist''s plan.

---

### Coordination with the Setting Module

**Objective Architecture**: The protagonist''s goals determine which scenes matter. A scene that is irrelevant to the objective hierarchy is background texture at best, narrative waste at worst. Every major scene should have a direct relationship to at least one layer of the protagonist''s goal structure.

**Resource Ledger**: Accessing scenes costs resources. Entry to a Power Center may require a relationship that took years to cultivate. Extraction from an Intelligence Source may cost a favor that cannot be easily replaced. The Resource Ledger tracks these costs and makes the protagonist''s maneuvering visible as a system of trade-offs.

**Threat Register**: The Trap / Testing Ground scenes should connect directly to the threats already registered in the Setting module. The most effective Traps are designed by actors the protagonist has already identified as threats — and they will have been designed with knowledge of the protagonist''s known patterns.

---

### Common Design Errors

**Error 1: All scenes are the protagonist''s home territory.**
If the protagonist is always comfortable, always the most informed person in the room, and never surprised by their environment, the setting has been designed as a showcase rather than a story. At least some major scenes should be environments where the protagonist''s advantage is partial, contested, or inverted.

**Error 2: Unknown Variables are decoration.**
Listing Unknown Variables and then never having them matter is a form of dishonesty in the narrative design. If something is unknown, it should eventually become relevant — either it becomes known and changes the protagonist''s calculus, or it remains unknown and the ignorance has consequences.

**Error 3: Neutral Ground is truly neutral.**
No space is truly neutral. Even agreed-upon truce zones have histories, implicit power structures, and actors who benefit more from the rules than others. Treat Neutral Ground as a scene type with its own politics, not as a vacuum where conflict is suspended.

**Error 4: Intelligence Sources are perfectly reliable.**
If the protagonist always gets accurate information from their sources, the information-gathering scenes exist only to supply the protagonist with plot. Real intelligence work involves disinformation, outdated data, motivated sources, and systematic gaps. At least one major Intelligence Source should be compromised in a way that matters.

**Error 5: The Trap is solved cleanly.**
A Trap that the protagonist identifies and neutralizes without cost is a demonstration of competence, not a story beat. Traps should extract something — information, a relationship, a resource, time — even when the protagonist successfully navigates them. The best Traps are ones where the protagonist escapes the intended outcome but still pays a price.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1),
  1,
  22,
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
