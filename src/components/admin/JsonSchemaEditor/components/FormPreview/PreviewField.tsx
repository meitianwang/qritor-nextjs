'use client'

import React from 'react'
import { INPUT_COMMON_CLASSES, TEXTAREA_COMMON_CLASSES, SELECT_COMMON_CLASSES } from '../../constants'
import type { SchemaField } from '../../constants'
import type { ModuleType } from '../../utils/schemaGenerator'
import SubFieldInput from './SubFieldInput'
import { ModuleFields, ModuleFieldsInArray } from './ModuleFields'

interface PreviewFieldProps {
    field: SchemaField
    previewData: Record<string, unknown>
    setPreviewData: (data: Record<string, unknown>) => void
    allModuleTypes: ModuleType[]
}

/**
 * 预览字段组件
 * 渲染单个字段的预览输入框
 */
const PreviewField: React.FC<PreviewFieldProps> = ({ field, previewData, setPreviewData, allModuleTypes }) => {
    const commonClasses = INPUT_COMMON_CLASSES
    const textareaClasses = TEXTAREA_COMMON_CLASSES
    const selectClasses = SELECT_COMMON_CLASSES

    // 如果有枚举值，根据 uiWidget 类型渲染不同的组件
    if (field.enum && field.enum.length > 0 && !field.isArray) {
        switch (field.uiWidget) {
            case 'select':
                // 下拉选择
                return (
                    <select
                        value={(previewData[field.name] as string) || ''}
                        onChange={(e) => setPreviewData({ ...previewData, [field.name]: e.target.value })}
                        className={selectClasses}
                    >
                        <option value="">请选择</option>
                        {field.enum.map((value) => (
                            <option key={value} value={value}>
                                {field.enumLabels?.[value] || value}
                            </option>
                        ))}
                    </select>
                )

            case 'radio':
                // 单选按钮组
                return (
                    <div className="flex flex-wrap gap-2">
                        {field.enum.map((value) => {
                            const isSelected = previewData[field.name] === value
                            return (
                                <button
                                    key={value}
                                    type="button"
                                    onClick={() => setPreviewData({ ...previewData, [field.name]: value })}
                                    className={`px-4 py-2 rounded-lg border-2 transition-all ${isSelected
                                        ? 'border-primary bg-primary text-white'
                                        : 'border-border bg-bg-secondary text-text-primary hover:border-primary'
                                        }`}
                                >
                                    {field.enumLabels?.[value] || value}
                                </button>
                            )
                        })}
                    </div>
                )

            case 'checkbox': {
                // 多选按钮组
                const selectedValues = Array.isArray(previewData[field.name]) ? (previewData[field.name] as string[]) : []
                return (
                    <div className="flex flex-wrap gap-2">
                        {field.enum.map((value) => {
                            const isSelected = selectedValues.includes(value)
                            return (
                                <button
                                    key={value}
                                    type="button"
                                    onClick={() => {
                                        const newValues = isSelected
                                            ? selectedValues.filter(v => v !== value)
                                            : [...selectedValues, value]
                                        setPreviewData({ ...previewData, [field.name]: newValues })
                                    }}
                                    className={`px-4 py-2 rounded-lg border-2 transition-all ${isSelected
                                        ? 'border-primary bg-primary text-white'
                                        : 'border-border bg-bg-secondary text-text-primary hover:border-primary'
                                        }`}
                                >
                                    {field.enumLabels?.[value] || value}
                                </button>
                            )
                        })}
                    </div>
                )
            }
        }
    }

    // 如果是数组类型，渲染数组输入
    if (field.isArray) {
        const arrayValue = (previewData[field.name] as unknown[]) || []

        const addArrayItem = () => {
            // 根据数组元素类型初始化默认值
            let defaultValue: unknown = ''
            if (field.type === 'module') {
                defaultValue = {} // 模块类型初始化为空对象
            } else if (field.type === 'object' && field.properties && field.properties.length > 0) {
                defaultValue = {} // 对象类型初始化为空对象
            } else if (field.type === 'number') {
                defaultValue = 0
            } else if (field.type === 'boolean') {
                defaultValue = false
            }

            setPreviewData({
                ...previewData,
                [field.name]: [...arrayValue, defaultValue]
            })
        }

        const removeArrayItem = (index: number) => {
            const newArray = arrayValue.filter((_: unknown, i: number) => i !== index)
            setPreviewData({
                ...previewData,
                [field.name]: newArray
            })
        }

        const updateArrayItem = (index: number, value: unknown) => {
            const newArray = [...arrayValue]
            newArray[index] = value
            setPreviewData({
                ...previewData,
                [field.name]: newArray
            })
        }

        // 渲染数组项输入框的函数
        const renderArrayItemInput = (f: SchemaField, value: unknown, onChange: (value: unknown) => void) => {
            const itemType = f.type

            switch (itemType) {
                case 'string':
                    if (f.uiWidget === 'textarea') {
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
                    // 模块类型，根据选择的模块类型渲染其字段
                    return (
                        <ModuleFieldsInArray
                            field={f}
                            value={(value as Record<string, unknown>) || {}}
                            onChange={onChange as (value: Record<string, unknown>) => void}
                            allModuleTypes={allModuleTypes}
                        />
                    )
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

        return (
            <div className="space-y-2">
                {arrayValue.map((item, index) => (
                    <div key={index} className="flex gap-2 items-start p-3 border-2 border-dashed border-border rounded-lg">
                        <div className="flex-1">
                            <label className="block text-xs text-text-secondary mb-1">
                                项目 {index + 1}
                            </label>
                            {renderArrayItemInput(field, item, (value) => updateArrayItem(index, value))}
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

    // 非数组类型，根据字段类型渲染
    switch (field.type) {
        case 'string':
            if (field.uiWidget === 'textarea') {
                return (
                    <textarea
                        value={(previewData[field.name] as string) || ''}
                        onChange={(e) => setPreviewData({ ...previewData, [field.name]: e.target.value })}
                        placeholder={field.description || `请输入${field.name}`}
                        rows={4}
                        className={textareaClasses}
                    />
                )
            }
            return (
                <input
                    type="text"
                    value={(previewData[field.name] as string) || ''}
                    onChange={(e) => setPreviewData({ ...previewData, [field.name]: e.target.value })}
                    placeholder={field.description || `请输入${field.name}`}
                    className={commonClasses}
                />
            )
        case 'number':
            return (
                <input
                    type="number"
                    value={(previewData[field.name] as string) || ''}
                    onChange={(e) => setPreviewData({ ...previewData, [field.name]: e.target.value })}
                    placeholder={field.description || `请输入${field.name}`}
                    className={commonClasses}
                />
            )
        case 'boolean':
            return (
                <label className="flex items-center cursor-pointer">
                    <input
                        type="checkbox"
                        checked={(previewData[field.name] as boolean) || false}
                        onChange={(e) => setPreviewData({ ...previewData, [field.name]: e.target.checked })}
                        className="w-4 h-4 text-primary border-border rounded focus:ring-2 focus:ring-primary"
                    />
                    <span className="ml-2 text-sm text-text-secondary">
                        {field.description || field.name}
                    </span>
                </label>
            )
        case 'object':
            // 如果对象有定义的子字段，渲染为嵌套表单
            if (field.properties && field.properties.length > 0) {
                const objectValue = (previewData[field.name] as Record<string, unknown>) || {}

                return (
                    <div className="pl-4 border-l-2 border-primary/30 space-y-3">
                        {field.properties.map((subField) => (
                            <div key={subField.id}>
                                <label className="block text-xs font-medium text-text-primary mb-1">
                                    {subField.name}
                                    {subField.required && <span className="text-red-500 ml-1">*</span>}
                                </label>
                                <SubFieldInput
                                    subField={subField}
                                    parentValue={objectValue}
                                    onChange={(value) => {
                                        setPreviewData({
                                            ...previewData,
                                            [field.name]: { ...objectValue, [subField.name]: value }
                                        })
                                    }}
                                    allModuleTypes={allModuleTypes}
                                />
                            </div>
                        ))}
                    </div>
                )
            }

            // 如果没有定义子字段，使用 textarea
            return (
                <textarea
                    value={(previewData[field.name] as string) || ''}
                    onChange={(e) => setPreviewData({ ...previewData, [field.name]: e.target.value })}
                    placeholder={`请输入${field.name}（对象格式）`}
                    rows={4}
                    className={textareaClasses}
                />
            )
        case 'module':
            // 模块类型，根据选择的模块类型渲染其字段
            return (
                <ModuleFields
                    field={field}
                    value={(previewData[field.name] as Record<string, unknown>) || {}}
                    onChange={(value) => {
                        setPreviewData({ ...previewData, [field.name]: value })
                    }}
                    allModuleTypes={allModuleTypes}
                />
            )
        default:
            return (
                <input
                    type="text"
                    value={(previewData[field.name] as string) || ''}
                    onChange={(e) => setPreviewData({ ...previewData, [field.name]: e.target.value })}
                    placeholder={`请输入${field.name}`}
                    className={commonClasses}
                />
            )
    }
}

export default PreviewField
