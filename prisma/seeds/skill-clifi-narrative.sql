-- Cli-Fi / Climate Fiction Novel「叙事与写作手法 Narrative」生成技能
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'clifi-narrative',
  '层级3(Domain Knowledge) - 「叙事与描写 Narrative」：指导如何描写气候天灾带来的绝望感、拾荒改装的机械美学',
  'Layer 3 (Domain Knowledge) - "Narrative": Guide on how to narrate the despair of climate catastrophes, sensory deprivation, and wasteland scavenging aesthetics',
  '## 叙事与描写技巧 (Narrative) — 气候幻想 (Cli-Fi/Wasteland)

在废土和生存类小说中，世界本身就是一个充满压迫感的无声配角。描写需要带有强烈的**触觉痛感**和**拼凑的机械（Jury-Rigging）美感**。

### 1. 将"气候与天灾"实体化描写

不要干巴巴地写"天气很热"或"风很大"。要把气候写成一头吞噬一切的野兽。
- **沙暴的描写**：*地平线上涌起一面连接天地的黑色高墙，狂风中夹杂着玻璃化的高温细沙。它不像自然现象，更像是一台要把整个世界磨成粉末的巨型绞肉机。空气中弥漫着金属生锈和极度干燥的焦土味。*
- **极寒的描写**：*肺部的每一次膨胀都伴随着吞咽碎玻璃般的刺痛。吐出的白气在离开嘴唇的瞬间就结成了冰晶落在地上，干脆地发出‘咔哒咔哒''的声音。*

### 2. 拾荒与改装的废土美学 (Jury-Rigging Aesthetics)

物资极度匮乏时，每一次成功的废物利用都能给读者带来强烈的"生存满足感"（类似于鲁滨逊漂流记的种田爽感）。
- 详细写出拼凑感：*他用胶带和破洞的凯夫拉纤维修补好了过滤芯片，将两根沾满机油的导管插进了一个旧可乐瓶里。随着粗糙的齿轮咬合发出刺耳的摩擦声，第一滴带着铁锈味的浑浊液体缓缓滴出。对他们来说，这简直是世界上最甜美的甘露。*
- 主角的每次动作都体现出物资的稀缺：主角连开枪都很抠门，会在战斗后仔细地从尸体上抠出还能用的变形弹头。

### 3. 反转与剥夺感 (Sensory & Resource Deprivation)

小说的高潮往往在主角找到所谓"绿洲"或者打败了寡头之后。需要用残酷的笔触打破美好的幻象。
- **阶级对比最震撼的做法**：当主角历经九死一生、喝着变异怪兽血活脱骨相闯入寡头的"温室"时。*他看着喷泉里涌出清澈、冰冷的水源，而那个肥胖的主管正皱着眉头，抱怨着用纯净水洗过的丝绸睡衣不够柔软。主角的手握紧了由水管改装的霰弹枪。*
- 强烈的愤怒与宣泄：这不是为了拯救世界，而是纯粹为了撕碎这种荒谬的不公。

**AI 生成要求**：在生成正文内容时，必须加入极度密集的【环境感官词汇】（如：干裂、窒息、铁锈味、酸性），并详细描写某个核心的【求生物品消耗细节】（如滤纸变黑、电池归零）。这是该类型写实的生命线。',
  '## Narrative and Writing Techniques — Cli-Fi / Climate Fiction

In wasteland and survival novels, the world itself is a silent, overwhelmingly oppressive supporting character. The prose needs a strong **tactile sense of pain** and the **aesthetic of jury-rigged machinery**.

### 1. Personifying the Climate Catastrophe

Do not simply write "it was very hot" or "the wind was strong." Write the climate as an all-consuming beast.
- **Describing the Sandstorm**: *A solid black wall connecting earth and sky surged across the horizon, carrying vitrified, super-heated glass sand. It didn''t look like a natural phenomenon; it looked like a colossal meat grinder attempting to pulverize the entire world. The air smelled acutely of rusted metal and violently parched earth.*
- **Describing the Deep Freeze**: *Every expansion of the lungs brought the excruciating pain of swallowing shattered glass. The white breath leaving his lips crystallized into ice chunks the moment it hit the -80C air, falling to the snow with a dry, hollow ‘clack-clack'' sound.*

### 2. The Aesthetics of Scavenging & Jury-Rigging

When resources are critically low, every successful act of repurposing trash provides the reader with immense "survival satisfaction."
- Detail the patchwork mechanics: *He patched the cracked filtration chip with duct tape and torn Kevlar, jamming two oil-stained tubes into an old Coca-Cola bottle. As the crude gears caught with a screech of agonizing friction, the first drop of murky, rust-tasting liquid slowly dripped out. To them, it was the sweetest nectar on Earth.*
- Conserving resources must reflect in action: The protagonist is stingy even when firing a gun, stopping after the fight to dig warped, usable lead bullets out of a corpse.

### 3. Contrast and Dystopian Deprivation

The climax often occurs when the protagonist finds the "Oasis" or breaches the Oligarch''s dome. Use brutal exposition to shatter the illusion of fairness.
- **The Ultimate Class Contrast Impact**: The protagonist, having survived unimaginable horrors, emaciated and surviving by drinking mutant beast blood, breaches the Oligarch''s "Eco-Dome." *He stared at the fountain casually spraying crystal-clear, ice-cold water into the air, while the obese aristocrat frowned, complaining that the silk robes washed in pure water felt a bit too stiff this morning. The protagonist''s grip tightened on his crude pipe-shotgun.*
- Intense anger and catharsis: It is not about saving the world; it is pure, justified rage aimed at tearing apart this absurd injustice.

**AI Generation Requirements**: When generating prose, you MUST densely pack it with [Environmental Sensory Words] (e.g., cracked, suffocating, metallic tang, acidic) and specifically describe a detail regarding the [Depletion of a Survival Item] (e.g., a filter turning black, a battery gauge hitting flashing red). This absolute realism is the lifeline of the genre.',
  (SELECT id FROM novel_creation_method WHERE name = 'Cli-Fi / Climate Fiction Novel' LIMIT 1),
  1,
  101,
  NOW()
)
ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
