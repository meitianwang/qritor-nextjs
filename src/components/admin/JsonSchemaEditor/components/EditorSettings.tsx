'use client'

import React from 'react'
import type { SchemaField } from '../constants'

interface EditorSettingsProps {
    titleField: string
    setTitleField: (value: string) => void
    fields: SchemaField[]
}

/**
 * 编辑器设置面板组件
 * 包含标题字段设置
 */
const EditorSettings: React.FC<EditorSettingsProps> = ({
    titleField,
    setTitleField,
    fields
}) => {
    return (
        <details className="mb-4 border border-border rounded-lg bg-bg-secondary overflow-hidden group">
            <summary className="flex items-center justify-between p-4 cursor-pointer bg-bg-tertiary hover:bg-gray-100 dark:hover:bg-dark-bg-active transition-colors list-none select-none">
                <span className="text-sm font-medium text-text-primary">
                    高级配置
                </span>
                <div className="text-text-secondary transition-transform duration-200 group-open:rotate-180">
                    <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                    </svg>
                </div>
            </summary>
            <div className="p-4 border-t border-border">
                {/* 标题字段选择 */}
                <div>
                    <label className="block text-sm font-medium text-text-primary mb-2">
                        标题字段
                    </label>
                    <select
                        value={titleField}
                        onChange={(e) => setTitleField(e.target.value)}
                        className="admin-form-select"
                    >
                        <option value="">未设置</option>
                        {fields.filter(f => f.type === 'string').map(f => (
                            <option key={f.id} value={f.name}>
                                {f.name}
                            </option>
                        ))}
                    </select>
                </div>
            </div>
        </details>
    )
}

export default EditorSettings
