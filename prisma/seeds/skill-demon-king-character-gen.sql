-- The Demon King / Monster Overlord Novel「Character」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-demon-king-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'demon-king-character-gen',
  '「角色」生成：为魔王养成小说生成魔王班底、忠诚眷属、敌人勇者及各阵营角色',
  '"Character" generation: generate the Demon King team, loyal familiars, hero enemies, and characters across factions for the Demon King novel',
  '## 「角色」生成 — 魔王养成/被迫反派小说

魔王养成题材的角色体系核心在于"极端忠诚的己方"与"极度伪善/傲慢的敌方"之间的碰撞。不仅要塑造作为领袖的主角，更要塑造撑起魔王城的魔将班底，以及作为经验包和垫脚石的人类勇者体系。

---

### 角色的定位与功能 (Role)

#### 1. The Demon King (MC) - 主角
作为王座上的存在，不需要时刻下场肉搏。主角的决策、大局观、冷酷与罕见的温柔是角色魅力所在。生成时结合 Core Premise 设定其人性与魔性的比例。

#### 2. Loyal Minion/General - 忠诚魔将
魔王军的骨干。他们对魔王具备绝对（甚至病态）的忠诚。
设定重点：忠诚的【原因】不同。有人因为恐惧，有人因为被魔王拯救过，有人信仰纯粹的力量。必须给这些魔将分配明确的主管领域（如：不死军团统帅、后勤大总管、暗杀首领）。

#### 3. The Chosen Hero - 天选勇者
主角的宿敌或经验包。必须设计得让人类觉得代表正义，但读者一眼就能看穿他们的愚蠢、高傲或是极端的偏执。他们的战败将是小说的高潮之一。

#### 4. Human King/Politician - 贪婪的人类贵族/教皇
往往是导致魔物遭到屠杀的罪魁祸首。比起勇者的单纯狂热，他们更狡猾、自私，擅长利用人性的弱点，最终在魔王的绝对力量面前丑态百出。

#### 5. Traitor/Spy - 叛徒/间谍
人类派来的卧底，或者反人类社会的背叛者。卧底在魔王城通常会遭遇"被魔王军的福利/包容而感化"的反差情节。

#### 6. Neutral Merchant/Ally - 中立者/黑暗商人
不介意与魔王交易的人。为领地建设提供外部通道或情报资源。

#### 7. Captive/Subjugated - 被俘虏/收编者
例如被魔王活捉的高洁圣女、敌国公主。描写她们三观崩溃并逐渐服从（甚至主动加入）的过程是极其经典的桥段。

---

### 极具反差的动机与设定 (Core Motivation & View of Protag)

魔王军的魅力在于**多样性**和**反差感**。
- 【狂热迪化流（脑补）】：主角其实内心慌得一批（只是个转生的高中生），但手下的恶魔老将总能把他的随意举动脑补成"深不可测的惊世谋略"。这种视角错位产生的幽默感极具商业价值。
- 【绝对追随】：被世界抛弃的怪物，在主角这里找到了归宿。这是极具感染力的羁绊。描写 View of the Protagonist 时，强调这种将魔王奉为"在世真神"的狂热度。

### Current Status / Event

动态字段在这一题材中非常直观：
- 对于己方：正在督建第X号分城。
- 对于敌方：正在集结第N次圣战远征军（并且浑然不知自己即将团灭）。',
  '## "Character" Generation — The Demon King / Monster Overlord Novel

The core character dynamics in the Demon King building genre revolve around the clash between "fanatically loyal allies" and "extremely hypocritical/arrogant enemies." It is not just about the protagonist on the throne; it''s about shaping the entire roster of Demon Generals that hold up the kingdom, alongside the human hero system designed to serve as stepping stones.

---

### Character Roles and Narrative Functions

#### 1. The Demon King (MC) - The Protagonist
As the entity on the throne, they shouldn''t always be on the front lines fighting hand-to-hand. Their decision-making, grand strategy, coldness, and rare moments of leniency form their charm. During generation, match their ratio of humanity vs. monster instincts with the Core Premise.

#### 2. Loyal Minion/General - The Loyal Demon General
The backbone of the Demon Army. They possess absolute (even pathological) loyalty to the Demon King.
Design focus: The *reasons* for their loyalty must differ. Some follow out of pure fear, some because the Demon King saved them from extinction, some worship pure power. Assign them clear jurisdictions (e.g., Undead Legion Commander, Chief of Logistics, Head of Assassination).

#### 3. The Chosen Hero - The Hero
The protagonist''s nemesis or premium stepping stone. They must look like perfectly righteous figures to the human populace, but readers should easily see through their stupidity, arrogance, or extreme fanaticism. Their eventual psychological and physical defeat is a peak payoff moment.

#### 4. Human King/Politician/Pope
The true culprits behind the oppression of monsters. Compared to the naive fanaticism of Heroes, they are cunning, selfish, and skilled at exploiting human weakness. Eventually, they will make total fools of themselves in the face of the Demon King''s absolute power.

#### 5. Traitor/Spy
Human spies sent to infiltrate the castle, or human outcasts betraying their kind. Spies infiltrating the Demon Lord Castle often experience the classic trope of being "seduced and converted by the excellent welfare/inclusivity of the Demon Lord''s society."

#### 6. Neutral Merchant/Ally
Those who don''t mind trading with the devil. Provide external trade routes and intelligence for the kingdom building efforts.

#### 7. Captive/Subjugated
For example, a high and mighty Holy Maiden or enemy Princess captured alive. Depicting their worldview crumbling as they gradually submit (or even actively join) the Demon King is an extremely classic and satisfying trope.

---

### Contrasting Motivations & View of the Protagonist

The charm of the Demon Army lies in **diversity** and **contrast**.
- **The "Sasuga Ainz-sama" (Misunderstanding) Effect**: Internally, the protagonist might be panicking (just a normal reincarnated guy), but the veteran demons constantly over-interpret his casual remarks as "unfathomable, world-shaking strategies." This comedic misalignment is highly commercial and engaging.
- **Absolute Devotion**: Monsters abandoned by the world finally find a home under the protagonist. This forms a profoundly infectious bond. When filling out "View of the Protagonist," heavily emphasize this fanatical worship, treating the Demon King as the "One True God/Savior."

### Current Status / Event

Dynamic fields in this genre are very straightforward:
- For Allies: "Currently overseeing the construction of Outer City Sector 4."
- For Enemies: "Currently rallying the 5th Holy Crusade (completely unaware they are marching to their deaths)."',
  (SELECT id FROM novel_creation_method WHERE name = 'The Demon King / Monster Overlord Novel' LIMIT 1),
  1,
  21,
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
