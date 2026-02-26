-- 赛博朋克小说创作 - 「文风设定」设定生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-cyberpunk-writing-style-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cyberpunk-writing-style-setting-gen',
  '「文风设定」设定生成：为赛博朋克小说建立语言调性——黑色电影的硬派声线与科幻世界的感官轰炸如何融合',
  '"Writing Style" setting generation: establish the tonal language of cyberpunk — how to fuse noir''s hard-boiled voice with sci-fi''s sensory overload',
  '## 「文风设定」设定生成 — 赛博朋克小说

赛博朋克的文风有一个基因组合：**黑色电影（Film Noir）× 科幻（Science Fiction）**。它继承了黑色电影的叙事立场——冷峻、不相信权威、在污秽中寻找人性；同时继承了科幻的感官密度——技术的存在感，信息的轰炸，感官的超载。

---

### 一、叙事视角的选择

#### 第一人称（推荐度最高）

赛博朋克的第一人称是**黑色电影侦探的后裔**：
- 用冷静语气描述极端事物（越冷静，越恐怖）
- 内心独白穿插在行动之间，但不拖慢节奏
- 观察别人的同时，也观察自己是否还是人

**第一人称示例对比**：

好：「她的义体手臂比我的肌肉快0.3秒。我知道这个，因为她已经证明了三次。」（简洁，包含信息，有结构）

差：「我感到无比震惊和恐惧，这个世界真的太黑暗了……」（感情直接表达，无赛博朋克感）

#### 第三人称限知视角

保留一定距离感，适合多线叙事或需要「读者比主角知道更多」的张力。

---

### 二、语言风格的四个选项

| 语言风格 | 核心特征 | 适用场景 |
|---------|---------|---------|
| 简洁硬派 | 短句，直述，信息密度高，不解释 | 动作场景、紧张时刻 |
| 感官流 | 感官细节叠加，意识与现实交织 | 进入赛博空间、药物或义体失控状态 |
| 技术俚语密集 | 用角色行业的术语自然叙述，不为读者解释 | 建立专业感和真实感 |
| 街头混搭 | 企业黑话与底层俚语并置，形成阶级张力 | 跨阶层场景，讽刺时刻 |

**组合使用**：大部分时间用简洁硬派，感官流用于高强度场景，技术俚语用于角色内行的领域，街头混搭用于讽刺效果。

---

### 三、感官描写的密度控制

赛博朋克以感官轰炸著称，但好的描写不是把所有感官全部堆上，而是**有选择地强调最能制造情绪的那一个**：

**感官重心选择指南**：

- **视觉主导**（最常见）：霓虹灯的颜色比太阳的颜色更精确；广告投影透过雨水变形；义体眼睛在黑暗中泛光
  - 关键技法：颜色要具体（不是「红色霓虹」，是「医疗十字的红色透过雨水变成了粉红的涟漪」）

- **听觉主导**：城市的噪音是分层的；赛博空间有它自己的「音调」；义体植入发出的微小机械声
  - 关键技法：声音的缺失比声音的存在更有力（「她的心脏是义体的，安静得令人不安」）

- **触觉主导**：钢铁的冷感与皮肤的温热；义体和有机体的边界感；雨水打在金属上的触感
  - 关键技法：通过义体和人体的对比制造「异物感」

---

### 四、技术术语的使用方式

赛博朋克的技术术语应该像角色的母语，而不是解释性文本：

**两种写法的对比**：

差（解释式）：「神经接口，也就是将人类神经系统与计算机网络相连的设备，在本世界已经非常普及了」

好（浸入式）：「我拔出了接口插头，脖子后侧有一瞬间的寒意。她还是用老式的神经接口——三年前就停产了，维护成本越来越高」

**技术术语的叙事价值**：每一个技术名词，都应该同时传递一个社会信息——谁能用它，谁用不起，谁用了付出了什么代价。

---

### 五、基调的平衡

| 基调类型 | 核心情绪 | 风险 |
|---------|---------|------|
| 黑色电影悲剧 | 一切终将失败，但失败中有尊严 | 容易变成虚无的说教 |
| 赛博奔跑爽快 | 技术赋权的速度感和刺激 | 容易失去批判性，成为科技拜物 |
| 哲学思辨沉重 | 人与机器的本质问题 | 容易变成说教，失去行动感 |
| 黑色幽默讽刺 | 用笑来揭露荒诞 | 幽默不够精准会显得轻浮 |

**「含光量」控制**：赛博朋克的情绪底色是黑暗的，但完全没有人性光芒的故事让读者没有代入感。赛博朋克的光通常来自最小的地方——一个对陌生人的微小善意，一段注定结束的感情，一个微小的选择——「虽然没有用，但我还是做了」。

---

### 六、常见错误

- ❌ 一直感官轰炸，没有呼吸空间——读者会麻木
- ❌ 用旁白解释世界观（「这座城市由三大企业统治，它们分别是...」）——用行动和细节展示
- ❌ 主角永远冷静——赛博朋克的冷静是铠甲，不是本性；铠甲裂缝处才是人性
- ❌ 所有黑暗都没有意义，所有努力都是徒劳——这不是悲剧，是绝望到底的情绪消耗
- ❌ 技术描写只是功能罗列，没有人的感受——义体不是武器加成，是一个关于身体自主权的问题',
  '"Writing Style" Setting Generation — Cyberpunk Fiction

Core DNA: Film Noir × Science Fiction. Noir''s stance: cold, authority-distrusting, finding humanity in corruption. Sci-fi''s density: technology presence, information overload, sensory bombardment.

**First-person voice** (highest recommendation): the descendant of noir detective narration — describe extremes in calm tones; the calmer the voice, the more disturbing the content.

**Four language styles**: hardboiled (short sentences, no explanation — for action scenes); sensory stream (accumulated perceptions, consciousness blending with reality — for cyberspace or crisis states); technical jargon dense (using character''s professional vocabulary naturally, no reader-explanation — builds authenticity); street-to-corp code-switch (juxtaposing corporate speak with bottom-tier slang — for satire moments).

**Sensory writing technique**: don''t stack all senses — choose one dominant sense per scene.
- Visual: colors must be specific ("medical cross red dissolving through rain into pink ripples," not "red neon")
- Auditory: absence of sound is more powerful than sound ("her heart was a cyberware model — disturbingly quiet")
- Tactile: the contact boundary between metal and organic flesh

**Technology terms as mother tongue**: never explain tech in parenthetical — let context and usage carry meaning. Every tech term should simultaneously convey social information: who can afford it, who can''t, what the user paid.

**Luminosity control**: cyberpunk''s emotional baseline is dark, but stories with zero human warmth lose reader identification. The light in cyberpunk comes from the smallest places — a minor kindness to a stranger, an inevitably ending relationship, one small choice that "didn''t matter but I made it anyway."',
  (SELECT id FROM novel_creation_method WHERE name = '赛博朋克小说创作' LIMIT 1),
  1,
  14,
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
