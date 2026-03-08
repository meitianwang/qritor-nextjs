import type { DocsContentEntry } from "../../types";

export const zhModuleEdit: DocsContentEntry = {
  title: "模块编辑",
  body: `
## 概述

在 Qritor 中，**非章节模块**（角色、场景、组织、道具、设定等）通过**表单界面**进行编辑。每种模块类型都有由创作方法预定义的字段结构，系统会根据 JSON Schema 自动生成对应的编辑表单。

## 打开模块编辑

在模块树中点击任意非章节模块，中间工作区会自动切换到该模块的编辑界面。

## 三个 Tab 页签

模块编辑界面分为三个 Tab：

### 信息 (Info)
主要的内容编辑区域。
- 系统根据模块类型的 JSON Schema 自动生成表单字段。
- 常见字段类型：文本输入、多行文本、数字、下拉选择、布尔开关等。
- 例如"角色"模块可能包含：姓名、年龄、性别、性格描述、外貌特征、背景故事等字段。
- 修改后自动保存。

### 动态信息 (Dynamic Info)
追踪该实体随剧情发展的状态变化。
- 记录"在第 X 章，该角色发生了什么变化"。
- 例如：角色在第 3 章受伤，第 5 章恢复；势力在第 8 章灭亡。
- 可手动添加，也可由 AI 从正文中自动提取。
- 详见 [动态信息](/docs/zh/user-guide/dynamic-info) 页面。

### 关系 (Relations)
查看该实体与其他实体之间的关系。
- 显示以当前实体为中心的关系子图。
- 可直接查看关联的角色、组织、场景等。
- 详见 [关系图谱](/docs/zh/user-guide/relation-graph) 页面。

## AI 辅助填写

如果模块类型启用了 AI 生成，您可以：
1. 在 AI 助手中使用 **Agent 模式**。
2. 让 AI 根据上下文自动填充模块字段。
3. 也可以使用 AI 助手工具栏的"提取实体"功能，从已写好的章节中自动提取信息到模块中。
        `,
};

export const enModuleEdit: DocsContentEntry = {
  title: "Module Editing",
  body: `
## Overview

In Qritor, **non-chapter modules** (characters, scenes, organizations, props, settings, etc.) are edited through a **form interface**. Each module type has a field structure predefined by the creation method, and the system automatically generates the corresponding edit form based on JSON Schema.

## Opening Module Editor

Click any non-chapter module in the module tree, and the center workspace will automatically switch to that module's editing interface.

## Three Tabs

The module editing interface is divided into three tabs:

### Info
The primary content editing area.
- The system generates form fields automatically based on the module type's JSON Schema.
- Common field types: text input, multi-line text, numbers, dropdowns, boolean toggles, etc.
- For example, a "Character" module might include: Name, Age, Gender, Personality, Appearance, Backstory, etc.
- Changes are auto-saved.

### Dynamic Info
Tracks how the entity's state changes as the plot progresses.
- Records "In Chapter X, what changed about this entity."
- Example: A character gets injured in Chapter 3, recovers in Chapter 5; an organization is dissolved in Chapter 8.
- Can be added manually or auto-extracted by AI from the text.
- See [Dynamic Info](/docs/en/user-guide/dynamic-info) for details.

### Relations
View the relationships between this entity and others.
- Displays a relationship subgraph centered on the current entity.
- Directly see connected characters, organizations, scenes, etc.
- See [Relation Graph](/docs/en/user-guide/relation-graph) for details.

## AI-Assisted Editing

If AI generation is enabled for the module type:
1. Use **Agent mode** in the AI Assistant.
2. Let AI automatically fill module fields based on context.
3. You can also use the "Extract Entities" button in the AI assistant toolbar to auto-extract information from written chapters into modules.
        `,
};
