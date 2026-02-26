-- "Enemy Faction" (Organization) Generation — The Vengeance Soul Novel
-- Layer 3 domain knowledge skill for organization/faction generation
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-vengeance-org-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'vengeance-org-gen',
  '"Enemy Faction" generation: generates the power structures and organizations behind the betrayal in The Vengeance Soul Novel',
  '"Enemy Faction/Organization" generation: generates the power structures behind the betrayal in The Vengeance Soul Novel',
  '## "Enemy Faction/Organization" Generation — The Vengeance Soul Novel

In Vengeance Driven fiction, factions exist primarily as the institutional architecture of the protagonist''s suffering. The betrayal that destroyed the protagonist was rarely purely personal — it was enabled, protected, or perpetrated by organizations that had the power to commit it and then cover it up. These factions are the structures the protagonist must dismantle.

The central design principle: **every faction has a face it shows the world and a truth it conceals.** The gap between these two is the protagonist''s weapon.

---

### Faction Type Design Guide

#### Noble House / Aristocratic Family
Design considerations:
- **The inherited dimension of guilt**: Who in the current generation knows? Who benefits without having participated? At what point does inherited benefit become culpability?
- **What legitimizes them**: Noble houses derive power from lineage, land, political connection, or military force. Each source of legitimacy is a potential vector of attack.
- **The public display vs. private reality**: The gracious lord who ordered the execution, the charitable patriarch who signed the warrant
- **Internal fractures**: Heirs who are ashamed but trapped, members who would betray the house if they thought they could survive it

#### Criminal Syndicate
Design considerations:
- **The layers of plausible deniability**: The boss didn''t pull the trigger. Establishing the chain of command that connects the visible operator to the decision-maker is both the protagonist''s challenge and the reader''s dramatic interest.
- **What they protect and what they fear**: Every criminal organization has something it cannot afford to have exposed. That something is the lever.
- **The violence that maintains them**: Unlike legitimate factions, syndicates enforce their power openly (though selectively). The protagonist may face direct physical threat in ways a noble house would not employ personally.
- **Their relationship to legitimate power**: Most criminal factions exist in a corrupt symbiosis with legal institutions. The cover-up of the original crime may have required both.

#### Religious Institution
Design considerations:
- **The specific horror of sacred authority turned corrupt**: Religious institutions that participate in injustice carry a particular weight because they claim moral authority. Their hypocrisy is the most complete version of the gap between face and truth.
- **True believers vs. corrupt leadership**: Not everyone within the institution is guilty. The protagonist must distinguish between the institution as structure (to be dismantled) and the individuals within it (whose guilt is variable).
- **What doctrine enables or obscures**: How has the institution''s teaching been weaponized to justify or cover up the crime?
- **What the institution most fears losing**: Legitimacy, the faith of its followers, a specific secret, political protection.

#### Military Order / Government Body
Design considerations:
- **The bureaucratic diffusion of guilt**: "Just following orders" is the specific moral cowardice of institutional perpetrators. The protagonist must decide whether they will hold each wheel in the machine accountable.
- **The records that prove everything**: Institutional actors create paper trails. Part of the protagonist''s revenge may involve finding and weaponizing these records.
- **Loyal soldiers vs. corrupt commanders**: Again, not everyone is guilty. But the institution protected the guilty, and that protection is a form of complicity.
- **The successor problem**: Destroying an institution may create a power vacuum. Does the protagonist care?

#### Merchant Empire / Guild
Design considerations:
- **The economic architecture of the crime**: Why was the protagonist''s destruction financially advantageous? Who profited?
- **The reach of money**: Economic power can protect against most forms of direct attack. The protagonist must find ways to attack through financial channels, or through the things money cannot protect.
- **The legitimate face**: Merchant guilds and empires are among the most adept at maintaining legitimate appearances. Their public facing is their greatest protection.

---

### Faction Generation Field Guide

#### Role in the Betrayal
The most important field. Three key questions:
1. Did they orchestrate it, participate in it, or simply benefit from it and cover it up?
2. What would they have done differently if they''d known the protagonist would survive?
3. Do they still consider what they did justified?

