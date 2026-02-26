-- 软科幻小说创作 - 「角色命名」AI生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ruankehuai-character-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruankehuai-character-naming',
  '软科幻角色命名：生成承载社会身份、意识形态暗示与文化背景的角色名字',
  '"Character Naming" for soft sci-fi: generates names that carry social identity, ideological implication, and cultural context',
  '## 角色命名指南 — 软科幻小说

软科幻的角色命名往往在有意无意间承载了社会信息。一个名字可以暗示阶层、种族混合程度（体现未来文明的文化融合）、被系统编号还是有真名的区别，以及意识形态倾向。

**软科幻命名的五种策略**

一、编号化命名：体现高度管控社会中个体的去人格化。完全编号（A-117, Unit-09）代表最极端的个体消除；名字加编号后缀（Lin 07, Marcus-B）代表折中的系统化管理；只有部分人有真名（阶层特权）。

二、文化融合命名：未来文明往往是多文化混合的，名字反映这一点。将不同文化的词根或命名习惯混合：Kaito Reyes, Yuna Okafor, Dmitri Chen。这种混合的密度可以反映这个世界的全球化程度。

三、意识形态命名：极权社会往往有统一命名运动，名字被选择为传递价值观：Harmony, Unity, Victor, Constance（稳定、统一、胜利、坚定）——这些名字在日常使用中已经失去了意义，但它们的存在本身就是意识形态的痕迹。

四、阶层差异命名：精英阶层可能保留传统的、带来历史重量的名字（Eleanora, Constantine）；中间阶层有功能性的现代名字；底层可能有被简化的、便于管理系统录入的名字。

五、异类命名：那些不服从命名系统的人可能有"野名"（非官方名字），只在地下网络中使用。主角的"真名"与"系统名"之间的差异本身可以成为叙事元素。

**命名与性格的关联**

在软科幻中，名字和性格不必完全匹配——事实上，一个叫"和谐"的主动反抗者，或者一个叫"自由"的体制拥护者，这种反差本身就是叙事的一部分。名字是社会强加的，不是自我选择的——这个差距本身可以说话。

**生成建议**

根据角色的社会阶层、意识形态立场和文化背景，从以下维度生成3-5个候选名字，然后选择最有内涵的：是否有发音的美学或力量感？是否在名字层面暗示了角色命运或主题？是否符合这个世界的命名文化逻辑？',
  '## Character Naming Guide — Soft Sci-Fi

Soft sci-fi character names often carry social information. A name can signal class, the degree of cultural fusion (reflecting civilizational mixing), whether the person has a real name or has been reduced to a system code, and ideological implication.

**Five naming strategies**: Numeric coding (reflects depersonalization in highly controlled societies — full codes, code suffixes, or only some people have real names as a class privilege); cultural fusion naming (future civilizations are multicultural — mix naming conventions from different traditions: Kaito Reyes, Yuna Okafor, Dmitri Chen); ideological naming (unified naming movements give names like Harmony, Unity, Constance — in daily use they''ve lost meaning, but their existence is itself an ideological trace); class-differentiated naming (elites keep historically weighted names; lower classes get simplified, system-friendly entries); underground names (the "true name" vs. "system name" gap can itself become a narrative element).

**The mismatch principle**: In soft sci-fi, a character named "Harmony" who is an active resister, or "Freedom" who is a true believer, carries narrative meaning — names are socially imposed, not self-chosen. That gap between name and self can speak.',
  (SELECT id FROM novel_creation_method WHERE name = '软科幻小说' LIMIT 1),
  1,
  51,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  sort_order = VALUES(sort_order);
