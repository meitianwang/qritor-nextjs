-- Grim-Politics Novel「Power Bloc」organization generation skill (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-grim-politics-org-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'grim-politics-org-gen',
  '「势力/组织」生成：为 Grim-Politics Novel 生成政治势力，包含宣称目的与真实议程、权力基础、可被利用的内部裂缝与动态稳定性',
  '"Faction/Organization" generation: generate power blocs for Grim-Politics novels, covering declared vs. real purpose, power base, exploitable internal fractures, and current stability',
  '## "Power Bloc" Generation — Grim-Politics Novel

In Grim-Politics, no faction is what it claims to be. Every power bloc has a public ideology — the reason they give for existing and for their actions — and a real purpose, which is the actual interests the leadership are pursuing. The gap between these two is the source of the faction''s vulnerability: if the gap were ever fully exposed, the rank and file might not follow.

Every power bloc should answer: **What would destroy this faction — and does the protagonist have the means to do it?**

---

### Field Generation Guide

#### Faction Name

Names should reflect how the faction presents itself, not what it actually does. The most dangerous intelligence apparatus in the realm probably has a name that sounds bureaucratic and boring.

#### Faction Type

Each type has a characteristic power base, a characteristic weakness, and a characteristic role in political intrigue.

| Type | Power Base | Characteristic Weakness |
|------|-----------|------------------------|
| **Royal Court Faction** | Proximity to the throne; access to the ruler | Entirely dependent on the ruler''s continued favor; fall the moment the ruler dies or turns |
| **Military Command** | Control of organized force; the capacity for violence | Split loyalties between the institution and the commander; the troops may not follow orders against their countrymen |
| **Noble House** | Land, hereditary wealth, and the social structures that validate hierarchy | Dynastic dependence on biological continuity; one childless generation destroys centuries of positioning |
| **Church / Religious Order** | Legitimacy; the power to grant or deny divine sanction | Requires the population to believe; become visibly corrupt and the source of power corrodes |
| **Merchant Consortium** | Money; the ability to finance or starve any political project | No force of their own; require the legal system to protect their property rights — and the legal system is controlled by those they finance |
| **Foreign Power''s Proxy** | Resources and support from a state with different interests | Their domestic position depends on the foreign sponsor''s willingness to continue supporting them; the sponsor''s interests may not align with theirs |
| **Shadow Network / Intelligence Apparatus** | Information; the capacity to destroy anyone by exposing their secrets | Must maintain the appearance of serving whoever they officially serve; the moment it becomes clear they serve only themselves, they have no allies |
| **Revolutionary Movement** | Popular legitimacy; the promise of change; numbers | Unified only by opposition to the current order; the moment they win, the coalition fractures |
| **Criminal Syndicate with Political Reach** | Money, violence, and the information that flows through illicit networks | Operate outside the law, which means they cannot use the law to protect themselves; exist only as long as they are more useful than they are threatening |

#### Declared Purpose

The official ideology — what the faction claims to stand for, and why they present themselves as legitimate actors in the political arena.

**Design principle**: The declared purpose should be credible — not obviously false, but a partial truth that conceals the real purpose. The most effective public ideologies are ones where true believers exist alongside cynical operators.

- A noble house proclaims loyalty to the Crown and ancient custom — while positioning their candidate for the succession
- A religious order proclaims service to the divine — while accumulating land, gold, and intelligence
- A merchant consortium proclaims the importance of stable trade for all — while specifically arranging that stability benefits their networks

#### Real Purpose

What the faction actually wants. In Grim-Politics, real purposes are concrete and interest-based:

- **Dynastic survival**: Keep the family''s position across generations
- **Market control**: Monopolize a specific trade route, commodity, or financial service
- **Ideological hegemony**: Actually impose their beliefs on the entire political structure (the rarest real purpose, and the most dangerous faction when it exists)
- **Blackmail maintenance**: Their power derives from what they know about others; their real purpose is to keep knowing things
- **Managed decline**: They know their faction is losing; their purpose now is to lose in a way that leaves their core interests intact

#### Power Base

What actually gives this faction its leverage. In Grim-Politics, power bases are concrete and countable.

- **Armed force**: How many soldiers, of what quality, and who actually commands their loyalty
- **Financial resources**: What they can spend, what debts others owe them, and what they can cut off
- **Information**: What secrets they hold, and whose secrets they are
- **Institutional position**: Which formal roles they currently occupy, and what those roles enable
- **Popular support**: Whether ordinary people support or fear them, and whether that matters in the current power structure

#### Key Figures

The leadership and internal power players. Even within a faction, there is politics. Key figures should include:
- The formal leader (may or may not be the most powerful person)
- The person who actually makes decisions
- The faction''s most capable operator
- The internal dissenter or potential defector

#### Relationship to Protagonist

How the faction relates to the central player:
- **Tool to Be Wielded**: The protagonist has leverage over this faction or has recruited them
- **Temporary Alliance of Convenience**: Allied now, but the alliance has a shelf life; both sides know it
- **Sworn Enemy**: In direct competition; one must destroy the other
- **Unknowing Instrument**: The faction is advancing the protagonist''s goals without knowing it
- **Under Protagonist''s Control**: The protagonist effectively runs this faction
- **Rival for the Same Prize**: Pursuing the same goal through different means; not necessarily enemies

#### Exploitable Fractures

Every faction has internal divisions, and a sufficiently skilled player can work those fractures. The most useful fractures are the ones the faction leadership is trying to suppress:

- **Succession conflict**: Who leads the faction when the current leader dies or is removed?
- **Ideological fracture**: Members who actually believe the declared purpose vs. members who are purely cynical about it
- **Competing loyalties**: Members with outside obligations (family, faith, foreign connections) that may conflict
- **Generational division**: Old guard vs. new guard with different theories of how the game should be played
- **A betrayer in waiting**: Someone within the faction who has already been turned, or who could be

---

### Faction Lineup Recommendations

**For a Grim-Politics setting, aim for**:
1. **3-5 major factions** whose competition generates the central conflicts
2. **At least one faction that appears stronger than it is** (the protagonist''s challenge is finding the cracks)
3. **At least one faction that appears weaker than it is** (the revelation of their actual capability is a plot moment)
4. **No faction that is simply good**: Every bloc is pursuing interests; some interests are more sympathetic than others, but no faction is above the game

---

### Setting Linkage

| Setting Module | Impact on Factions |
|---------------|-------------------|
| **Political Landscape** | Government System → which faction types are possible; Corruption Level → how much the faction''s declared purpose deviates from its real one |
| **Core Premise** | Central Power Struggle → defines which faction types are most prominent; Story Archetype → specifies the central competition |
| **Magic & Dark Arts** | Who Wields It → some factions may have magical resources; Magic as Political Tool → factions use magic in specific ways |

---

### Common Errors

1. **Factions whose declared purpose IS their real purpose**: No serious political actor in this genre is transparent about their interests
2. **Factions with no exploitable fractures**: Every human institution has internal politics; a monolithic faction is a worldbuilding failure
3. **Factions that exist purely to oppose the protagonist**: Antagonist factions should have their own internal logic, not just be obstacles
4. **Power bases without costs**: Every source of power creates dependencies, obligations, and vulnerabilities
5. **Factions that the protagonist never actually outwits**: In Grim-Politics, the protagonist should exploit real structural weaknesses, not have adversaries conveniently make mistakes',
  '"Faction/Organization" generation for Grim-Politics novels.

No faction is what it claims to be. Every power bloc has a declared purpose and a real purpose — the gap between them is the source of their vulnerability.

Every faction should answer: What would destroy it — and does the protagonist have the means to do it?

### Faction Types
Royal Court Faction (throne proximity — falls when ruler dies), Military Command (split loyalties), Noble House (hereditary wealth — vulnerable to childlessness), Church/Religious Order (requires belief — corrodes when visibly corrupt), Merchant Consortium (no force of their own — need the legal system), Foreign Power''s Proxy (sponsor''s interests may diverge), Shadow Network (must appear to serve officially — once exposed as self-serving, no allies), Revolutionary Movement (unified only by opposition — fractures on victory), Criminal Syndicate (cannot use the law to protect themselves).

### Power Base
Armed force (quality and actual loyalty), financial resources (debts others owe them), information (whose secrets they hold), institutional position (formal roles), popular support (and whether that matters in current power structure).

### Exploitable Fractures
Succession conflict, ideological fracture (true believers vs. cynics), competing loyalties, generational division, a betrayer in waiting.',
  (SELECT id FROM novel_creation_method WHERE name = 'Grim-Politics Novel' LIMIT 1),
  1,
  25,
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
