'use client'

/**
 * ModuleContentForm 组件
 *
 * 重构后的主组件，将原 752 行代码拆分为：
 * - 2 个自定义 Hooks（useModuleContent, useToast）
 * - 4 个子组件（StateComponents, ToastNotification, FormHeader, CustomEditorArea）
 */

import React, { useState } from 'react'
import JsonSchemaFormRenderer from '../json-schema-form-renderer'
import { useTranslation } from '@/hooks/useTranslation'

// Hooks
import { useModuleContent, useToast } from './hooks'

// Components
import {
    EmptyState,
    LoadingState,
    ErrorState,
    NoSchemaState,
    SchemaErrorState,
    ToastNotification,
    FormHeader,
    CustomEditorArea
} from './components'

interface SelectedNode {
    id: string | number
    title?: string
    moduleTypeId?: string | number
    moduleTypeName?: string
    jsonSchema?: string
    entityCategory?: string
    content?: string
    novelId?: string | number
    [key: string]: unknown
}

interface ModuleContentFormProps {
    selectedNode: SelectedNode | null | undefined
    onSave?: (data: unknown) => void
    assistantLlmConfigId?: number
    smartWriterEditorRef?: React.Ref<unknown>
    onError?: (error: string) => void
}

const ModuleContentForm = ({ selectedNode, onSave, assistantLlmConfigId, smartWriterEditorRef, onError }: ModuleContentFormProps) => {
    const { t } = useTranslation('studio')

    // 编辑器模式：'smart' 智能写作编辑器，'form' JSON Schema 表单
    const [editorMode, setEditorMode] = useState<'smart' | 'form'>('smart')

    // 使用自定义 Hooks
    const {
        formData,
        moduleType,
        loading,
        saving,
        error,
        loadModuleContent,
        handleSave,
        updateFormData,
        getDisplayTitle
    } = useModuleContent(selectedNode, onSave)

    const { notification, showToast } = useToast()

    // 如果没有选中节点
    if (!selectedNode) {
        return <EmptyState />
    }

    // 加载中状态
    if (loading) {
        return <LoadingState />
    }

    // 错误状态
    if (error) {
        return <ErrorState error={error} onRetry={loadModuleContent} />
    }

    // 如果没有模块类型或 JSON Schema
    if (!moduleType || !moduleType.jsonSchema) {
        return <NoSchemaState />
    }

    // 解析 JSON Schema
    let schema
    try {
        schema = JSON.parse(moduleType.jsonSchema)
    } catch {
        return <SchemaErrorState />
    }

    // 如果是章节类型，支持切换编辑器模式
    if (moduleType.entityCategory === 'chapter') {
        return (
            <div className="h-full flex flex-col">
                {/* 编辑器模式切换按钮 */}
                <div className="flex items-center justify-end px-4 py-2 border-b border-border bg-bg-secondary">
                    <div className="flex items-center gap-1 bg-bg-tertiary rounded-lg p-1">
                        <button
                            onClick={() => setEditorMode('smart')}
                            className={`px-3 py-1.5 text-xs font-medium rounded-md transition-all ${editorMode === 'smart'
                                    ? 'bg-primary text-white shadow-sm'
                                    : 'text-text-secondary hover:text-text-primary hover:bg-bg-secondary'
                                }`}
                        >
                            {t('moduleContentForm.smartWriterMode', '智能写作')}
                        </button>
                        <button
                            onClick={() => setEditorMode('form')}
                            className={`px-3 py-1.5 text-xs font-medium rounded-md transition-all ${editorMode === 'form'
                                    ? 'bg-primary text-white shadow-sm'
                                    : 'text-text-secondary hover:text-text-primary hover:bg-bg-secondary'
                                }`}
                        >
                            {t('moduleContentForm.formMode', '表单模式')}
                        </button>
                    </div>
                </div>

                {/* 通知提示 */}
                <ToastNotification
                    show={notification.show}
                    type={notification.type}
                    message={notification.message}
                />

                {/* 根据模式渲染不同的编辑器 */}
                {editorMode === 'smart' ? (
                    <CustomEditorArea
                        moduleType={moduleType}
                        formData={formData}
                        selectedNode={selectedNode}
                        onSave={() => handleSave(showToast)}
                        updateFormData={updateFormData}
                        saving={saving}
                        assistantLlmConfigId={assistantLlmConfigId}
                        smartWriterEditorRef={smartWriterEditorRef}
                        onError={onError}
                    />
                ) : (
                    <>
                        {/* 表单模式的标题栏 */}
                        <FormHeader
                            title={getDisplayTitle()}
                            saving={saving}
                            onSave={() => handleSave(showToast)}
                        />
                        {/* 表单内容 */}
                        <div className="flex-1 overflow-y-auto">
                            <JsonSchemaFormRenderer
                                schema={schema}
                                formData={formData}
                                onChange={(fieldName, value) => updateFormData(fieldName, value)}
                                collapsible={false}
                            />
                        </div>
                    </>
                )}
            </div>
        )
    }

    return (
        <div className="h-full flex flex-col">
            {/* 标题栏 - 仅在非章节类型时显示 */}
            {moduleType?.entityCategory !== 'chapter' && (
                <FormHeader
                    title={getDisplayTitle()}
                    saving={saving}
                    onSave={() => handleSave(showToast)}
                />
            )}

            {/* 通知提示 */}
            <ToastNotification
                show={notification.show}
                type={notification.type}
                message={notification.message}
            />

            {/* 表单内容 */}
            <div className="flex-1 overflow-y-auto">
                <JsonSchemaFormRenderer
                    schema={schema}
                    formData={formData}
                    onChange={(fieldName, value) => updateFormData(fieldName, value)}
                    collapsible={false}
                />
            </div>
        </div>
    )
}

export default ModuleContentForm
