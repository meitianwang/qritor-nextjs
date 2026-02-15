/**
 * Social media configuration
 * Centralized management of all social media links
 */

export interface SocialLink {
    key: string
    icon: string
    url: string
    enabled: boolean
}

export const SOCIAL_LINKS: SocialLink[] = [
    {
        key: 'discord',
        icon: 'Discord',
        url: 'https://discord.gg/V2hNwCZT3J',
        enabled: true
    },
    {
        key: 'reddit',
        icon: 'Reddit',
        url: 'https://www.reddit.com/u/Qritor',
        enabled: true
    },
    {
        key: 'x',
        icon: 'X',
        url: 'https://x.com/Qritor',
        enabled: true
    },
    {
        key: 'youtube',
        icon: 'YouTube',
        url: 'https://www.youtube.com/@Qritor',
        enabled: true
    },
    {
        key: 'douyin',
        icon: 'Douyin',
        url: 'https://v.douyin.com/_HZRGSbarMc/',
        enabled: true
    },
    {
        key: 'tiktok',
        icon: 'TikTok',
        url: 'https://www.tiktok.com/@.qritor',
        enabled: true
    },
    {
        key: 'xiaohongshu',
        icon: 'Xiaohongshu',
        url: 'https://xhslink.com/m/7StwwqITQEH',
        enabled: true
    }
]

export function getEnabledSocialLinks(): SocialLink[] {
    return SOCIAL_LINKS.filter(link => link.enabled)
}

export function getSocialLinksByRegion(_region: string = 'global'): SocialLink[] {
    return getEnabledSocialLinks()
}
