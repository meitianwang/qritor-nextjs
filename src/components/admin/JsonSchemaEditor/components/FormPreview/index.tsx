'use client'

import React from 'react'
import PreviewField from './PreviewField'
import type { SchemaField } from '../../constants'
import type { ModuleType } from '../../utils/schemaGenerator'

interface FormPreviewProps {
    fields: SchemaField[]
    previewData: Record<string, unknown>
    setPreviewData: (data: Record<string, unknown>) => void
    allModuleTypes: ModuleType[]
}

/**
 * 表单预览组件
 * 渲染所有字段的预览
 */
const FormPreview: React.FC<FormPreviewProps> = ({ fields, previewData, setPreviewData, allModuleTypes }) => {
    if (fields.length === 0) {
        return (
            <div className="text-center py-12 text-text-secondary">
                暂无字段，请先添加字段
            </div>
        )
    }

    return (
        <div className="space-y-4">
            {fields.map((field) => (
                <details
                    key={field.id}
                    className="group border border-border rounded-lg bg-bg-secondary overflow-hidden"
                    open={!field.defaultCollapsed}
                >
                    <summary className="flex items-center justify-between p-3 cursor-pointer bg-bg-tertiary hover:bg-gray-100 dark:hover:bg-dark-bg-active transition-colors list-none select-none">
                        <div className="flex items-center gap-2">
                            <span className="font-medium text-text-primary">
                                {field.name}
                                {field.required && <span className="text-red-500 ml-1">*</span>}
                            </span>
                        </div>
                        <div className="text-text-secondary transition-transform duration-200 group-open:rotate-180">
                            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                            </svg>
                        </div>
                    </summary>
                    <div className="p-4 border-t border-border">
                        <PreviewField
                            field={field}
                            previewData={previewData}
                            setPreviewData={setPreviewData}
                            allModuleTypes={allModuleTypes}
                        />
                    </div>
                </details>
            ))}
        </div>
    )
}

export default FormPreview
