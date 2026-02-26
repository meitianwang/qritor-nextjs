-- 赛博朋克小说创作 - 叙事写作技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-cyberpunk-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cyberpunk-narrative',
  '叙事写作：赛博朋克正文写作的专项指导——霓虹感官的浸入式描写、黑色电影式的硬派独白与技术世界的语言质感',
  'Narrative writing: specialized guidance for cyberpunk prose — immersive neon sensory writing, hard-boiled noir interior monologue, and the linguistic texture of a technological world',
  '## 叙事写作 — 赛博朋克小说

赛博朋克叙事的核心技法：**用冷峻的声音描述极端的世界，让读者感受到的恐惧比直接说出来的更深**。好的赛博朋克文字有两种同时存在的气质——城市的嘈杂和主角内心的静，技术的冷和人性的热。

---

### 一、开场场景写法

赛博朋克的开场需要在最短的时间内建立世界感和主角处境，不依赖世界观解说：

**三步开场法**：
1. **一个感官细节**（让读者立刻在现场）
2. **一句主角的内心声音**（建立叙事视角和情绪底色）
3. **一个正在发生的事**（驱动叙事进入行动）

**示例**：
「霓虹广告在水坑里碎成三十七块。我数了。等待让人做奇怪的事。」（感官+内心声音+处境）

「后视镜里，Biotechnica大楼的标志比月亮亮。某个地方，总有什么东西比自然的更亮。」（感官+内心声音，带批判性）

**禁区**：
- ❌ 「在二零七三年的夜城，企业取代政府已经五十年了...」（世界观陈述开场）
- ❌ 「阳光透过窗帘洒在我的脸上」（温暖静态开场——赛博朋克不从宁静开始）

---

### 二、霓虹/城市场景的描写技法

「霓虹与雨」是赛博朋克最滥用的视觉语言，要写好它，需要**精确化，而不是类型化**：

**错误写法（类型化）**：
「城市里充满了霓虹灯，雨水在地面上形成水坑，倒映出绚烂的色彩。这是一座高科技的城市。」

**正确写法（精确化）**：
「药店的绿色十字每隔三秒闪一次——节能模式，这条街的供电已经打折了。我脚下的水坑是橙色的，Meditek的新广告比太阳高效多了。」

**精确化的三个维度**：
- 颜色必须有来源（「医疗绿」「广告橙」，不是「五颜六色」）
- 声音必须有层次（远处的、近处的、来自自身的义体）
- 气味必须有具体物（合成食品的油烟、金属润滑剂、人群，不是「城市的味道」）

---

### 三、动作/战斗场景的节奏控制

赛博朋克的动作场景用**「信息压缩，动作扩展」**的节奏：

**信息压缩**（在行动前/中快速传达必要信息）：
「两个人，重义体改造，Apex保安制服。第一个离门更近。」（不解释，直述判断）

**动作扩展**（关键时刻拉长时间感）：
义体手臂比我的预判快了0.2秒。这0.2秒，足够他的手碰到我的喉咙。不足够他用力。」

**义体行动的写法特别注意**：
- 义体的动作有「机械感」——精确、快速，但有时会产生「过于精确」的不自然感
- 主角的有机体部分和义体部分有时候不同步（「我的手已经举起来了，我的心还在犹豫」）
- 赛博空间中的「行动」用完全不同的感知描述（数据而非物理，程序而非肌肉）

---

### 四、赛博空间的写法

赛博空间需要与物理空间明显不同的描写方式：

**物理空间的感知**：具体的材质、温度、重量、噪音

**赛博空间的感知**：
- 颜色代替气味和触感（数据类型、危险等级对应颜色）
- 几何感代替有机感（防火墙是「墙」，但墙是完美的多边形）
- 速度感不同（「思维在网络里比在身体里快四倍，但外面的世界在这期间几乎静止」）
- 危险是可见的、可数字化的（「我感觉到黑冰在靠近——不是直觉，是我的入侵套件在对数据密度做实时分析」）

**从赛博空间撤出的瞬间**：
身体的感知「回来」往往是暴力的——冷、重量、疼痛、时间流速的突然变慢。

---

### 五、对话写法

