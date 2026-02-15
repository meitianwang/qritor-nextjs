'use client'

import { useState, useEffect, useRef } from 'react'
import { useTranslation } from '@/hooks/useTranslation'
import { useToast } from '@/hooks/useToast'
import { authFetch } from '@/lib/auth-utils'
import UserAvatar from '@/components/UserAvatar'
import ToastNotification from '@/components/ToastNotification'

interface UserProfile {
    nickname?: string
    email?: string
    avatar?: string
    [key: string]: unknown
}

interface ProfileInfoSectionProps {
    displayUser: UserProfile
    profileLoading: boolean
    updateUser: (data: Record<string, unknown>) => void
    setUserProfile: (data: UserProfile) => void
    onOpenDeleteModal: () => void
}

/**
 * Profile info section component
 */
function ProfileInfoSection({
    displayUser,
    profileLoading,
    updateUser,
    setUserProfile,
    onOpenDeleteModal
}: ProfileInfoSectionProps) {
    const { t } = useTranslation('portal')
    const { notification, showToast } = useToast()

    // Avatar upload state
    const [avatarHovered, setAvatarHovered] = useState(false)
    const [avatarUploading, setAvatarUploading] = useState(false)
    const avatarInputRef = useRef<HTMLInputElement>(null)

    // Nickname edit state
    const [editNickname, setEditNickname] = useState('')
    const [nicknameSaving, setNicknameSaving] = useState(false)
    const [nicknameError, setNicknameError] = useState('')
    const [nicknameFocused, setNicknameFocused] = useState(false)

    // Advanced settings expand state
    const [showAdvanced, setShowAdvanced] = useState(false)

    // Notification settings
    const [notifyUpdates, setNotifyUpdates] = useState(true)
    const [notifyLoading, setNotifyLoading] = useState(false)

    // Initialize nickname value
    useEffect(() => {
        if (displayUser?.nickname) {
            setEditNickname(displayUser.nickname)
        }
    }, [displayUser?.nickname])

    // Load user notification settings
    useEffect(() => {
        const loadSettings = async () => {
            try {
                const response = await authFetch('/api/user/settings')
                const data = await response.json()
                if (data.code === 200 && data.data) {
                    setNotifyUpdates(data.data.notifyUpdates ?? true)
                }
            } catch (err) {
                console.error('Failed to load settings:', err)
            }
        }
        loadSettings()
    }, [])

    // Click avatar to trigger file selection
    const handleAvatarClick = () => {
        if (!avatarUploading && avatarInputRef.current) {
            avatarInputRef.current.click()
        }
    }

    // Handle avatar file selection
    const handleAvatarChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0]
        if (!file) return

        setAvatarUploading(true)
        try {
            const formData = new FormData()
            formData.append('file', file)

            const response = await authFetch('/api/auth/upload-avatar', {
                method: 'POST',
                body: formData
            })
            const data = await response.json()
            if (data.code === 200) {
                setUserProfile(data.data)
                updateUser({ avatar: data.data.avatar })
            } else {
                showToast('error', data.message || t('profile.errors.avatarUploadFailed'))
            }
        } catch (err) {
            console.error('Avatar upload failed:', err)
            showToast('error', t('profile.errors.avatarUploadFailed'))
        } finally {
            setAvatarUploading(false)
            if (avatarInputRef.current) {
                avatarInputRef.current.value = ''
            }
        }
    }

    // Handle input focus
    const handleNicknameFocus = () => {
        setNicknameFocused(true)
        setNicknameError('')
    }

    // Handle input blur
    const handleNicknameBlur = () => {
        setTimeout(() => {
            if (!nicknameSaving) {
                setNicknameFocused(false)
                if (editNickname !== displayUser?.nickname) {
                    setEditNickname(displayUser?.nickname || '')
                }
            }
        }, 200)
    }

    // Save nickname
    const handleSaveNickname = async () => {
        if (!editNickname || editNickname.length < 2 || editNickname.length > 20) {
            setNicknameError(t('profile.errors.nicknameLengthInvalid'))
            return
        }

        if (editNickname === displayUser?.nickname) {
            setNicknameFocused(false)
            return
        }

        setNicknameSaving(true)
        setNicknameError('')

        try {
            const response = await authFetch('/api/auth/update-nickname', {
                method: 'POST',
                body: editNickname
            })
            const data = await response.json()
            if (data.code === 200) {
                setUserProfile(data.data)
                setNicknameFocused(false)
                updateUser({ nickname: data.data.nickname })
            } else {
                setNicknameError(data.message || t('profile.errors.saveFailed'))
            }
        } catch (err) {
            setNicknameError(t('common.networkError'))
        } finally {
            setNicknameSaving(false)
        }
    }

    return (
        <div className="profile-content">
            <h2 className="profile-section-title">{t('profile.title')}</h2>

            {profileLoading ? (
                <div className="profile-card">
                    <div className="profile-loading">{t('common.loading')}</div>
                </div>
            ) : (
                <div className="profile-card">
                    {/* Avatar */}
                    <div className="profile-field">
                        <span className="profile-field-label">{t('profile.avatar')}</span>
                        <div className="profile-field-value">
                            <div
                                className="profile-avatar-wrapper"
                                onMouseEnter={() => setAvatarHovered(true)}
                                onMouseLeave={() => setAvatarHovered(false)}
                                onClick={handleAvatarClick}
                            >
                                {displayUser.avatar ? (
                                    <img
                                        src={displayUser.avatar}
                                        alt="Avatar"
                                        className="profile-avatar-image"
                                    />
                                ) : (
                                    <UserAvatar
                                        nickname={displayUser.nickname}
                                        size={48}
                                    />
                                )}
                                {avatarHovered && (
                                    <div className="profile-avatar-overlay">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                            <path d="M11 4H4a2 2 0 00-2 2v14a2 2 0 002 2h14a2 2 0 002-2v-7" />
                                            <path d="M18.5 2.5a2.121 2.121 0 013 3L12 15l-4 1 1-4 9.5-9.5z" />
                                        </svg>
                                    </div>
                                )}
                                {avatarUploading && (
                                    <div className="profile-avatar-overlay">
                                        <span className="avatar-loading">...</span>
                                    </div>
                                )}
                            </div>
                            <input
                                ref={avatarInputRef}
                                type="file"
                                accept="image/jpeg,image/png,image/gif,image/webp"
                                style={{ display: 'none' }}
                                onChange={handleAvatarChange}
                            />
                        </div>
                    </div>

                    {/* Nickname */}
                    <div className="profile-field">
                        <span className="profile-field-label">{t('profile.name')}</span>
                        <div className="profile-field-value profile-field-editable">
                            <input
                                type="text"
                                className={`profile-nickname-input ${nicknameFocused ? 'focused' : ''} ${nicknameError ? 'input-error' : ''}`}
                                value={editNickname}
                                onChange={(e) => setEditNickname(e.target.value)}
                                onFocus={handleNicknameFocus}
                                onBlur={handleNicknameBlur}
                                placeholder={t('profile.enterNickname')}
                                maxLength={20}
                            />
                            {nicknameFocused && (
                                <button
                                    className="btn btn-gradient btn-sm"
                                    onClick={handleSaveNickname}
                                    disabled={nicknameSaving}
                                >
                                    {nicknameSaving ? t('common.loading') : t('common.save')}
                                </button>
                            )}
                        </div>
                        {nicknameError && <div className="field-error">{nicknameError}</div>}
                    </div>

                    {/* Email */}
                    <div className="profile-field">
                        <span className="profile-field-label">{t('profile.email')}</span>
                        <span className="profile-field-value">{displayUser.email || '-'}</span>
                    </div>
                </div>
            )}

            {/* Advanced settings */}
            <div className="profile-advanced-header" onClick={() => setShowAdvanced(!showAdvanced)}>
                <h2 className="profile-section-title">{t('profile.advancedSettings')}</h2>
                <svg
                    width="16"
                    height="16"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    strokeWidth="2"
                    style={{ transform: showAdvanced ? 'rotate(180deg)' : 'rotate(0deg)', transition: 'transform 0.2s' }}
                >
                    <polyline points="6 9 12 15 18 9"></polyline>
                </svg>
            </div>

            {showAdvanced && (
                <div className="profile-advanced-content">
                    <div className="profile-card">
                        <h3 className="profile-card-title">{t('profile.notifications')}</h3>
                        <div className="profile-field profile-field-toggle">
                            <div className="profile-field-info">
                                <span className="profile-field-label">{t('profile.updatesAndTips')}</span>
                                <span className="profile-field-desc">{t('profile.updatesAndTipsDesc')}</span>
                            </div>
                            <label className="profile-toggle">
                                <input
                                    type="checkbox"
                                    checked={notifyUpdates}
                                    disabled={notifyLoading}
                                    onChange={async (e) => {
                                        const newValue = e.target.checked
                                        setNotifyUpdates(newValue)
                                        setNotifyLoading(true)
                                        try {
                                            const response = await authFetch('/api/user/settings', {
                                                method: 'PUT',
                                                headers: { 'Content-Type': 'application/json' },
                                                body: JSON.stringify({ notify_updates: newValue })
                                            })
                                            const data = await response.json()
                                            if (data.code === 200) {
                                                if (newValue) {
                                                    showToast('success', t('profile.subscribedUpdates'))
                                                } else {
                                                    showToast('success', t('profile.unsubscribedUpdates'))
                                                }
                                            } else {
                                                setNotifyUpdates(!newValue)
                                                showToast('error', data.message || t('profile.errors.saveFailed'))
                                            }
                                        } catch (err) {
                                            setNotifyUpdates(!newValue)
                                            showToast('error', t('common.networkError'))
                                        } finally {
                                            setNotifyLoading(false)
                                        }
                                    }}
                                />
                                <span className="profile-toggle-slider"></span>
                            </label>
                        </div>
                    </div>

                    <div className="profile-card profile-card-danger">
                        <h3 className="profile-card-title">{t('profile.dangerZone')}</h3>
                        <div className="profile-field">
                            <div className="profile-field-info">
                                <span className="profile-field-label">{t('profile.deleteAccount')}</span>
                                <span className="profile-field-desc">{t('profile.deleteAccountDesc')}</span>
                            </div>
                            <button className="btn btn-danger btn-sm" onClick={onOpenDeleteModal}>
                                {t('profile.deleteAccount')}
                            </button>
                        </div>
                    </div>
                </div>
            )}

            {/* Toast notification */}
            <ToastNotification notification={notification} />
        </div>
    )
}

export default ProfileInfoSection
