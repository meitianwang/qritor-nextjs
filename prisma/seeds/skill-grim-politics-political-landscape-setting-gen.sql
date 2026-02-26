-- Grim-Politics Novel「Political Landscape」setting generation skill (Layer 3)
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-grim-politics-political-landscape-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'grim-politics-political-landscape-setting-gen',
  '「Political Landscape」设定生成：为 Grim-Politics Novel 生成政治格局设定，包括政府体制、权力中心、腐败程度、制度性不公与游戏规则',
  '"Political Landscape" setting generation: generate political landscape settings for Grim-Politics novels, covering government system, power centers, corruption level, systemic injustice, and the unwritten rules of the game',
  '## "Political Landscape" Setting Generation — Grim-Politics Novel

The Political Landscape is the world''s skeleton — the system of power that both enables and constrains every player. In Grim-Politics, the political landscape is never just background. It is an active force that produces outcomes: specific people become monsters because of how this system works, specific virtues become liabilities, specific vices become prerequisites for survival.

The key question is: **What does this system demand of the people who operate within it?**

---

### Field Generation Guide

#### Government System

The formal structure — but in Grim-Politics, the formal structure is always a facade over the real distribution of power. Describe both.

| System | Structural Tension | Typical Failure Mode |
|--------|-------------------|---------------------|
| **Absolute Monarchy** | Succession is always a crisis; the king''s health is the state''s health | When the king is incompetent, the court fills the vacuum with competing factions |
| **Oligarchic Council** | Consensus is impossible; the council governs by paralysis interrupted by purges | A single sufficiently ruthless member can leverage the others'' mutual distrust |
| **Military Junta** | Power rests on force, not legitimacy; every general is a potential usurper | Coup cycles — the new strongman faces the same problem as the old one |
| **Theocratic Rule** | The gap between divine mandate and political reality creates infinite hypocrisy | Schisms; the question of who interprets the divine will is always a power struggle |
| **Feudal Fragmentation** | No center; power is personal and local; alliances are everything | No one can act at scale; the system cannot respond to existential threats |
| **Puppet State Under Foreign Control** | The visible government has no real authority; real power is the occupation administrator | Collaboration vs. resistance is the only political question; everyone is compromised |
| **Republic Rotting from Within** | Democratic forms maintained while democratic substance has been hollowed out | The corruption is structural — the procedures that should prevent abuse are now used to enable it |

**System Details**: How does it actually work day to day? What is the gap between the formal rules and the real operation? Who really makes decisions, and through what informal mechanisms?

#### Power Centers

The specific nodes of power — the throne, the treasury, the army, the church, the spy network. In Grim-Politics, **no single power center is sufficient**. The game is about controlling combinations.

- **The Throne / Seat of Government**: Who sits on it, who controls access to it, and who its occupant actually obeys
- **The Treasury / Economic Control**: Who funds the government, what debts exist, and who can threaten the revenue stream
- **The Military / Force Monopoly**: Who commands loyalty (not just obedience), and whether that command is personal or institutional
- **The Spy Network / Information Monopoly**: Who knows what, and who controls what the decision-makers know
- **The Church / Legitimacy Monopoly**: Who controls the narrative of divine sanction, and how much that still matters
- **The Streets / Popular Force**: Whether mob action or popular unrest is a tool players use or a wild card they fear

**Specify which power centers exist in your setting**, and who currently controls or contests each one.

#### Corruption Level

Grim-Politics requires corruption, but the flavor matters enormously. Different corruption levels produce different stories.

- **Systemic — Corruption Is the System**: There is no "clean" version of this government that ever existed. The bribes, the appointments by favor, the laws designed to be selectively enforced — this is how it was designed to work, for the benefit of those who designed it. Players are not corrupt within a system; the system is the corruption.
- **Normalized — Everyone Knows, No One Acts**: The corruption is visible and acknowledged, but the social/political cost of addressing it exceeds the cost of tolerating it. This is the most politically realistic option.
- **Contested — Some Still Fight It**: There are genuine reformers, and their failure or success is part of the story. This produces the corrupted idealist archetype.
- **Selective — Corrupt at the Top, Functional Below**: The high politics are rotten, but the local administration actually works. This creates interesting complexity — the kingdom "functions" while the ruling class devours it.
- **Sudden Decay — Once Healthy, Now Rotting**: The corruption is recent and living memory includes the alternative. This creates nostalgics, opportunists, and accelerationists.

