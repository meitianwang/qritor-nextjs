import { NextRequest } from "next/server";
import { prisma } from "@/lib/prisma";
import { getCurrentAdminUser } from "@/lib/middleware/auth-middleware";
import { apiSuccess, apiError } from "@/lib/api-response";
import { serializeModuleType } from "@/lib/serializers/module-type";
import { parseBigIntId } from "@/lib/serializers/validate";

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  try {
    await getCurrentAdminUser(request);
    const { id } = await params;
    const numericId = parseBigIntId(id);
    if (!numericId) return apiError(400, "无效的 ID 格式");

    const moduleTypes = await prisma.module_type.findMany({
      where: { novel_creation_method_id: numericId },
      orderBy: { created_at: "asc" },
    });

    return apiSuccess(moduleTypes.map(serializeModuleType));
  } catch (error) {
    if (error instanceof Response) return error;
    return apiError(500, "获取模块类型列表失败");
  }
}
