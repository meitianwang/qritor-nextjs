'use client'

import React from 'react'
import { INPUT_COMMON_CLASSES, TEXTAREA_COMMON_CLASSES } from '../../constants'
import type { SchemaField } from '../../constants'
import type { ModuleType } from '../../utils/schemaGenerator'

interface ModuleFieldInputProps {
    fieldName: string
    fieldSchema: Record<string, unknown>
    parentValue: Record<string, unknown>
    onChange: (value: Record<string, unknown>) => void
    allModuleTypes: ModuleType[]
    renderModuleFields: (field: PseudoField, value: Record<string, unknown>, onChange: (value: Record<string, unknown>) => void) => React.ReactNode
}

interface PseudoField {
    name: string
    moduleTypeRef: string
    description?: string
    type?: string
    uiWidget?: string
    properties?: Record<string, unknown>
}

interface ModuleFieldsProps {
    field: SchemaField | PseudoField
    value: Record<string, unknown>
    onChange: (value: Record<string, unknown>) => void
    allModuleTypes: ModuleType[]
}

interface ArrayItemInputProps {
    field: PseudoField
    value: unknown
    onChange: (value: unknown) => void
    allModuleTypes: ModuleType[]
    renderModuleFieldsInArray?: (field: PseudoField, value: Record<string, unknown>, onChange: (value: Record<string, unknown>) => void) => React.ReactNode
}

/**
 * 模块类型字段渲染组件
 * 用于渲染模块类型的字段
 */

// 渲染模块字段输入框
export const ModuleFieldInput: React.FC<ModuleFieldInputProps> = ({ fieldName, fieldSchema, parentValue, onChange, allModuleTypes, renderModuleFields }) => {
    const value = parentValue[fieldName]
    const commonClasses = INPUT_COMMON_CLASSES

    // 1. 优先处理嵌套模块 (Schema 中表现为 object 且带有 x-moduleType)
    if (fieldSchema['x-moduleType']) {
        const pseudoField: PseudoField = {
            name: fieldName,
            moduleTypeRef: fieldSchema['x-moduleType'] as string,
            description: fieldSchema.description as string
        }
        return (
            <div className="pl-3 border-l-2 border-gray-200 dark:border-gray-700 mt-2">
                {/* 递归调用 renderModuleFields 来渲染嵌套模块的内容 */}
                {renderModuleFields(pseudoField, (value as Record<string, unknown>) || {}, (newValue) => onChange({ ...parentValue, [fieldName]: newValue }))}
            </div>
        )
    }

    switch (fieldSchema.type) {
        case 'string':
            return (
                <input
                    type="text"
                    value={(value as string) || ''}
                    onChange={(e) => onChange({ ...parentValue, [fieldName]: e.target.value })}
                    placeholder={(fieldSchema.description as string) || `请输入${fieldName}`}
                    className={commonClasses}
                />
            )
        case 'number':
            return (
                <input
                    type="number"
                    value={(value as string) || ''}
                    onChange={(e) => onChange({ ...parentValue, [fieldName]: e.target.value })}
                    placeholder={(fieldSchema.description as string) || `请输入${fieldName}`}
                    className={commonClasses}
                />
            )
        case 'boolean':
            return (
                <label className="flex items-center cursor-pointer">
                    <input
                        type="checkbox"
                        checked={(value as boolean) || false}
                        onChange={(e) => onChange({ ...parentValue, [fieldName]: e.target.checked })}
                        className="w-4 h-4 text-primary border-border rounded focus:ring-2 focus:ring-primary"
                    />
                    <span className="ml-2 text-sm text-text-secondary">
                        {value ? '是' : '否'}
                    </span>
                </label>
            )
        case 'array': {
            const arrayValue = Array.isArray(value) ? value : []
            const itemSchema = (fieldSchema.items as Record<string, unknown>) || {}

            // 构造伪字段以复用 renderArrayItemInput
            const pseudoArrayField: PseudoField = {
                name: fieldName,
                type: itemSchema['x-moduleType'] ? 'module' : itemSchema.type as string,
                moduleTypeRef: (itemSchema['x-moduleType'] as string) || '',
                uiWidget: itemSchema['x-uiWidget'] as string,
                properties: itemSchema.properties as Record<string, unknown>
            }

            const addArrayItem = () => {
                let defaultValue: unknown = ''
                if (pseudoArrayField.type === 'module' || pseudoArrayField.type === 'object') defaultValue = {}
                else if (pseudoArrayField.type === 'number') defaultValue = 0
                else if (pseudoArrayField.type === 'boolean') defaultValue = false

                onChange({ ...parentValue, [fieldName]: [...arrayValue, defaultValue] })
            }

            const removeArrayItem = (index: number) => {
                const newArray = arrayValue.filter((_: unknown, i: number) => i !== index)
                onChange({ ...parentValue, [fieldName]: newArray })
            }

            const updateArrayItem = (index: number, itemValue: unknown) => {
                const newArray = [...arrayValue]
                newArray[index] = itemValue
                onChange({ ...parentValue, [fieldName]: newArray })
            }

            return (
                <div className="space-y-2 mt-1">
                    {arrayValue.map((item: unknown, index: number) => (
                        <div key={index} className="flex gap-2 items-start p-3 border-2 border-dashed border-border rounded-lg">
                            <div className="flex-1">
                                <label className="block text-xs text-text-secondary mb-1">
                                    项目 {index + 1}
                                </label>
                                <ArrayItemInput
                                    field={pseudoArrayField}
                                    value={item}
                                    onChange={(val) => updateArrayItem(index, val)}
                                    allModuleTypes={allModuleTypes}
                                    renderModuleFieldsInArray={renderModuleFields}
                                />
                            </div>
                            <button
                                onClick={() => removeArrayItem(index)}
                                className="mt-6 p-2 text-red-500 hover:text-red-400 hover:text-red-300 transition-colors"
                                title="删除此项"
                            >
                                <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                </svg>
                            </button>
                        </div>
                    ))}
                    <button
                        onClick={addArrayItem}
                        className="w-full py-2 border-2 border-dashed border-border rounded-lg text-text-secondary hover:border-primary hover:text-primary transition-colors flex items-center justify-center gap-2"
                    >
                        <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
                        </svg>
                        添加项目
                    </button>
                </div>
            )
        }

        case 'object': {
            const objectValue = (value as Record<string, unknown>) || {}
            const properties = fieldSchema.properties as Record<string, Record<string, unknown>> | undefined
            if (properties) {
                return (
                    <div className="pl-3 border-l-2 border-gray-200 dark:border-gray-700 mt-2 space-y-3">
                        {Object.entries(properties).map(([subKey, subSchema]) => (
                            <div key={subKey}>
                                <label className="block text-xs font-medium text-text-primary mb-1">
                                    {subKey}
                                    {(fieldSchema.required as string[])?.includes(subKey) && <span className="text-red-500 ml-1">*</span>}
                                </label>
                                {/* 递归调用自身来渲染子字段 */}
                                <ModuleFieldInput
                                    fieldName={subKey}
                                    fieldSchema={subSchema}
                                    parentValue={objectValue}
                                    onChange={(newObj) => onChange({ ...parentValue, [fieldName]: newObj })}
                                    allModuleTypes={allModuleTypes}
                                    renderModuleFields={renderModuleFields}
                                />
                            </div>
                        ))}
                    </div>
                )
            }
        }
        // Fallthrough to default if no properties defined

        default:
            return (
                <input
                    type="text"
                    value={(value as string) || ''}
                    onChange={(e) => onChange({ ...parentValue, [fieldName]: e.target.value })}
                    placeholder={`请输入${fieldName}`}
                    className={commonClasses}
                />
            )
    }
}

