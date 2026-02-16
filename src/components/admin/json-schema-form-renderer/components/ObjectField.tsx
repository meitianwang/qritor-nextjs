'use client'

/**
 * 对象字段组件
 */

import React from 'react'
import { commonClasses } from '../utils'

// eslint-disable-next-line @typescript-eslint/no-explicit-any
type FieldSchema = Record<string, any>

interface ObjectFieldProps {
    value: Record<string, unknown> | undefined
    onChange: (value: Record<string, unknown> | string) => void
    fieldSchema: FieldSchema
    renderSubFieldInput: (
        subFieldName: string,
        subFieldSchema: FieldSchema,
        parentValue: Record<string, unknown>,
        onSubChange: (value: unknown) => void
    ) => React.ReactNode
}

function ObjectField({ value, onChange, fieldSchema, renderSubFieldInput }: ObjectFieldProps) {
    const objectValue = value || {}

    // 如果对象有定义的子字段,渲染为嵌套表单
    if (fieldSchema.properties) {
        return (
            <div className="pl-4 border-l-2 border-primary/30 space-y-3">
                {Object.entries(fieldSchema.properties).map(([subFieldName, subFieldSchema]) => (
                    <div key={subFieldName}>
                        <label className="block text-xs font-medium text-text-primary mb-1">
                            {subFieldName}
                            {fieldSchema.required?.includes(subFieldName) && <span className="text-red-500 ml-1">*</span>}
                        </label>
                        {renderSubFieldInput(subFieldName, subFieldSchema as FieldSchema, objectValue, (subValue) => {
                            onChange({ ...objectValue, [subFieldName]: subValue })
                        })}
                    </div>
                ))}
            </div>
        )
    }

    // 如果没有定义子字段,使用 textarea
    return (
        <textarea
            value={typeof objectValue === 'object' ? JSON.stringify(objectValue, null, 2) : (objectValue || '')}
            onChange={(e) => {
                try {
                    const parsed = JSON.parse(e.target.value)
                    onChange(parsed)
                } catch {
                    onChange(e.target.value)
                }
            }}
            placeholder="请输入(对象格式)"
            rows={4}
            className={commonClasses}
        />
    )
}

export default ObjectField
