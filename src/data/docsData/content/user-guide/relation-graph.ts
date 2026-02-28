import type { DocsContentEntry } from "../../types";

export const zhRelationGraph: DocsContentEntry = {
    title: "关系图谱",
    description:
      "以可视化网络图展示作品中所有实体的关系网络，支持图谱视图、列表视图和时间轴模式。",
    body: `
## 什么是关系图谱

写长篇小说时，角色之间的师徒、敌对、恋人关系，组织之间的隶属和同盟关系，往往错综复杂。当人物和势力越来越多，光靠记忆很难理清"谁跟谁是什么关系"。

关系图谱把您作品中所有实体之间的关系以**可视化网络图**的形式呈现出来——每个实体是一个节点，关系是连接节点的线条。一眼就能看清人物关系的全貌。

![关系图谱](/images/features/dynamic_graph.png)

## 打开方式

在编辑器底部 Tab 栏中，点击 **「关系图谱」** 即可打开关系图谱面板。

## 节点与连线

### 节点

图谱中的每个节点代表一个实体（角色、组织、场景、道具等）。节点以卡片形式展示，包含：

- **实体名称**
- **类型标签**（带颜色区分）
- **简介描述**（自动从模块中提取）
- **关系数量**（显示该实体有多少条关系）

不同实体类型以不同颜色呈现：

| 实体类型 | 颜色 |
|---------|------|
| **角色** | 青色 |
| **场景** | 蓝青色 |
| **道具** | 琥珀色 |
| **组织** | 紫色 |
| **通用实体** | 灰色 |

### 连线

连接两个节点的线条代表一条关系。线条中间会以胶囊形标签显示关系名称（如"师徒""敌对""恋人"等）。

点击某个节点时，与该节点相关的所有连线会高亮显示，其余连线变淡，帮助您快速聚焦某个角色的关系网。

## 视图模式

关系图谱提供两种查看方式，可在面板顶部切换：

### 图谱视图

以网络图形式展示，直观呈现关系的整体结构。支持以下操作：

- **缩放**：鼠标滚轮放大或缩小
- **平移**：按住鼠标左键拖拽画布
- **移动节点**：拖拽单个节点调整位置
- **查看关系详情**：点击连线，弹窗显示关系描述和关系强度
- **高亮关联**：点击节点，该节点的所有关系连线高亮，再次点击取消

系统会使用力导向布局算法自动排列节点，关系紧密的实体会靠得更近。

### 列表视图

以文字列表形式展示所有关系，按实体分组。每条关系显示"实体 A → 关系类型 → 实体 B"。适合在关系较多时快速浏览和搜索。

## 搜索与筛选

在面板顶部的搜索框中输入关键词（实体名称或关系类型），图谱会实时过滤，只显示匹配的关系。面板底部会显示当前的过滤结果数量。

## 时间轴模式

当您至少在一个章节中使用过"提取实体关系"功能后，面板顶部会出现 **「时间轴模式」** 开关。开启后，可以通过滑块选择章节进度，查看故事在不同阶段的关系状态。

例如：选择"第 5 章"时，图谱只显示截至第 5 章已出现的关系；拖动滑块到"第 10 章"，新增的关系会逐步显现。这样您就能清晰地看到角色关系是如何随着剧情推进而演变的。

## 关系属性

每条关系包含以下信息：

| 属性 | 说明 |
|------|------|
| **关系名称** | 关系的类型，如"师徒""恋人""敌对"等 |
| **关系描述** | 对这段关系的补充说明 |
| **关系强度** | 1-5 级，表示关系的紧密程度 |
| **关联章节** | 这段关系首次出现在哪一章 |

系统预设了多种常见关系类型供选择：陌生人、朋友、挚友、敌人、恋人、配偶、师父、弟子、盟友、对手、拥有、隶属、领导、控制等。您也可以自定义任意关系名称。

**重要特性**：同一对实体之间只保留一条关系。如果两个角色的关系发生变化（如从"朋友"变为"敌人"），应使用"更新关系"而不是新建一条，这样时间轴模式才能正确追踪关系的演变。

## 创建关系的方式

### AI 自动提取

这是最高效的方式。在章节编辑器工具栏中，点击 **「提取实体关系」** 按钮：

1. AI 分析当前章节正文，自动识别实体之间的关系
2. 提取结果在 AI 助手中展示，每条关系显示两端实体、关系类型和描述
3. AI 会标注哪些是新关系、哪些是已有关系的变化
4. 您勾选要保留的关系，点击 **「写入图谱」** 批量添加

### AI Agent 操作

在 Agent 模式下，您可以用自然语言直接管理关系：

- "把张三和李四设为师徒关系"
- "更新张三和王五的关系为敌对，强度 5"
- "删除张三和李四之间的关系"

AI 会自动调用对应的创建、更新或删除操作。

### 手动添加

在模块编辑界面切换到 **「关系」** Tab，可以手动为当前实体添加关系，选择目标实体和关系类型。

## 使用建议

- **边写边提取**：每写完一章，用"提取实体关系"让 AI 自动更新图谱，省去手动维护的麻烦
- **善用时间轴**：通过时间轴回顾关系变化，检查角色关系的发展是否合理
- **搭配动态信息使用**：关系图谱与 [动态信息](/docs/zh/user-guide/dynamic-info) 配合，完整追踪实体的关系变化和状态变迁
- **AI 创作参考**：AI 在续写时会参考关系图谱，确保不会写出"已是敌人的角色还在亲密合作"这类矛盾
        `,
  };

