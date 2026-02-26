-- 凶宅灵异租房「角色」生成技能（Layer 3）
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-xiongzhai-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiongzhai-character-gen',
  '凶宅灵异租房小说角色生成：从当前租客到前任租客，从知情的邻居到神秘的房东，设计这间凶宅里的生者与死者',
  'Haunted rental horror character generation: from current tenant to previous tenants, from knowing neighbors to mysterious landlords — design the living and the dead in this haunted apartment',
  '## 角色生成 — 凶宅灵异租房小说创作

凶宅流的角色设计核心问题不是"这个角色有什么能力"，而是**"这个角色知道多少，选择说多少，以及这个落差背后是什么"**。每一个出现在这间房周围的人，都与这间房的秘密有某种关联——区别只在于他们是受害者、知情者、还是参与者。

---

### 角色定位的叙事功能

#### 主角（当前租客）

主角是读者的替身——他的处境要足够真实，让读者相信"我也可能在那个处境下租了这间房"：

**主角设计的核心问题**：
- **为什么他非要租这间房？** （经济压力是最可信的理由；如果有其他理由，需要给出具体的情节支撑）
- **他对超自然现象的初始态度是什么？** （理性主义者→否认→不得不接受的心理蜕变比一开始就相信更有戏剧张力）
- **他有没有"必须留下来"的外部压力？** （租约未到期、押金退不了、工作必须住在附近——这些是"为什么不跑"的现实锚点）

**主角的功能类型**：

| 功能类型 | 叙事特点 | 适合的故事走向 |
|---------|---------|------------|
| **调查者型**（主动查明真相） | 故事推进靠主角的主动行动；恐惧和发现同步 | 真相揭露主导型 |
| **生存者型**（目标是活下去，不是查真相） | 节奏更紧张；每一章都是主角在恐惧中应对 | 智斗主导型 |
| **情感共鸣型**（与厉鬼产生情感联结） | 从恐惧转向悲悯；故事有温度 | 悲剧/和解结局 |
| **被选中型**（主角的到来不是偶然） | 命定感；主角的背景与凶宅历史有隐藏联结 | 秘密揭露型 |

**主角性格特征设计要点**：
- 主角在恐惧处境中的反应要与性格一致（胆小型：逃避→被迫面对；理性型：否认→重新建立认知框架；感性型：共情→危险的靠近）
- 主角的性格缺陷在恐惧处境中会被放大——这个缺陷最好是"在日常生活中可理解的缺陷，在恐惧中变成致命问题"

#### 邻居（知情者/同情者/威胁）

邻居是凶宅流中最多功能的次要角色：

| 邻居类型 | 行为模式 | 叙事功能 |
|---------|---------|---------|
| **沉默的知情者** | 看到主角搬入时有明显的不安表情，之后刻意回避 | 主角意识到"连邻居都知道这间房有问题" |
| **主动同情者** | 主动提醒主角，但说得含糊（"这间房不太好……你最好小心一点"） | 提供部分信息，建立主角外部支持者 |
| **过于正常的邻居** | 对主角的任何暗示凶宅有问题的言论都用正常解释回应 | 让主角怀疑自己是否正在失去理智 |
| **也是受害者** | 邻居本身也受到某种影响，但比主角更早、更深 | 展示主角如果继续住下去的"前景" |

**邻居的信息管理**：邻居知道的信息要比他说的多——这个落差是驱动主角调查的动力。邻居不说的原因可以是恐惧、是规避责任、是和房东有某种协议。

#### 房东（信息掌控者）

房东是凶宅流中最重要的"活人谜团"：

**房东设计的核心问题**：
- **他/她知道多少？** （他知道死亡历史→但不知道厉鬼真相 / 他知道全部→在刻意利用 / 他知道但否认→心理防御机制）
- **他/她为什么继续出租？** （经济压力、法律无法不出租、某种不为人知的目的）
- **他/她对主角有什么态度？** （真实的同情？利用？监视？）

**房东的出场节奏**：
- 前期：神秘或缺席——读者和主角都在推测
- 中期：至少一次直接接触——提供一些信息，但带来更多疑问
- 后期：角色揭示——房东是帮手、是共谋、还是也是受害者