赛博朋克中不同阶层/身份的人说话方式有明显差异：

#### 企业人员的对话

- 精准、术语化、感情被包裹在专业语言里
- 「这个项目的风险评估未能覆盖你的行动所带来的变量」（说的是：你让我很不安，但他不直接说）
- 不说「请」，只说「需要」「应该」

#### 街头人员的对话

- 简短、直接、混合多语言词汇
- 信息用缩写和行话（「NI接口」「那个七系」「三七二十一」）
- 讲究具体的不讲究规则（「那笔钱，昨天就该到了」不是「你违反了合约」）

#### AI的对话

- 两种极端：
  - 纯功能性（「指令已接收。执行时间：23秒。」）
  - 过于「像人」但哪里不对（「我认为你的计划有风险——这是我第一次使用『认为』这个词」）

---

### 六、内心独白的使用

第一人称赛博朋克小说的内心独白是叙事的灵魂，但要注意：

**好的内心独白**：
- 包含信息（同时描述内心状态和外部观察）
- 有人格（讽刺、疲惫、不相信权威）
- 简短（一两句，然后行动）

**差的内心独白**：
- 纯情感宣泄（「我感到无比的绝望和愤怒」）
- 解释给读者听（「这意味着他们已经知道了我的位置」——读者能推断出来就不用说）

**赛博朋克内心独白的模板**：观察 → 判断（带人格）→ 行动决策

示例：「她的眼睛是Arasaka的——光圈不是人类的大小。（观察）要么是企业特工，要么是够有钱到能买那款的人。（判断）两种都不是我今晚想遇到的。（决策）」

---

### 七、常见写作错误

- ❌ 感官描写全部用「像……一样」的明喻——赛博朋克要求直接性，暗喻或零比喻更有力
- ❌ 连续五句都是长句——短句群制造压迫感，需要变化节奏
- ❌ 技术描写成为信息手册（「这款义体的参数是……」）——通过使用展示，不通过说明展示
- ❌ 所有人物说话方式一样——阶层和身份影响说话节奏、词汇选择、省略方式
- ❌ 用浪漫化的语言描写贫困（「底层有一种粗糙的美……」）——赤贫是赤贫',
  'Narrative Writing — Cyberpunk Fiction

Core technique: describe an extreme world in a cold voice — readers'' fear goes deeper than if you stated it directly. Two simultaneous qualities: the city''s noise and the protagonist''s interior stillness; technology''s cold and humanity''s warmth.

**Three-step opening**: sensory detail (puts reader immediately on-location) → interior voice (establishes narrative POV and emotional baseline) → ongoing event (drives narrative into action). Never: worldbuilding exposition; warm/static opening.

**Neon/city scene precision technique**:
- Wrong (type-label): "the city was full of neon lights, and puddles reflected the colorful glow"
- Right (specific): "the pharmacy cross flashed every 3 seconds — power-saving mode, this block''s supply had been cut. The puddle under my feet was orange — Meditek''s new ad was more efficient than the sun"
- Three precision dimensions: colors must have sources (medical green, ad orange); sounds must be layered (distant, nearby, from your own cyberware); smells must be specific objects (synthetic food oil, metal lubricant, crowd)

**Action scene rhythm**: information compression before/during action ("Two people. Heavy mods. Apex security uniforms. First one was closer to the door."); action expansion for critical moments (draw out 0.2 seconds into a paragraph).

**Cyberspace writing**: replace physical senses with data senses (color = data type/danger level; geometry replaces organic shapes; "thinking is four times faster in the Net, but outside is nearly frozen"). Exit moment: body sensations "return" violently — cold, weight, pain, time suddenly slowing.

**Dialogue differentiation**:
- Corp speech: precise, technical, emotions packaged in professional language
- Street speech: short, direct, multilingual mix, uses abbreviations and jargon
- AI speech: either purely functional OR "too human in a way that''s wrong" ("This is the first time I''ve used the word ''think''")

**Interior monologue structure**: observation → judgment (with personality) → action decision. Never pure emotional declaration or reader-explanation.',
  (SELECT id FROM novel_creation_method WHERE name = '赛博朋克小说创作' LIMIT 1),
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
