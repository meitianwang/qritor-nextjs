-- 异世界玄幻穿越小说「情节设计」领域知识技能（Layer 3）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-xuanhuan-crossing-plot-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xuanhuan-crossing-plot-gen',
  '「情节设计」领域知识：为异世界玄幻穿越小说提供剧情设计指导，涵盖实力等级递进、血脉觉醒、势力争霸、远古预言等典型剧情模式',
  '"Plot Design" domain knowledge: plot design guidance for xuanhuan crossing novels, covering power level progression, bloodline awakening, faction conquest, and ancient prophecy plot patterns',
  '## 「情节设计」领域知识 — 异世界玄幻穿越小说

玄幻穿越小说的剧情核心是**穿越者在充满奇幻元素的异世界中的实力成长与势力争霸**。与修真不同，玄幻世界的设定更自由，不受传统道家修炼体系约束，可以有血脉、魔法、斗气、元素等多种力量体系。

剧情设计的关键在于：实力等级的递进感（每次升级都要开辟新的舞台和对手）、势力争霸的规模递增（从学院到城邦到帝国到大陆到更高位面）、以及远古设定的逐步揭示（血脉来源、世界本质等）。

---

### 典型故事结构

玄幻穿越小说通常遵循"升级—扩大舞台"的螺旋递进结构：

| 阶段 | 章节占比 | 核心任务 | 典型事件类型 |
|------|---------|---------|-------------|
| **觉醒期** | 10-15% | 穿越、发现能力、建立初步人设 | 普通事件为主 |
| **学院/势力初期** | 15-20% | 在小范围内崭露头角 | 普通 + 转折 |
| **大陆争霸期** | 30-35% | 参与跨势力的大规模冲突 | 转折 + 高潮 + 伏笔 |
| **远古秘辛期** | 15-20% | 揭示世界的终极秘密 | 高潮 + 转折 |
| **终极对决期** | 10-15% | 与最终 BOSS 的决战 | 结局为主 |

**舞台递进**：家族/学院 → 城邦/王国 → 帝国 → 大陆 → 位面/宇宙。每次升级都对应更大的舞台。

---

### 故事线模式

#### 主线（通常 1 条）

- **争霸线**：从底层崛起，逐步称霸（最经典的玄幻模式）
- **血脉觉醒线**：解锁封印的远古血脉，追寻血脉来源的真相
- **使命线**：被选中执行某个远古预言或使命
- **复仇线**：为家族/宗门的覆灭复仇

#### 常见支线

| 支线类型 | 说明 | 与主线的关系 |
|---------|------|-------------|
| **实力升级线** | 修炼突破、获得新能力 | 主角实力成长的节奏线 |
| **感情线** | 后宫或一对一的感情发展 | 情感动力和战斗动力 |
| **势力建设线** | 建立自己的势力/组织 | 中后期的重要资源和舞台 |
| **血脉/身世线** | 远古血脉的逐步觉醒和真相 | 中后期的关键转折来源 |
| **宝物/传承线** | 追寻上古强者的传承 | 实力突破的关键节点 |
| **同伴成长线** | 核心同伴的实力和故事发展 | 丰富群像，分担战斗压力 |

---

### 事件编排模式

#### 觉醒期

- **穿越事件**：穿越到废物/天才陨落的身体中
- **能力发现**：发现金手指或觉醒特殊血脉
- **初战成名**：打脸看不起自己的人（"退婚流"、"废物逆袭"等经典开局）
- **获得引路人**：老爷爷（戒指里的灵魂）、系统、神秘传承等
- 事件重要度：2-4

#### 学院/势力初期

- **进入新舞台**：加入学院/家族/势力
- **天才对决**：与同辈天才的比试和竞争
- **赢得认可**：在比武/考核中证明自己
- **暗流涌动**：更大势力开始关注主角
- 事件重要度：2-4

#### 大陆争霸期

