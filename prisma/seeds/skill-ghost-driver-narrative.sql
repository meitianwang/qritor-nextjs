-- 灵异司机职业流小说 - 叙事写作技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ghost-driver-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ghost-driver-narrative',
  '叙事写作：为灵异司机职业流小说提供正文写作的核心场景技法、对话风格与节奏处理',
  'Narrative writing: core scene techniques, dialogue style, and rhythm management for writing ghost bus novel prose',
  '## 叙事写作 — 灵异司机职业流小说

灵异职业流小说的正文写作有一个基本原则：**让异常变得日常，让日常突然异常**。这种写法的力量来自于——当读者开始认为「驾驶公交接鬼这件事」是正常的，一个真正的异常才会有震慑力。

---

### 一、出班场景的写法

出班是每次职业体验的序幕，应该建立「基准线」——今晚什么感觉，与往常相比有什么不同。

**标准出班段的叙事要素**：
1. 时间确认（具体时间，不要模糊）
2. 车辆状态检查（是否有意外/前班次遗留）
3. 主角当前状态（身体/精神，偶有白天事件的尾声）
4. 今晚的预感或既成事实（「今晚乘客不多」或「上车时我就发现了……」）

**示例（职业化基调）**：
> 23:02，我准时发车。
>
> 先查后排——从习惯养成第三班以后，我不管乘客有没有，都会从驾驶座转头扫一遍。今晚后排空着。前排靠窗坐了一个穿蓝色外套的，安静地看着窗外，我在后视镜里确认了她的反射——有影子，活人。
>
> 今晚目前没问题。

**避免的写法**：
- ❌ 大段描写夜景（读者需要的是司机视角，不是导游视角）
- ❌ 主角内心独白太多（职业化的人不会一出发就开始感叹人生）
- ❌ 立刻就出现异常（出班前的「正常感」是后续恐惧的对照材料）

---

### 二、乘客上车场景的写法

乘客上车是灵异职业流的核心场景，处理方式决定整本书的恐惧质感。

**原则：先感知异常，再描述，不定性**

**三步法**：
1. **可观察的细节**（不是「她是个鬼」，而是「她的上车方式不对」）
2. **职业化判断**（「按我的经验，这类乘客……」或「第一次见到这种情况」）
3. **行动决策**（开门/等待/假装没看见/检查规则适不适用）

**示例（执念鬼上车）**：
> 第三站，一个老人等在站台上。
>
> 我开门。他上来，没刷卡，径直走向后排。
>
> 没刷卡的乘客我见多了，新亡的通常不知道要刷。我没催他，只是在他落座后确认了一下时间：23:46。这时段，后排一般不会有麻烦。
>
> 他一直看着车窗外，对着一个我看不见的方向。

**不同类型乘客上车的写法差异**：
- **新亡之魂**：行为接近正常乘客，有一两个细节略有不对（刷卡方式/落座速度/对周围乘客视而不见）
- **执念鬼**：目的性强，上车后立刻往某个方向去（特定座位/特定方向），与周围隔绝
- **厉鬼**：异常是立即的——温度/声音/其他乘客的反应先于外形描述
- **冥府官差**：过于正常，正常到不真实——态度、用语、目的都太「职业化」了

---

### 三、危机场景的写法

危机场景的节奏应该服从「信息压缩，行动展开」原则——危机来临时，主角思考时间减少，行动密度增加。

**危机节奏模型**：
```
危机前兆（慢节奏：观察/感知）
  ↓
危机确认（节奏加快：判断/决策）
  ↓
危机处理（快节奏：行动序列，短句）
  ↓
危机余波（慢下来：代价/反思）
```

**短句处理危机段**：

> 后排温度降了。
>
> 我没回头。规则三：行车中不回头。
>
> 但我能从后视镜看见——第七排，那个一直沉默的，站起来了。
>
> 它走向前排。
>
> 我加速。规则二：乘客冲突时停车。我违反了规则二。我知道。
>
> 但如果我停车，它就在车厢中段。如果我开到终点站，它就得下车。
>
> 我赌它遵守规则。

**危机写作要点**：
- 危机中主角的规则意识要保持（哪条规则在这种情况下适用，哪条会冲突）
- 主角的身体反应（手/呼吸/视线）替代直接说「我很害怕」
- 危机解决后，立刻进入代价结算（损失了什么/规则违反的后果）

