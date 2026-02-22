import type { DocsContentEntry } from '../types'

// ============== 支持与下载 ==============

export const zhSupportContent: Record<string, DocsContentEntry> = {
    'download-guide': {
        breadcrumb: '支持',
        title: '下载安装指南',
        description: '本指南将帮助您下载和安装 Qritor 桌面客户端，包含详细的系统要求和安装步骤。',
        body: `
## 系统要求

### macOS
- macOS 10.15 (Catalina) 或更高版本
- Apple Silicon (M1/M2/M3) 或 Intel 处理器
- 至少 4GB 内存
- 500MB 可用磁盘空间

### Windows
- Windows 10 (64位) 或更高版本
- 至少 4GB 内存
- 500MB 可用磁盘空间

## 下载地址

访问 [下载页面](/download) 获取最新版本的 Qritor 桌面客户端。

页面会自动检测您的操作系统，推荐最适合的版本。您也可以手动选择其他版本。

---

## macOS 安装指南

### 第一步：选择正确的版本

- **Apple Silicon (M1/M2/M3 芯片)** → 下载 **arm64** 版本
- **Intel 芯片** → 下载 **x64** 版本

不确定自己的芯片类型？点击左上角  → 「关于本机」查看。

### 第二步：安装应用

1. 双击下载的 \`.dmg\` 文件，打开安装镜像
2. 在弹出的窗口中，将 **Qritor 图标** 拖动到 **Applications 文件夹**
3. 等待复制完成

### 第三步：首次启动

1. 打开「访达」→「应用程序」文件夹
2. 双击 **Qritor** 启动应用
3. 应用已通过 Apple 公证，可直接运行

### macOS 常见问题

**Q: 提示"Qritor 已损坏，无法打开"怎么办？**

这通常是因为下载不完整。请重新下载安装包，确保下载完成后再安装。

**Q: 如何卸载？**

将「应用程序」文件夹中的 Qritor 拖入废纸篓即可。

---

## Windows 安装指南

### 重要提示：安全警告说明

由于 Qritor 是新发布的软件，Windows 和浏览器会显示安全警告。**这是正常现象**，不代表软件有问题。

原因：Windows SmartScreen 基于软件的下载量来判断信任度，新软件需要积累一定用户量后警告才会消失。

### 第一步：下载安装包

点击下载提示右侧的 **「...」** 按钮
2. 在弹出菜单中选择 **「保留」**

![选择保留文件](/images/docs/win-download-warning-2.png)

### 第二步：处理 SmartScreen 警告

双击安装包时，可能会看到 Microsoft Defender SmartScreen 警告：

![SmartScreen 警告](/images/docs/win-download-warning-1.png)

**解决方法：**

1. 点击弹窗右下角的 **「...」** 按钮
2. 选择 **「仍然保留」**
3. 再次双击安装包即可正常安装

### 第三步：完成安装

1. 在安装向导中，可以选择安装位置（建议保持默认）
2. 可以选择是否创建桌面快捷方式
3. 点击「安装」等待完成
4. 安装完成后，勾选「运行 Qritor」并点击「完成」

### 第四步：首次启动

安装完成后，可以通过以下方式启动 Qritor：
- 桌面快捷方式
- 开始菜单搜索「Qritor」
- 开始菜单 → 所有程序 → Qritor

### Windows 常见问题

**Q: 安装后打开是黑屏/白屏怎么办？**

尝试以下方法：
1. 完全关闭 Qritor（检查任务栏托盘图标）
2. 右键点击 Qritor 快捷方式 → 「以管理员身份运行」

**Q: 如何卸载？**

1. 打开「设置」→「应用」→「已安装的应用」
2. 找到 Qritor，点击「卸载」

---

## 自动更新

Qritor 支持自动更新功能：

1. 当有新版本发布时，应用会在启动时自动检测
2. 弹出更新提示后，点击「立即更新」
3. 下载完成后会自动安装并重启应用

您也可以在应用内手动检查更新：设置 → 关于 → 检查更新

---

## 数据安全

- **本地存储**：所有创作数据存储在您的本地设备
- **隐私保护**：我们不会收集您的创作内容

## 获取帮助

遇到问题？您可以：
- 查看 [常见问题](/docs/zh/support/faq)
- 通过 [联系我们](/docs/zh/support/contact) 获取支持
        `,
        quickLinks: []
    },
}

export const enSupportContent: Record<string, DocsContentEntry> = {
    'download-guide': {
        breadcrumb: 'Support',
        title: 'Download & Install Guide',
        description: 'This guide will help you download and install the Qritor desktop client, including detailed system requirements and installation steps.',
        body: `
## System Requirements

### macOS
- macOS 10.15 (Catalina) or later
- Apple Silicon (M1/M2/M3) or Intel processor
- At least 4GB RAM
- 500MB available disk space

### Windows
- Windows 10 (64-bit) or later
- At least 4GB RAM
- 500MB available disk space

## Download

Visit the [Download Page](/download) to get the latest version of Qritor desktop client.

The page will automatically detect your operating system and recommend the best version.

---

## macOS Installation Guide

### Step 1: Choose the Right Version

- **Apple Silicon (M1/M2/M3 chip)** → Download **arm64** version
- **Intel chip** → Download **x64** version

Not sure about your chip type? Click Apple menu → "About This Mac" to check.

### Step 2: Install the App

1. Double-click the downloaded \`.dmg\` file to open the disk image
2. Drag the **Qritor icon** to the **Applications folder**
3. Wait for the copy to complete

### Step 3: First Launch

1. Open "Finder" → "Applications" folder
2. Double-click **Qritor** to launch
3. The app is Apple notarized and will run directly

---

## Windows Installation Guide

### Important: About Security Warnings

Since Qritor is newly released software, Windows and browsers will display security warnings. **This is normal** and doesn't mean there's anything wrong with the software.

### Step 1: Download the Installer

After clicking download, your browser may show a warning:

![Browser download warning](/images/docs/win-download-warning-3.png)

**Solution:** Click the **"..."** button, then select **"Keep"**

![Select Keep file](/images/docs/win-download-warning-2.png)

### Step 2: Handle SmartScreen Warning

When opening the installer, you may see a SmartScreen warning:

![SmartScreen warning](/images/docs/win-download-warning-1.png)

**Solution:** Click **"..."** → **"Keep anyway"**

### Step 3: Complete Installation

1. Choose installation location (keep default recommended)
2. Choose whether to create desktop shortcut
3. Click "Install" and wait
4. Check "Run Qritor" and click "Finish"

---

## Auto Update

Qritor supports automatic updates. When a new version is released, the app will prompt you to update.

## Data Security

- **Local Storage**: All creative data is stored on your local device
- **Privacy**: We don't collect your creative content

## Get Help

- Check the [FAQ](/docs/en/support/faq)
- [Contact Us](/docs/en/support/contact) for support
        `,
        quickLinks: []
    },
}
