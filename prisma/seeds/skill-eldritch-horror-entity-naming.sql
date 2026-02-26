-- The Eldritch Horror Novel "Entity Naming" skill (Layer 3)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-eldritch-horror-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'eldritch-horror-entity-naming',
  '实体命名：为 The Eldritch Horror Novel 提供各类实体、地点、邪典、禁忌文本的命名指导，设计有「宇宙感」的名称',
  'Entity naming: naming guidance for The Eldritch Horror Novel, covering how to name cosmic entities, locations, cults, and forbidden texts with authentic cosmic resonance',
  '## 实体命名 — The Eldritch Horror Novel

洛夫克拉夫特式命名美学的核心：**名称应该制造无法言说的感觉**。好的名称在读者理解它意味着什么之前就已经制造了恐惧。

---

### 宇宙实体命名

好的实体名称特征：
- 音节组合陌生（不符合任何常见语言的发音规则）
- 字形看起来「不对」（如：Yog-Sothoth、Nyarlathotep、R''lyeh）
- 有多个发音方式，且所有人对正确发音意见不一
- 读出来时有一种不自在感
- 无法被轻易缩写或昵称化（一旦被昵称化，恐惧感消散）

技术方法：从不同语系各取2-3个音节组合；加入英语中不存在的音素（用撇号暗示）；确保名称无法解析为任何常见词汇；存在多种拼写变体（暗示名称超出任何单一语言的捕捉能力）。

---

### 地点命名

- 使用古老音素：''kh''、''ath''、''yn''、''ul''、''arh''
- 参考真实古地名但加以扭曲：改变元音、重排辅音、加入哑字母
- 地名应暗示地方的性质而不明说：「Inn''s mouth」比「恐惧之地」好，因为「Inn」是日常的而「s-mouth」是微妙错误的
- 水体（河流、海洋）的名称尤其应该有「不对」的感觉

---

### 邪典命名

两种主要策略：
1. **表面合法名**：伪装成普通社会组织（慈善团体、文化协会、学术学会）——「大衮神秘修会」之所以有效，是因为「修会」听起来像真实的宗教术语
2. **古典语言名**：拉丁文或希腊文命名，但选择与门槛、深渊、变形相关的词汇，而非明显邪恶的词汇

目标：让人无法确定「这是虚构的还是真实存在的」。

---

### 禁忌文本命名

参考真实神秘学文献命名惯例：
- 描述性拉丁标题（Necronomicon = 死亡之书）
- 地理/作者归因（The Pnakotic Manuscripts）
- 功能描述（The Book of Eibon）

文本名称应该听起来像真实的小众古籍——图书管理员可能会认为它被错误归档在真实档案馆里的那种。',
  '## Entity Naming — The Eldritch Horror Novel

Lovecraftian naming operates on the principle that **the right name creates dread before the reader knows why**. Names are not just labels — they are the first encounter with the entity, the location, or the text. A well-designed name should feel partially familiar and deeply wrong simultaneously.

---

### Cosmic Entity Naming

The Lovecraftian convention establishes recognizable patterns: consonant clusters that violate standard English phonology, apostrophes that suggest a sound with no English equivalent, combinations of letters that could be from multiple real languages but follow none of them.

**Technical approach**:
- Start with a combination of 2-3 syllables that each come from different language families
- Add a phoneme that does not exist in common languages (the apostrophe in "Yog-Sothoth" suggests a glottal stop)
- Ensure the name cannot be easily nicknamed or shortened — Lovecraftian names resist casualization. You cannot call Nyarlathotep "Nyarla" without some of the dread evaporating
- The name should feel unfinished or unstable — like it doesn''t quite resolve into a complete sound
- Consider names that sound like they are describing something in a language no living person speaks
- Variant spellings should exist within the text (different cults, different scholars transliterate differently) — this suggests the name exists in a reality beyond any single language''s ability to capture it

**Examples of what works and why**:
- *Nyarlathotep* — multiple stress patterns possible, "hotep" suggests Ancient Egyptian but the prefix "Nyarla" belongs to nothing; no natural shortening
- *Yog-Sothoth* — the hyphen suggests two components that are grammatically bound but phonologically separate; sounds like it might be a title or epithet in a lost grammar
- *R''lyeh* — the apostrophe before a consonant cluster creates a sound that has no standard English representation; the name looks wrong even before you try to say it

---

### Location Naming

- Use archaic phonemes: "kh," "ath," "yn," "ul," "arh" — these feel ancient without belonging to any specific language
- Model on real archaic place names (Anglesey, Ur, Persepolis) but corrupt them: change vowels, rearrange consonants, add silent letters
- The location name should suggest something about the place''s nature without explicitly stating it: "Dread" and "Mist" are too obvious; "Innsmouth" is perfect because "Inn" is mundane and "s-mouth" is subtly wrong
- Names of bodies of water should feel especially wrong — rivers and seas in Lovecraftian settings often have names that sound like they are describing something that is not water
- Consider names that could be explained as corrupted versions of older regional place names — this embeds them in a suggested history

---

### Cult Naming

**Surface-legitimate names**: The cult presents itself as a cultural society, an academic institution, a charitable organization, or a philosophical society. "The Esoteric Order of Dagon" works because "order" and "esoteric" sound like authentic religious terminology — only "Dagon" is the tell. The cult name should be something a local historian could plausibly find in 19th-century records.

**Classical language naming**: Latin and Greek provide gravitas and obscurity. Choose words that have meanings related to thresholds, depths, and transformation rather than explicitly evil terms.
- NOT: "Brotherhood of Darkness" (too direct, no deniability)
- YES: "The Threshold Society," "The Abyssal Studies Foundation," "The Pelagic Archive" (each sounds like it could be a real academic or cultural organization)

**Regional/ethnic embedding**: Old families and longstanding cults often have names that suggest specific geographical or ethnic origin — they feel embedded in a real history rather than invented for sinister purposes. A cult that has existed for three hundred years in a coastal New England town will have a name that sounds like it belongs to that specific geography.

---

### Forbidden Text Naming

Model on real occult text naming conventions:
- **Descriptive Latin titles**: *Necronomicon* = "Book of Dead Names" — sounds like a real grimoire title; the Latin is slightly wrong in a way that suggests it was coined by someone who was not a native Latinist
- **Geographic/author attribution**: *The Pnakotic Manuscripts*, *The R''lyeh Text* — names that suggest specific provenance without explaining what the texts contain
- **Function-description**: *The Book of Eibon*, *The Revelations of Glaaki* — titles that name an authority without explaining what the authority knew

**The text name should sound like it could be a real obscure manuscript** — something a librarian might believe had been misfiled in a real archive. The goal is plausibility, not drama. An overly dramatic title ("The Tome of Ultimate Darkness") signals fiction; a title that sounds like it belongs in a real catalog of medieval manuscripts signals something more unsettling.

**Consider the implications of there being a text** — someone wrote this, someone preserved it, someone knew it was dangerous and kept it anyway. The name should carry the weight of that history: the suggestion of a long, complicated, and ultimately tragic chain of custodianship.

---

### The Unifying Principle

Whether naming an entity, a location, a cult, or a text, the goal is the same: **the name should make the reader unable to determine whether this is invented or whether it might, in some obscure archive or half-forgotten tradition, actually exist**. The reader should feel slightly uncertain. That uncertainty is the first foothold of cosmic dread.',

  (SELECT id FROM novel_creation_method WHERE name = 'The Eldritch Horror Novel' LIMIT 1),
  1,
  36,
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
