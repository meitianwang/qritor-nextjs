'use client'

/**
 * 可折叠字段包装器组件
 */

import React from 'react'

interface CollapsibleFieldProps {
    fieldName: string
    isRequired?: boolean
    defaultOpen?: boolean
    children: React.ReactNode
}

function CollapsibleField({ fieldName, isRequired, defaultOpen = false, children }: CollapsibleFieldProps) {
    return (
        <details
            className="group border border-border rounded-lg bg-bg-secondary overflow-hidden"
            open={defaultOpen}
        >
            <summary className="flex items-center justify-between p-3 cursor-pointer bg-bg-tertiary hover:bg-gray-100 dark:hover:bg-dark-bg-active transition-colors list-none select-none">
                <div className="flex items-center gap-2">
                    <span className="font-medium text-text-primary">
                        {fieldName}
                        {isRequired && <span className="text-red-500 ml-1">*</span>}
                    </span>
                </div>
                <div className="text-text-secondary transition-transform duration-200 group-open:rotate-180">
                    <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                    </svg>
                </div>
            </summary>
            <div className="p-4 border-t border-border">
                {children}
            </div>
        </details>
    )
}

export default CollapsibleField
