/**
 * JSON Schema 解析工具
 * 将 JSON Schema 字符串解析为内部字段结构
 */

import type { SchemaField } from '../constants'

/**
 * 递归解析单个字段
 */
export function parseField(key: string, value: Record<string, unknown>, parentRequired: string[] = []): SchemaField {
    const isArray = value.type === 'array'
    const isObject = !isArray && value.type === 'object'
    const isModule = value['x-moduleType'] !== undefined
    const items = value.items as Record<string, unknown> | undefined
    const actualType = isArray ? (items?.type as string || 'string') : (isModule ? 'module' : (value.type as string || 'string'))

    const field: SchemaField = {
        id: Math.random().toString(36).substr(2, 9),
        name: key,
        type: actualType,
        description: (value.description as string) || '',
        required: parentRequired.includes(key),
        isArray: isArray,
        useForAI: (value.useForAI as boolean) || false,
        isDynamic: (value.isDynamic as boolean) || false,
        properties: [],
        expanded: false,
        enum: (value.enum as string[]) || [],
        uiWidget: (value['x-uiWidget'] as string) || 'input',
        moduleTypeRef: (value['x-moduleType'] as string) || '',
        defaultCollapsed: (value['x-defaultCollapsed'] as boolean) || false,
        rows: (value['x-rows'] as number) || null,
        locked: (value.locked as boolean) || false
    }

    // 如果是对象类型，递归解析子字段
    const properties = value.properties as Record<string, Record<string, unknown>> | undefined
    const required = value.required as string[] | undefined
    if (isObject && properties) {
        field.properties = Object.entries(properties).map(([subKey, subValue]) =>
            parseField(subKey, subValue, required || [])
        )
    }

    // 如果是数组且元素是对象，解析对象结构
    const itemsProperties = items?.properties as Record<string, Record<string, unknown>> | undefined
    const itemsRequired = items?.required as string[] | undefined
    if (isArray && items?.type === 'object' && itemsProperties) {
        field.type = 'object'
        field.properties = Object.entries(itemsProperties).map(([subKey, subValue]) =>
            parseField(subKey, subValue, itemsRequired || [])
        )
    }

    // 如果是数组且元素是模块类型
    if (isArray && items?.['x-moduleType']) {
        field.type = 'module'
        field.moduleTypeRef = items['x-moduleType'] as string
    }

    return field
}

export interface ParseResult {
    fields: SchemaField[]
    titleField: string
    editorComponent?: string
    error: string | null
}

/**
 * 解析完整的 JSON Schema
 */
export function parseJsonSchema(jsonSchemaStr: string): ParseResult {
    try {
        const schema = JSON.parse(jsonSchemaStr)

        const result: ParseResult = {
            fields: [],
            titleField: schema['x-titleField'] || '',
            editorComponent: schema['x-editorComponent'] || 'JSONschema',
            error: null
        }

        if (schema.properties) {
            result.fields = Object.entries(schema.properties).map(([key, value]) =>
                parseField(key, value as Record<string, unknown>, schema.required || [])
            )
        }

        return result
    } catch (e) {
        console.error('解析 JSON Schema 失败:', e)
        return {
            fields: [],
            titleField: '',
            error: 'JSON Schema 格式错误: ' + (e as Error).message
        }
    }
}

export default parseJsonSchema
