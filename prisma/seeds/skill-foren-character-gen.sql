-- Paranormal Forensics Novel「Character」generation skill (Layer 3 domain knowledge)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-foren-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'foren-character-gen',
  '「Character」生成：为超自然法证小说设计配角——每个角色通过其对超自然的认知层级与隐藏秘密，在法证调查的双重现实（常规与超自然）中承担特定叙事功能',
  '"Character" generation: design supporting cast for paranormal forensic investigation novels — each character''s role defined by their level of paranormal awareness and the secrets they carry into the dual-reality investigation',
  '## 「Character」生成 — 超自然法证小说

核心设计原则：法证调查的世界里，每个角色对「超自然」的认知程度，决定了他们在叙事中的功能和张力。「知道的人」与「不知道的人」之间的信息差，是这类小说的核心动力之一。

### 字段生成指南

每个字段都是叙事工具，而非简单的人物档案信息。

**Name（姓名）**：选择与职业和文化背景相符的姓名。法证领域的角色通常有正式、职业化的感觉。避免过于象征性或奇特的名字——这类故事的力量部分来自于普通人卷入非凡事件。

**Role（角色类型）**：决定角色与调查的基本关系。见下方详细说明。

**Gender（性别）**：在法证调查类型中，性别往往影响机构权威的动态——尤其是在「机构阻挠」和「导师」类型角色中。

**Professional Background（职业背景）**：必须足够具体以建立可信度，并与案件有实质关联。不要写「警察」，而是「刑事侦查科十五年老手，专攻暴力犯罪现场重建，最近因一起无法解释的案件被调离」。

**Relationship to the Paranormal（与超自然的关系）**：六个层级，是最重要的设计轴心。见下方详细说明。

**Connection to the Case（与案件的关联）**：说明角色为什么在这里——职业上的、个人的、还是被迫卷入的。这个字段必须回答：这个角色为什么重要？

**Personality（性格）**：提炼为2-3个决定行为模式的核心特征，而非全面的性格清单。重点是这些特征如何与他们的角色类型和超自然认知产生摩擦。

**Physical Description（外貌描述）**：简洁，并与角色状态相关。一个「受损/被控制」状态的角色，其外貌应该反映某种微妙的异常。

**Hidden Agenda or Secret（隐藏议程或秘密）**：这个字段决定角色是否有叙事深度。见下方详细说明。

**Status（状态）**：「受损（被附身/受影响）」是这类类型中特有的状态，代表一种特殊张力。见下方详细说明。

---

### 角色类型详解

**Colleague/Partner（同事/搭档）**：调查者最近的盟友，也是最可能揭示或隐瞒关键信息的人。最有趣的搭档不是简单的支持者，而是持有不同调查方法论的人——他们的分歧在面对超自然证据时会产生真实的戏剧性张力。

**Suspect（嫌疑人）**：在超自然法证类型中，嫌疑人比标准犯罪小说更复杂：他们可能是真正的施害者，可能是超自然力量的工具，可能是试图掩盖某件事的目击者，也可能是本身就是受害者但证据指向他们。设计嫌疑人时必须有替代性的合理解释。

**Victim (deceased)（受害者·已故）**：已故受害者通过法证证据和他人证词存在于故事中。他们的职业背景、与超自然的关系、以及死亡方式共同构成调查的核心谜题。在超自然法证故事中，「已故」不一定意味着他们不再是叙事力量。

**Victim (survivor)（受害者·幸存者）**：最复杂的受害者类型。他们经历了某种超自然事件并活了下来——但「活下来」的定义需要仔细检视。他们的证词可能是最直接的线索，也可能是最不可靠的叙述来源，因为极度创伤会影响记忆，而超自然接触会影响更多。

**Institutional Obstruction（机构阻挠）**：代表官方对超自然的系统性否认。这类角色通常不是单纯的反派——他们有自己的逻辑：保护公众不知情、维持机构运作、执行来自更高层的命令。最有趣的机构阻挠者是那些自己也知道真相、但选择压制的人。

**Paranormal Informant（超自然线人）**：了解超自然世界运作规则的人——可能是民间传说研究者、退休的机密档案工作人员、或是某个有个人经历的人。他们是调查者进入超自然知识体系的门户，但他们的可信度和动机需要被质疑。

**Entity/Ghost（实体/鬼魂）**：作为角色而非纯粹威胁的非人类存在。见下方专项讨论。

