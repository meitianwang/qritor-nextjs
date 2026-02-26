-- 软科幻小说创作 - 「社会场景」AI生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ruankehuai-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruankehuai-scene-gen',
  '软科幻社会场景AI生成：构建能揭示社会结构、阶级差异与权力运作的具象化空间',
  '"Social Scene" AI generation for soft sci-fi: builds concrete spaces that reveal social structure, class disparities, and power mechanisms',
  '## 「社会场景」生成指南 — 软科幻小说

软科幻的场景不是背景，是论据。每一个场景应该能够回答一个关于这个社会的问题，或者提出一个读者还没意识到的问题。一个好的场景结束后，读者应该比进入之前对这个世界的理解更深了一点。

**七种场景类型的叙事功能**

生产／劳动场所：在AI或机器人的时代，仍在劳动的人意味着什么？是荣耀还是被淘汰的证明？这个场所的设计揭示了谁被视为有价值，以及"价值"是如何定义的。

控制机构／官方设施：权力的物理化身。注意：权力空间通常被设计成令人舒适或无害的——不是恐吓，而是规范化。一个档案局可以是温暖的、灯光柔和的、工作人员微笑的，然而它的存在本身就是控制。

民间／底层社区：系统裂缝中生长的东西。这里有体制无法完全覆盖的人际网络、非正式经济、禁忌知识的流通——以及体制渗透的痕迹。

精英阶层空间：不是"豪华"，而是"可能性"。精英空间里的特权不在于装饰，而在于选择权——他们可以关掉算法推送，可以有一顿不被记录的饭，可以拥有一个没有监控的房间。这些"特权"在读者眼中应该变得越来越可疑。

虚拟空间／数字世界：现实的对照或替代。是逃脱的出口（但也是另一个笼子），还是权力的延伸（在虚拟世界里也无处不在）？

仪式／意识形态现场：体制将自身合法化的场所。庆典、纪念、誓言、阅兵——这里是意识形态最赤裸的时刻，但往往被包装成最美好的时刻。

**场景中的社会学意义**

在写物理描述时，同时建立"社会学 X 光"：这个空间的布局如何反映权力关系（谁站在哪里，谁需要等待，谁可以直接走）？这个空间里的人如何行为，哪些行为是被允许的，哪些是不被允许但有人在偷偷做的？这个空间里有哪些看不见的边界？

**关键细节的选择**

细节不是装饰，是密码。最好的软科幻场景细节具有双重性：表面上描述一个物理现实，深层上揭示一个社会真相。"大厅里有二十四小时的自然光模拟系统，工作人员从未看过真正的窗外"——这不只是技术描述，这是隔离与控制的具象化。',
  '## "Social Scene" Generation Guide — Soft Sci-Fi

In soft sci-fi, scenes are not backgrounds — they are arguments. Every scene should answer a question about the society, or raise one the reader hadn''t yet thought to ask. When a good scene ends, the reader should understand the world a little more deeply than when they entered it.

**Sociological X-ray**: While writing the physical description, simultaneously establish its sociological reading. How does the spatial layout reflect power relationships (who stands where, who waits, who walks through directly)? What behaviors are permitted? What''s quietly forbidden but happening anyway? What invisible boundaries exist?

**Seven scene types in brief**: Production/labor spaces reveal who counts as valuable and how "value" is defined. Control institution spaces are often designed to be comfortable and warm — normalization, not intimidation. Underground/underclass spaces are where system cracks allow informal networks, forbidden knowledge, non-compliant relationships to survive. Elite spaces are distinguished by optionality — they can turn off algorithmic feeds, have an unrecorded meal, own an unmonitored room. Virtual spaces are either escape hatches or extended surveillance zones.

**Detail selection**: The best soft sci-fi scene details have double resonance — on the surface they describe a physical reality; underneath they reveal a social truth.',
  (SELECT id FROM novel_creation_method WHERE name = '软科幻小说' LIMIT 1),
  1,
  31,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  sort_order = VALUES(sort_order);
