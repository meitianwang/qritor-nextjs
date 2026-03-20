/**
 * Skills 下载 API
 *
 * GET /api/creation-methods/[slug]/skills
 * 返回方法专属 skills 包（manifest + .txt 文件内容）
 */

import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  try {
    const { slug } = await params;

    const method = await prisma.novel_creation_method.findFirst({
      where: { slug },
      select: { id: true, skills_version: true },
    });

    if (!method) {
      return NextResponse.json(
        { error: "Creation method not found" },
        { status: 404 },
      );
    }

    const skills = await prisma.creation_method_skill.findMany({
      where: { creation_method_id: method.id },
      select: {
        name: true,
        description_zh: true,
        description_en: true,
        instruction_zh: true,
        instruction_en: true,
      },
    });

    const files: Record<string, string> = {};
    for (const skill of skills) {
      if (skill.instruction_zh) {
        files[`${skill.name}.zh.txt`] = skill.instruction_zh;
      }
      if (skill.instruction_en) {
        files[`${skill.name}.en.txt`] = skill.instruction_en;
      }
    }

    return NextResponse.json({
      manifest: {
        version: method.skills_version || "0.0.0",
        skills: skills.map((s) => ({
          name: s.name,
          descriptionZh: s.description_zh || "",
          descriptionEn: s.description_en || "",
          instructionZh: `${s.name}.zh.txt`,
          instructionEn: `${s.name}.en.txt`,
        })),
      },
      files,
    });
  } catch (error) {
    console.error("Failed to fetch skills package:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 },
    );
  }
}
