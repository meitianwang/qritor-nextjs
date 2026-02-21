-- 全局通用道具生成技能（Layer 2 通用流程层）
-- novel_creation_method_id = NULL 表示全局可用
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-prop-generation.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'prop-generation',
  '通用道具生成：获取道具 Schema、收集上下文、生成符合结构要求的道具属性、创建道具并建立关系的通用流程',
  'Generic prop generation: universal flow for reading prop schemas, collecting context, generating conformant attributes, creating props, and establishing relations',
  '## 通用道具生成技能

提供单个道具的生成流程。本技能可单独使用（如单个道具的 AI 生成），也可被初始化技能批量调用。

### 绝对禁止

**禁止向用户提问。禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。**

信息不足时自行做出合理的创意决策。用户通过确认 UI 审批。

---

### 生成流程

对一个道具执行以下步骤：

#### 1. 获取 Schema

调用 `get_prop_schema`，返回：
- `schema`：道具的 JSON Schema 定义，包含 `properties`（字段定义）和 `required`（必填字段）

#### 2. 收集上下文

调用 `list_settings` 获取所有设定模块内容（如未在本次会话中调用过）。
调用 `list_props` 获取已有道具列表（避免重复，确保差异化）。
调用 `list_characters` 获取已有角色列表（了解谁可能使用或持有道具）。

关注以下信息：
- 世界观/规则体系 → 约束道具的类型、能力上限、运作逻辑
- 故事钩子/核心设定 → 约束核心道具的选择
- 已有道具 → 避免重复功能，确保道具之间有差异化
- 已有角色 → 道具设计需考虑与角色的匹配关系

#### 3. 分析 Schema 字段

遍历 Schema 的 `properties`，对每个字段确定生成策略：
- `useForAI: true` 的静态字段 → 需要生成内容
- 动态字段（标记 `isDynamic: true` 的字段，如「当前持有者」「道具状态」等）→ 跳过，留空
- `required` 数组中的字段 → 必须填充
- 嵌套 `object` 类型字段 → 递归遵循子 Schema

#### 4. 生成道具属性

对每个待生成字段：
- 读取 Schema 中该字段的 `type`、`description`、`enum`（如有）等定义
- 严格按类型生成：
  - `string` → 生成文本（对 `x-uiWidget: textarea` 的字段写详细内容）
  - `object` → 生成嵌套对象（填充所有子字段）
  - `array` → 生成数组（注意 `items` 的类型定义）
  - `number`/`integer` → 生成数值
  - `enum` 约束 → 从可选值中选择一个
- 如果当前有专属道具生成技能已加载（名称含 `-prop-gen`），参考其领域知识指导
- 如果没有专属技能，基于小说类型的通用领域知识自行生成

#### 5. 创建道具

调用 `create_prop(name="{名称}", properties={...})`：
- `name` 取自生成的「名称」字段
- `properties` 是 JSON 对象，包含所有 `useForAI: true` 的字段（含嵌套对象）
- 动态字段不放入 `properties`
- 提交后系统弹出确认 UI，等待用户审批

**立即调用工具，不要先用文字描述计划。**

#### 6. 建立关系

道具创建成功后，根据道具属性和设定上下文推导关系：

**道具 ↔ 角色**（持有/使用关系）：
- 如有角色适合持有或使用该道具，建立关系
- 调用 `create_relation`，使用 `fromCategory: "prop"`, `toCategory: "character"`

**道具 ↔ 场景**（存放/出现关系）：
- 如有场景与道具的出现地点相关，建立关系
- 调用 `create_relation`，使用 `fromCategory: "prop"`, `toCategory: "scene"`

关系描述要具体，说明持有/使用/存放的具体方式。

---

### 内容质量原则