**Mentor（导师）**：曾经处于调查者现在所在位置的人——更有经验，代价也更高昂。导师角色在这类类型中特别有张力：他们的经验使他们有用，他们已经付出的代价使他们令人不安。导师知道调查者将要面对什么，这个知识的重量在每次互动中都是可见的。

**Antagonist（对手）**：不必是「恶人」。可以是一个合理地相信超自然应该被压制的人，一个为了某种目的利用超自然的人，或者一个超自然力量本身（以有组织的方式行动的实体）。

---

### 「与超自然的关系」——核心叙事轴心

这个字段是角色设计中最关键的变量，因为它决定了角色在「知道」与「不知道」之间的位置，而这个位置决定了调查者与他们每次互动的信息动态。

**Aware and accepts it（知晓并接受）**：这些角色是调查者最有价值的资源，也是最令人不安的同伴——因为他们的接受意味着他们已经走过了调查者正在经历的冲击阶段。他们的平静是经验的结果，而那个经验的代价通常清晰可见。

**Aware but denies it（知晓但否认）**：强认知失调状态。这些角色目睹了某些事情，并选择用理性解释来覆盖它——对自己，也对他人。他们是潜在的同盟，如果调查者能突破他们的防御机制。他们的否认通常保护着某个更深的伤口。

**Unwitting participant（不知情的参与者）**：在不知情的情况下卷入超自然事件——可能是载体、触发器或目标。对调查者来说价值极高，因为他们的行为和经历是未经过滤的超自然影响数据。

**Deliberate agent of the supernatural（超自然的主动施为者）**：主动选择为超自然力量服务或利用它。他们的存在揭示了人类与超自然力量之间的主动关系可能性，这通常比纯粹的超自然威胁更令人不安。

**Target/Victim（目标/受害者）**：被超自然力量选中或攻击。他们的案例定义了超自然的运作规则——它如何选择，如何行动，能造成什么。

**No knowledge（毫不知情）**：常规世界的基准线。这些角色的反应——困惑、怀疑、寻求常规解释——是读者视角的锚点，也是对调查者现在所处位置的反衬。

---

### 设计隐藏议程与秘密

「Hidden Agenda or Secret」是将配角从背景角色变为叙事力量的关键字段。设计原则：

**秘密应该与案件和超自然都有关联**：一个简单的个人秘密（婚外情、债务）是充填，不是设计。有力的秘密是这样的：它既解释了角色为什么以特定方式行动，又与案件的超自然核心有直接关系——揭露时同时推进调查并增加复杂性。

**层次化秘密**：最好的支持角色有两层秘密——一个表面秘密（调查者可能早期发现，感觉像突破）和一个更深的秘密（真正的议程，直到故事中期或后期才浮现）。

**秘密的可防御性**：角色应该有合理的理由保守秘密。「他们很邪恶」不是理由。「他们认为这样做能保护某人」、「他们被威胁了」、「他们无法被相信」——这些是可防御的秘密动机。

---

### 实体/鬼魂作为角色

在超自然法证类型中，实体既是调查的对象，也可以是叙事角色。给非人类实体赋予角色深度的方法：

**定义其意图**：不是「危险」（那是功能描述），而是它想要什么。恢复、复仇、完成未竟之事、传递信息、或者某种对人类来说无法完全理解的目的。

**定义其局限性**：无法直接交流，困在特定地点，只能以特定方式行动——局限性创造了谜题，谜题推动调查。

**定义其历史**：它怎么成为现在这个样子的？这个历史通常是案件的核心谜底之一。

**定义其与受害者的关系**：这个关系通常是整个故事的情感核心——是什么将这个实体与当前案件联系在一起。

---

### 「受损」状态的叙事运用

「Compromised (possessed/influenced)」是这个类型独有的角色状态，代表超自然渗透入人类关系网络的方式。

**「受损」角色的设计要点**：
- 受损应该是渐进的，不是突然的翻转。角色在完全受损之前应该有可见的过渡阶段
- 调查者应该有机会察觉迹象——行为异常、不一致的陈述、对某些刺激的异常反应——但这些迹象应该足够模糊，让读者能同时合理解读
- 「受损」状态应该创造信息不对称：受损角色知道调查者不知道的事，但他们的知识是被过滤的——通过超自然力量的视角

---

### 阵容配置建议

