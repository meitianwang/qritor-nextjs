"use client";

import React, { useMemo } from "react";

interface SidebarProps {
  method: Record<string, any> | null;
  isCollapsed: boolean;
  onToggleCollapse: () => void;
}

const Sidebar: React.FC<SidebarProps> = ({
  method,
  isCollapsed,
  onToggleCollapse,
}) => {
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
        <div className="text-xs text-white/30 text-center py-4">
          模块类型已迁移至文件系统
        </div>
      </div>
    </div>
  );
};

export default Sidebar;
