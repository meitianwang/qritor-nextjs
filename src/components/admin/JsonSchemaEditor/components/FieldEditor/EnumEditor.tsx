'use client'

import React from 'react'
import type { SchemaField } from '../../constants'

interface EnumEditorProps {
    field: SchemaField
    onUpdateField: (id: string, key: string, value: unknown) => void
}

/**
 * 枚举选项编辑器
 * 用于配置 select/radio/checkbox 的选项
 */
const EnumEditor: React.FC<EnumEditorProps> = ({ field, onUpdateField }) => {
    return (
        <div className="col-span-2">
            <label className="block text-sm font-medium text-text-secondary mb-2">
                可选项配置
            </label>
            <div className="space-y-2">
                {(field.enum || []).map((enumValue, enumIndex) => (
                    <div key={`${field.id}-enum-${enumIndex}`} className="flex gap-2">
                        <input
                            type="text"
                            value={enumValue}
                            onChange={(e) => {
                                const newEnum = [...(field.enum || [])]
                                newEnum[enumIndex] = e.target.value
                                onUpdateField(field.id, 'enum', newEnum)
                            }}
                            placeholder={`选项 ${enumIndex + 1}`}
                            className="admin-form-input flex-1"
                        />
                        <button
                            type="button"
                            onClick={() => {
                                const newEnum = (field.enum || []).filter((_, i) => i !== enumIndex)
                                onUpdateField(field.id, 'enum', newEnum)
                            }}
                            className="px-3 py-2 text-red-500 hover:text-red-400 hover:text-red-300 transition-colors"
                            title="删除选项"
                        >
                            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                            </svg>
                        </button>
                    </div>
                ))}
                <button
                    type="button"
                    onClick={() => {
                        const newEnum = [...(field.enum || []), '']
                        onUpdateField(field.id, 'enum', newEnum)
                    }}
                    className="w-full py-2 border-2 border-dashed border-border rounded-lg text-text-secondary hover:border-primary hover:text-primary transition-colors flex items-center justify-center gap-2"
                >
                    <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
                    </svg>
                    添加选项
                </button>
            </div>
        </div>
    )
}

export default EnumEditor
