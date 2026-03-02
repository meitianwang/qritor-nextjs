"use client";

import { useState, useEffect, useCallback } from "react";
import { useRouter } from "next/navigation";
import { authFetch } from "@/lib/auth-utils";
import { useToast } from "@/hooks/useToast";
import ToastNotification from "@/components/ToastNotification";
import NovelCreationMethodEditModal from "@/components/admin/NovelCreationMethodEditModal";
import ConfirmDialog from "@/components/admin/ConfirmDialog";
import {
  SearchIcon,
  PlusIcon,
  BeakerIcon,
  LightningBoltIcon,
  PencilIcon,
  TrashIcon,
} from "@/components/admin/icons";

interface NovelCreationMethod {
  id: string;
  nameZh?: string;
  nameEn?: string;
  descriptionZh?: string;
  descriptionEn?: string;
  novelTypeZh?: string;
  novelTypeEn?: string;
}

export default function NovelCreationMethodListPage() {
  const router = useRouter();
  const { notification, showToast } = useToast();
  const [methods, setMethods] = useState<NovelCreationMethod[]>([]);
  const [loading, setLoading] = useState(true);
  const [isEditModalOpen, setIsEditModalOpen] = useState(false);
  const [editingMethod, setEditingMethod] =
    useState<NovelCreationMethod | null>(null);
  const [searchQuery, setSearchQuery] = useState("");

  const [deleteConfirm, setDeleteConfirm] = useState({
    isOpen: false,
    methodId: null as string | null,
    methodName: "",
  });

  const fetchMethods = useCallback(async () => {
    try {
      const response = await authFetch("/api/novel-creation-methods");
      if (response.ok) {
        const result = await response.json();
        setMethods(result.data || []);
      }
    } catch (error) {
      console.error("Failed to fetch creation methods", error);
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchMethods();
  }, [fetchMethods]);

  const openDeleteConfirm = (methodId: string, methodName: string) => {
    setDeleteConfirm({ isOpen: true, methodId, methodName });
  };

  const closeDeleteConfirm = () => {
    setDeleteConfirm({ isOpen: false, methodId: null, methodName: "" });
  };

  const handleDeleteConfirm = async () => {
    if (!deleteConfirm.methodId) return;

    try {
      const response = await authFetch(
        `/api/novel-creation-methods/${deleteConfirm.methodId}`,
        {
          method: "DELETE",
        },
      );
      if (response.ok) {
        fetchMethods();
      } else {
        const result = await response.json();
        showToast("error", result.message || "删除失败");
      }
    } catch {
      showToast("error", "删除失败");
    } finally {
      closeDeleteConfirm();
    }
  };

  const filteredMethods = methods.filter((method) => {
    if (!searchQuery) return true;
    const q = searchQuery.toLowerCase();
    return (
      method.nameZh?.toLowerCase().includes(q) ||
      method.nameEn?.toLowerCase().includes(q) ||
      method.descriptionZh?.toLowerCase().includes(q) ||
      method.descriptionEn?.toLowerCase().includes(q)
    );
  });

  const getMethodColor = (_method: NovelCreationMethod, index: number) => {
    const colors = [
      {
        bg: "from-teal-500/20 to-teal-600/10",
        border: "border-teal-500/30",
        icon: "text-teal-400",
        iconBg: "bg-teal-500/20",
      },
      {
        bg: "from-cyan-500/20 to-cyan-600/10",
        border: "border-cyan-500/30",
        icon: "text-cyan-400",
        iconBg: "bg-cyan-500/20",
      },
      {
        bg: "from-teal-600/20 to-cyan-500/10",
        border: "border-teal-600/30",
        icon: "text-teal-300",
        iconBg: "bg-teal-600/20",
      },
    ];
    return colors[index % colors.length];
  };

  return (
    <div className="text-text-primary">
      <div className="max-w-6xl mx-auto px-8 py-8">
        <div className="mb-8">
          <h1 className="text-4xl font-bold mb-3">
            <span className="bg-clip-text text-transparent bg-gradient-to-r from-teal-400 via-cyan-500 to-teal-500">
              探索小说创作方法
            </span>
          </h1>
          <p className="text-text-secondary text-lg">
            管理和开发小说创作方法，自定义创作流程
          </p>
        </div>

        <div className="flex flex-col sm:flex-row gap-4 mb-6">
          <div className="flex-1 relative">
            <SearchIcon className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-text-tertiary" />
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="搜索小说创作方法..."
              className="w-full pl-12 pr-4 py-3 bg-white/[0.03] border border-white/[0.08] rounded-xl text-text-primary placeholder:text-text-tertiary focus:outline-none focus:border-primary/50 focus:bg-white/[0.05] transition-all"
            />
          </div>

          <button
            onClick={() => {
              setEditingMethod(null);
              setIsEditModalOpen(true);
            }}
            className="flex items-center justify-center gap-2 px-6 py-3 bg-gradient-to-r from-emerald-500 to-cyan-600 hover:from-emerald-600 hover:to-cyan-700 text-white rounded-xl font-medium transition-all shadow-lg shadow-emerald-500/25 hover:shadow-emerald-500/40"
          >
            <PlusIcon className="w-5 h-5" />
            新建方法
          </button>
        </div>

        {loading && (
          <div className="flex justify-center py-12">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-emerald-500"></div>
          </div>
        )}

        {!loading && methods.length === 0 && (
          <div className="text-center py-20">
            <div className="inline-flex items-center justify-center w-24 h-24 bg-gradient-to-br from-emerald-500/20 to-cyan-500/20 rounded-3xl mb-6">
              <BeakerIcon
                className="w-12 h-12 text-emerald-400"
                strokeWidth={1.5}
              />
            </div>
            <h3 className="text-xl font-medium text-text-primary mb-2">
              暂无小说创作方法
            </h3>
            <p className="text-text-secondary mb-6">
              创建一个新的小说创作方法开始吧
            </p>
            <button
              onClick={() => {
                setEditingMethod(null);
                setIsEditModalOpen(true);
              }}
              className="inline-flex items-center gap-2 px-6 py-3 bg-gradient-to-r from-emerald-500 to-cyan-600 text-white rounded-xl font-medium transition-all"
            >
              <PlusIcon className="w-5 h-5" />
              新建方法
            </button>
          </div>
        )}

        {!loading && filteredMethods.length > 0 && (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
            {filteredMethods.map((method, index) => {
              const color = getMethodColor(method, index);
              return (
                <div
                  key={method.id}
                  className={`group relative bg-gradient-to-br ${color.bg} border ${color.border} hover:border-opacity-60 rounded-2xl p-5 transition-all duration-300 cursor-pointer hover:-translate-y-1 hover:shadow-lg`}
                  onClick={() =>
                    router.push(`/admin/novel-creation-methods/${method.id}`)
                  }
                >
                  <div className="flex items-start gap-4 mb-4">
                    <div
                      className={`w-12 h-12 ${color.iconBg} rounded-xl flex items-center justify-center flex-shrink-0`}
                    >
                      <BeakerIcon
                        className={`w-6 h-6 ${color.icon}`}
                        strokeWidth={1.8}
                      />
                    </div>
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2 mb-1 flex-wrap">
                        <h3 className="text-lg font-semibold text-text-primary truncate group-hover:text-white transition-colors">
                          {method.nameZh || method.nameEn}
                        </h3>
                      </div>
                      <p className="text-sm text-text-tertiary line-clamp-2">
                        {method.descriptionZh ||
                          method.descriptionEn ||
                          "暂无描述"}
                      </p>
                    </div>
                  </div>

                  <div className="flex items-center justify-between pt-3 border-t border-white/[0.06]">
                    <div className="flex items-center gap-3 text-xs text-text-tertiary">
                      <span className="flex items-center gap-1">
                        <LightningBoltIcon className="w-4 h-4" />
                        点击开发
                      </span>
                    </div>

                    <div className="flex items-center gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
                      <button
                        onClick={(e) => {
                          e.stopPropagation();
                          setEditingMethod(method);
                          setIsEditModalOpen(true);
                        }}
                        className="p-1.5 text-text-tertiary hover:text-white hover:bg-white/10 rounded-lg transition-colors"
                        title="编辑基本信息"
                      >
                        <PencilIcon className="w-4 h-4" />
                      </button>
                      <button
                        onClick={(e) => {
                          e.stopPropagation();
                          openDeleteConfirm(
                            method.id,
                            method.nameZh || method.nameEn || "",
                          );
                        }}
                        className="p-1.5 text-text-tertiary hover:text-red-400 hover:bg-red-500/10 rounded-lg transition-colors"
                        title="删除"
                      >
                        <TrashIcon className="w-4 h-4" />
                      </button>
                    </div>
                  </div>
                </div>
              );
            })}
          </div>
        )}

        {!loading && methods.length > 0 && filteredMethods.length === 0 && (
          <div className="text-center py-16">
            <SearchIcon
              className="w-16 h-16 text-text-tertiary mx-auto mb-4"
              strokeWidth={1.5}
            />
            <h3 className="text-lg font-medium text-text-primary mb-2">
              未找到匹配的方法
            </h3>
            <p className="text-text-secondary">请尝试其他关键词</p>
          </div>
        )}
      </div>

      <NovelCreationMethodEditModal
        isOpen={isEditModalOpen}
        onClose={() => setIsEditModalOpen(false)}
        method={editingMethod}
        onSave={fetchMethods}
        showToast={showToast}
      />

      <ConfirmDialog
        isOpen={deleteConfirm.isOpen}
        onConfirm={handleDeleteConfirm}
        onCancel={closeDeleteConfirm}
        title="确认删除"
        message="确定要删除这个小说创作方法吗？此操作无法撤销。"
        confirmText="删除"
        confirmVariant="danger"
      />

      <ToastNotification notification={notification} />
    </div>
  );
}
