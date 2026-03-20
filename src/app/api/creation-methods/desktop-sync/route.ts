/**
 * 桌面端同步 API
 *
 * GET /api/creation-methods/desktop-sync
 * 返回所有已发布创作方法的元数据列表，供桌面端同步
 */

import { NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

export async function GET() {
  try {
    const methods = await prisma.novel_creation_method.findMany({
      select: {
        slug: true,
        name_zh: true,
        name_en: true,
        description_zh: true,
        description_en: true,
        novel_genre: true,
        starter_dirs_zh: true,
        starter_dirs_en: true,
        skills_version: true,
      },
      orderBy: { id: "asc" },
    });

    const result = methods.map((m: typeof methods[number]) => ({
      slug: m.slug,
      name_zh: m.name_zh,
      name_en: m.name_en,
      description_zh: m.description_zh,
      description_en: m.description_en,
      novel_genre: m.novel_genre,
      starter_dirs_zh: m.starter_dirs_zh,
      starter_dirs_en: m.starter_dirs_en,
      skills_version: m.skills_version,
    }));

    return NextResponse.json(result);
  } catch (error) {
    console.error("Failed to fetch creation methods for desktop sync:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 },
    );
  }
}
