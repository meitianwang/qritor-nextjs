-- 软科幻小说创作 - 「角色」AI生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ruankehuai-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruankehuai-character-gen',
  '软科幻角色AI生成：创建具有鲜明社会阶层身份、意识形态立场与异化轨迹的人物',
  '"Character" AI generation for soft sci-fi: creates characters with distinctive social class identity, ideological positioning, and alienation trajectories',
  '## 「角色」生成指南 — 软科幻小说

软科幻的角色首先是社会的产物，其次才是个体。这不是说他们没有个性，而是说：在这个类型里，一个角色的个性、欲望和选择方式深深打上了他所在社会阶层和意识形态环境的烙印。读者应该能从角色的行为方式里读出他的出身——不是通过说明，而是通过细节。

**意识形态立场的六种类型**

体制忠实拥护者：不仅服从，还主动维护。他的逻辑自洽，他的好处真实，他的信念是被设计出来的但也是真诚的。写好这个类型，读者会在理解他的同时感到不安。

体制内的秘密怀疑者：表面上的模范公民，内心里有一个不断扩大的裂缝。他知道一些不该知道的事，但代价太高，他选择继续假装。这是软科幻最常见的主角类型，因为他的觉醒弧度最为戏剧性。

主动反抗者：已经越线的人。他的故事不是关于"是否反抗"，而是关于"反抗的代价和意义"。在强力体制下，反抗者几乎必然失败，所以他的存在意义不在于胜负，而在于证明某种东西是值得付出代价的。

超然旁观者：看透了，但选择不行动。这个类型是软科幻里最有哲学张力的角色——他的冷漠是怯懦还是智慧？不介入是保全还是共谋？

被彻底洗脑的意识形态工具人：他的悲剧在于他永远不会知道自己是悲剧。用这个角色，可以展示体制的最终"成就"——一个完全符合设计的人。

**异化程度的写法**

异化不是一个状态，而是一个过程。"完全异化（已不自知）"不是一开始就应该写成这样的——它是一个人在若干次小小的妥协之后的最终状态。如果你写的是一个已经完全异化的角色，试着在他的某个细节里藏一个遗迹：他仍然会在睡前哼某首被禁止的歌，他不知道为什么，但他一直在哼。

**角色弧度与体制的关系**

软科幻的角色弧度往往不是"从弱到强"，而是"从无知到有知"——以及随之而来的代价。觉醒不是礼物，它是负担。一个真正好的软科幻角色在觉醒之后，应该有一刻真诚地想回到无知的状态——因为那更轻松。

**细节的社会阶层标记**

不要告诉读者角色属于哪个阶层，让细节说话：他的餐食是算法配给的还是可以自由选择的？他查询信息时是否有"不可见的墙"？他能否直接拨通高层的通讯频道？他的医疗记录是否对某些机构公开？这些细节比任何说明都更有力。',
  '## "Character" Generation Guide — Soft Sci-Fi

Soft sci-fi characters are social products first, individuals second. Their personalities, desires, and decision-making processes are deeply stamped by their social class and ideological environment. Readers should be able to read a character''s background from their behavior — not through exposition, but through detail.

**Six ideological positions**: The true believer (coherent logic, real benefits, sincere but designed conviction); the secret doubter (model citizen on the surface, expanding crack underneath); the active resister (past the line — their story is about the cost and meaning of resistance, not whether to resist); the detached observer (sees clearly, chooses not to act — is that cowardice or wisdom?); the fully conditioned subject (the system''s ultimate achievement — a person who will never know they are a tragedy).

**Alienation as process**: Alienation isn''t a state, it''s an accumulation of small compromises. For a fully alienated character, hide a relic somewhere in their behavior — they still hum a forbidden song before sleep. They don''t know why, but they always do.

**Class markers through detail**: Don''t tell readers the character''s class — show it. Is their food algorithmically rationed or freely chosen? Do invisible walls appear when they search for information? Can they directly reach upper-level communications? These details speak louder than exposition.',
  (SELECT id FROM novel_creation_method WHERE name = '软科幻小说' LIMIT 1),
  1,
  30,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  sort_order = VALUES(sort_order);
