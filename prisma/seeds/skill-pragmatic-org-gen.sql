-- Layer 3 Skill: Organization/Faction Generation for "The Purely Pragmatic Novel"
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'pragmatic-org-gen',
  '"Faction/Organization" generation: generates the power structures the rational protagonist analyzes, infiltrates, and exploits for The Purely Pragmatic Novel',
  '"Faction/Organization" generation: generates the power structures the rational protagonist analyzes, infiltrates, and exploits for The Purely Pragmatic Novel',
  '## "Faction/Organization" Generation — The Purely Pragmatic Novel

### The Systems Theory of Organizational Design

In a story built around a rational protagonist, every organization is a system — and systems have properties that individual actors do not. Systems have internal incentive structures. They have information flows that determine what people inside the system know and do not know. They have institutional loyalties that sometimes override individual rationality. They have structural vulnerabilities that are a direct consequence of their structural strengths.

**The protagonist''s fundamental advantage: they can see the system from outside it, while everyone inside the system is partially captured by it.**

A police officer thinks like a police officer. A board member thinks like a board member. An organization''s members have internalized its logic so thoroughly that they often cannot see what the organization''s logic makes impossible for it to do. The protagonist can. This is their edge.

But the protagonist''s edge is also a blind spot: they can analyze organizations from outside, but they cannot fully feel what it is like to be inside one — to have your judgment shaped by institutional belonging, to owe loyalty to people rather than to outcomes. Organizations have cohesion that is partially non-rational. The protagonist''s purely rational model will always somewhat underestimate this cohesion.

**Design organizations as systems with internal logic, structural vulnerabilities, and dimensions that the protagonist''s model partially fails to capture.**

---

### Organization Type Design Guide

#### Political Body (政治机构)

Political bodies include formal governmental institutions, regulatory agencies, legislative bodies, political parties, and the informal power structures that exist alongside them. Their defining characteristic is that they operate through legitimacy — the recognized right to make binding decisions — and their internal dynamics are structured around the competition for that legitimacy.

**Key design questions:**

- **What is this body''s formal mandate, and how far does it deviate from actual function?** Almost all political bodies operate differently from their official purpose. Where is the gap? Who benefits from the gap? Who is harmed by it?
- **Who are the visible principals and the actual principals?** In political bodies, the person who holds the position and the person who wields the power are frequently different. Who makes the real decisions? Through what channel does their influence flow?
- **What are the competing factions within the body?** Political bodies are almost never unified. There are internal fault lines — ideological, personal, regional, institutional. Where are the lines? Who is aligned with whom? What would cause an alignment to shift?
- **What is this body''s relationship to its own rules?** Organizations that can make and enforce rules often develop a complicated relationship with those rules over time. Which rules are treated as binding? Which are treated as advisory? Who decides which is which?
- **Where are the exploitable cracks?** For the protagonist, a political body is most interesting where its factions are misaligned — where one faction can be played against another, where the formal process can be used to achieve outcomes its designers did not intend, where the bureaucratic apparatus can be activated for purposes its operators would find uncomfortable.

**The protagonist''s analytical approach to political bodies**: Map the formal structure, then map the actual power flows, then map the gaps between them. The gaps are where leverage lives.

---

#### Criminal Network (犯罪网络)

Criminal networks are informal organizations that operate outside legitimate institutional structures. Their defining characteristics are that they cannot rely on legal enforcement of agreements — all compliance is voluntary or coerced — and that trust is their scarcest and most valuable resource.

**Why criminal networks are both more vulnerable and more dangerous than legitimate organizations:**

- **More vulnerable**: Without legal enforcement, criminal organizations cannot scale in the same way legitimate organizations can. They depend on personal relationships and reputation. These relationships can be disrupted. Reputation can be attacked. The organization''s inability to resolve disputes through legitimate channels means internal conflicts escalate faster.
- **More dangerous**: Criminal organizations routinely use violence as a coordination mechanism. The protagonist is accustomed to operating in environments where the worst outcome is a professional setback. In a criminal network, the worst outcome is physical. The protagonist must recalibrate their risk calculus.

**Key design questions:**

