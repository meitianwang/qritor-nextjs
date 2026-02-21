-- 全局通用组织生成技能（Layer 2 通用流程层）
-- novel_creation_method_id = NULL 表示全局可用
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-organization-generation.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'organization-generation',
  '通用组织生成：获取组织 Schema、收集上下文、生成符合结构要求的组织属性、创建组织并建立关系的通用流程',
  'Generic organization generation: universal flow for reading organization schemas, collecting context, generating conformant attributes, creating organizations, and establishing relations',
  '## 通用组织生成技能

提供单个组织/势力的生成流程。本技能可单独使用（如单个组织的 AI 生成），也可被初始化技能批量调用。

### 绝对禁止

**禁止向用户提问。禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。**

信息不足时自行做出合理的创意决策。用户通过确认 UI 审批。

---

### 生成流程

对一个组织执行以下步骤：

#### 1. 获取 Schema

调用 `get_organization_schema`，返回：
- `schema`：组织的 JSON Schema 定义，包含 `properties`（字段定义）和 `required`（必填字段）

#### 2. 收集上下文

调用 `list_settings` 获取所有设定模块内容（如未在本次会话中调用过）。
调用 `list_organizations` 获取已有组织列表（避免重复，确保差异化）。
调用 `list_characters` 获取已有角色列表（了解谁属于哪个组织）。

关注以下信息：
- 世界观/规则体系 → 约束组织的类型、势力格局、运作逻辑
- 故事钩子/核心设定 → 约束核心势力的选择
- 已有组织 → 避免重复定位，确保组织之间有利益冲突和差异化
- 已有角色 → 组织设计需考虑与角色的归属关系

#### 3. 分析 Schema 字段

遍历 Schema 的 `properties`，对每个字段确定生成策略：
- `useForAI: true` 的静态字段 → 需要生成内容
- 动态字段（标记 `isDynamic: true` 的字段，如「当前态势」等）→ 跳过，留空
- `required` 数组中的字段 → 必须填充
- 嵌套 `object` 类型字段 → 递归遵循子 Schema

#### 4. 生成组织属性

对每个待生成字段：
- 读取 Schema 中该字段的 `type`、`description`、`enum`（如有）等定义
- 严格按类型生成：
  - `string` → 生成文本（对 `x-uiWidget: textarea` 的字段写详细内容）
  - `object` → 生成嵌套对象（填充所有子字段）
  - `array` → 生成数组（注意 `items` 的类型定义）
  - `number`/`integer` → 生成数值
  - `enum` 约束 → 从可选值中选择一个
- 如果当前有专属组织生成技能已加载（名称含 `-org-gen`），参考其领域知识指导
- 如果没有专属技能，基于小说类型的通用领域知识自行生成

#### 5. 创建组织

调用 `create_organization(name="{名称}", properties={...})`：
- `name` 取自生成的名称字段（如「势力名称」或「名称」）
- `properties` 是 JSON 对象，包含所有 `useForAI: true` 的字段（含嵌套对象）
- 动态字段不放入 `properties`
- 提交后系统弹出确认 UI，等待用户审批

**立即调用工具，不要先用文字描述计划。**

#### 6. 建立关系

组织创建成功后，根据组织属性和设定上下文推导关系：

**组织 ↔ 角色**（归属/领导关系）：
- 如有角色属于或领导该组织，建立关系
- 调用 `create_relation`，使用 `fromCategory: "organization"`, `toCategory: "character"`

**组织 ↔ 场景**（据点/活动区域关系）：
- 如有场景是该组织的据点或活动区域，建立关系
- 调用 `create_relation`，使用 `fromCategory: "organization"`, `toCategory: "scene"`

**组织 ↔ 组织**（同盟/敌对/从属关系）：
- 如与已有组织存在明确关系，建立关系
- 调用 `create_relation`，使用 `fromCategory: "organization"`, `toCategory: "organization"`

关系描述要具体，说明归属/对抗/同盟的具体方式。

---

### 内容质量原则

