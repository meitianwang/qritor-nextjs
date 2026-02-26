-- The Ruthless Protagonist Novel "Narrative Writing" skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-ruthless-protag-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruthless-protag-narrative',
  '叙事写作专项指导：为 Grimdark & Anti-Hero 小说提供语言风格、核心场景写法、对话技巧、节奏把控等叙事层面的全面写作指导',
  'Narrative writing guidance: comprehensive writing direction for Grimdark & Anti-Hero fiction covering language aesthetics, core scene techniques, dialogue craft, and pacing control',
  '## 叙事写作 — The Ruthless Protagonist Novel

Grimdark 叙事的核心美学：**冷静的暴力，有重量的黑暗**。好的 grimdark 写作不是比谁更黑暗，而是让每一个黑暗场景都有情感重量和叙事目的。语言风格应该像主角本人一样——克制、精准、不浪费一个字。

---

### 一、语言风格

Grimdark 写作有三种主要风格取向，作者应选择一种为主调，可在特定场景切换：

**简洁暴烈型**
- 短句为主，动词有力，不用修饰堆砌
- 暴力场景直接、干脆，没有多余描写
- 适合：动作密集、战斗频繁的故事
- 代表感觉：刀切肉的声音

**冷酷克制型**
- 叙述者像在写报告一样冷静记录残酷事件
- 越残忍的场景，语言越平淡——形成反差冲击力
- 适合：策略型主角、内心独白丰富的故事
- 代表感觉：验尸报告

**黑色幽默型**
- 在黑暗中找乐子，用讽刺和自嘲消解恐惧
- 幽默不是缓解黑暗，而是让黑暗更加刺痛
- 适合：愤世嫉俗型主角
- 代表感觉：在屠宰场讲笑话

**风格禁区**：
- 禁止华丽辞藻堆砌（grimdark 不是浪漫主义）
- 禁止伤感煽情的叙述语气（主角不会自怜）
- 禁止说教式的道德评判（不评判角色的选择，让读者自己判断）

---

### 二、核心场景写作技巧

#### 1. 权力博弈场景（谈判/政治阴谋）

关键要素：
- **潜台词比台词重要**：角色说的和想的永远不一样，读者要能读出"话里有话"
- **信息不对称**：让读者知道某个角色在撒谎或隐瞒，但另一个角色不知道
- **筹码展示**：每个人手里有什么牌，什么时候亮出来
- **沉默的力量**：关键时刻主角不说话，比说什么都有威慑力

写法要点：
- 对话要简短有力，避免大段演说
- 大量使用动作细节（手指敲桌、眼神移动、嘴角微动）暗示心理
- 场景结束时，权力关系应该发生了肉眼可见的变化

#### 2. 暴力/战斗场景

关键要素：
- **暴力有目的**：每一次暴力都要推进剧情或揭示角色性格，不是表演
- **代价可见**：战斗后展示受伤、疲惫、心理创伤——不要让主角打完就走
- **速度感**：真正的战斗很快结束，不要写成回合制

写法要点：
- 短句、短段落，加快阅读节奏
- 用感官描写（声音、疼痛、气味）代替上帝视角的全景描述
- 战斗后用慢节奏展示代价（处理伤口、清点损失、面对死者）

#### 3. 背叛揭露场景

关键要素：
- **早有线索**：读者回头看应该能找到所有伏笔
- **情感重量**：背叛之所以痛，是因为关系有真实的情感基础
- **主角的反应**：最好的反应不是愤怒，而是冷静——"我早该料到"

写法要点：
- 揭露瞬间可以用慢动作写法（拉长时间感）
- 回忆闪回插入——让读者和主角一起重新审视过去的互动
- 揭露后留出沉默空间，不要立刻让角色发表长篇演说

#### 4. 道德抉择场景

关键要素：
- **真正的两难**：两个选项都很糟糕，没有明显的"正确答案"
- **时间压力**：不给主角（和读者）太多时间犹豫
- **代价可视化**：让读者看到选择的直接后果（被牺牲者的眼神、哀求）

