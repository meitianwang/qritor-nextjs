-- Skills for The Gaslamp Eldritch (Steampunk Horror) Novel
-- Executes 12 skills for the novel creation method

SET @method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Gaslamp Eldritch (Steampunk Horror) Novel' LIMIT 1);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES 
-- 1. Story Hook
('eld-story-hook-setting-gen', '生成「Story Hook」：为克苏鲁蒸汽朋克设计致命诡异的开局与主角的专属金手指', 'Generate Story Hook for Gaslamp Eldritch fiction',
'## 「Story Hook」生成 — 克苏鲁蒸汽朋克/维多利亚

主角通常是个普通人，因为一次“意外”被卷入这个看一眼就会发疯的世界。

### 生成指南
1. **The Occult Mystery (神秘事件)**：必须以一件充满悬疑和怪诞的小事起手。比如：主角收到了一封死去的导师寄来的信，信封里装着一只还在跳动的机械眼球。
2. **The Vile Discovery (恐怖的真相)**：随着主角探查，发现看似极其正常的资产阶级社会，底层流淌着血腥的仪式。比如某个伯爵正在用下水道的孤儿喂养一只不可名状的肉块。
3. **The Golden Cheat (系统/金手指)**：面对古神，凡人必死。所以主角必须有一个极其高级的外挂（如一个能阻断疯狂的灰雾空间、一本能吞噬怪物灵魂的黑日记），让他在直视深渊时不至于立刻融化。',
'## "Story Hook" Generation — Gaslamp Eldritch

The MC is usually an ordinary person dragged into a world where simply "looking" at the truth causes instant madness.

### Guide
1. **The Occult Mystery**: Must start with a suspenseful, grotesque anomaly. E.g., The MC receives a letter from their deceased mentor; inside the envelope is a still-beating mechanical eyeball.
2. **The Vile Discovery**: As the MC investigates, they realize the polite, aristocratic pseudo-Victorian society is built on bloody rituals. E.g., An Earl is feeding slum orphans to an indescribable mound of flesh in his basement.
3. **The Golden Cheat**: Mortals die when facing Outer Gods. The MC must possess an ultra-high-tier cheat (e.g., a mental Grey Fog sanctuary that blocks corruption, a Black Diary that devours monster souls) that prevents his brain from melting when he stares into the abyss.', @method_id, 1, 1, NOW()),

-- 2. Core Premise
('eld-core-premise-setting-gen', '生成「Core Premise」：设定主角的阶级身份与对抗疯狂的核心目标', 'Generate Core Premise for Gaslamp Eldritch',
'## 「Core Premise」生成 — 克苏鲁蒸汽朋克

主角的核心矛盾是**在极端森严的社会阶级中伪装自己，同时在暗地里猎杀怪物**。

### 生成指南
1. **MC Identity (公开身份)**：设定一个在伦敦/维多利亚社会中有合理借口到处走动的职业。如：破产的私家侦探、常春藤大学的民俗学教授、下城区的黑市医生。
2. **The Hidden Goal (隐藏目标)**：为了解除身上的诅咒（活下去），为了找到传说中成神（序列0）的魔药配方，或者为了复仇。
3. **Social Standing (社会阶级与阻力)**：主角是个穷光蛋，没钱买魔药材料，也没钱买左轮手枪。金钱的匮乏与知识的极度危险构成了双重压迫。',
'## "Core Premise" Generation — Gaslamp Eldritch

The MC''s core conflict is **disguising themselves within a rigid social hierarchy while hunting abominations in the shadows.**

### Guide
1. **MC Identity (Public Front)**: Set an occupation that provides an excuse to roam a pseudo-London society. E.g., A bankrupt private detective, a university folklore professor, an underground slum doctor.
2. **The Hidden Goal**: To lift a fatal curse on their soul (to survive), to hunt down the mythical Potion Formula to become a God (Sequence 0), or to exact vengeance on a Cult.
3. **Social Standing**: The MC is broke. They have no money for mystical potion ingredients, nor for a high-caliber revolver. Poverty and the extreme danger of occult knowledge form a dual-layered oppression.', @method_id, 1, 2, NOW()),

-- 3. System Mechanics
('eld-system-mechanics-setting-gen', '生成「System Mechanics」：设计极度硬核的魔药/序列体系与发疯的代价', 'Generate Potion Sequences and Madness Mechanics',
'## 「System Mechanics」生成 — 克苏鲁蒸汽朋克

这是此类网文的灵魂。力量不能凭空产生，力量来源于**消化怪物、遵循法则、并时刻抵抗发狂**。

### 生成指南
1. **The Power System (魔药体系/路径)**：力量被划分为不同的“途径”和“序列”。从底层（序列9）爬向高层。升级需要配置魔药，主材料必须是某种恐怖怪物的器官（如：深海千眼怪的触须）。
2. **The Mechanics of Ascension (扮演法/消化)**：喝下魔药会死。必须要靠“演戏（扮演）”欺骗魔药。比如喝了【刺客】魔药，就必须在现实中真正去杀人，体会刺客的心境，否则就会变成丧失理智的怪物。
3. **The Price (疯狂的代价)**：永远伴随的幻听、满月的狂躁、身体发生异变的肉芽。力量越强，离失控变成怪物就越近。',
'## "System Mechanics" Generation — Gaslamp Eldritch

This is the soul of the genre. Power is not free; it comes from **digesting abominations, adhering to strict occult laws, and fighting off insanity.**

### Guide
1. **The Power System (Pathways/Sequences)**: Power is divided into "Pathways" and tiered "Sequences" (e.g., Sequence 9 up to 0). Leveling up requires brewing a potion whose main ingredients are horrific monster organs (e.g., a Deep-Sea Thousand-Eyed Watcher''s optic nerve).
2. **The Mechanics of Ascension (The Acting Method)**: Drinking the potion causes lethal corruption. You must "Act" or roleplay the potion''s name to absorb it. If you drink the [Assassin] potion, you MUST assassinate people and adopt the mindset of a killer; otherwise, you will mutate into a mindless beast.
3. **The Price (Madness)**: Constant auditory hallucinations, raving lunacy during the full moon, tentacles sprouting under the skin. The stronger you get, the closer you are to losing control completely.', @method_id, 1, 3, NOW()),

-- 4. Worldbuilding
('eld-worldbuilding-setting-gen', '生成「Worldbuilding」：设计充满蒸汽、污染与正邪教派的庞大世界观', 'Generate the polluted metropolis, Orthodox Churches, and Outer Gods',
'## 「Worldbuilding」生成 — 克苏鲁蒸汽朋克

世界观是**极度工业化与古老神话**的扭曲结合。

### 生成指南
1. **The Industrial Metropolis (工业化大都市)**：天空永远是灰黄色的雾霾。巨大的蒸汽工厂无休止地运转。资产阶级在瓦斯灯下享乐，工人阶级死于霍乱或沦为邪教的祭品。
2. **Orthodoxy vs Heresy (正教与邪教)**：
   - **正教**：信仰所谓的“正神”（如黑夜女神、风暴之主），掌握着官方警察和非凡者小队。
   - **邪教**：信仰外神，致力于召唤血肉怪物毁灭城市。
3. **The Outer Gods (外神)**：一切疯狂的源头。不可直视、不可聆听、不可触碰。仅仅是了解祂们的名字，就会导致眼球爆裂。',
'## "Worldbuilding" Generation — Gaslamp Eldritch

The world is a twisted fusion of **hyper-industrialization and archaic mythos.**

### Guide
1. **The Industrial Metropolis**: The sky is a permanent smear of yellowish-grey smog. Gigantic steam factories churn endlessly. The aristocracy revels under amber gaslamps, while the working class dies of cholera or gets snatched as sacrifices for subterranean cults.
2. **Orthodoxy vs Heresy**:
   - **The Orthodox Churches**: Worship "Orthodox Deities" (e.g., Goddess of the Evernight, Lord of Storms). They control the official police and state-sanctioned occult squads.
   - **The Heretical Cults**: Worship Outer Gods, constantly attempting to summon mounds of flesh to consume the city.
3. **The Outer Gods**: The source of all madness. Unseeable, unhearable, untouchable. Simply knowing their true names can cause a mortal''s eyeballs to violently rupture.', @method_id, 1, 4, NOW()),

-- 5. Writing Style
('eld-writing-style-setting-gen', '生成「Writing Style」：指导维多利亚式翻译腔与极度反胃的肉体恐怖描写', 'Guide to Victorian prose infused with visceral body horror and dread',
'## 「Writing Style」生成 — 克苏鲁蒸汽朋克

写作风格要求在**极致的优雅礼仪**和**极致的反胃恐怖**之间反复横跳。

### 生成指南
1. **Prose Style (翻译腔/维多利亚风)**：使用克制、体面、带有一丝英伦翻译腔的语句。比如称别人为“先生/女士”，用词考究，乘坐着“有轨马车”。
2. **Sensory Deprivation & Horror (肉体恐怖描写)**：一旦进入战斗或疯狂，画风必须瞬间变成血肉苦弱。
   - *描写示范*：那原本是一位穿着燕尾服的体面男士，但他的领结下突然裂开了一道长满复眼的血色深渊，粘稠的触手硬生生撑破了剪裁得体的西装。空气里弥漫起浓烈的海水腥臭与福尔马林的味道。
3. **Combat Pacing (冷酷的战斗)**：没有大喊招式名字。战斗是无声、血腥、且充满算计的（用子弹附魔、用封印物阴人）。',
'## "Writing Style" Generation — Gaslamp Eldritch

The prose must alternate violently between **aristocratic Victorian elegance** and **nauseating body horror**.

### Guide
1. **Prose Style (Victorian Tone)**: Use restrained, polite, slightly archaic sentence structures. Refer to characters as "Gentleman/Lady." Emphasize top hats, pocket watches, and horse-drawn carriages splashing through cobblestone puddles.
2. **Body Horror & Dread**: The moment combat or madness ensues, the tone must swap to visceral gore.
   - *Example*: He had the appearance of a terribly respectable gentleman in a tailored swallowtail coat. But suddenly, a tear formed beneath his bowtie—revealing an abyss of pulsating red flesh studded with compound eyes. Viscous tentacles forced their way through his fine silk vest. The stifling smell of rancid seawater and formalin choked the alleyway.
3. **Combat Pacing**: No anime-style yelling of attack names. Combat is fast, silent, bloody, and hyper-calculated, relying heavily on cursed artifacts, enchanted silver bullets, and deceit.', @method_id, 1, 5, NOW()),

-- 6. Character
('eld-character-gen', '「角色」生成：生成官方值夜者、疯批学派学者与腐败贵族', 'Generate Orthodox Inquisitors, mad scholars, and corrupt aristocrats',
'## 「角色」生成 — 克苏鲁蒸汽朋克

这本小说里几乎没有精神正常的角色。每个人都在压抑或者放纵自己的疯狂。

### 角色设计重点
1. **Orthodox Inquisitor (官方非凡者/守夜人)**：
   - 穿着黑色风衣，拿着左轮手枪。他们是保护平民的英雄，也是最悲惨的消耗品。因为常年接触邪神物品，大多面临着精神崩溃的早夭结局。
2. **Mad Cultist / Scholar (疯癫教徒/禁忌学者)**：
   - 因为追求真理而彻底丧失人性的学者。为了研究魔药，不介意把村庄献祭。他们说话通常带有狂热的神经质逻辑。
3. **Corrupt Aristocrat (吸血贵族)**：
   - 表面上是举办华丽舞会的公爵，私底下却是食尸鬼组织的头目。他们掌控城市的经济和警察，是主角初期最难对付的庞然大物。
4. **The Protagonist (主角的一言一行)**：必须极其谨慎（老阴比），因为暴露身份就意味着被全城追杀或拉去火刑。',
'## "Character" Generation — Gaslamp Eldritch

There are virtually no mentally stable characters in this genre. Everyone is either suppressing their madness or indulging in it.

### Design Focus
1. **Orthodox Inquisitor (The Nighthawks/Hunters)**:
   - Clad in black trench coats, wielding heavy revolvers loaded with demon-hunting rounds. They are the tragic heroes protecting civilians. Due to constant exposure to cursed artifacts, their inevitable fate is an early, madness-induced death.
2. **Mad Cultist / Forbidden Scholar**:
   - Scholars who lost their humanity in pursuit of cosmic truth. They have no qualms about sacrificing an entire hamlet just to study a potion formula. They speak with an eerie, manic, yet highly logical conviction.
3. **Corrupt Aristocrat (The Leeches)**:
   - A Duke hosting opulent ballroom dances on the surface, while secretly leading an underground syndicate of Ghouls. They control the city''s economy, the constabulary, and are massive, untouchable obstacles for the early-game MC.
4. **The Protagonist**: Must be extremely cautious (a paranoid tactician). Revealing their hidden occult pathway means being hunted by the Church and burned at the stake as a heretic.', @method_id, 1, 21, NOW()),

-- 7. Faction
('eld-faction-gen', '「势力」生成：生成庞大的正统教廷、隐秘组织与极品封印物', 'Generate massive Orthodox Churches, secret societies, and cursed Sealed Artifacts',
'## 「Faction (势力/组织)」生成 — 克苏鲁蒸汽朋克

势力划分为“在阳光下的合法教会”和“在下水道里的隐秘学派”。他们之间的关系是猎犬与狐狸。

### 势力设计指南
1. **Orthodox Church (正统教会)**
   - 例：黑夜女神教会、风暴教会。
   - **特点**：拥有庞大而冷酷的戒律。他们掌握着最核心的魔药配方，并将“非官方”修炼者视为必须清洗的野生怪物。
   - **封印物 (Sealed Artifacts)**：教会地下通常锁着从“0级”到“3级”的危险神奇物品。这些物品极具威力但代价惨重（如：一把每次开枪都会让主人少活一年的左轮）。
2. **Underground Secret Society (隐秘组织/古老结社)**
   - 例：生命学派、极光会、魔女教派。
   - **特点**：崇拜邪神，以破坏城市或举行大规模献祭为乐。他们的成员通过血腥的隐秘手段交流，手段极度残忍，是主角升级路上的主要“经验包”。',
'## "Faction" Generation — Gaslamp Eldritch

Factions are divided into "Legal Churches in the sunlight" and "Hidden Societies in the sewers." The relationship is hunter and prey.

### Design Guide
1. **Orthodox Church**
   - e.g., Church of the Evernight Goddess, Church of Storms.
   - **Characteristics**: Governed by massive, cold, dogmatic laws. They hoard the core Potion Formulas and treat any "unofficial/wild" occult practitioners as abominations to be purged without trial.
   - **Sealed Artifacts**: The vaults of these churches contain extremely dangerous supernatural items ranging from Grade-0 (World-Ending) to Grade-3 (Dangerous). They grant immense power but demand horrific prices (e.g., A revolver that deducts one year of the user''s lifespan per shot).
2. **Underground Secret Society (Heretical Orders)**
   - e.g., The School of Life, The Aurora Order, The Demoness Sect.
   - **Characteristics**: Worship Outer Gods, delighting in mass sacrifices or spreading plagues. They communicate through bloody covert means. Their horrific methods make them the perfect, morally justifiable "EXP farms" for the MC to slaughter.', @method_id, 1, 41, NOW()),

-- 8. Scene
('eld-scene-gen', '「场景」生成：生成被黄雾笼罩的街区、血腥的地下仪式与哥特式修道院', 'Generate smog-choked streets, bloody underground altars, and Gothic cathedrals',
'## 「Scene (场景)」生成 — 克苏鲁蒸汽朋克

场景必须兼具**大英帝国的灰暗感**与**克苏鲁神话的不可名状的恐怖**。

### 场景设计指南
1. **Smog-filled Alleyway (黄雾笼罩的下城街区)**
   - **特色**：极端的脏乱差，煤气灯在雨夜里闪烁。阴暗的角落里躺着醉汉或被随意丢弃的无名尸体。这就是发生开膛手杰克式谋杀的绝佳场所。
2. **Opulent Aristocratic Manor (富丽堂皇的贵族庄园)**
   - **特色**：极度奢华的羊毛地毯、水晶吊灯、衣冠楚楚的名流。但在这极度奢华的表皮下，暗门后的地下室里却画满了用鲜血勾勒的邪神逆六芒星阵。
3. **Underground Crypt / Sewers (地下墓穴/污秽下水道)**
   - **特色**：这是这个城市的肠道。充满老鼠、令人绝望的黑暗和被邪神污染变异的怪物。主角在这里进行最高强度的生死猎杀。',
'## "Scene" Generation — Gaslamp Eldritch

Scenes must combine the **dreary dampness of the British Empire** with the **indescribable dread of cosmic horror.**

### Design Guide
1. **Smog-filled Alleyway (The Slums)**
   - **Characteristics**: Extreme filth, overcrowding, and yellow smog. Amber gaslamps sputter in the icy rain. The shadows conceal passed-out drunks or discarded, mutilated corpses. The absolute perfect venue for Jack the Ripper-style occult murders.
2. **Opulent Aristocratic Manor**
   - **Characteristics**: Overwhelming luxury—Persian rugs, crystal chandeliers, gentlemen in bespoke suits. But beneath this thin veneer of extreme civilization lies a hidden basement door, opening into a soundproof chamber painted entirely with bloody, inverted pentagrams honoring an Outer God.
3. **Underground Crypt / Sewers**
   - **Characteristics**: The literal intestines of the metropolis. Teeming with swarms of mutated rats, despair-inducing darkness, and abominations born from heavily polluted occult residue. This is the main dungeon where the MC engages in life-and-death hunting.', @method_id, 1, 61, NOW()),

-- 9. Plot
('eld-plot-gen', '「情节Plot」：指导如何设计绝地求生、演绎魔药与诡秘推理的情节弧线', 'Guide to design survival horror, acting the potion, and occult detective plotlines',
'## 剧情设计指南 (Plot Design) — 克苏鲁蒸汽朋克

剧情的双重驱动力是：**“生存解谜”**（谁想杀我？）和**“打怪夺宝”**（我怎么才能集齐魔药晋升？）。

### 核心情节弧线
1. **卷入迷局 (The Bloody Initiation)**：主角穿越来就背负人命官司/邪教诅咒。他必须利用前世的智慧（或外挂），在几天内查清真相并击杀追来的低级怪物。反转是：追兵竟是所谓的“教廷好人”。
2. **双面间谍体验 (The Double Life)**：主角被迫加入官方值夜者（或某个隐秘组织）。白天，他作为一名普通的警探/学者跟同事插科打诨；夜晚，他戴上面具化身为无情的刺客/占卜家，去黑市抢夺魔药材料。
3. **扮演法晋升与失控 (Digestion & Promotion)**：每次喝下高级配方都是一次生死时速的情节高潮主角不仅要面对身体要爆炸的痛苦，还要立刻卷入一场符合他职业“扮演法则”的大事件中（比如刺客必须完成一次震惊全国的暗杀）。
4. **直面深渊 (Confronting the Abyss)**：从小小的凶杀案，牵扯出震惊王国的大主教堕落事件。主角底牌尽出，利用各种封印物卡Bug，最终越级击杀了不可名状的Boss。',
'## Plot Design Guide — Gaslamp Eldritch

The plot is driven by a dual engine: **"Survival Mystery"** (Who is trying to sacrifice me?) and **"Item Hunting"** (How do I gather the horrific ingredients to brew my next Potion sequence?).

### Core Story Arcs
1. **The Bloody Initiation**: The MC is isekai''d right into a murder scene or burdened by a fatal cult curse. Using their wits (or their golden cheat), they have 72 hours to solve the mystery and kill the low-level abomination pursuing them. Twist: The killers were sent by the "righteous" Orthodox Church.
2. **The Double Life**: The MC is forced to join the official government Nighthawks (or a secret society). By day, they are a charming, polite detective bantering with colleagues. By night, they wear a brass mask, becoming a ruthless assassin/seer, haunting black markets to rob/buy forbidden potion ingredients.
3. **Digestion & Promotion**: Drinking a higher-tier potion is always a life-or-death climax. The MC not only fights the excruciating physical pain of mutation but must also hurl themselves into a massive incident tailored to their class''s "Acting Method" to digest it (e.g., an [Assassin] must pull off a nation-shocking, impossible kill).
4. **Confronting the Abyss**: A simple slum murder spirals into a conspiracy involving the corruption of a Cardinal or a Royal family member orchestrating a city-wide sacrifice. The MC goes all-in, utilizing multiple cursed Sealed Artifacts in extremely suicidal, logic-defying combinations to cross-tier execute the Eldritch boss.', @method_id, 1, 100, NOW()),

-- 10. Narrative
('eld-narrative', '「叙事与描写 Narrative」：指导推理悬疑的推进感与不可名状克系恐怖的融合', 'Guide to blending detective suspense with cosmic incomprehensible horror',
'## 叙事与描写技巧 (Narrative) — 克苏鲁蒸汽朋克

要写出**“理智值在狂掉，但我必须保持优雅”**的感觉。

### 1. 理智值狂掉的感官冲击 (Crashing Sanity)
- 不能具象描写古神长啥样，要着重写主角的生理反应和精神错乱。
- *描写示范*：那件斗篷下的东西发出了一声呢喃。就在那一瞬间，主角的脑浆仿佛沸腾了起来，血管暴突，双眼里流出黑色的脓液。他听见了无数个婴儿的尖叫声，仿佛整个世界都在一块冰冷腐恶的玻璃里被碾碎。

### 2. 左轮与非凡能力的结合 (Gritty Combat Aesthetics)
- 战斗描写不要像玄幻大招乱炸。要有维多利亚时代的冷酷感与硝烟味。
- *描写示范*：他没有丝毫犹豫，将银制的猎魔子弹推入左轮弹巢。咔哒。在怪物充满触手的头颅扑来的瞬间，他优雅地压低帽檐，侧身开火。湛蓝色的灵性光辉贯穿了走廊，伴随火药刺鼻的硫磺味。

### 3. 克制与绅士风度的反差 (The Gentleman''s Façade)
- *描写示范*：他用沾满黑血的手帕擦了擦嘴角的肉渣，随后将手帕随手丢进燃烧的壁炉里。整理好西装的银色纽扣，他推开门，对门外吓傻的伯爵露出了标准而斯文的微笑：“晚上好，先生，清理工作已经完成了。”',
'## Narrative and Writing Techniques — Gaslamp Eldritch

The goal is to capture the vibe of **"My Sanity points are hemorrhaging fast, but I must remain an elegant gentleman."**

### 1. The Sensory Impact of Crashing Sanity
- Do not physically describe the geometry of an Outer God. Describe the MC''s horrific physiological reaction and psychological shattering.
- *Example*: Whatever was beneath that cloak hummed a single note. In that millisecond, the MC''s cerebrospinal fluid felt like boiling acid. His veins bulged, and black pus seeped from his tear ducts. He heard the screaming of ten thousand dying infants, feeling as if reality itself was being ground to dust against a cold, rotting pane of glass.

### 2. Gritty Combat Aesthetics (Revolvers & Occultism)
- Combat shouldn''t look like flashy anime spells. It must carry the cold, sulfurous grit of the Victorian era.
- *Example*: He didn''t hesitate, slotting the silver demon-hunting rounds into the heavy revolver''s cylinder. Click. As the abomination''s tentacled mass lunged, he elegantly tipped the brim of his silk hat, pivoted on his heel, and fired. A azure blast of spiritual energy pierced the corridor, leaving behind the acrid stench of sulfur and burning flesh.

### 3. The Gentleman''s Façade
- *Example*: He used a black-blood-soaked handkerchief to wipe the gore from the corner of his mouth, before casually tossing it into the blazing hearth. Adjusting his vest''s silver buttons, he opened the oak door, offering a perfectly polite, disarming smile to the terrified Earl waiting outside. *"Good evening, sir. The pest control has been concluded."*', @method_id, 1, 101, NOW()),

-- 11. Novel Naming
('eld-novel-naming', '「书名与大纲生成」：指导生成神秘高冷风的书名与解谜打怪升级流大纲', 'Guide to generating cryptic, elegant titles and mystery-progression outlines',
'## 书名与大纲生成指南 — 克苏鲁蒸汽朋克

这类书名与传统的“我是世界第一”大不相同。必须显得极其隐晦、神秘、甚至是“反高潮”的文学化命名。

### 1. Title Generation (书名命名偏好)
- **学术与神秘主宰风**：`Lord of the [Abstract Concept]` 或 `The [Occult/Class] of [Something Dark]`。
  - *案例*：Lord of the Mysteries (诡秘之主), The Embers of God (神明余烬), Plague Doctor in a Steampunk World, The Midnight Watcher (午夜守门人)。
- **不可名状与日记风**：
  - *案例*：Chronicles of the Crimson Moon (红月启示录), Gunpowder and Tentacles (火药与触手), Madness Pathway (疯狂途径)。

### 2. Synopsis Generation (三段式大纲结构)
- **第一段：大雾弥漫的城市背景 (The City of Smog)**：展现维多利亚时代的繁华与肮脏并存，抛出这个世界存在超自然污染的残酷现实。
- **第二段：主角的穿越与绝境 (The Anomaly)**：主角醒来后发现自己处在一场神秘学谋杀的中心，被迫接手了一个死亡率高达90%的神秘职业序列，并且他的每一次晋升都在悬崖边跳舞。
- **第三段：狂妄的上升宣言 (The Ascent to Madness)**：为了找寻回家的路（或终极真相），主角选择戴上礼帽、拿起手杖与左轮，在邪神环伺的深渊中，踩着一具具不可名状的尸体，登上成神的王座。充满了悲壮与黑暗的美感。',
'## Title & Synopsis Generation Guide — Gaslamp Eldritch

Titles must avoid flashy Shonen vibes. They must feel cryptic, elegant, deeply mysterious, and almost "anti-climactic" in a literary way.

### 1. Title Generation Preferences
- **Academic & Mystical Dominance**: `Lord of the [Abstract Concept]` or `The [Occult Class/Object] of [Something Dark]`.
  - *Examples*: Lord of the Mysteries, The Embers of God, Plague Doctor in a Steampunk World, The Midnight Watcher.
- **Eldritch & Journal Style**: 
  - *Examples*: Chronicles of the Crimson Moon, Gunpowder and Tentacles, The Madness Pathway.

### 2. Synopsis Generation (Three-Act Structure)
- **Act 1: The City of Smog**: Establish the coexistence of Victorian prosperity and extreme filth, laying out the cruel reality that the supernatural exists—and it is utterly horrifying and polluting.
- **Act 2: The Anomaly & The Curse**: The MC wakes up in the middle of a gruesome occult murder scene, forced to consume a potion for a Supernatural Sequence with a 90% fatality rate. Every step of their leveling journey is a dance on the edge of the abyss.
- **Act 3: The Ascent to Madness**: To uncover the ultimate truth (or find a way home), the MC chooses to don a silk top hat, pick up an ebony cane and a heavy revolver, and step into the abyss surrounded by Outer Gods. By climbing a mountain of indescribable corpses, they will ascend to the crimson throne of Godhood. A finale promising morbid, tragic, and bloody beauty.', @method_id, 1, 102, NOW()),

-- 12. Entity Naming
('eld-entity-naming', '「名词生成指南」：指导生成序列魔药、封印物及古神的哥特式命名', 'Guide to generating gothic names for Potion Sequences, Sealed Artifacts, and Outer Gods',
'## 专有名词生成指南 (Entity Naming) — 克苏鲁蒸汽朋克

名词是塑造“克味儿（Eldritch flavor）”的最强武器。名词必须兼具**大英时代的阶级感**和**毛骨悚然的病态美**。

### 1. 魔药与序列途径 (Pathways & Sequences)
- 不要叫“一阶魔法师”。要用职业、诡异状态或塔罗牌概念命名。
- *底层职业（烟火气，接地气）*：序列9：Sleepless (不眠者), Gravedigger (掘墓人), Mute (失语者)。
- *中层职业（神秘学意味）*：序列5：Marionettist (秘偶大师), Plaguemaker (瘟疫学者)。
- *高层/神性（不可直视）*：序列0：The Visionary (空想家), The Tyrant (暴君), The Black Emperor (黑皇帝)。

### 2. 封印物/诅咒物 (Sealed Artifacts)
- 名字必须带着极其深刻的故事感或物体的病态特征。通常采用官方的代号体。
- *案例*：Artifact 0-08: The Quill of Alzuhod (阿兹霍克之笔); Grade 1: The Bloody Monocle (泣血单片眼镜); The Flesh-Wearing Music Box (人皮八音盒)。

### 3. 古神与不可名状的存在 (The Outer Gods)
- 要长，要包含宇宙感、星辰感或者极其扭曲的生殖/血肉崇拜。
- *案例*：The Mother of Depravity (堕落母神), The True Creator (真实造物主), The Inevitable Ring (宿命之环), The Blind Idiot God (盲目痴愚之神)。

**AI 动作要求**：在生成途径和封印物时，必须考虑**【等价交换法则】**。每个酷炫的名字背后都一定隐含着让你痛不欲生的副作用。例如：戴上“泣血单片眼镜”能看穿幻象，代价是每秒钟扣除理智，三分钟不摘就会让你爱上吞食碎玻璃。',
'## Entity Naming Guide — Gaslamp Eldritch

Nomenclature is the strongest weapon for building "Eldritch flavor." Nouns must balance **British Empire aristocratic classism** with **hair-raising morbid beauty.**

### 1. Pathways & Sequences (The Classes)
- Do NOT use "Level 1 Mage." Use concepts of Victorian professions, eerie mental states, or Tarot motifs.
- *Low-Tier (Grounded, gritty)*: Sequence 9: Sleepless, Gravedigger, Mute/Silence.
- *Mid-Tier (Occult mastery)*: Sequence 5: Marionettist, Plaguemaker, Crimson Scholar.
- *High-Tier/Divine (Utter dominance)*: Sequence 0: The Visionary, The Tyrant, The Black Emperor.

### 2. Sealed/Cursed Artifacts
- Names must carry a deep sense of cursed history or morbid physical traits. Often prefixed with official government classification codes.
- *Examples*: Artifact 0-08: The Quill of Alzuhod; Grade 1 Artifact: The Bleeding Monocle; The Flesh-Wearing Music Box.

### 3. The Outer Gods (Irregular Beings)
- Names should be long, incorporating cosmic vibes, stellar dread, or twisted themes of fertility/flesh worship.
- *Examples*: The Mother of Depravity, The True Creator, The Ring of Inevitability, The Blind Idiot God.

**AI Action Requirement**: When generating Pathways and Artifacts, you MUST enforce the **[Law of Equivalent Exchange]**. Every extremely cool name must implicitly hide an agonizing side effect. For example: Wearing the "Bleeding Monocle" lets you see through all illusions—but the price is draining your sanity every second. If you don''t take it off in 3 minutes, you will fall madly in love with chewing shattered glass.', @method_id, 1, 103, NOW())
ON DUPLICATE KEY UPDATE description=VALUES(description), instructions=VALUES(instructions);
