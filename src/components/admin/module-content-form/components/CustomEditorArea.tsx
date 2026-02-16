'use client'

/**
 * 自定义编辑器区域组件
 *
 * 注意：SmartWriterEditor 是桌面端专用组件，在 Web 端使用 textarea 占位替代。
 */

import React from 'react'
import { useTranslation } from '@/hooks/useTranslation'

interface ModuleType {
    entityCategory?: string
    editorComponent?: string
}

interface CustomEditorAreaProps {
    moduleType: ModuleType
    formData: Record<string, unknown>
    selectedNode: Record<string, unknown>
    onSave: () => void
    updateFormData: (fieldName: string, value: unknown) => void
    saving: boolean
    assistantLlmConfigId?: number
    smartWriterEditorRef?: React.Ref<unknown>
    onError?: (error: string) => void
}

function CustomEditorArea({
    moduleType,
    formData,
    selectedNode,
    onSave,
    updateFormData,
    saving,
}: CustomEditorAreaProps) {
    const { t } = useTranslation('studio')

    // SmartWriterEditor 替代方案：使用 textarea 占位
    // SmartWriterEditor 是桌面端专用组件，在 Web 端不可用
    if (moduleType.entityCategory === 'chapter') {
        return (
            <div className="flex-1 flex flex-col p-4">
                <div className="flex items-center justify-between mb-3">
                    <h3 className="text-sm font-medium text-text-primary">
                        {t('moduleContentForm.chapterContent', '章节内容')}
                    </h3>
                    <button
                        onClick={onSave}
                        disabled={saving}
                        className="px-4 py-1.5 bg-primary text-white text-sm rounded-lg hover:bg-primary-hover transition-colors disabled:opacity-50"
                    >
                        {saving ? t('common.saving', '保存中...') : t('common.save', '保存')}
                    </button>
                </div>
                <textarea
                    value={(formData.content as string) || ''}
                    onChange={(e) => updateFormData('content', e.target.value)}
                    placeholder={t('moduleContentForm.enterChapterContent', '请输入章节内容...')}
                    className="flex-1 w-full px-4 py-3 border border-border rounded-lg bg-bg-secondary text-text-primary focus:outline-none focus:ring-2 focus:ring-primary resize-none font-mono text-sm leading-relaxed"
                    style={{ minHeight: '400px' }}
                />
                {/* 显示额外的表单数据 */}
                {Object.keys(formData).filter(k => k !== 'content').length > 0 && (
                    <div className="mt-3 p-3 bg-bg-tertiary rounded border border-border">
                        <p className="text-xs text-text-secondary mb-2">
                            {t('moduleContentForm.extraData', '附加数据')}:
                        </p>
                        <pre className="text-xs text-text-secondary overflow-auto max-h-32">
                            {JSON.stringify(
                                Object.fromEntries(
                                    Object.entries(formData).filter(([k]) => k !== 'content')
                                ),
                                null,
                                2
                            )}
                        </pre>
                    </div>
                )}
            </div>
        )
    }

    // 其他未知类型的自定义编辑器占位
    return (
        <div className="flex-1 flex flex-col items-center justify-center border-2 border-dashed border-border rounded-lg bg-bg-tertiary m-4">
            <div className="text-center p-8">
                <svg className="w-16 h-16 text-primary mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />
                </svg>
                <h3 className="text-lg font-medium text-text-primary mb-2">
                    {t('moduleContentForm.customEditor')}: {moduleType.editorComponent}
                </h3>
                <p className="text-text-secondary max-w-md">
                    {t('moduleContentForm.customEditorPlaceholder')}
                </p>
                <div className="mt-6 p-4 bg-bg-secondary rounded border border-border text-left w-full max-w-lg overflow-auto max-h-60">
                    <pre className="text-xs text-text-secondary">
                        {JSON.stringify(formData, null, 2)}
                    </pre>
                </div>
            </div>
        </div>
    )
}

export default CustomEditorArea
