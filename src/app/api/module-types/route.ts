import { NextRequest } from "next/server";
import { prisma } from "@/lib/prisma";
import { getCurrentAdminUser } from "@/lib/middleware/auth-middleware";
import { apiSuccess, apiError, apiValidationError } from "@/lib/api-response";
import { serializeModuleType } from "@/lib/serializers/module-type";

export async function GET() {
  try {
    const moduleTypes = await prisma.module_type.findMany({
      orderBy: { created_at: "desc" },
    });

    return apiSuccess(moduleTypes.map(serializeModuleType));
  } catch (error) {
    console.error("[module-types GET]", error);
    return apiError(500, "获取模块类型列表失败");
  }
}

export async function POST(request: NextRequest) {
  try {
    await getCurrentAdminUser(request);
    const body = await request.json();

    if (!body.nameZh) {
      return apiValidationError("中文名称不能为空");
    }
    if (!body.nameEn) {
      return apiValidationError("英文名称不能为空");
    }
    if (!body.descriptionZh) {
      return apiValidationError("中文描述不能为空");
    }
    if (!body.descriptionEn) {
      return apiValidationError("英文描述不能为空");
    }
    if (!body.entityCategory) {
      return apiValidationError("实体分类不能为空");
    }
    if (!body.novelCreationMethodId) {
      return apiValidationError("创作方法 ID 不能为空");
    }
    if (!body.jsonSchemaZh) {
      return apiValidationError("中文 JSON Schema 不能为空");
    }
    if (!body.jsonSchemaEn) {
      return apiValidationError("英文 JSON Schema 不能为空");
    }
    if (body.enableAi === undefined || body.enableAi === null) {
      return apiValidationError("是否启用 AI 不能为空");
    }
    if (body.singleton === undefined || body.singleton === null) {
      return apiValidationError("是否单例不能为空");
    }

    const moduleType = await prisma.module_type.create({
      data: {
        name_zh: body.nameZh,
        name_en: body.nameEn,
        description_zh: body.descriptionZh,
        description_en: body.descriptionEn,
        json_schema_zh: body.jsonSchemaZh,
        json_schema_en: body.jsonSchemaEn,
        novel_creation_method_id: BigInt(body.novelCreationMethodId),
        enable_ai: body.enableAi ? 1 : 0,
        singleton: body.singleton ? 1 : 0,
        entity_category: body.entityCategory,
        created_at: new Date(),
      },
    });

    return apiSuccess(serializeModuleType(moduleType));
  } catch (error) {
    console.error("[module-types POST]", error);
    return apiError(500, "创建模块类型失败");
  }
}
