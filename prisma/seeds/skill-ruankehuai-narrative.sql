-- 软科幻小说创作 - 「叙事写作」领域知识技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-ruankehuai-narrative.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'ruankehuai-narrative',
  '软科幻叙事写作指南：异化视角的叙述技巧、制度语言的文学化处理、觉醒弧度的写法与软科幻的节奏控制',
  '"Narrative Craft" domain knowledge for soft sci-fi: writing techniques for alienated perspective, literary treatment of institutional language, awakening arc construction, and pacing',
  '## 叙事写作指南 — 软科幻小说

软科幻的叙事挑战在于：你在写的是读者认不出来的世界，但你要让读者感受到的东西他们非常认识。那个世界里的人感受到的无力感、困惑、隐隐的不安、被剥夺的尊严——这些是跨越技术背景的人类普遍经验。你的技术背景是陌生的，你的情感真相必须是熟悉的。

---

### 一、异化视角的叙述技巧

**异化叙述者的根本特征**

一个真正被异化的叙述者不会说"我被异化了"。他会以完全正常的语气描述异常的事物，因为对他来说，那就是正常。这种"规范化叙述"是软科幻最有力的技术之一：

- 规范化异常：用描述日常事件的语气描述系统性的去人格化。"每天早上七点，算法会向我推送今天的最优决策路径，我通常接受大部分建议，除了偶尔的早餐选择。"这句话描述了极端的控制，但叙述者觉得完全自然。

- 情感词汇的缩减：一个高度异化的叙述者词汇库里关于情感的词会变少，变得更功能性。他不"悲伤"，他"效率下降了"；他不"爱"，他"建立了高强度情感依附"。这种词汇的贫乏是细腻的恐怖。

- 无法命名的感觉：有时候，一个异化中的角色会感到某种他无法命名的东西——因为他的语言体系里没有那个词。"那天下午，我感到……我不知道那叫什么。我查了情感编码手册，没有找到对应项。"这种叙述比任何直白的悲剧描写都更令人心碎。

**正在觉醒的叙述者**

觉醒是渐进的，叙述声音应该反映这一过程：

- 初期：偶尔出现的"但是……"——"今天的配给结果出来了，我的等级提升了，这当然是好事，但是……但是什么？我不知道。"
- 中期：开始注意到之前没有注意到的细节，开始追问自己之前不问的问题；
- 后期：叙述声音发生根本性的转变——曾经规范化的东西开始变得陌生，"这很奇怪"开始出现在叙述者的思维里。

---

### 二、制度语言的文学化处理

**制度语言的特征**

每个高度组织化的社会都有自己的制度语言：委婉的、功能性的、消除了道德评判的。这种语言的特征是：
- 被动语态化（"减员优化"而不是"他们被解雇了"）；
- 数字化和指标化（"本季度社会和谐指数提升2.3%"）；
- 消除了主体的痛苦（"不适症状已处理"而不是"他在哭"）。

**在叙事中使用制度语言**

不要解释制度语言，让读者自己感受它的效果。在叙事中将制度语言和人的真实情感并置：

官方通知说"公民梁以晨已完成社会贡献周期评估，现进入休整状态"。我在走廊里遇到他妈妈，她什么都没说，只是把他的徽章还给我，那是他最喜欢的一个，有点磨损了。

制度语言说了一件事，那个磨损的徽章说了另一件事。读者知道发生了什么，但叙述者是否知道，是一个微妙的叙事张力。

---

### 三、觉醒弧度的写作要点

**觉醒不是礼物**

大多数软科幻里，觉醒被写成主角的"成长"——他终于看清了真相，然后开始战斗。但真实的觉醒更为痛苦和矛盾：

- 觉醒初期：认知失调。主角同时相信两件矛盾的事，这让他痛苦但无法解决；
- 觉醒中期：主角开始意识到，他的觉醒不会改变什么。这比无知更重。他有没有资格觉醒？知道了真相，然后呢？
- 觉醒后期：不是战斗，而是选择。在不可能改变系统的情况下，他如何活着？他保留什么，放弃什么？他为什么继续，或者为什么停止？

**觉醒者与未觉醒者的关系**

软科幻里最痛苦的关系是：一个已经觉醒的人和一个他爱的、还没有觉醒的人之间的关系。他无法告诉他她真相（可能是出于保护，可能是出于绝望），他必须看着他她在自己看来如此清晰的幻觉中生活。这种爱的痛苦是软科幻最深层的情感矿藏之一。

---

### 四、技术细节的文学处理

**技术描述的原则**