- **领域知识驱动**：道具属性必须体现该小说类型的专业知识和惯例
- **自主创意决策**：缺少信息时自行选择合理方向，不要问用户
- **与设定一致**：道具的能力、禁忌、来源必须与已有设定保持一致
- **道具差异化**：每个道具必须有独特的功能定位，避免同质化
- **能力与代价平衡**：强力道具必须有对应的代价或限制
- **类型正确**：严格按 Schema 定义的类型填充
- **枚举精确**：enum 字段必须使用精确的选项值，不得编造不存在的选项',
  '## Generic Prop Generation Skill

Provides the generation flow for a single prop. Can be used standalone (e.g., AI generation for a single prop) or called by the initialization skill for batch creation.

### Absolute Rule

**NEVER ask the user any questions. NEVER ask for preferences, ideas, or choices. NEVER seek input before calling tools.**

When information is insufficient, make reasonable creative decisions on your own. Users review via confirmation UI.

---

### Generation Flow

For a single prop, execute these steps:

#### 1. Get Schema

Call `get_prop_schema`, which returns:
- `schema`: Prop JSON Schema definition, containing `properties` (field definitions) and `required` (required fields)

#### 2. Collect Context

Call `list_settings` to get all setting module contents (if not already called in this session).
Call `list_props` to get the existing prop list (avoid duplication, ensure differentiation).
Call `list_characters` to get the existing character list (understand who may use or hold props).

Focus on:
- Worldview/rule system → constrains prop types, ability ceiling, operating logic
- Story hook/core settings → constrains core prop choices
- Existing props → avoid duplicate functions, ensure differentiation
- Existing characters → prop design should consider character matching

#### 3. Analyze Schema Fields

Iterate through the Schema''s `properties`, determining the generation strategy for each field:
- Static fields with `useForAI: true` → need content generation
- Dynamic fields (marked `isDynamic: true`, e.g., "当前持有者" / "道具状态") → skip, leave empty
- Fields in the `required` array → must be filled
- Nested `object` type fields → recursively follow sub-Schema

#### 4. Generate Prop Attributes

For each field to generate:
- Read the field''s `type`, `description`, `enum` (if any) from Schema
- Generate strictly by type:
  - `string` → generate text (write detailed content for `x-uiWidget: textarea` fields)
  - `object` → generate nested object (fill all sub-fields)
  - `array` → generate array (note the `items` type definition)
  - `number`/`integer` → generate numeric value
  - `enum` constraint → select one from allowed values
- If a specialized prop generation skill is loaded (name contains `-prop-gen`), follow its domain knowledge guidance
- If no specialized skill is available, generate based on general domain knowledge of the novel type

#### 5. Create Prop

Call `create_prop(name="{name}", properties={...})`:
- `name` is taken from the generated "名称" (Name) field
- `properties` is a JSON object containing all `useForAI: true` fields (including nested objects)
- Dynamic fields are not included in `properties`
- After submission, the system shows a confirmation UI for user review

**Call tools immediately. Do not describe your plan in text first.**

#### 6. Establish Relations

After the prop is successfully created, infer relationships from prop attributes and setting context:

**Prop ↔ Character** (ownership/usage relations):
- If a character is suitable to hold or use this prop, establish the relation
- Call `create_relation` with `fromCategory: "prop"`, `toCategory: "character"`

**Prop ↔ Scene** (location/appearance relations):
- If a scene relates to the prop''s appearance location, establish the relation
- Call `create_relation` with `fromCategory: "prop"`, `toCategory: "scene"`

Relationship descriptions should be specific about how the prop is held/used/stored.

---

### Content Quality Principles

- **Domain knowledge driven**: Prop attributes must reflect professional knowledge and conventions of the novel type
- **Autonomous creative decisions**: When information is lacking, choose a reasonable direction — never ask
- **Consistent with settings**: Prop abilities, taboos, and origins must align with existing settings
- **Prop differentiation**: Each prop must have a unique functional role — avoid homogeneity
- **Power-cost balance**: Powerful props must have corresponding costs or limitations
- **Correct types**: Strictly follow Schema-defined types
- **Precise enums**: Enum fields must use exact option values — never fabricate non-existent options',
  NULL,
  1,
  10,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