- **What is the organization''s primary coordination mechanism?** Most criminal networks rely on some combination of personal loyalty, coercive threat, shared risk (mutual blackmail), and financial interdependence. Which does this network primarily use? What are the implications for its vulnerabilities?
- **Where does trust break down in this network?** Every criminal organization has internal trust deficits — people who are suspected, people who have reason to defect, people who are loyal to a sub-faction rather than the whole. Where are these fault lines?
- **What is the organization''s relationship to legal institutions?** Fully separated, selectively corrupt, or partially integrated? Each configuration has different implications for how the protagonist can interact with both the criminal network and the legal institutions simultaneously.
- **Who are the violent actors, and what constrains them?** Violence is a resource in criminal organizations, but it is also a cost — it attracts attention, disrupts operations, and signals weakness if used excessively. Who controls the use of violence in this network? What would cause that control to break down?
- **What does the protagonist''s rationality miss about this environment?** Criminal networks often run on codes of honor, on personal loyalty that goes beyond rational self-interest, on reputation systems that do not map neatly onto economic logic. The protagonist may systematically underestimate the role of non-transactional loyalty in keeping these organizations functional.

---

#### Knowledge Holder (信息势力)

A Knowledge Holder is any organization whose primary asset is information: intelligence agencies, research institutions, investigative journalists, professional guilds, criminal information brokers, religious institutions with long institutional memory. What they control is not physical resources or formal authority but epistemic privilege — they know things others do not.

**Key design questions:**

- **What do they actually know, and what do they only appear to know?** Knowledge Holders often curate the appearance of their knowledge as carefully as the knowledge itself. What is in their actual archive? What do they claim to have? What is the gap?
- **How do they acquire information?** Sources, methods, and access channels. What is their information-gathering process? What does that process systematically miss? The protagonist who understands how a Knowledge Holder acquires information can infer what they do not know as well as what they do.
- **What is the access price?** Knowledge Holders are rarely altruistic. Access to their knowledge requires payment — monetary, relational, or informational. What does accessing this organization cost? Is the price fixed or negotiated? What precedent does paying create?
- **What do they want from the protagonist?** Knowledge Holders often value information about the protagonist as much as the protagonist values their information. The exchange is not simply money for knowledge — it may be information for information, access for access, or a service for intelligence.
- **What is their institutional interest in the protagonist''s success or failure?** A Knowledge Holder is not a neutral resource. They have their own agenda, their own preferred outcomes, their own assessment of whether the protagonist''s objectives align with their interests. Do they want the protagonist to succeed? Would they actively work against the protagonist if their interests diverged?

---

### The Exploitable Structure Field — The Most Important Field

Every organization entry must include an **Exploitable Structure** field. This is the analysis of the organization as a system with inherent vulnerabilities — not the protagonist''s plan to exploit those vulnerabilities, but the underlying structural features that make exploitation possible.

**Three primary categories of exploitable structure:**

**1. Incentive Misalignment**
The organization''s reward structure creates behavior that is contrary to the organization''s stated objectives. Individual members optimize for what the system rewards them for, not for what the system says it wants. This gap is exploitable: the protagonist can offer individuals what the organization does not, or can work through the organization''s incentive structure to produce outcomes that serve the protagonist''s objectives.

Examples:
- An enforcement agency where promotions are based on case volume creates investigators who prefer many small cases to fewer important ones
- A political body where members'' tenure depends on constituent approval creates representatives who prioritize visibility over effective legislation
- A criminal network where advancement requires demonstrated loyalty creates members who compete to perform loyalty rather than to produce results

**2. Information Silos**
The organization does not share information internally in a way that produces accurate collective understanding. Different parts of the organization have access to different information, and the synthesis that would produce correct understanding does not occur. The protagonist, who can observe multiple parts of the organization from outside, may have a more complete picture than anyone inside.

Examples:
- A government agency where classified information does not cross departmental lines — the protagonist can combine information from multiple departments that no single insider has
- A criminal network where lieutenants deliberately withhold information from each other to protect their own position — the protagonist can use one lieutenant''s information against another
- A corporation where sales and operations have conflicting models of the business — the protagonist can exploit the gap between what the company promises and what it can deliver

**3. Loyalty Fractures**
The organization contains individuals whose primary loyalty is to a person, sub-faction, or external entity rather than to the organization itself. These individuals will behave in ways that serve their actual loyalty even when this conflicts with the organization''s interests. The protagonist can identify these individuals and work through them.

