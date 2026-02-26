-- 惊悚乐园小说「叙事写作指南」领域知识技能（Layer 3）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-jingsong-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'jingsong-narrative',
  '叙事写作指南：为惊悚乐园小说提供恐怖场景感官写作、氛围递进、主角内心独白、恐怖幽默平衡、战斗逃脱节奏、解谜叙事、NPC对话恐怖化等全方位叙事技巧指导',
  '"Narrative Writing Guide": comprehensive narrative techniques for thriller park novels, covering sensory horror writing, atmosphere escalation, protagonist inner monologue, horror-humor balance, combat/escape pacing, puzzle narration, and NPC dialogue horror styling',
  '## 叙事写作指南 — 惊悚乐园小说

惊悚乐园小说的叙事有一个独特的灵魂：**恐怖与理性的共存**。与纯粹的恐怖小说不同，这类小说的主角往往是清醒的、甚至是享受恐怖的——他们在极端恐怖中保持思考，在命悬一线时吐槽系统的脑回路，在直面不可名状之物时依然试图找到逻辑。这种"理性面对非理性"的张力，决定了叙事风格必须在恐怖氛围和角色理性之间找到独特的平衡点。

---

### 一、恐怖场景的感官写作技巧：五感恐怖

恐怖的本质是**失控感**——当人的感官接收到无法解释、无法控制的信息时，恐惧就产生了。惊悚乐园类小说的感官恐怖要比普通灵异小说更加精确和系统化，因为主角是理性的，所以他对感官信息的捕捉和分析更加敏锐。

#### 1.1 视觉恐怖

视觉是最直接的恐怖来源，但也是最容易写得俗套的。

**核心原则：恐怖不在于你看到了什么，而在于你看到的和"应该看到的"不一样。**

- **错位感**：走廊尽头的门本来是关着的，现在开了。镜子里的自己比现实中慢了半拍。墙上的画里的人物换了一个姿势。
- **边缘视觉**：余光看到有什么东西在动，正眼看过去却什么都没有。人类对边缘视觉中的运动异常敏感，这是进化留下的恐惧本能。
- **不该存在的东西**：空无一人的房间里多了一把椅子。合照里多了一个人。天花板上倒挂着一个你不敢看第二眼的东西。
- **光影操控**：灯光闪烁的间隙中看到了某个形状。手电筒照射范围之外的黑暗。唯一的光源正在缓慢熄灭。

**写法示范**：
不要写"他看到一个鬼"。要写"走廊尽头有个人形的轮廓，但它没有影子——或者说，它本身就是一道影子，只是不知道为什么，那道影子比黑暗还要更黑一点。"

#### 1.2 听觉恐怖

听觉恐怖的核心是**不确定性**——声音的来源不明、声音的内容不合常理。

- **不该有声音的地方有声音**：空房间里传来呼吸声。已确认无人的走廊响起脚步声。
- **声音的不对劲**：笑声但节奏不像人类的。说话声但语速忽快忽慢。哭声但没有任何情感波动。
- **声音的方向错乱**：声音从身后传来，但你背靠着墙。头顶传来拖拽声，但你在一楼。
- **静默恐怖**：所有声音突然消失——连自己的脚步声和呼吸声都听不到了。绝对的寂静比任何声音都恐怖。

#### 1.3 触觉恐怖

触觉恐怖来自于**不该被触碰时被触碰**。

- **冰冷的接触**：有什么东西碰了你的后颈，冰凉的，像是手指。但你身后没有人。
- **温度异常**：某个房间的温度骤降十几度。某面墙摸上去是温热的，像有活物在墙里。
- **质感错位**：门把手上有粘腻的东西。楼梯扶手的木头表面下仿佛有东西在蠕动。
- **风**：没有窗户的密室里吹来一阵风，带着腐败的气味。

#### 1.4 嗅觉恐怖

嗅觉是最容易被忽视但最能唤起原始恐惧的感官。

- **腐败气息**：血腥味、腐肉味、发霉的潮湿味——这些气味直接触发人类的危险本能。
- **不合理的气味**：空旷的大厅里飘来饭菜的香味。废弃多年的病房里有消毒水的味道。
- **特定气味与恐怖的关联**：每次那个东西出现之前，空气中就会弥漫一股焦糊味。
- **气味作为预警**：主角学会了通过气味判断恐怖实体的距离和动向。

#### 1.5 第六感恐怖

这是惊悚乐园类小说特有的——来自"系统提示"或主角直觉的恐怖。

