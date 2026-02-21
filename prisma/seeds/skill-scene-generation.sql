-- 全局通用场景生成技能（Layer 2 通用流程层）
-- novel_creation_method_id = NULL 表示全局可用
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-scene-generation.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'scene-generation',
  '通用场景生成：获取场景 Schema、收集上下文、生成符合结构要求的场景属性、创建场景并建立关系的通用流程',
  'Generic scene generation: universal flow for reading scene schemas, collecting context, generating conformant attributes, creating scenes, and establishing relations',
  '## 通用场景生成技能

提供单个场景的生成流程。本技能可单独使用（如单个场景的 AI 生成），也可被初始化技能批量调用。

### 绝对禁止

**禁止向用户提问。禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。**

信息不足时自行做出合理的创意决策。用户通过确认 UI 审批。

---

### 生成流程

对一个场景执行以下步骤：

#### 1. 获取 Schema

调用 `get_scene_schema`，返回：
- `schema`：场景的 JSON Schema 定义，包含 `properties`（字段定义）和 `required`（必填字段）

#### 2. 收集上下文

调用 `list_settings` 获取所有设定模块内容（如未在本次会话中调用过）。
调用 `list_scenes` 获取已有场景列表（避免重复，确保差异化）。
调用 `list_characters` 获取已有角色列表（了解哪些角色可能活动在新场景中）。

关注以下信息：
- 世界观/地理设定 → 约束场景的位置、规模、文化特征
- 穿越设定/核心设定 → 约束核心场景的选择
- 已有场景 → 避免重复功能，确保场景之间有差异化
- 已有角色 → 场景设计需考虑角色的活动需求

#### 3. 分析 Schema 字段

遍历 Schema 的 `properties`，对每个字段确定生成策略：
- `useForAI: true` 的静态字段 → 需要生成内容
- 动态字段（如「当前时段」「灵异活跃度」等没有 `useForAI` 标记的字段）→ 跳过，留空
- `required` 数组中的字段 → 必须填充

#### 4. 生成场景属性

对每个待生成字段：
- 读取 Schema 中该字段的 `type`、`description`、`enum`（如有）等定义
- 严格按类型生成：
  - `string` → 生成文本（对 `x-uiWidget: textarea` 的字段写详细内容）
  - `array` → 生成数组（注意 `items` 的类型定义）
  - `number`/`integer` → 生成数值
  - `enum` 约束 → 从可选值中选择一个
- 如果当前有专属场景生成技能已加载（名称含 `-scene-gen`），参考其领域知识指导
- 如果没有专属技能，基于小说类型的通用领域知识自行生成

#### 5. 创建场景

调用 `create_scene(name="{场景名称}", properties={...})`：
- `name` 取自生成的「场景名称」字段
- `properties` 是平铺的 JSON 对象，包含所有 `useForAI: true` 的字段
- 动态字段不放入 `properties`
- 提交后系统弹出确认 UI，等待用户审批

**立即调用工具，不要先用文字描述计划。**

#### 6. 建立关系

场景创建成功后，根据场景属性和设定上下文推导关系：

**场景 ↔ 角色**（活动关系）：
- 如有角色的活动场所与该场景匹配，建立活动关系
- 调用 `create_relation`，使用 `fromCategory: "scene"`, `toCategory: "character"`

**场景 ↔ 场景**（空间关系）：
- 如已有场景与新场景存在地理/空间关联，建立空间关系
- 调用 `create_relation`，使用 `fromCategory: "scene"`, `toCategory: "scene"`

**场景 ↔ 组织**（归属关系）：
- 如有组织与该场景存在管辖/驻扎关系，建立关系
- 调用 `create_relation`，使用 `fromCategory: "scene"`, `toCategory: "organization"`

关系描述要具体，不要只写泛泛的"相关"。

---

### 内容质量原则

