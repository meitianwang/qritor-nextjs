-- 智慧社区灵异小说创作方法
-- Language: zh
-- Includes: creation method + 8 module types
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/init_cyber_ghost.sql

-- ============================================================
-- 1. 创建创作方法
-- ============================================================

INSERT INTO novel_creation_method (name_zh, name_en, description_zh, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '智慧社区灵异小说创作',
  'Smart Community Horror Novel',
  '专为「监控流/赛博灵异」类型设计的创作方法。灵异力量通过智能家居设备入侵——监控摄像头记录了主角背后的人影、智能音箱在深夜自言自语、扫地机器人绕开某个角落永不靠近。核心恐惧：当你用技术来证明异常，技术本身开始对你说谎；当你打开录像想看清楚，画面里的它也在看你。',
  '悬疑灵异',
  'Supernatural Mystery',
  'zh',
  '["setting","character","scene","prop"]',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  novel_type_zh = VALUES(novel_type_zh),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

SET @method_id = (SELECT id FROM novel_creation_method WHERE name_zh = '智慧社区灵异小说创作' LIMIT 1);

-- ============================================================
-- 2. 创建模块类型（8 个）
-- ============================================================

-- 2.1 故事钩子（setting, singleton, temp=1.2）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '智慧社区钩子',
  'Story Hook',
  '主角第一次从设备上发现了不该存在的东西，以及为什么这件事无法被轻易忽略',
  '{"type":"object","required":["故事钩子"],"properties":{"故事钩子":{"type":"string","title":"故事钩子","description":"一句话：主角通过哪个设备看到/听到了什么，以及这件事为什么无法被彻底忽略——让读者立刻感到「这辆理性的列车要出轨了」","x-uiWidget":"textarea","useForAI":true},"主角身份":{"type":"string","title":"主角身份","enum":["刚搬入新居的独居者","有家室的职场人","物业或安保人员","IT从业者或网络工程师","记者或调查者","其他"],"x-uiWidget":"select","useForAI":true},"触发设备":{"type":"string","title":"触发设备","description":"故事开头让主角第一次察觉异常的具体设备——是哪一款设备，在哪个时刻，呈现了什么","x-uiWidget":"textarea","useForAI":true},"第一个异常现象":{"type":"string","title":"第一个异常现象","description":"设备呈现的第一个无法解释的内容。越具体越好：「门铃摄像头在凌晨2点47分拍到有人站在门外，但主角开门什么都没有」比「摄像头出现了奇怪的东西」有效百倍","x-uiWidget":"textarea","useForAI":true},"初始理性化解释":{"type":"string","title":"初始理性化解释","description":"主角第一次察觉异常时如何说服自己「这是正常的」——算法误判、光线反射、声波干扰。这个解释必须在短期内是可信的，否则恐惧就无处积累","x-uiWidget":"textarea","useForAI":true},"无法回头的时刻":{"type":"string","title":"无法回头的时刻","description":"哪一个具体事件让主角再也无法维持「这只是故障」的解释——第二次、第三次、还是某个与第一次关联的关键发现","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.2 设备矩阵（setting, singleton, temp=1.0）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '核心概念',
  'Core Premise',
  '故事中所有智能设备的清单与联动结构——覆盖区域、监控盲区与异常触发条件',
  '{"type":"object","required":["主要设备清单"],"properties":{"主要设备清单":{"type":"string","title":"主要设备清单","description":"故事中存在的所有智能设备及其叙事角色。建议5-8个设备，每个设备有不同的功能定位（监控/交互/执行），避免所有设备都是同一类型","x-uiWidget":"textarea","useForAI":true},"核心恐惧设备":{"type":"string","title":"核心恐惧设备","enum":["可视门铃（看到不该看到的访客）","室内监控摄像头（记录了主角身后的存在）","智能音箱（深夜自言自语或播放无来源音频）","扫地机器人（绕开特定区域，行为路径有规律）","智能灯光（无指令自动开关，模式有规律）","婴儿监视器（传来不该有的声音）","其他"],"x-uiWidget":"select","useForAI":true},"设备网络架构":{"type":"string","title":"设备网络架构","description":"这些设备之间的联动关系——是各自独立、同一品牌生态系统，还是全屋互联的中控平台。联动越紧密，恐惧事件的连锁感越强；各自独立则让异常更难以被统一解释","x-uiWidget":"textarea","useForAI":true},"监控盲区":{"type":"string","title":"监控盲区","description":"设备无法覆盖的区域——这些盲区是「已知安全区」（什么都不会发生）还是「未知危险区」（正是因为没有摄像头才不知道那里有什么）","x-uiWidget":"textarea","useForAI":true},"异常触发条件":{"type":"string","title":"设备异常的触发规律","description":"设备在什么情况下会呈现异常——特定时间段（凌晨2点到3点）、特定空间信号、主角的特定行为，还是完全无规律（无规律本身也是一种规律）","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.3 异常实体（setting, singleton, temp=1.0）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '智能系统规则',
  'AI System Rules',
  '通过设备显现的灵异存在——它是什么、为什么在这里、如何通过科技让人感知到它',
  '{"type":"object","required":["实体类型","科技显现方式"],"properties":{"实体类型":{"type":"string","title":"实体类型","enum":["执念未散的亡魂（曾住在此处/与主角有历史关联）","无处不在的未知存在（被电子网络吸引或捕获）","与特定设备绑定的意识（来自设备的制造或使用历史）","超自然现象的被动记录（设备在记录另一个维度的投影）","其他"],"x-uiWidget":"select","useForAI":true},"存在目的":{"type":"string","title":"存在目的","description":"实体为什么在这里？是有未了的执念？是被困在这个空间？是对主角有某种诉求？还是它完全不知道主角的存在，只是在重复某个行为——而这种「不知道你的存在」有时比「知道」更令人不安","x-uiWidget":"textarea","useForAI":true},"科技显现方式":{"type":"string","title":"通过科技显现的方式","description":"实体如何通过设备让主角感知到它——画面里的残影、录音里的声音碎片、数据的异常规律、设备行为的重复模式。显现的方式应与实体类型有内在联系","x-uiWidget":"textarea","useForAI":true},"感知边界":{"type":"string","title":"感知边界","description":"实体的能力范围——它知道主角存在吗？它能主动影响主角吗？它只能通过设备显现，还是在某些情况下能有物理影响？这个边界决定了故事的恐惧强度上限","x-uiWidget":"textarea","useForAI":true},"显现规律":{"type":"string","title":"显现规律","description":"异常现象出现的规律——完全随机（最令人不安的类型）、有时间规律（每晚凌晨2:47）、有空间规律（只在某个房间）、有行为触发（主角做了某件事才触发）","x-uiWidget":"textarea","useForAI":true},"最终意图":{"type":"string","title":"最终意图（或留白）","description":"如果故事选择揭示：实体最终要的是什么？如果故事选择不揭示：留白本身就是叙事的一部分——记录下这里的不确定性，它会成为故事最大的恐惧来源","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.4 世界规则（setting, singleton, temp=1.0）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '社区世界观',
  'Community World',
  '科技与灵异的接口逻辑——为什么摄像头能看到肉眼看不见的东西，以及主角能否用技术来对抗异常',
  '{"type":"object","required":["科技灵异接口原理"],"properties":{"科技灵异接口原理":{"type":"string","title":"科技与灵异的接口原理","enum":["设备作为记录媒介（摄像头能捕捉肉眼看不见的残影）","电磁信号作为显现条件（灵异现象需要电子设备才能被感知）","算法作为镜子（AI系统开始学习并模仿非人类行为模式）","网络作为通道（存在通过网络在互联设备之间移动）","其他"],"x-uiWidget":"select","useForAI":true},"主角卷入原因":{"type":"string","title":"主角为什么会卷入","description":"为什么是这个主角？是搬入了有历史的空间？是购买了带有某种记忆的设备？是主角自身有某种特质？还是完全随机的厄运——「任何人装了这套设备都会遭遇这些」","x-uiWidget":"textarea","useForAI":true},"证据的两面性":{"type":"string","title":"证据的可解释性设定","description":"这个故事世界里，所有灵异证据都可以有技术层面的解释吗？设定好「每一个异常可以如何被技术性解释」以及「为什么这些解释最终站不住脚」——这是整个类型的核心张力","x-uiWidget":"textarea","useForAI":true},"外部响应方式":{"type":"string","title":"外部世界的响应","description":"当主角向技术支持报修、向物业投诉、向家人展示证据时，外部世界如何响应？设备总能被修好吗？其他人看到了同样的东西吗？孤立无援的程度决定了故事的绝望深度","x-uiWidget":"textarea","useForAI":true},"科技防御有效性":{"type":"string","title":"科技防御的有效性","description":"主角能否通过技术手段对抗异常（关机、重置、断网、格式化、更换设备）？这些方法完全无效？暂时有效之后更糟？还是有效但无法解决根本问题","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.5 文风设定（setting, singleton, temp=0.7）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '叙事风格设定',
  'Writing Style',
  '叙事视角、证据可信度框架与理性化崩塌的节奏——科技语言与灵异叙事的平衡方式',
  '{"type":"object","required":["叙事视角","证据可信度设定"],"properties":{"叙事视角":{"type":"string","title":"叙事视角","enum":["第一人称（最强代入感，理性化过程直接传递）","第三人称限知（有观察距离，可展示主角未注意到的危险）","设备日志体（片段化的设备记录+主角日记，非线性叙事）"],"x-uiWidget":"radio","useForAI":true},"证据可信度设定":{"type":"string","title":"证据可信度设定","enum":["不可靠叙事（读者始终不确定主角是否精神正常）","可靠叙事但无法证明（主角确实看到了，但没有他人可信的证据）","部分可信（某些证据被他人确认，但有更深的未解谜题）"],"x-uiWidget":"radio","useForAI":true},"科技语言风格":{"type":"string","title":"科技语言风格","enum":["克制使用术语（只在关键时刻出现，不铺陈技术细节）","深度技术感（主角是IT背景，思维方式本身就是技术性的）","外行视角（主角不懂技术，设备对他来说就是黑箱）"],"x-uiWidget":"radio","useForAI":true},"恐惧升级模式":{"type":"string","title":"恐惧升级模式","enum":["证据积累式（每个新异常推翻上一个理性解释，直到无法再解释）","亲近升级式（实体越来越靠近主角的个人空间：公共区域→家门口→家里→卧室→主角身后）","技术失控式（设备开始做越来越不像故障的事，直到主动行动）"],"x-uiWidget":"select","useForAI":true},"禁用词语":{"type":"string","title":"禁用词语","description":"写作中应避免的词汇或句式","x-uiWidget":"textarea","useForAI":true}}}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.6 人物（character, 非singleton, temp=1.0）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '角色',
  'Character',
  '与异常相关的所有人——主角、家庭成员、邻居、物业人员与技术支持，每个人都有独立的设备关系和知晓程度',
  '{"type":"object","x-titleField":"称谓","required":["称谓","人物类型"],"properties":{"称谓":{"type":"string","title":"称谓","description":"名字或主角对他们的称呼方式","useForAI":true},"人物类型":{"type":"string","title":"人物类型","enum":["主角（独自面对异常的当事人）","家庭成员（同住但不相信或无法感知）","邻居（有独立的设备和独立的见闻）","物业或安保人员（接触整个小区监控系统的人）","技术支持人员（维修设备时见过某些「奇怪的故障」）","其他"],"x-uiWidget":"radio","useForAI":true},"与设备的关系":{"type":"string","title":"与设备的关系","description":"这个人如何与智能设备互动——技术控对每个参数了如指掌、普通用户只会说话控制、老年人对设备感到陌生、还是对设备完全漠不关心","x-uiWidget":"textarea","useForAI":true},"见证的异常":{"type":"string","title":"见证的异常","description":"这个人是否也见过异常？他们的解释是什么？他们的解释与主角的解释有何本质区别——同一件事，两个人可以有完全不同的解读","x-uiWidget":"textarea","useForAI":true},"知晓程度":{"type":"string","title":"知晓程度","enum":["完全不知晓（从未察觉任何异常）","察觉但合理化（感到不对劲但找到了解释）","部分知晓（知道某件具体的事，但不知道全貌）","完全知晓（比主角更早知道这里发生了什么）"],"x-uiWidget":"select","useForAI":true},"秘密":{"type":"string","title":"秘密","description":"这个人物隐藏的信息——对这个空间历史的了解、对某个设备异常的目击、或者他本身就是某个谜题的关键","x-uiWidget":"textarea","useForAI":true},"当前动态":{"type":"string","title":"当前动态","description":"这个人目前在做什么，以及与主角的关系处于什么状态","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'character',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.7 区域（scene, 非singleton, temp=1.0）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '社区场景',
  'Community Scene',
  '故事发生的空间区域——从私人居室到公共监控区，每个区域的设备覆盖情况与异常密度各不相同',
  '{"type":"object","x-titleField":"区域名称","required":["区域名称","区域类型"],"properties":{"区域名称":{"type":"string","title":"区域名称","useForAI":true},"区域类型":{"type":"string","title":"区域类型","enum":["私人居住空间（卧室/客厅/浴室）","半公共区域（楼道/电梯/储物间）","公共监控区域（小区大堂/停车场/门禁）","技术核心区域（网络机房/监控室/物业办公室）","其他"],"x-uiWidget":"select","useForAI":true},"设备覆盖情况":{"type":"string","title":"设备覆盖情况","description":"这个区域有哪些智能设备，监控盲区在哪里——盲区对叙事很重要，不知道盲区里有什么是一种恐惧；知道盲区里有什么则是另一种","x-uiWidget":"textarea","useForAI":true},"历史事件":{"type":"string","title":"历史事件","description":"这个区域过去发生过什么——是否与当前的异常有关联？这是可以被主角调查、但不会立刻告知读者答案的线索层","x-uiWidget":"textarea","useForAI":true},"异常表现":{"type":"string","title":"异常表现","description":"在这个区域，设备呈现的异常与其他区域有何不同——是最频繁发生的地方、还是唯一从未出现过异常的地方","x-uiWidget":"textarea","useForAI":true},"危险等级":{"type":"string","title":"危险等级","enum":["安全（设备在这里从未出现异常）","轻度（偶发的异常，可以被解释）","高度危险（异常频发，主角不愿独自进入）","核心区域（异常最集中，可能是谜题的解答所在）"],"x-uiWidget":"radio","useForAI":true},"当前状态":{"type":"string","title":"当前状态","description":"主角对这个区域的当前掌控情况——设备是否在线、是否有持续的异常","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'scene',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.8 智能设备（prop, 非singleton, temp=0.7）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '智能设备道具',
  'Smart Device',
  '具有独立叙事功能的智能设备——正常功能与异常表现的对比，以及主角尝试技术性解释的可信度',
  '{"type":"object","x-titleField":"设备名称","required":["设备名称","设备类型"],"properties":{"设备名称":{"type":"string","title":"设备名称","useForAI":true},"设备类型":{"type":"string","title":"设备类型","enum":["监控摄像头","可视门铃","智能音箱","扫地机器人","智能灯光系统","婴儿监视器","智能门锁","智能电视","其他"],"x-uiWidget":"select","useForAI":true},"正常功能":{"type":"string","title":"正常功能","description":"这个设备的日常功能，以及主角依赖它做什么——日常功能的描述越具体，异常表现的反差就越强","x-uiWidget":"textarea","useForAI":true},"异常表现":{"type":"string","title":"异常表现","description":"这个设备呈现的异常——越具体越好。「音箱在凌晨3点播放了一段主角从未保存的旧录音，内容是某人在说一句他完全不认识的话」比「音箱出了奇怪的声音」有效得多","x-uiWidget":"textarea","useForAI":true},"可信度系数":{"type":"string","title":"可信度系数","enum":["完全可解释（一定是技术故障）","大概率可解释（99%是故障，但那1%...）","难以解释（技术原因说不通，但也没有确凿证据）","无法解释（主角和所有人都无法给出技术性解释）"],"x-uiWidget":"select","useForAI":true},"触发条件":{"type":"string","title":"触发条件","description":"异常在什么条件下出现——随机？特定时间？主角的特定行为？与其他设备的联动？触发条件是否有规律性是证明异常「不是故障」的关键","x-uiWidget":"textarea","useForAI":true},"当前状态":{"type":"string","title":"当前状态","description":"设备目前的状态——正常运行/已关机/已重置/已格式化/已物理损坏/已丢弃更换","isDynamic":true}}}',
  @method_id,
  1,
  0,
  'prop',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();
