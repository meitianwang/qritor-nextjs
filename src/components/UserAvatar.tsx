/**
 * User avatar component
 * Displays avatar image, or first character if no avatar
 */

interface UserAvatarProps {
    nickname?: string
    avatarUrl?: string
    size?: number
    className?: string
}

function UserAvatar({ nickname, avatarUrl, size = 40, className = '' }: UserAvatarProps) {
    const getInitial = (name?: string): string => {
        if (!name || name.length === 0) return '?'
        const firstChar = name.charAt(0)
        if (/[a-zA-Z]/.test(firstChar)) {
            return firstChar.toUpperCase()
        }
        return firstChar
    }

    const initial = getInitial(nickname)

    if (avatarUrl) {
        return (
            <img
                src={avatarUrl}
                alt={nickname || 'User avatar'}
                className={`user-avatar ${className}`}
                style={{
                    width: size,
                    height: size,
                    objectFit: 'cover',
                    borderRadius: '50%'
                }}
            />
        )
    }

    return (
        <div
            className={`user-avatar ${className}`}
            style={{
                width: size,
                height: size,
                fontSize: size * 0.45
            }}
        >
            {initial}
        </div>
    )
}

export default UserAvatar
