"use client";

import { useState, useEffect } from "react";
import { useParams } from "next/navigation";
import Link from "next/link";
import Sidebar from "./Sidebar";
import { authFetch } from "@/lib/auth-utils";
import { useToast } from "@/hooks/useToast";
import ToastNotification from "@/components/ToastNotification";
import { getGenreLabel } from "@/lib/constants/novel-genres";

interface Method {
  id: number;
  nameZh?: string;
  nameEn?: string;
  descriptionZh?: string;
  descriptionEn?: string;
  novelGenre?: string;
  plotConfig: string | Record<string, any> | null;
  [key: string]: any;
}

function NovelCreationMethodDetailContent() {
  const params = useParams();
  const id = params.id as string;
  const { notification, showToast } = useToast();
  const [method, setMethod] = useState<Method | null>(null);

  // Sidebar collapsed state
  const [sidebarCollapsed, setSidebarCollapsed] = useState(false);

  useEffect(() => {
    fetchMethodDetails();
  }, [id]);

  const fetchMethodDetails = async () => {
    try {
      const response = await authFetch(`/api/novel-creation-methods/${id}`);
      if (response.ok) {
        const result = await response.json();
        if (result.data) {
          setMethod(result.data);
        }
      }
    } catch (error) {
      console.error("Failed to fetch creation method details", error);
    }
  };

  return (
    <div className="h-screen flex bg-background text-text-primary overflow-hidden">
      {/* 返回按钮 */}
      <Link
        href="/admin/novel-creation-methods"
        className="fixed top-4 left-4 z-30 flex items-center gap-2 px-3 py-2 bg-white/[0.05] hover:bg-white/[0.1] border border-white/[0.08] rounded-lg transition-all text-sm text-white/70 hover:text-white"
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
            strokeWidth={2}
            d="M10 19l-7-7m0 0l7-7m-7 7h18"
          />
        </svg>
        {"返回"}
      </Link>

      {/* 主内容区 */}
      <div className="flex-1 flex flex-col overflow-hidden">
        <div className="flex-1 flex overflow-hidden">
          {/* Left Sidebar: Method Info */}
          <Sidebar
            method={method}
            isCollapsed={sidebarCollapsed}
            onToggleCollapse={() => setSidebarCollapsed(!sidebarCollapsed)}
          />

          {/* Main Content Area */}
          <div className="flex-1 flex flex-col overflow-hidden relative">
            {/* 折叠状态下的展开按钮 */}
            {sidebarCollapsed && (
              <button
                onClick={() => setSidebarCollapsed(false)}
                className="absolute top-3 left-3 z-20 p-2 text-white/40 hover:text-white hover:bg-white/[0.08] rounded-lg transition-all border border-white/[0.08]"
                title={"展开侧边栏"}
              >
                <svg
                  className="w-5 h-5"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <rect
                    x="3"
                    y="3"
                    width="18"
                    height="18"
                    rx="2"
                    strokeWidth="1.5"
                  />
                  <path strokeLinecap="round" strokeWidth="1.5" d="M9 3v18" />
                </svg>
              </button>
            )}

            {/* 方法概览 */}
            <MethodOverview method={method} />
          </div>
        </div>

        {/* Toast 通知 */}
        <ToastNotification notification={notification} />
      </div>
    </div>
  );
}

// --- 方法概览面板 ---

function formatDate(dateStr: string | undefined | null): string {
  if (!dateStr) return "-";
  const d = new Date(dateStr);
  return d.toLocaleDateString("zh-CN", {
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
  });
}

function MethodOverview({
  method,
}: {
  method: Method | null;
}) {
  // 加载中骨架
  if (!method) {
    return (
      <div className="flex-1 overflow-y-auto p-8">
        <div className="max-w-4xl mx-auto space-y-6">
          <div className="h-8 w-64 bg-white/[0.04] rounded-lg animate-pulse" />
          <div className="h-4 w-96 bg-white/[0.03] rounded animate-pulse" />
        </div>
      </div>
    );
  }

  return (
    <div className="flex-1 overflow-y-auto p-8">
      <div className="max-w-4xl mx-auto space-y-8">
        {/* Header */}
        <div>
          <h2 className="text-2xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-teal-400 via-cyan-500 to-teal-500 mb-2">
            {method.nameZh || method.nameEn}
          </h2>
          <p className="text-white/50 text-sm leading-relaxed max-w-2xl">
            {method.descriptionZh || method.descriptionEn || "暂无描述"}
          </p>
        </div>

        {/* 方法信息 */}
        <div className="bg-white/[0.03] border border-white/[0.06] rounded-xl p-5">
          <h3 className="text-sm font-semibold text-white/70 mb-4">方法信息</h3>
          <div className="grid grid-cols-2 gap-x-8 gap-y-3">
            <InfoRow
              label="小说类型"
              value={
                method.novelGenre
                  ? `${getGenreLabel(method.novelGenre, "zh")} / ${getGenreLabel(method.novelGenre, "en")}`
                  : "-"
              }
            />
            <InfoRow label="创建时间" value={formatDate(method.createdAt)} />
            <InfoRow label="更新时间" value={formatDate(method.updatedAt)} />
          </div>
        </div>
      </div>
    </div>
  );
}

function InfoRow({
  label,
  value,
  children,
}: {
  label: string;
  value?: string;
  children?: React.ReactNode;
}) {
  return (
    <div className="flex items-center justify-between py-1.5">
      <span className="text-xs text-white/40">{label}</span>
      {children || <span className="text-sm text-white/70">{value}</span>}
    </div>
  );
}

export default NovelCreationMethodDetailContent;