写法要点：
- 内心独白要简短——真正面临生死选择时人不会写论文
- 选择后不要立刻进行道德评判，让后果自己说话
- 周围角色的反应比主角的自我反思更能展示选择的重量

#### 5. 心理操纵场景

关键要素：
- **层层递进**：主角一步步引导对方进入圈套
- **读者视角**：让读者看到操纵的全过程，产生"看高手下棋"的快感
- **受害者视角**：偶尔切换到被操纵者的视角，增加复杂性

写法要点：
- 主角的内心独白揭示真实意图（与外在表现形成对比）
- 用"棋手视角"——把对方的反应描写为"按计划进行"
- 操纵成功后的主角反应要克制（不要得意洋洋，显得廉价）

#### 6. 孤独/内省场景

关键要素：
- **稀缺性**：这类场景在 grimdark 中应该很少，但每次出现都极有分量
- **人性残余**：展示主角还有感情的瞬间——但很快被压下去
- **无人知晓**：主角的脆弱只在独处时才露出，绝不会被别人看到

写法要点：
- 用环境映射心境（雨夜、废墟、火堆旁）
- 内心独白可以稍长，但语气仍然克制——不是自怜，是清醒的审视
- 场景结束时主角重新"戴上面具"，用一个简洁动作回到冷酷状态

---

### 三、对话风格

Grimdark 对话的核心原则：**潜台词重于台词，权力动态体现在每一句话中**。

**关键规则**：
- 角色不说自己真正想要的东西——用暗示、威胁、试探
- 对话中的沉默和停顿比说出来的话更有信息量
- 权力关系决定对话节奏（强势方说短句或反问，弱势方解释和辩护）
- 主角的对话风格：少说多做，关键时刻一句话比一段话更有杀伤力

**各角色类型的对话特征**：

| 角色类型 | 对话特征 | 示例风格 |
|---------|---------|---------|
| 冷酷主角 | 简短、精准、不废话 | 陈述事实而非威胁，效果更可怕 |
| 虚伪正义者 | 华丽、说教、自我感动 | 长段演说，实际在为自己的恶找借口 |
| 忠诚同伴 | 直接、粗暴、真诚 | 唯一敢对主角说真话的人 |
| 精明对手 | 隐晦、多义、试探 | 每句话有三层意思 |
| 炮灰角色 | 恐惧、求饶、讨好 | 死前最后的话往往最真实 |

---

### 四、节奏把控

#### 章节节奏模式

Grimdark 小说的节奏遵循"张力递增 + 间歇喘息"的波浪模式：

| 节奏类型 | 占比 | 功能 |
|---------|------|------|
| 高张力（战斗/博弈/背叛） | 40% | 核心满足感来源 |
| 中张力（策划/调查/行军） | 35% | 推进情节、铺设伏笔 |
| 低张力（内省/日常/恢复） | 15% | 让读者喘息、为下一波高潮蓄力 |
| 极高张力（生死时刻/终极抉择） | 10% | 全书最高潮的数个关键节点 |

#### 张力曲线规则

- **永远不要连续三章以上低张力**——读者会失去耐心
- **高潮后必须有短暂缓冲**——但缓冲中要埋下下一个高潮的种子
- **每 5-7 章要有一个小高潮**——读者需要持续的满足感
- **全书大高潮不超过 3 个**——太多会审美疲劳
- **章节结尾永远留钩子**——不是悬崖，而是"一个新问题浮现"

---

### 五、常见写作错误

1. **暴力无目的**：战斗和杀戮场景只是为了展示"有多黑暗"，没有推动情节或揭示角色。每一滴血都应该有叙事意义。
2. **主角全知全能**：主角从不犯错、从不被骗、从不遇到真正的智力对手——这不是狠辣，是无聊的超人。
3. **情感表达过度**：grimdark 主角在内心独白中大段自怜或自我分析——这类角色的情感应该是被压抑的、偶尔泄露的、甚至自己都不愿承认的。
4. **对话过长**：角色像在写论文一样讨论道德哲学。Grimdark 对话应该短、锋利、充满潜台词。
5. **世界观说教**：大段文字解释世界有多残酷、制度有多黑暗。应该通过角色的遭遇和反应展示，而不是叙述者的评论。
6. **节奏单一**：全书都是同一种紧张程度，没有呼吸空间。最黑暗的时刻需要之前的短暂光明来反衬。
7. **反派无能化**：为了让主角显得聪明，反派变得愚蠢。好的 grimdark 中，反派应该足够强大和聪明，让主角不得不付出真实代价才能赢。
8. **忽略身体现实**：角色受重伤后下一章就生龙活虎，战斗没有体力消耗。Grimdark 的真实感依赖于对身体限制的尊重。',
  '## Narrative Writing — The Ruthless Protagonist Novel

