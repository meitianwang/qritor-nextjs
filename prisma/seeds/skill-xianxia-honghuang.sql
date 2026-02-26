-- -----------------------------------------------------------------------------
-- 洪荒流 (Prehistoric/Honghuang) AI 生成技能 Layer 3 SQL
-- -----------------------------------------------------------------------------

SET @method_id = 82; 

-- ============================================================================
-- 1. 设定生成技能 (-setting-gen)
-- ============================================================================

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-honghuang-story-hook-setting-gen',
  '「开天辟地大劫钩子」生成：生成主角穿越成先天生灵赶在天道定数前疯狂抢夺机缘的史诗开局',
  '"Story Hook" setting generation for Honghuang',
  '## 「开局窃取天机钩子」设定生成 — 洪荒流\n\n洪荒流的爽点来自于“全知全能的先知感”。因为读者都知道女娲会造人、三清会成圣，主角的唯一任务就是早生一步，把这些大佬的宝贝提前挖光。\n\n---\n\n### 字段生成指南\n\n#### 先天跟脚(出生身份)\n在洪荒，没有跟脚连修炼的资格都没有。给主角安排一个极具跟脚但原神话中死得很惨的身份。比如：成为了盘古死后化作的第一缕清风（赵公明）、或者是通天教主座下原本会被送去填海的龟灵圣母。\n\n#### 第一步窃取天机\n主角绝不先去打怪升级，那是低端玄幻。主角醒来后的第一反应是跑到不周山或者昆仑山，把后来本属于别人的【十二品造化青莲】或是【混沌钟】提前挖走，直接改变天道因果。',
  '## "Story Hook" Setting Generation — Honghuang\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-honghuang-world-setting-gen',
  '「大势不可改小势可改」设定：生成讲究功德、业障、量劫循环的严密神话物理法则',
  '"Worldview" setting generation for Honghuang',
  '## 「天道因果法则」设定生成 — 洪荒流\n\n洪荒世界是比三体还要严密的物理（因果）社会。鸿钧合道就是终极规律。\n\n---\n\n### 字段生成指南\n\n#### 功德系统与业力\n在这个世界里，乱杀生会沾染“业力红莲”，渡劫的时候会被紫霄神雷劈死。而顺应天道（或者钻漏洞）可以获得“玄黄功德”。只要功德足够，哪怕是条狗也能立地成圣。因此洪荒流其实是“赚取功德的商战游记”。\n\n#### 大劫与天数\n鸿钧合天道定下名言：“大势不可改，小势可改”。要求说明下一次量劫（如龙汉或者封神）不可避免的血腥清洗，并说明主角是如何打算在“小势”里钻空子救下截教众仙的。',
  '## "Worldview" Setting Generation — Honghuang\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-honghuang-style-setting-gen',
  '「神话史诗文风」生成：指导生成绝不接地气、只有亿万年沧海桑田与万物刍狗的浩瀚古风文言感',
  '"Writing Style" setting generation for Honghuang',
  '## 「煌煌天威文风档案」设定生成 — 洪荒流\n\n---\n\n### 字段生成指南\n\n#### 代入天道视角的古韵要求\n严禁使用“帅哥、我靠、牛逼”这种现代网络语（除非是主角内心第一人称吐槽）。所有对战、论道时必须使用文言排比和极具气象的古词。\n比如不写“他生气了”。要写：“圣人一怒，天机混沌，血雨倾盆，方圆亿万万里生机断绝。大道轰鸣之声直透三十三天外幽冥血海境！” 每一个词都要堆砌出“岁月悠悠、沧海桑田、非人哉”的史诗感。',
  '## "Writing Style" Setting Generation — Honghuang\n\n...',
  @method_id, 1, 10, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);


