-- 穿书文小说「金手指」设定生成技能
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-chuanshu-golden-finger-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chuanshu-golden-finger-setting-gen',
  '「金手指」设定生成：为穿书文小说生成金手指设定，包括类型、能力描述、使用限制和成长空间',
  '"Golden Finger" setting generation: generate cheat ability settings for book-crossing novels',
  '## 「金手指」设定生成 — 穿书文小说

「金手指」定义穿书者除剧情先知外的额外能力。穿书文的金手指设计有一个核心特点：剧情先知本身已经是最大的金手指，额外能力需要与之平衡。

---

### 字段生成指南

#### 金手指类型

穿书文特有的金手指类型体系：

| 类型 | 核心优势 | 适合搭配 |
|------|---------|---------|
| 剧情先知 | 记忆原著内容，知道未来走向 | 所有穿越身份（最基础的金手指） |
| 系统面板 | 任务/升级/抽奖系统 | 炮灰角色（需要额外助力） |
| 特殊技能 | 原著角色不具备的能力 | 路人甲/原创角色（弥补身份弱势） |
| 物品道具 | 来自现实世界的物品 | 现代都市/末世设定（手机、百科全书等） |
| 人脉关系 | 提前知道谁是贵人 | 配角/炮灰角色（社交型金手指） |
| 无金手指 | 纯靠智慧和原著知识 | 原著主角（已有主角光环加持） |

#### 金手指详情

具体化能力描述。穿书文金手指的设计原则：
- 不能让穿书者轻易碾压原著主角——原著主角有"主角光环"
- 金手指最好与穿书设定有逻辑关联（如系统穿书者的系统就是穿书的媒介）
- 最好有双面性——既是优势也可能暴露身份

#### 使用限制

穿书文金手指的独特限制设计：
- **剧情先知限制**：改变剧情越多，先知信息失效越快；只记得读过的部分，未读部分一无所知
- **系统限制**：任务失败有惩罚；系统可能有自己的目的（维护原著剧情）
- **技能限制**：在书中世界使用现实技能可能会引起怀疑
- **核心原则**：限制越明确，故事张力越大

#### 成长空间

金手指随剧情发展的变化轨迹：
- 前期：金手指优势明显，穿书者占据主动
- 中期：剧情偏离加剧，先知信息开始失效
- 后期：金手指完全消耗或升级为更高层次的能力

#### 获得方式

与穿越方式呼应：
- 穿越自带：最常见，简化设定
- 系统赠予：增加一个NPC级的角色（系统本身）
- 后天触发：可以设计为重要剧情节点
- 逐步觉醒：增加成长线',
  '## "Golden Finger" Setting Generation — Book-Crossing Novel

The "Golden Finger" defines abilities beyond plot foreknowledge. Key feature: foreknowledge itself is already the biggest cheat — additional abilities must balance with it.

---

### Field Generation Guide

#### Type
Book-crossing specific types: Plot Prophet (remembers original content), System Panel (quests/upgrades), Special Skills (abilities original characters lack), Items (real-world objects), Social Network (knowing who''s important), None (pure wisdom).

#### Details
Design principles: don''t let crosser easily overpower the original protagonist (who has "protagonist halo"); link the cheat to crossing mechanism; ideally double-edged (advantage + identity exposure risk).

#### Limitations
Unique to book-crossing: foreknowledge depletes as plot diverges; system may have its own agenda (maintaining original plot); using real-world skills may arouse suspicion.

#### Growth
Trajectory: early advantage → mid-stage foreknowledge erosion → late-stage full consumption or upgrade to higher-level ability.',
  (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1),
  1,
  24,
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