The core aesthetic of grimdark narrative: **controlled violence, darkness with weight**. Good grimdark writing is not a competition for who can be darker — it is about making every dark scene carry emotional weight and narrative purpose. The prose style should be like the protagonist: restrained, precise, wasting nothing.

---

### I. Language Style

Grimdark writing operates in three primary style registers. Authors should choose one as the dominant mode, switching for specific scenes:

**Lean and Brutal**
- Short sentences. Strong verbs. No decorative clutter.
- Violence is direct and clean — no excess description, no flinching.
- Best for: Action-dense, combat-heavy narratives.
- The feeling: The sound of a blade hitting bone.

**Cold and Clinical**
- The narrator records cruelty with the detachment of an autopsy report.
- The more horrifying the scene, the flatter the tone — the contrast creates the impact.
- Best for: Strategic protagonists, stories rich in internal monologue.
- The feeling: A coroner''s case notes.

**Dark Humor**
- Finding bitter amusement in the abyss. Sarcasm and self-deprecation as survival mechanisms.
- Humor does not soften the darkness — it makes it sting more, because if you can laugh at THIS, the world is truly broken.
- Best for: Cynical, world-weary protagonists.
- The feeling: Telling jokes in a slaughterhouse.

**Style prohibitions**:
- No purple prose (grimdark is not romanticism)
- No sentimental, self-pitying narration (the MC does not feel sorry for themselves)
- No moralizing narrator voice (do not judge the characters'' choices — let readers judge for themselves)

---

### II. Core Scene Writing Techniques

#### 1. Power Game Scenes (Negotiation / Political Intrigue)

Key elements:
- **Subtext over text**: What characters say and what they mean are never the same. Readers should sense the currents beneath every word.
- **Information asymmetry**: Let the reader know one character is lying or concealing something while the other character does not.
- **Chip display**: What cards does each player hold? When do they reveal them? The timing of reveals is everything.
- **The power of silence**: At critical moments, the MC saying nothing is more threatening than any words.

Writing approach:
- Dialogue should be short and sharp. No speeches. No monologues.
- Use micro-actions extensively (fingers tapping the table, eyes shifting, the corner of a mouth twitching) to telegraph psychological states.
- By the scene''s end, the power dynamic must have visibly shifted.
- Show the political chess board through character behavior, not narrator explanation. Let readers figure out who outmaneuvered whom.

#### 2. Violence / Combat Scenes

Key elements:
- **Violence with purpose**: Every act of violence must advance the plot or reveal character. If it does neither, cut it.
- **Visible cost**: After combat, show the injuries, exhaustion, psychological damage. Don''t let the MC walk away clean.
- **Speed**: Real fights end fast. Do not write turn-based combat. The most dangerous opponents should go down in seconds — and so should allies.

Writing approach:
- Short sentences, short paragraphs — accelerate reading speed to match the action.
- Use sensory details (the crack of bone, the taste of blood, the smell of burned flesh) instead of omniscient blow-by-blow narration.
- After the fight, slow the pacing dramatically: treating wounds, counting the dead, staring at what they''ve done. This is where the emotional weight lives.
- Never glamorize violence. The MC may be efficient at it, but the writing should make clear that violence leaves marks on everyone.

#### 3. Betrayal Revelation Scenes

Key elements:
- **All clues planted**: On re-read, every hint should be findable. The revelation should feel inevitable in hindsight.
- **Emotional weight**: Betrayal only hurts because the relationship had a genuine emotional foundation. If readers didn''t care about the bond, they won''t care about its breaking.
- **MC''s response**: The most powerful reaction is not rage but cold acknowledgment — "I should have known." Rage is weakness; acceptance is terrifying.

