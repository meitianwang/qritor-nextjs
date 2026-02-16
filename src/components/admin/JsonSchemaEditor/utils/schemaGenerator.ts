/**
 * JSON Schema 生成工具
 * 将内部字段结构转换为 JSON Schema
 */

import type { SchemaField } from '../constants'

export interface ModuleType {
    id: string
    name: string
    jsonSchema?: string
    [key: string]: unknown
}

/**
 * 递归生成单个字段的 Schema
 */
export function generateFieldSchema(field: SchemaField, allModuleTypes: ModuleType[] = []): Record<string, unknown> {
    let property: Record<string, unknown>

    if (field.isArray) {
        // 数组类型
        if (field.type === 'module') {
            // 数组元素是模块
            const items: Record<string, unknown> = {
                type: 'object',
                'x-moduleType': field.moduleTypeRef
            }

            // 从模块类型中获取 properties 添加到 items
            if (field.moduleTypeRef) {
                const selectedModuleType = allModuleTypes.find(mt => mt.name === field.moduleTypeRef)
                if (selectedModuleType && selectedModuleType.jsonSchema) {
                    try {
                        const moduleSchema = JSON.parse(selectedModuleType.jsonSchema)
                        if (moduleSchema.properties) {
                            items.properties = moduleSchema.properties
                            if (moduleSchema.required) {
                                items.required = moduleSchema.required
                            }
                        }
                    } catch (e) {
                        console.error('解析模块类型 Schema 失败:', e)
                    }
                }
            }

            property = {
                type: 'array',
                items,
                description: field.description
            }
        } else if (field.type === 'object' && field.properties.length > 0) {
            // 数组元素是对象
            const itemProperties: Record<string, unknown> = {}
            const itemRequired: string[] = []

            field.properties.forEach(subField => {
                itemProperties[subField.name] = generateFieldSchema(subField, allModuleTypes)
                if (subField.required) {
                    itemRequired.push(subField.name)
                }
            })

            property = {
                type: 'array',
                items: {
                    type: 'object',
                    properties: itemProperties,
                    required: itemRequired.length > 0 ? itemRequired : undefined
                },
                description: field.description
            }
        } else {
            // 数组元素是基本类型
            property = {
                type: 'array',
                items: {
                    type: field.type
                },
                description: field.description
            }
        }
    } else if (field.type === 'module') {
        // 模块类型（单个）
        property = {
            type: 'object',
            'x-moduleType': field.moduleTypeRef,
            description: field.description
        }

        // 从模块类型中获取 properties
        if (field.moduleTypeRef) {
            const selectedModuleType = allModuleTypes.find(mt => mt.name === field.moduleTypeRef)
            if (selectedModuleType && selectedModuleType.jsonSchema) {
                try {
                    const moduleSchema = JSON.parse(selectedModuleType.jsonSchema)
                    if (moduleSchema.properties) {
                        property.properties = moduleSchema.properties
                        if (moduleSchema.required) {
                            property.required = moduleSchema.required
                        }
                    }
                } catch (e) {
                    console.error('解析模块类型 Schema 失败:', e)
                }
            }
        }
    } else if (field.type === 'object' && field.properties.length > 0) {
        // 对象类型
        const subProperties: Record<string, unknown> = {}
        const subRequired: string[] = []

        field.properties.forEach(subField => {
            subProperties[subField.name] = generateFieldSchema(subField, allModuleTypes)
            if (subField.required) {
                subRequired.push(subField.name)
            }
        })

        property = {
            type: 'object',
            properties: subProperties,
            required: subRequired.length > 0 ? subRequired : undefined,
            description: field.description
        }
    } else {
        // 基本类型
        property = {
            type: field.type,
            description: field.description
        }
    }

    // 添加枚举支持
    if (field.enum && field.enum.length > 0) {
        property.enum = field.enum
    }

    // 添加 UI 组件类型到扩展字段
    if (field.uiWidget && field.uiWidget !== 'input') {
        property['x-uiWidget'] = field.uiWidget
    }

    // 添加 textarea 行数配置
    if (field.uiWidget === 'textarea' && field.rows) {
        property['x-rows'] = field.rows
    }

    // 添加 useForAI 标记
    if (field.useForAI) {
        property.useForAI = true
    }

    // 添加 defaultCollapsed 标记
    if (field.defaultCollapsed) {
        property['x-defaultCollapsed'] = true
    }

    return property
}

/**
 * 生成完整的 JSON Schema
 */
export function generateJsonSchema(fields: SchemaField[], titleField: string = '', allModuleTypes: ModuleType[] = []): Record<string, unknown> {
    const properties: Record<string, unknown> = {}
    const required: string[] = []

    fields.forEach(field => {
        properties[field.name] = generateFieldSchema(field, allModuleTypes)

        if (field.required) {
            required.push(field.name)
        }
    })

    return {
        type: 'object',
        properties,
        required: required.length > 0 ? required : undefined,
        'x-titleField': titleField || undefined
    }
}

export default generateJsonSchema