export const enRelationGraph: DocsContentEntry = {
    title: "Relation Graph",
    description:
      "Visualize all entity relationships in your work as an interactive network graph, with graph view, list view, and timeline mode.",
    body: `
## What Is the Relation Graph

When writing long-form fiction, the relationships between characters — mentorships, rivalries, romances — along with alliances and hierarchies between organizations, can become incredibly complex. As the cast and factions grow, it becomes impossible to keep track of "who is related to whom and how" by memory alone.

The Relation Graph presents all relationships between entities in your work as a **visual network** — each entity is a node, and relationships are lines connecting them. You can see the full picture of your character web at a glance.

![Relation Graph](/images/features/dynamic_graph.png)

## How to Access

Click the **"Relation Graph"** tab in the tab bar at the bottom of the editor to open the panel.

## Nodes and Edges

### Nodes

Each node in the graph represents an entity (character, organization, scene, prop, etc.). Nodes are displayed as cards showing:

- **Entity name**
- **Type label** (color-coded)
- **Brief description** (automatically extracted from the module)
- **Relationship count** (how many relationships this entity has)

Different entity types are distinguished by color:

| Entity Type | Color |
|------------|-------|
| **Character** | Teal |
| **Scene** | Cyan |
| **Prop** | Amber |
| **Organization** | Purple |
| **Generic Entity** | Gray |

### Edges

Lines connecting two nodes represent relationships. A capsule-shaped label in the middle of each line displays the relationship name (e.g., "Master-Student", "Rivals", "Lovers").

When you click a node, all edges connected to it are highlighted while others fade out, helping you quickly focus on a specific character's relationship network.

## View Modes

The Relation Graph offers two viewing modes, switchable at the top of the panel:

### Graph View

Displays relationships as a network diagram, providing an intuitive overview of the overall structure. Supported interactions:

- **Zoom**: Mouse scroll wheel to zoom in/out
- **Pan**: Hold left mouse button and drag the canvas
- **Move Nodes**: Drag individual nodes to adjust positions
- **View Relationship Details**: Click an edge to see a popup with description and strength
- **Highlight Connections**: Click a node to highlight all its relationships; click again to deselect

The system uses a force-directed layout algorithm to automatically arrange nodes — closely related entities are placed nearer to each other.

### List View

Displays all relationships as a text list, grouped by entity. Each relationship shows "Entity A → Relationship Type → Entity B". Ideal for quickly browsing and searching when there are many relationships.

## Search and Filter

Type keywords (entity names or relationship types) in the search box at the top of the panel. The graph filters in real time, showing only matching relationships. The panel footer displays the current filtered count.

## Timeline Mode

Once you have used the "Extract Relations" feature on at least one chapter, a **"Timeline Mode"** toggle will appear at the top of the panel. Enable it to use a slider to select a chapter point, viewing the relationship state at different stages of your story.

For example: selecting "Chapter 5" shows only relationships that have appeared up to Chapter 5; dragging the slider to "Chapter 10" gradually reveals newly formed relationships. This lets you clearly see how character relationships evolve as the plot progresses.

## Relationship Properties

Each relationship contains the following information:

| Property | Description |
|----------|-------------|
| **Relationship Name** | The type, such as "Master-Student", "Lovers", "Rivals", etc. |
| **Description** | Supplementary notes about the relationship |
| **Strength** | Level 1-5, indicating how close the relationship is |
| **Associated Chapter** | Which chapter this relationship first appears in |

The system provides several preset relationship types to choose from: Stranger, Friend, Best Friend, Enemy, Lover, Spouse, Master, Disciple, Ally, Rival, Owns, Belongs To, Leads, Controls, and more. You can also define any custom relationship name.

**Important**: Only one relationship is kept between the same pair of entities. If two characters' relationship changes (e.g., from "Friends" to "Enemies"), you should update the existing relationship rather than creating a new one, so the timeline mode can correctly track the evolution.

## Ways to Create Relationships

### AI Auto-Extraction

This is the most efficient method. In the chapter editor toolbar, click the **"Extract Relations"** button:

1. AI analyzes the current chapter text and automatically identifies relationships between entities
2. Extracted results are displayed in the AI assistant, showing both entities, relationship type, and description for each
3. AI marks which are new relationships and which are changes to existing ones
4. Check the relationships you want to keep, then click **"Write to Graph"** to batch-add them

### AI Agent Operations

In Agent mode, you can manage relationships using natural language:

- "Set the relationship between Alice and Bob as mentor-student"
- "Update Alice and Charlie's relationship to rivals, strength 5"
- "Delete the relationship between Alice and Bob"

AI will automatically invoke the corresponding create, update, or delete operations.

### Manual Addition

In the module editing interface, switch to the **"Relations"** tab to manually add relationships for the current entity, selecting the target entity and relationship type.

## Tips

- **Extract as You Write**: After finishing each chapter, use "Extract Relations" to let AI auto-update the graph, saving you manual maintenance
- **Leverage the Timeline**: Use timeline mode to review relationship changes and check whether character relationship development makes sense
- **Use with Dynamic Info**: The Relation Graph works together with [Dynamic Info](/docs/en/user-guide/dynamic-info) to fully track relationship changes and state transitions
- **AI Writing Reference**: AI references the Relation Graph when continuing your story, ensuring it won't write contradictions like "characters who are enemies suddenly cooperating closely"
        `,
  };
