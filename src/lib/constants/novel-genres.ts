export interface NovelGenre {
  key: string;
  zh: string;
  en: string;
}

export const NOVEL_GENRES: NovelGenre[] = [
  { key: "xuanhuan", zh: "玄幻", en: "Xuanhuan" },
  { key: "fantasy", zh: "奇幻", en: "Fantasy" },
  { key: "wuxia", zh: "武侠", en: "Wuxia" },
  { key: "xianxia", zh: "仙侠", en: "Xianxia" },
  { key: "sci-fi", zh: "科幻", en: "Sci-Fi" },
  { key: "urban", zh: "都市", en: "Urban" },
  { key: "literary", zh: "现实/纯文学", en: "Literary Fiction" },
  { key: "romance", zh: "言情", en: "Romance" },
  { key: "historical", zh: "历史", en: "Historical Fiction" },
  { key: "military", zh: "军事/战争", en: "Military / War" },
  { key: "mystery", zh: "悬疑推理", en: "Mystery" },
  { key: "thriller", zh: "惊悚", en: "Thriller" },
  { key: "horror", zh: "恐怖", en: "Horror" },
  { key: "crime", zh: "犯罪", en: "Crime Fiction" },
  { key: "espionage", zh: "间谍/谍战", en: "Espionage" },
  { key: "adventure", zh: "冒险", en: "Adventure" },
  { key: "gothic", zh: "哥特", en: "Gothic" },
  { key: "magical-realism", zh: "魔幻现实主义", en: "Magical Realism" },
  { key: "dystopian", zh: "反乌托邦", en: "Dystopian" },
  { key: "western", zh: "西部", en: "Western" },
  { key: "post-apocalyptic", zh: "末日/废土", en: "Post-Apocalyptic" },
  { key: "steampunk", zh: "蒸汽朋克", en: "Steampunk" },
  { key: "court-intrigue", zh: "宫斗/权谋", en: "Court Intrigue" },
  { key: "farming", zh: "种田/经营", en: "Farming / Management" },
  { key: "isekai", zh: "穿越/重生", en: "Isekai / Reborn" },
  { key: "system-litrpg", zh: "系统/无限流", en: "System / LitRPG" },
  { key: "supernatural", zh: "灵异/诡秘", en: "Supernatural" },
  { key: "gaming", zh: "游戏/电竞", en: "Gaming / Esports" },
  { key: "danmei-gl", zh: "耽美/百合", en: "BL / GL" },
  { key: "light-novel", zh: "轻小说", en: "Light Novel" },
  { key: "satire", zh: "讽刺", en: "Satire" },
  { key: "children", zh: "童话/儿童", en: "Children's Fiction" },
  { key: "legal", zh: "法律", en: "Legal Thriller" },
  { key: "medical", zh: "医学", en: "Medical Thriller" },
  { key: "urban-fantasy", zh: "都市奇幻", en: "Urban Fantasy" },
  { key: "coming-of-age", zh: "成长", en: "Coming of Age" },
];

export const NOVEL_GENRE_MAP = new Map(
  NOVEL_GENRES.map((g) => [g.key, g]),
);

export function getGenreLabel(key: string, lang: string): string {
  const genre = NOVEL_GENRE_MAP.get(key);
  if (!genre) return key;
  return lang === "en" ? genre.en : genre.zh;
}

export function isValidGenreKey(key: string): boolean {
  return NOVEL_GENRE_MAP.has(key);
}