#### Public Face vs. True Nature
The gap here is the protagonist''s weapon. Generate both honestly:
- The public face should be genuinely appealing, not obviously villainous — people within and without the faction believe in it
- The true nature should be specific about the corruption: what rules they actually follow, what they actually value, what they are actually afraid of

#### Internal Fractures
This is where the revenge can be seeded. Every faction has:
- Members who know too much and carry the knowledge badly
- Members who would benefit from a change of leadership
- Members who believe in the institution''s stated values and are therefore genuinely troubled by its hidden ones
- Members who are already afraid that someone is coming for them

The protagonist needs to find and use these fractures. They are the cracks in the wall.

#### Awareness of the Protagonist
Three dramatically distinct states:
- **They don''t know the protagonist survived / is coming**: Maximum dramatic irony. The protagonist has the advantage of invisibility.
- **They suspect but aren''t certain**: The faction takes defensive measures that force the protagonist to adapt. Creates a cat-and-mouse structure.
- **They know**: Direct conflict. The protagonist has lost stealth but may have gained the ability to move openly. Fear can make institutions make mistakes.

---

### Faction Roster Recommendations

| Role | Description | Count |
|------|-------------|-------|
| Primary Faction | The institution most directly responsible | 1 |
| Protective Faction | The organization that covered it up or was paid to look away | 0-1 |
| Beneficiary Faction | The organization that profited without necessarily participating | 0-1 |

The most satisfying vengeance architectures have the protagonist work through the protective/beneficiary layers before reaching the primary.

---

### Setting Interdependencies

- **Origin of Vengeance → Role in the Betrayal**: The factions must be anchored to specific acts in the original crime.
- **Vengeance Architecture → Kill Order**: The faction hierarchy often maps to the revenge sequence — outer layers first, core last.
- **Character Roster → Key Figures**: The characters in the character module should have specific affiliations to the factions here. Factions should feel like they are made of the specific people in the character roster.

### Common Errors

- **The uniformly evil faction**: No one within the institution believes in what they do or cares about the people they harm. In reality, even corrupt institutions contain true believers and people who have simply never been asked to face what they are part of. This makes the protagonist''s actions more complex.
- **The faction is easily destroyed**: The protagonist dismantles it too quickly or cleanly. Institutional power is resilient; it has survived other threats. Give it teeth.
- **The cover-up is perfect**: No one within the faction has doubts, fears, or loose ends. Every cover-up has cracks. Find them and build them in.
- **No survivor guilt**: At least one person within the faction has been living with knowledge of what they did. That person is the protagonist''s best tool — and the most complicated relationship in the novel.
',
  '## "Enemy Faction/Organization" Generation — The Vengeance Soul Novel

Factions are the institutional architecture of the protagonist''s suffering. Every faction has a face it shows the world and a truth it conceals. The gap between these two is the protagonist''s weapon.

---

### Key Faction Types

**Noble House**: Inherited guilt. Who in the current generation benefits without having participated? The gracious exterior hiding the warrant.

**Criminal Syndicate**: Layers of deniability. The chain of command is the challenge. Corrupt symbiosis with legitimate power.

**Religious Institution**: Sacred authority turned corrupt — the most complete gap between face and truth.

**Military / Government Body**: Bureaucratic diffusion of guilt. Records that prove everything. The successor problem.

**Merchant Empire**: Economic architecture of the crime. Who profited? Money''s reach and its limits.

---

### Critical Fields

**Role in the Betrayal**: Orchestrated, participated, or benefited and covered up? Do they still consider it justified?

**Public Face vs. True Nature**: The public face must be genuinely appealing — not obviously villainous. True nature specific about corruption and fear.

**Internal Fractures**: Members who know too much, who would benefit from change, who believe in stated values and are troubled by hidden ones.

**Awareness of the Protagonist**: Don''t know (protagonist has stealth), suspect (defensive measures), or know (direct conflict, their fear makes them make mistakes).

---

### Common Errors

- Uniformly evil faction — true believers and ordinary people exist inside even corrupt institutions
- Too easily destroyed — institutional power is resilient, give it teeth
- Perfect cover-up — every cover-up has cracks and survivor guilt
',
  (SELECT id FROM novel_creation_method WHERE name = 'The Vengeance Soul Novel' LIMIT 1),
  1,
  25,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