---

### 四、对话写法

**与亡魂的对话**：

- 保持简短，信息量大，不来回闲聊
- 亡魂的对话逻辑可能有「时间错位」（把60年前的事当成昨天）
- 主角的对话要职业化：确认信息、给出必要告知、不多问

**与冥府官差的对话**：

- 官差用词精确、有官方感，习惯用「规定」「按照……」开头
- 主角在官差面前会下意识更谨慎，对话更简短
- 官差的问题通常是双重含义的（表面是例行询问，实则是测试）

**与活人（白天）的对话**：

- 轻松、日常、语速快（对比深夜班次的紧绷感）
- 主角会有意隐瞒，但可以用「遮挡式回应」（「还行」「累」「没什么大事」）

---

### 五、结班场景的写法

结班是每个班次的情感结算点，不能草草带过。

**结班叙事要素**：
1. 收班时间（具体时间，完成感）
2. 今晚的收入确认（冥币数字/装备/信息）
3. 车辆检查（有没有遗留物/今晚留下了什么痕迹）
4. 主角的内心结算（今晚学到了什么，代价是什么，下次怎么处理）
5. 一句展望或悬念（为下一班次埋伏笔）

**示例**：
> 05:17，我把车停回去。
>
> 今晚的账：基础薪酬850，处理那个第五站的加了200。合计1050冥币。够了。够买那块驾驶室隔板，上次后排差点伸手过来。
>
> 我检查了一遍后排。第七排靠窗留了一件外套，叠得整整齐齐。
>
> 我没动它。前任留下过一条规矩：不拿乘客遗留物，除非你确定它是真的落下的。
>
> 我不确定。

---

### 六、时间与节奏标记

**利用具体时间制造真实感**：
- 出发时间、到达时间、事件时间——具体到分钟，不要说「大约」
- 时间间隔本身会成为节奏信号（「从23:02到00:47，我开了45分钟，但感觉过了很久」）

**章节分节方式**：
- 以「发车」为章节开始，「收班」为章节结束（或在关键时刻切断）
- 可以用时间戳作为节内分节标记（「//23:47」）
- 白天场景与深夜班次用明显的场景切换分开，避免混淆',
  'Narrative Writing — Ghost Driver Paranormal Novel

Core principle: make the abnormal feel normal, then let the normal suddenly turn abnormal. The power comes from readers accepting "driving a ghost bus" as routine — then a real anomaly lands with full impact.

**Five core scene types**:

1. **Departure scene**: establish baseline (specific time → vehicle check → protagonist state → pre-shift feeling). Avoid: extended night scenery, excessive inner monologue, immediate anomaly — the "normal" feeling is contrast material.

2. **Passenger boarding (core scene)**: Three-step method: (1) observable anomaly detail — not "she was a ghost" but "her boarding method was wrong"; (2) professional assessment; (3) action decision. Different types: newly deceased (1-2 subtle details off), obsession ghost (strong purpose, immediate directional movement), vengeful spirit (temperature/sound before visual), underworld official (too normal to be real).

3. **Crisis scene**: "Information compression, action expansion" rhythm:
   - Pre-crisis (slow): observation → confirmation (faster): judgment → handling (fast, short sentences): action sequence → aftermath (slow): cost/reflection
   - During crisis: maintain protagonist''s rule-awareness (which rules apply, which conflict); use physical reactions instead of "I was scared"; immediately enter cost accounting after resolution.

4. **Dialogue**: with ghosts — brief, information-dense, professional; with underworld officials — precise, rule-referencing, tests protagonist; with living (daytime) — light, casual, fast (contrast relief).

5. **End-of-shift scene**: emotional settlement point. Elements: clock-out time (specific) → income accounting (hell money amount) → vehicle inspection (any remnants?) → protagonist''s internal ledger (what learned, cost, next time) → one foreshadowing line.

**Time as rhythm**: use specific times (to the minute). The interval itself signals rhythm ("from 23:02 to 00:47, 45 minutes passed but felt much longer").',
  (SELECT id FROM novel_creation_method WHERE name = '灵异司机职业流小说' LIMIT 1),
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
