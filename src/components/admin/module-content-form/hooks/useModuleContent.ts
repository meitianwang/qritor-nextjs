'use client'

/**
 * useModuleContent Hook
 *
 * 管理模块内容的加载和保存逻辑
 */

import { useState, useEffect, useCallback } from 'react'
import { authFetch } from '@/lib/auth-utils'
import { useTranslation } from '@/hooks/useTranslation'

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

interface ModuleType {
    id: string | number | undefined
    name: string | undefined
    jsonSchema: string | undefined
    editorComponent: string
    entityCategory: string | undefined
}

type ShowToastFn = ((type: string, message: string) => void) | undefined

export function useModuleContent(selectedNode: SelectedNode | null | undefined, onSave?: (data: unknown) => void) {
    const { t } = useTranslation('studio')
    const [formData, setFormData] = useState<Record<string, unknown>>({})
    const [moduleType, setModuleType] = useState<ModuleType | null>(null)
    const [loading, setLoading] = useState(false)
    const [saving, setSaving] = useState(false)
    const [error, setError] = useState('')

    // 加载模块内容数据
    const loadModuleContent = useCallback(() => {
        if (!selectedNode) return

        setLoading(true)
        setError('')

        try {
            // 直接使用后端返回的 jsonSchema，不需要再次请求
            // 根据 entityCategory 动态计算 editorComponent
            const editorComponent = selectedNode.entityCategory === 'chapter' ? 'SmartWriterEditor' : 'JSONschema'
            setModuleType({
                id: selectedNode.moduleTypeId,
                name: selectedNode.moduleTypeName,
                jsonSchema: selectedNode.jsonSchema,
                editorComponent,
                entityCategory: selectedNode.entityCategory
            })

            // 解析模块内容
            let contentData: Record<string, unknown> = {}
            if (selectedNode.content && selectedNode.content !== '{}') {
                try {
                    contentData = JSON.parse(selectedNode.content)
                } catch (e) {
                    console.warn('解析模块内容失败:', e)
                    contentData = {}
                }
            }
            setFormData(contentData)
        } catch (err) {
            console.error('加载模块数据失败:', err)
            setError(t('moduleContentForm.loadFailed'))
        } finally {
            setLoading(false)
        }
    }, [selectedNode, t])

    // 当选中的节点变化时，加载模块内容数据
    useEffect(() => {
        if (selectedNode && selectedNode.jsonSchema) {
            loadModuleContent()
        } else {
            setModuleType(null)
            setFormData({})
        }
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [selectedNode])

    // 保存表单数据
    const handleSave = useCallback(async (showToast?: ShowToastFn) => {
        if (!selectedNode) return

        setSaving(true)
        setError('')

        try {
            // 构造新的 title
            let newTitle = selectedNode.title
            if (formData.title) {
                newTitle = formData.title as string
                if (formData.chapter_number) {
                    newTitle = `第${formData.chapter_number}章 ${newTitle}`
                }
            }

            const response = await authFetch(`/api/modules/${selectedNode.id}`, {
                method: 'PUT',
                body: {
                    ...selectedNode,
                    title: newTitle,
                    content: JSON.stringify(formData)
                }
            })

            const result = await response.json()

            if (result.code === 200) {
                if (onSave) {
                    onSave(result.data)
                }
                showToast?.('success', t('moduleContentForm.saveSuccess'))
            } else {
                setError(t('moduleContentForm.saveFailed') + ': ' + result.message)
                showToast?.('error', t('moduleContentForm.saveFailed') + ': ' + result.message)
            }
        } catch (err) {
            console.error('保存模块内容失败:', err)
            setError(t('moduleContentForm.saveFailedRetry'))
            showToast?.('error', t('moduleContentForm.saveFailedRetry'))
        } finally {
            setSaving(false)
        }
    }, [selectedNode, formData, onSave, t])

    // 更新表单字段值
    const updateFormData = useCallback((fieldName: string, value: unknown) => {
        setFormData(prev => ({
            ...prev,
            [fieldName]: value
        }))
    }, [])

    // 动态计算显示标题
    const getDisplayTitle = useCallback(() => {
        if (loading || !formData) return selectedNode?.title || ''

        // 章节类型使用特殊的标题格式
        if (moduleType?.entityCategory === 'chapter') {
            const title = (formData.title as string) || selectedNode?.title || ''
            const chapterNum = formData.chapter_number

            if (chapterNum) {
                return `第${chapterNum}章 ${title}`
            }
            return title
        }

        return selectedNode?.title || ''
    }, [loading, formData, moduleType, selectedNode])

    return {
        formData,
        moduleType,
        loading,
        saving,
        error,
        loadModuleContent,
        handleSave,
        updateFormData,
        getDisplayTitle
    }
}

export default useModuleContent
