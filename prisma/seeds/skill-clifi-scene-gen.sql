-- Cli-Fi / Climate Fiction Novel「Scene」生成技能
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'clifi-scene-gen',
  '「场景」生成：为气候幻想小说生成沉没摩天大楼、无尽盐漠与温室水培农场',
  '"Scene" generation: generate sunken skyscrapers, endless salt deserts, and greenhouse hydroponic farms for Cli-Fi fiction',
  '## 「Scene (场景)」生成 — 气候幻想 (Cli-Fi)

场景设计本身就是主角最大的敌人。旧世界文明的残骸（高架桥、大本钟、自由女神像）与当前极端天气的结合，构成了最独特的美学。

### 场景的设计重点 (Visual Ecology & Danger)

#### Location Type (场景类型)
- **Old-World Ruin (旧时代废墟)**：被黄沙彻底掩埋、只露出顶楼的百货商场；或者沉在五十米深水下的核电站。这是拾荒者们以命相搏的淘宝地。
- **Fortified Settlement/Oasis (壁垒绿洲)**：建立在废弃钻井平台上的城市，周围布满带电的铁网和狙击塔，用来保护中心那一口仅存的淡水井。
- **The Open Wasteland (开放废土)**：分为无尽的焦盐沙漠（曾经是海洋），或者是被十级狂风撕裂的碎冰平原。极度空旷且致命。
- **Elite Eco-Dome/Bunker (精英温室/避难所)**：极度奢华的科技堡垒。里面有蓝天投影、人造微风、以及真正的绿色植物。与外界的地狱形成刺眼的阶级对比。

#### Atmosphere/Sensory Details (感官体验与光影)
- **如果场景是水下**：强调幽闭恐惧症、水压的挤压感、探照灯光柱中漂浮的水母和旧时代的生锈汽车。
- **如果是暴晒废土**：热浪扭曲了地平线，一切都被晒得泛着刺眼的白色盐浆，连微风刮过都像是砂纸在脸上摩擦。
- **如果是污染城市**：终年不见阳光的酸雨棚户区，空气里永远有刺鼻的重金属甜味，霓虹灯管的红蓝光线艰难地穿过浓雾。

#### Environmental Hazards (环境危机)
- 在这种小说里，天气比怪物可怕。
- "辐射沙尘暴"：能在一分钟内把金属打磨成镜面，也会剥去人类的皮肉。
- "黑潮/酸雨"：能让护甲迅速溶解，迫使队伍必须在五分钟内找到地下掩体。

#### Strategic Value/Resources (战略与资源价值)
- 这直接决定了冲突。一个看似破烂的废弃医院，如果传言底层药房还有未过期的抗生素，各大势力就会像鬣狗一样蜂拥而至并展开火拼。',
  '## "Scene" Generation — Cli-Fi

The scene itself is often the protagonist''s greatest enemy. The juxtaposition of old-world civilization ruins (overpasses, skyscrapers, monuments) against extreme current weather creates the genre''s unique aesthetics.

### Scene Design Focus

#### Location Type
- **Old-World Ruin**: A shopping mall completely buried by yellow sand, with only the roof exposed; or a nuclear plant submerged 50 meters underwater. These are the fatal treasure troves for scavengers.
- **Fortified Settlement/Oasis**: A sprawling rust-city built on an abandoned oil rig, surrounded by electrified fencing and sniper towers specifically to protect the single functioning freshwater well in the center.
- **The Open Wasteland**: Endless deserts of scorched salt (that used to be the ocean), or plains of shattered ice torn by Category 5 blizzards. Utterly empty and deadly.
- **Elite Eco-Dome/Bunker**: An opulent technological fortress boasting projected blue skies, artificial breezes, and real, living green plants. The stark class contrast against the hellish outside is blinding.

#### Atmosphere/Sensory Details
- **If Underwater**: Emphasize claustrophobia, crushing water pressure, the eerie beams of searchlights revealing mutated jellyfish floating past rusted cars from the 21st century.
- **If Scorched Earth**: Heatwaves distorting the horizon, everything bleached stark white by salt and sun, where even a slight breeze feels like abrasive sandpaper scraping the face.
- **If Polluted City**: Acid-rain shanty towns that haven''t seen the sun in decades, a permanent sickeningly sweet metallic tang in the air, and red/blue neon tubes struggling to pierce the thick smog.

#### Environmental Hazards
- In these stories, the weather is deadlier than monsters.
- **Irradiated Sandstorm**: Capable of stripping a vehicle down to a polished mirror finish in a minute—and flaying human skin just as fast.
- **Acid Rain/Black Tide**: Melts through armor rapidly, forcing the caravan to find an underground bunker within five frantic minutes or die melting.

#### Strategic Value/Resources
- This directly dictates the plot''s conflicts. An apparently useless ruined hospital will draw rival wasteland factions like hyenas into a bloody firefight if rumors spread that the basement pharmacy still holds unexpired antibiotics.',
  (SELECT id FROM novel_creation_method WHERE name = 'Cli-Fi / Climate Fiction Novel' LIMIT 1),
  1,
  61,
  NOW()
)
ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
