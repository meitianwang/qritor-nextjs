-- The Demon King / Monster Overlord Novel「叙事写作」技能
-- 执行方式: mysql -u <user> -p <database> < skill-demon-king-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'demon-king-narrative',
  '「叙事写作」领域知识：为魔王养成小说提供战争场面、反派帝王气场与微观基建的笔法指导（无输出格式）',
  '"Narrative Writing" domain knowledge: provide techniques for war scenes, the villainous emperor''s aura, and micro-building details (no output format requirement)',
  '## 「叙事写作」领域知识 — 魔王养成/被迫反派小说

魔王题材对叙事张力的要求极高。你的笔触必须在**【种田基建的踏实感】**与**【千万魔军压境的压迫感】**之间无缝切换。

### 1. "王座之上"的气场塑造 (The Emperor''s Aura)

写魔王主角的日常互动，要体现出"上位者的威压"和"掌控全局的从容"。
- **不要啰嗦**：魔王下达命令应该简短、明确，不容置疑。
- **肢体语言的权力感**：用细微动作传递压迫感（如：手指轻敲王座的扶手发出的声音让整个大殿的魔将连呼吸都屏住；俯视着在地上颤抖的俘虏）。
- **极度的理智与护短**："我的部下，只能死在我的命令里，轮不到你这伪善的勇者来审判。"用这种护短和强悍来换取手下（以及读者）的死心塌地。

### 2. 种田基建的细节质感 (The Texture of Kingdom Building)

读者喜欢看基建，是因为喜欢"从无到有、变废为宝"的踏实感。
- **量词与升级感**：一定要写出数量和材质的变化。不要只写"城墙建好了"，要写"用五千具食人魔骸骨与深渊黑泥浇筑的四层城墙，足以抵挡六阶光明魔法的轰炸"。
- **物流与流水线**：展现出魔王城的运转不是靠魔法变出来的，而是靠下级魔物（如哥布林矿工）夜以继日的开采。将现代工业管理的冰冷与奇幻世界的魔法结合，会产生奇妙的化学反应。
- **臣服者的震惊**：描写刚被抓回来的高傲人类俘虏，看到魔王城里比人类圣都还要干净的街道、运转精密的魔法水渠、充足的粮食时，他们三观碎裂的反应。

### 3. 多视角穿插渲染绝望 (Alternating POV for Despair)

描写战役时，直接写主角杀敌不如写**敌人的视角崩塌**。
- **战前视角**：人类主教正在优雅地喝着红酒，告诉骑士长这次讨伐只是例行公事，魔族的粗鄙木堡一触即溃。
- **战中视角**：红酒杯突然震颤。主教惊恐地看着地平线上涌起的根本不是普通亡灵，而是装备了魔导大炮的钢铁骷髅军团。骑士长甚至连拔剑的机会都没有就被一发轰碎。
- **反差的快感**：花大量笔墨铺垫敌人的"自信满满的底牌"，然后被魔王军用绝对的暴力瞬间碾碎。这种毫无悬念的"降维打击"，正是魔王文的核心文法。

### 4. 暴力美学与冷酷的仁慈 (Violence & Cold Mercy)

- 在表现暴力时，多使用重工业感和压服感的词汇：碾压、撕裂、吞噬、同化、寂灭。
- 展现主角的冷酷时，不用每一场都大开杀戒。最可怕的魔王是有规矩的魔王。"只诛杀拿着武器的抵抗者，但反抗者的一族将被贬为永世苦工。" 这种恩威并施的帝王心态更能让读者感到主角成长为了一个合格的"暴君"。',
  '## "Narrative Writing" Domain Knowledge — The Demon King / Monster Overlord Novel

The Demon King genre demands extremely high narrative tension. Your prose must seamlessly switch between the **"grounded satisfaction of kingdom building"** and the **"suffocating oppression of tens of thousands of demons marching."**

### 1. Shaping the "Emperor''s Aura" on the Throne

When writing the Demon King protagonist''s interactions, you must embody the "dominance of a high-ruler" and the "calm of absolute control."
- **No verbose monologues**: A Demon King''s orders should be short, precise, and unquestionable.
- **Body language of power**: Use subtle actions to convey suppression (e.g., "The tapping of his finger against the obsidian armrest made every Demon General in the hall hold their breath"; looking down on shivering captives from a height).
- **Extreme rationality mixed with intense protectiveness**: "My subordinates will only die by my command. It is not up to a hypocritical Hero like you to judge them." Use this ruthless protectiveness to earn the absolute devotion of their followers (and the readers).

### 2. The Texture of Kingdom Building Details

Readers love kingdom building because they enjoy the grounded satisfaction of "creating something from nothing and turning trash into treasure."
- **Quantifiers and upgrade transitions**: You *must* write the changes in numbers and materials. Don''t just write "The walls were built." Write, "The four-tier rampart, forged from the bones of five thousand ogres and sealed with abyssal black-mud, is now capable of withstanding a Rank-6 Light Magic bombardment."
- **Logistics and assembly lines**: Show that the Demon Lord Castle doesn''t just run on generic magic appearing out of thin air, but through the day-and-night labor of lower-tier monsters (like goblin miners). Combining the coldness of modern industrial management with high fantasy magic creates brilliant chemistry.
- **The shock of the subjugated**: Write the reaction of a proud, recently captured human noble seeing that the Demon City has cleaner streets, better functioning mana-aqueducts, and far more abundant food than the Human Holy Capital. Their worldview shattering is a key payoff.

### 3. Alternating POVs for Maximum Despair

When writing battles, directly writing the protagonist killing enemies is less satisfying than **writing the utter collapse of the enemy''s perspective.**
- **Pre-battle POV**: The Human Bishop is elegantly sipping red wine, telling the Knight Commander that this crusade is just a routine clean-up, and the demons'' crude wooden forts will collapse on impact.
- **Mid-battle POV**: The wine glass suddenly vibrates. The Bishop watches in horror as the horizon is swallowed not by regular undead, but by a legion of Steel Skeletons armed with Mana Artillery. The Knight Commander doesn''t even get the chance to draw his sword before being vaporized.
- **The joy of contrast**: Spend heavy ink setting up the enemy''s "confident trump card," and then have it instantly, violently crushed by the Demon Army. This completely merciless, "unidimensional steamrolling" is the core grammar of the Overlord genre.

### 4. Aesthetics of Violence and Cold Mercy

- When depicting violence, use words that imply heavy industry, overwhelming mass, and suppression: steamroll, obliterate, devour, assimilate, extinguish.
- To demonstrate the protagonist''s ruthlessness, you don''t need to slaughter everyone every time. The most terrifying Demon King is one with absolute rules. "Kill only those who hold weapons. But the clans of the resisters will be condemned to eternal hard labor." This imperial balance of grace and terror makes the reader feel the protagonist has truly grown into a competent "Tyrant."',
  (SELECT id FROM novel_creation_method WHERE name = 'The Demon King / Monster Overlord Novel' LIMIT 1),
  1,
  102,
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
