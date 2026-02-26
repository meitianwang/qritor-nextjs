-- 软科幻小说创作 - 「文风设定」AI辅助生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ruankehuai-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruankehuai-writing-style-setting-gen',
  '软科幻「文风设定」AI辅助生成：确定叙事视角、文风基调与技术细节呈现方式',
  '"Writing Style" AI generation for soft sci-fi: determines narrative POV, tonal register, and technical detail presentation',
  '## 「文风设定」生成指南 — 软科幻小说

文风设定决定了读者与这个世界的关系。软科幻的文风没有对错，但必须与故事的思想主题高度匹配。

**四种文风基调的特征与适用场景**

**冷峻克制（奥威尔式）**：句子短，词汇精确，情感被克制在字面之下。适合探讨极权控制、信息压制、个体消亡的主题。语言本身就是体制的一部分——在这种文风里，主角不会"感到绝望"，而是"注意到自己已经停止想象明天"。

**讽刺荒诞（赫胥黎式）**：表面欢快甚至华丽，但每个句子下面都有腐烂。适合探讨虚假幸福、消费主义、娱乐至死的主题。反差感是这种文风的武器——当你用描写节日庆典的语气描写人被剥夺自由时，那种不适感比直接的控诉更有力。

**史诗宏大（阿西莫夫式）**：时间尺度拉长，命运感强烈，个人故事是历史进程的切片。适合文明演化、历史规律、宏观社会变迁的主题。这种文风要求叙事者有一种近乎超然的全局视角——不是冷漠，而是理解了个体在历史洪流中的位置。

**诗意感伤**：在废墟或末日中寻找人性的微小温度。适合探讨失落、告别、在无法改变的情况下坚持的主题。技术和社会背景是衬托，核心是情感的质感。

**叙事视角的选择**

第一人称的优势：读者直接进入体制内部，感受异化而不是观察异化。劣势：视野受限，宏观社会图景需要通过对话和推断建立。

第三人称全知（史诗感）的优势：可以展示社会全景，在多个阶层间跳切，让读者看到"系统的全貌"。劣势：情感距离更远，需要更用力地建立读者对个体的认同。

**时间尺度对文风的影响**

宏观时间尺度（跨代际）不适合第一人称叙事，必须用多视角或全知视角；即时时间尺度适合第一人称沉浸感。技术细节的呈现方式也应匹配时间尺度——宏观叙事可以忽略技术细节（"那个时代的人已不再……"），即时叙事必须让技术在场景中可感可触。',
  '## "Writing Style" Generation Guide — Soft Sci-Fi

Writing style determines the reader''s relationship to this world. There''s no right or wrong style, but it must align closely with the story''s thematic goals.

**Four tonal registers**: The Orwellian cold-clinical mode uses precision and restraint — emotion is suppressed beneath the surface, and language itself becomes complicit in the system. The Huxleyan ironic-satirical mode presents surfaces as bright and pleasant while concealing rot underneath — contrast is the weapon. The Asimovian epic mode stretches time, emphasizes historical inevitability, and treats individual stories as cross-sections of civilizational processes. The elegiac-lyrical mode seeks small warmth amid ruins.

**POV selection**: First person places the reader inside the alienated consciousness, experiencing rather than observing. Third-person omniscient allows panoramic social coverage across multiple strata. Match your POV to whether you want intimate immersion or systemic perspective.

**Time scale implications**: Macro-historical time scales require omniscient or multi-POV narration; immediate scales enable first-person immersion. Technical detail should be calibrated to scale — in macro-historical narrative, technology can be implied; in immediate narrative, it must be palpable.',
  (SELECT id FROM novel_creation_method WHERE name = '软科幻小说' LIMIT 1),
  1,
  24,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  sort_order = VALUES(sort_order);
