import { NextRequest } from "next/server";
import { prisma } from "@/lib/prisma";
import { getCurrentAdminUser } from "@/lib/middleware/auth-middleware";
import { apiSuccess, apiError, apiNotFound } from "@/lib/api-response";
import { serializeModuleType } from "@/lib/serializers/module-type";
import { parseBigIntId } from "@/lib/serializers/validate";

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    const { id } = await params;
    const numericId = parseBigIntId(id);
    if (!numericId) return apiError(400, "无效的 ID 格式");

    const moduleType = await prisma.module_type.findUnique({
      where: { id: numericId },
    });

    if (!moduleType) {
      return apiNotFound("模块类型不存在");
    }

    return apiSuccess(serializeModuleType(moduleType));
  } catch (error) {
    console.error("[module-types]", error);
    return apiError(500, "获取模块类型失败");
  }
}

export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    await getCurrentAdminUser(request);
    const { id } = await params;
    const numericId = parseBigIntId(id);
    if (!numericId) return apiError(400, "无效的 ID 格式");

    const body = await request.json();

    const existing = await prisma.module_type.findUnique({
      where: { id: numericId },
    });

    if (!existing) {
      return apiNotFound("模块类型不存在");
    }

    const updateData: Record<string, unknown> = { updated_at: new Date() };

    if (body.nameZh !== undefined) updateData.name_zh = body.nameZh;
    if (body.nameEn !== undefined) updateData.name_en = body.nameEn;
    if (body.descriptionZh !== undefined)
      updateData.description_zh = body.descriptionZh;
    if (body.descriptionEn !== undefined)
      updateData.description_en = body.descriptionEn;
    if (body.jsonSchemaZh !== undefined)
      updateData.json_schema_zh = body.jsonSchemaZh;
    if (body.jsonSchemaEn !== undefined)
      updateData.json_schema_en = body.jsonSchemaEn;
    if (body.novelCreationMethodId !== undefined)
      updateData.novel_creation_method_id = body.novelCreationMethodId
        ? BigInt(body.novelCreationMethodId)
        : null;
    if (body.enableAi !== undefined)
      updateData.enable_ai = body.enableAi ? 1 : 0;
    if (body.singleton !== undefined)
      updateData.singleton = body.singleton ? 1 : 0;
    if (body.entityCategory !== undefined)
      updateData.entity_category = body.entityCategory;

    const updated = await prisma.module_type.update({
      where: { id: numericId },
      data: updateData,
    });

    return apiSuccess(serializeModuleType(updated));
  } catch (error) {
    console.error("[module-types]", error);
    return apiError(500, "更新模块类型失败");
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    await getCurrentAdminUser(request);
    const { id } = await params;
    const numericId = parseBigIntId(id);
    if (!numericId) return apiError(400, "无效的 ID 格式");

    const existing = await prisma.module_type.findUnique({
      where: { id: numericId },
    });

    if (!existing) {
      return apiNotFound("模块类型不存在");
    }

    await prisma.module_type.delete({ where: { id: numericId } });

    return apiSuccess(null, "删除成功");
  } catch (error) {
    console.error("[module-types]", error);
    return apiError(500, "删除模块类型失败");
  }
}
