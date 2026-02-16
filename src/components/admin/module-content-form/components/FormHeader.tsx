'use client'

/**
 * 表单头部组件
 */

import React from 'react'
import { useTranslation } from '@/hooks/useTranslation'

interface FormHeaderProps {
    title: string
    saving: boolean
    onSave: () => void
}

function FormHeader({ title, saving, onSave }: FormHeaderProps) {
    const { t } = useTranslation('studio')

    return (
        <div className="flex items-center justify-between mb-6 pb-4 border-b border-border">
            <div>
                <h2 className="text-xl font-bold text-text-primary">
                    {title}
                </h2>
            </div>
            <button
                onClick={onSave}
                disabled={saving}
                className="px-6 py-2 bg-primary text-white rounded-lg hover:bg-primary-hover transition-colors disabled:opacity-50 flex items-center gap-2"
            >
                {saving && (
                    <svg className="animate-spin h-4 w-4" fill="none" viewBox="0 0 24 24">
                        <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                        <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                )}
                {t('common.save')}
            </button>
        </div>
    )
}

export default FormHeader
