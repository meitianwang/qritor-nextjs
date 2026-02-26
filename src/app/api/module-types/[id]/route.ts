import { NextRequest } from "next/server";
import { prisma } from "@/lib/prisma";
import { getCurrentAdminUser } from "@/lib/middleware/auth-middleware";
import { apiSuccess, apiError, apiNotFound } from "@/lib/api-response";
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

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    const { id } = await params;
    const moduleType = await prisma.module_type.findUnique({
      where: { id: BigInt(id) },
    });

    if (!moduleType) {
      return apiNotFound("模块类型不存在");
    }

    return apiSuccess(serializeModuleType(moduleType));
  } catch (error) {
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
    const body = await request.json();

    const existing = await prisma.module_type.findUnique({
      where: { id: BigInt(id) },
    });

    if (!existing) {
      return apiNotFound("模块类型不存在");
    }

    const updateData: Record<string, any> = { updated_at: new Date() };

    if (body.name !== undefined) updateData.name = body.name;
    if (body.description !== undefined)
      updateData.description = body.description;
    if (body.jsonSchema !== undefined) updateData.json_schema = body.jsonSchema;
    if (body.temperature !== undefined)
      updateData.temperature = body.temperature;
    if (body.novelCreationMethodId !== undefined)
      updateData.novel_creation_method_id = body.novelCreationMethodId
        ? BigInt(body.novelCreationMethodId)
        : null;
    if (body.enableAi !== undefined)
      updateData.enable_ai = body.enableAi ? 1 : 0;
    if (body.singleton !== undefined)
      updateData.singleton = body.singleton ? 1 : 0;
    if (body.builtIn !== undefined) updateData.built_in = body.builtIn ? 1 : 0;
    if (body.entityCategory !== undefined)
      updateData.entity_category = body.entityCategory;

    const updated = await prisma.module_type.update({
      where: { id: BigInt(id) },
      data: updateData,
    });

    return apiSuccess(serializeModuleType(updated));
  } catch (error) {
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

    const existing = await prisma.module_type.findUnique({
      where: { id: BigInt(id) },
    });

    if (!existing) {
      return apiNotFound("模块类型不存在");
    }

    await prisma.module_type.delete({ where: { id: BigInt(id) } });

    return apiSuccess(null, "删除成功");
  } catch (error) {
    return apiError(500, "删除模块类型失败");
  }
}