**最小可行阵容**（3-4名支持角色）：
- 1名搭档/同事（调查的眼睛）
- 1名超自然线人（进入超自然知识的门户）
- 1名机构阻挠（外部压力）
- 1名目击者/幸存者（案件的人性锚点）

**完整阵容**（6-8名支持角色）：以上加上导师（过去的镜子）、对手（主动阻力）、一名实体角色（超自然核心的人格化）、以及1名「状态未知」角色（持续的谜题）

---

### 常见错误

- 让所有支持角色对超自然持相同态度（应该有光谱）
- 秘密与案件无关（秘密必须推进核心谜题）
- 实体角色只是威胁，没有叙事功能（实体应该是谜题的中心，而非单纯的危险）
- 「受损」状态处理得太突然（渐进性是这个状态的叙事力量所在）
- 职业背景过于模糊（具体的专业细节建立可信度）',
  '## "Character" Generation — Paranormal Forensics Novel

The core design principle of paranormal forensic fiction: every character''s position on the spectrum of paranormal awareness determines their narrative function. The information gap between those who know and those who don''t is one of the genre''s primary engines. Characters are not just people — they are nodes in an epistemological network, each carrying different fragments of the truth about what is happening and why.

---

### Field Generation Guide

Each field is a narrative tool, not merely a character profile entry.

**Name**: Choose names consistent with professional background and cultural context. Forensic investigators exist in institutional worlds — names should feel grounded, not symbolically loaded. The power of this genre comes partly from ordinary people entangled in extraordinary events. A name like "Dr. Rachel Morrow" carries more weight than "Dr. Shadow Nightfall." Reserve unusual names for characters with specific cultural heritage or paranormal significance.

**Role**: Determines the character''s fundamental relationship to the investigation. See the Role Design section below for detailed breakdowns of all nine types.

**Gender**: In forensic investigation contexts, gender often shapes institutional authority dynamics, particularly for Institutional Obstruction and Mentor characters. A female Institutional Obstruction character navigating a male-dominated agency, or a male Paranormal Informant dismissed as mentally unstable — gender affects who gets believed and how pressure is applied.

**Professional Background**: Must be specific enough to establish credibility and substantively connected to the case. Not "police officer" but "fifteen-year veteran of the Violent Crimes Unit, specialist in crime scene reconstruction, recently reassigned after filing an anomalous evidence report that no one could explain." The specificity of professional background establishes the character''s institutional position, which determines what they can access, what they can say officially, and what constraints they operate under.

**Relationship to the Paranormal**: The single most important design axis. See the dedicated section below.

**Connection to the Case**: Answers why this character is here at all — professional mandate, personal history, or involuntary involvement. This field must answer: why does this character''s presence matter to the investigation, and what do they have to lose?

**Personality**: Distill to 2-3 core traits that govern behavior patterns, not a comprehensive personality inventory. Focus on how these traits create friction with their role type and paranormal awareness level. A "by-the-book" trait in an Institutional Obstruction character reads differently than in a Colleague character.

**Physical Description**: Keep it spare and connected to character state. A "Compromised (possessed/influenced)" character should have physical details that suggest subtle wrongness — the quality of their stillness, the direction of their gaze, the timing of their blinks. Not supernatural special effects, but something just slightly off baseline.

**Hidden Agenda or Secret**: This field determines whether the character has narrative depth. See the dedicated section below.

**Status**: "Compromised (possessed/influenced)" is a status unique to this genre, representing supernatural infiltration of the investigator''s human network. The dramatic implications are different from "Deceased" or "Missing."

---

### Role Design: Nine Types and Their Narrative Functions

**Colleague/Partner**: The investigator''s closest ally and, therefore, the most dangerous possible source of betrayal or compromise. The best partner characters do not simply support — they hold a different methodology. A forensic pathologist protagonist paired with a behavioral profiler brings competing frameworks for the same evidence, and in a paranormal investigation, that competition becomes a genuine epistemological conflict. Design the partner''s professional blind spots as carefully as their skills: a blood spatter specialist who refuses to accept wound patterns that physics cannot produce is more interesting than one who converts immediately.

**Suspect**: In paranormal forensic fiction, suspects occupy a more ambiguous position than in standard crime writing. They may be genuine perpetrators. They may be instruments of a paranormal force — acting under influence they do not understand or cannot control. They may be witnesses who know too much and are concealing knowledge for self-protective reasons. They may be victims themselves, with evidence pointing in their direction for reasons that have nothing to do with their guilt. Every suspect should have at least two plausible alternative framings: the conventional interpretation and the paranormal one.

