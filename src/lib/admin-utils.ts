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
