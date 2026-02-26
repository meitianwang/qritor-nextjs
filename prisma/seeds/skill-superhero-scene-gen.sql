-- Superhero / Cape Fiction Novel「Scene」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-superhero-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'superhero-scene-gen',
  '「场景」生成：为超能英雄小说生成英雄高塔、黑市贫民窟与被英雄暴战摧毁的城市废墟',
  '"Scene" generation: generate hero towers, black market slums, and city ruins destroyed by hero battles for Superhero fiction',
  '## 「Scene (场景)」生成 — 超能英雄/反传统英雄小说

赛博朋克与超能社会相结合的都市，是此类小说的经典舞台。场景设计要强烈体现出**上层精英社会的光鲜**与**底层社会的破落无序**之间的空间割裂感。

### 场景的设计重点 (Visual Duality & Function)

#### Location Type (场景类型)
- **Corporate HQ/Hero Tower (巨企总部/英雄之塔)**：刺破云霄的玻璃大厦，不仅是办公场所，更是全城朝圣的图腾。极度奢华，安保森严。
- **Destroyed Sector/Slums (被毁区域/贫民窟)**：因为S级英雄为了摆拍、随手乱扔汽车而砸毁的街区。由于公会不会赔偿，这里变成了充满辐射和怨念的法外之地。
- **Underground Black Market (地下黑市)**：隐藏在废弃地铁站或下水道体系中。主角获取情报、贩卖从英雄尸体上剥下来的战利品的地方。
- **Dungeon/Gate Instance (地下城/传送门空间)**：如果是带系统面板的设定，这里是专门刷怪升级的隔离副本。

#### Appearance/Atmosphere (视觉与氛围体验)
- 强调阶级反差。
- 在描述英雄总部时，突出**"无死角的亮光与冰冷的人造美感"**（全息投影仪上24小时播放着英雄的微笑广告）。
- 在描述贫民窟时，突出**"霓虹灯管的红蓝闪烁与潮湿、血腥的气味"**。主角在这种阴暗处狩猎高高在上的超能者，视觉冲击极强。

#### Function & Hazards (功能与危险)
- **Function/Significance**：这个地方对主角有什么用？（如：是唯一能绕过"城市天网AI"监控的安全屋）。
- **Hazards/Security**：危险不是来自传统的怪物，而是带有视网膜扫描的清道夫无人机、英雄公会的私兵，或者是因超能药剂变异的瘾君子。

#### Current State (动态状态反映战损)
- 超能战斗极具破坏力。
- 状态经常是动态的：昨天还是繁华的商业街，今天就成了"因为排名第三的火系英雄发脾气，而被烧出玻璃结晶的巨坑"。这种描写极大地衬托了英雄的傲慢与力量的危险。',
  '## "Scene" Generation — Superhero / Cape Fiction

A city combining cyberpunk features with a superhuman society is the classic stage for this genre. Scene design must strongly project the spatial divide between the **glamorous upper-class elite society** and the **decaying, chaotic bottom-tier slums**.

### Scene Design Focus

#### Location Type
- **Corporate HQ/Hero Tower**: Glass skyscrapers piercing the clouds. Not just a workplace, but a totem of pilgrimage for the entire city. Excessively luxurious and heavily guarded.
- **Destroyed Sector/Slums**: Blocks destroyed because an S-Rank hero threw a bus just to strike a pose. Since the Guild refuses to pay compensation, it has devolved into a lawless zone filled with resentment and residual energy radiation.
- **Underground Black Market**: Hidden within abandoned subway systems or sewers. The place where the protagonist gathers intel and fences loot stripped from the corpses of dead heroes.
- **Dungeon/Gate Instance**: If operating under a system/LitRPG premise, these are isolated instance zones specifically for grinding monsters and leveling up.

#### Appearance/Atmosphere
- Emphasize class contrast.
- When describing Hero HQ, highlight the **"shadowless brilliant lights and cold artificial beauty"** (holographic projectors playing glowing smiles of heroes 24/7).
- When describing the slums, highlight the **"flickering red and blue neon lights mixed with the smell of dampness and blood."** The protagonist hunting high-and-mighty superhumans in these dark corners provides extreme visual impact.

#### Function & Hazards
- **Function/Significance**: What use is this place to the protagonist? (e.g., It is the only safehouse whose electrical grid bypasses the "City Skynet AI" surveillance).
- **Hazards/Security**: The danger doesn''t just come from traditional monsters. It comes from retina-scanning scavenger drones, the Hero Guild''s private militarized security, or junkies mutated by rejected superpower serums.

#### Current State (Reflecting Battle Damage)
- Superhuman combat is extremely destructive.
- The state is often dynamic: A bustling commercial street yesterday becomes "A massive glassy crater incinerated because the Rank-3 Fire Hero had a temper tantrum." This sort of description massively underscores the arrogance of heroes and the sheer danger of their powers.',
  (SELECT id FROM novel_creation_method WHERE name = 'Superhero / Cape Fiction Novel' LIMIT 1),
  1,
  61,
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
