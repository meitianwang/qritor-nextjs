export function serializeMethod(method: {
  id: bigint;
  slug: string | null;
  name_zh: string | null;
  name_en: string | null;
  description_zh: string | null;
  description_en: string | null;
  novel_genre: string | null;
  visible_categories: string | null;
  created_at: Date;
  updated_at: Date | null;
}) {
  let parsedCategories: string[] | null = null;
  if (method.visible_categories) {
    try {
      parsedCategories = JSON.parse(method.visible_categories);
    } catch {
      parsedCategories = null;
    }
  }

  return {
    id: Number(method.id),
    slug: method.slug,
    nameZh: method.name_zh,
    nameEn: method.name_en,
    descriptionZh: method.description_zh,
    descriptionEn: method.description_en,
    novelGenre: method.novel_genre,
    visibleCategories: parsedCategories,
    createdAt: method.created_at.toISOString(),
    updatedAt: method.updated_at?.toISOString() || null,
  };
}
