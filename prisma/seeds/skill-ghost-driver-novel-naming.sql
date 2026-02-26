-- 灵异司机职业流小说 - 小说命名技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ghost-driver-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ghost-driver-novel-naming',
  '小说命名：为灵异司机职业流小说提供书名与简介的领域知识，让命名同时传递职业感与灵异张力',
  'Novel naming: provide domain knowledge for titling and synopsis writing that conveys both professional identity and paranormal tension',
  '## 小说命名 — 灵异司机职业流小说

灵异职业流小说的书名需要同时完成两件事：**让读者立刻知道这是什么类型的故事**，同时**唤起那种「普通人误入异境」的代入感**。书名不应该是灵异小说的通用名（「鬼车之旅」「冥界司机」），而应该带有职业的真实质感。

---

### 命名哲学

**核心矛盾**：职业的普通感 × 灵异的不普通感

好的书名在这两种感觉之间制造张力：
- 只有「职业感」：听起来像普通职场小说
- 只有「灵异感」：和普通怪谈/玄幻小说没有区别
- **两者并置**：「我开公交，乘客不是人」——哪里出了问题？这就是读者的钩子

---

### 书名结构模式

#### 模式一：「职业+异常」型

将职业行为与灵异元素直接对置，形成认知落差：

- 结构：[日常职业动作] + [灵异属性]
- 示例方向：
  - 「XX路末班车」（真实线路感+「末班」的多重含义）
  - 「夜班司机手册」（手册/指南暗示系统规则感）
  - 「深夜报站：请鬼魂下车」（报站这个具体职业动作+直接点明乘客性质）

#### 模式二：「规则」型

以职业规则或禁令为书名，暗示契约感和压迫感：

- 结构：[禁止/必须]+[行为] 或 [职业规定]
- 示例方向：
  - 「司机守则：不得拒载」（规则感，「不得拒载」在这里有双重含义）
  - 「末班后不停车」（规则，读者立刻知道这条规则会被考验）
  - 「等足三分钟」（一个具体的奇怪规定，作为书名引发好奇）

#### 模式三：「第X班次」型

用数字或计数制造进行式感，暗示这是一个有序列感的故事：

- 示例方向：
  - 「第一班次：拒载不能」
  - 「阴间公交日志」（日志/日记暗示第一人称记录感）
  - 「今晚班次异常」（「异常」是职业化的语言，不是直接说「遇到鬼了」）

#### 模式四：「职业身份」型

直接以职业身份为核心，但加上特殊修饰语：

- 示例方向：
  - 「阴阳线路司机」（职业全称，「阴阳」点明性质）
  - 「接鬼的司机」（「接鬼」是接送乘客的转化，口语化）
  - 「末班车的那个人」（模糊主角身份，「那个人」有孤立感）

---

### 书名词库

**职业相关高频词**：
末班车、夜班、报站、拒载、准点、班次、换班、停靠、发车、收班、倒班、行车记录

**线路相关词**：
X路、末班、环线、支线、夜行线、阴间线、回程、终点站

**时间相关词**：
深夜、子时、凌晨、三更、午夜之后、天亮前

**职业状态词**：
日志、手册、守则、记录、注意事项、须知、警示

**灵异限制词**（谨慎使用，避免过度）：
冥界、阴间、阴阳、幽冥

---

### 简介结构

灵异职业流小说简介应该遵循「职业处境 → 不寻常之处 → 读者为什么要上这辆车」的结构：

**三段式简介框架**：

1. **段一（职业处境，1-2句）**：主角是谁、做什么工作、有什么处境（经济/合同）
   - 示例：「我是一个深夜公交司机，签了份薪水是正常工资三倍的合同」
   - 关键：让读者产生「我理解这个处境」的代入感

2. **段二（不寻常之处，2-3句）**：这份工作有什么不对劲，规则是什么，今晚可能发生什么
   - 示例：「合同里有条规定：不能拒载任何乘客。他们没告诉我的是，上车的不一定是活人」
   - 关键：让读者感到「我能猜到会发生什么，但我又想亲眼看见」

3. **段三（邀请上车，1句）**：一句钩子，直接邀请读者加入
   - 示例：「今晚，有个乘客要去的地方，地图上不存在」
   - 关键：制造具体的悬念，而不是泛泛的「精彩剧情等你发现」

---

### 命名禁区

- ❌ 太玄幻：「冥府运转者」「幽冥摆渡人」（距离职场代入感太远）
- ❌ 太直白：「开着公交车遇到鬼的故事」（失去悬念感）
- ❌ 太俗套的灵异梗：「XX之后，我不再是普通人」（灵异网文过度使用的句式）
- ❌ 英文/数字混搭：「Bus 666」「Route X」（风格不一致）
- ❌ 书名暴露结局：如果书名已经暗示主角「掌控了一切」，读者就没有悬念了',
  'Novel Naming — Ghost Driver Paranormal Novel

Core tension: professional ordinariness × paranormal extraordinariness. The title must simultaneously create professional immersion and paranormal intrigue.

**Four title patterns**:
1. Job+Anomaly: [everyday professional action] + [supernatural element] — creates cognitive dissonance ("Night Shift Driver: Passengers Not Human")
2. Rules: [prohibition/obligation] as the title — implies contract tension and inevitable rule-testing ("Cannot Refuse Passengers")
3. Shift Number/Log: [number or log format] — implies sequential progression ("Ghost Bus Driver Log")
4. Professional Identity: [job title] + [modifier] — "Yin-Yang Route Driver", "The One Who Drives the Last Bus"

**Professional vocabulary bank**: last bus, night shift, stop announcement, refuse boarding, on-time arrival, shift, stand-by, departure, end of service, route log, driver handbook, regulations

**Synopsis framework** (three paragraphs):
1. Professional context (1-2 sentences): who protagonist is, what they do, their situation (economic/contractual) — create "I understand this" immersion
2. The unusual (2-3 sentences): what''s wrong with this job, the rules, what might happen — create "I can guess but want to see"
3. Invitation to board (1 sentence): specific concrete hook, not generic "exciting story awaits"

**Avoid**: overly mystical (too far from professional immersion), too literal (no mystery), overused supernatural web novel phrases, revealing the ending in the title.',
  (SELECT id FROM novel_creation_method WHERE name = '灵异司机职业流小说' LIMIT 1),
  1,
  35,
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