-- ============================================================================
-- 2. 角色生成技能 (-character-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-honghuang-character-gen',
  '「洪荒至尊与天地神魔」生成：重新解读老子、女娲、帝俊、十二祖巫的面皮算计与大道执念',
  '"Character" generation for Honghuang',
  '## 「三清大能神魔群像」生成 — 洪荒流\n\n在这里，圣人不是无欲无求的。圣人最在乎两样东西：【面孔（皮面）】与【大道（气运）】。\n\n---\n\n### 字段生成指南\n\n#### 大佬脸谱的重新解构\n给神话大能加上极端的性格标签：\n【元始天尊】：极度看重血脉跟脚，认为披毛戴甲之辈不配修道的高傲精英分子，且极其护短。\n【西方二释(接引准提)】：洪荒第一厚脸皮，为了复兴西方贫瘠之地天天来东方拉下脸皮化缘求人，经典台词“此子/此宝与我西方有缘”。\n【通天教主】：豪气干云、有教无类但容易轻信他人、最终被其他圣人算计得满门抄斩的悲情宗师。\n\n#### 逆天伴生至宝\n每个人生下来都带着开挂组件。详细设定他们手中拥有镇压大教气运的至宝，以及他们借此参悟的终极大道法门（如太极、因果、杀戮）。',
  '## "Character" Generation — Honghuang\n\n...',
  @method_id, 1, 21, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 3. 场景生成技能 (-scene-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-honghuang-scene-gen',
  '「紫霄宫与不周山」生成：展现充满先天威压或是三十三天外的绝顶圣地',
  '"Scene" generation for Honghuang',
  '## 「洞天福地与三十三天」生成 — 洪荒流\n\n这地方的石头捡一块扔到低级玄幻界都能炼成神器。\n\n---\n\n### 字段生成指南\n\n#### 先天阵法与无边气象\n洪荒的名山大川不是风景，而是道场的具象化。如果不周山上有着盘古残留的开天意志压迫，大罗金仙飞上去也会骨肉崩塌；若是幽冥血海，则是天地间最污秽之处，鸿毛不浮，飞鸟难过。\n\n#### 极其夸张的空间尺度\n所有的描写必须加上夸张的量级感：一颗树大如一界，一片叶子托起三千世界。主角在里面探险寻找隐藏的“先天遮天大阵”以收取法宝。',
  '## "Scene" Generation — Honghuang\n\n...',
  @method_id, 1, 22, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 4. 道具生成技能 (-prop-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-honghuang-prop-gen',
  '「先天极品至宝」生成：生成拥有四十道以上禁制、镇压气运或不沾因果的天道Bug产物',
  '"Prop" generation for Honghuang',
  '## 「先天至宝与功德法器」生成 — 洪荒流\n\n在洪荒，法力不够，法宝来凑。拿了混沌钟，猪也能越阶单挑。\n\n---\n\n### 字段生成指南\n\n#### 品级森严的神器体系\n严格按照洪荒流网文的等级设定：混沌至宝 > 先天至宝 > 极品先天灵宝 > 后天功德至宝。必须明确法宝内部蕴含了多少道“先天禁制”（满级49道）。\n\n#### 天道权柄法则(功能)\n这些法宝功能性离谱：不是发波，而是“一旦祭出，立于头顶先立于不败之地（天地玄黄玲珑塔）”、“能够推演天机并掩盖己方因果（洛书河图）”、“杀人不沾染任何因果业障（元屠阿鼻双剑）”。主角偷走了这宝贝，就等于偷走了原本主人的成圣根基。',
  '## "Prop" Generation — Honghuang\n\n...',
  @method_id, 1, 23, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 5. 组织生成技能 (-org-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-honghuang-org-gen',
  '「大教气运之争」生成：阐截两教的面皮互殴、远古妖庭天威与十二祖巫的粗暴肉身阵法',
  '"Organization" generation for Honghuang',
  '## 「圣人道统与先天三族」生成 — 洪荒流\n\n门派在这里叫“教（大教）”或者“族庭”。\n\n---\n\n### 字段生成指南\n\n#### 抢夺气运的终极目标\n所有的圣人立下道统招徒弟，根本不是为了传道授业。而是为了让徒弟去抢夺“天地灵气与气运”，借此让圣人自己长生不死度过量劫。所有的教派之争，本质上是公司（大教）在天道大清洗（破产清算组合）时的保壳战（让别的教填榜单死人，保全自己的教）。\n\n#### 教义互斥与必战宿命\n例如：巫族没有元神只修肉体，只能在大地上；妖庭修元神法宝，高居天空九重天。这两方争夺天地主角，注定最后同归于尽打碎洪荒。主角必须在两方之间左右逢源或者拉扯出第三极势力。',
  '## "Organization" Generation — Honghuang\n\n...',
  @method_id, 1, 25, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 6. 情节推演技能 (-plot-gen)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-honghuang-plot-gen',
  '「神话大事件篡改」大纲领域：为先知主角在紫霄宫听道抢蒲团到逆势翻盘截教封神的漫长元会布局',
  '"Plot Design" domain knowledge for Honghuang',
  '## 「情节大纲推演」领域知识 — 洪荒流\n\n洪荒文的骨架全部基于“已知的神话大事件流线”。爽点在于主角作为蝴蝶翅膀，怎么把历史扇面目全非。\n\n---\n\n### 典型故事推演结构（以截教主角、封神量劫为例）\n1. **混沌/远古孕育与疯狂寻宝**：开天辟地第一件事，去满地捡先天灵宝，在龙凤大劫的神仙打架中捡漏。凑齐防身套装和证道神物。\n2. **紫霄门下与成道分赃**：前往天道第一人鸿钧的紫霄宫听取讲道。这里是名场面“抢蒲团”，因为蒲团决定了后来成圣的名额。\n3. **大劫酝酿与收拢气运**：圣人们相继成道，巫妖大劫开启。主角知道巫妖同归于尽后人族当兴，所以提前布局保护人族、指导女娲造人、甚至收三皇五帝为徒弟，捞取巨量天道功德，顺带斩去自己的善恶两尸。\n4. **逆天改命之封神终局**：最重磅的大戏。诸天圣人联手算计截教通天教主，想让截教神仙去填封神榜。主角终于暴露终极底牌底牌，祭出混沌灵宝，硬刚四大圣人，重立截教威名，最终逆天证得大道圣人/甚至超脱洪荒天道。\n\n### 常见错误\n- ❌ 中途主角跑去地球现代都市装逼打脸。洪荒流极其讲究“逼格”，不跨界，不出圈，永远维持神仙算计天机的高维质感。',
  '## "Plot Design" Domain Knowledge — Honghuang\n\n...',
  @method_id, 1, 30, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 7. 实体命名技能 (-entity-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-honghuang-entity-naming',
  '神话实体命名：充斥天地玄黄、混沌先天法则极其华贵且高大上的专有词库',
  '"Entity Naming": professional naming guidance for Honghuang',
  '## 实体命名 — 洪荒流\n\n全部使用两汉、先秦、《周易》与《道藏》风格的名词。越华丽宏大越好。\n\n---\n\n## 一、法宝与神雷阶位\n\n务必加上品阶：【先天至宝——混沌钟 / 盘古幡】、【极品先天灵宝——十二品灭世黑莲】、【天道凶煞异宝——弑神枪】。\n雷劫与神通：【紫霄神雷】、【都天神煞大阵】、【周天星斗大阵】。\n\n## 二、大能尊号与境界划分\n\n境界：太乙金仙、大罗金仙、准圣、混元大罗金仙（天道圣人）。\n大能：【妖帝帝俊】、【上清灵宝天尊】、【平心娘娘（后土）】。切不可直呼其名，必须要带道场和尊号如“昆仑山玉虚宫元始天尊”。',
  '## Entity Naming — Honghuang\n\n...',
  @method_id, 1, 36, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 8. 叙事写作技能 (-narrative)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-honghuang-narrative',
  '洪荒质感文风描述：如何通过异象迭起、言出法随、大罗金仙交手的排比写照展现降维打击',
  'Narrative writing guidance for Honghuang',
  '## 天道神威正文写作指引 — 洪荒流\n\n放弃武侠动作描写，全面采用“言出法随”和“大道显化异象”的神战写法。\n\n---\n\n### 一、战斗的排比宏大感\n大能交手，先亮异象。\n*Example描写：只听那准提道人冷哼一声，背后万丈金身拔地而起，脑后升起十八重功德金轮，手持七宝妙树，只轻轻一刷，便见漫天星辰如同雨落，无尽混沌气流被强行定住！主角见状，大笑三声，顶上三花聚顶，五气朝元，庆云之中飞出一口漆黑无光的古钟。钟声一响，镇压地水火风；第二响，破开万法真空！*\n\n### 二、老子不用动手的因果律碾压\n越高级别的大战，往往越安静。大罗金仙斗法，可能就是几人在茶几上落子，几百万里外的一颗星辰就炸了，几万妖族大军灰飞烟灭。这凸显了“圣人之下皆蝼蚁”的绝望等级差距。',
  '## Narrative guidance — Honghuang\n\n...',
  @method_id, 1, 101, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);

-- ============================================================================
-- 9. 小说命名技能 (-novel-naming)
-- ============================================================================
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xianxia-honghuang-novel-naming',
  '小说命名：带有跟脚宣告、截胡宣告与洪荒神话专有名词的磅礴书名',
  '"Novel Naming": title generation for Honghuang',
  '## 小说命名 — 洪荒流\n\n---\n\n### 常见书名格式\n\n**格式一：古道经典四字 / 五字名**\n这是最老牌大神的做派。\n- 示例：《佛本是道》、《重生混元道》、《洪荒之太一》\n\n**格式二：开局身份宣告/截胡行动式的现代网文名**\n- 结构：[洪荒/穿越] + [我是什么身份] + [做了什么事]\n- 示例：《洪荒：我只想苟在开天之前》、《我，通天教主，绝不封神》、《洪荒：开局掠夺盘古血脉》\n\n### 内容简介结构\n用大白话或半文言将洪荒第一名场面（紫霄宫分宝、巫妖决战、封神量劫）和主角的外挂结合起来。\n“穿越洪荒大地，成为本该在巫妖大劫中被后羿一箭射死的三足金乌九太子。\n头顶是虎视眈眈欲取妖族代之的十二祖巫，天外有算计众生冷眼旁观的诸多圣人。\n此时鸿钧还未讲道，一切皆有定数，亦有变数。\n叮！神级选择系统（或先天掠夺法宝）已激活。\n【选项一：前往不周山寻宝，截胡十二品造化青莲。奖励：混沌神魔肉体。】\n【选项二：苟在太阳星一万个元会不出世……】\n这一世，我陆压不仅要活下去，还要脚踢准提，拳打元始，以力证道，做那超脱天道束缚的万古第一妖皇！”',
  '## Novel Naming — Honghuang\n\n...',
  @method_id, 1, 35, NOW()
) ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
