'use client'

/**
 * 枚举字段组件
 */

import React from 'react'
import { useTranslation } from '@/hooks/useTranslation'
import { commonClasses } from '../utils'

interface SelectFieldProps {
    value: string | undefined
    onChange: (value: string) => void
    enumValues: string[]
    enumLabels?: Record<string, string>
}

/**
 * 选择框字段组件
 */
export function SelectField({ value, onChange, enumValues, enumLabels }: SelectFieldProps) {
    const { t } = useTranslation('studio')

    return (
        <select
            value={value || ''}
            onChange={(e) => onChange(e.target.value)}
            className={commonClasses}
        >
            <option value="">{t('jsonSchemaFormRenderer.pleaseSelect')}</option>
            {enumValues.map((enumValue) => (
                <option key={enumValue} value={enumValue}>
                    {enumLabels?.[enumValue] || enumValue}
                </option>
            ))}
        </select>
    )
}

interface RadioFieldProps {
    value: string | undefined
    onChange: (value: string) => void
    enumValues: string[]
    enumLabels?: Record<string, string>
}

/**
 * 单选按钮组件
 */
export function RadioField({ value, onChange, enumValues, enumLabels }: RadioFieldProps) {
    return (
        <div className="flex flex-wrap gap-2">
            {enumValues.map((enumValue) => {
                const isSelected = value === enumValue
                return (
                    <button
                        key={enumValue}
                        type="button"
                        onClick={() => onChange(enumValue)}
                        className={`px-4 py-2 rounded-lg border-2 transition-all ${isSelected
                            ? 'border-primary bg-primary text-white'
                            : 'border-border bg-bg-secondary text-text-primary hover:border-primary'
                            }`}
                    >
                        {enumLabels?.[enumValue] || enumValue}
                    </button>
                )
            })}
        </div>
    )
}

interface CheckboxFieldProps {
    value: string[] | undefined
    onChange: (value: string[]) => void
    enumValues: string[]
    enumLabels?: Record<string, string>
}

/**
 * 多选框组件
 */
export function CheckboxField({ value, onChange, enumValues, enumLabels }: CheckboxFieldProps) {
    const selectedValues = Array.isArray(value) ? value : []

    return (
        <div className="flex flex-wrap gap-2">
            {enumValues.map((enumValue) => {
                const isSelected = selectedValues.includes(enumValue)
                return (
                    <button
                        key={enumValue}
                        type="button"
                        onClick={() => {
                            const newValues = isSelected
                                ? selectedValues.filter((v) => v !== enumValue)
                                : [...selectedValues, enumValue]
                            onChange(newValues)
                        }}
                        className={`px-4 py-2 rounded-lg border-2 transition-all ${isSelected
                            ? 'border-primary bg-primary text-white'
                            : 'border-border bg-bg-secondary text-text-primary hover:border-primary'
                            }`}
                    >
                        {enumLabels?.[enumValue] || enumValue}
                    </button>
                )
            })}
        </div>
    )
}
