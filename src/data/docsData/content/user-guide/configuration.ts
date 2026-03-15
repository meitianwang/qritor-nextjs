import type { DocsContentEntry } from "../../types";

export const zhConfiguration: DocsContentEntry = {
    title: "系统配置",
    description:
      "通过设置面板自定义 Qritor 的语言、Agent 权限、数据同步、软件更新和快捷键。",
    body: `
## 打开设置

点击左侧边栏底部的**齿轮图标**，打开设置面板。设置分为两个标签页：**通用**和**快捷键**。

## 语言

切换 Qritor 的界面语言。目前支持**简体中文**和**英语**，更改后立即生效。

## Agent 操作权限

控制 AI 助手修改作品内容时是否需要您确认：

| 模式 | 说明 |
|------|------|
| **需要确认**（默认） | AI 每次修改内容前都会等待您确认，您可以预览后选择接受或拒绝 |
| **全自动执行** | AI 直接执行修改操作，无需确认。适合信任 AI 判断、追求高效创作的场景 |

建议新用户使用"需要确认"模式，熟悉 AI 的工作方式后再考虑切换。

## 数据同步

Qritor 的创作方法、模块类型和技能等数据存储在云端。数据同步功能让您的本地应用与云端保持一致。

- **立即同步**：点击按钮手动触发一次同步，同步完成后会显示成功或失败状态
- **自动同步**：开启后应用会按设定的频率自动同步（默认每 6 小时）
- **同步频率**：可选 1 小时、3 小时、6 小时、12 小时、1 天、2 天、3 天、7 天

## 软件更新

管理 Qritor 桌面客户端的版本更新：

- **当前版本**：显示您当前安装的版本号
- **检查更新**：手动检查是否有新版本。检查结果会以状态标签显示——绿色表示已是最新，橙色表示发现新版本
- **自动更新**：开启后应用会按设定的频率自动检查更新（默认每 6 小时）
- **检查频率**：可选 1 小时到 7 天的多个间隔

## 布局设置

如果您调整过模块树或 AI 助手面板的宽度，想恢复默认布局，可以点击 **「恢复默认布局」** 按钮。

## 快捷键

切换到**快捷键**标签页，可以查看和自定义所有可用的键盘快捷键。快捷键分为四组：

### 创作助手操作

| 功能 | 默认快捷键 |
|------|-----------|
| 写作（续写） | ⌘G |
| 润色 | ⌘P |
| 添加到对话 | ⌘L |
| 质量检查 | ⌘Q |
| 文风检测 | ⌘Y |

### 编辑器操作

| 功能 | 默认快捷键 |
|------|-----------|
| 大纲 | ⌘O |
| 参与实体 | ⌘E |
| 保存 | ⌘S |
| 搜索 | ⌘F |

### 面板导航

| 功能 | 默认快捷键 |
|------|-----------|
| 编辑器 | ⌘1 |
| 关系图谱 | ⌘2 |
| 剧情管理 | ⌘3 |
| 聚焦 AI 助手 | ⌘J |
| 打开/关闭模块树 | ⌘B |
| 打开/关闭 AI 助手 | ⌘/ |

### 文件操作

| 功能 | 默认快捷键 |
|------|-----------|
| 复制章节纯文本 | ⇧⌘C |
| 新建对话 | ⌘N |

### 自定义快捷键

1. 点击某个快捷键按钮，进入录制模式
2. 按下您想要的组合键（支持 ⌘/Ctrl + 字母键，可搭配 Shift）
3. 如果与其他快捷键冲突，系统会以橙色高亮提示
4. 按 **Esc** 可取消录制

如需恢复，点击单个快捷键旁的重置按钮，或点击底部的 **「全部恢复默认」** 恢复所有快捷键。
        `,
  };

export const enConfiguration: DocsContentEntry = {
    title: "System Configuration",
    description:
      "Customize Qritor's language, Agent permissions, data sync, software updates, and keyboard shortcuts through the settings panel.",
    body: `
## Opening Settings

Click the **gear icon** at the bottom of the left sidebar to open the settings panel. Settings are divided into two tabs: **General** and **Shortcuts**.

## Language

Switch Qritor's interface language. Currently supports **Simplified Chinese** and **English**. Changes take effect immediately.

## Agent Permission Mode

Control whether the AI assistant needs your confirmation before modifying content:

| Mode | Description |
|------|-------------|
| **Require Confirmation** (default) | AI waits for your approval before each modification — you can preview and accept or reject |
| **Auto Execute** | AI executes modifications directly without confirmation. Ideal when you trust AI's judgment and want maximum efficiency |

We recommend new users start with "Require Confirmation" mode and consider switching after becoming familiar with how AI works.

## Data Sync

Qritor's creation methods, module types, and skills are stored in the cloud. Data sync keeps your local app up to date.

- **Sync Now**: Click to manually trigger a sync — shows success or failure status when complete
- **Auto Sync**: When enabled, the app syncs automatically at the set interval (default: every 6 hours)
- **Sync Interval**: Options range from every 1 hour to every 7 days

## Software Updates

Manage version updates for the Qritor desktop client:

- **Current Version**: Shows your currently installed version number
- **Check for Updates**: Manually check for new versions. Results display as a status badge — green means up to date, amber means a new version is available
- **Auto Update**: When enabled, the app checks for updates automatically at the set interval (default: every 6 hours)
- **Check Interval**: Options range from every 1 hour to every 7 days

## Layout Settings

If you've resized the module tree or AI assistant panel and want to restore default widths, click the **"Restore Default Layout"** button.

## Keyboard Shortcuts

Switch to the **Shortcuts** tab to view and customize all available keyboard shortcuts. Shortcuts are organized into four groups:

### Assistant Actions

| Action | Default Shortcut |
|--------|-----------------|
| Write (Continue) | ⌘G |
| Polish | ⌘P |
| Add to Chat | ⌘L |
| Quality Check | ⌘Q |
| Style Check | ⌘Y |

### Editor Operations

| Action | Default Shortcut |
|--------|-----------------|
| Outline | ⌘O |
| Participating Entities | ⌘E |
| Save | ⌘S |
| Search | ⌘F |

### Panel Navigation

| Action | Default Shortcut |
|--------|-----------------|
| Editor | ⌘1 |
| Relation Graph | ⌘2 |
| Plot Management | ⌘3 |
| Focus AI Assistant | ⌘J |
| Toggle Module Tree | ⌘B |
| Toggle AI Assistant | ⌘/ |

### File Operations

| Action | Default Shortcut |
|--------|-----------------|
| Copy Chapter as Plain Text | ⇧⌘C |
| New Chat | ⌘N |

### Customizing Shortcuts

1. Click a shortcut button to enter recording mode
2. Press your desired key combination (supports ⌘/Ctrl + letter keys, optionally with Shift)
3. If it conflicts with another shortcut, the system highlights the conflict in amber
4. Press **Esc** to cancel recording

To restore defaults, click the reset button next to an individual shortcut, or click **"Reset All to Defaults"** at the bottom to restore all shortcuts.
        `,
  };
