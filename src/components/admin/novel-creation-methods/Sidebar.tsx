"use client";

import React, { useMemo, useRef, useState } from "react";
import ModuleTypeEditModal from "@/components/admin/ModuleTypeEditModal";
import JsonSchemaEditor from "@/components/admin/JsonSchemaEditor";

interface Category {
  id: string;
  name: string;
}

interface DeletingItem {
  type: string;
  id: string;
}

interface ModuleType {
  id: string;
  nameZh?: string;
  nameEn?: string;
  singleton: boolean;
  enableAi: boolean;
  [key: string]: any;
}

interface SectionHeaderProps {
  isOpen: boolean;
  onToggle: () => void;
  title: string;
  icon: React.ReactNode;
  onAdd?: () => void;
  addTitle?: string;
  count?: number;
}

interface ListItemProps {
  children: React.ReactNode;
  isActive?: boolean;
  onClick?: () => void;
  actions?: React.ReactNode;
}

interface ActionButtonProps {
  onClick: () => void;
  color?: "gray" | "blue" | "orange" | "red";
  title: string;
  children: React.ReactNode;
}

interface SidebarProps {
  method: Record<string, any> | null;
  moduleTypes: ModuleType[];
  fetchResources: () => Promise<void>;
  deletingItem: DeletingItem | null;
  handleDelete: (type: string, id: string) => void;
  onOpenModal?: () => void;
  showToast: (type: string, message: string) => void;
  isCollapsed: boolean;
  onToggleCollapse: () => void;
  onUpdateVisibleCategories?: (categories: string[]) => void;
}

