-- 全局通用设定生成技能（Layer 2 通用流程层）
-- novel_creation_method_id = NULL 表示全局可用
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-setting-generation.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'setting-generation',
  '通用设定生成：读取设定 Schema、生成符合结构要求的内容、提交更新的通用流程，适用于所有设定类型',
  'Generic setting generation: universal flow for reading setting schemas, generating conformant content, and submitting updates — works for all setting types',
  '## 通用设定生成技能

提供设定内容生成的通用流程。本技能可单独使用（如单个设定的 AI 生成），也可被初始化技能调用。

### 绝对禁止

**禁止向用户提问。禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。**

信息不足时自行做出合理的创意决策。用户通过确认 UI 审批。

---

### 生成流程

对一个设定模块执行以下步骤：

#### 1. 获取详情

调用 `get_setting_detail(settingName="{设定名}")`，返回：
- `properties`：当前已有内容（JSON 对象）
- `schema`：JSON Schema 定义，包含 `properties`（字段定义）和 `required`（必填字段）

#### 2. 分析空字段

遍历 Schema 中 `properties` 的每个字段：
- 如果字段在 `properties` 中已有非空值，保留不动
- 如果字段为空（`null`、`""`、`[]`、`{}`）或不存在，标记为待生成

如果没有空字段，跳过该设定。

#### 3. 生成内容

对每个待生成字段：
- 读取 Schema 中该字段的 `type`、`description`、`enum`（如有）等定义
- 严格按类型生成：
  - `string` → 生成文本
  - `array` → 生成数组（注意 `items` 的类型）
  - `number`/`integer` → 生成数值
  - `object` → 生成嵌套对象（按子 Schema）
  - `enum` 约束 → 从可选值中选择
- 如果当前有专属设定生成技能已加载（名称含 `-setting-gen`），参考其领域知识指导
- 如果没有专属技能，基于小说类型的通用领域知识自行生成

#### 4. 提交更新

调用 `update_setting(settingName="{设定名}", properties={...})`：
- `properties` 是平铺的 JSON 对象，只包含本次生成/修改的字段
- 工具会自动 merge 到已有内容
- 提交后系统弹出确认 UI，等待用户审批

**立即调用工具，不要先用文字描述计划。**

---

### 内容质量原则

- **领域知识驱动**：内容必须体现该小说类型的专业知识和惯例
- **自主创意决策**：缺少信息时自行选择合理方向，不要问用户
- **前后一致**：参考项目已有信息（名称、描述、已填设定）保持一致性
- **具体有深度**：避免空泛的通用描述，每个字段要有实质内容
- **类型正确**：严格按 Schema 定义的类型填充',
  '## Generic Setting Generation Skill

Provides the universal flow for generating setting content. Can be used standalone (e.g., AI generation for a single setting) or called by the initialization skill.

### Absolute Rule

**NEVER ask the user any questions. NEVER ask for preferences, ideas, or choices. NEVER seek input before calling tools.**

When information is insufficient, make reasonable creative decisions on your own. Users review via confirmation UI.

---

### Generation Flow

For a single setting module, execute these steps:

#### 1. Get Details

Call `get_setting_detail(settingName="{name}")`, which returns:
- `properties`: current content (JSON object)
- `schema`: JSON Schema definition, containing `properties` (field definitions) and `required` (required fields)

#### 2. Analyze Empty Fields

Iterate through each field in the Schema''s `properties`:
- If the field already has a non-empty value in `properties`, keep it unchanged
- If the field is empty (`null`, `""`, `[]`, `{}`) or missing, mark it for generation

If no empty fields exist, skip this setting.

#### 3. Generate Content

For each field to generate:
- Read the field''s `type`, `description`, `enum` (if any) from Schema
- Generate strictly by type:
  - `string` → generate text
  - `array` → generate array (note the `items` type)
  - `number`/`integer` → generate numeric value
  - `object` → generate nested object (per sub-schema)
  - `enum` constraint → select from allowed values
- If a specialized setting generation skill is loaded (name contains `-setting-gen`), follow its domain knowledge guidance
- If no specialized skill is available, generate based on general domain knowledge of the novel type

#### 4. Submit Update

Call `update_setting(settingName="{name}", properties={...})`:
- `properties` is a flat JSON object containing only the generated/modified fields
- The tool auto-merges into existing content
- After submission, the system shows a confirmation UI for user review

**Call tools immediately. Do not describe your plan in text first.**

---

### Content Quality Principles

- **Domain knowledge driven**: Content must reflect professional knowledge and conventions of the novel type
- **Autonomous creative decisions**: When information is lacking, choose a reasonable direction — never ask
- **Internal consistency**: Reference existing project info (name, description, filled settings) for coherence
- **Specific and substantive**: Avoid generic filler; each field should have real substance
- **Correct types**: Strictly follow Schema-defined types',
  NULL,
  1,
  5,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