Writing approach:
- The moment of revelation can use slow-motion technique: stretch time to amplify the impact. Every sensory detail sharpens.
- Intercut with memory flashes — let the reader re-evaluate past interactions alongside the MC. "That conversation was never what I thought it was."
- After the reveal, leave silence. Do not rush into speeches, explanations, or confrontation. Let the weight settle. The MC''s first words after the silence will define their character more than anything else in the book.

#### 4. Moral Dilemma Scenes

Key elements:
- **Genuine no-win situation**: Both options are terrible, and there is no clever third option. The MC must choose which price to pay.
- **Time pressure**: Don''t give the MC (or reader) time for careful moral philosophy. Force a gut decision under pressure.
- **Cost visualization**: Show the human face of the cost — the condemned person''s eyes, their plea, their last words. Make the reader FEEL what the MC is about to do.

Writing approach:
- Internal monologue should be brief — when facing a genuine life-or-death choice, people don''t write essays. They react.
- After the choice, do not editorialize. No moral judgment from the narrator. Let the consequences speak for themselves.
- Other characters'' reactions to the choice reveal its weight better than the MC''s self-reflection. Show the horror, disgust, or quiet acceptance in the eyes of those who witnessed it.

#### 5. Psychological Manipulation Scenes

Key elements:
- **Step-by-step progression**: The MC leads the target into the trap incrementally, each step seeming reasonable.
- **Reader as accomplice**: Show the full manipulation process from the MC''s perspective, creating the "watching a master play chess" satisfaction.
- **Victim''s perspective**: Occasionally switch to the manipulated person''s viewpoint — they think they''re making their own choices, which adds devastating irony.

Writing approach:
- MC''s internal monologue reveals true intent (contrasting sharply with their external performance). The gap between thought and speech IS the scene.
- Use "chessmaster perspective" — describe the target''s reactions as "proceeding as planned." But leave room for the target to surprise the MC at least once.
- After successful manipulation, the MC''s reaction should be restrained. No gloating, no smirking, no internal victory lap. Clinical satisfaction at most. Gloating is for amateurs; the MC is a professional.

#### 6. Solitude / Introspection Scenes

Key elements:
- **Scarcity is power**: These scenes should be rare in grimdark — but every appearance carries immense weight precisely because they''re rare.
- **Remnants of humanity**: Show the MC still has feelings — but watch them suppress those feelings almost immediately.
- **Unseen vulnerability**: The MC''s fragility only surfaces when completely alone. No one else ever witnesses it.

Writing approach:
- Use environment as emotional mirror (rain, ruins, a dying fire, an empty battlefield).
- Internal monologue can be slightly longer here, but the tone remains controlled — not self-pity, but clear-eyed self-assessment. The MC analyzes their own feelings with the same detachment they analyze an enemy''s weakness.
- End the scene with the MC "putting the mask back on" — a single, economical action that signals the return to cold mode. This transition should be abrupt, even jarring.

---

### III. Dialogue Style

The core principle of grimdark dialogue: **subtext outweighs text, and power dynamics are encoded in every line.**

**Key rules**:
- Characters never directly state what they truly want — they hint, threaten, probe, deflect.
- Silences and pauses carry more information than spoken words. A character choosing NOT to respond is a response.
- Power dynamics dictate dialogue rhythm: the dominant party uses short sentences or questions; the weaker party explains, justifies, and fills silences.
- The MC''s dialogue signature: say less, do more. At critical moments, one sentence hits harder than a paragraph. The MC should speak the fewest words in any scene and have the most impact.

**Dialogue characteristics by character type**:

