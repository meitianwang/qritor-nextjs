/**
 * JsonSchemaEditor 常量配置
 */

export interface PresetField {
    name: string
    type: string
    description: string
    uiWidget: string
    required: boolean
    locked: boolean
    items?: { type: string }
}

export interface SchemaField {
    id: string
    name: string
    type: string
    description: string
    required: boolean
    isArray: boolean
    properties: SchemaField[]
    expanded: boolean
    enum: string[]
    uiWidget: string
    moduleTypeRef: string
    defaultCollapsed: boolean
    rows?: number | null
    locked?: boolean
    enumLabels?: Record<string, string>
}

// 智能写作编辑器预置字段
export const SMART_WRITER_PRESET_FIELDS: PresetField[] = [
    { name: 'volume_number', type: 'string', description: '卷号，必须是汉语数字，例如 一、十一', uiWidget: 'input', required: false, locked: true },
    { name: 'chapter_number', type: 'string', description: '章节号，必须是汉语数字，例如 一、十一', uiWidget: 'input', required: false, locked: true },
    { name: 'title', type: 'string', description: '标题', uiWidget: 'input', required: false, locked: true },
    { name: 'outline', type: 'string', description: '大纲', uiWidget: 'textarea', required: false, locked: false },
    { name: 'content', type: 'string', description: '正文内容', uiWidget: 'textarea', required: true, locked: true },
    { name: 'entity_list', type: 'array', items: { type: 'string' }, description: '参与实体，只能从提供的角色、场景、组织中选择，并且只需要填写名称，名称需要和提供的角色、场景、组织的名称完全保持一致', uiWidget: 'input', required: true, locked: true }
]

// 通用输入框样式类
export const INPUT_COMMON_CLASSES = "admin-form-input"
export const TEXTAREA_COMMON_CLASSES = "admin-form-textarea"
export const SELECT_COMMON_CLASSES = "admin-form-select"

/**
 * 创建默认字段对象
 */
export const createDefaultField = (): SchemaField => ({
    id: Math.random().toString(36).substr(2, 9),
    name: '',
    type: 'string',
    description: '',
    required: false,
    isArray: false,
    properties: [],
    expanded: false,
    enum: [],
    uiWidget: 'input',
    moduleTypeRef: '',
    defaultCollapsed: false
})

/**
 * 创建智能写作字段数据
 */
export const createSmartWriterField = (presetField: PresetField, existingId: string | null = null): SchemaField => ({
    id: existingId || Math.random().toString(36).substr(2, 9),
    name: presetField.name,
    type: presetField.type,
    description: presetField.description,
    uiWidget: presetField.uiWidget,
    required: presetField.required,
    locked: presetField.locked,
    isArray: false,
    properties: [],
    expanded: false,
    enum: [],
    moduleTypeRef: '',
    defaultCollapsed: false
})
