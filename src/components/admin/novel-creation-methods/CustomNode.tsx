'use client'

import React from 'react'
import { Handle, Position } from 'reactflow'

interface CustomNodeData {
    label: string
    type?: string
    config?: Record<string, unknown>
}

interface CustomNodeProps {
    data: CustomNodeData
    selected: boolean
}

const CustomNode: React.FC<CustomNodeProps> = ({ data, selected }) => {
    return (
        <div
            className={`
                relative px-4 py-3 min-w-[200px] rounded-xl
                transition-all duration-300 ease-out
                ${selected
                    ? 'scale-105 z-10'
                    : 'hover:scale-[1.02]'
                }
            `}
            style={{
                background: selected
                    ? 'linear-gradient(135deg, rgba(13, 148, 136, 0.15) 0%, rgba(20, 184, 166, 0.1) 100%)'
                    : 'linear-gradient(135deg, rgba(26, 26, 26, 0.95) 0%, rgba(17, 17, 17, 0.95) 100%)',
                border: selected
                    ? '2px solid rgba(20, 184, 166, 0.6)'
                    : '1px solid rgba(255, 255, 255, 0.1)',
                boxShadow: selected
                    ? '0 0 30px rgba(13, 148, 136, 0.3), 0 10px 40px rgba(0, 0, 0, 0.4)'
                    : '0 4px 20px rgba(0, 0, 0, 0.3)'
            }}
        >
            {/* 顶部渐变装饰条 */}
            <div
                className="absolute top-0 left-4 right-4 h-[2px] rounded-full"
                style={{
                    background: selected
                        ? 'linear-gradient(90deg, #0D9488 0%, #14B8A6 50%, #06B6D4 100%)'
                        : 'linear-gradient(90deg, rgba(13, 148, 136, 0.3) 0%, rgba(20, 184, 166, 0.2) 50%, rgba(6, 182, 212, 0.1) 100%)'
                }}
            />

            {/* 左侧连接点 */}
            <Handle
                type="target"
                position={Position.Left}
                className="!w-3.5 !h-3.5 !border-2 !border-bg-secondary !-left-1.5"
                style={{
                    background: 'linear-gradient(135deg, #0D9488 0%, #14B8A6 100%)',
                    boxShadow: selected ? '0 0 10px rgba(13, 148, 136, 0.5)' : 'none'
                }}
            />

            {/* 节点内容 */}
            <div className="flex items-start gap-3 pt-2">
                {/* 图标区域 */}
                <div
                    className="flex-shrink-0 w-9 h-9 rounded-lg flex items-center justify-center"
                    style={{
                        background: selected
                            ? 'linear-gradient(135deg, rgba(13, 148, 136, 0.3) 0%, rgba(20, 184, 166, 0.2) 100%)'
                            : 'rgba(255, 255, 255, 0.05)',
                        border: selected
                            ? '1px solid rgba(20, 184, 166, 0.4)'
                            : '1px solid rgba(255, 255, 255, 0.08)'
                    }}
                >
                    <svg
                        className="w-5 h-5"
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                        style={{ color: selected ? '#14B8A6' : 'rgba(255, 255, 255, 0.6)' }}
                    >
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                </div>

                {/* 文本区域 */}
                <div className="flex-1 min-w-0">
                    <div
                        className="font-semibold text-sm truncate"
                        style={{ color: selected ? '#ffffff' : 'rgba(255, 255, 255, 0.9)' }}
                    >
                        {data.label}
                    </div>
                </div>
            </div>

            {/* 右侧连接点 */}
            <Handle
                type="source"
                position={Position.Right}
                className="!w-3.5 !h-3.5 !border-2 !border-bg-secondary !-right-1.5"
                style={{
                    background: 'linear-gradient(135deg, #14B8A6 0%, #06B6D4 100%)',
                    boxShadow: selected ? '0 0 10px rgba(6, 182, 212, 0.5)' : 'none'
                }}
            />

            {/* 选中状态光晕效果 */}
            {selected && (
                <div
                    className="absolute -inset-1 rounded-xl pointer-events-none animate-pulse"
                    style={{
                        background: 'transparent',
                        border: '1px solid rgba(20, 184, 166, 0.2)'
                    }}
                />
            )}
        </div>
    )
}

export default CustomNode
