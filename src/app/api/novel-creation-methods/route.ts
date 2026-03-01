import { NextRequest } from "next/server";
import { prisma } from "@/lib/prisma";
import { getCurrentAdminUser } from "@/lib/middleware/auth-middleware";
import { apiSuccess, apiError, apiValidationError } from "@/lib/api-response";
import { serializeMethod } from "@/lib/serializers/novel-creation-method";
import { parseBigIntId } from "@/lib/serializers/validate";

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
    const { searchParams } = new URL(request.url);
    const templateMethodId = searchParams.get("templateMethodId");

    if (!body.name) {
      return apiValidationError("名称不能为空");
    }

    const result = await prisma.$transaction(async (tx) => {
      if (templateMethodId) {
        const templateId = parseBigIntId(templateMethodId);
        if (!templateId) throw new Error("无效的模板 ID 格式");

        const template = await tx.novel_creation_method.findUnique({
          where: { id: templateId },
        });
        if (!template) {
          throw new Error("模板创作方法不存在");
        }

        const newMethod = await tx.novel_creation_method.create({
          data: {
            name: body.name || template.name,
            slug: null,
            name_zh: template.name_zh,
            name_en: template.name_en,
            description: body.description ?? template.description,
            description_zh: template.description_zh,
            description_en: template.description_en,
            novel_type: body.novelType ?? template.novel_type,
            visible_categories: template.visible_categories,
            created_at: new Date(),
          },
        });

        // Copy module_types
        const templateModuleTypes = await tx.module_type.findMany({
          where: { novel_creation_method_id: template.id },
        });
        for (const mt of templateModuleTypes) {
          await tx.module_type.create({
            data: {
              name: mt.name,
              name_zh: mt.name_zh,
              name_en: mt.name_en,
              description: mt.description,
              description_zh: mt.description_zh,
              description_en: mt.description_en,
              json_schema: mt.json_schema,
              json_schema_zh: mt.json_schema_zh,
              json_schema_en: mt.json_schema_en,
              temperature: mt.temperature,
              novel_creation_method_id: newMethod.id,
              enable_ai: mt.enable_ai,
              singleton: mt.singleton,
              built_in: 0,
              entity_category: mt.entity_category,
              created_at: new Date(),
            },
          });
        }

        return newMethod;
      } else {
        const newMethod = await tx.novel_creation_method.create({
          data: {
            name: body.name,
            description: body.description || null,
            novel_type: body.novelType || null,
            visible_categories: body.visibleCategories
              ? JSON.stringify(body.visibleCategories)
              : null,
            created_at: new Date(),
          },
        });

        return newMethod;
      }
    });

    return apiSuccess(serializeMethod(result));
  } catch (error) {
    if (error instanceof Response) return error;
    const message = error instanceof Error ? error.message : "创建创作方法失败";
    return apiError(500, message);
  }
}