Examples:
- A senior official who was passed over for promotion and maintains a relationship with a rival faction
- A member who joined the organization for personal reasons that have since been invalidated and is now waiting for an exit
- A sub-faction within the organization that has a different vision of what the organization should be doing

**Design the Exploitable Structure field as a systems analysis, not a heist plan.** The protagonist will derive the heist plan from the analysis. The field itself should describe the structural features as they exist, not as the protagonist has decided to use them.

---

### The What They Want Field — Modeling True Interests

Every organization entry must include a **What They Want** field that distinguishes between the organization''s stated objectives and their actual interests.

**The distinction matters because**: The protagonist''s ability to manage an organization''s behavior depends on understanding what the organization actually optimizes for — which is frequently not what it says it optimizes for.

Stated objectives are often public commitments that the organization cannot abandon without losing legitimacy. Actual interests are the outcomes that the organization''s internal incentive structures reliably produce. The gap between them is where the protagonist operates.

Questions to answer in the What They Want field:
- What would this organization sacrifice its stated objectives to preserve?
- What would this organization violate its stated rules to achieve?
- What outcome would this organization consider an acceptable loss that it would never publicly acknowledge as acceptable?
- What does this organization fear more than its stated threats?

**The protagonist who understands an organization''s true interests can offer what no other actor offers — a path to the actual desired outcome that the organization cannot pursue publicly.**

---

### The Assessed Shelf Life Field — Organizational Relationships Have Expiration Dates

Every organization entry must include an **Assessed Shelf Life** field: the protagonist''s estimate of how long this relationship with the organization will remain viable at its current value.

**Why this field matters narratively**: Relationships with organizations decay. The conditions that made the relationship valuable change. The organization''s internal power structure shifts. The protagonist''s needs evolve. The organization discovers something about the protagonist that changes its calculation. Time itself erodes the basis of transactional relationships.

The Assessed Shelf Life field creates built-in narrative pressure: the protagonist knows (or should know) that they are working within a window. As the window narrows, decisions become more urgent. When the window closes, the protagonist must either renegotiate the relationship, replace it, or accept the consequences of losing it.

**Design shelf lives that create story problems:**
- A relationship that expires before the protagonist has achieved a critical objective creates a time-pressure subplot
- A relationship that expires unexpectedly early (the protagonist''s estimate was wrong) forces improvisation
- A relationship that outlasts its expected shelf life may indicate that the organization''s interests have shifted in ways the protagonist has not yet understood — which may be better or worse than expected

---

### Recommended Organization Configuration

For a novel-length work, consider:

- **1–2 Political Bodies** (at least one where the protagonist has cultivated access, at least one that is actively hostile)
- **1 Criminal Network** (with exploitable internal fractures that the protagonist can work with or against)
- **1–2 Knowledge Holders** (at least one whose information the protagonist needs and one who may have information about the protagonist)
- **Additional organizations as needed** based on the specific setting and conflict

The organization configuration should map onto the protagonist''s threat register and objective hierarchy. Every major organization should be either a resource toward a primary objective or a threat to one.

---

### Common Design Errors

**Error 1: Organizations are monolithic.**
Real organizations have factions, dissenters, and individuals who are only partially captured by institutional logic. An organization that speaks and acts with a single voice is not an organization — it is a character in institutional costume. Build in the internal complexity that makes organizations navigable for the protagonist.

**Error 2: The protagonist''s model of the organization is complete.**
If the protagonist perfectly understands every organization they interact with, the organizations cannot surprise the protagonist, and the story cannot surprise the reader. Every major organization should have at least one dimension that the protagonist has mapped incorrectly or not at all — and that dimension should eventually matter.

**Error 3: Exploitable Structures are too obvious.**
If the protagonist identifies and exploits an organizational vulnerability in a single scene with no resistance, the exploitation demonstrates competence without creating tension. The best exploitable structures require sustained effort, create secondary complications, and sometimes produce unexpected results even when the protagonist''s analysis is correct.

**Error 4: What They Want is what they say they want.**
Organizations whose stated and actual interests are identical have no internal politics and no internal corruption. This is not how organizations work. Always distinguish between the stated objective and the actual interest — and make the gap consequential.