- **领域知识驱动**：组织属性必须体现该小说类型的专业知识和惯例
- **自主创意决策**：缺少信息时自行选择合理方向，不要问用户
- **与设定一致**：组织的类型、势力格局、资源必须与已有设定保持一致
- **组织差异化**：每个组织必须有独特的定位和利益诉求，避免同质化
- **势力平衡**：各势力之间应有合理的制衡关系，避免一家独大
- **类型正确**：严格按 Schema 定义的类型填充
- **枚举精确**：enum 字段必须使用精确的选项值，不得编造不存在的选项',
  '## Generic Organization Generation Skill

Provides the generation flow for a single organization/faction. Can be used standalone (e.g., AI generation for a single organization) or called by the initialization skill for batch creation.

### Absolute Rule

**NEVER ask the user any questions. NEVER ask for preferences, ideas, or choices. NEVER seek input before calling tools.**

When information is insufficient, make reasonable creative decisions on your own. Users review via confirmation UI.

---

### Generation Flow

For a single organization, execute these steps:

#### 1. Get Schema

Call `get_organization_schema`, which returns:
- `schema`: Organization JSON Schema definition, containing `properties` (field definitions) and `required` (required fields)

#### 2. Collect Context

Call `list_settings` to get all setting module contents (if not already called in this session).
Call `list_organizations` to get the existing organization list (avoid duplication, ensure differentiation).
Call `list_characters` to get the existing character list (understand who belongs to which organization).

Focus on:
- Worldview/rule system → constrains organization types, power dynamics, operating logic
- Story hook/core settings → constrains core faction choices
- Existing organizations → avoid duplicate positioning, ensure interest conflicts and differentiation
- Existing characters → organization design should consider character allegiance

#### 3. Analyze Schema Fields

Iterate through the Schema''s `properties`, determining the generation strategy for each field:
- Static fields with `useForAI: true` → need content generation
- Dynamic fields (marked `isDynamic: true`, e.g., "当前态势" / current situation) → skip, leave empty
- Fields in the `required` array → must be filled
- Nested `object` type fields → recursively follow sub-Schema

#### 4. Generate Organization Attributes

For each field to generate:
- Read the field''s `type`, `description`, `enum` (if any) from Schema
- Generate strictly by type:
  - `string` → generate text (write detailed content for `x-uiWidget: textarea` fields)
  - `object` → generate nested object (fill all sub-fields)
  - `array` → generate array (note the `items` type definition)
  - `number`/`integer` → generate numeric value
  - `enum` constraint → select one from allowed values
- If a specialized organization generation skill is loaded (name contains `-org-gen`), follow its domain knowledge guidance
- If no specialized skill is available, generate based on general domain knowledge of the novel type

#### 5. Create Organization

Call `create_organization(name="{name}", properties={...})`:
- `name` is taken from the generated name field (e.g., "势力名称" or "名称")
- `properties` is a JSON object containing all `useForAI: true` fields (including nested objects)
- Dynamic fields are not included in `properties`
- After submission, the system shows a confirmation UI for user review

**Call tools immediately. Do not describe your plan in text first.**

#### 6. Establish Relations

After the organization is successfully created, infer relationships from organization attributes and setting context:

**Organization ↔ Character** (allegiance/leadership relations):
- If a character belongs to or leads this organization, establish the relation
- Call `create_relation` with `fromCategory: "organization"`, `toCategory: "character"`

**Organization ↔ Scene** (headquarters/territory relations):
- If a scene serves as this organization''s headquarters or territory, establish the relation
- Call `create_relation` with `fromCategory: "organization"`, `toCategory: "scene"`

**Organization ↔ Organization** (alliance/opposition/subordination relations):
- If there is a clear relationship with an existing organization, establish the relation
- Call `create_relation` with `fromCategory: "organization"`, `toCategory: "organization"`

Relationship descriptions should be specific about allegiance/opposition/alliance details.

---

### Content Quality Principles

- **Domain knowledge driven**: Organization attributes must reflect professional knowledge and conventions of the novel type
- **Autonomous creative decisions**: When information is lacking, choose a reasonable direction — never ask
- **Consistent with settings**: Organization types, power dynamics, and resources must align with existing settings
- **Organization differentiation**: Each organization must have a unique positioning and interest — avoid homogeneity
- **Power balance**: Factions should have reasonable checks and balances — avoid one-sided dominance
- **Correct types**: Strictly follow Schema-defined types
- **Precise enums**: Enum fields must use exact option values — never fabricate non-existent options',
  NULL,
  1,
  12,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