#### 前任租客（已死亡或失踪）

前任租客是凶宅流中最独特的角色类型——**他们不在场，但他们的存在渗透整个故事**：

**前任租客的信息层次**：
```
表面层（主角入住前就能知道的）：
  - 名字（如果能查到）、大致年龄、死亡/失踪的时间和方式

调查层（主角翻遍房间才能拼凑的）：
  - 日记残页暗示的日常生活、照片中出现的人、他们留下的物品

情感层（最后才揭示的）：
  - 为什么他们来这里、他们经历了什么、他们最后时刻的真实状态
```

**前任租客的叙事功能**：
- 前任租客的命运是主角命运的**预警镜子**
- 通过前任租客的遗留物，主角逐渐重建一个死去的人的最后日子——这本身是一种恐惧（也是一种悲悯）
- 如果使用双线叙事，前任租客线要有独立的完整性，不只是"主角调查对象"

#### 主角的现实联系人（朋友/家人）

联系人的叙事功能是**建立外部世界与凶宅的对比**：

- 外部世界的朋友/家人是"正常生活"的代表——他们无法理解主角的处境
- 每次主角和他们通话/见面，都是"主角还没有彻底陷入凶宅"的时刻
- 随着故事进行，主角与外部世界的联系会越来越稀薄——这本身是一种恐惧

**设计要点**：联系人不要只是"给主角传递信息的工具人"——他/她也应该有自己的立场（担心主角、不相信主角、试图劝主角搬走但被拒绝）

#### 神秘调查者（记者/道士/警察）

调查者是凶宅流中可选的高信息密度角色：

| 调查者类型 | 叙事功能 | 使用建议 |
|---------|---------|---------|
| **记者** | 带来凶宅的公开历史记录；可能知道之前报道的案例 | 适合真相揭露主导型故事；信息来源可信但不完整 |
| **道士/灵媒** | 直接与灵界沟通；带来关于厉鬼性质的信息 | 要谨慎使用——过早解释超自然部分会减少恐惧 |
| **警察** | 过去案件的记录持有者；法律视角下的死亡历史 | 适合调查-现实交织的故事；警方档案是一种可信的信息来源 |

**设计警告**：调查者要带来更多问题，而不是解答问题——"我查过了，真相是X"会过早结束读者的猜测参与。

---

### 角色阵容的整体设计

**建议阵容（中长篇）**：
- 1 个主角（功能类型清晰）
- 1-2 个邻居（一个沉默知情，一个过于正常）
- 1 个房东（神秘/缺席型效果最佳）
- 1-2 个前任租客（信息逐层揭露）
- 1-2 个外部联系人（建立与外部世界的联结）
- 0-1 个调查者（可选；过多会稀释恐惧密度）

---

### 常见错误

1. **主角只会害怕**：主角在恐惧中没有任何主动行动——他需要做出选择，哪怕选择是"我决定不调查"
2. **邻居变成工具人**：邻居只在主角需要信息时出现，之后消失——邻居应该有自己的处境和动机
3. **前任租客只是背景**：前任租客的故事从未被充分展开——他/她应该是一个有血肉的人，不只是"死在这里的人"
4. **联系人太次要**：外部世界的联系人对主角的现状漠不关心，无法形成"正常世界"的对照
5. **心理变化跳跃**：第一章普通人，第五章就已经完全崩溃——心理蜕变需要具体的触发节点和内心过程',
  'Haunted rental horror character generation. Core question for every character: how much do they know, how much do they choose to say, and what''s behind the gap. Protagonist types: investigator, survivor, empathizer, chosen one. Key: protagonist must have a concrete reason they can''t leave (lease, deposit, job location). Neighbor types: silent knower, active sympathizer, too-normal (makes protagonist doubt sanity), fellow victim. Landlord: knows more than they say, continues renting for unstated reasons. Previous tenant: information in three layers (surface/investigation/emotional) — their fate is a warning mirror for the protagonist. External contacts establish the contrast between normal life and the haunted space. Investigator characters (journalist, spiritual practitioner, police) should bring more questions, not answers.',
  (SELECT id FROM novel_creation_method WHERE name = '凶宅灵异租房' LIMIT 1),
  1,
  21,
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
