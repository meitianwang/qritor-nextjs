'use client'

/**
 * Date and data formatting utility functions
 */

/**
 * Format expiration time (show year-month-day)
 * @param dateStr - ISO date string
 * @returns Formatted string
 */
export function formatExpireTime(dateStr: string | null | undefined): string {
    if (!dateStr) return '永久有效'
    const date = new Date(dateStr)
    const now = new Date()
    const diffDays = Math.ceil((date.getTime() - now.getTime()) / (1000 * 60 * 60 * 24))
    if (diffDays <= 0) return '已过期'
    return `${date.getFullYear()}年${date.getMonth() + 1}月${date.getDate()}日过期`
}

/**
 * Format time (show year-month-day hour:minute)
 * @param dateStr - ISO date string
 * @returns Formatted string
 */
export function formatTime(dateStr: string | null | undefined): string {
    if (!dateStr) return '-'
    const date = new Date(dateStr)
    return `${date.getFullYear()}年${date.getMonth() + 1}月${date.getDate()}日 ${date.getHours()}:${String(date.getMinutes()).padStart(2, '0')}`
}

/**
 * Format credit item expiration time
 * @param dateStr - ISO date string
 * @returns Formatted string
 */
export function formatItemExpire(dateStr: string | null | undefined): string {
    if (!dateStr) return '永久有效'
    const date = new Date(dateStr)
    return `${date.getFullYear()}年${date.getMonth() + 1}月${date.getDate()}日过期`
}

/**
 * Calculate usage percentage
 * @param used - Amount used
 * @param total - Total amount
 * @returns Percentage (0-100)
 */
export function calcPercent(used: number, total: number): number {
    if (total <= 0) return 0
    return Math.min(100, Math.round((used / total) * 100))
}

/**
 * Format credit source display
 * @param source - Source identifier
 * @returns Display text
 */
export function formatSource(source: string): string {
    const sourceMap: Record<string, string> = {
        'REFERRAL': '邀请奖励',
        'SUBSCRIPTION': '订阅赠送',
        'BOOST_PACK': '加油包',
        'AI_GENERATE': 'AI 生成'
    }
    return sourceMap[source] || source
}

/**
 * Format credit type display
 * @param type - Type identifier
 * @returns Display text
 */
export function formatType(type: string): string {
    const typeMap: Record<string, string> = {
        'EARN': '获得',
        'CONSUME': '消费',
        'REFUND': '退还'
    }
    return typeMap[type] || type
}