- **系统预警**：系统突然弹出一个提示："建议你现在回头看看。"或者更恐怖的——系统提示消失了，这意味着系统也不敢提醒你。
- **直觉警报**：主角作为老玩家培养出的"危险直觉"，某种说不清道不明但绝对真实的恐惧感。
- **数据异常**：系统显示的数值出现了不该出现的变化（恐怖实体的等级显示为"???"）。
- **被注视感**：没有任何视觉证据，但主角确信自己正在被什么东西盯着看。

---

### 二、氛围营造的递进手法

恐怖氛围不是一上来就拉满的，而是像煮青蛙一样慢慢升温。

#### 2.1 由远及近

恐怖先在远处出现（远处的灯灭了、远处传来声音），然后逐渐逼近（走廊另一头有了动静、隔壁房间有了声响），最后来到身边（就在门外、就在你身后）。

**节奏参考**：
```
远处异常（不安） → 中距离异常（紧张） → 近距离异常（恐惧） → 就在身边（极度恐惧）
```

#### 2.2 由暗到明

恐怖的面目从模糊到清晰。先是一个影子、一个声音、一种感觉，然后逐渐看清了轮廓、听清了内容、确认了存在。但"看清"的瞬间不一定是最恐怖的——有时候"几乎看清但又没完全看清"才是巅峰恐怖。

#### 2.3 由静到动

从安静的环境（看似安全）到开始有细微动静（不确定是否安全），到明确有活动（确认不安全），到爆发（全面失控）。

**正确的递进写法**：

```
安静 → "那是什么声音？" → "有什么东西在动" → "它在向我靠近" → "它就在——"
```

#### 2.4 氛围递进的节奏控制

不能一直升温。恐怖感在到达顶峰后需要短暂的"释放"（可以是主角的吐槽、一个安全的角落、或一个暂时的解决方案），然后再开始新一轮的升温。这种"升温-释放-再升温"的波浪形节奏才是持续恐怖的关键。

---

### 三、主角内心独白的写法

内心独白是惊悚乐园类小说的**灵魂**。主角不是普通的受害者，而是一个在恐怖中思考的人。内心独白的质量直接决定了小说的可读性。

#### 3.1 理性分析层

主角面对恐怖时的第一反应是分析：

- "走廊灯按顺序熄灭，间隔约4秒。如果那个东西是跟着灯灭的方向移动的，我还有大约20秒。"
- "这个NPC的对话明显不对劲——他每次提到''地下室''的时候都会不自觉地看向左边。地下室应该在左边。"
- "它的行动模式是固定路线巡逻。每7分钟经过这个走廊一次。我需要在下一个间隙内完成。"

#### 3.2 吐槽/黑色幽默层

理性分析之间穿插的吐槽，是这类小说的标志性特色：

- "系统提示：''请在天亮前离开精神病院。''……说得好像我不想走似的。"
- "看了看手里的武器——一把塑料水枪。这是认真的？"
- "NPC对我说''活人不应该来这里''。谢谢，你觉得我是主动来的？"
- "恐怖指数：S级。推荐人数：5人。实际人数：就我一个。很好。"

#### 3.3 恐惧/疯批层

即使是高智商主角，在某些时刻也必须展现真实的恐惧——否则角色就不像人了。但惊悚乐园主角的恐惧往往带着一种"清醒的疯狂"：

- "我不害怕。我真的不害怕。我只是在想——如果我现在死了，这是不是我最后的想法？不害怕？那倒也挺无聊的。"
- "好吧，我承认，那个东西出现的瞬间，我的大脑有0.5秒的空白。但接下来的0.5秒我就已经在计算逃跑路线了。人的适应能力真是太他妈强了。"
- "理性告诉我那只是光影效果。但我的腿已经开始跑了。有时候腿比脑子靠谱。"

#### 3.4 三层交替的节奏

理性分析、吐槽幽默、真实恐惧——这三层内心独白不是分开用的，而是交替出现的：

```
[理性分析] 它的移动速度大约是每秒3米，我最快能跑到5米/秒——
[恐惧] 但前提是我的腿别抖成这样。
[吐槽] 系统，你能不能在我逃命的时候别弹广告？
[理性分析] ……算了。左转，第三个门，应该有一个安全屋。
```

---

### 四、恐怖与幽默的平衡术

这是惊悚乐园类小说最难把握的技巧。吐槽太多变成喜剧，太少又失去类型特色。

#### 4.1 幽默的时机

