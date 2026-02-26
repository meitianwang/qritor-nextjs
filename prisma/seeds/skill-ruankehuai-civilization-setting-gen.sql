-- 软科幻小说创作 - 「文明设定」AI辅助生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ruankehuai-civilization-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruankehuai-civilization-setting-gen',
  '软科幻「文明设定」AI辅助生成：根据时代背景和技术核心，构建自洽的未来文明世界观',
  '"Civilization Setting" AI generation for soft sci-fi: builds a coherent futuristic world based on technological era and core technology',
  '## 「文明设定」生成指南 — 软科幻小说

本模块是整部小说的物理与历史底座。软科幻的文明设定与硬科幻的关键区别在于：技术本身不需要精确，但技术对社会的影响必须精确。读者不需要知道AI的算法细节，但必须清楚地感受到：在AI统治的时代，找一份"有人情味的工作"意味着什么。

**生成原则**

一、技术选择要服务主题，而非炫耀技术。选择"基因工程"不是因为它酷，而是因为它带出阶级固化（"基因优越者"与"自然人"）的社会问题。选择"AI驱动的计划经济"是为了探讨效率与自由的张力。技术核心应该是一把钥匙，打开那扇你真正想探讨的社会问题之门。

二、时间距离决定陌生感浓度。近未来（50-200年）：现实的延伸，读者能认出当下的影子，这种熟悉感制造恐惧；中远未来（200-1000年）：现实已被重构，但人性的核心困境依然可辨；远未来（1000年以上）：人类可能已不是"人类"，需要重新定义叙事的情感锚点。

三、危机要内生，而非外来。最有力的软科幻危机往往不是陨石撞地球，而是"这个系统本身的逻辑最终导向了它的崩溃"。《美丽新世界》的危机不是外敌入侵，而是稳定本身成了监狱。《基地》的危机是文明内部熵增。

**文明名称的设定技巧**

文明名称不必宏大，但应该有隐喻。"大同联邦"暗示表面和谐下的统一管控；"效率纪元"直接命名了这个社会的核心价值观；"后觉醒时代"暗示发生过什么，但读者还不知道那是什么。

**技术发展程度的写法**

避免纯技术描述（"AI达到AGI水平，可以处理……"），要写技术对日常生活的改变："早餐前，算法已经为你安排好今天所有的决策，你只需要按照提示行动。大多数人觉得这很方便，只有少数人觉得不舒服——但他们说不出为什么。"

**文明核心危机的层次**

好的软科幻危机有三个层次：表层（显性的政治或社会危机）、中层（这个危机背后的结构性矛盾）、深层（这个矛盾所揭示的人性困境）。三层都要写出来，但在故事中它们应该逐层揭示。

**一致性检验**

生成文明设定后，问自己三个问题：这个技术水平和地理范围是否自洽？文明历史是否能解释当前社会结构的形成？危机是否是这个文明自身逻辑的必然产物，还是外部强加的？如果三个问题都能回答，设定就具备了基础的世界观一致性。',
  '## "Civilization Setting" Generation Guide — Soft Sci-Fi

The civilization setting is the physical and historical foundation of the entire novel. In soft sci-fi, the technology itself doesn''t need to be technically precise — but its impact on society must be. Readers don''t need algorithm specifications; they need to feel what it means to find "meaningful work" in an AI-governed world.

**Key generation principles**: Technology choices should serve themes, not showcase technology. The chosen technology is a key that unlocks the social question you actually want to explore. Temporal distance controls the intensity of estrangement — near-future settings leverage familiar recognition to create unease, while far-future settings require redefining the narrative''s emotional anchors. Crises should be endogenous — the most powerful soft sci-fi disasters are when a system''s own internal logic drives it toward collapse.

**Naming**: Civilization names work best as implicit metaphors. "The Efficiency Epoch" names the society''s core value; "Post-Awakening Era" hints at history without explaining it yet.

**Consistency check**: After generating, verify three things — does the technology level match the geographic scope? Does the history explain how the current social structure formed? Is the crisis a logical consequence of the civilization''s own internal dynamics?',
  (SELECT id FROM novel_creation_method WHERE name = '软科幻小说' LIMIT 1),
  1,
  20,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  sort_order = VALUES(sort_order);