- **领域知识驱动**：场景属性必须体现该小说类型的专业知识和惯例
- **自主创意决策**：缺少信息时自行选择合理方向，不要问用户
- **与设定一致**：场景的地理、文化、氛围必须与已有设定保持一致
- **场景差异化**：每个场景必须有独特的功能定位和氛围，避免同质化
- **类型正确**：严格按 Schema 定义的类型填充
- **枚举精确**：enum 字段必须使用精确的选项值，不得编造不存在的选项',
  '## Generic Scene Generation Skill

Provides the generation flow for a single scene. Can be used standalone (e.g., AI generation for a single scene) or called by the initialization skill for batch creation.

### Absolute Rule

**NEVER ask the user any questions. NEVER ask for preferences, ideas, or choices. NEVER seek input before calling tools.**

When information is insufficient, make reasonable creative decisions on your own. Users review via confirmation UI.

---

### Generation Flow

For a single scene, execute these steps:

#### 1. Get Schema

Call `get_scene_schema`, which returns:
- `schema`: Scene JSON Schema definition, containing `properties` (field definitions) and `required` (required fields)

#### 2. Collect Context

Call `list_settings` to get all setting module contents (if not already called in this session).
Call `list_scenes` to get the existing scene list (avoid duplication, ensure differentiation).
Call `list_characters` to get the existing character list (understand which characters may operate in the new scene).

Focus on:
- Worldview/geography → constrains scene location, scale, cultural traits
- Crossing/core settings → constrains core scene choices
- Existing scenes → avoid duplicate functions, ensure differentiation
- Existing characters → scene design should consider character activity needs

#### 3. Analyze Schema Fields

Iterate through the Schema''s `properties`, determining the generation strategy for each field:
- Static fields with `useForAI: true` → need content generation
- Dynamic fields (e.g., "当前时段" / "灵异活跃度" without `useForAI`) → skip, leave empty
- Fields in the `required` array → must be filled

#### 4. Generate Scene Attributes

For each field to generate:
- Read the field''s `type`, `description`, `enum` (if any) from Schema
- Generate strictly by type:
  - `string` → generate text (write detailed content for `x-uiWidget: textarea` fields)
  - `array` → generate array (note the `items` type definition)
  - `number`/`integer` → generate numeric value
  - `enum` constraint → select one from allowed values
- If a specialized scene generation skill is loaded (name contains `-scene-gen`), follow its domain knowledge guidance
- If no specialized skill is available, generate based on general domain knowledge of the novel type

#### 5. Create Scene

Call `create_scene(name="{name}", properties={...})`:
- `name` is taken from the generated "场景名称" (Scene Name) field
- `properties` is a flat JSON object containing all `useForAI: true` fields
- Dynamic fields are not included in `properties`
- After submission, the system shows a confirmation UI for user review

**Call tools immediately. Do not describe your plan in text first.**

#### 6. Establish Relations

After the scene is successfully created, infer relationships from scene attributes and setting context:

**Scene ↔ Character** (activity relations):
- If a character''s activity location matches this scene, establish the relation
- Call `create_relation` with `fromCategory: "scene"`, `toCategory: "character"`

**Scene ↔ Scene** (spatial relations):
- If existing scenes have geographic/spatial connections to the new scene, establish the relation
- Call `create_relation` with `fromCategory: "scene"`, `toCategory: "scene"`

**Scene ↔ Organization** (affiliation relations):
- If organizations have jurisdiction or garrison relationships with this scene, establish the relation
- Call `create_relation` with `fromCategory: "scene"`, `toCategory: "organization"`

Relationship descriptions should be specific, not generic "related."

---

### Content Quality Principles

- **Domain knowledge driven**: Scene attributes must reflect professional knowledge and conventions of the novel type
- **Autonomous creative decisions**: When information is lacking, choose a reasonable direction — never ask
- **Consistent with settings**: Scene geography, culture, and atmosphere must align with existing settings
- **Scene differentiation**: Each scene must have a unique functional role and atmosphere — avoid homogeneity
- **Correct types**: Strictly follow Schema-defined types
- **Precise enums**: Enum fields must use exact option values — never fabricate non-existent options',
  NULL,
  1,
  8,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
