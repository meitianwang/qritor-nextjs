'use client'

import React from 'react'
import EnumEditor from './EnumEditor'
import { useTranslation } from '@/hooks/useTranslation'
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
    const { t } = useTranslation('studio')

    return (
        <div className="p-4 border border-border rounded-lg bg-bg-secondary">
            <div className="flex items-start justify-between mb-3">
                <div className="flex items-center gap-2">
                    <h3 className="text-lg font-semibold text-text-primary">
                        {t('jsonSchemaEditor.field')} {index + 1}
                    </h3>
                    {/* 顺序调节按钮 */}
                    <div className="flex gap-1">
                        <button
                            onClick={() => onMoveFieldUp(index)}
                            disabled={index === 0}
                            className="p-1 text-text-secondary hover:text-primary disabled:opacity-30 disabled:cursor-not-allowed transition-colors"
                            title={t('common.moveUp')}
                        >
                            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 15l7-7 7 7" />
                            </svg>
                        </button>
                        <button
                            onClick={() => onMoveFieldDown(index)}
                            disabled={index === fieldsLength - 1}
                            className="p-1 text-text-secondary hover:text-primary disabled:opacity-30 disabled:cursor-not-allowed transition-colors"
                            title={t('common.moveDown')}
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
                    title={field.locked ? t('jsonSchemaEditor.fieldLocked') : t('jsonSchemaEditor.deleteField')}
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
                        {t('jsonSchemaEditor.fieldName')} *
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
                        {field.isArray ? t('jsonSchemaEditor.arrayElementType') : t('jsonSchemaEditor.fieldType')}
                    </label>
                    <select
                        value={field.type}
                        onChange={(e) => onUpdateField(field.id, 'type', e.target.value)}
                        className="admin-form-select"
                    >
                        <option value="string">{t('jsonSchemaEditor.stringType')}</option>
                        <option value="number">{t('jsonSchemaEditor.numberType')}</option>
                        <option value="boolean">{t('jsonSchemaEditor.booleanType')}</option>
                        <option value="object">{t('jsonSchemaEditor.objectType')}</option>
                        <option value="module">{t('jsonSchemaEditor.moduleType')}</option>
                    </select>
                </div>

                {/* 当选择模块类型时，显示模块类型选择器 */}
                {field.type === 'module' && (
                    <div>
                        <label className="block text-sm font-medium text-text-secondary mb-1">
                            {t('jsonSchemaEditor.moduleTypeName')}
                        </label>
                        <select
                            value={field.moduleTypeRef || ''}
                            onChange={(e) => onUpdateField(field.id, 'moduleTypeRef', e.target.value)}
                            className="admin-form-select"
                        >
                            <option value="">{t('jsonSchemaEditor.selectModuleType')}</option>
                            {allModuleTypes.map(mt => (
                                <option key={mt.id} value={mt.name}>{mt.name}</option>
                            ))}
                        </select>
                    </div>
                )}

                {/* 描述 */}
                <div>
                    <label className="block text-sm font-medium text-text-secondary mb-1">
                        {t('jsonSchemaEditor.description')}
                    </label>
                    <input
                        type="text"
                        value={field.description}
                        onChange={(e) => onUpdateField(field.id, 'description', e.target.value)}
                        placeholder={t('jsonSchemaEditor.fieldDesc')}
                        className="admin-form-input"
                    />
                </div>

                {/* UI 组件类型 */}
                <div>
                    <label className="block text-sm font-medium text-text-secondary mb-1">
                        {t('jsonSchemaEditor.uiWidget')}
                    </label>
                    <select
                        value={field.uiWidget}
                        onChange={(e) => onUpdateField(field.id, 'uiWidget', e.target.value)}
                        className="admin-form-select"
                    >
                        <option value="input">{t('jsonSchemaEditor.inputWidget')}</option>
                        <option value="select">{t('jsonSchemaEditor.selectWidget')}</option>
                        <option value="radio">{t('jsonSchemaEditor.radioWidget')}</option>
                        <option value="checkbox">{t('jsonSchemaEditor.checkboxWidget')}</option>
                        <option value="textarea">{t('jsonSchemaEditor.textareaWidget')}</option>
                    </select>
                </div>

                {/* 当选择 textarea 时，显示行数配置 */}
                {field.uiWidget === 'textarea' && (
                    <div>
                        <label className="block text-sm font-medium text-text-secondary mb-1">
                            {t('jsonSchemaEditor.textareaRows', '显示行数')}
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
                            {t('jsonSchemaEditor.required')}
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
                            {t('jsonSchemaEditor.array')}
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
                            {t('jsonSchemaEditor.defaultCollapsed')}
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
