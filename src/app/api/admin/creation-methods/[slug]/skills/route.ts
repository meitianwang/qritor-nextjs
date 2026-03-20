/**
 * Admin Skills 管理 API
 *
 * GET  /api/admin/creation-methods/[slug]/skills — 获取该方法的所有 skills
 * POST /api/admin/creation-methods/[slug]/skills — 批量上传/更新 skills
 */

import { NextRequest } from "next/server";
import { apiSuccess, apiError, apiNotFound } from "@/lib/api-response";
import { getCurrentAdminUser } from "@/lib/middleware/auth-middleware";
import { prisma } from "@/lib/prisma";

async function findMethodBySlug(slug: string) {
  return prisma.novel_creation_method.findFirst({
    where: { slug },
    select: { id: true, slug: true, skills_version: true },
  });
}

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  try {
    await getCurrentAdminUser(request);
    const { slug } = await params;

    const method = await findMethodBySlug(slug);
    if (!method) return apiNotFound("创作方法不存在");

    const skills = await prisma.creation_method_skill.findMany({
      where: { creation_method_id: method.id },
      orderBy: { name: "asc" },
    });

    return apiSuccess(
      skills.map((s) => ({
        id: Number(s.id),
        name: s.name,
        descriptionZh: s.description_zh,
        descriptionEn: s.description_en,
        instructionZh: s.instruction_zh,
        instructionEn: s.instruction_en,
        createdAt: s.created_at.toISOString(),
        updatedAt: s.updated_at?.toISOString() || null,
      })),
    );
  } catch (error) {
    if (error instanceof Response) return error;
    return apiError(500, "获取 skills 失败");
  }
}

export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  try {
    await getCurrentAdminUser(request);
    const { slug } = await params;

    const method = await findMethodBySlug(slug);
    if (!method) return apiNotFound("创作方法不存在");

    const body = await request.json();
    const skills: Array<{
      name: string;
      descriptionZh?: string;
      descriptionEn?: string;
      instructionZh?: string;
      instructionEn?: string;
    }> = body.skills;

    if (!Array.isArray(skills) || skills.length === 0) {
      return apiError(400, "skills 不能为空");
    }

    const now = new Date();
    let created = 0;
    let updated = 0;

    for (const skill of skills) {
      if (!skill.name) continue;

      const existing = await prisma.creation_method_skill.findFirst({
        where: { creation_method_id: method.id, name: skill.name },
      });

      if (existing) {
        await prisma.creation_method_skill.update({
          where: { id: existing.id },
          data: {
            description_zh: skill.descriptionZh ?? existing.description_zh,
            description_en: skill.descriptionEn ?? existing.description_en,
            instruction_zh: skill.instructionZh ?? existing.instruction_zh,
            instruction_en: skill.instructionEn ?? existing.instruction_en,
            updated_at: now,
          },
        });
        updated++;
      } else {
        await prisma.creation_method_skill.create({
          data: {
            creation_method_id: method.id,
            name: skill.name,
            description_zh: skill.descriptionZh || null,
            description_en: skill.descriptionEn || null,
            instruction_zh: skill.instructionZh || null,
            instruction_en: skill.instructionEn || null,
            created_at: now,
          },
        });
        created++;
      }
    }

    return apiSuccess({ created, updated });
  } catch (error) {
    if (error instanceof Response) return error;
    return apiError(500, "保存 skills 失败");
  }
}
