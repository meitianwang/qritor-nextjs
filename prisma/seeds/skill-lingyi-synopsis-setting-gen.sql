-- 民间灵异故事创作「小说梗概」设定生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-lingyi-synopsis-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'lingyi-synopsis-setting-gen',
  '「小说梗概」设定生成：为民间灵异故事生成故事梗概，涵盖起因、发展、高潮、结局，点明核心灵异事件与因果关系',
  '"Novel Synopsis" setting generation: generate story synopsis for Chinese folk horror stories, covering cause, development, climax, and ending, identifying core supernatural events and karmic relationships',
  '## 「小说梗概」设定生成 — 民间灵异故事创作

「小说梗概」是 singleton 类型的 setting，只有一个字段：**故事梗概**。它是整个故事的骨架，所有后续设定（角色、场景、章节、道具）都以梗概为蓝本展开。

---

### 字段生成指南

#### 故事梗概

用 300-500 字概括整个故事的起因、经过、高潮、结局。

**核心要求**：
1. **必须点明核心灵异事件**：故事的恐怖核心是什么？是冥婚索命、风水局反噬、还是祖坟被动引发的诅咒？
2. **必须揭示因果关系**：一切灵异都有前因。谁做了什么、欠下了什么、导致了什么——因果链条必须清晰
3. **必须包含主要角色的命运走向**：主角如何卷入、术士如何介入、鬼怪的执念是什么、最终谁付出了代价

**生成模板**：
```
[时间+地点] + [触发事件] + [主角卷入方式]
→ [初步调查/经历] + [发现的禁忌和规则]
→ [真相逐步揭露] + [因果链条浮现]
→ [最终对抗/化解] + [结局与余韵]
```

**模板展开说明**：

**第一段（起因）**：交代时间地点，描述触发灵异事件的导火索。主角因何种原因（返乡、工作、好奇、被迫）来到事发地点，第一次遭遇异常现象。

**第二段（发展）**：主角从被动经历转为主动调查。在这个过程中逐渐发现当地的禁忌规则，遇到知情者或术士。有角色因违反禁忌而遭殃，灵异活动逐渐升级。

**第三段（高潮）**：完整的因果链条浮出水面——往往是一个令人唏嘘的悲剧真相。灵异活动达到最高强度，角色面临最大的道德/生存抉择。

**第四段（结局）**：最终的对抗或化解方式，必须有人承担代价。结尾留下适当的余韵——最好的结局不是「从此平安」，而是留下一丝不安的回味。

---

### 生成要点

- 梗概必须体现民间灵异的核心特征：因果报应、民俗禁忌、风水玄学
- 灵异事件不能是无缘无故的，必须有明确的因果源头
- 主要角色的命运走向要清晰，尤其是主角的状态变化轨迹（理性质疑→亲身经历→信仰崩塌→接受现实→直面恐惧）
- 梗概中应暗示五幕结构的节奏：日常生活→初次异常→深入调查→真相揭露→终极对抗
- 结局不能草率——化解灵异必须有代价，因果了结必须有重量感
- 300-500 字的篇幅需要高度凝练，每一句都要推进叙事',
  '## "Novel Synopsis" Setting Generation — Chinese Folk Horror Story

The "Novel Synopsis" is a singleton setting type with a single field: **Story Synopsis** (故事梗概). It is the skeleton of the entire story; all subsequent settings (characters, scenes, chapters, props) expand based on this synopsis.

---

### Field Generation Guide

#### Story Synopsis

Summarize the entire story''s cause, development, climax, and ending in 300-500 words.

**Core requirements**:
1. **Must identify the core supernatural event**: What is the horror core of the story? Ghost marriage claiming lives, feng shui formation backfire, or a curse triggered by disturbing ancestral graves?
2. **Must reveal the karmic relationship**: All supernatural events have prior causes. Who did what, owed what, caused what -- the karmic chain must be clear
3. **Must include fate trajectories of major characters**: How the protagonist gets involved, how the practitioner intervenes, what the ghost''s obsession is, and who ultimately pays the price

**Generation template**:
```
[Time + place] + [Triggering event] + [How protagonist gets involved]
→ [Initial investigation/experiences] + [Taboos and rules discovered]
→ [Truth gradually revealed] + [Karmic chain emerges]
→ [Final confrontation/resolution] + [Ending and aftertaste]
```

**Template expansion**:

**First paragraph (cause)**: Establish time and place, describe the trigger for the supernatural event. Why the protagonist comes to the location (returning home, work, curiosity, coercion), and their first encounter with anomalous phenomena.

**Second paragraph (development)**: The protagonist shifts from passive experience to active investigation. During this process, they gradually discover local taboo rules, meet informants or practitioners. A character suffers for violating taboos; supernatural activity gradually escalates.

**Third paragraph (climax)**: The complete karmic chain surfaces -- often a heartbreaking tragic truth. Supernatural activity reaches maximum intensity; characters face their greatest moral/survival dilemma.

**Fourth paragraph (ending)**: The final confrontation or resolution method; someone must bear the cost. The ending leaves appropriate aftertaste -- the best endings are not "peace thereafter" but leave a trace of lingering unease.

---

### Generation Notes

- The synopsis must embody folk horror''s core features: karmic retribution, folk taboos, feng shui metaphysics
- Supernatural events cannot be without cause; there must be a clear karmic source
- Major characters'' fate trajectories must be clear, especially the protagonist''s state change trajectory (rational skepticism → personal experience → faith collapse → acceptance → facing the horror)
- The synopsis should hint at the five-act structure rhythm: daily life → first anomaly → deep investigation → truth revealed → ultimate confrontation
- The ending cannot be rushed -- resolving the supernatural must have a cost; karmic closure must carry weight
- The 300-500 word length requires high conciseness; every sentence must advance the narrative',
  (SELECT id FROM novel_creation_method WHERE name = '民间灵异故事创作' LIMIT 1),
  1,
  71,
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
