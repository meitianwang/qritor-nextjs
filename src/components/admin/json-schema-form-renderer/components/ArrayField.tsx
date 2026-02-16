'use client'

/**
 * 数组字段组件
 */

import React from 'react'
import { useTranslation } from '@/hooks/useTranslation'

// eslint-disable-next-line @typescript-eslint/no-explicit-any
type ItemSchema = Record<string, any>

interface ArrayFieldProps {
    value: unknown[] | undefined
    onChange: (value: unknown[]) => void
    itemSchema: ItemSchema | undefined
    uiWidget?: string
    renderArrayItemInput: (
        itemSchema: ItemSchema | undefined,
        value: unknown,
        onItemChange: (value: unknown) => void,
        uiWidget?: string
    ) => React.ReactNode
}

function ArrayField({ value, onChange, itemSchema, uiWidget, renderArrayItemInput }: ArrayFieldProps) {
    const { t } = useTranslation('studio')
    const arrayValue = Array.isArray(value) ? value : []

    const addArrayItem = () => {
        let defaultValue: unknown = ''
        if (itemSchema?.type === 'number') {
            defaultValue = 0
        } else if (itemSchema?.type === 'boolean') {
            defaultValue = false
        } else if (itemSchema?.type === 'object') {
            defaultValue = {}
        }

        onChange([...arrayValue, defaultValue])
    }

    const removeArrayItem = (index: number) => {
        const newArray = arrayValue.filter((_, i) => i !== index)
        onChange(newArray)
    }

    const updateArrayItem = (index: number, itemValue: unknown) => {
        const newArray = [...arrayValue]
        newArray[index] = itemValue
        onChange(newArray)
    }

    return (
        <div className="space-y-2">
            {arrayValue.map((item, index) => (
                <div key={index} className="flex gap-2 items-start p-3 border-2 border-dashed border-border rounded-lg">
                    <div className="flex-1">
                        <label className="block text-xs text-text-secondary mb-1">
                            {t('jsonSchemaFormRenderer.item', { index: index + 1 })}
                        </label>
                        {renderArrayItemInput(itemSchema, item, (itemValue) => updateArrayItem(index, itemValue), uiWidget)}
                    </div>
                    <button
                        onClick={() => removeArrayItem(index)}
                        className="mt-6 p-2 text-red-500 hover:text-red-400 hover:text-red-300 transition-colors"
                        title={t('jsonSchemaFormRenderer.deleteItem')}
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

export default ArrayField
