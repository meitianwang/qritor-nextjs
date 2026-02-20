'use client'

import React, { useState, useEffect, forwardRef, useImperativeHandle } from 'react'
import JsonSchemaFormRenderer from '@/components/admin/json-schema-form-renderer'
import { SMART_WRITER_PRESET_FIELDS, createSmartWriterField } from './constants'
import type { SchemaField } from './constants'
import { parseJsonSchema } from './utils/schemaParser'
import { generateJsonSchema } from './utils/schemaGenerator'
import type { ModuleType } from './utils/schemaGenerator'
import { useSchemaFields } from './hooks/useSchemaFields'
import FormPreview from './components/FormPreview'
import FieldEditor from './components/FieldEditor'
import EditorSettings from './components/EditorSettings'
import { authFetch } from '@/lib/auth-utils'

interface JsonSchemaEditorProps {
    onSave?: () => void
    onClose?: () => void
    showToast?: (type: string, message: string) => void
}

export interface JsonSchemaEditorRef {
    open: (data: Record<string, unknown>) => Promise<void>
    close: () => void
}

/**
 * JSON Schema 编辑器组件
 * 提供可视化的 JSON Schema 编辑功能
 */
const JsonSchemaEditor = forwardRef<JsonSchemaEditorRef, JsonSchemaEditorProps>(({ onSave, onClose, showToast }, ref) => {
    const [isOpen, setIsOpen] = useState(false)
    const [moduleType, setModuleType] = useState<Record<string, unknown> | null>(null)
    const [loading, setLoading] = useState(false)
    const [previewData, setPreviewData] = useState<Record<string, unknown>>({})
    const [allModuleTypes, setAllModuleTypes] = useState<ModuleType[]>([])
    const [schemaText, setSchemaText] = useState('')
    const [schemaError, setSchemaError] = useState('')
    const [titleField, setTitleField] = useState('')
    const [editorComponent, setEditorComponent] = useState('JSONschema')

    // 使用自定义 Hook 管理字段
    const {
        fields,
        setFields,
        addField,
        removeField,
        updateField,
        moveFieldUp,
        moveFieldDown
    } = useSchemaFields([])

    // 获取所有模块类型
    const fetchAllModuleTypes = async (novelCreationMethodId?: string) => {
        try {
            const url = novelCreationMethodId
                ? `/api/module-types/creation-method/${novelCreationMethodId}`
                : '/api/module-types'

            const response = await authFetch(url)
            const data = await response.json()
            if (data.code === 200) {
                setAllModuleTypes(data.data || [])
            }
        } catch (error) {
            console.error('获取模块类型列表失败:', error)
        }
    }

    // 解析 JSON Schema
    const handleParseJsonSchema = (jsonSchemaStr: string) => {
        const result = parseJsonSchema(jsonSchemaStr)

        if (result.error) {
            setSchemaError(result.error)
        } else {
            setSchemaError('')
            setFields(result.fields)
            setTitleField(result.titleField)
            setSchemaText(jsonSchemaStr)
            // 从解析结果中设置编辑器类型
            if (result.editorComponent) {
                setEditorComponent(result.editorComponent)
            }
        }
    }

    // 暴露给父组件的方法
    useImperativeHandle(ref, () => ({
        open: async (data: Record<string, unknown>) => {
            setModuleType(data)
            // 加载所有模块类型
            await fetchAllModuleTypes(data?.novelCreationMethodId as string | undefined)
            // 解析现有的 jsonSchema
            if (data && data.jsonSchema) {
                handleParseJsonSchema(data.jsonSchema as string)
            } else {
                setFields([])
                setSchemaText('')
                setTitleField('')
                setEditorComponent('SmartWriterEditor')
            }
            if (data && data.editorComponent) {
                setEditorComponent(data.editorComponent as string)
            }
            setIsOpen(true)
        },
        close: () => {
            setIsOpen(false)
            setModuleType(null)
            setFields([])
            setTitleField('')
            setEditorComponent('SmartWriterEditor')
        }
    }))

    // 当字段更新时，自动更新 schemaText
    useEffect(() => {
        if (fields.length > 0) {
            const schema = generateJsonSchema(fields, titleField, allModuleTypes)
            setSchemaText(JSON.stringify(schema, null, 2))
        }
    }, [fields, titleField, allModuleTypes])

    // 监听编辑器组件变化，自动添加预置字段
    useEffect(() => {
        if (editorComponent === 'SmartWriterEditor') {
            const newFields = [...fields]

            SMART_WRITER_PRESET_FIELDS.forEach(presetField => {
                const existingIndex = newFields.findIndex(f => f.name === presetField.name)
                const fieldData = createSmartWriterField(
                    presetField,
                    existingIndex >= 0 ? newFields[existingIndex].id : null
                )

                if (existingIndex >= 0) {
                    newFields[existingIndex] = { ...newFields[existingIndex], ...fieldData }
                } else {
                    newFields.unshift(fieldData)
                }
            })

            setFields(newFields)
        }
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [editorComponent])

    // 保存
    const handleSave = async () => {
        // 验证字段名不能为空
        const emptyNames = fields.filter(f => !f.name.trim())
        if (emptyNames.length > 0) {
            if (showToast) showToast('warning', '字段名称不能为空')
            return
        }

        // 验证字段名不能重复
        const names = fields.map(f => f.name)
        const duplicates = names.filter((name, index) => names.indexOf(name) !== index)
        if (duplicates.length > 0) {
            if (showToast) showToast('warning', `字段名称重复: ${duplicates.join(', ')}`)
            return
        }

        // 优先使用 schemaText (代码编辑器中的内容) 作为最新的 schema
        let finalJsonSchemaStr = schemaText

        // 如果 schemaText 为空，则回退到 generateJsonSchema
        if (!finalJsonSchemaStr || !finalJsonSchemaStr.trim()) {
            const jsonSchema = generateJsonSchema(fields, titleField, allModuleTypes)
            finalJsonSchemaStr = JSON.stringify(jsonSchema, null, 2)
        }

        // 验证 JSON 格式
        try {
            JSON.parse(finalJsonSchemaStr)
        } catch {
            if (showToast) showToast('error', 'JSON 格式错误')
            return
        }

        setLoading(true)

        try {
            const response = await authFetch(`/api/module-types/${moduleType!.id}`, {
                method: 'PUT',
                body: {
                    ...moduleType,
                    jsonSchema: finalJsonSchemaStr
                }
            })

            const result = await response.json()

            if (result.code === 200) {
                if (showToast) showToast('success', '保存成功')
                setIsOpen(false)
                if (onSave) {
                    onSave()
                }
            } else {
                if (showToast) showToast('error', result.message || '保存失败')
            }
        } catch (error) {
            console.error('保存 JSON Schema 失败:', error)
            if (showToast) showToast('error', '保存失败，请重试')
        } finally {
            setLoading(false)
        }
    }

    // 关闭
    const handleClose = () => {
        setIsOpen(false)
        setPreviewData({})
        if (onClose) {
            onClose()
        }
    }

    // 应用 Schema
    const handleApplySchema = () => {
        if (!schemaText.trim()) {
            setSchemaError('请输入 Schema')
            return
        }
        handleParseJsonSchema(schemaText)
    }

    const handleCopySchema = async () => {
        const text = schemaText || ''
        if (!text.trim()) {
            setSchemaError('请输入 Schema')
            return
        }

        let copied = false
        if (navigator.clipboard && navigator.clipboard.writeText) {
            try {
                await navigator.clipboard.writeText(text)
                copied = true
            } catch {
                copied = false
            }
        }

        if (!copied) {
            try {
                const textarea = document.createElement('textarea')
                textarea.value = text
                textarea.setAttribute('readonly', '')
                textarea.style.position = 'fixed'
                textarea.style.left = '-9999px'
                document.body.appendChild(textarea)
                textarea.select()
                textarea.setSelectionRange(0, textarea.value.length)
                copied = document.execCommand('copy')
                document.body.removeChild(textarea)
            } catch {
                copied = false
            }
        }

        if (showToast) {
            if (copied) {
                showToast('success', '已复制')
            } else {
                showToast('error', '复制失败，请手动选中复制')
            }
        }
    }

    if (!isOpen) return null

    return (
        <div className="admin-modal-overlay" onClick={handleClose}>
            {/* 弹窗内容 */}
            <div className="admin-modal" onClick={e => e.stopPropagation()} style={{ maxWidth: '95vw', maxHeight: '90vh', display: 'flex', flexDirection: 'column' }}>
                {/* 标题 */}
                <div className="admin-modal-header" style={{ marginBottom: '16px' }}>
                    <h3 className="admin-modal-title" style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                        <svg style={{ width: '24px', height: '24px', color: '#14b8a6' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />
                        </svg>
                        编辑 {moduleType?.name as string}
                    </h3>
                    <button className="admin-modal-close" onClick={handleClose}>&times;</button>
                </div>

                {/* 三栏布局 */}
                <div className="flex gap-4 flex-1 overflow-hidden">
                    {/* 左侧：基础设置 */}
                    <div className="flex-1 flex flex-col overflow-hidden">
                        <h3 className="text-lg font-semibold text-text-primary mb-3 pb-3 border-b border-border">
                            基础设置
                        </h3>

                        {/* 编辑器设置面板 */}
                        <EditorSettings
                            titleField={titleField}
                            setTitleField={setTitleField}
                            fields={fields}
                        />

                        {/* 字段列表 */}
                        <FieldEditor
                            fields={fields}
                            allModuleTypes={allModuleTypes}
                            onAddField={addField}
                            onUpdateField={updateField}
                            onRemoveField={removeField}
                            onMoveFieldUp={moveFieldUp}
                            onMoveFieldDown={moveFieldDown}
                        />
                    </div>

                    {/* 中间：表单预览 */}
                    <div className="flex-1 flex flex-col overflow-hidden border-l border-r border-border px-4">
                        <h3 className="text-lg font-semibold text-text-primary mb-3 pb-3 border-b border-border">
                            表单预览
                        </h3>

                        <div className="flex-1 overflow-y-auto pr-2">
                            <div className="p-4 border border-border rounded-lg bg-bg-secondary">
                                {editorComponent === 'JSONschema' ? (
                                    <FormPreview
                                        fields={fields}
                                        previewData={previewData}
                                        setPreviewData={setPreviewData}
                                        allModuleTypes={allModuleTypes}
                                    />
                                ) : (
                                    <div className="text-center py-8">
                                        {editorComponent === 'SmartWriterEditor' ? (
                                            <div className="text-text-secondary">
                                                <svg className="w-12 h-12 mx-auto mb-3 opacity-50" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                                                </svg>
                                                <p className="font-medium mb-1">智能写作编辑器</p>
                                                <p className="text-sm opacity-70">该编辑器类型仅在桌面端应用中可用</p>
                                            </div>
                                        ) : (
                                            <div className="text-text-secondary">
                                                不支持预览: {editorComponent}
                                            </div>
                                        )}
                                    </div>
                                )}
                            </div>
                        </div>
                    </div>

                    {/* 右侧：JSON Schema */}
                    <div className="flex-1 flex flex-col overflow-hidden">
                        <div className="flex items-center justify-between mb-3 pb-3 border-b border-border">
                            <h3 className="text-lg font-semibold text-text-primary">
                                JSON Schema
                            </h3>
                            <div className="flex gap-2">
                                <button
                                    onClick={handleApplySchema}
                                    className="px-3 py-1 text-xs bg-green-600 text-white rounded hover:bg-green-700 transition-colors"
                                >
                                    应用
                                </button>
                                <button
                                    onClick={handleCopySchema}
                                    className="px-3 py-1 text-xs bg-primary text-white rounded hover:bg-primary-hover transition-colors"
                                >
                                    复制
                                </button>
                            </div>
                        </div>

                        {schemaError && (
                            <div className="mb-2 p-2 bg-red-500/10 border border-red-500/30 rounded text-xs text-red-400">
                                {schemaError}
                            </div>
                        )}

                        <div className="flex-1 overflow-hidden">
                            <textarea
                                value={schemaText}
                                onChange={(e) => setSchemaText(e.target.value)}
                                className="admin-form-textarea w-full h-full font-mono text-sm resize-none"
                                spellCheck="false"
                            />
                        </div>
                    </div>

                    {/* 底部按钮 */}
                    <div style={{ display: 'flex', gap: '12px', justifyContent: 'flex-end', marginTop: '16px', paddingTop: '16px', borderTop: '1px solid rgba(13, 148, 136, 0.2)' }}>
                        <button
                            onClick={handleClose}
                            disabled={loading}
                            className="admin-btn admin-btn-secondary"
                        >
                            取消
                        </button>
                        <button
                            onClick={handleSave}
                            disabled={loading}
                            className="admin-btn admin-btn-primary"
                        >
                            {loading && (
                                <svg className="animate-spin" style={{ width: '16px', height: '16px', marginRight: '8px' }} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
                                </svg>
                            )}
                            保存
                        </button>
                    </div>
                </div>
            </div>
        </div>
    )
})

JsonSchemaEditor.displayName = 'JsonSchemaEditor'

export default JsonSchemaEditor
