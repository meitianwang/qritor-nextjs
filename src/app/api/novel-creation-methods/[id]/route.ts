import { NextRequest } from "next/server";
import { prisma } from "@/lib/prisma";
import { getCurrentAdminUser } from "@/lib/middleware/auth-middleware";
import {
  apiSuccess,
  apiError,
  apiNotFound,
  apiValidationError,
} from "@/lib/api-response";
import { serializeMethod } from "@/lib/serializers/novel-creation-method";
import { parseBigIntId, validateSlug } from "@/lib/serializers/validate";
import { isValidGenreKey } from "@/lib/constants/novel-genres";

export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    const { id } = await params;
    const numericId = parseBigIntId(id);
    if (!numericId) return apiError(400, "无效的 ID 格式");

    const method = await prisma.novel_creation_method.findUnique({
      where: { id: numericId },
    });

    if (!method) {
      return apiNotFound("创作方法不存在");
    }

    return apiSuccess(serializeMethod(method));
  } catch (error) {
    if (error instanceof Response) return error;
    return apiError(500, "获取创作方法失败");
  }
}

export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    const { id } = await params;
    const numericId = parseBigIntId(id);
    if (!numericId) return apiError(400, "无效的 ID 格式");

    await getCurrentAdminUser(request);
    const body = await request.json();

    const method = await prisma.novel_creation_method.findUnique({
      where: { id: numericId },
    });

    if (!method) {
      return apiNotFound("创作方法不存在");
    }

    const updateData: Record<string, unknown> = {
      updated_at: new Date(),
    };

    if (body.slug !== undefined) {
      const slugResult = validateSlug(body.slug);
      if (!slugResult.valid) return slugResult.error;
      updateData.slug = slugResult.value;
    }
    if (body.nameZh !== undefined) updateData.name_zh = body.nameZh;
    if (body.nameEn !== undefined) updateData.name_en = body.nameEn;
    if (body.descriptionZh !== undefined)
      updateData.description_zh = body.descriptionZh;
    if (body.descriptionEn !== undefined)
      updateData.description_en = body.descriptionEn;
    if (body.novelGenre !== undefined) {
      const genre = body.novelGenre || null;
      if (genre && !isValidGenreKey(genre)) {
        return apiValidationError("无效的小说类型");
      }
      updateData.novel_genre = genre;
    }
    if (body.visibleCategories !== undefined)
      updateData.visible_categories = body.visibleCategories
        ? JSON.stringify(body.visibleCategories)
        : null;
    const updated = await prisma.novel_creation_method.update({
      where: { id: numericId },
      data: updateData,
    });

    return apiSuccess(serializeMethod(updated));
  } catch (error) {
    if (error instanceof Response) return error;
    return apiError(500, "更新创作方法失败");
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    const { id } = await params;
    const numericId = parseBigIntId(id);
    if (!numericId) return apiError(400, "无效的 ID 格式");

    await getCurrentAdminUser(request);

    const method = await prisma.novel_creation_method.findUnique({
      where: { id: numericId },
    });

    if (!method) {
      return apiNotFound("创作方法不存在");
    }

    await prisma.$transaction(async (tx) => {
      await tx.module_type.deleteMany({
        where: { novel_creation_method_id: numericId },
      });
      await tx.novel_creation_method.delete({ where: { id: numericId } });
    });

    return apiSuccess(null, "删除成功");
  } catch (error) {
    if (error instanceof Response) return error;
    return apiError(500, "删除创作方法失败");
  }
}
