-- 都市传说怪谈复苏流小说 - 实体命名技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-urban-legend-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'urban-legend-entity-naming',
  '实体命名：为都市传说怪谈复苏流小说中的角色、场景提供专业命名指导',
  '"Entity Naming": provide professional naming guidance for characters and scenes in urban legend revival horror novels',
  '## 实体命名 — 都市传说怪谈复苏流小说

都市怪谈的命名哲学：**普通感是最好的伪装，微小的异常是最好的恐惧**。角色名字要日常到让读者觉得「这个人真实存在」；场景名字要具体到让读者觉得「这个地方真实存在」。只有建立了这种真实感，后续的恐惧才有重量。

---

## 一、角色命名

### 总体命名哲学

都市怪谈角色命名的核心原则：**名字要普通，但不能千篇一律**。

这个题材中，角色命名有一个独特的危险：如果名字太普通（「王明」「李刚」），会让读者觉得角色是占位符而非真实的人；如果太有设计感，又破坏了日常代入感。

**解决方案**：用姓氏的多样化 + 名字里一个「有记忆点的细节」来实现普通但不雷同。

### 普通角色（主角/幸存者/帮凶）

**命名策略**：
- 姓氏多样化：不要总用王/李/张。陈、吴、刘、黄、赵、周、孙都是常见但不过度的选择
- 名字字数：两字名更有日常感（陈磊、吴静、黄楠）；三字全名适合年龄较大或正式场合
- 音节选择：避免声母全部一致（「王文伟」这类绕口令式组合）；选择容易发音和记忆的
- 时代感：当代年轻人（20-30岁）常见名：浩、宇、涵、雨、晨、曦、妍、嘉
- 不要使用：「死」「鬼」「殇」「冥」等明显与恐惧关联的字

**有记忆点的细节技巧**：
- 名字里有一个字与角色的某个关键特征有意义关联，但不过于明显
- 示例：一个因「看见了不该看的东西」而卷入的主角叫「陈望」（望=眺望、看），读者事后才注意到

### 知情者/引路人

**命名策略**：
- 可以使用更有年代感的名字（知情者通常年长一些）
- 双音节，字形可以略复杂（彰显阅历感）
- 示例：罗启明、林建国、许德志（70-80年代出生感）
- 也可以使用外号/网名替代真名（「老李」「三哥」「楼管」）——知情者往往不愿透露真名

### 危险人物/传播源

**命名策略**：
- 名字本身应该「感觉上很普通」——危险人物越普通越可怕
- 可以给读者一个「事后觉得名字很对」的体验
- 避免：「影子」「鬼客」这类直白的恐惧标签

### 多样化原则
为防止命名千篇一律：
- 避免同一故事中有两个以上相同姓氏的角色
- 名字的字音要有变化（有阳平、阴平、上声、去声的组合，不全用同一声调）
- 主角与其他角色的名字在音节长度上可以有区分（主角通常更简短清晰）

### 忌讳
- ❌ 姓名暗示过于明显（主角叫「陈生」在灵异故事里太明显）
- ❌ 所有角色都是两字名，缺乏层次感
- ❌ 使用读者熟悉的真实人物名字
- ❌ 名字里有太多同音字组合（容易混淆不同角色）

---

## 二、场景命名

### 总体命名哲学

都市怪谈场景命名的核心：**地址感 + 一个让人不舒服的细节**。最好的场景名字让读者觉得可以在地图上找到这个地方。

### 真实感地址型命名

**结构**：[建筑/设施编号或名称] + [具体位置描述]

参考示例：
- 「7栋2单元的负一层电梯」
- 「观澜路末站站台最右侧」
- 「旧居委会大楼四楼会议室」
- 「23号楼顶层储物间」

**有效的「真实感」要素**：
- 具体数字（楼栋号、层数、门牌号）
- 方位词（最左边、南侧、靠窗的）
- 时态限定（「已拆迁的XX」「原来的XX」）

### 功能性场景命名

当场景是公共设施时，用功能性名称+细节定位：

- 「3号线末班车最后一节车厢」
- 「县医院旧楼六楼端头的诊室」
- 「某便利店的哪个时间段」（时间可以是场景名称的一部分）

### 具有暗示感的命名

对于故事中特别重要的场景，可以在名字里埋入一个「回头才发现的细节」：

- 「永不亮的那个楼层」（「永不亮」本来可以是中性描述，事后才发现是诅咒）
- 「总是空着的候诊区」（「总是空着」事后理解有另一重含义）

### 忌讳
- ❌ 场景名字过于戏剧化（「恐惧之门」「死亡电梯」）——破坏都市现实感
- ❌ 场景名字太模糊（「某个地方」「一栋楼」）——读者建立不了画面
- ❌ 所有场景名字格式相同，缺乏辨识度
- ❌ 在场景命名中已经暗示了结局（「某人死亡的房间」——剧透了该角色的命运）

---

## 常见错误

- ❌ 角色名字和场景名字的「普通感」缺乏一致性（角色极其普通但场景极其戏剧化）
- ❌ 主角的名字里有「英雄」「勇者」等暗示特殊身份的字，破坏了普通人视角
- ❌ 知情者的名字太现代，与其年长/阅历深的设定不匹配
- ❌ 同一场景在故事中用了多个不同的称呼，读者混淆',
  '"Entity Naming" — Urban Legend Revival Horror Novels

Naming philosophy: ordinariness is the best camouflage; tiny wrongness is the best fear. Character names should feel so real that readers believe these people exist. Scene names should feel so specific that readers believe these places exist.

**Character naming principles**:
- Diverse surnames: Chen, Wu, Liu, Huang, Zhao, Zhou — beyond the Wang/Li/Zhang trifecta
- Two-character given names feel most contemporary for young adults
- One memorable detail: a character name can have subtle thematic resonance that readers notice only in retrospect (character named "Chen Wang" — Wang means "to gaze" — is drawn into the horror through seeing something they shouldn''t)
- Informants/guides: older-feeling names with more complex characters (reflecting life experience)
- Dangerous figures/transmission sources: the most ordinary-sounding names — ordinary is more frightening

**Diversity rules**: no two characters in the same story should share a surname; vary the tonal patterns (mix first, second, third, fourth tones); protagonists tend to have shorter, cleaner names

**Character naming prohibitions**: no names that too obviously predict fate, no names containing characters obviously associated with death/ghosts in Chinese, no real public figures'' names

**Scene naming principles**:
- Address-style: "[Building/Unit Number] + [Specific Location]" — "Unit 7, Building 2, Basement Level Elevator", "Platform Far Right, Line 3 Final Station"
- Effective reality markers: specific numbers, directional words, temporal qualifiers ("the former...", "the now-demolished...")
- Subtle implication names for key scenes: names that seem neutral on first reading but reveal dark meaning in retrospect ("the floor that never lights up" → readers later realize "never" is not a maintenance issue)

**Scene naming prohibitions**: no dramatic names ("Door of Fear", "Death Elevator"), no vague names ("somewhere", "a building"), no names that spoil the outcome',
  (SELECT id FROM novel_creation_method WHERE name = '都市传说怪谈复苏流小说' LIMIT 1),
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