**Error 5: Organizational relationships are indefinitely renewable.**
The protagonist should not be able to maintain every useful organizational relationship forever. Relationships have costs that accumulate, conditions that change, and counterparties who reassess. The Assessed Shelf Life field exists to force the narrative to engage with organizational relationship decay. Do not let relationships persist past their shelf life without acknowledging the consequences.',
  '## "Faction/Organization" Generation — The Purely Pragmatic Novel

### The Systems Theory of Organizational Design

In a story built around a rational protagonist, every organization is a system — and systems have properties that individual actors do not. Systems have internal incentive structures. They have information flows that determine what people inside the system know and do not know. They have institutional loyalties that sometimes override individual rationality. They have structural vulnerabilities that are a direct consequence of their structural strengths.

**The protagonist''s fundamental advantage: they can see the system from outside it, while everyone inside the system is partially captured by it.**

A police officer thinks like a police officer. A board member thinks like a board member. An organization''s members have internalized its logic so thoroughly that they often cannot see what the organization''s logic makes impossible for it to do. The protagonist can. This is their edge.

But the protagonist''s edge is also a blind spot: they can analyze organizations from outside, but they cannot fully feel what it is like to be inside one — to have your judgment shaped by institutional belonging, to owe loyalty to people rather than to outcomes. Organizations have cohesion that is partially non-rational. The protagonist''s purely rational model will always somewhat underestimate this cohesion.

**Design organizations as systems with internal logic, structural vulnerabilities, and dimensions that the protagonist''s model partially fails to capture.**

---

### Organization Type Design Guide

#### Political Body (政治机构)

Political bodies include formal governmental institutions, regulatory agencies, legislative bodies, political parties, and the informal power structures that exist alongside them. Their defining characteristic is that they operate through legitimacy — the recognized right to make binding decisions — and their internal dynamics are structured around the competition for that legitimacy.

**Key design questions:**

- **What is this body''s formal mandate, and how far does it deviate from actual function?** Almost all political bodies operate differently from their official purpose. Where is the gap? Who benefits from the gap? Who is harmed by it?
- **Who are the visible principals and the actual principals?** In political bodies, the person who holds the position and the person who wields the power are frequently different. Who makes the real decisions? Through what channel does their influence flow?
- **What are the competing factions within the body?** Political bodies are almost never unified. There are internal fault lines — ideological, personal, regional, institutional. Where are the lines? Who is aligned with whom? What would cause an alignment to shift?
- **What is this body''s relationship to its own rules?** Organizations that can make and enforce rules often develop a complicated relationship with those rules over time. Which rules are treated as binding? Which are treated as advisory? Who decides which is which?
- **Where are the exploitable cracks?** For the protagonist, a political body is most interesting where its factions are misaligned — where one faction can be played against another, where the formal process can be used to achieve outcomes its designers did not intend, where the bureaucratic apparatus can be activated for purposes its operators would find uncomfortable.

**The protagonist''s analytical approach to political bodies**: Map the formal structure, then map the actual power flows, then map the gaps between them. The gaps are where leverage lives.

---

#### Criminal Network (犯罪网络)

Criminal networks are informal organizations that operate outside legitimate institutional structures. Their defining characteristics are that they cannot rely on legal enforcement of agreements — all compliance is voluntary or coerced — and that trust is their scarcest and most valuable resource.

**Why criminal networks are both more vulnerable and more dangerous than legitimate organizations:**

- **More vulnerable**: Without legal enforcement, criminal organizations cannot scale in the same way legitimate organizations can. They depend on personal relationships and reputation. These relationships can be disrupted. Reputation can be attacked. The organization''s inability to resolve disputes through legitimate channels means internal conflicts escalate faster.
- **More dangerous**: Criminal organizations routinely use violence as a coordination mechanism. The protagonist is accustomed to operating in environments where the worst outcome is a professional setback. In a criminal network, the worst outcome is physical. The protagonist must recalibrate their risk calculus.

**Key design questions:**

