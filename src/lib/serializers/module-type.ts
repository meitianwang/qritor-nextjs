import type { module_type } from "@/generated/prisma/client";

export function serializeModuleType(mt: module_type) {
  return {
    id: String(mt.id),
    nameZh: mt.name_zh,
    nameEn: mt.name_en,
    descriptionZh: mt.description_zh,
    descriptionEn: mt.description_en,
    jsonSchemaZh: mt.json_schema_zh,
    jsonSchemaEn: mt.json_schema_en,
    temperature: mt.temperature,
    novelCreationMethodId: mt.novel_creation_method_id
      ? String(mt.novel_creation_method_id)
      : null,
    enableAi: mt.enable_ai === 1,
    singleton: mt.singleton === 1,
    builtIn: mt.built_in === 1,
    entityCategory: mt.entity_category,
    createdAt: mt.created_at.toISOString(),
    updatedAt: mt.updated_at?.toISOString() || null,
  };
}
