'use client'

/**
 * 布尔字段组件
 */

import React from 'react'
import { useTranslation } from '@/hooks/useTranslation'

interface BooleanFieldProps {
    value: boolean | undefined
    onChange: (value: boolean) => void
    description?: string
}

function BooleanField({ value, onChange, description }: BooleanFieldProps) {
    const { t } = useTranslation('studio')

    return (
        <label className="flex items-center cursor-pointer">
            <input
                type="checkbox"
                checked={value || false}
                onChange={(e) => onChange(e.target.checked)}
                className="w-4 h-4 text-primary border-border rounded focus:ring-2 focus:ring-primary"
            />
            <span className="ml-2 text-sm text-text-secondary">
                {description || (value ? t('jsonSchemaFormRenderer.yes') : t('jsonSchemaFormRenderer.no'))}
            </span>
        </label>
    )
}

export default BooleanField
