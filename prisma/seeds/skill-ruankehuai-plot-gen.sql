-- 软科幻小说创作 - 「章节剧情设计」AI生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ruankehuai-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruankehuai-plot-gen',
  '软科幻章节剧情设计：生成推进社会矛盾、人物觉醒与思想主题的章节内容框架',
  '"Plot Design" for soft sci-fi chapters: generates chapter frameworks that advance social contradictions, character awakening, and thematic depth',
  '## 章节剧情设计指南 — 软科幻小说

软科幻的章节不是"事件的推进"，而是"认知的推进"。每个章节结束时，读者（和／或主角）应该比进入时多了解了一些关于这个世界或自己处境的东西——哪怕那个认知是令人不安的。

**章节的双轨结构**

软科幻的好章节同时在两个轨道上运行：
- 表层叙事轨道：发生了什么（事件、对话、行动）
- 深层意义轨道：这揭示了什么（关于社会、关于角色、关于主题）

这两个轨道应该互相强化：一次普通的工作会议可以揭示体制的运作逻辑；一次家庭晚餐可以展示异化如何侵入最私密的空间。表层越"普通"，深层揭示的东西越令人不安。

**章节的五种核心功能**

一、世界观建立章节：通过主角的日常行为展示这个社会的"正常运转"。不要解说，要展示。让读者自己感到奇怪，而不是告诉他们"这很奇怪"。

二、裂缝出现章节：主角（或读者）第一次感到某种不适，某个东西不对劲，但还不清楚是什么。这种不适感应该很微小，但不可忽视。

三、认知扩展章节：主角接触到新的信息或视角，世界观的边界被推进了一步。可以是一个人物带来的，可以是一个场景揭示的，可以是一个制度文物的意外暴露。

四、代价章节：主角因为知道了太多或做了什么而付出代价。代价可以是外部的（惩罚）也可以是内部的（失去某个信念，意识到某个不可回头的改变）。

五、核心选择章节：主角面对一个无法回避的选择——两个选择都有代价，而他必须选。软科幻的选择往往没有好结果，只有"哪个代价更能接受"。

**思想主题的章节分布**

主题不应该在任何单一章节里被"解决"或"宣告"。好的软科幻主题应该像一个问题，在整本书里反复被提出，每次都从新的角度提出，每次都让读者更难回避它。如果你的主题是"当效率成为最高价值，人的尊严还有立足之地吗"，那么：
- 早期章节应该让效率的好处真实可感；
- 中期章节开始呈现效率的代价；
- 后期章节让代价变得不可忽视；
- 结局章节让读者自己回答这个问题。

**节奏控制**

软科幻往往不是节奏最快的类型，但应该有紧张感。紧张感不来自动作，而来自信息：读者（往往比主角）知道更多，知道危险在哪里，但主角还不知道。或者反过来：主角知道了一些读者不知道的东西，叙事制造的悬念是"他会怎么处理它"。

**对话的社会功能**

软科幻的对话应该承载意识形态。两个角色的对话不只是信息交换，而是两种世界观的碰撞——即使他们是在聊天气。一个真正的体制拥护者和一个秘密怀疑者在讨论"今年的社区评分结果"时，他们用的是同一套话语，但思考的是完全不同的问题。这种对话的张力，读者能感受到。

**常见错误**

避免"觉醒即批判"的叙事模式：主角发现体制有问题 → 立即开始反抗。真实的觉醒过程要漫长得多，也痛苦得多。大多数人在意识到一个令人不安的真相之后，会先找理由否认它、合理化它、忽略它，直到它变得无法回避。这才是软科幻真正的心理现实。',
  '## Chapter Plot Design Guide — Soft Sci-Fi

Soft sci-fi chapters don''t advance events — they advance understanding. Each chapter should end with the reader (and/or protagonist) knowing something more about this world or their situation than when they entered — even if that knowledge is unsettling.

**Dual-track structure**: Every good chapter runs on two tracks simultaneously — the surface narrative (what happens) and the deep meaning layer (what it reveals about the society, the character, the theme). The more ordinary the surface, the more unsettling the revelation can be. An ordinary work meeting can expose the system''s operating logic; a family dinner can show how alienation penetrates the most intimate spaces.

**Five chapter functions**: World-normalization chapters (show the system functioning normally — don''t explain, show; let readers feel the strangeness themselves); crack-appearance chapters (first hint of wrongness — small but undeniable); cognitive expansion chapters (new information or perspective pushes the world-view''s boundary outward); cost chapters (price paid for knowing too much or doing something); core choice chapters (unavoidable decisions where both options cost something real).

**Theme distribution**: Themes should never be "resolved" or "announced" in any single chapter. Pose the central question repeatedly across the entire novel, each time from a new angle, each time making it harder to avoid.

**The realistic awakening**: Most people, upon realizing an unsettling truth, first try to deny it, rationalize it, ignore it — until it becomes impossible to avoid. That slow, painful, resistant process is the psychological reality of soft sci-fi.',
  (SELECT id FROM novel_creation_method WHERE name = '软科幻小说' LIMIT 1),
  1,
  40,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  sort_order = VALUES(sort_order);
