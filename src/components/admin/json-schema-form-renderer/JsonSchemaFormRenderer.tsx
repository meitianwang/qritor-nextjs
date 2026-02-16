'use client'

/**
 * JSON Schema 表单渲染器
 *
 * 重构后的主组件，将原 499 行代码拆分为：
 * - 7 个子组件（StringField, NumberField, BooleanField, EnumField, ArrayField, ObjectField, CollapsibleField）
 * - 工具常量
 */

import React from 'react'
import { useTranslation } from '@/hooks/useTranslation'

// Components
import {
    StringField,
    NumberField,
    BooleanField,
    SelectField,
    RadioField,
    CheckboxField,
    ArrayField,
    ObjectField,
    CollapsibleField
} from './components'

// Utils
import { commonClasses } from './utils'

// eslint-disable-next-line @typescript-eslint/no-explicit-any
type SchemaProperty = Record<string, any>

interface JsonSchema {
    properties?: Record<string, SchemaProperty>
    required?: string[]
}

interface JsonSchemaFormRendererProps {
    schema: JsonSchema | undefined
    formData?: Record<string, unknown>
    onChange?: (fieldName: string, value: unknown) => void
    collapsible?: boolean
}

const JsonSchemaFormRenderer = ({ schema, formData = {}, onChange, collapsible = false }: JsonSchemaFormRendererProps) => {
    const { t } = useTranslation('studio')

    // 更新表单字段值
    const updateFormData = (fieldName: string, value: unknown) => {
        if (onChange) {
            onChange(fieldName, value)
        }
    }

    // 渲染子字段输入框(用于对象内部的字段)
    const renderSubFieldInput = (
        subFieldName: string,
        subFieldSchema: SchemaProperty,
        parentValue: Record<string, unknown>,
        onSubChange: (value: unknown) => void
    ) => {
        const value = parentValue[subFieldName]

        switch (subFieldSchema.type) {
            case 'string':
                return (
                    <StringField
                        value={value}
                        onChange={onSubChange}
                        placeholder={subFieldSchema.description || `请输入${subFieldName}`}
                        isTextarea={subFieldSchema['x-uiWidget'] === 'textarea'}
                        rows={3}
                    />
                )
            case 'number':
                return (
                    <NumberField
                        value={value as number | string | undefined}
                        onChange={onSubChange}
                        placeholder={subFieldSchema.description || `请输入${subFieldName}`}
                    />
                )
            case 'boolean':
                return (
                    <BooleanField
                        value={value as boolean | undefined}
                        onChange={onSubChange}
                    />
                )
            default:
                return (
                    <StringField
                        value={value}
                        onChange={onSubChange}
                        placeholder={subFieldSchema.description || `请输入${subFieldName}`}
                    />
                )
        }
    }

    // 渲染数组项输入框
    const renderArrayItemInput = (
        itemSchema: SchemaProperty | undefined,
        value: unknown,
        onItemChange: (value: unknown) => void,
        uiWidget?: string
    ) => {
        switch (itemSchema?.type) {
            case 'string':
                return (
                    <StringField
                        value={value}
                        onChange={onItemChange}
                        placeholder={t('jsonSchemaFormRenderer.enterText')}
                        isTextarea={uiWidget === 'textarea'}
                        rows={3}
                    />
                )
            case 'number':
                return (
                    <NumberField
                        value={value as number | string | undefined}
                        onChange={onItemChange}
                        placeholder={t('jsonSchemaFormRenderer.enterNumber')}
                    />
                )
            case 'boolean':
                return (
                    <BooleanField
                        value={value as boolean | undefined}
                        onChange={onItemChange}
                    />
                )
            case 'object': {
                const objectValue = (value || {}) as Record<string, unknown>
                const isModule = itemSchema['x-moduleType'] !== undefined
                const moduleTypeName = itemSchema['x-moduleType'] as string | undefined

                if (itemSchema.properties) {
                    return (
                        <div className="space-y-3 pl-3 border-l-2 border-primary/30">
                            {isModule && moduleTypeName && (
                                <div className="text-xs text-blue-400 font-medium">
                                    {t('jsonSchemaFormRenderer.moduleType')}: {moduleTypeName}
                                </div>
                            )}
                            {Object.entries(itemSchema.properties as Record<string, SchemaProperty>).map(([subFieldName, subFieldSchema]) => (
                                <div key={subFieldName}>
                                    <label className="block text-xs font-medium text-text-primary mb-1">
                                        {subFieldName}
                                        {itemSchema.required?.includes(subFieldName) && <span className="text-red-500 ml-1">*</span>}
                                    </label>
                                    {renderSubFieldInput(subFieldName, subFieldSchema, objectValue, (subValue) => {
                                        onItemChange({ ...objectValue, [subFieldName]: subValue })
                                    })}
                                </div>
                            ))}
                        </div>
                    )
                }

                // 如果没有定义 properties,使用 textarea
                return (
                    <textarea
                        value={typeof objectValue === 'object' ? JSON.stringify(objectValue, null, 2) : (objectValue || '')}
                        onChange={(e) => {
                            try {
                                const parsed = JSON.parse(e.target.value)
                                onItemChange(parsed)
                            } catch {
                                onItemChange(e.target.value)
                            }
                        }}
                        placeholder={t('jsonSchemaFormRenderer.enterObject')}
                        rows={3}
                        className={commonClasses}
                    />
                )
            }
            default:
                return (
                    <StringField
                        value={value}
                        onChange={onItemChange}
                        placeholder={t('jsonSchemaFormRenderer.enterContent')}
                    />
                )
        }
    }

    // 渲染表单字段
    const renderFormField = (fieldName: string, fieldSchema: SchemaProperty, _isRequired = false) => {
        const value = formData[fieldName]

        // 如果有枚举值,根据 uiWidget 类型渲染不同的组件
        if (fieldSchema.enum && fieldSchema.enum.length > 0) {
            const uiWidget = fieldSchema['x-uiWidget'] || 'select'

            switch (uiWidget) {
                case 'select':
                    return (
                        <SelectField
                            value={value as string | undefined}
                            onChange={(v) => updateFormData(fieldName, v)}
                            enumValues={fieldSchema.enum}
                            enumLabels={fieldSchema.enumLabels}
                        />
                    )
                case 'radio':
                    return (
                        <RadioField
                            value={value as string | undefined}
                            onChange={(v) => updateFormData(fieldName, v)}
                            enumValues={fieldSchema.enum}
                            enumLabels={fieldSchema.enumLabels}
                        />
                    )
                case 'checkbox':
                    return (
                        <CheckboxField
                            value={value as string[] | undefined}
                            onChange={(v) => updateFormData(fieldName, v)}
                            enumValues={fieldSchema.enum}
                            enumLabels={fieldSchema.enumLabels}
                        />
                    )
            }
        }

        // 处理数组类型
        if (fieldSchema.type === 'array') {
            return (
                <ArrayField
                    value={value as unknown[] | undefined}
                    onChange={(v) => updateFormData(fieldName, v)}
                    itemSchema={fieldSchema.items}
                    uiWidget={fieldSchema['x-uiWidget']}
                    renderArrayItemInput={renderArrayItemInput}
                />
            )
        }

        // 根据字段类型渲染
        switch (fieldSchema.type) {
            case 'string':
                return (
                    <StringField
                        value={value}
                        onChange={(v) => updateFormData(fieldName, v)}
                        placeholder={fieldSchema.description || `请输入${fieldName}`}
                        isTextarea={fieldSchema['x-uiWidget'] === 'textarea'}
                    />
                )
            case 'number':
                return (
                    <NumberField
                        value={value as number | string | undefined}
                        onChange={(v) => updateFormData(fieldName, v)}
                        placeholder={fieldSchema.description || `请输入${fieldName}`}
                    />
                )
            case 'boolean':
                return (
                    <BooleanField
                        value={value as boolean | undefined}
                        onChange={(v) => updateFormData(fieldName, v)}
                        description={fieldSchema.description || fieldName}
                    />
                )
            case 'object':
                return (
                    <ObjectField
                        value={value as Record<string, unknown> | undefined}
                        onChange={(v) => updateFormData(fieldName, v)}
                        fieldSchema={fieldSchema}
                        renderSubFieldInput={renderSubFieldInput}
                    />
                )
            default:
                return (
                    <StringField
                        value={value}
                        onChange={(v) => updateFormData(fieldName, v)}
                        placeholder={`请输入${fieldName}`}
                    />
                )
        }
    }

    // 如果没有 schema 或 properties
    if (!schema || !schema.properties) {
        return (
            <div className="text-center py-12 text-text-secondary">
                {t('jsonSchemaFormRenderer.noFields')}
            </div>
        )
    }

    // 渲染表单
    return (
        <div className="space-y-4">
            {Object.entries(schema.properties).map(([fieldName, fieldSchema]) => {
                const isRequired = schema.required?.includes(fieldName)
                const isCollapsed = fieldSchema['x-defaultCollapsed'] || false

                const fieldContent = (
                    <>
                        <label className="block text-sm font-medium text-text-primary mb-2">
                            {fieldName}
                            {isRequired && <span className="text-red-500 ml-1">*</span>}
                        </label>
                        {renderFormField(fieldName, fieldSchema, isRequired)}
                    </>
                )

                // 如果支持折叠且字段配置为默认折叠
                if (collapsible && isCollapsed) {
                    return (
                        <CollapsibleField
                            key={fieldName}
                            fieldName={fieldName}
                            isRequired={isRequired}
                            defaultOpen={!isCollapsed}
                        >
                            {renderFormField(fieldName, fieldSchema, isRequired)}
                        </CollapsibleField>
                    )
                }

                // 普通渲染
                return (
                    <div key={fieldName}>
                        {fieldContent}
                    </div>
                )
            })}
        </div>
    )
}

export default JsonSchemaFormRenderer
