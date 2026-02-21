-- 全局道具初始化 Skill（Layer 1 编排层）
-- novel_creation_method_id = NULL 表示全局可用
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-prop-initialization.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'prop-initialization',
  '道具初始化：批量为道具库生成核心道具阵容，逐个加载专属道具生成技能并创建道具',
  'Prop initialization: batch-generate core prop lineup for the prop library, loading specialized prop generation skills for each',
  '## 道具初始化技能（编排层）

批量初始化小说项目的核心道具阵容。本技能负责编排流程，具体生成能力由两层技能提供：
- **通用道具生成技能**（`prop-generation`）：提供获取 Schema、生成属性、创建道具的通用流程
- **专属道具生成技能**（名称以 `-prop-gen` 结尾）：提供特定小说类型下的道具设计领域知识

### 绝对禁止

**禁止向用户提问。禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。**

信息不足时自行做出合理的创意决策。用户通过确认 UI 审批，不需要事先询问。

---

### 执行流程

加载后立即执行，不要输出开场白。

#### 1. 了解项目

调用 `get_novel_overview`，获取创作方法名称和项目信息。

#### 2. 收集设定上下文

调用 `list_settings`，读取所有设定模块的内容（世界观、故事钩子等）。这些设定是道具设计的基础——道具的类型、能力、禁忌必须与世界观和故事设定一致。

#### 3. 了解已有角色和场景

调用 `list_characters` 和 `list_scenes`，获取已有角色和场景列表。道具与角色紧密关联——谁使用、谁持有、道具出现在哪个场景，这些信息是道具设计的重要参考。

#### 4. 加载通用道具生成技能

调用 `use_skill(skill_name="prop-generation")`。

#### 5. 加载专属道具生成技能

在可用技能列表中查找：名称以 `-prop-gen` 结尾，且描述中包含「道具」的技能。如有，调用 `use_skill` 加载。

#### 6. 规划道具阵容

根据设定内容和故事类型，规划一个合理的初始道具阵容。典型配置：

- **核心道具**（2-3 个）：主角或关键角色的标志性道具，贯穿全书
- **功能道具**（2-3 个）：在关键剧情节点起作用的道具
- **氛围道具**（1-2 个）：丰富世界观和渲染氛围的道具

根据故事设定灵活调整数量和类型。道具之间应有功能差异化。

#### 7. 逐个生成

对每个规划的道具，按通用道具生成技能的流程执行：获取 Schema → 生成属性 → 创建道具 → 建立关系。

**立即调用工具，不要先用文字描述计划。**

**每个道具创建后等待用户确认，确认后再创建下一个。**

#### 8. 完成

所有道具创建完毕后，简要总结已创建的道具阵容及其与角色/场景的关系。',
  '## Prop Initialization Skill (Orchestration Layer)

Batch-initialize the core prop lineup for a novel project. This skill orchestrates the flow; actual generation is powered by two skill layers:
- **Generic prop generation skill** (`prop-generation`): provides the universal flow for reading schemas, generating attributes, and creating props
- **Specialized prop generation skills** (names ending in `-prop-gen`): provide domain knowledge for prop design within specific novel types

### Absolute Rule

**NEVER ask the user any questions. NEVER ask for preferences, ideas, or choices. NEVER seek input before calling tools.**

When information is insufficient, make reasonable creative decisions on your own. Users review via confirmation UI.

---

### Execution Flow

Begin immediately after loading. No preamble.

#### 1. Understand the Project

Call `get_novel_overview` to get creation method name and project info.

#### 2. Collect Setting Context

Call `list_settings` to read all setting modules (worldview, story hook, etc.). Settings are the foundation for prop design — prop types, abilities, and taboos must align with worldview and story settings.

#### 3. Understand Existing Characters and Scenes

Call `list_characters` and `list_scenes` to get existing character and scene lists. Props are tightly linked to characters and scenes — who uses them, who holds them, and where they appear.

#### 4. Load Generic Prop Generation Skill

Call `use_skill(skill_name="prop-generation")`.

#### 5. Load Specialized Prop Generation Skill

Search the available skills list for one whose name ends with `-prop-gen` and whose description contains "道具" (prop). If found, call `use_skill` to load it.

#### 6. Plan Prop Lineup

Based on settings and story type, plan a reasonable initial prop lineup. Typical configuration:

- **Core props** (2-3): Signature props for protagonist or key characters, spanning the entire story
- **Functional props** (2-3): Props that play a role at key plot points
- **Atmosphere props** (1-2): Props that enrich worldview and ambiance

Adjust numbers and types flexibly based on story settings.

#### 7. Generate One by One

For each planned prop, follow the generic prop generation skill''s flow: get Schema → generate attributes → create prop → establish relations.

**Call tools immediately. Do not describe your plan in text first.**

**After creating each prop, wait for user confirmation before creating the next.**

#### 8. Done

After all props are created, provide a brief summary of the prop lineup and their relationships with characters/scenes.',
  NULL,
  1,
  9,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
