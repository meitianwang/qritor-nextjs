'use client'

import React from 'react'
import EnumEditor from './EnumEditor'
import type { SchemaField } from '../../constants'
import type { ModuleType } from '../../utils/schemaGenerator'

interface FieldCardProps {
    field: SchemaField
    index: number
    fieldsLength: number
    allModuleTypes: ModuleType[]
    onUpdateField: (id: string, key: string, value: unknown) => void
    onRemoveField: (id: string) => void
    onMoveFieldUp: (index: number) => void
    onMoveFieldDown: (index: number) => void
}

/**
 * 字段卡片组件
 * 单个字段的编辑卡片，包含字段名、类型、描述等输入控件
 */
const FieldCard: React.FC<FieldCardProps> = ({
    field,
    index,
    fieldsLength,
    allModuleTypes,
    onUpdateField,
    onRemoveField,
    onMoveFieldUp,
    onMoveFieldDown
}) => {
    return (
        <div className="p-4 border border-border rounded-lg bg-bg-secondary">
            <div className="flex items-start justify-between mb-3">
                <div className="flex items-center gap-2">
                    <h3 className="text-lg font-semibold text-text-primary">
                        字段 {index + 1}
                    </h3>
                    {/* 顺序调节按钮 */}
                    <div className="flex gap-1">
                        <button
                            onClick={() => onMoveFieldUp(index)}
                            disabled={index === 0}
                            className="p-1 text-text-secondary hover:text-primary disabled:opacity-30 disabled:cursor-not-allowed transition-colors"
                            title="上移"
                        >
                            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 15l7-7 7 7" />
                            </svg>
                        </button>
                        <button
                            onClick={() => onMoveFieldDown(index)}
                            disabled={index === fieldsLength - 1}
                            className="p-1 text-text-secondary hover:text-primary disabled:opacity-30 disabled:cursor-not-allowed transition-colors"
                            title="下移"
                        >
                            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                            </svg>
                        </button>
                    </div>
                </div>
                <button
                    onClick={() => onRemoveField(field.id)}
                    disabled={field.locked}
                    className={`p-2 rounded-lg transition-colors ${field.locked
                        ? 'text-gray-300 text-gray-600 cursor-not-allowed'
                        : 'text-red-500 hover:bg-red-50 hover:bg-red-500/10'
                        }`}
                    title={field.locked ? '字段已锁定' : '删除字段'}
                >
                    {field.locked ? (
                        <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                        </svg>
                    ) : (
                        <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                        </svg>
                    )}
                </button>
            </div>

            <div className="grid grid-cols-2 gap-4">
                {/* 字段名称 */}
                <div>
                    <label className="block text-sm font-medium text-text-secondary mb-1">
                        字段名称 *
                    </label>
                    <input
                        type="text"
                        value={field.name}
                        onChange={(e) => onUpdateField(field.id, 'name', e.target.value)}
                        placeholder="field_name"
                        className="admin-form-input"
                    />
                </div>

                {/* 字段类型 */}
                <div>
                    <label className="block text-sm font-medium text-text-secondary mb-1">
                        {field.isArray ? '数组元素类型' : '字段类型'}
                    </label>
                    <select
                        value={field.type}
                        onChange={(e) => onUpdateField(field.id, 'type', e.target.value)}
                        className="admin-form-select"
                    >
                        <option value="string">字符串</option>
                        <option value="number">数字</option>
                        <option value="boolean">布尔值</option>
                        <option value="object">对象</option>
                        <option value="module">模块类型</option>
                    </select>
                </div>

                {/* 当选择模块类型时，显示模块类型选择器 */}
                {field.type === 'module' && (
                    <div>
                        <label className="block text-sm font-medium text-text-secondary mb-1">
                            模块类型名称
                        </label>
                        <select
                            value={field.moduleTypeRef || ''}
                            onChange={(e) => onUpdateField(field.id, 'moduleTypeRef', e.target.value)}
                            className="admin-form-select"
                        >
                            <option value="">选择模块类型</option>
                            {allModuleTypes.map(mt => (
                                <option key={mt.id} value={mt.name}>{mt.name}</option>
                            ))}
                        </select>
                    </div>
                )}

                {/* 描述 */}
                <div>
                    <label className="block text-sm font-medium text-text-secondary mb-1">
                        描述
                    </label>
                    <input
                        type="text"
                        value={field.description}
                        onChange={(e) => onUpdateField(field.id, 'description', e.target.value)}
                        placeholder="字段描述"
                        className="admin-form-input"
                    />
                </div>

                {/* UI 组件类型 */}
                <div>
                    <label className="block text-sm font-medium text-text-secondary mb-1">
                        UI 组件
                    </label>
                    <select
                        value={field.uiWidget}
                        onChange={(e) => onUpdateField(field.id, 'uiWidget', e.target.value)}
                        className="admin-form-select"
                    >
                        <option value="input">输入框</option>
                        <option value="select">下拉选择</option>
                        <option value="radio">单选框</option>
                        <option value="checkbox">多选框</option>
                        <option value="textarea">文本域</option>
                    </select>
                </div>

                {/* 当选择 textarea 时，显示行数配置 */}
                {field.uiWidget === 'textarea' && (
                    <div>
                        <label className="block text-sm font-medium text-text-secondary mb-1">
                            显示行数
                        </label>
                        <input
                            type="number"
                            min="2"
                            max="30"
                            value={field.rows || 8}
                            onChange={(e) => onUpdateField(field.id, 'rows', parseInt(e.target.value) || 8)}
                            placeholder="8"
                            className="admin-form-input"
                        />
                    </div>
                )}

                {/* 勾选项 */}
                <div className="col-span-2 flex items-center gap-6 flex-wrap">
                    <label className="flex items-center cursor-pointer">
                        <input
                            type="checkbox"
                            checked={field.required}
                            onChange={(e) => onUpdateField(field.id, 'required', e.target.checked)}
                            className="w-4 h-4 text-primary border-border rounded focus:ring-2 focus:ring-primary"
                        />
                        <span className="ml-2 text-sm text-text-secondary whitespace-nowrap">
                            必填
                        </span>
                    </label>
                    <label className="flex items-center cursor-pointer">
                        <input
                            type="checkbox"
                            checked={field.isArray}
                            onChange={(e) => onUpdateField(field.id, 'isArray', e.target.checked)}
                            className="w-4 h-4 text-primary border-border rounded focus:ring-2 focus:ring-primary"
                        />
                        <span className="ml-2 text-sm text-text-secondary whitespace-nowrap">
                            数组
                        </span>
                    </label>

                    <label className="flex items-center cursor-pointer">
                        <input
                            type="checkbox"
                            checked={field.defaultCollapsed}
                            onChange={(e) => onUpdateField(field.id, 'defaultCollapsed', e.target.checked)}
                            className="w-4 h-4 text-primary border-border rounded focus:ring-2 focus:ring-primary"
                        />
                        <span className="ml-2 text-sm text-text-secondary whitespace-nowrap">
                            默认折叠
                        </span>
                    </label>
                </div>

                {/* 当选择了 select/radio/checkbox 时，显示枚举选项编辑 */}
                {['select', 'radio', 'checkbox'].includes(field.uiWidget) && (
                    <EnumEditor field={field} onUpdateField={onUpdateField} />
                )}
            </div>
        </div>
    )
}

export default FieldCard
