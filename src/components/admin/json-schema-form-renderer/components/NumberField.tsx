'use client'

/**
 * 数字字段组件
 */

import React from 'react'
import { commonClasses } from '../utils'

interface NumberFieldProps {
    value: number | string | undefined
    onChange: (value: string) => void
    placeholder?: string
}

function NumberField({ value, onChange, placeholder }: NumberFieldProps) {
    return (
        <input
            type="number"
            value={value || ''}
            onChange={(e) => onChange(e.target.value)}
            placeholder={placeholder}
            className={commonClasses}
        />
    )
}

export default NumberField
