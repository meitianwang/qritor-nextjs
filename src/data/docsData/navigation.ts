import type { DocsNavigation } from "./types";

// 文档导航结构
export const docsNavigation: Record<string, DocsNavigation> = {
  zh: {
    quickStart: {
      title: "快速入门",
      items: [
        { id: "overview", title: "产品概述", path: "/docs/zh/" },
        { id: "quick-start", title: "快速开始", path: "/docs/zh/quick-start" },
        {
          id: "best-practices",
          title: "最佳实践",
          path: "/docs/zh/best-practices",
        },
      ],
    },
    userGuide: {
      title: "小说创作",
      items: [
        {
          id: "novel-create",
          title: "创建小说",
          path: "/docs/zh/user-guide/creation/novel-create",
        },
        {
          id: "creation-methods",
          title: "创作方法",
          path: "/docs/zh/user-guide/creation/creation-methods",
        },
        {
          id: "novel-settings",
          title: "小说设定",
          path: "/docs/zh/user-guide/novel-settings",
        },
        {
          id: "ai-modes",
          title: "AI 模式",
          path: "/docs/zh/user-guide/ai-modes",
        },
        {
          id: "ai-mention",
          title: "@提及",
          path: "/docs/zh/user-guide/ai-mention",
        },
        {
          id: "ai-assistant",
          title: "聊天",
          path: "/docs/zh/user-guide/ai-assistant",
        },
        {
          id: "smart-write",
          title: "智能写作工具",
          path: "/docs/zh/user-guide/smart-write",
        },
        {
          id: "editor-toolbar",
          title: "编辑器基础工具",
          path: "/docs/zh/user-guide/editor-toolbar",
        },
        {
          id: "chat-history",
          title: "对话管理",
          path: "/docs/zh/user-guide/chat-history",
        },
        {
          id: "ai-models",
          title: "模型",
          path: "/docs/zh/user-guide/ai-models",
        },
        {
          id: "characters",
          title: "角色",
          path: "/docs/zh/user-guide/characters",
        },
        {
          id: "scenes",
          title: "场景",
          path: "/docs/zh/user-guide/scenes",
        },
        {
          id: "props",
          title: "道具",
          path: "/docs/zh/user-guide/props",
        },
        {
          id: "organizations",
          title: "组织",
          path: "/docs/zh/user-guide/organizations",
        },
        {
          id: "dynamic-info",
          title: "动态信息",
          path: "/docs/zh/user-guide/dynamic-info",
        },
        {
          id: "relation-graph",
          title: "关系图谱",
          path: "/docs/zh/user-guide/relation-graph",
        },
        {
          id: "plot-management",
          title: "剧情管理",
          path: "/docs/zh/user-guide/plot-management",
        },
        {
          id: "skills",
          title: "技能",
          path: "/docs/zh/user-guide/skills",
        },
      ],
    },
    pricing: {
      title: "价格",
      items: [
        { id: "credits", title: "积分", path: "/docs/zh/pricing/credits" },
        { id: "pricing-plans", title: "定价", path: "/docs/zh/pricing/plans" },
        { id: "billing", title: "计费", path: "/docs/zh/pricing/billing" },
      ],
    },
    configuration: {
      title: "配置",
      items: [
        {
          id: "configuration",
          title: "系统配置",
          path: "/docs/zh/config/configuration",
        },
        {
          id: "module-config",
          title: "模块配置",
          path: "/docs/zh/config/module",
        },
        {
          id: "keyboard-shortcuts",
          title: "快捷键",
          path: "/docs/zh/config/keyboard-shortcuts",
        },
      ],
    },
    support: {
      title: "支持",
      items: [
        {
          id: "download-guide",
          title: "下载安装指南",
          path: "/docs/zh/support/download-guide",
        },
        { id: "faq", title: "常见问题", path: "/docs/zh/support/faq" },
        { id: "contact", title: "联系我们", path: "/docs/zh/support/contact" },
      ],
    },
  },
  en: {
    quickStart: {
      title: "Quick Start",
      items: [
        { id: "overview", title: "Product Overview", path: "/docs/en/" },
        {
          id: "quick-start",
          title: "Getting Started",
          path: "/docs/en/quick-start",
        },
        {
          id: "best-practices",
          title: "Best Practices",
          path: "/docs/en/best-practices",
        },
      ],
    },
    userGuide: {
      title: "Novel Writing",
      items: [
        {
          id: "novel-create",
          title: "Create Novel",
          path: "/docs/en/user-guide/creation/novel-create",
        },
        {
          id: "creation-methods",
          title: "Creation Methods",
          path: "/docs/en/user-guide/creation/creation-methods",
        },
        {
          id: "novel-settings",
          title: "Novel Settings",
          path: "/docs/en/user-guide/novel-settings",
        },
        {
          id: "ai-modes",
          title: "AI Modes",
          path: "/docs/en/user-guide/ai-modes",
        },
        {
          id: "ai-mention",
          title: "@Mention",
          path: "/docs/en/user-guide/ai-mention",
        },
        {
          id: "ai-assistant",
          title: "Chat",
          path: "/docs/en/user-guide/ai-assistant",
        },
        {
          id: "smart-write",
          title: "Smart Writing Tools",
          path: "/docs/en/user-guide/smart-write",
        },
        {
          id: "editor-toolbar",
          title: "Editor Basics",
          path: "/docs/en/user-guide/editor-toolbar",
        },
        {
          id: "chat-history",
          title: "Conversations",
          path: "/docs/en/user-guide/chat-history",
        },
        {
          id: "ai-models",
          title: "AI Models",
          path: "/docs/en/user-guide/ai-models",
        },
        {
          id: "characters",
          title: "Characters",
          path: "/docs/en/user-guide/characters",
        },
        {
          id: "scenes",
          title: "Scenes",
          path: "/docs/en/user-guide/scenes",
        },
        {
          id: "props",
          title: "Props",
          path: "/docs/en/user-guide/props",
        },
        {
          id: "organizations",
          title: "Organizations",
          path: "/docs/en/user-guide/organizations",
        },
        {
          id: "dynamic-info",
          title: "Dynamic Info",
          path: "/docs/en/user-guide/dynamic-info",
        },
        {
          id: "relation-graph",
          title: "Relation Graph",
          path: "/docs/en/user-guide/relation-graph",
        },
        {
          id: "plot-management",
          title: "Plot Management",
          path: "/docs/en/user-guide/plot-management",
        },
        {
          id: "skills",
          title: "Skills",
          path: "/docs/en/user-guide/skills",
        },
      ],
    },
    pricing: {
      title: "Pricing",
      items: [
        { id: "credits", title: "Credits", path: "/docs/en/pricing/credits" },
        { id: "pricing-plans", title: "Plans", path: "/docs/en/pricing/plans" },
        { id: "billing", title: "Billing", path: "/docs/en/pricing/billing" },
      ],
    },
    configuration: {
      title: "Configuration",
      items: [
        {
          id: "configuration",
          title: "System Configuration",
          path: "/docs/en/config/configuration",
        },
        {
          id: "module-config",
          title: "Module Configuration",
          path: "/docs/en/config/module",
        },
        {
          id: "keyboard-shortcuts",
          title: "Keyboard Shortcuts",
          path: "/docs/en/config/keyboard-shortcuts",
        },
      ],
    },
    support: {
      title: "Support",
      items: [
        {
          id: "download-guide",
          title: "Download & Install Guide",
          path: "/docs/en/support/download-guide",
        },
        { id: "faq", title: "FAQ", path: "/docs/en/support/faq" },
        {
          id: "contact",
          title: "Contact Us",
          path: "/docs/en/support/contact",
        },
      ],
    },
  },
};
