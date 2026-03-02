"use client";

import { useState, useEffect } from "react";
import { authFetch } from "@/lib/auth-utils";

interface NovelCreationMethod {
  id: string;
  nameZh?: string;
  descriptionZh?: string;
  novelTypeZh?: string;
  novelTypeEn?: string;
}

interface NovelCreationMethodEditModalProps {
  isOpen: boolean;
  onClose: () => void;
  method: NovelCreationMethod | null;
  onSave: () => void;
  showToast: (type: string, message: string) => void;
}

export default function NovelCreationMethodEditModal({
  isOpen,
  onClose,
  method,
  onSave,
  showToast,
}: NovelCreationMethodEditModalProps) {
  const [formData, setFormData] = useState({
    nameZh: "",
    descriptionZh: "",
    novelTypeZh: "",
    novelTypeEn: "",
  });
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (isOpen) {
      if (method) {
        setFormData({
          nameZh: method.nameZh || "",
          descriptionZh: method.descriptionZh || "",
          novelTypeZh: method.novelTypeZh || "",
          novelTypeEn: method.novelTypeEn || "",
        });
      } else {
        setFormData({
          nameZh: "",
          descriptionZh: "",
          novelTypeZh: "",
          novelTypeEn: "",
        });
      }
    }
  }, [method, isOpen]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    try {
      setLoading(true);

      const methodData = {
        nameZh: formData.nameZh,
        descriptionZh: formData.descriptionZh,
        novelTypeZh: formData.novelTypeZh || null,
        novelTypeEn: formData.novelTypeEn || null,
      };

      let response;
      if (method) {
        response = await authFetch(`/api/novel-creation-methods/${method.id}`, {
          method: "PUT",
          body: JSON.stringify(methodData),
          headers: { "Content-Type": "application/json" },
        });
      } else {
        response = await authFetch("/api/novel-creation-methods", {
          method: "POST",
          body: JSON.stringify(methodData),
          headers: { "Content-Type": "application/json" },
        });
      }

      if (response.ok) {
        onSave();
        onClose();
      } else {
        const result = await response.json();
        showToast("error", result.message || "保存失败");
      }
    } catch (error) {
      console.error("Error saving creation method:", error);
      showToast("error", "保存失败");
    } finally {
      setLoading(false);
    }
  };

  if (!isOpen) return null;

  return (
    <div
      className="admin-modal-overlay"
      onClick={!loading ? onClose : undefined}
    >
      <div
        className="admin-modal"
        onClick={(e) => e.stopPropagation()}
        style={{ maxWidth: "600px" }}
      >
        <div className="admin-modal-header">
          <h3 className="admin-modal-title">
            {method ? "编辑小说创作方法" : "新建小说创作方法"}
          </h3>
          <button
            className="admin-modal-close"
            onClick={onClose}
            disabled={loading}
          >
            &times;
          </button>
        </div>

        <form onSubmit={handleSubmit}>
          <div className="admin-form-group">
            <label className="admin-form-label">
              名称 <span style={{ color: "#ef4444" }}>*</span>
            </label>
            <input
              type="text"
              required
              value={formData.nameZh}
              onChange={(e) =>
                setFormData({ ...formData, nameZh: e.target.value })
              }
              className="admin-form-input"
              placeholder="例如: 民间灵异故事创作"
              disabled={loading}
              autoFocus
            />
          </div>

          <div className="admin-form-group">
            <label className="admin-form-label">描述</label>
            <textarea
              value={formData.descriptionZh}
              onChange={(e) =>
                setFormData({ ...formData, descriptionZh: e.target.value })
              }
              className="admin-form-input"
              placeholder="例如: 为民间灵异故事专门设计的创作方法"
              disabled={loading}
              rows={3}
              style={{ resize: "vertical", minHeight: "80px" }}
            />
          </div>

          <div className="admin-form-group">
            <label className="admin-form-label">小说类型（中文）</label>
            <input
              type="text"
              value={formData.novelTypeZh}
              onChange={(e) =>
                setFormData({ ...formData, novelTypeZh: e.target.value })
              }
              className="admin-form-input"
              placeholder="例如: 悬疑灵异、东方玄幻"
              disabled={loading}
            />
          </div>

          <div className="admin-form-group">
            <label className="admin-form-label">小说类型（英文）</label>
            <input
              type="text"
              value={formData.novelTypeEn}
              onChange={(e) =>
                setFormData({ ...formData, novelTypeEn: e.target.value })
              }
              className="admin-form-input"
              placeholder="e.g. Supernatural Mystery, Eastern Fantasy"
              disabled={loading}
            />
          </div>

          <div
            style={{
              display: "flex",
              gap: "12px",
              justifyContent: "flex-end",
              marginTop: "24px",
            }}
          >
            <button
              type="button"
              className="admin-btn admin-btn-secondary"
              onClick={onClose}
              disabled={loading}
            >
              取消
            </button>
            <button
              type="submit"
              className="admin-btn admin-btn-primary"
              disabled={loading}
            >
              {loading && (
                <svg
                  className="animate-spin"
                  style={{ width: "16px", height: "16px", marginRight: "4px" }}
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                >
                  <circle
                    style={{ opacity: 0.25 }}
                    cx="12"
                    cy="12"
                    r="10"
                    stroke="currentColor"
                    strokeWidth="4"
                  ></circle>
                  <path
                    style={{ opacity: 0.75 }}
                    fill="currentColor"
                    d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                  ></path>
                </svg>
              )}
              {loading ? "保存中..." : "保存"}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
