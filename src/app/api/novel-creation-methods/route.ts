import { NextRequest } from "next/server";
import { prisma } from "@/lib/prisma";
import { getCurrentAdminUser } from "@/lib/middleware/auth-middleware";
import { apiSuccess, apiError, apiValidationError } from "@/lib/api-response";
import { serializeMethod } from "@/lib/serializers/novel-creation-method";
import { isValidGenreKey } from "@/lib/constants/novel-genres";

export async function GET() {
  try {
    const methods = await prisma.novel_creation_method.findMany({
      orderBy: { created_at: "desc" },
    });

    const result = methods.map((method) => serializeMethod(method));

    return apiSuccess(result);
  } catch (error) {
    if (error instanceof Response) return error;
    return apiError(500, "获取创作方法列表失败");
  }
}

export async function POST(request: NextRequest) {
  try {
    await getCurrentAdminUser(request);
    const body = await request.json();

    if (!body.nameZh) {
      return apiValidationError("中文名称不能为空");
    }

    const genre = body.novelGenre || null;
    if (genre && !isValidGenreKey(genre)) {
      return apiValidationError("无效的小说类型");
    }

    const newMethod = await prisma.novel_creation_method.create({
      data: {
        name_zh: body.nameZh,
        name_en: body.nameEn || null,
        description_zh: body.descriptionZh || null,
        description_en: body.descriptionEn || null,
        novel_genre: genre,
        created_at: new Date(),
      },
    });

    return apiSuccess(serializeMethod(newMethod));
  } catch (error) {
    if (error instanceof Response) return error;
    return apiError(500, "创建创作方法失败");
  }
}
