'use client'

import { authFetch } from '@/lib/auth-utils'

/**
 * Admin-specific fetch wrapper
 * Automatically prepends /api/admin prefix
 */
// eslint-disable-next-line @typescript-eslint/no-explicit-any
export async function adminFetch(endpoint: string, options: Omit<RequestInit, 'body'> & { body?: any } = {}): Promise<Response> {
    const url = endpoint.startsWith('/api/admin')
        ? endpoint
        : `/api/admin${endpoint.startsWith('/') ? endpoint : '/' + endpoint}`
    return authFetch(url, options)
}

/**
 * Format date string to locale string
 */
export function formatDate(dateString: string | null | undefined): string {
    if (!dateString) return '-'
    const date = new Date(dateString)
    return date.toLocaleDateString('zh-CN', {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit'
    })
}

/**
 * Format currency amount
 */
export function formatCurrency(amount: number, currency = 'CNY'): string {
    return new Intl.NumberFormat('zh-CN', {
        style: 'currency',
        currency
    }).format(amount)
}