const Sidebar: React.FC<SidebarProps> = ({
  method,
  moduleTypes,
  fetchResources,
  deletingItem,
  handleDelete,
  onOpenModal,
  showToast,
  isCollapsed,
  onToggleCollapse,
  onUpdateVisibleCategories,
}) => {
  const [isModuleTypesOpen, setIsModuleTypesOpen] = useState(true);
  const [isCategoriesOpen, setIsCategoriesOpen] = useState(true);

  const plotConfig = useMemo(() => {
    if (!method?.plotConfig) return null;
    if (typeof method.plotConfig === "string") {
      try {
        return JSON.parse(method.plotConfig);
      } catch {
        return null;
      }
    }
    return method.plotConfig;
  }, [method]);

  // 所有可能的分组
  const ALL_CATEGORIES: Category[] = [
    { id: "setting", name: "设定" },
    { id: "character", name: "角色库" },
    { id: "scene", name: "场景库" },
    { id: "organization", name: "组织库" },
    { id: "prop", name: "道具库" },
  ];

  const CATEGORY_STYLES: Record<
    string,
    { bg: string; text: string; label: string }
  > = {
    character: { bg: "bg-teal-500/15", text: "text-teal-400", label: "角色" },
    scene: { bg: "bg-cyan-500/15", text: "text-cyan-400", label: "场景" },
    organization: {
      bg: "bg-amber-500/15",
      text: "text-amber-400",
      label: "组织",
    },
    prop: { bg: "bg-emerald-500/15", text: "text-emerald-400", label: "道具" },
    setting: { bg: "bg-rose-500/15", text: "text-rose-400", label: "设定" },
  };

  // Modals refs
  const moduleTypeModalRef = useRef<any>(null);
  const jsonSchemaEditorRef = useRef<any>(null);

  // Section Toggle Component
  const SectionHeader: React.FC<SectionHeaderProps> = ({
    isOpen,
    onToggle,
    title,
    icon,
    onAdd,
    addTitle,
    count,
  }) => (
    <div
      className="flex items-center justify-between mb-3 cursor-pointer group"
      onClick={onToggle}
    >
      <div className="flex items-center gap-2">
        <svg
          className={`w-3.5 h-3.5 text-white/30 transition-transform duration-200 ${isOpen ? "rotate-90" : ""}`}
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth="2"
            d="M9 5l7 7-7 7"
          />
        </svg>
        <span className="text-white/50">{icon}</span>
        <h3 className="text-sm font-semibold text-white/80 group-hover:text-white transition-colors">
          {title}
        </h3>
        {count !== undefined && (
          <span className="text-[10px] px-1.5 py-0.5 bg-white/[0.06] text-white/40 rounded-full min-w-[20px] text-center">
            {count}
          </span>
        )}
      </div>
      {onAdd && (
        <button
          onClick={(e) => {
            e.stopPropagation();
            onAdd();
          }}
          className="p-1.5 text-teal-400/60 hover:text-teal-400 hover:bg-teal-500/10 rounded-lg transition-all"
          title={addTitle}
        >
          <svg
            className="w-4 h-4"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth="2"
              d="M12 4v16m8-8H4"
            />
          </svg>
        </button>
      )}
    </div>
  );

  // List Item Component
  const ListItem: React.FC<ListItemProps> = ({
    children,
    isActive,
    onClick,
    actions,
  }) => (
    <div
      className={`
                group relative p-3 rounded-xl text-sm cursor-pointer transition-all duration-200
                ${
                  isActive
                    ? "bg-gradient-to-r from-teal-500/15 to-cyan-500/10 border border-teal-500/30"
                    : "bg-white/[0.02] border border-white/[0.04] hover:bg-white/[0.04] hover:border-white/[0.08]"
                }
            `}
      onClick={onClick}
    >
      <div className="flex items-center justify-between">
        <div className="flex-1 min-w-0">{children}</div>
        {actions && (
          <div className="flex items-center gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
            {actions}
          </div>
        )}
      </div>
    </div>
  );

  // Action Button Component
  const ActionButton: React.FC<ActionButtonProps> = ({
    onClick,
    color = "gray",
    title,
    children,
  }) => {
    const colorClasses: Record<string, string> = {
      gray: "text-white/40 hover:text-white/60 hover:bg-white/10",
      blue: "text-teal-400/60 hover:text-teal-400 hover:bg-teal-500/10",
      orange: "text-amber-400/60 hover:text-amber-400 hover:bg-amber-500/10",
      red: "text-red-400/60 hover:text-red-400 hover:bg-red-500/10",
    };
    return (
      <button
        onClick={(e) => {
          e.stopPropagation();
          onClick();
        }}
        className={`p-1.5 rounded-lg transition-all ${colorClasses[color]}`}
        title={title}
      >
        {children}
      </button>
    );
  };

  // 折叠状态时不渲染任何内容（展开按钮由父组件处理）
  if (isCollapsed) {
    return null;
  }

  return (
    <div className="w-80 flex flex-col border-r border-white/[0.04] bg-[#0a0a0a]">
      {/* Method Header */}
      <div className="relative p-5 border-b border-white/[0.06]">
        {/* 折叠按钮 - 右上角 */}
        <button
          onClick={onToggleCollapse}
          className="absolute top-4 right-4 p-2 text-white/30 hover:text-white/60 hover:bg-white/[0.06] rounded-lg transition-all"
          title="收起侧边栏"
        >
          <svg
            className="w-5 h-5"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <rect x="3" y="3" width="18" height="18" rx="2" strokeWidth="1.5" />
            <path strokeLinecap="round" strokeWidth="1.5" d="M9 3v18" />
          </svg>
        </button>

        {/* 标题 - 渐变色 */}
        <h1
          className="text-lg font-semibold truncate pr-10 mb-2 bg-clip-text text-transparent bg-gradient-to-r from-teal-400 to-cyan-400"
          title={method?.nameZh || method?.nameEn}
        >
          {method ? method.nameZh || method.nameEn : "加载中..."}
        </h1>

        {/* 描述 */}
        <p className="text-xs text-white/50 line-clamp-2 leading-relaxed">
          {method?.descriptionZh || method?.descriptionEn || "暂无描述"}
        </p>

        {plotConfig && (
          <div className="mt-3 text-xs text-white/50 space-y-1">
            <div>剧情管理：{plotConfig.enabled ? "启用" : "关闭"}</div>
            <div>
              自动实体关联：{plotConfig.entityLink?.enabled ? "启用" : "关闭"}
            </div>
            <div>
              剧情建议：{plotConfig.plot?.autoSuggest ? "启用" : "关闭"}
              {plotConfig.plot?.autoSuggest && (
                <span>
                  ，保存触发：{plotConfig.plot?.suggestOnSave ? "是" : "否"}
                </span>
              )}
            </div>
          </div>
        )}
      </div>

      {/* Resources List */}
      <div className="flex-1 overflow-y-auto p-4 space-y-6">
        {/* Module Types Section */}
        <div>
          <SectionHeader
            isOpen={isModuleTypesOpen}
            onToggle={() => setIsModuleTypesOpen(!isModuleTypesOpen)}
            title="模块类型"
            count={moduleTypes.length}
            icon={
              <svg
                className="w-4 h-4"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth="2"
                  d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"
                />
              </svg>
            }
            onAdd={undefined}
            addTitle={undefined}
          />
          {isModuleTypesOpen && (
            <div className="space-y-1">
              {moduleTypes.map((mt) => (
                <div key={mt.id}>
                  <div className="group p-2.5 bg-white/[0.02] border border-white/[0.04] rounded-lg text-sm hover:bg-white/[0.04] hover:border-white/[0.08] transition-all mb-1">
                    <div className="flex items-center justify-between">
                      <div className="flex items-center gap-1.5 min-w-0">
                        <span className="font-medium text-white/80 truncate">
                          {mt.nameZh || mt.nameEn}
                        </span>
                        {mt.entityCategory &&
                          CATEGORY_STYLES[mt.entityCategory] && (
                            <span
                              className={`text-[10px] px-1.5 py-0.5 rounded ${CATEGORY_STYLES[mt.entityCategory].bg} ${CATEGORY_STYLES[mt.entityCategory].text} flex-shrink-0`}
                            >
                              {CATEGORY_STYLES[mt.entityCategory].label}
                            </span>
                          )}
                        {mt.singleton && (
                          <span className="text-[10px] px-1.5 py-0.5 bg-cyan-500/15 text-cyan-400 rounded border border-cyan-500/20 flex-shrink-0">
                            单例
                          </span>
                        )}
                      </div>
                      <div className="flex items-center gap-0.5 opacity-0 group-hover:opacity-100 transition-opacity flex-shrink-0">
                        <ActionButton
                          onClick={() => {
                            onOpenModal?.();
                            jsonSchemaEditorRef.current?.open(mt);
                          }}
                          color="blue"
                          title="编辑 JSON 定义"
                        >
                          <span className="text-[10px] font-mono font-bold">
                            &lt;/&gt;
                          </span>
                        </ActionButton>
                        <ActionButton
                          onClick={() => {
                            onOpenModal?.();
                            moduleTypeModalRef.current?.open(mt);
                          }}
                          color="gray"
                          title="编辑基本信息"
                        >
                          <svg
                            className="w-3 h-3"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                          >
                            <path
                              strokeLinecap="round"
                              strokeLinejoin="round"
                              strokeWidth="2"
                              d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"
                            />
                          </svg>
                        </ActionButton>
                        {deletingItem?.type === "moduleType" &&
                        deletingItem?.id === mt.id ? (
                          <span className="text-xs text-white/40 px-1 animate-pulse">
                            删除中...
                          </span>
                        ) : (
                          <ActionButton
                            onClick={() => handleDelete("moduleType", mt.id)}
                            color="red"
                            title="删除"
                          >
                            <svg
                              className="w-3 h-3"
                              fill="none"
                              stroke="currentColor"
                              viewBox="0 0 24 24"
                            >
                              <path
                                strokeLinecap="round"
                                strokeLinejoin="round"
                                strokeWidth="2"
                                d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"
                              />
                            </svg>
                          </ActionButton>
                        )}
                      </div>
                    </div>
                  </div>
                </div>
              ))}
              {moduleTypes.length === 0 && (
                <div className="text-xs text-white/30 text-center py-4">
                  暂无模块类型
                </div>
              )}
            </div>
          )}
        </div>

        {/* Categories Config Section */}
        <div>
          <SectionHeader
            isOpen={isCategoriesOpen}
            onToggle={() => setIsCategoriesOpen(!isCategoriesOpen)}
            title="分组配置"
            icon={
              <svg
                className="w-4 h-4"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth="2"
                  d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"
                />
              </svg>
            }
          />
          {isCategoriesOpen && (
            <div className="space-y-2">
              <p className="text-xs text-white/40 mb-3">
                配置在桌面端小说创作页面和模块类型分类中显示的分组
              </p>
              {!method ? (
                <div className="text-xs text-white/30 text-center py-4">
                  加载中...
                </div>
              ) : (
                <div className="space-y-1.5">
                  {ALL_CATEGORIES.map((cat) => {
                    const isChecked =
                      !method?.visibleCategories ||
                      method.visibleCategories.includes(cat.id);
                    return (
                      <label
                        key={cat.id}
                        className={`
                                                    flex items-center gap-3 p-2.5 rounded-lg cursor-pointer transition-all
                                                    ${
                                                      isChecked
                                                        ? "bg-teal-500/10 border border-teal-500/30"
                                                        : "bg-white/[0.02] border border-white/[0.06] hover:border-white/[0.12]"
                                                    }
                                                `}
                      >
                        <input
                          type="checkbox"
                          checked={isChecked}
                          onChange={(e) => {
                            const currentCategories =
                              method?.visibleCategories ||
                              ALL_CATEGORIES.map((c) => c.id);
                            let newCategories: string[];
                            if (e.target.checked) {
                              newCategories = [...currentCategories, cat.id];
                            } else {
                              newCategories = currentCategories.filter(
                                (id: string) => id !== cat.id,
                              );
                            }
                            onUpdateVisibleCategories?.(newCategories);
                          }}
                          className="w-4 h-4 rounded border-white/20 bg-white/5 text-teal-500 focus:ring-teal-500/30"
                        />
                        <span
                          className={`text-sm ${isChecked ? "text-white" : "text-white/60"}`}
                        >
                          {cat.name}
                        </span>
                      </label>
                    );
                  })}
                </div>
              )}
            </div>
          )}
        </div>
      </div>

      {/* Modals */}
      <ModuleTypeEditModal
        ref={moduleTypeModalRef}
        onSuccess={fetchResources}
        showToast={showToast}
      />
      <JsonSchemaEditor
        ref={jsonSchemaEditorRef}
        onSave={fetchResources}
        showToast={showToast}
      />
    </div>
  );
};

export default Sidebar;
