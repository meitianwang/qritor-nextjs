'use client'

import React from 'react'
import { INPUT_COMMON_CLASSES, TEXTAREA_COMMON_CLASSES } from '../../constants'
import type { SchemaField } from '../../constants'
import type { ModuleType } from '../../utils/schemaGenerator'

interface SubFieldInputProps {
    subField: SchemaField
    parentValue: Record<string, unknown>
    onChange: (value: unknown) => void
    allModuleTypes: ModuleType[]
}

/**
 * 子字段输入组件
 * 用于渲染对象内部的字段
 */
const SubFieldInput: React.FC<SubFieldInputProps> = ({ subField, parentValue, onChange, allModuleTypes }) => {
    const value = parentValue[subField.name]
    const commonClasses = INPUT_COMMON_CLASSES
    const textareaClasses = TEXTAREA_COMMON_CLASSES

    switch (subField.type) {
        case 'string':
            if (subField.uiWidget === 'textarea') {
                return (
                    <textarea
                        value={(value as string) || ''}
                        onChange={(e) => onChange(e.target.value)}
                        placeholder={subField.description || `请输入${subField.name}`}
                        rows={3}
                        className={textareaClasses}
                    />
                )
            }
            return (
                <input
                    type="text"
                    value={(value as string) || ''}
                    onChange={(e) => onChange(e.target.value)}
                    placeholder={subField.description || `请输入${subField.name}`}
                    className={commonClasses}
                />
            )
        case 'number':
            return (
                <input
                    type="number"
                    value={(value as string) || ''}
                    onChange={(e) => onChange(e.target.value)}
                    placeholder={subField.description || `请输入${subField.name}`}
                    className={commonClasses}
                />
            )
        case 'boolean':
            return (
                <label className="flex items-center cursor-pointer">
                    <input
                        type="checkbox"
                        checked={(value as boolean) || false}
                        onChange={(e) => onChange(e.target.checked)}
                        className="w-4 h-4 text-primary border-border rounded focus:ring-2 focus:ring-primary"
                    />
                    <span className="ml-2 text-sm text-text-secondary">
                        {value ? '是' : '否'}
                    </span>
                </label>
            )
        case 'object':
            // 递归渲染嵌套对象
            if (subField.properties && subField.properties.length > 0) {
                const nestedValue = (value as Record<string, unknown>) || {}
                return (
                    <div className="pl-4 border-l-2 border-primary/20 space-y-2">
                        {subField.properties.map((nestedField) => (
                            <div key={nestedField.id}>
                                <label className="block text-xs font-medium text-text-primary mb-1">
                                    {nestedField.name}
                                    {nestedField.required && <span className="text-red-500 ml-1">*</span>}
                                </label>
                                <SubFieldInput
                                    subField={nestedField}
                                    parentValue={nestedValue}
                                    onChange={(nestedVal) => {
                                        onChange({ ...nestedValue, [nestedField.name]: nestedVal })
                                    }}
                                    allModuleTypes={allModuleTypes}
                                />
                            </div>
                        ))}
                    </div>
                )
            }
            return (
                <textarea
                    value={(value as string) || ''}
                    onChange={(e) => onChange(e.target.value)}
                    placeholder="请输入对象（JSON格式）"
                    rows={3}
                    className={textareaClasses}
                />
            )
        default:
            return (
                <input
                    type="text"
                    value={(value as string) || ''}
                    onChange={(e) => onChange(e.target.value)}
                    placeholder={`请输入${subField.name}`}
                    className={commonClasses}
                />
            )
    }
}

export default SubFieldInput
