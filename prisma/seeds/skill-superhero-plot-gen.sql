-- Superhero / Cape Fiction Novel「情节Plot」生成技能
-- 执行方式: mysql -u <user> -p <database> < skill-superhero-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'superhero-plot-gen',
  '层级3(Domain Knowledge) - 「情节Plot」：指导如何设计反传统超能英雄小说的爽点弧光和升级打脸流程',
  'Layer 3 (Domain Knowledge) - "Plot": Guide on how to design satisfaction arcs and level-up face-slapping plotlines for anti-traditional Superhero fiction',
  '## 剧情设计指南 (Plot Design) — 超能英雄/反传统英雄

反传统英雄/系统流网文的剧情核心是**利用外挂或被低估的能力，打破阶级壁垒，并让那些傲慢的"上位者"付出代价**。

### 1. 经典情节弧线 (Core Story Arcs)

#### Arc 1: The Awakening & The Injustice (觉醒与不公)
- **触发**：主角在最绝望、被顶级英雄坑害（或被系统抛弃）面临死亡时，觉醒了自己真正的外挂系统。
- **高潮**：主角利用新获得的能力（比如看到别人致命弱点、偷窃能力），完成第一次惊险的反杀，并决定从地下开始复仇或逆袭。

#### Arc 2: The Underground Grind (地下发育与系统升级)
- **挑战**：主角为了升级或收集系统素材，混迹于黑市或未清理的地下副本。
- **爽点**：主角在无人知晓的情况下，通过猎杀被通缉的超能力者疯狂收割经验，实力极速暴涨（从F级暗中飙升到A级战力）。

#### Arc 3: Exposing the Hypocrites (手撕伪善者 / 扒皮)
- **交锋**：主角开始将目标对准腐败公会里的中高层英雄。
- **高潮**：不仅是肉体的击杀，更是**社会性死亡**。在某场全网直播的大型作秀救援中，主角用绝对压倒性的冷酷将其踩在脚下，并全网曝光其黑料。**这就是该类型最极致的爽点**。

#### Arc 4: Shattering the Monopoly (撕裂垄断 / 决战资本)
- **决战**：主角的实力和拥护者已经足以对抗幕后的 Megacorporation 或国家机器。
- **结局**：摧毁现有的虚伪秩序，主角可能成为新的地下秩序掌控者，或者冷漠地离开废墟。

### 2. 情节设计的核心原则 (Core Principles)

- **System Exploitation (合理利用系统BUG)**：详细描写主角是如何发现系统漏洞、组合看似无用的垃圾技能，从而打出爆炸伤害的。读者爱看智商碾压。
- **Arrogance and Despair (傲慢与绝望的转换)**：敌人在开打前必须极度傲慢，自认为是S级神明；当他们发现自己引以为傲的超能力被对面的F级主角系统无效化时，要着重描写他们的三观崩塌和痛哭流涕。
- **Quantified Growth (量化的成长快感)**：随时汇报战果。例如"此次击杀S级伪善者，经验值+500000，解锁【神明抹杀者】称号"的文字描述能直接提升爽感。

**AI 生成要求**：在生成剧情大纲或细纲时，必须明确标出【系统升级契机】、【英雄翻车节点】和【爽点爆发时刻】。',
  '## Plot Design Guide — Superhero / Cape Fiction

The narrative core of anti-traditional hero/system Webnovels is **utilizing a cheat or an underestimated ability to shatter class barriers and make those arrogant "superiors" pay the price**.

### 1. Classic Story Arcs

#### Arc 1: The Awakening & The Injustice
- **Trigger**: Just as the protagonist is at their most desperate point, screwed over by a top hero (or abandoned by the system) and facing imminent death, they awaken their true cheat system.
- **Climax**: The protagonist uses their newly acquired ability (e.g., seeing fatal flaws, stealing skills) to pull off a thrilling counter-kill, deciding to begin their revenge or climb from the underground.

#### Arc 2: The Underground Grind
- **Challenge**: The protagonist operates in black markets or uncleared dungeons to level up or gather system materials.
- **Payoff**: Without anyone in the mainstream knowing, the protagonist frantically harvests EXP by hunting wanted superhumans, causing their power to skyrocket (secretly shooting from F-Rank to A-Rank combat power).

#### Arc 3: Exposing the Hypocrites
- **Conflict**: The protagonist begins targeting mid-to-high-tier heroes within the corrupt Guilds.
- **Climax**: It''s not just physical assassination; it''s **social death**. During a massive, globally live-streamed PR rescue event, the protagonist brutally pins the hypocritical hero to the ground with overwhelming coldness, while simultaneously broadcasting their severe blackmail to the whole internet. **This is the ultimate payoff of the genre.**

#### Arc 4: Shattering the Monopoly
- **Final Battle**: The protagonist''s power and supporters are now sufficient to challenge the Megacorporation or state apparatus manipulating things behind the scenes.
- **Ending**: Destroying the existing hypocritical order. The protagonist might become the new controller of the underground order, or simply walk away coldly from the ruins.

### 2. Core Principles of Plot Design

- **System Exploitation**: Detail exactly how the protagonist discovers system bugs or combines seemingly useless "garbage" skills to output explosive damage. Readers love intellectual dominance.
- **Arrogance to Despair Pipeline**: Enemies MUST be incredibly arrogant before the fight, fancying themselves as S-Rank gods. When they realize their proud superpower has been completely nullified by the F-Rank protagonist''s system, heavily focus on the collapse of their worldview and their pathetic begging.
- **Quantified Growth**: Report the loot immediately. Textual descriptions like "S-Rank hypocrite killed. EXP +500,000. Title [God Slayer] unlocked" directly boost reading satisfaction.

**AI Generation Requirements**: When generating plot outlines, you must clearly mark out the [System Level-Up Opportunity], [Hero Downfall Node], and [Satisfaction/Payoff Explosion Moment].',
  (SELECT id FROM novel_creation_method WHERE name = 'Superhero / Cape Fiction Novel' LIMIT 1),
  1,
  100,
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
