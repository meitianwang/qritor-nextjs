'use client'

import dynamic from 'next/dynamic'

/**
 * 创作方法详情页（ReactFlow 工作流画布）
 * 使用 dynamic import + ssr: false，因为 ReactFlow 需要 DOM 环境
 */
const NovelCreationMethodDetailContent = dynamic(
    () => import('@/components/admin/novel-creation-methods/NovelCreationMethodDetailContent'),
    { ssr: false }
)

export default function NovelCreationMethodDetailPage() {
    return <NovelCreationMethodDetailContent />
}
