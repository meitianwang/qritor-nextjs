-- -----------------------------------------------------------------------------
-- 规则类怪谈 (Rule-based Horror) AI 生成技能 Layer 3 SQL
-- 这些技能为 Agent 提供了针对"规则类怪谈"小说类型的**专门领域知识**。
--
-- 包含：
--   1. 设定生成 (故事钩子、世界观、文风设定)
--   2. 角色生成
--   3. 场景生成
--   4. 道具/规则获取生成
--   5. 实体/势力生成
--   6. 情节设计
--   7. 叙事写作
--   8. 书名与实体命名
-- -----------------------------------------------------------------------------

SET @method_id = 64; 

-- ============================================================================
-- 1. 设定生成技能 (-setting-gen)
-- ============================================================================

-- 故事钩子
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'rule-horror-story-hook-setting-gen',
  '「故事钩子」设定生成：为规则类怪谈生成入局方式、动机与初始认知冲突',
  '"Story Hook" setting generation for Rule-based Horror',
  '## 「故事钩子」设定生成 — 规则类怪谈\n\n规则类怪谈的故事钩子需要极其快速地打破日常感。它通常包含两层：表层的“因为某种合理原因来到这里”，和深层的“规则不可违抗的认知冲击”。\n\n---\n\n### 字段生成指南\n\n#### 入局方式\n选择最符合当前故事氛围的入局方式。“应聘高薪职位”适合公司/保安类怪谈，“意外卷入”适合动物园/游乐园类。\n\n#### 动机\n设计一个主角绝对不能马上离开的强力理由。不能仅仅是“忘了路”，必须是具有强迫性的（例如：签了绝命契约、急需救命钱、被某种无形的墙壁挡住去路）。\n\n#### 初始异常发现\n必须是一个细微但极其违和的细节。不要一上来就写女鬼，而是写环境认知的不协调。如：墙上的时钟没有秒针、发给动物的饲料里混着人的指甲。\n\n#### 首个认知冲突\n这是整本书第一个高潮。必须是“因为不守规则而导致的惨烈下场”在主角面前展现。借此强行确立规则的绝对权威性。\n\n---\n\n### 常见错误\n- ❌ 直接遇鬼（规则怪谈讲究逻辑和规则的抹杀，不是廉价的jump scare）\n- ❌ 动机太弱（主角随时可以报警走人）',
  '## "Story Hook" Setting Generation — Rule-based Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- 怪谈世界观
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'rule-horror-world-setting-gen',
  '「怪谈世界观」设定生成：为规则类怪谈生成世界背景与污染本质',
  '"Worldview" setting generation for Rule-based Horror',
  '## 「怪谈世界观」设定生成 — 规则类怪谈\n\n规则怪谈的背后往往是一个庞大、冷漠、甚至不可名状的恐怖系统。规则只是这个系统投射在人类认知中的影子。\n\n---\n\n### 字段生成指南\n\n#### 怪谈载体\n决定了故事发生的范围。是动物园这种封闭空间，还是如同“里世界”一般的平行交叠空间？\n\n#### 污染源与本质\n不要写传统意义上的鬼仙。这里的污染源应具备克苏鲁特质——它甚至没有恶意，只是它的存在本身就能让周遭发生变异和逻辑崩塌。\n\n#### 规则的本质\n规则的来源往往是多方的：\n1. 蓝字规则（系统的饲养指南，试图同化人类）\n2. 红字规则（前人拼死留下的血泪教训，真正能救命的）\n3. 黑字规则（被污染的陷阱）\n\n#### 生还条件\n必须是苛刻且具有解谜性质的。不仅是活下来，还可能因为遵守了假规则而永远滞留甚至异化。\n\n---\n\n### 常见错误\n- ❌ 将怪谈的源头具象化为一个有世俗恩怨的恶鬼。\n- ❌ 规则完全是一纸空文，对怪异缺乏绝对的约束力。',
  '## "Worldview" Setting Generation — Rule-based Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- 文风设定
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'rule-horror-style-setting-gen',
  '「文风设定」生成：为规则类怪谈生成写作风格指引',
  '"Writing Style" setting generation for Rule-based Horror',
  '## 「文风设定」生成 — 规则类怪谈\n\n---\n\n### 字段生成指南\n\n#### 语言风格\n推荐“客观冰冷”的旁观者文风或是“面临精神崩塌”的神经质文风。避免热血和搞笑标签穿越。\n\n#### 认知扭曲描写\n重点描述如何刻画“San值狂掉”。文字本身要出现排版或逻辑上的错乱来渲染气氛（如：他明明长着人脸，我却看到了一只兔子）。',
  '## "Writing Style" Setting Generation — Rule-based Horror\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 2. 角色生成技能 (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'rule-horror-character-gen',
  '「角色」生成：为规则类怪谈生成主角、炮灰与员工',
  '"Character" generation for Rule-based Horror',
  '## 「角色」生成 — 规则类怪谈\n\n角色在规则怪谈中经常如同消耗品一样脆弱。生存不靠战力，靠对规则的洞察力和严格执行（以及一点点变通运气）。\n\n---\n\n### 字段生成指南\n\n#### 角色定位\n明确每个角色的功能：主角负责解谜推演，同行者（通常带有过度自信或极度恐慌特质）往往负责试错以展示规则的惩罚，资深员工则处于被污染边缘、半真半假地提供线索。\n\n#### 视觉特征\n在怪谈中，衣服颜色往往是生死线。重点描写其穿着、饰品（这可能是他们没有被同化的锚点）。\n\n#### 背负禁忌\n每个人都要有个人的硬性禁忌（如：无论如何不吃肉、绝对不能看镜子），作为定时炸弹。\n\n#### 当前San值与健康\n不要一开始就让主角陷入疯狂。San值应随着探索不断下降。角色异化的终点往往是变为怪谈的一部分。\n\n---\n\n### 角色阵容建议\n- 理智与观察力极高的主角 (调查者)\n- 必死的一个鲁莽的同行者\n- 佩戴不同颜色工作牌的NPC员工（红色员工危险，蓝色员工安全）',
  '## "Character" Generation — Rule-based Horror\n\n...',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. 场景生成技能 (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'rule-horror-scene-gen',
  '「场景」生成：为规则类怪谈生成封闭污染区域',
  '"Scene" generation for Rule-based Horror',
  '## 「场景」生成 — 规则类怪谈\n\n区域是对规则生效的空间划分。不同的房间、不同的走廊，对应完全不同的生存守则。\n\n---\n\n### 字段生成指南\n\n#### 场景类型\n必须给出一个“避风港（如保安室）”以及多个“高危探索区（如海洋馆、水母收容室）”。\n\n#### 异化细节\n设计一些看似正常实则违背常识的环境因素。重点：这些细节往往是规则中提到要求去“无视”或“应对”的。\n\n#### 专属怪物/威胁\n不要放实体丧尸。应放“只出现在余光里的黑影”、“戴着兔子头套却不会说话的员工”。\n\n---\n\n### 常见错误\n- ❌ 场景之间缺乏界限感。在规则怪谈中，跨越一扇门就是跨越一种生死定数。',
  '## "Scene" Generation — Rule-based Horror\n\n...',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. 规则条文/道具生成技能 (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'rule-horror-prop-gen',
  '「道具与规则集」生成：生成规则类怪谈核心的规则纸条及真伪矛盾点',
  '"Prop" generation for Rule-based Horror',
  '## 「道具与规则纸条」生成 — 规则类怪谈\n\n这是流派的灵魂！每一份规则都必须包含生机与陷阱，同时在多份规则收集齐后，要能拼凑出世界的真相。\n\n---\n\n### 字段生成指南\n\n#### 规则条文详情\n编写 3-5 条极具张力的规则。结构应该是：\n「本阶段安全」-「如何识别危险」-「遇到危险的荒谬应对方式（如：立刻闭眼倒退着走）」-「一条被抹黑或字体突变的禁止事项」。\n\n#### 真伪与矛盾点\n这是极核心的设计：第二份获得的纸条必须在某一条规则上，和第一份纸条产生**绝对的冲突**。\n（例：纸条A说“绝没有大象”，纸条B却说“遇到大象不要看它的眼睛”。主角由此得出存在认知污染的结论）。\n\n#### 物理特征与污染刻度\n纸条本身也会骗人。被血迹浸透的纸条大概率是前人遗留的“真理（红字）”，而印刷精美的册子往往是系统的“同化指南（蓝字）”。',
  '## "Prop/Rule" Generation — Rule-based Horror\n\n...',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. 诡异阵营/势力生成技能 (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'rule-horror-org-gen',
  '「势力/组织」生成：为规则类怪谈生成不可名状的它及维持秩序的系统',
  '"Faction" generation for Rule-based Horror',
  '## 「势力/诡异实体阵营」生成 — 规则类怪谈\n\n这里生成的是怪谈中不同的阵营力量。在这类小说中，往往有三方角力：人类幸存者、维持秩序但残忍的系统（如管理层）、彻底失控的污染源（“它”）。\n\n---\n\n### 字段生成指南\n\n#### 类型与行为模式\n为它们设定严密的行动逻辑。\n如果是“维护秩序者（如黑衣员工）”，他们的行为模式是抹除一切不守规矩的人（甚至包括同类）。\n如果是“污染源头（它）”，它们的行为是通过模因传染，同化人类。\n\n#### 识别特征与应对法则\n主角必须能通过某些感官（如钟表的滴答声停止、空气变得有铁锈味）提前预知它们的到来，并利用特定的“规则漏洞”将它们驱逐。\n\n---\n\n### 常见错误\n- ❌ 赋予诡异阵营过多的人性语言交流。它们不需要说凡人的话。',
  '## "Faction" Generation — Rule-based Horror\n\n...',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. 情节设计领域知识 (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'rule-horror-plot-gen',
  '「情节设计」领域知识：为规则类怪谈提供剧情设计指导，专注于规则破解和认知反转',
  '"Plot Design" domain knowledge for Rule-based Horror',
  '## 「情节设计」领域知识 — 规则类怪谈\n\n规则类怪谈的爽点在于“通过智力推演，在绝境的夹缝中找到唯一生路”。\n\n---\n\n### 典型故事结构\n1. **入局与下马威**（10%）：主角进入场所，获得第一份残缺规则，立刻目睹不守规矩者的惨死。\n2. **破局与发现矛盾**（30%）：按部就班遵守规则，却遭遇必死危机。主角必须找到第二份规则或是隐藏的留言，发现规则间的矛盾，推演出真正的求生方法。\n3. **深入污染区/探索真相**（40%）：为了彻底脱离，前往最危险的禁区寻找“大门”。一路上遭遇异化NPC背叛。\n4. **终极反转与逃生**（20%）：解开终极谜团（如动物园其实是人的屠宰场），利用最终规则的一线漏洞，或者拼死维持仅剩的一点San值，逃出生天。\n\n---\n\n### 事件编排模式\n所有事件必须紧紧围绕“验证规则”展开。\n绝不能靠暴力破局。所有的战斗都是为了争取足够时间执行某条逃生规则（例如：“锁进柜子，闭眼倒数100秒”）。\n\n### 常见错误\n- ❌ 最后变成纯粹的物理打斗，导致智斗感完全丧失。',
  '## "Plot Design" Domain Knowledge — Rule-based Horror\n\n...',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. 实体命名技能 (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'rule-horror-entity-naming',
  '实体命名：为规则类怪谈中的角色、场景、特定怪异名称提供专业命名指导',
  '"Entity Naming": professional naming guidance for Rule-based Horror',
  '## 实体命名 — 规则类怪谈\n\n在规则怪谈中，命名本身往往带有强烈的隐喻和信息量。它不仅是名字，更是分类、警告。\n\n---\n\n## 一、角色命名\n\n- **原则**：具有强烈的现代现实主义色彩。\n- **代号比真名更重要**：很多时候，角色甚至会忘记真名，只能用“穿着蓝制服的人”、“带兔子耳罩的收银员”相称。\n\n## 二、实体/阵营命名\n\n- **原则**：去人格化，强调不可理喻的扭曲感。\n- **示例**：不要叫“邪神雷斯”，而是称呼为“不存在的大象”、“白色房间里的第三个人”、“微笑的管理员”。\n\n## 三、区域命名\n\n- **原则**：极其日常的公共场所名称中夹杂一个绝对突兀的异物。\n- **示例**：保安室、海洋馆、或者是“绝对不存在的4号门”。',
  '## Entity Naming — Rule-based Horror\n\n...',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 8. 叙事写作技能 (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'rule-horror-narrative',
  '规则类怪谈正文写作指引：如何写出逻辑坍塌感与极限精神压迫',
  'Narrative writing guidance for Rule-based Horror',
  '## 规则怪谈叙事写作指引 — 规则类怪谈\n\n规则类怪谈的正文写作，核心是极度压抑的氛围塑造和极度专注的逻辑推理展现。它不需要华丽的辞藻，只需要冷静刺骨的描述。\n\n---\n\n### 一、语言风格\n\n**绝对冷静的第一人称/第三人称限知视角**：\n用类似调查报告、日记录音的口吻来叙述极其荒诞和血腥的场面。主角越是压抑惊恐，文笔越是要表现出一种神经质的克制。\n\n### 二、核心场景写作技巧\n\n#### 2.1 书写认知扭曲\n不需要直接写怪物有多可怕，而是写主角或周围人认知的崩塌。\n例如：*“他把手伸进绞肉机里，一边对我笑，一边说今天的草莓真甜。”*\n\n#### 2.2 验证规则的生死瞬间\n重点描写验证过程中的时间拉锯和主角心跳的倒数。\n例如：*“规则第4条说，听到敲门声必须在床底屏住呼吸。门外传来了咚、咚的声音。我闭上了眼。然而，那声音不是从门外传来的，它是从头顶的天花板传下来的。”*\n\n### 三、节奏把控\n这是一场拉琴弦的游戏。紧绷（遭遇规则杀）-> 舒缓（躲入安全屋复盘规则矛盾） -> 再次拉紧（安全屋发现黑红色纸条）的循环。\n\n### 常见写作错误\n- ❌ 大量铺陈无关紧要的日常琐事或情感交流。\n- ❌ 对怪物的外貌进行大段动作描写（破坏了不可名状的压迫感）。',
  '## Narrative guidance — Rule-based Horror\n\n...',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. 小说命名技能 (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'rule-horror-novel-naming',
  '小说命名：为规则类怪谈生成书名和内容简介',
  '"Novel Naming": title and synopsis generation for Rule-based Horror',
  '## 小说命名 — 规则类怪谈\n\n---\n\n### 常见书名格式\n\n**格式一：警告式书名**\n- 结构：[请记住] / [千万别] + 特殊场所 + 某条最核心的规则\n- 示例：《请勿直视长颈鹿》、《千万别在晚上打开房门》\n\n**格式二：场所收容日志式**\n- 结构：诡异场所 + 工作指南/生存守则/入职合同\n- 示例：《XX市动物园守则》、《深海夜班工作指南》\n\n### 内容简介结构\n\n第一段：抛出一个极其诡异、突兀但是又一本正经的入职/参观规则作为钩子。\n第二段：写出主角因触犯或者发现了规则深处的矛盾，拉开这冰冷杀戮的篇章。\n\n“不要回应！不要吃肉！不要相信穿蓝色衣服的人！”这就是全部生存的密码。',
  '## Novel Naming — Rule-based Horror\n\n...',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

