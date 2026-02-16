'use client'

/**
 * 字符串字段组件
 */

import React from 'react'
import { commonClasses } from '../utils'

interface StringFieldProps {
    value: unknown
    onChange: (value: string | Record<string, unknown>) => void
    placeholder?: string
    isTextarea?: boolean
    rows?: number
}

function StringField({ value, onChange, placeholder, isTextarea = false, rows = 4 }: StringFieldProps) {
    // 如果 value 是对象，序列化为 JSON 字符串
    const displayValue = (() => {
        if (value === null || value === undefined) return ''
        if (typeof value === 'object') {
            try {
                return JSON.stringify(value, null, 2)
            } catch {
                return String(value)
            }
        }
        return value as string
    })()

    const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
        const newValue = e.target.value
        // 尝试解析为 JSON，如果失败则保持字符串
        try {
            const parsed = JSON.parse(newValue)
            onChange(parsed)
        } catch {
            onChange(newValue)
        }
    }

    if (isTextarea) {
        return (
            <textarea
                value={displayValue}
                onChange={handleChange}
                placeholder={placeholder}
                rows={rows}
                className={commonClasses}
            />
        )
    }

    return (
        <input
            type="text"
            value={displayValue}
            onChange={handleChange}
            placeholder={placeholder}
            className={commonClasses}
        />
    )
}

export default StringField
