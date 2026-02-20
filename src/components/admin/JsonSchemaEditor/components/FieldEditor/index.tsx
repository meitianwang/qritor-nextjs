'use client'

import React from 'react'
import FieldCard from './FieldCard'
import type { SchemaField } from '../../constants'
import type { ModuleType } from '../../utils/schemaGenerator'

interface FieldEditorProps {
    fields: SchemaField[]
    allModuleTypes: ModuleType[]
    onAddField: () => void
    onUpdateField: (id: string, key: string, value: unknown) => void
    onRemoveField: (id: string) => void
    onMoveFieldUp: (index: number) => void
    onMoveFieldDown: (index: number) => void
}

/**
 * 字段编辑器组件
 * 管理字段列表的编辑
 */
const FieldEditor: React.FC<FieldEditorProps> = ({
    fields,
    allModuleTypes,
    onAddField,
    onUpdateField,
    onRemoveField,
    onMoveFieldUp,
    onMoveFieldDown
}) => {
    return (
        <div className="flex-1 overflow-y-auto pr-2 space-y-4">
            {fields.map((field, index) => (
                <FieldCard
                    key={field.id}
                    field={field}
                    index={index}
                    fieldsLength={fields.length}
                    allModuleTypes={allModuleTypes}
                    onUpdateField={onUpdateField}
                    onRemoveField={onRemoveField}
                    onMoveFieldUp={onMoveFieldUp}
                    onMoveFieldDown={onMoveFieldDown}
                />
            ))}

            {/* 添加字段按钮 */}
            <button
                onClick={onAddField}
                className="w-full py-3 border-2 border-dashed border-border rounded-lg text-text-secondary hover:border-primary hover:text-primary transition-colors flex items-center justify-center gap-2"
            >
                <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
                </svg>
                添加字段
            </button>
        </div>
    )
}

export default FieldEditor
