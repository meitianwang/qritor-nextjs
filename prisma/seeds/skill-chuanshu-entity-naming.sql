-- 穿书文实体命名
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-chuanshu-entity-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'chuanshu-entity-naming',
  '实体命名：为穿书文小说中的角色、场景、势力等实体提供符合原著世界观的专业命名指导',
  '"Entity Naming": Provide world-consistent naming guidance for characters, locations, and factions in book-crossing novels',
  '## 实体命名 — 穿书文小说

穿书文的实体命名核心挑战：命名风格必须匹配原著世界的类型。由于穿书文可以穿入任何类型的小说，命名指南需要覆盖所有主要世界类型。

---

### 一、角色命名

#### 原著角色（硬约束）
使用原著中的姓名，不可改动。

#### 穿书者
使用穿越后所占角色的原名。穿书者的现实世界真名可在回忆或内心独白中使用。

#### 原创角色命名（按世界类型）

| 世界类型 | 命名特征 | 示例 |
|---------|---------|------|
| **古代宫廷** | 遵循朝代命名规范，注意阶层差异 | 贵族：沈清韵、顾凌霄；丫鬟：春桃、绿萝 |
| **仙侠修真** | 带仙气/道家意味的名字 | 道号：清虚子、紫霄真人；本名：叶长青、苏暮云 |
| **玄幻异世** | 独特的命名体系 | 根据种族不同设计：精灵用自然词、矮人用刚硬词 |
| **现代都市** | 正常现代名字 | 陆言、苏晚、林简、顾衍 |
| **现代校园** | 年轻化的现代名字 | 江柠、沈星回、温时雨 |
| **末世废土** | 代号+本名并用 | 代号：猎鹰、铁壁；本名：周铁生、赵勇 |
| **西方奇幻** | 西方姓名风格 | Elara Windwhisper, Thane Ironhold |

#### 姓氏多样化
不要让所有角色都姓"沈""顾""陆"（言情文常见姓氏过度集中）。

---

### 二、场景命名

#### 按世界类型命名

| 世界类型 | 命名风格 | 示例 |
|---------|---------|------|
| 古代宫廷 | 宫殿/府邸+雅名 | 栖凤阁、永安殿、沈国公府 |
| 仙侠修真 | 仙气地名 | 碧落峰、九天阁、忘忧谷 |
| 现代都市 | 现实化地名 | 星辰大厦、滨海别墅区、老城区巷子 |
| 末世废土 | 编号+描述性 | B区避难所、废弃商场、变异森林 |
| 西方奇幻 | 英式地名或翻译体 | 银月森林、铁堡城、龙息山脉 |

#### 原著场景使用原著名称
原创场景命名要与原著世界风格保持一致。

---

### 三、势力/组织命名

| 世界类型 | 命名风格 | 示例 |
|---------|---------|------|
| 古代宫廷 | 派系：以人物或理念命名 | 太子党、长公主一脉、外戚集团 |
| 仙侠修真 | 门派：意象+宗/门/阁 | 苍穹宗、碧水门、天机阁 |
| 现代都市 | 公司/家族 | 陆氏集团、星辰娱乐、沈家 |
| 末世废土 | 据点/联盟 | 南城联盟、铁壁营、自由贸易区 |

---

### 常见错误

- 原著角色名字写错或修改
- 古代世界角色用了现代风格名字
- 仙侠世界命名风格像历史正剧
- 所有角色都用"高大上"的名字，缺乏阶层差异
- 世界观内命名风格不统一（同一个门派有中式和日式名字混用）
- 穿书者在内心独白中从不使用现实真名，缺少身份冲突感',
  '## Entity Naming — Book-Crossing Novel

Core challenge: naming style must match the original novel''s world type. Since book-crossing can enter any genre, naming guidelines cover all major world types.

---

### I. Character Naming
Original characters: use source names unchanged. Crosser: uses occupied character''s name; real-world name appears in memories/inner monologue. New characters: match world type (ancient court follows dynasty conventions, xianxia uses ethereal names, modern uses normal names, etc.).

### II. Location Naming
Match world type: ancient court (palace/mansion names), xianxia (mystical place names), modern (realistic locations), post-apocalyptic (coded/descriptive), western fantasy (English-style). Original scenes use source names.

### III. Faction Naming
Ancient court (faction by leader/ideology), xianxia (sect: imagery + zong/men/ge), modern (company/family), post-apocalyptic (base/alliance).

### Common Errors
Wrong original character names, modern names in ancient settings, inconsistent naming style within the same world, lack of class differentiation in names, crosser never using real-world name in inner monologue.',
  (SELECT id FROM novel_creation_method WHERE name = '穿书文小说' LIMIT 1),
  1,
  51,
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