**Victim (deceased)**: The deceased victim exists in the investigation through forensic evidence and others'' testimony. Their professional background, their relationship to the paranormal (who and what they knew), and the specific manner of their death together constitute the investigation''s primary puzzle. In paranormal forensic fiction, "deceased" does not necessarily mean narratively absent — the question of whether the victim''s presence persists, and in what form, is often central. Design the deceased with a full character: what did they know, who did they trust, and what were they afraid of before they died?

**Victim (survivor)**: The most epistemologically complex character type. They experienced a paranormal event and survived — but "survived" requires examination. Their testimony is simultaneously the most direct evidence available and the least reliable narration, because extreme trauma disrupts memory formation, and paranormal contact disrupts more than that. The survivor''s account should contain specific, verifiable details that prove they were present, alongside elements that cannot be reconciled with the physical evidence. This contradiction is the investigation''s engine, not a problem to be explained away.

**Institutional Obstruction**: Represents the system''s systematic denial of the paranormal. These characters are rarely simply obstructionist — they have their own logic: protecting the public from knowledge that would be destabilizing, maintaining institutional function, executing directives from higher authority, or in the most interesting cases, actively managing paranormal phenomena through suppression because they have calculated that suppression is safer than disclosure. The most compelling institutional obstruction character knows the truth and has made a deliberate decision about it. Their antagonism to the investigation is not ignorance — it is informed and purposeful.

**Paranormal Informant**: The gateway into the knowledge system that explains what the investigator is encountering. This might be a folklore researcher who has documented patterns across decades, a retired government archivist with access to classified incident reports, or someone with personal experience who was never believed. Design the informant''s credibility as a narrative variable: what makes them believable? What makes them suspect? The investigator''s relationship with the informant''s reliability should evolve over the story.

**Entity/Ghost**: A non-human presence that functions as a character rather than purely as a threat or phenomenon. See the dedicated section on Entity/Ghost character design below.

**Mentor**: Someone who has been where the investigator is now — more experienced, more damaged, carrying the weight of what that experience cost them. The mentor''s narrative function in paranormal forensic fiction is both resource and warning: they can teach the investigator what to look for, how to survive the institutional pressures, how to work with evidence that the system denies exists. But their very existence is a demonstration of what this path does to a person over time. Every interaction with the mentor should carry the ghost of what they lost.

**Antagonist**: Not necessarily a villain in the moral sense. The most interesting antagonists in this genre are people who are right about something: that the paranormal should be contained, that some investigations are too dangerous to complete, that the investigator''s methods put others at risk. The antagonist might be pursuing a goal that is genuinely reasonable — the moral complexity lies in the methods and the information they are suppressing.

---

### "Relationship to the Paranormal" — The Defining Character Axis

This field determines every character''s position in the epistemological structure of the story. The drama of paranormal forensic fiction is built on information differential — who knows what, at what cost, and how that shapes what they will and will not do.

**Aware and accepts it**: These characters have resolved the cognitive dissonance that is still destroying the investigator. Their acceptance is the product of experience, and that experience''s cost is typically visible in how they carry themselves — a quality of deliberate calm, a tendency to avoid certain topics, a way of looking at things that suggests they are seeing more than they acknowledge. They are the investigator''s most valuable resource and most unsettling companions simultaneously.

**Aware but denies it**: Active cognitive dissonance. These characters witnessed something and have made the decision to cover it with a rational explanation — for their own stability, for institutional survival, or to protect someone else. Their denial is performative and effortful; careful observation reveals its seams. They are potentially the investigation''s most important converts, because their shift from denial to acceptance (if it comes) carries the weight of someone who has been fighting against belief for a long time.

**Unwitting participant**: Involuntarily entangled in the paranormal event without knowing it — a carrier, a trigger, or a target. Their value to the investigator is precisely their unfiltered status: their behavior and experiences represent paranormal influence data uncorrupted by awareness or deliberate concealment. The challenge is that they will resist interpretations of their experience that require accepting what they cannot believe.

**Deliberate agent of the supernatural**: Has made an active choice to serve or leverage paranormal forces. This character type is often more disturbing than the supernatural entity itself, because it reveals the possibility of human agency in alignment with what the investigation is trying to stop. Their motivations are crucial: desperation, ideology, calculated exchange, or something that made sense at the time and now cannot be undone.

