-- 全局角色初始化 Skill（Layer 1 编排层）
-- novel_creation_method_id = NULL 表示全局可用
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-character-initialization.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'character-initialization',
  '角色初始化：批量为角色库生成核心角色阵容，逐个加载专属角色生成技能并创建角色',
  'Character initialization: batch-generate core character lineup for the character library, loading specialized character generation skills for each',
  '## 角色初始化技能（编排层）

批量初始化小说项目的核心角色阵容。本技能负责编排流程，具体生成能力由两层技能提供：
- **通用角色生成技能**（`character-generation`）：提供获取 Schema、生成属性、创建角色的通用流程
- **专属角色生成技能**（名称以 `-character-gen` 结尾）：提供特定小说类型下的角色设计领域知识

### 绝对禁止

**禁止向用户提问。禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。**

信息不足时自行做出合理的创意决策。用户通过确认 UI 审批，不需要事先询问。

---

### 执行流程

加载后立即执行，不要输出开场白。

#### 1. 了解项目

调用 `get_novel_overview`，获取创作方法名称和项目信息。

#### 2. 收集设定上下文

调用 `list_settings`，读取所有设定模块的内容（世界观、穿越设定、金手指等）。这些设定是角色设计的基础——角色的身份、能力、关系必须与世界观和故事设定一致。

#### 3. 加载通用角色生成技能

调用 `use_skill(skill_name="character-generation")`。

#### 4. 加载专属角色生成技能

在可用技能列表中查找：名称以 `-character-gen` 结尾，且描述中包含「角色」的技能。如有，调用 `use_skill` 加载。

#### 5. 规划角色阵容

根据设定内容和故事类型，规划一个合理的初始角色阵容。典型配置：

- **主角**（1 个）：穿越者/主人公
- **核心配角**（2-4 个）：主角的盟友、导师、爱人等
- **反派**（1-2 个）：主要对手/敌人
- **工具人**（1-2 个）：推动特定剧情的功能性角色

根据故事设定灵活调整数量和类型。

#### 6. 逐个生成

对每个规划的角色，按通用角色生成技能的流程执行：获取 Schema → 生成属性 → 创建角色 → 建立关系。

**立即调用工具，不要先用文字描述计划。**

**每个角色创建后等待用户确认，确认后再创建下一个。**

#### 7. 完成

所有角色创建完毕后，简要总结已创建的角色阵容及其关系。',
  '## Character Initialization Skill (Orchestration Layer)

Batch-initialize the core character lineup for a novel project. This skill orchestrates the flow; actual generation is powered by two skill layers:
- **Generic character generation skill** (`character-generation`): provides the universal flow for reading schemas, generating attributes, and creating characters
- **Specialized character generation skills** (names ending in `-character-gen`): provide domain knowledge for character design within specific novel types

### Absolute Rule

**NEVER ask the user any questions. NEVER ask for preferences, ideas, or choices. NEVER seek input before calling tools.**

When information is insufficient, make reasonable creative decisions on your own. Users review via confirmation UI.

---

### Execution Flow

Begin immediately after loading. No preamble.

#### 1. Understand the Project

Call `get_novel_overview` to get creation method name and project info.

#### 2. Collect Setting Context

Call `list_settings` to read all setting modules (worldview, crossing setup, cheat ability, etc.). Settings are the foundation for character design — character identity, abilities, and relationships must align with worldview and story settings.

#### 3. Load Generic Character Generation Skill

Call `use_skill(skill_name="character-generation")`.

#### 4. Load Specialized Character Generation Skill

Search the available skills list for one whose name ends with `-character-gen` and whose description contains "角色" (character). If found, call `use_skill` to load it.

#### 5. Plan Character Lineup

Based on settings and story type, plan a reasonable initial character lineup. Typical configuration:

- **Protagonist** (1): The transmigrator/main character
- **Core supporting characters** (2-4): Allies, mentors, love interests
- **Antagonists** (1-2): Main opponents/enemies
- **Functional characters** (1-2): Characters that drive specific plot points

Adjust numbers and types flexibly based on the story settings.

#### 6. Generate One by One

For each planned character, follow the generic character generation skill''s flow: get Schema → generate attributes → create character → establish relations.

**Call tools immediately. Do not describe your plan in text first.**

**After creating each character, wait for user confirmation before creating the next.**

#### 7. Done

After all characters are created, provide a brief summary of the character lineup and their relationships.',
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
