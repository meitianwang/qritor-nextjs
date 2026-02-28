-- -----------------------------------------------------------------------------
-- Hybrid Romantasy / Thriller AI Generation Skills Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 106; 

-- ============================================================================
-- 1. Setting Content Generation Skills (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'romantasy-thriller-story-hook-setting-gen',
  'Generate the inciting incident & fatal romantic encounter (English)',
  '"Story Hook" setting generation for Romantasy/Thriller',
  '## "Story Hook" Setting Generation — Romantasy/Thriller\n\n...',
  '## "Story Hook" Setting Generation — Romantasy/Thriller\n\nThis genre perfectly balances the tension of a high-stakes crime or conspiracy with the intoxicating pull of a forbidden romance. \n\n### Field Guidelines\n\n#### Inciting Incident\nA murder, a stolen artifact, a rebellion, or uncovering a dark societal truth. It must immediately threaten the protagonist\'s life or family.\n\n#### The Fatal Encounter\nThe moment the protagonist crosses paths with the love interest. Make it crackle with danger. For example, the protagonist breaks into a mansion looking for evidence, only to be caught by the brooding enemy prince who holds a knife to her throat—yet their eyes lock and the chemistry is instant.\n\n#### Clashing Agendas\nThey are fundamentally opposed. (e.g., She is trying to assassinate the King; he is the King\'s loyal enforcer). This guarantees the "enemies-to-lovers" slow burn.',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'romantasy-thriller-world-setting-gen',
  'Generate the deceptive world dynamics & underlying conspiracies (English)',
  '"Worldview" setting generation for Romantasy/Thriller',
  '## "Worldview" Setting Generation — Romantasy/Thriller\n\n...',
  '## "Worldview" Setting Generation — Romantasy/Thriller\n\nWhether it is a fantasy realm or a futuristic sci-fi city, the world is broken, corrupt, and dangerous.\n\n### Field Guidelines\n\n#### The Facade vs. The Underlying Rot\nContrast the beautiful public image (glamorous royal balls, advanced neon utopias) with the horrific reality (blood rituals keeping the magic alive, corporations harvesting memories). A thriller requires a mystery; the world itself is the biggest mystery.\n\n#### Rules of Survival\nStrict societal codes that make romance deadly. (e.g., "Fraternizing across castes is punished by memory erasure," or "Witches caught loving vampires will be burned.")',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'romantasy-thriller-style-setting-gen',
  'Generate the narrative style guiding tension and sensory descriptions (English)',
  '"Writing Style" setting generation for Romantasy/Thriller',
  '## "Writing Style" Setting Generation — Romantasy/Thriller\n\n...',
  '## "Writing Style" Setting Generation — Romantasy/Thriller\n\nThis genre lives or dies by its atmosphere and pacing.\n\n### Field Guidelines\n\n#### Tone\nIt should feel like a tightrope walk between a psychological thriller and a profound, aching romance. The threat of death is constant, making fleeting moments of connection feel explosive.\n\n#### Sensory Focus\nInstruct the writing to focus on physical proximity and adrenaline. Describe the cold steel of weapons, the scent of expensive cologne mixed with smoke, heavy breathing in hiding spots, and the undeniable draw of a lover\'s gaze across a crowded, hostile room.',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);


