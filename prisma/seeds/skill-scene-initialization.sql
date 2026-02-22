-- 全局场景初始化 Skill（Layer 1 编排层）
-- novel_creation_method_id = NULL 表示全局可用
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-scene-initialization.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'scene-initialization',
  '场景初始化：批量为场景库生成核心场景阵容，逐个加载专属场景生成技能并创建场景',
  'Scene initialization: batch-generate core scene lineup for the scene library, loading specialized scene generation skills for each',
  '## 场景初始化技能（编排层）

批量初始化小说项目的核心场景阵容。本技能负责编排流程，具体生成能力由两层技能提供：
- **场景操作技能**（`scene-operations`）：提供获取 Schema、生成属性、创建场景的通用流程
- **专属场景生成技能**（名称以 `-scene-gen` 结尾）：提供特定小说类型下的场景设计领域知识

### 绝对禁止

**禁止向用户提问。禁止询问偏好、想法、选择。禁止在调用工具之前征求意见。**

信息不足时自行做出合理的创意决策。用户通过确认 UI 审批，不需要事先询问。

---

### 执行流程

加载后立即执行，不要输出开场白。

#### 1. 了解项目

调用 `get_novel_overview`，获取创作方法名称和项目信息。

#### 2. 收集设定上下文

调用 `list_settings`，读取所有设定模块的内容（世界观、穿越设定、金手指等）。这些设定是场景设计的基础——场景的地理位置、文化氛围、功能定位必须与世界观和故事设定一致。

#### 3. 了解已有角色

调用 `list_characters`，获取已有角色列表。场景与角色紧密关联——角色的活动场所、势力据点等信息是场景设计的重要参考。

#### 4. 加载场景操作技能

调用 `use_skill(skill_name="scene-operations")`。

#### 5. 加载专属场景生成技能

在可用技能列表中查找：名称以 `-scene-gen` 结尾，且描述中包含「场景」的技能。如有，调用 `use_skill` 加载。

#### 6. 规划场景阵容

根据设定内容和故事类型，规划一个合理的初始场景阵容。典型配置：

- **核心场景**（3-5 个）：故事主要发生地，承载核心剧情和角色互动
- **次要场景**（2-4 个）：支线剧情或过渡场景，丰富世界观表现
- **特殊场景**（1-2 个）：关键事件发生地（决战、转折点等）

根据故事设定灵活调整数量和类型。场景之间应有空间逻辑关系。

#### 7. 逐个生成

对每个规划的场景，按场景操作技能的创建流程执行：获取 Schema → 生成属性 → 创建场景 → 建立关系。

**立即调用工具，不要先用文字描述计划。**

**每个场景创建后等待用户确认，确认后再创建下一个。**

#### 8. 完成

所有场景创建完毕后，简要总结已创建的场景阵容及其空间关系。',
  '## Scene Initialization Skill (Orchestration Layer)

Batch-initialize the core scene lineup for a novel project. This skill orchestrates the flow; actual generation is powered by two skill layers:
- **Scene operations skill** (`scene-operations`): provides the universal flow for reading schemas, generating attributes, and creating scenes
- **Specialized scene generation skills** (names ending in `-scene-gen`): provide domain knowledge for scene design within specific novel types

### Absolute Rule

**NEVER ask the user any questions. NEVER ask for preferences, ideas, or choices. NEVER seek input before calling tools.**

When information is insufficient, make reasonable creative decisions on your own. Users review via confirmation UI.

---

### Execution Flow

Begin immediately after loading. No preamble.

#### 1. Understand the Project

Call `get_novel_overview` to get creation method name and project info.

#### 2. Collect Setting Context

Call `list_settings` to read all setting modules (worldview, crossing setup, cheat ability, etc.). Settings are the foundation for scene design — scene geography, cultural atmosphere, and narrative function must align with worldview and story settings.

#### 3. Understand Existing Characters

Call `list_characters` to get the existing character list. Scenes and characters are tightly linked — character activity locations, faction bases, etc. are important references for scene design.

#### 4. Load Scene Operations Skill

Call `use_skill(skill_name="scene-operations")`.

#### 5. Load Specialized Scene Generation Skill

Search the available skills list for one whose name ends with `-scene-gen` and whose description contains "场景" (scene). If found, call `use_skill` to load it.

#### 6. Plan Scene Lineup

Based on settings and story type, plan a reasonable initial scene lineup. Typical configuration:

- **Core scenes** (3-5): Main story locations, hosting core plot and character interactions
- **Secondary scenes** (2-4): Subplot or transitional scenes, enriching worldview
- **Special scenes** (1-2): Key event locations (final battles, turning points, etc.)

Adjust numbers and types flexibly based on story settings. Scenes should have logical spatial relationships.

#### 7. Generate One by One

For each planned scene, follow the scene operations skill''s creation flow: get Schema → generate attributes → create scene → establish relations.

**Call tools immediately. Do not describe your plan in text first.**

**After creating each scene, wait for user confirmation before creating the next.**

#### 8. Done

After all scenes are created, provide a brief summary of the scene lineup and their spatial relationships.',
  NULL,
  1,
  7,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
