import type { DocsContentEntry } from '../types'

export const zhConfigContent: Record<string, DocsContentEntry> = {
    'keyboard-shortcuts': {
        breadcrumb: '配置',
        title: '快捷键',
        description: 'Qritor 桌面客户端的完整默认快捷键列表，按功能分组。',
        body: `
以下是 Qritor 桌面客户端的完整默认快捷键列表，按功能分组。所有快捷键均可在设置面板中自定义。

## 编辑器操作

在编辑器中使用的 AI 辅助写作快捷键。

| 功能 | macOS | Windows / Linux |
|------|-------|-----------------|
| 写作（AI 续写） | \`⌘ G\` | \`Ctrl G\` |
| 润色 | \`⌘ P\` | \`Ctrl P\` |
| 添加到对话 | \`⌘ L\` | \`Ctrl L\` |
| 大纲 | \`⌘ O\` | \`Ctrl O\` |
| 参与实体 | \`⌘ E\` | \`Ctrl E\` |
| 质量检查 | \`⌘ Q\` | \`Ctrl Q\` |
| 文风检测 | \`⌘ Y\` | \`Ctrl Y\` |

> **说明**：「润色」和「添加到对话」需要先选中文字才能触发；「写作」等其他操作无需选中。

## 面板导航

在任何上下文中都可使用的面板切换快捷键。

| 功能 | macOS | Windows / Linux |
|------|-------|-----------------|
| 切换到编辑器 | \`⌘ 1\` | \`Ctrl 1\` |
| 切换到关系图谱 | \`⌘ 2\` | \`Ctrl 2\` |
| 切换到剧情管理 | \`⌘ 3\` | \`Ctrl 3\` |
| 聚焦 AI 助手输入框 | \`⌘ J\` | \`Ctrl J\` |
| 打开 / 关闭模块树 | \`⌘ B\` | \`Ctrl B\` |
| 打开 / 关闭创作助手 | \`⌘ /\` | \`Ctrl /\` |

## 文件操作

| 功能 | macOS | Windows / Linux |
|------|-------|-----------------|
| 新建对话 | \`⌘ N\` | \`Ctrl N\` |

## 自定义快捷键

所有快捷键均可自定义。打开方式：

1. 点击左侧边栏底部的 **设置** 按钮
2. 切换到 **快捷键** 标签页
3. 点击要修改的快捷键，按下新的键位组合即可

### 冲突检测

修改快捷键时，系统会自动检测是否与其他快捷键冲突。如果存在冲突，会显示提示信息并阻止保存，需要更换为不冲突的键位组合。

### 恢复默认

- 点击单个快捷键旁的重置图标可恢复该项的默认键位
- 点击页面底部的「恢复全部默认快捷键」可一次性重置所有设置
        `
    },
}

export const enConfigContent: Record<string, DocsContentEntry> = {
    'keyboard-shortcuts': {
        breadcrumb: 'Configuration',
        title: 'Keyboard Shortcuts',
        description: 'Complete list of default keyboard shortcuts in Qritor desktop client, organized by function.',
        body: `
Below is the complete list of default keyboard shortcuts in the Qritor desktop client, organized by function. All shortcuts can be customized in the settings panel.

## Editor Operations

AI-assisted writing shortcuts used within the editor.

| Function | macOS | Windows / Linux |
|----------|-------|-----------------|
| Write (AI Continue) | \`⌘ G\` | \`Ctrl G\` |
| Polish | \`⌘ P\` | \`Ctrl P\` |
| Add to Chat | \`⌘ L\` | \`Ctrl L\` |
| Outline | \`⌘ O\` | \`Ctrl O\` |
| Participating Entities | \`⌘ E\` | \`Ctrl E\` |
| Quality Check | \`⌘ Q\` | \`Ctrl Q\` |
| Style Check | \`⌘ Y\` | \`Ctrl Y\` |

> **Note**: "Polish" and "Add to Chat" require text to be selected first; "Write" and other operations do not.

## Panel Navigation

Panel switching shortcuts available in any context.

| Function | macOS | Windows / Linux |
|----------|-------|-----------------|
| Switch to Editor | \`⌘ 1\` | \`Ctrl 1\` |
| Switch to Relations Graph | \`⌘ 2\` | \`Ctrl 2\` |
| Switch to Plot Management | \`⌘ 3\` | \`Ctrl 3\` |
| Focus AI Assistant Input | \`⌘ J\` | \`Ctrl J\` |
| Toggle Module Tree | \`⌘ B\` | \`Ctrl B\` |
| Toggle AI Assistant | \`⌘ /\` | \`Ctrl /\` |

## File Operations

| Function | macOS | Windows / Linux |
|----------|-------|-----------------|
| New Chat | \`⌘ N\` | \`Ctrl N\` |

## Customize Shortcuts

All shortcuts can be customized. To access:

1. Click the **Settings** button at the bottom of the left sidebar
2. Switch to the **Shortcuts** tab
3. Click the shortcut you want to modify, then press a new key combination

### Conflict Detection

When modifying a shortcut, the system automatically detects conflicts with other shortcuts. If a conflict is found, a warning is displayed and the change is blocked — you'll need to choose a different key combination.

### Reset to Defaults

- Click the reset icon next to any individual shortcut to restore its default binding
- Click "Reset all to defaults" at the bottom of the page to reset all shortcuts at once
        `
    },
}
