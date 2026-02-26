"use client";

import { useState, useEffect } from "react";
import { adminFetch } from "@/lib/admin-utils";

/**
 * 邀请奖励设置页面
 * 管理邀请好友的积分奖励配置
 */

interface ReferralSettings {
  inviterReward: number | null;
  inviteeReward: number | null;
  maxReward: number | null;
  milestoneReward: number | null;
  milestoneCount: number | null;
  monthlyLimit: number | null;
}

export default function ReferralSettingsPage() {
  const [loading, setLoading] = useState<boolean>(true);
  const [saving, setSaving] = useState<boolean>(false);
  const [settings, setSettings] = useState<ReferralSettings>({
    inviterReward: null,
    inviteeReward: null,
    maxReward: null,
    milestoneReward: null,
    milestoneCount: null,
    monthlyLimit: null,
  });
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  useEffect(() => {
    fetchSettings();
  }, []);

  const fetchSettings = async () => {
    try {
      setLoading(true);
      const response = await adminFetch("/api/admin/settings/referral");
      const data = await response.json();
      if (data.code === 200) {
        setSettings(
          data.data || {
            inviterReward: null,
            inviteeReward: null,
            maxReward: null,
            milestoneReward: null,
            milestoneCount: null,
            monthlyLimit: null,
          },
        );
      } else {
        setError(data.message || "获取设置失败");
      }
    } catch (err) {
      console.error("获取邀请奖励设置失败:", err);
      setError("网络错误，请稍后重试");
    } finally {
      setLoading(false);
    }
  };

  const handleSave = async () => {
    try {
      setSaving(true);
      setError(null);
      setSuccess(null);

      const response = await adminFetch("/api/admin/settings/referral", {
        method: "PUT",
        body: settings,
      });
      const data = await response.json();

      if (data.code === 200) {
        setSuccess("设置已保存");
        await fetchSettings();
      } else {
        setError(data.message || "保存失败");
      }
    } catch (err) {
      console.error("保存邀请奖励设置失败:", err);
      setError("网络错误，请稍后重试");
    } finally {
      setSaving(false);
    }
  };

  const handleInputChange = (key: keyof ReferralSettings, value: string) => {
    const numValue = value === "" ? null : parseInt(value) || 0;
    setSettings({ ...settings, [key]: numValue });
  };

  if (loading) {
    return (
      <div className="admin-page">
        <div className="admin-page-header">
          <h1>邀请奖励设置</h1>
        </div>
        <div className="loading">加载中...</div>
      </div>
    );
  }

  return (
    <div className="admin-page payment-settings-page">
      <div className="admin-page-header">
        <h1>邀请奖励设置</h1>
        <p className="page-description">管理邀请好友注册的积分奖励规则</p>
      </div>

      {error && (
        <div className="alert alert-error">
          <span className="alert-icon">&#9888;&#65039;</span>
          {error}
        </div>
      )}

      {success && (
        <div className="alert alert-success">
          <span className="alert-icon">&#10003;</span>
          {success}
        </div>
      )}

      {settings.inviterReward === null && (
        <div className="alert alert-error">
          <span className="alert-icon">&#9888;&#65039;</span>
          邀请奖励配置未初始化！请填写以下配置并保存，或执行数据库初始化脚本:{" "}
          <code>migrations/init_system_config.sql</code>
        </div>
      )}

      <div className="settings-card">
        <h2 className="settings-section-title">基础奖励</h2>

        <div className="settings-form">
          <div className="form-group">
            <label className="form-label">邀请人奖励积分</label>
            <input
              type="number"
              className="form-input"
              value={settings.inviterReward ?? ""}
              onChange={(e) =>
                handleInputChange("inviterReward", e.target.value)
              }
              min="0"
              placeholder="请输入数值"
            />
            <p className="form-hint">邀请成功后，邀请人获得的积分奖励</p>
          </div>

          <div className="form-group">
            <label className="form-label">最高奖励积分</label>
            <input
              type="number"
              className="form-input"
              value={settings.maxReward ?? ""}
              onChange={(e) => handleInputChange("maxReward", e.target.value)}
              min="0"
              placeholder="请输入数值"
            />
            <p className="form-hint">每个用户通过邀请最多可获得的总积分上限</p>
          </div>

          <div className="form-group">
            <label className="form-label">被邀请人奖励积分</label>
            <input
              type="number"
              className="form-input"
              value={settings.inviteeReward ?? ""}
              onChange={(e) =>
                handleInputChange("inviteeReward", e.target.value)
              }
              min="0"
              placeholder="请输入数值"
            />
            <p className="form-hint">新用户通过邀请码注册后获得的积分奖励</p>
          </div>
        </div>
      </div>

      <div className="settings-card">
        <h2 className="settings-section-title">里程碑奖励</h2>

        <div className="settings-form">
          <div className="form-group">
            <label className="form-label">里程碑人数</label>
            <input
              type="number"
              className="form-input"
              value={settings.milestoneCount ?? ""}
              onChange={(e) =>
                handleInputChange("milestoneCount", e.target.value)
              }
              min="1"
              placeholder="请输入数值"
            />
            <p className="form-hint">每邀请多少人达成一次里程碑</p>
          </div>

          <div className="form-group">
            <label className="form-label">里程碑额外奖励积分</label>
            <input
              type="number"
              className="form-input"
              value={settings.milestoneReward ?? ""}
              onChange={(e) =>
                handleInputChange("milestoneReward", e.target.value)
              }
              min="0"
              placeholder="请输入数值"
            />
            <p className="form-hint">达成里程碑后获得的额外积分奖励</p>
          </div>
        </div>
      </div>

      <div className="settings-card">
        <h2 className="settings-section-title">限制设置</h2>

        <div className="settings-form">
          <div className="form-group">
            <label className="form-label">每月邀请人数上限</label>
            <input
              type="number"
              className="form-input"
              value={settings.monthlyLimit ?? ""}
              onChange={(e) =>
                handleInputChange("monthlyLimit", e.target.value)
              }
              min="1"
              placeholder="请输入数值"
            />
            <p className="form-hint">每个自然月最多可获得奖励的邀请人数</p>
          </div>
        </div>
      </div>

      <div className="settings-card settings-info">
        <h3>&#128161; 配置说明</h3>
        <ul>
          <li>
            <strong>基础奖励</strong>
            ：每次成功邀请后，邀请人和被邀请人各自获得的积分
          </li>
          <li>
            <strong>里程碑奖励</strong>：累计邀请达到指定人数后的额外奖励
          </li>
          <li>
            <strong>月度限制</strong>：防止滥用，每月最多可获得奖励的邀请人数
          </li>
          <li>修改配置后立即生效，影响所有新的邀请奖励发放</li>
        </ul>
      </div>

      <div className="page-footer">
        <button
          className="btn btn-primary"
          onClick={handleSave}
          disabled={saving}
        >
          {saving ? "保存中..." : "保存设置"}
        </button>
      </div>
    </div>
  );
}