| Character Type | Dialogue Traits | Style Example |
|---------------|----------------|---------------|
| Cold MC | Short, precise, no wasted words | States facts rather than making threats — the effect is more terrifying. "You have until dawn" is scarier than "I''ll kill you if you don''t..." |
| Hypocritical Righteous | Flowery, preachy, self-congratulatory | Long speeches that are actually self-justification for their own evil. They genuinely believe their own rhetoric. |
| Loyal Companion | Direct, rough, honest | The only person who tells the MC the truth. Their dialogue is crude but cuts to the bone. |
| Cunning Opponent | Layered, ambiguous, probing | Every sentence has three possible meanings. They never reveal their hand in conversation. |
| Disposable Characters | Fearful, pleading, desperate | Their last words before dying are often the most honest dialogue in the book. |

**Dialogue formatting**:
- Keep exchanges short — 1-3 sentences per turn is ideal.
- Action beats replace dialogue tags where possible ("He set down the knife" instead of "he said").
- When two powerful characters speak, their dialogue should feel like a fencing match — thrust, parry, counter.

---

### IV. Pacing Control

#### Chapter Rhythm Patterns

Grimdark pacing follows a "rising tension + breathing intervals" wave pattern:

| Tension Level | Proportion | Function |
|--------------|-----------|----------|
| High tension (combat / power plays / betrayals) | 40% | Core source of reader satisfaction |
| Medium tension (planning / investigation / maneuvering) | 35% | Plot advancement and foreshadow planting |
| Low tension (introspection / recovery / brief calm) | 15% | Reader breathing room; charges energy for the next peak |
| Extreme tension (life-or-death / ultimate choices) | 10% | The handful of peak moments in the entire book |

#### Tension Curve Rules

- **Never have more than three consecutive low-tension chapters** — readers will lose patience and momentum.
- **Every peak must be followed by a brief valley** — but the valley must contain the seed of the next peak. The reader rests, but unease lingers.
- **A minor climax every 5-7 chapters** — readers need sustained payoff, not just one big bang at the end.
- **No more than 3 major climaxes in the entire book** — too many creates fatigue and diminishes each one''s impact.
- **Every chapter ending leaves a hook** — not necessarily a cliffhanger, but a new question surfacing, a new threat glimpsed, or a comfortable assumption quietly undermined.
- **The darkest chapter should follow one of the lightest** — contrast amplifies impact. The rare moment of warmth makes the subsequent cruelty devastating.

---

### V. Common Writing Mistakes

1. **Purposeless violence**: Combat and killing scenes exist only to demonstrate "how dark" the world is, without advancing plot or revealing character. Every drop of blood should have narrative meaning. Ask: "If I remove this violence, does the story still work?" If yes, remove it.
2. **Omniscient MC**: The MC never makes mistakes, is never deceived, never encounters a true intellectual equal. This is not ruthlessness — it''s a boring power fantasy wearing a grimdark costume. The MC must be outsmarted at least once.
3. **Emotional over-expression**: The grimdark MC spends paragraphs in self-pitying or self-analytical internal monologue. This character type''s emotions should be suppressed, leaking only occasionally, and often denied even to themselves. Show emotion through action (a hand trembling, a drink poured too quickly), not through extended interior soliloquy.
4. **Bloated dialogue**: Characters discuss moral philosophy like they''re writing academic papers. Grimdark dialogue should be short, sharp, and loaded with subtext. If a conversation runs longer than a page, it needs to earn every line.
5. **Worldbuilding lectures**: Long passages explaining how cruel the world is, how corrupt the system is. Show through character experience and reaction, never through narrator commentary. The reader should understand the world''s brutality from watching what happens to people in it.
6. **Monotone pacing**: The entire book runs at the same tension level with no breathing room. Unrelenting darkness becomes background noise. The darkest moments need preceding light to provide contrast.
7. **Weakened antagonists**: To make the MC look brilliant, opponents are made stupid. In quality grimdark, antagonists should be formidable and intelligent enough that the MC must pay a real price to defeat them. The villain should make the reader think, "In another story, this person would be the protagonist."
8. **Ignoring physical reality**: Characters take grievous wounds and are fighting fit by the next chapter. Battles have no stamina cost. Grimdark''s authenticity depends on respecting physical limitations — injuries linger, exhaustion accumulates, and the body keeps score of every fight.',

  (SELECT id FROM novel_creation_method WHERE name = 'The Ruthless Protagonist Novel' LIMIT 1),
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
