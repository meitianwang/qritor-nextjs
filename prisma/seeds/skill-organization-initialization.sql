-- 全局组织初始化 Skill（Layer 1 编排层）
-- novel_creation_method_id = NULL 表示全局可用
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-organization-initialization.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'organization-initialization',
  '组织初始化：批量为组织库生成核心势力/组织阵容，逐个加载专属组织生成技能并创建组织',
  'Organization initialization: batch-generate core faction/organization lineup for the organization library, loading specialized organization generation skills for each',
  '## 组织初始化技能（编排层）

批量初始化小说项目的核心组织/势力阵容。本技能负责编排流程，具体生成能力由两层技能提供：
- **组织操作技能**（`organization-operations`）：提供获取 Schema、生成属性、创建组织的通用流程
- **专属组织生成技能**（名称以 `-org-gen` 结尾）：提供特定小说类型下的组织/势力设计领域知识

### 绝对禁止

**禁止向用户提问。禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。**

信息不足时自行做出合理的创意决策。用户通过确认 UI 审批，不需要事先询问。

---

### 执行流程

加载后立即执行，不要输出开场白。

#### 1. 了解项目

调用 `get_novel_overview`，获取创作方法名称和项目信息。

#### 2. 收集设定上下文

调用 `list_settings`，读取所有设定模块的内容（世界观、故事钩子等）。这些设定是组织设计的基础——组织的类型、势力格局、资源分布必须与世界观和故事设定一致。

#### 3. 了解已有角色和场景

调用 `list_characters` 和 `list_scenes`，获取已有角色和场景列表。组织与角色紧密关联——核心人物、势力归属、据点场景，这些信息是组织设计的重要参考。

#### 4. 加载组织操作技能

调用 `use_skill(skill_name="organization-operations")`。

#### 5. 加载专属组织生成技能

在可用技能列表中查找：名称以 `-org-gen` 结尾，且描述中包含「组织」或「势力」的技能。如有，调用 `use_skill` 加载。

#### 6. 规划组织阵容

根据设定内容和故事类型，规划一个合理的初始组织/势力阵容。典型配置：

- **主角所属势力**（1 个）：主角归属或投靠的势力/组织
- **主要对立势力**（1-2 个）：与主角阵营对抗的势力
- **中立/摇摆势力**（1-2 个）：可拉拢或可能倒戈的势力
- **背景势力**（1-2 个）：丰富世界观格局的势力

根据故事设定灵活调整数量和类型。组织之间应有明确的利益关系和冲突点。

#### 7. 逐个生成

对每个规划的组织，按组织操作技能的创建流程执行：获取 Schema → 生成属性 → 创建组织 → 建立关系。

**立即调用工具，不要先用文字描述计划。**

**每个组织创建后等待用户确认，确认后再创建下一个。**

#### 8. 完成

所有组织创建完毕后，简要总结已创建的组织阵容及其相互关系和与角色/场景的关联。',
  '## Organization Initialization Skill (Orchestration Layer)

Batch-initialize the core faction/organization lineup for a novel project. This skill orchestrates the flow; actual generation is powered by two skill layers:
- **Organization operations skill** (`organization-operations`): provides the universal flow for reading schemas, generating attributes, and creating organizations
- **Specialized organization generation skills** (names ending in `-org-gen`): provide domain knowledge for organization/faction design within specific novel types

### Absolute Rule

**NEVER ask the user any questions. NEVER ask for preferences, ideas, or choices. NEVER seek input before calling tools.**

When information is insufficient, make reasonable creative decisions on your own. Users review via confirmation UI.

---

### Execution Flow

Begin immediately after loading. No preamble.

#### 1. Understand the Project

Call `get_novel_overview` to get creation method name and project info.

#### 2. Collect Setting Context

Call `list_settings` to read all setting modules (worldview, story hook, etc.). Settings are the foundation for organization design — organization types, power dynamics, and resource distribution must align with worldview and story settings.

#### 3. Understand Existing Characters and Scenes

Call `list_characters` and `list_scenes` to get existing character and scene lists. Organizations are tightly linked to characters and scenes — key members, faction allegiance, and headquarters locations.

#### 4. Load Organization Operations Skill

Call `use_skill(skill_name="organization-operations")`.

#### 5. Load Specialized Organization Generation Skill

Search the available skills list for one whose name ends with `-org-gen` and whose description contains "组织" (organization) or "势力" (faction). If found, call `use_skill` to load it.

#### 6. Plan Organization Lineup

Based on settings and story type, plan a reasonable initial organization/faction lineup. Typical configuration:

- **Protagonist''s faction** (1): The faction the protagonist belongs to or joins
- **Main opposing factions** (1-2): Factions in conflict with the protagonist''s side
- **Neutral/swing factions** (1-2): Factions that can be recruited or may switch sides
- **Background factions** (1-2): Factions that enrich the worldview

Adjust numbers and types flexibly based on story settings.

#### 7. Generate One by One

For each planned organization, follow the organization operations skill''s creation flow: get Schema → generate attributes → create organization → establish relations.

**Call tools immediately. Do not describe your plan in text first.**

**After creating each organization, wait for user confirmation before creating the next.**

#### 8. Done

After all organizations are created, provide a brief summary of the organization lineup, their interrelationships, and connections to characters/scenes.',
  NULL,
  1,
  11,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