#### Systemic Injustice

The structural cruelties that reproduce themselves regardless of who holds power. In Grim-Politics, systemic injustice is not a problem waiting to be solved — it is a feature that serves specific interests.

What does the system do to those at the bottom? What category of person is it structurally designed to exploit or discard? Examples:
- Serfdom, debt bondage, or indentured service that makes labor captive
- Laws of inheritance that concentrate wealth and make downward mobility permanent
- Ethnic, regional, or religious minorities who bear the costs that the ruling class socializes
- A conscript military that kills the poor to defend the land-holdings of the rich

**The systemic injustice should connect to the plot**: reformers who want to address it become threats to the powerful; the oppressed are a potential source of rebellion that players exploit or fear.

#### External Pressures

The threats and opportunities outside the border. In Grim-Politics, external pressures are almost always entangled with internal factions — foreign powers don''t invade, they find proxies.

- Are there hostile neighbors, and do domestic factions benefit from a state of permanent threat?
- Is there a recent conquest, and what does the occupied population want?
- Are there trade dependencies that make the kingdom economically hostage to outsiders?
- Is there a great power that backs different domestic factions for its own reasons?

#### The Rules of the Game

The unwritten laws that all serious players understand. In Grim-Politics, these rules are not moral — they are strategic. Breaking them doesn''t make you evil; it makes you a threat to everyone.

**Examples of game rules**:
- "You may destroy your enemies, but you do not destroy their families — if you start that precedent, your own family is next"
- "Information may be bought and sold, but the names of informers are never revealed — without that protection, no one will inform"
- "The public form must be maintained — you can do anything in private, but a public insult to the Crown demands response"
- "Foreign powers may be used, but foreign troops on domestic soil is a line that makes enemies of everyone"

**The most interesting plot moments arise when a player violates a rule** and the consequences cascade.

---

### Field Linkage

- Government System → determines which power centers are most contested
- Corruption Level → determines how much reform is possible, and what it costs
- Systemic Injustice → provides motivation for low-status players and defines what a "good" outcome would look like
- Rules of the Game → creates the mechanism for escalation: what happens when someone breaks a rule?

### Common Errors

1. **The system has a "correct" version**: Implying that the right ruler would make everything work — this is a different genre
2. **Corruption without function**: Real corruption is stable because it serves someone''s interests; random dysfunction is just bad worldbuilding
3. **External pressures that never interact with internal politics**: Borders are where internal factions go to find foreign allies
4. **Rules of the Game that are never broken**: If the rules are inviolable, there is no escalation; the whole point is that someone will eventually break them',
  '"Political Landscape" setting generation for Grim-Politics novels.

The political landscape is an active force that produces monsters — specific virtues become liabilities, specific vices become prerequisites for survival.

Key question: What does this system demand of the people who operate within it?

### Government System
Absolute Monarchy (succession crisis), Oligarchic Council (paralysis and purges), Military Junta (coup cycles), Theocratic Rule (who interprets divine will), Feudal Fragmentation (personal power, no center), Puppet State (collaboration vs. resistance), Republic Rotting from Within (forms maintained, substance hollowed).

### Power Centers
Specify who controls: the throne (and who controls access to it), treasury (who funds the state and what debts exist), military (loyalty vs. obedience), spy network (information monopoly), church (legitimacy monopoly), streets (mob action as tool or wildcard).

### Corruption Level
Systemic (corruption IS the system), Normalized (visible but no one acts), Contested (reformers exist), Selective (rotten top, functional bottom), Sudden Decay (living memory of health).

### Systemic Injustice
Structural cruelties that reproduce themselves regardless of who holds power. Should connect to the plot — reformers become threats; the oppressed become tools.

### External Pressures
Foreign powers find proxies, not armies. Trade dependencies that make the kingdom economically hostage. Great powers that back competing domestic factions.

### The Rules of the Game
Unwritten strategic laws: don''t destroy families (starts a precedent), informers'' names are never revealed, public form must be maintained. Most interesting moments arise when someone breaks a rule.',
  (SELECT id FROM novel_creation_method WHERE name = 'Grim-Politics Novel' LIMIT 1),
  1,
  12,
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