- **What is the organization''s primary coordination mechanism?** Most criminal networks rely on some combination of personal loyalty, coercive threat, shared risk (mutual blackmail), and financial interdependence. Which does this network primarily use? What are the implications for its vulnerabilities?
- **Where does trust break down in this network?** Every criminal organization has internal trust deficits — people who are suspected, people who have reason to defect, people who are loyal to a sub-faction rather than the whole. Where are these fault lines?
- **What is the organization''s relationship to legal institutions?** Fully separated, selectively corrupt, or partially integrated? Each configuration has different implications for how the protagonist can interact with both the criminal network and the legal institutions simultaneously.
- **Who are the violent actors, and what constrains them?** Violence is a resource in criminal organizations, but it is also a cost — it attracts attention, disrupts operations, and signals weakness if used excessively. Who controls the use of violence in this network? What would cause that control to break down?
- **What does the protagonist''s rationality miss about this environment?** Criminal networks often run on codes of honor, on personal loyalty that goes beyond rational self-interest, on reputation systems that do not map neatly onto economic logic. The protagonist may systematically underestimate the role of non-transactional loyalty in keeping these organizations functional.

---

#### Knowledge Holder (信息势力)

A Knowledge Holder is any organization whose primary asset is information: intelligence agencies, research institutions, investigative journalists, professional guilds, criminal information brokers, religious institutions with long institutional memory. What they control is not physical resources or formal authority but epistemic privilege — they know things others do not.

**Key design questions:**

- **What do they actually know, and what do they only appear to know?** Knowledge Holders often curate the appearance of their knowledge as carefully as the knowledge itself. What is in their actual archive? What do they claim to have? What is the gap?
- **How do they acquire information?** Sources, methods, and access channels. What is their information-gathering process? What does that process systematically miss? The protagonist who understands how a Knowledge Holder acquires information can infer what they do not know as well as what they do.
- **What is the access price?** Knowledge Holders are rarely altruistic. Access to their knowledge requires payment — monetary, relational, or informational. What does accessing this organization cost? Is the price fixed or negotiated? What precedent does paying create?
- **What do they want from the protagonist?** Knowledge Holders often value information about the protagonist as much as the protagonist values their information. The exchange is not simply money for knowledge — it may be information for information, access for access, or a service for intelligence.
- **What is their institutional interest in the protagonist''s success or failure?** A Knowledge Holder is not a neutral resource. They have their own agenda, their own preferred outcomes, their own assessment of whether the protagonist''s objectives align with their interests. Do they want the protagonist to succeed? Would they actively work against the protagonist if their interests diverged?

---

### The Exploitable Structure Field — The Most Important Field

Every organization entry must include an **Exploitable Structure** field. This is the analysis of the organization as a system with inherent vulnerabilities — not the protagonist''s plan to exploit those vulnerabilities, but the underlying structural features that make exploitation possible.

**Three primary categories of exploitable structure:**

**1. Incentive Misalignment**
The organization''s reward structure creates behavior that is contrary to the organization''s stated objectives. Individual members optimize for what the system rewards them for, not for what the system says it wants. This gap is exploitable: the protagonist can offer individuals what the organization does not, or can work through the organization''s incentive structure to produce outcomes that serve the protagonist''s objectives.

Examples:
- An enforcement agency where promotions are based on case volume creates investigators who prefer many small cases to fewer important ones
- A political body where members'' tenure depends on constituent approval creates representatives who prioritize visibility over effective legislation
- A criminal network where advancement requires demonstrated loyalty creates members who compete to perform loyalty rather than to produce results

**2. Information Silos**
The organization does not share information internally in a way that produces accurate collective understanding. Different parts of the organization have access to different information, and the synthesis that would produce correct understanding does not occur. The protagonist, who can observe multiple parts of the organization from outside, may have a more complete picture than anyone inside.

Examples:
- A government agency where classified information does not cross departmental lines — the protagonist can combine information from multiple departments that no single insider has
- A criminal network where lieutenants deliberately withhold information from each other to protect their own position — the protagonist can use one lieutenant''s information against another
- A corporation where sales and operations have conflicting models of the business — the protagonist can exploit the gap between what the company promises and what it can deliver

**3. Loyalty Fractures**
The organization contains individuals whose primary loyalty is to a person, sub-faction, or external entity rather than to the organization itself. These individuals will behave in ways that serve their actual loyalty even when this conflicts with the organization''s interests. The protagonist can identify these individuals and work through them.

Examples:
- A senior official who was passed over for promotion and maintains a relationship with a rival faction
- A member who joined the organization for personal reasons that have since been invalidated and is now waiting for an exit
- A sub-faction within the organization that has a different vision of what the organization should be doing

**Design the Exploitable Structure field as a systems analysis, not a heist plan.** The protagonist will derive the heist plan from the analysis. The field itself should describe the structural features as they exist, not as the protagonist has decided to use them.

