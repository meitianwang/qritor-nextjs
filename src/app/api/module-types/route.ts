import { NextRequest } from "next/server";
import { prisma } from "@/lib/prisma";
import { getCurrentAdminUser } from "@/lib/middleware/auth-middleware";
import { apiSuccess, apiError, apiValidationError } from "@/lib/api-response";
import type { module_type } from "@prisma/client";

function serializeModuleType(mt: module_type) {
  return {
    id: String(mt.id),
    name: mt.name,
    description: mt.description,
    jsonSchema: mt.json_schema,
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

export async function GET() {
  try {
    const moduleTypes = await prisma.module_type.findMany({
      orderBy: { created_at: "desc" },
    });

    return apiSuccess(moduleTypes.map(serializeModuleType));
  } catch (error) {
    return apiError(500, "获取模块类型列表失败");
  }
}

export async function POST(request: NextRequest) {
  try {
    await getCurrentAdminUser(request);
    const body = await request.json();

    if (!body.name) {
      return apiValidationError("名称不能为空");
    }

    const moduleType = await prisma.module_type.create({
      data: {
        name: body.name,
        description: body.description || null,
        json_schema: body.jsonSchema || null,
        temperature: body.temperature ?? null,
        novel_creation_method_id: body.novelCreationMethodId
          ? BigInt(body.novelCreationMethodId)
          : null,
        enable_ai: body.enableAi ? 1 : 0,
        singleton: body.singleton ? 1 : 0,
        built_in: body.builtIn ? 1 : 0,
        entity_category: body.entityCategory || null,
        created_at: new Date(),
      },
    });

    return apiSuccess(serializeModuleType(moduleType));
  } catch (error) {
    return apiError(500, "创建模块类型失败");
  }
}
