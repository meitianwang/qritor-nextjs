'use client'

import { Suspense, useState, useEffect } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import { useAuth } from '@/hooks/useAuth'
import { useTranslation } from '@/hooks/useTranslation'
import { useToast } from '@/hooks/useToast'
import { authFetch } from '@/lib/auth-utils'
import ToastNotification from '@/components/ToastNotification'
import {
    ProfileInfoSection,
    UsageSection,
    BillingSection,
    DeleteAccountModal
} from '@/components/profile'

/**
 * Profile page
 * Contains three sub-modules: personal info, usage details, billing
 */
function ProfilePageContent() {
    const router = useRouter()
    const searchParams = useSearchParams()
    const { getUser, logout, updateUser } = useAuth()
    const user = getUser()
    const { t } = useTranslation('portal')
    const { notification, showToast } = useToast()

    // Get initial tab from URL params
    const initialTab = searchParams.get('tab') || 'profile'
    const validTabs = ['profile', 'usage', 'billing']
    const [activeTab, setActiveTab] = useState(validTabs.includes(initialTab) ? initialTab : 'profile')

    // Delete account modal state
    const [showDeleteModal, setShowDeleteModal] = useState(false)
    const [deleteCode, setDeleteCode] = useState('')
    const [deleteSending, setDeleteSending] = useState(false)
    const [deleteDeleting, setDeleteDeleting] = useState(false)
    const [deleteError, setDeleteError] = useState('')

    // User detailed info (from backend)
    const [userProfile, setUserProfile] = useState<Record<string, unknown> | null>(null)
    const [profileLoading, setProfileLoading] = useState(true)

    // Credits and subscription data
    const [creditsData, setCreditsData] = useState<any>(undefined)
    const [subscriptionData, setSubscriptionData] = useState<any>(undefined)

    // Redirect to login if not logged in
    if (!user) {
        router.push('/login')
        return null
    }

    // Display user info (prefer backend data)
    const displayUser = userProfile || user

    // Fetch user profile from backend
    useEffect(() => {
        const fetchUserProfile = async () => {
            try {
                const response = await authFetch('/api/auth/me')
                const data = await response.json()
                if (data.code === 200) {
                    setUserProfile(data.data)
                }
            } catch (err) {
                console.error('Failed to fetch user profile:', err)
            } finally {
                setProfileLoading(false)
            }
        }

        fetchUserProfile()
    }, [])

    // Fetch credits and subscription data
    useEffect(() => {
        const fetchCreditsAndSubscription = async () => {
            try {
                const creditsRes = await authFetch('/api/credits')
                const creditsJson = await creditsRes.json()
                if (creditsJson.code === 200) {
                    setCreditsData(creditsJson.data)
                }

                const subRes = await authFetch('/api/subscription/current')
                const subJson = await subRes.json()
                if (subJson.code === 200) {
                    setSubscriptionData(subJson.data)
                }
            } catch (err) {
                console.error('Failed to fetch credits/subscription:', err)
            }
        }

        fetchCreditsAndSubscription()
    }, [])

    // Sidebar menu config
    const menuItems = [
        { id: 'profile', icon: 'user', label: t('profile.tabs.profile') },
        { id: 'usage', icon: 'chart', label: t('profile.tabs.usage') },
        { id: 'billing', icon: 'card', label: t('profile.tabs.billing') }
    ]

    // Render sidebar icon
    const renderIcon = (icon: string) => {
        switch (icon) {
            case 'user':
                return (
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                        <circle cx="12" cy="7" r="4"></circle>
                    </svg>
                )
            case 'chart':
                return (
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                        <line x1="18" y1="20" x2="18" y2="10"></line>
                        <line x1="12" y1="20" x2="12" y2="4"></line>
                        <line x1="6" y1="20" x2="6" y2="14"></line>
                    </svg>
                )
            case 'card':
                return (
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                        <rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect>
                        <line x1="1" y1="10" x2="23" y2="10"></line>
                    </svg>
                )
            default:
                return null
        }
    }

    // Open delete account modal and send verification code
    const handleOpenDeleteModal = async () => {
        setShowDeleteModal(true)
        setDeleteCode('')
        setDeleteError('')
        setDeleteSending(true)

        try {
            const response = await authFetch('/api/auth/send-delete-code', {
                method: 'POST'
            })
            const data = await response.json()
            if (data.code !== 200) {
                setDeleteError(data.message || t('profile.errors.sendCodeFailed'))
            }
        } catch (err) {
            setDeleteError(t('common.networkError'))
        } finally {
            setDeleteSending(false)
        }
    }

    // Confirm delete account
    const handleConfirmDelete = async () => {
        if (!deleteCode || deleteCode.length !== 6) {
            setDeleteError(t('profile.errors.codeInvalid'))
            return
        }

        setDeleteDeleting(true)
        setDeleteError('')

        try {
            const response = await authFetch('/api/auth/delete-account', {
                method: 'POST',
                body: { code: deleteCode }
            })
            const data = await response.json()
            if (data.code === 200) {
                logout()
                router.push('/login')
            } else {
                setDeleteError(data.message || t('profile.errors.deleteFailed'))
            }
        } catch (err) {
            setDeleteError(t('common.networkError'))
        } finally {
            setDeleteDeleting(false)
        }
    }

    // Close delete account modal
    const handleCloseDeleteModal = () => {
        setShowDeleteModal(false)
        setDeleteCode('')
        setDeleteError('')
    }

    // Render content based on active tab
    const renderContent = () => {
        switch (activeTab) {
            case 'profile':
                return (
                    <ProfileInfoSection
                        displayUser={displayUser}
                        profileLoading={profileLoading}
                        updateUser={updateUser}
                        setUserProfile={setUserProfile}
                        onOpenDeleteModal={handleOpenDeleteModal}
                    />
                )
            case 'usage':
                return (
                    <UsageSection
                        creditsData={creditsData}
                        subscriptionData={subscriptionData}
                    />
                )
            case 'billing':
                return <BillingSection />
            default:
                return (
                    <ProfileInfoSection
                        displayUser={displayUser}
                        profileLoading={profileLoading}
                        updateUser={updateUser}
                        setUserProfile={setUserProfile}
                        onOpenDeleteModal={handleOpenDeleteModal}
                    />
                )
        }
    }

    return (
        <div className="portal-page">
            <main className="profile-page">
                <div className="container">
                    <div className="profile-layout">
                        {/* Sidebar */}
                        <aside className="profile-sidebar">
                            <nav className="profile-nav">
                                {menuItems.map(item => (
                                    <button
                                        key={item.id}
                                        className={`profile-nav-item ${activeTab === item.id ? 'active' : ''}`}
                                        onClick={() => setActiveTab(item.id)}
                                    >
                                        {renderIcon(item.icon)}
                                        <span>{item.label}</span>
                                    </button>
                                ))}
                            </nav>
                        </aside>

                        {/* Main content area */}
                        <div className="profile-main">
                            {renderContent()}
                        </div>
                    </div>
                </div>
            </main>

            {/* Delete account confirmation modal */}
            {showDeleteModal && (
                <DeleteAccountModal
                    email={(displayUser as Record<string, unknown>)?.email as string}
                    deleteCode={deleteCode}
                    setDeleteCode={setDeleteCode}
                    deleteError={deleteError}
                    deleteSending={deleteSending}
                    deleteDeleting={deleteDeleting}
                    onConfirm={handleConfirmDelete}
                    onClose={handleCloseDeleteModal}
                />
            )}

            {/* Toast notification */}
            <ToastNotification notification={notification} />
        </div>
    )
}

export default function ProfilePage() {
    return (
        <Suspense fallback={<div />}>
            <ProfilePageContent />
        </Suspense>
    )
}