-- ============================================================================
-- 2. Character Generation Skill (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'romantasy-thriller-character-gen',
  'Generate morally gray leads, dangerous lovers, and hidden masterminds (English)',
  '"Character" generation for Romantasy/Thriller',
  '## "Character" Generation — Romantasy/Thriller\n\n...',
  '## "Character Profile" Generation — Romantasy/Thriller\n\nThere are no "purely good" people here. Everyone has blood on their hands or secrets in their past.\n\n### Field Guidelines\n\n#### Roles and Hidden Truths\n- **Protagonist**: Capable, cynical, driven by vengeance or survival. Might appear as a commoner but is secretly a trained assassin or a lost heir.\n- **Love Interest**: The "Shadow Daddy" or femme fatale. Ruthless to the world, fiercely protective of the protagonist. Their public persona is terrifying (the cruel general, the mafia boss), but their vulnerability drives the romance.\n\n#### Romantic/Betrayal Dynamic\nDefine the trope: Enemies to Lovers, Forced Proximity, Fake Dating/Marriage of Convenience (for political or espionage reasons), or Grumpy x Sunshine. The tension must constantly border on betrayal: "If he finds out who I really am, he will kill me."',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

-- ============================================================================
-- 3. Scene Generation Skill (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'romantasy-thriller-scene-gen',
  'Generate high-stakes locations perfect for espionage and romance (English)',
  '"Scene" generation for Romantasy/Thriller',
  '## "Scene" Generation — Romantasy/Thriller\n\n...',
  '## "Location Profile" Generation — Romantasy/Thriller\n\nSpaces must serve both plot (the thriller mystery) and relationship development (the romance).\n\n### Field Guidelines\n\n#### Aesthetic & Espionage Opportunity\nCreate places of extreme wealth and deep shadows. (e.g., A masked gala in a floating castle where the protagonist must steal a signet ring, a rain-slicked neon alley where an informant was just murdered).\n\n#### Romantic Tension Trigger\nHow does the environment force the leads together? They might have to pretend to be passionately kissing to avoid the patrol guards, or they are trapped in a collapsed ruin where they finally confess their truths in the dark.',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

-- ============================================================================
-- 4. Prop Generation Skill (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'romantasy-thriller-prop-gen',
  'Generate MacGuffins, murder weapons, and romantic tokens (English)',
  '"Prop" generation for Romantasy/Thriller',
  '## "Prop" Generation — Romantasy/Thriller\n\n...',
  '## "Item Profile" Generation — Romantasy/Thriller\n\nObjects carry immense narrative weight—they are clues to a murder, keys to a kingdom, or undeniable proof of forbidden love.\n\n### Field Guidelines\n\n#### Thriller vs. Romantic Significance\nFor example, an item might be "The Hollow Locket".\n- **Thriller Significance**: Inside is a microchip/poison drop that proves the King killed the protagonist\'s father.\n- **Romantic Subtext**: The love interest gave it to her as a "meaningless gift", but it secretly contains a tracking spell to ensure she is always safe. It becomes a point of conflict and undeniable attachment.',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

-- ============================================================================
-- 5. Organization Generation Skill (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'romantasy-thriller-org-gen',
  'Generate secret societies, royal houses, or dystopian corporations (English)',
  '"Organization" generation for Romantasy/Thriller',
  '## "Organization" Generation — Romantasy/Thriller\n\n...',
  '## "Faction Profile" Generation — Romantasy/Thriller\n\nRomantasy thrives on the political chess match between powerful houses or syndicates.\n\n### Field Guidelines\n\n#### Public Goal vs. Dark Secret\nCreate factions that act as major obstacles. (e.g., "The Court of Light" claims to bring holy justice, but secretly breeds assassins in the catacombs).\n\n#### Stance on the Protagonists\nThe romance is a threat to the world order. This faction might try to blackmail the love interest by threatening the protagonist, or attempt to frame the protagonist for murder to start a war.',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

-- ============================================================================
-- 6. Plot Design Skill (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'romantasy-thriller-plot-gen',
  'Plot design guidelines for blending murder mystery/conspiracy with slow-burn romance (English)',
  '"Plot Design" domain knowledge for Romantasy/Thriller',
  '## "Plot Design" Domain Knowledge — Romantasy/Thriller\n\n...',
  '## "Plot Design" Domain Knowledge — Romantasy/Thriller\n\nA successful Romantasy/Thriller plot weaves the investigation/rebellion tightly with the romantic arc. If you remove the romance, the thriller falls apart; if you remove the thriller, the romance has no stakes.\n\n### Core Plot Structure\n1. **The Dangerous Proposition**: The protagonist is forced into a deadly situation (solving a murder, infiltrating a court). They are reluctantly paired with, or pitted against, the love interest.\n2. **The Cat-and-Mouse Game**: They investigate clues (thriller) while constantly testing each other\'s loyalties and boundaries (romance). Sparking banter, forced proximity, and saving each other\'s lives build tension.\n3. **The Betrayal / The Twist**: A major thriller twist (e.g., the mentor is the killer). The protagonist discovers a secret about the love interest that shatters their trust. The "All is Lost" moment.\n4. **The Bloody Resolution**: They must choose each other over their factions. An epic, violent confrontation to solve the thriller plot, culminating in an undeniable romantic confession.\n\n### Mistakes to Avoid\n- ❌ Resolving the romance too early (Keep the "Will they/Won\'t they" burning until the climax).\n- ❌ Making the thriller plot an afterthought. The conspiracy must be genuinely puzzling and dangerous.',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

-- ============================================================================
-- 7. Entity Naming Skill (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'romantasy-thriller-entity-naming',
  'Guidance on naming factions, dark characters, and aesthetic locations (English)',
  '"Entity Naming": professional naming guidance for Romantasy/Thriller',
  '## Entity Naming — Romantasy/Thriller\n\n...',
  '## Entity Naming — Romantasy/Thriller\n\nNames should evoke mystery, lethal beauty, and power. They should sound beautiful but feel dangerous.\n\n### Character & Alias Names\nUse evocative, gothic, or sharp sounds. Often characters have a title that precedes their reputation.\n- Examples: *Rhysand, Xaden, The Wraith, The Crimson Prince, Lord Commander Thorne, Elara of the Night Court.*\n\n### Locations & Factions\nCombine a beautiful noun with a dark or sharp adjective.\n- **Factions**: *The Obsidian Syndicate, The House of Ash, The Silent Blade.*\n- **Locations**: *The Glass Citadel, The Weeping Woods, Neon District 9, The Velvet Dungeon.*\n\nAvoid generic names like "The Bad Kingdom" or overly complex gibberish like "X\'lythia". Keep it elegant, punchy, and memorable.',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

-- ============================================================================
-- 8. Narrative Skill (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'romantasy-thriller-narrative',
  'Guidelines on writing high-tension prose, witty banter, and steamy/angsty romance (English)',
  'Narrative writing guidance for Romantasy/Thriller',
  '## Narrative guidance — Romantasy/Thriller\n\n...',
  '## Narrative Writing Guidance — Romantasy/Thriller\n\nThe prose must be visceral, emotionally charged, and highly sensory.\n\n### 1. Dual Focus: Danger and Desire\nEvery scene of action should contain romantic tension; every romantic scene should be shadowed by the thriller threat. \n*Example: Instead of just describing a sword fight, describe how the protagonist feels the heat radiating from his chest as he pins her to the wall to dodge a magical blast, the smell of ozone and his dark cologne mixing as his dark eyes drop to her lips for a fraction of a second before the enemy attacks again.*\n\n### 2. High-Voltage Banter\nThe dialogue between leads must be sharp. They shouldn\'t confess love immediately. They should trade insults, make threats, and use sarcasm as a shield. \n*"You\'re bleeding on my expensive rug," he drawled, though his jaw was tight as he stepped closer.* \n*"I\'d apologize," I spat, gripping the dagger tighter, "but we both know you\'re going to have to replace it anyway when I kill you on it."*',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);

-- ============================================================================
-- 9. Novel Naming Skill (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'romantasy-thriller-novel-naming',
  'Generate titles using the popular "Noun of Noun and Noun" or evocative thriller structures (English)',
  '"Novel Naming": title generation for Romantasy/Thriller',
  '## Novel Naming — Romantasy/Thriller\n\n...',
  '## Novel Naming — Romantasy/Thriller\n\n### Popular Title Structures\n\n**Format 1: The "Noun of Noun and Noun" (Classic Romantasy)**\nAn incredibly popular trend in Western publishing (e.g., A Court of Thorns and Roses, House of Earth and Blood).\n- Structure: [A/The] [Place/Group] of [Object/Element] and [Object/Element]\n- Examples: *A Kingdom of Ash and Silk*, *The Crown of Lies and Venom*, *A City of Neon and Bone*.\n\n**Format 2: The Direct Evocative Threat**\nShort, punchy, and dangerous.\n- Examples: *Cruel Prince*, *Fourth Wing*, *The Serpent and the Wings of Night*, *Iron Flame*.\n\n### Blurb (Synopsis) Structure\nThe blurb must hook the reader with the thriller premise, introduce the dangerously attractive love interest, and pose the ultimate romantic/survival dilemma.\n"I was trained to be the Emperor\'s perfect assassin. My mission: infiltrate the rebel stronghold and kill their ruthless, shadow-wielding warlord. But when I am captured and forced to pose as his bride to survive court politics, the lines between hatred and desire begin to blur. He is a monster who destroyed my family. So why does his touch feel like salvation? If the rebels don\'t kill me, my own traitorous heart will."',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description_en = VALUES(description_en), instructions_en = VALUES(instructions_en);
