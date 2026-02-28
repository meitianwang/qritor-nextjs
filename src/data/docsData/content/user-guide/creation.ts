import type { DocsContentEntry } from "../../types";

export const zhCreation: DocsContentEntry = {
    title: "创作功能",
    body: `
Qritor 的创作核心围绕 **"工程化写作"** 理念设计。

## 小说管理
在侧边栏的「小说」页面，您可以管理所有的作品。创建作品时，最重要的一步是选择 **创作方法**。
- 创作方法按小说题材分类（穿越、末世、灵异等），每种方法预定义了适合该题材的模块类型和结构。
- 选择创作方法后，系统会根据方法中定义的单例模块自动生成初始模块。

## 模块化编辑
不同于传统写作软件的线性文档，Qritor 将一个作品拆分为多个 **模块 (Module)**。
- **模块树**：在左侧，您可以创建章节、分卷、角色卡、地理设定等任何类型的节点。
- **Tab页签**：中间的工作区支持多开 Tab，您可以同时打开大纲和正文，对照写作。
- **模块库**：如果不习惯树状结构，可以在 "Library" 视图中以卡片形式查看所有模块。
        `,
  };

export const enCreation: DocsContentEntry = {
    title: "Creation Features",
    body: `
Qritor's core design philosophy is built around **"Engineering-based Writing"**.

## Novel Management
On the "Novels" page in the sidebar, you can manage all your works. When creating a novel, the most crucial step is selecting a **Creation Method**.
- Creation methods are organized by novel genre (time travel, post-apocalyptic, supernatural, etc.), each with predefined module types and structure for that genre.
- After selecting a method, the system will automatically generate initial modules based on the method's singleton module definitions.

## Modular Editing
Unlike linear document editors, Qritor breaks a work down into multiple **Modules**.
- **Module Tree**: On the left, you can create nodes of any type: chapters, volumes, character sheets, geographical settings, etc.
- **Tabs**: The center workspace supports multiple tabs, allowing you to open outlines and chapters side-by-side for reference.
- **Library**: If you prefer a non-tree view, the "Library" view shows all modules as cards.
        `,
  };