// 渲染数组项的输入框（根据元素类型）
export const ArrayItemInput: React.FC<ArrayItemInputProps> = ({ field, value, onChange, allModuleTypes, renderModuleFieldsInArray }) => {
    const commonClasses = INPUT_COMMON_CLASSES
    const textareaClasses = TEXTAREA_COMMON_CLASSES
    const itemType = field.type

    switch (itemType) {
        case 'string':
            if (field.uiWidget === 'textarea') {
                return (
                    <textarea
                        value={(value as string) || ''}
                        onChange={(e) => onChange(e.target.value)}
                        placeholder="请输入文本"
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
                    placeholder="请输入文本"
                    className={commonClasses}
                />
            )
        case 'number':
            return (
                <input
                    type="number"
                    value={(value as string) || ''}
                    onChange={(e) => onChange(e.target.value)}
                    placeholder="请输入数字"
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
        case 'module':
            // 模块类型使用外部传入的渲染函数
            if (renderModuleFieldsInArray) {
                return <>{renderModuleFieldsInArray(field, (value as Record<string, unknown>) || {}, onChange as (value: Record<string, unknown>) => void)}</>
            }
            return null
        default:
            return (
                <input
                    type="text"
                    value={(value as string) || ''}
                    onChange={(e) => onChange(e.target.value)}
                    placeholder="请输入内容"
                    className={commonClasses}
                />
            )
    }
}

// 渲染模块类型字段（用于非数组）
export const ModuleFields: React.FC<ModuleFieldsProps> = ({ field, value, onChange, allModuleTypes }) => {
    if (!field.moduleTypeRef) {
        return (
            <div className="text-sm text-text-secondary py-2">
                请在基础设置中选择模块类型
            </div>
        )
    }

    const selectedModuleType = allModuleTypes.find(mt => mt.name === field.moduleTypeRef)
    if (!selectedModuleType || !selectedModuleType.jsonSchema) {
        return (
            <div className="text-sm text-text-secondary py-2">
                未找到模块类型或该类型没有定义字段
            </div>
        )
    }

    try {
        const schema = JSON.parse(selectedModuleType.jsonSchema)
        if (!schema.properties) {
            return (
                <div className="text-sm text-text-secondary py-2">
                    该模块类型没有定义字段
                </div>
            )
        }

        // 递归渲染函数
        const renderModuleFieldsRecursive = (f: PseudoField, v: Record<string, unknown>, onChangeHandler: (value: Record<string, unknown>) => void) => (
            <ModuleFields
                field={f as ModuleFieldsProps['field']}
                value={v}
                onChange={onChangeHandler}
                allModuleTypes={allModuleTypes}
            />
        )

        return (
            <div className="pl-4 border-l-2 border-blue-400/30 dark:border-blue-500/30 space-y-3">
                <div className="text-xs text-blue-400 font-medium mb-2">
                    模块类型: {selectedModuleType.name}
                </div>
                {Object.entries(schema.properties).map(([fieldName, fieldSchema]) => (
                    <div key={fieldName}>
                        <label className="block text-xs font-medium text-text-primary mb-1">
                            {fieldName}
                            {schema.required?.includes(fieldName) && <span className="text-red-500 ml-1">*</span>}
                        </label>
                        <ModuleFieldInput
                            fieldName={fieldName}
                            fieldSchema={fieldSchema as Record<string, unknown>}
                            parentValue={value}
                            onChange={onChange}
                            allModuleTypes={allModuleTypes}
                            renderModuleFields={renderModuleFieldsRecursive}
                        />
                    </div>
                ))}
            </div>
        )
    } catch (e) {
        console.error('解析模块类型 Schema 失败:', e)
        return (
            <div className="text-sm text-red-500 py-2">
                解析模块类型 Schema 失败
            </div>
        )
    }
}

// 渲染模块类型字段（用于数组）
export const ModuleFieldsInArray: React.FC<ModuleFieldsProps> = ({ field, value, onChange, allModuleTypes }) => {
    if (!field.moduleTypeRef) {
        return (
            <div className="text-sm text-text-secondary py-2">
                请在基础设置中选择模块类型
            </div>
        )
    }

    const selectedModuleType = allModuleTypes.find(mt => mt.name === field.moduleTypeRef)
    if (!selectedModuleType || !selectedModuleType.jsonSchema) {
        return (
            <div className="text-sm text-text-secondary py-2">
                未找到模块类型或该类型没有定义字段
            </div>
        )
    }

    try {
        const schema = JSON.parse(selectedModuleType.jsonSchema)
        if (!schema.properties) {
            return (
                <div className="text-sm text-text-secondary py-2">
                    该模块类型没有定义字段
                </div>
            )
        }

        // 递归渲染函数
        const renderModuleFieldsRecursive = (f: PseudoField, v: Record<string, unknown>, onChangeHandler: (value: Record<string, unknown>) => void) => (
            <ModuleFieldsInArray
                field={f as ModuleFieldsProps['field']}
                value={v}
                onChange={onChangeHandler}
                allModuleTypes={allModuleTypes}
            />
        )

        return (
            <div className="space-y-3 pl-3 border-l-2 border-blue-400/30 dark:border-blue-500/30">
                <div className="text-xs text-blue-400 font-medium">
                    模块类型: {selectedModuleType.name}
                </div>
                {Object.entries(schema.properties).map(([fieldName, fieldSchema]) => (
                    <div key={fieldName}>
                        <label className="block text-xs font-medium text-text-primary mb-1">
                            {fieldName}
                            {schema.required?.includes(fieldName) && <span className="text-red-500 ml-1">*</span>}
                        </label>
                        <ModuleFieldInput
                            fieldName={fieldName}
                            fieldSchema={fieldSchema as Record<string, unknown>}
                            parentValue={value}
                            onChange={onChange}
                            allModuleTypes={allModuleTypes}
                            renderModuleFields={renderModuleFieldsRecursive}
                        />
                    </div>
                ))}
            </div>
        )
    } catch (e) {
        console.error('解析模块类型 Schema 失败:', e)
        return (
            <div className="text-sm text-red-500 py-2">
                解析模块类型 Schema 失败
            </div>
        )
    }
}

export default ModuleFields