---

### The What They Want Field — Modeling True Interests

Every organization entry must include a **What They Want** field that distinguishes between the organization''s stated objectives and their actual interests.

**The distinction matters because**: The protagonist''s ability to manage an organization''s behavior depends on understanding what the organization actually optimizes for — which is frequently not what it says it optimizes for.

Stated objectives are often public commitments that the organization cannot abandon without losing legitimacy. Actual interests are the outcomes that the organization''s internal incentive structures reliably produce. The gap between them is where the protagonist operates.

Questions to answer in the What They Want field:
- What would this organization sacrifice its stated objectives to preserve?
- What would this organization violate its stated rules to achieve?
- What outcome would this organization consider an acceptable loss that it would never publicly acknowledge as acceptable?
- What does this organization fear more than its stated threats?

**The protagonist who understands an organization''s true interests can offer what no other actor offers — a path to the actual desired outcome that the organization cannot pursue publicly.**

---

### The Assessed Shelf Life Field — Organizational Relationships Have Expiration Dates

Every organization entry must include an **Assessed Shelf Life** field: the protagonist''s estimate of how long this relationship with the organization will remain viable at its current value.

**Why this field matters narratively**: Relationships with organizations decay. The conditions that made the relationship valuable change. The organization''s internal power structure shifts. The protagonist''s needs evolve. The organization discovers something about the protagonist that changes its calculation. Time itself erodes the basis of transactional relationships.

The Assessed Shelf Life field creates built-in narrative pressure: the protagonist knows (or should know) that they are working within a window. As the window narrows, decisions become more urgent. When the window closes, the protagonist must either renegotiate the relationship, replace it, or accept the consequences of losing it.

**Design shelf lives that create story problems:**
- A relationship that expires before the protagonist has achieved a critical objective creates a time-pressure subplot
- A relationship that expires unexpectedly early (the protagonist''s estimate was wrong) forces improvisation
- A relationship that outlasts its expected shelf life may indicate that the organization''s interests have shifted in ways the protagonist has not yet understood — which may be better or worse than expected

---

### Recommended Organization Configuration

For a novel-length work, consider:

- **1–2 Political Bodies** (at least one where the protagonist has cultivated access, at least one that is actively hostile)
- **1 Criminal Network** (with exploitable internal fractures that the protagonist can work with or against)
- **1–2 Knowledge Holders** (at least one whose information the protagonist needs and one who may have information about the protagonist)
- **Additional organizations as needed** based on the specific setting and conflict

The organization configuration should map onto the protagonist''s threat register and objective hierarchy. Every major organization should be either a resource toward a primary objective or a threat to one.

---

### Common Design Errors

**Error 1: Organizations are monolithic.**
Real organizations have factions, dissenters, and individuals who are only partially captured by institutional logic. An organization that speaks and acts with a single voice is not an organization — it is a character in institutional costume. Build in the internal complexity that makes organizations navigable for the protagonist.

**Error 2: The protagonist''s model of the organization is complete.**
If the protagonist perfectly understands every organization they interact with, the organizations cannot surprise the protagonist, and the story cannot surprise the reader. Every major organization should have at least one dimension that the protagonist has mapped incorrectly or not at all — and that dimension should eventually matter.

**Error 3: Exploitable Structures are too obvious.**
If the protagonist identifies and exploits an organizational vulnerability in a single scene with no resistance, the exploitation demonstrates competence without creating tension. The best exploitable structures require sustained effort, create secondary complications, and sometimes produce unexpected results even when the protagonist''s analysis is correct.

**Error 4: What They Want is what they say they want.**
Organizations whose stated and actual interests are identical have no internal politics and no internal corruption. This is not how organizations work. Always distinguish between the stated objective and the actual interest — and make the gap consequential.

**Error 5: Organizational relationships are indefinitely renewable.**
The protagonist should not be able to maintain every useful organizational relationship forever. Relationships have costs that accumulate, conditions that change, and counterparties who reassess. The Assessed Shelf Life field exists to force the narrative to engage with organizational relationship decay. Do not let relationships persist past their shelf life without acknowledging the consequences.',
  (SELECT id FROM novel_creation_method WHERE name = 'The Purely Pragmatic Novel' LIMIT 1),
  1,
  25,
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
