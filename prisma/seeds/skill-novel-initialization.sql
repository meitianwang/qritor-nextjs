-- 更新全局设定初始化 Skill（Layer 1 编排层）
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-novel-initialization.sql

UPDATE skill SET
  description = '设定初始化：自动为所有设定模块生成内容，逐个加载专属生成技能并填充',
  description_en = 'Setting initialization: automatically generate content for all setting modules, loading specialized generation skills for each',
  instructions = '## 设定初始化技能（编排层）

批量初始化小说项目的所有设定模块。本技能负责编排流程，具体生成能力由两层技能提供：
- **通用设定生成技能**（`setting-generation`）：提供读取 Schema、生成内容、提交更新的通用流程
- **专属设定生成技能**（名称以 `-setting-gen` 结尾）：提供特定设定类型在特定小说类型下的领域知识

### 绝对禁止

**禁止向用户提问。禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。**

信息不足时自行做出合理的创意决策。用户通过确认 UI 审批，不需要事先询问。

---

### 执行流程

加载后立即执行，不要输出开场白。

#### 1. 了解项目

调用 `get_novel_overview`，获取创作方法名称和项目信息。

#### 2. 加载通用设定生成技能

调用 `use_skill(skill_name="setting-generation")`。

#### 3. 获取设定列表

调用 `list_settings`，获取所有设定模块。

#### 4. 逐个填充

对每个设定模块：
1. 在可用技能列表中查找：名称以 `-setting-gen` 结尾，且描述中包含当前设定的模块类型名称（如「故事钩子」）的技能。如有，调用 `use_skill` 加载
2. 按通用设定生成技能的流程执行：获取详情 → 生成内容 → 提交更新

**立即调用工具，不要先用文字描述计划。**

#### 5. 完成

所有设定处理完毕后，简要总结已填充的设定。',
  instructions_en = '## Setting Initialization Skill (Orchestration Layer)

Batch-initialize all setting modules in a novel project. This skill orchestrates the flow; actual generation is powered by two skill layers:
- **Generic setting generation skill** (`setting-generation`): provides the universal flow for reading schemas, generating content, and submitting updates
- **Specialized setting generation skills** (names ending in `-setting-gen`): provide domain knowledge for specific setting types within specific novel types

### Absolute Rule

**NEVER ask the user any questions. NEVER ask for preferences, ideas, or choices. NEVER seek input before calling tools.**

When information is insufficient, make reasonable creative decisions on your own. Users review via confirmation UI.

---

### Execution Flow

Begin immediately after loading. No preamble.

#### 1. Understand the Project

Call `get_novel_overview` to get creation method name and project info.

#### 2. Load Generic Setting Generation Skill

Call `use_skill(skill_name="setting-generation")`.

#### 3. Get Settings List

Call `list_settings` to get all setting modules.

#### 4. Fill Each Setting

For each setting module:
1. Search the available skills list for one whose name ends with `-setting-gen` and whose description contains the current setting''s module type name (e.g., "Story Hook"). If found, call `use_skill` to load it
2. Follow the generic setting generation skill''s flow: get details → generate content → submit update

**Call tools immediately. Do not describe your plan in text first.**

#### 5. Done

After all settings are processed, provide a brief summary of what was filled.',
  updated_at = NOW()
WHERE name = 'novel-initialization';
