'use client'

/**
 * 状态占位组件
 *
 * 用于显示空状态、加载状态、错误状态
 */

import React from 'react'
import { useTranslation } from '@/hooks/useTranslation'

/**
 * 空状态组件
 */
export function EmptyState() {
    const { t } = useTranslation('studio')

    return (
        <div className="flex flex-col items-center justify-center py-20">
            <svg className="w-16 h-16 text-text-muted mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
            </svg>
            <p className="text-text-secondary">{t('moduleContentForm.noModuleSelected')}</p>
        </div>
    )
}

/**
 * 加载状态组件
 */
export function LoadingState() {
    const { t } = useTranslation('studio')

    return (
        <div className="flex flex-col items-center justify-center py-20">
            <svg className="animate-spin h-8 w-8 text-primary mb-4" fill="none" viewBox="0 0 24 24">
                <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
            </svg>
            <p className="text-text-secondary">{t('moduleContentForm.loading')}</p>
        </div>
    )
}

interface ErrorStateProps {
    error: string
    onRetry: () => void
}

/**
 * 错误状态组件
 */
export function ErrorState({ error, onRetry }: ErrorStateProps) {
    const { t } = useTranslation('studio')

    return (
        <div className="flex flex-col items-center justify-center py-20">
            <svg className="w-16 h-16 text-red-500 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.732 16.5c-.77.833.192 2.5 1.732 2.5z" />
            </svg>
            <p className="text-red-500 mb-4">{error}</p>
            <button
                onClick={onRetry}
                className="px-4 py-2 bg-primary text-white rounded-lg hover:bg-primary-hover transition-colors"
            >
                {t('common.retry')}
            </button>
        </div>
    )
}

/**
 * 无表单结构状态组件
 */
export function NoSchemaState() {
    const { t } = useTranslation('studio')

    return (
        <div className="flex flex-col items-center justify-center py-20">
            <svg className="w-16 h-16 text-text-muted mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
            </svg>
            <p className="text-text-secondary">{t('moduleContentForm.noFormStructure')}</p>
        </div>
    )
}

/**
 * JSON Schema 解析错误状态组件
 */
export function SchemaErrorState() {
    const { t } = useTranslation('studio')

    return (
        <div className="flex flex-col items-center justify-center py-20">
            <svg className="w-16 h-16 text-red-500 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.732 16.5c-.77.833.192 2.5 1.732 2.5z" />
            </svg>
            <p className="text-red-500">{t('moduleContentForm.jsonSchemaError')}</p>
        </div>
    )
}
