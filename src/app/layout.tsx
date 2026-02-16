import type { Metadata } from "next"
import "./globals.css"
import "@/styles/variables.css"
import "@/styles/reset.css"
import "@/styles/animations.css"
import "@/styles/portal.css"
import "@/styles/auth.css"
import "@/styles/docs.css"
import "@/styles/changelog.css"
import "@/styles/referral.css"
import "@/styles/desktop-login-success.css"
import "@/styles/admin.css"
import "@/styles/admin-login.css"
import LayoutShell from "./LayoutShell"

export const metadata: Metadata = {
    title: "Qritor - AI Writing Platform",
    description: "Qritor is an AI-powered writing platform for creative writers. Write novels, scripts, and more with AI assistance.",
    icons: {
        icon: "/favicon.ico",
    },
}

export default function RootLayout({
    children,
}: Readonly<{
    children: React.ReactNode
}>) {
    return (
        <html lang="zh">
            <body>
                <LayoutShell>
                    {children}
                </LayoutShell>
            </body>
        </html>
    )
}