- **势力级冲突**：代表己方势力参与大规模战争
- **血脉/能力升级**：关键时刻的实力突破
- **远古线索出现**：发现关于世界本质的线索
- **强敌连番**：越来越强的对手轮番出场
- **盟友与背叛**：势力间的合纵连横
- 事件重要度：3-5

#### 远古秘辛期

- **真相揭示**：世界的创造者、远古大战、被封印的存在
- **血脉觉醒完成**：血脉真正力量的全面释放
- **新层次敌人**：位面级或更高级别的反派登场
- **前期伏笔大回收**
- 事件重要度：4-5

#### 终极对决期

- **最终决战**：与终极反派的决战
- **牺牲与觉悟**：可能需要付出的代价
- **所有伏笔闭环**
- **世界新秩序**：胜利后的世界格局
- 事件重要度：5

---

### 伏笔策略

#### 常用伏笔类型

| 伏笔类型 | 说明 | 埋设时机 | 回收时机 |
|---------|------|---------|---------|
| **血脉暗线** | 血脉的真正来源和隐藏力量 | 觉醒期 | 远古秘辛期 |
| **远古预言** | 预言中提到的"命运之人"或"灾劫" | 学院初期 | 大陆争霸或终极对决 |
| **封印线索** | 世界中被封印的远古存在 | 大陆争霸期 | 远古秘辛期 |
| **老爷爷身份** | 引路人/系统的真实身份和目的 | 觉醒期 | 远古秘辛或终极对决 |
| **势力暗线** | 表面友善的势力实际有隐藏目的 | 学院初期 | 大陆争霸期 |

#### 玄幻特有的伏笔技巧

- **等级递进揭秘**：每到新的实力层次就揭示一层新信息，让读者始终有期待
- **远古战场/遗迹**：每次探索遗迹都获得关于远古大战的碎片信息
- **实力天花板暗示**：当前最强者的实力暗示着更高层次的存在

---

### 常见错误

1. **舞台递进太快**：刚在学院站稳就跳到大陆级冲突，缺乏过渡
2. **打脸模式固化**：每到新环境都是"被看不起→打脸→获得尊重"的重复
3. **实力体系崩塌**：前期设定的实力等级后期不断被超越，等级变得无意义
4. **配角沦为背景**：主角实力增长太快，早期同伴完全跟不上
5. **远古设定过度**：远古强者、远古血脉、远古预言堆砌过多，缺乏新意
6. **势力建设虎头蛇尾**：建立势力后缺乏管理细节，势力存在感薄弱
7. **感情线敷衍**：后宫角色缺乏独立个性，沦为主角的附属品',
  '## "Plot Design" Domain Knowledge — Xuanhuan Crossing Novels

The core of xuanhuan crossing novel plots is the **transmigrator''s power growth and faction conquest in a fantasy world filled with extraordinary elements**. Unlike cultivation novels, xuanhuan worlds have freer settings, not bound by traditional Daoist cultivation systems, and can feature bloodlines, magic, battle qi, elements, and other power systems.

The key to plot design: the sense of power level progression (each upgrade opens new arenas and opponents), escalating scope of faction struggles (from academy to city-state to empire to continent to higher planes), and gradual revelation of ancient lore (bloodline origins, world essence, etc.).

---

### Typical Story Structure

| Phase | Chapter Ratio | Core Task | Typical Event Types |
|-------|--------------|-----------|-------------------|
| **Awakening** | 10-15% | Transmigration, discover abilities, establish persona | Mostly normal events |
| **Academy/Early Faction** | 15-20% | Stand out in a small arena | Normal + turning points |
| **Continental Conquest** | 30-35% | Participate in cross-faction large-scale conflicts | Turning points + climax + foreshadowing |
| **Ancient Secrets** | 15-20% | Reveal the world''s ultimate secrets | Climax + turning points |
| **Final Showdown** | 10-15% | Final battle with ultimate antagonist | Mostly resolution events |

