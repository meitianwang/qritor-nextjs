import { useState, useCallback } from 'react'
import { createDefaultField } from '../constants'
import type { SchemaField } from '../constants'

/**
 * 字段操作 Hook
 * 管理 Schema 字段的增删改查和排序操作
 */
export function useSchemaFields(initialFields: SchemaField[] = []) {
    const [fields, setFields] = useState<SchemaField[]>(initialFields)

    // 添加新字段
    const addField = useCallback(() => {
        setFields(prev => [...prev, createDefaultField()])
    }, [])

    // 删除字段（顶层）
    const removeField = useCallback((id: string) => {
        setFields(prev => prev.filter(f => f.id !== id))
    }, [])

    // 递归更新字段
    const updateFieldRecursive = useCallback((id: string, key: string, value: unknown, parentFields: SchemaField[]): SchemaField[] => {
        return parentFields.map(f => {
            if (f.id === id) {
                return { ...f, [key]: value }
            }
            if (f.properties && f.properties.length > 0) {
                return { ...f, properties: updateFieldRecursive(id, key, value, f.properties) }
            }
            return f
        })
    }, [])

    // 更新字段
    const updateField = useCallback((id: string, key: string, value: unknown) => {
        setFields(prev => updateFieldRecursive(id, key, value, prev))
    }, [updateFieldRecursive])

    // 递归添加子字段
    const addSubFieldRecursive = useCallback((parentId: string, parentFields: SchemaField[]): SchemaField[] => {
        return parentFields.map(f => {
            if (f.id === parentId) {
                return {
                    ...f,
                    properties: [...f.properties, createDefaultField()]
                }
            }
            if (f.properties && f.properties.length > 0) {
                return { ...f, properties: addSubFieldRecursive(parentId, f.properties) }
            }
            return f
        })
    }, [])

    // 添加子字段
    const addSubField = useCallback((parentId: string) => {
        setFields(prev => addSubFieldRecursive(parentId, prev))
    }, [addSubFieldRecursive])

    // 递归删除字段
    const removeFieldByIdRecursive = useCallback((id: string, parentFields: SchemaField[]): SchemaField[] => {
        const filtered = parentFields.filter(f => f.id !== id)
        return filtered.map(f => {
            if (f.properties && f.properties.length > 0) {
                return { ...f, properties: removeFieldByIdRecursive(id, f.properties) }
            }
            return f
        })
    }, [])

    // 删除字段（包括嵌套）
    const removeFieldById = useCallback((id: string) => {
        setFields(prev => removeFieldByIdRecursive(id, prev))
    }, [removeFieldByIdRecursive])

    // 移动字段顺序
    const moveField = useCallback((fromIndex: number, toIndex: number) => {
        setFields(prev => {
            const newFields = [...prev]
            const [movedField] = newFields.splice(fromIndex, 1)
            newFields.splice(toIndex, 0, movedField)
            return newFields
        })
    }, [])

    // 上移字段
    const moveFieldUp = useCallback((index: number) => {
        if (index > 0) {
            moveField(index, index - 1)
        }
    }, [moveField])

    // 下移字段
    const moveFieldDown = useCallback((index: number) => {
        setFields(prev => {
            if (index < prev.length - 1) {
                const newFields = [...prev]
                const [movedField] = newFields.splice(index, 1)
                newFields.splice(index + 1, 0, movedField)
                return newFields
            }
            return prev
        })
    }, [])

    return {
        fields,
        setFields,
        addField,
        removeField,
        updateField,
        addSubField,
        removeFieldById,
        moveField,
        moveFieldUp,
        moveFieldDown
    }
}