- **恐怖高潮之后**：高潮释放后的吐槽是最自然的（"活下来了。好的，我需要换条裤子。"）
- **准备阶段**：进入恐怖之前的轻松对话（"准备好了吗？""不，但你什么时候见过我准备好过？"）
- **系统交互**：与系统的互动天然适合吐槽（系统的提示往往冷冰冰的、反差感强的）

#### 4.2 幽默的禁区

- **角色死亡的瞬间**不能吐槽（破坏情感）
- **恐怖氛围正在攀升时**不能插入大段吐槽（打断节奏）
- **重大真相揭示时**不能用幽默消解严肃性
- **NPC倾诉悲惨背景故事时**不能让主角吐槽

#### 4.3 幽默的形式

- **自嘲**：最安全的幽默形式（"以我的运气，这种事很正常"）
- **反差**：用日常语气描述恐怖事物（"那个东西的审美很独特——整个走廊都用人皮装饰。"）
- **系统吐槽**：对游戏系统的吐槽（"任务奖励：一条命。系统你也太抠了。"）
- **冷幽默**：用极其平静的语气说极其不平静的事（"我的队友变成了怪物。好消息是，他作为怪物比作为队友有用多了。"）

---

### 五、战斗/逃脱场景的节奏写法

战斗和逃脱场景是惊悚乐园小说的动作高潮，节奏必须极快。

#### 5.1 短句 + 快切

- 段落不超过3行
- 句子不超过15字
- 动作描写用短促的动词
- 删除所有不必要的修饰词

**示范**：
```
跑。
走廊尽头，左转。
身后的脚步声越来越近。
门！推开。反锁。
三秒。
砰——门被撞了一下。
两秒。
砰砰——裂缝出现了。
"窗户。"
一秒都没犹豫，直接翻了出去。
```

#### 5.2 倒计时感

在战斗/逃脱中植入时间压力：

- 系统倒计时：「距离副本关闭还有4分37秒」
- 物理倒计时：灯在一盏盏熄灭，每灭一盏它就更近一步
- 生理倒计时：主角的体力/精神力/生命值在持续下降

#### 5.3 视角快切

在多人场景中快速切换视角，制造混乱和紧迫感：

```
张三在前面开路，手电筒的光柱疯狂摇晃。
身后李四在喊："它从天花板上下来了！"
右边——墙壁裂开了。又一个。
"分头跑！"
```

---

### 六、解谜场景的叙事技巧

解谜是惊悚乐园小说的智力核心。读者不仅要看主角推理，还要有机会跟着一起推理。

#### 6.1 信息同步

- 主角发现的线索要完整呈现给读者（不能主角看了一张纸条但不告诉读者内容）
- 给读者足够的信息去做出自己的推理
- 当主角得出结论时，读者应该有"原来如此"或"我也猜到了"的快感

#### 6.2 推理展示

- 用内心独白展示推理过程，而不是直接给出结论
- 可以用"排除法"的思路展示：先排除不对的，再得出正确答案
- 允许主角的推理有误（走入歧途再修正，更真实）

#### 6.3 悬念控制

- 不要一次给所有线索——分批给，每批线索都能推进一步但不能解决全部
- 可以在主角还没完全理解时就给出行动——"虽然还没完全确定，但时间不够了，赌一把"
- 最后一个关键线索要出现在紧急时刻（倒计时中的灵光一闪）

---

### 七、NPC对话的恐怖化写法

副本中的NPC不是正常人。他们的对话本身就应该是恐怖的一部分。

#### 7.1 机械重复

NPC反复说同一句话，或对你说的任何话都用同一句话回应。这种"NPC感"本身就构成一种恐怖。

#### 7.2 信息矛盾

NPC说的话前后矛盾，或者不同NPC给出完全相反的信息。你不知道该信谁——或者，他们都没有在说真话。

#### 7.3 语境错位

NPC用完全不合时宜的语气说话——在恐怖场景中微笑着聊天气，在你濒死时询问你是否享受这次体验。

#### 7.4 预知与打破第四面墙

NPC说出了它不应该知道的信息——叫出你的真名（不是游戏名），描述你在现实世界中的生活，或者直接对你说"你以为这是游戏？"

---

### 八、副本开场和收尾的模板

#### 开场模板

1. **硬切入**：没有任何过渡，直接从黑暗中醒来，已经在副本中了。适合快节奏的副本。
2. **系统播报**：系统给出副本名称、任务目标、基本规则。信息量越少越恐怖（"副本：未命名。任务：生存。提示：无。"）
3. **环境铺垫**：先用一段环境描写建立氛围（废弃的游乐园、午夜的医院、无人的小镇），然后才是角色的反应。
4. **事件引爆**：从一个突发事件开始（有人尖叫、灯突然全灭、身边的人消失了），立刻进入紧张状态。

