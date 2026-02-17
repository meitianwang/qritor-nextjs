'use client'

/**
 * 统一的状态标签组件
 * 用于显示流程状态、错误提示等
 */

interface StatusBadgeProps {
    type: 'success' | 'warning' | 'error' | 'info'
    label: string
    icon?: boolean
    size?: 'sm' | 'md' | 'lg'
    className?: string
}

export function StatusBadge({
    type,
    label,
    icon = true,
    size = 'md',
    className = ''
}: StatusBadgeProps) {
    const baseStyles = 'inline-flex items-center gap-2 font-medium rounded-full transition-colors'

    const sizeStyles = {
        sm: 'px-2 py-1 text-xs',
        md: 'px-3 py-1.5 text-sm',
        lg: 'px-4 py-2 text-base'
    }

    const typeStyles = {
        success: 'bg-teal-100/80 text-teal-700 border border-teal-200',
        warning: 'bg-amber-100/80 text-amber-700 border border-amber-200',
        error: 'bg-red-100/80 text-red-700 border border-red-200',
        info: 'bg-blue-100/80 text-blue-700 border border-blue-200'
    }

    const iconMap = {
        success: (
            <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
            </svg>
        ),
        warning: (
            <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                <path fillRule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
            </svg>
        ),
        error: (
            <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clipRule="evenodd" />
            </svg>
        ),
        info: (
            <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clipRule="evenodd" />
            </svg>
        )
    }

    return (
        <div className={`${baseStyles} ${sizeStyles[size]} ${typeStyles[type]} ${className}`}>
            {icon && iconMap[type]}
            <span>{label}</span>
        </div>
    )
}

/**
 * 简约状态标签（无边框）
 */
export function SimpleStatusBadge({
    type,
    label,
    className = ''
}: Omit<StatusBadgeProps, 'icon'>) {
    const typeStyles = {
        success: 'bg-teal-100 text-teal-700',
        warning: 'bg-amber-100 text-amber-700',
        error: 'bg-red-100 text-red-700',
        info: 'bg-blue-100 text-blue-700'
    }

    return (
        <span className={`inline-block px-3 py-1 text-sm font-medium rounded-full ${typeStyles[type]} ${className}`}>
            {label}
        </span>
    )
}

/**
 * 带左边框的状态卡片
 */
export function CardStatusBadge({
    type,
    label,
    className = ''
}: Omit<StatusBadgeProps, 'icon'>) {
    const typeStyles = {
        success: 'bg-teal-50 border-l-4 border-teal-500 text-teal-700',
        warning: 'bg-amber-50 border-l-4 border-amber-500 text-amber-700',
        error: 'bg-red-50 border-l-4 border-red-500 text-red-700',
        info: 'bg-blue-50 border-l-4 border-blue-500 text-blue-700'
    }

    return (
        <div className={`inline-flex items-center px-4 py-2 text-sm font-medium rounded-r-lg ${typeStyles[type]} ${className}`}>
            {label}
        </div>
    )
}