**Target/Victim**: Defined by selection — something chose them, and understanding why defines the paranormal''s rules of operation. Their case answers questions the investigator needs: how does it choose, what does it want, what does exposure to it produce? The target/victim''s experience is evidence in the forensic sense.

**No knowledge**: The baseline of the ordinary world. These characters react to anomalous information the way most people would — with discomfort, disbelief, and a search for conventional explanations. Their reactions calibrate the reader''s sense of what the paranormal is actually costing the investigator in terms of distance from ordinary human experience.

---

### Designing the Hidden Agenda and Secret

The "Hidden Agenda or Secret" field transforms a supporting character from background presence to narrative force. Design principles:

**The secret must connect to both the case and the supernatural**: A purely personal secret (an affair, a debt) is filler. A powerful secret does double work: it explains why the character behaves in specific ways that have been visible from the beginning, and when revealed, it simultaneously advances the investigation and complicates it. The revelation should feel both surprising and retrospectively inevitable.

**Layer the secrets**: The most effective supporting characters carry two levels of concealment — a surface secret the investigator can discover relatively early (which feels like a breakthrough but is actually misdirection) and a deeper secret that emerges only when the story needs it most. The surface secret should be real; it just should not be the whole truth.

**The secret must be defensible**: Characters should have coherent reasons for their concealment. Not "they are evil" but "they were threatened," "they calculated that disclosure would cause more harm than suppression," "they cannot be believed and know it," "someone they love is implicated." The logic of the concealment, when revealed, should make the character''s behavior throughout the story make sense in a new way.

---

### The Entity/Ghost as a Character

Non-human presences in paranormal forensic fiction can carry genuine character depth if designed with intent:

**Define its desire**: Not "dangerous" (that is a functional description, not a character description) but what it wants. Completion of something interrupted. Transmission of information that has not reached the right person. Restoration of something taken. A purpose that may not be fully comprehensible in human terms, but which has internal consistency. The desire gives the entity a direction that the investigator can work with or against.

**Define its constraints**: What it cannot do determines its narrative function as a puzzle generator. Limited to a specific location. Limited to a specific method of communication. Limited to manifesting under specific conditions. Constraints create the investigative challenge — understanding the constraints is part of solving the case.

**Define its history**: How did it become what it is? This history is usually one of the case''s central revelations, and designing it carefully means the revelation will feel earned.

**Define its relationship to the current victims**: The connection between the entity and the present case is usually the story''s emotional spine — the link between what happened then and what is happening now.

---

### The "Compromised" Status and Its Narrative Use

"Compromised (possessed/influenced)" is a status unique to paranormal forensic fiction, representing the terrifying possibility that the investigator''s own human network has been infiltrated by what they are investigating.

**Designing compromised characters**:
- Compromise should be gradual, not a sudden flip. There should be a visible transition period with ambiguous behavioral signals before full compromise becomes clear
- The investigator should have opportunities to notice the signs — behavioral inconsistency, anomalous responses to specific stimuli, subtle errors in judgment that are out of character — but these signals should be ambiguous enough to support multiple explanations
- The compromised character''s knowledge creates a specific kind of information hazard: they know things the investigator does not, but that knowledge has been filtered through the entity''s perspective and intentions

---

### Cast Composition Recommendations

**Minimum viable cast** (3-4 supporting characters):
- 1 Colleague/Partner (investigative perspective and friction)
- 1 Paranormal Informant (access to the explanatory framework)
- 1 Institutional Obstruction (external pressure and the system''s logic)
- 1 Victim/Survivor (the human cost of the case)

**Full cast** (6-8 supporting characters):
The above plus: a Mentor (mirror of the future), an Antagonist (active resistance), one Entity character (personification of the case''s supernatural core), and one character whose Status remains Unknown throughout (sustained tension).

---

### Common Mistakes

- Making all supporting characters hold the same attitude toward the paranormal: the spectrum of awareness is the drama''s engine
- Designing secrets with no connection to the case''s paranormal core: secrets must advance the investigation''s central mystery
- Treating entity characters as only threats without narrative function: the entity is the puzzle''s center, not just its danger
- Implementing "Compromised" status as a sudden reversal: gradual compromise is where the real horror lives
- Keeping professional backgrounds generic: specific professional details establish the institutional credibility that makes paranormal discovery meaningful',
  (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1),
  1,
  30,
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