软科幻不需要（也不应该）解释技术的工作原理。技术描述的作用不是教育读者，而是建立世界的质感。诀窍是：描述技术对人的感官和情感的影响，而不是描述技术本身。

不要写："神经链接系统通过量子纠缠原理实现了意识的数字化传输……"

要写："当她第一次接入时，感到了一种奇怪的双重感——她的手还在这里，但她的注意力已经在另一个地方了，那个地方没有重量，没有气味，非常安静。她以为她会喜欢。后来她发现，那种安静是因为她的心跳被滤除了。"

**技术作为情感催化剂**

最好的软科幻技术描写是技术成为情感的催化剂：不是"这个技术很危险"（那是告知），而是"在这个技术里，我失去了某些我甚至不知道我在失去的东西"（那是体验）。

---

### 五、软科幻的节奏控制

**思想密度与情感密度的平衡**

软科幻最大的节奏危险是思想过多，情感太少——变成政论文而不是小说。好的节奏控制是：思想通过情感传达，情感承载思想内容。不要让人物坐下来讨论社会形态的本质，而是让两个人因为一件小事起了争执，那件小事背后是两套截然不同的世界观，读者能感受到那个断层。

**密度管理**

- 世界观建立场景：可以慢，细节丰富，因为读者需要时间建立陌生世界的感知；
- 人物情感场景：节奏适中，给情感空间；
- 危机与对抗场景：不一定要快，但要紧张——软科幻的紧张往往是信息紧张而非动作紧张；
- 觉醒与沉思场景：允许缓慢，思维的流动需要空间。

---

### 六、常见写作错误（10项）

1. 把体制写成纯粹的恶：最可怕的体制有充分的自我辩护理由；
2. 觉醒太快：主角几章内就看透一切，失去了认知过程的真实感；
3. 技术解释过多：停下来解释技术打断了叙事节奏和沉浸感；
4. 主角完全"正确"：在软科幻里，觉醒者的视角也应该有盲点；
5. 异化不够具体：说"他感到空洞"不如展示他在哪件具体的事上感到了空洞；
6. 反乌托邦太明显：最有力的反乌托邦让读者花一段时间才意识到有问题；
7. 制度语言写得过于恶意：真实的制度语言是中性的、功能性的，不是邪恶的；
8. 主题直白宣示：通过人物台词或叙述者反思直接说出主题，等于没有主题；
9. 结局太干净：软科幻的伤口不会完全愈合；
10. 忘记写希望：即使是警示悲剧，也需要让读者知道那些被抵制的东西是值得珍惜的。',
  '## "Narrative Craft" Domain Knowledge — Soft Sci-Fi

The fundamental challenge of soft sci-fi writing: you are describing a world readers won''t recognize, but the things they must feel in that world they know intimately. The powerlessness, the confusion, the quiet unease, the stripped dignity — these are universal human experiences that transcend technological context. Your setting is unfamiliar; your emotional truth must be familiar.

**The alienated narrator**: A truly alienated narrator doesn''t say "I''m alienated." They describe abnormal things in a completely normal tone, because to them, that is normal. The most powerful technique: write systemic dehumanization with the matter-of-fact voice of daily reporting. When vocabulary for emotion becomes sparse and functional ("I experienced reduced efficiency" rather than "I was sad"), that poverty of language is its own quiet horror. When a character feels something they cannot name — because their linguistic system has no word for it — that is more devastating than any direct tragedy.

**Institutional language**: Every organized society has its own institutional language — passive voice, metrics, elimination of moral subject ("the citizen has completed their social contribution evaluation cycle"). Don''t explain it; let readers feel it. The technique: juxtapose institutional language with a concrete human detail. The official notice says one thing; the worn badge returned by a mother says another.

**Awakening arc**: Awakening isn''t a gift — it''s a burden. The realistic awakening involves cognitive dissonance (believing two contradictory things simultaneously), then the more painful realization that awakening alone changes nothing, then the hardest question: how do you live, knowing what you know?

**Technology as emotional catalyst**: Never explain how the technology works. Describe how it feels — what it takes from you that you didn''t know you were losing until it was gone. That gap between function and loss is where soft sci-fi''s horror lives.

**Pacing**: The greatest rhythm danger is too many ideas, too little emotion — becoming a political essay disguised as fiction. Let ideas travel through emotion. Don''t have characters sit down and discuss the nature of social organization; let two people argue about a small thing, with two incompatible worldviews creating the rift. Readers feel that fault line without being told about it.',
  (SELECT id FROM novel_creation_method WHERE name = '软科幻小说' LIMIT 1),
  1,
  101,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  sort_order = VALUES(sort_order);
