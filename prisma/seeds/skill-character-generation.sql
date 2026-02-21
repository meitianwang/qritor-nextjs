-- 全局通用角色生成技能（Layer 2 通用流程层）
-- novel_creation_method_id = NULL 表示全局可用
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-character-generation.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'character-generation',
  '通用角色生成：获取角色 Schema、收集上下文、生成符合结构要求的角色属性、创建角色并建立关系的通用流程',
  'Generic character generation: universal flow for reading character schemas, collecting context, generating conformant attributes, creating characters, and establishing relations',
  '## 通用角色生成技能

提供单个角色的生成流程。本技能可单独使用（如单个角色的 AI 生成），也可被初始化技能批量调用。

### 绝对禁止

**禁止向用户提问。禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。**

信息不足时自行做出合理的创意决策。用户通过确认 UI 审批。

---

### 生成流程

对一个角色执行以下步骤：

#### 1. 获取 Schema

调用 `get_character_schema`，返回：
- `schema`：角色的 JSON Schema 定义，包含 `properties`（字段定义）和 `required`（必填字段）

#### 2. 收集上下文

调用 `list_settings` 获取所有设定模块内容（如未在本次会话中调用过）。
调用 `list_characters` 获取已有角色列表（避免重复，确保差异化）。

关注以下信息：
- 世界观/时代背景 → 约束角色的身份、命名、行为
- 穿越设定/核心设定 → 约束主角的身份和起点
- 金手指设定 → 约束主角的能力
- 已有角色 → 避免重复定位，确保角色之间有差异化

#### 3. 分析 Schema 字段

遍历 Schema 的 `properties`，对每个字段确定生成策略：
- `useForAI: true` 的静态字段 → 需要生成内容
- 动态字段（如「称呼」「当前状态」等没有 `useForAI` 标记的字段）→ 跳过，留空
- `required` 数组中的字段 → 必须填充

#### 4. 生成角色属性

对每个待生成字段：
- 读取 Schema 中该字段的 `type`、`description`、`enum`（如有）等定义
- 严格按类型生成：
  - `string` → 生成文本（对 `x-uiWidget: textarea` 的字段写详细内容）
  - `array` → 生成数组（注意 `items` 的类型定义）
  - `number`/`integer` → 生成数值
  - `enum` 约束 → 从可选值中选择一个
- 如果当前有专属角色生成技能已加载（名称含 `-character-gen`），参考其领域知识指导
- 如果没有专属技能，基于小说类型的通用领域知识自行生成

#### 5. 创建角色

调用 `create_character(name="{姓名}", properties={...})`：
- `name` 取自生成的「姓名」字段
- `properties` 是平铺的 JSON 对象，包含所有 `useForAI: true` 的字段
- 动态字段不放入 `properties`
- 提交后系统弹出确认 UI，等待用户审批

**立即调用工具，不要先用文字描述计划。**

#### 6. 建立关系

角色创建成功后，如已有其他角色，根据角色属性和设定上下文推导关系：
- 调用 `create_relation` 建立基础关系（如盟友、敌人、上下级、亲属等）
- 关系描述要具体，不要只写泛泛的"认识"

---

### 内容质量原则

- **领域知识驱动**：角色属性必须体现该小说类型的专业知识和惯例
- **自主创意决策**：缺少信息时自行选择合理方向，不要问用户
- **与设定一致**：角色的身份、能力、关系必须与已有设定保持一致
- **角色差异化**：每个角色必须有独特的定位和性格，避免同质化
- **类型正确**：严格按 Schema 定义的类型填充
- **枚举精确**：enum 字段必须使用精确的选项值，不得编造不存在的选项',
  '## Generic Character Generation Skill

Provides the generation flow for a single character. Can be used standalone (e.g., AI generation for a single character) or called by the initialization skill for batch creation.

### Absolute Rule

**NEVER ask the user any questions. NEVER ask for preferences, ideas, or choices. NEVER seek input before calling tools.**

When information is insufficient, make reasonable creative decisions on your own. Users review via confirmation UI.

---

### Generation Flow

For a single character, execute these steps:

#### 1. Get Schema

Call `get_character_schema`, which returns:
- `schema`: Character JSON Schema definition, containing `properties` (field definitions) and `required` (required fields)

#### 2. Collect Context

Call `list_settings` to get all setting module contents (if not already called in this session).
Call `list_characters` to get the existing character list (avoid duplication, ensure differentiation).

Focus on:
- Worldview/era background → constrains character identity, naming, behavior
- Crossing setup/core settings → constrains protagonist identity and starting point
- Cheat ability → constrains protagonist capabilities
- Existing characters → avoid duplicate roles, ensure differentiation

#### 3. Analyze Schema Fields

Iterate through the Schema''s `properties`, determining the generation strategy for each field:
- Static fields with `useForAI: true` → need content generation
- Dynamic fields (e.g., "称呼" / "当前状态" without `useForAI`) → skip, leave empty
- Fields in the `required` array → must be filled

#### 4. Generate Character Attributes

For each field to generate:
- Read the field''s `type`, `description`, `enum` (if any) from Schema
- Generate strictly by type:
  - `string` → generate text (write detailed content for `x-uiWidget: textarea` fields)
  - `array` → generate array (note the `items` type definition)
  - `number`/`integer` → generate numeric value
  - `enum` constraint → select one from allowed values
- If a specialized character generation skill is loaded (name contains `-character-gen`), follow its domain knowledge guidance
- If no specialized skill is available, generate based on general domain knowledge of the novel type

#### 5. Create Character

Call `create_character(name="{name}", properties={...})`:
- `name` is taken from the generated "姓名" (Name) field
- `properties` is a flat JSON object containing all `useForAI: true` fields
- Dynamic fields are not included in `properties`
- After submission, the system shows a confirmation UI for user review

**Call tools immediately. Do not describe your plan in text first.**

#### 6. Establish Relations

After the character is successfully created, if other characters already exist, infer relationships from character attributes and setting context:
- Call `create_relation` to establish basic relationships (e.g., ally, enemy, superior/subordinate, family, etc.)
- Relationship descriptions should be specific, not generic "knows each other"

---

### Content Quality Principles

- **Domain knowledge driven**: Character attributes must reflect professional knowledge and conventions of the novel type
- **Autonomous creative decisions**: When information is lacking, choose a reasonable direction — never ask
- **Consistent with settings**: Character identity, abilities, and relationships must align with existing settings
- **Character differentiation**: Each character must have a unique role and personality — avoid homogeneity
- **Correct types**: Strictly follow Schema-defined types
- **Precise enums**: Enum fields must use exact option values — never fabricate non-existent options',
  NULL,
  1,
  6,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