**Stage progression**: Family/Academy → City/Kingdom → Empire → Continent → Planes/Universe.

---

### Story Line Patterns

#### Main Line (typically 1)
- **Conquest arc**: Rising from the bottom to dominance (classic xuanhuan pattern)
- **Bloodline awakening arc**: Unlocking sealed ancient bloodline, pursuing the truth of its origin
- **Destiny arc**: Chosen to fulfill an ancient prophecy or mission
- **Revenge arc**: Avenging the destruction of family/sect

#### Common Branch Lines

| Branch Type | Description | Relationship to Main Line |
|------------|-------------|--------------------------|
| **Power progression** | Cultivation breakthroughs, new abilities | Rhythm of protagonist''s strength growth |
| **Romance** | Harem or one-on-one development | Emotional and combat motivation |
| **Faction building** | Establishing own force/organization | Important resource and stage in later periods |
| **Bloodline/origin** | Gradual awakening and truth of ancient bloodline | Key turning point source in later stages |
| **Treasure/inheritance** | Seeking ancient powerhouse legacies | Key nodes for power breakthroughs |
| **Companion growth** | Core companions'' power and story development | Enriches ensemble, shares battle burden |

---

### Event Arrangement Patterns

#### Awakening
- Transmigration: arriving in a waste/fallen genius body
- Ability discovery: finding golden finger or awakening special bloodline
- First fame: face-slapping those who looked down on protagonist
- Obtaining a guide: old grandpa in ring, system, mysterious inheritance
- Importance: 2-4

#### Academy/Early Faction
- Entering new stage: joining academy/family/faction
- Genius duels: contests with peer geniuses
- Winning recognition: proving self in tournaments/assessments
- Undercurrents: larger forces begin noticing protagonist
- Importance: 2-4

#### Continental Conquest
- Faction-level conflict: representing own faction in large-scale war
- Bloodline/ability upgrade: power breakthrough at critical moment
- Ancient clues appear: discovering clues about world''s nature
- Sequential strong enemies: increasingly powerful opponents
- Alliances and betrayals
- Importance: 3-5

#### Ancient Secrets
- Truth revealed: world creators, ancient wars, sealed beings
- Bloodline fully awakened: complete release of true bloodline power
- New level enemies: planar or higher-level antagonists
- Mass early foreshadow resolution
- Importance: 4-5

#### Final Showdown
- Ultimate battle with final antagonist
- Sacrifice and resolve: potential costs
- All foreshadows closed
- New world order after victory
- Importance: 5

---

### Foreshadow Strategy

| Type | Description | Planting | Resolution |
|------|-------------|----------|------------|
| **Bloodline secrets** | True origin and hidden power of bloodline | Awakening | Ancient Secrets |
| **Ancient prophecy** | "Chosen one" or "calamity" mentioned in prophecy | Early Academy | Conquest or Final |
| **Seal clues** | Sealed ancient beings in the world | Conquest | Ancient Secrets |
| **Guide''s identity** | True identity and purpose of mentor/system | Awakening | Ancient Secrets or Final |
| **Faction hidden agenda** | Seemingly friendly factions with hidden purposes | Early Academy | Conquest |

---

### Common Mistakes

1. **Stage progression too fast**: Jumping to continental conflict right after establishing in academy
2. **Fixed face-slapping pattern**: Repetitive "looked down upon → face-slap → earn respect" cycle
3. **Power system collapse**: Early-established power levels constantly surpassed, levels become meaningless
4. **Side characters become background**: Protagonist grows too fast, early companions cannot keep up
5. **Ancient lore overload**: Too many ancient powerhouses, bloodlines, prophecies piled up
6. **Faction building neglected**: Lacking management details after establishing faction
7. **Shallow romance**: Harem characters lack independent personalities, becoming protagonist accessories',

  (SELECT id FROM novel_creation_method WHERE name = '异世界玄幻穿越小说' LIMIT 1),
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