#### 收尾模板

1. **通关结算**：系统给出评分、奖励、统计数据。冷冰冰的数据和刚才的生死搏杀形成反差。
2. **真相回味**：副本结束后主角回想副本中的真相，给出自己的感悟或未解之谜。
3. **情感收束**：对副本中牺牲的角色的缅怀，或对NPC命运的唏嘘。
4. **悬念过渡**：副本结束但留下一个未解的疑问，连接到下一个副本或主线。

---

### 九、常见错误

1. **感官描写堆砌**：所有恐怖场景都用完五感描写，变得冗长重复。应该每次重点突出1-2种感官。
2. **吐槽过度**：每个恐怖场景都有主角吐槽，消解了所有恐怖感。吐槽应该有克制。
3. **战斗场景拖沓**：逃跑/战斗章节用了大段的心理描写和环境描写，拖慢了节奏。战斗就要快。
4. **解谜信息不对称**：主角突然用了读者不知道的线索推理出结论，读者感觉被欺骗。
5. **NPC对话平庸**：副本NPC说话像正常人，完全没有恐怖感。NPC就应该"不正常"。
6. **开场千篇一律**：每个副本都是"醒来，发现自己在一个陌生的地方"。需要变化。
7. **收尾虎头蛇尾**：决战写得精彩但通关后草草收尾，浪费了情感回味的机会。
8. **恐怖描写过于血腥**：用gore（血浆）代替恐怖（fear），变成了猎奇而不是恐惧。真正的恐怖是心理层面的。
9. **主角独白过长**：在紧急时刻主角内心独白写了半页，明明应该在逃命。
10. **氛围营造缺乏层次**：恐怖感一上来就拉满，没有铺垫和递进，像突然被吓了一跳而不是逐渐被恐惧包围。',
  '## "Narrative Writing Guide" — Thriller Park Novels

Thriller park novel narrative has a unique soul: **coexistence of horror and rationality**. The protagonist thinks clearly in extreme terror, mocks the system while on death''s doorstep, and tries to find logic when facing the incomprehensible.

### Sensory Horror Writing (Five Senses + Sixth Sense)

**Visual**: Horror comes from things being "wrong" — the door that was closed is now open, your reflection moves half a beat slow. **Auditory**: Uncertainty is key — breathing in an empty room, footsteps from impossible directions, absolute silence. **Tactile**: Being touched when nothing should be there — cold fingers on your neck, walls that feel warm and alive. **Olfactory**: Decay, blood, impossible smells (cooking in an abandoned building). **Sixth sense**: System warnings, danger intuition, being watched with no evidence.

### Atmosphere Escalation

Three progressions: far-to-near (distant anomaly → beside you), dark-to-light (vague shape → almost clear), still-to-motion (silence → subtle movement → eruption). Use wave-pattern rhythm — build up, release briefly, build higher.

### Protagonist Inner Monologue (The Soul of the Genre)

Three alternating layers: **Rational analysis** ("Its movement speed is ~3m/s, I can do 5m/s — I have 20 seconds"), **Dark humor/mockery** ("System says: survive until dawn. As if I wanted to stay"), **Genuine fear** ("My brain went blank for 0.5 seconds. The next 0.5 I was already calculating escape routes").

### Horror-Humor Balance

Humor timing: after horror peaks (natural release), during preparation (pre-tension lightness), system interactions (built-in contrast). Humor no-go zones: during character deaths, while horror is building, during major revelations.

### Combat/Escape Pacing

Short sentences (<15 chars), paragraphs under 3 lines, countdown pressure (system timer, lights going out one by one), rapid POV cuts in multi-character scenes. Remove all unnecessary modifiers.

### Puzzle Narration

Show readers all clues the protagonist finds. Display reasoning process through inner monologue (elimination method). Allow wrong deductions (more realistic). Final key clue arrives at the critical moment.

### NPC Dialogue Horror

Techniques: mechanical repetition, contradictory information, contextual mismatch (smiling about weather during horror), breaking the fourth wall (knowing the player''s real name).

### Common Mistakes

1. Sensory overload (using all five senses every scene)
2. Excessive mockery destroying all horror
3. Slow combat scenes with too much inner monologue
4. Information asymmetry in puzzle scenes
5. Normal-sounding NPC dialogue
6. Identical dungeon openings
7. Rushed endings after climactic battles',

  (SELECT id FROM novel_creation_method WHERE name = '惊悚乐园小说' LIMIT 1),
  1,
  101,
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
