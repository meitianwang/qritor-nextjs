-- 统一 novel_type 大类分组
-- 将各方法的子类型合并为统一的大类，使前端 Tab 过滤更清晰
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/update_novel_types.sql

-- ============================================================
-- 中文 (zh) - 东方玄幻
-- ============================================================
UPDATE novel_creation_method SET novel_type = '东方玄幻', updated_at = NOW()
WHERE language = 'zh' AND novel_type IN (
  '东方玄幻/古典仙侠',
  '东方玄幻/凡人流',
  '东方玄幻/家族种田流',
  '东方玄幻/洪荒流',
  '东方玄幻/稳健迪化流',
  '东方玄幻/长生苟道流'
);

-- ============================================================
-- 中文 (zh) - 穿越
-- ============================================================
UPDATE novel_creation_method SET novel_type = '穿越', updated_at = NOW()
WHERE language = 'zh' AND novel_type IN (
  'book_crossing'
);

-- ============================================================
-- 中文 (zh) - 科幻
-- ============================================================
UPDATE novel_creation_method SET novel_type = '科幻', updated_at = NOW()
WHERE language = 'zh' AND novel_type IN (
  '科幻世界/反乌托邦',
  '科幻世界/太空歌剧',
  '科幻世界/硬科幻',
  '赛博朋克',
  '软科幻',
  '悬疑科幻/无限流'
);

-- ============================================================
-- 中文 (zh) - 悬疑灵异
-- ============================================================
UPDATE novel_creation_method SET novel_type = '悬疑灵异', updated_at = NOW()
WHERE language = 'zh' AND novel_type IN (
  '悬疑灵异/规则怪谈',
  '悬疑灵异/怪谈',
  '悬疑灵异/民俗悬疑',
  '悬疑灵异/心理惊悚',
  '凶宅灵异',
  '惊悚',
  '灵异',
  '灵异职业流',
  '现代科技灵异',
  '规则流恐怖',
  '都市怪谈复苏'
);

-- ============================================================
-- 中文 (zh) - 幕后黑手/迪化流（规范化格式，去掉空格）
-- ============================================================
UPDATE novel_creation_method SET novel_type = '幕后黑手/迪化流', updated_at = NOW()
WHERE language = 'zh' AND novel_type = '幕后黑手 / 迪化流';

-- ============================================================
-- 英文 (en) - LitRPG
-- ============================================================
UPDATE novel_creation_method SET novel_type = 'LitRPG', updated_at = NOW()
WHERE language = 'en' AND novel_type IN (
  'LitRPG/System Apocalypse',
  'System Apocalypse',
  'Dungeon Core / Base Building',
  'Modern Dungeon Break / Hunter',
  'The Fourth Scourge'
);

-- ============================================================
-- 英文 (en) - Isekai
-- ============================================================
UPDATE novel_creation_method SET novel_type = 'Isekai', updated_at = NOW()
WHERE language = 'en' AND novel_type IN (
  'Reincarnation / System Regression',
  'Reincarnation / Evolution System',
  'Progression Fantasy / Academy Fiction'
);

-- ============================================================
-- 英文 (en) - Dark Fantasy
-- ============================================================
UPDATE novel_creation_method SET novel_type = 'Dark Fantasy', updated_at = NOW()
WHERE language = 'en' AND novel_type IN (
  'Grimdark & Anti-Hero',
  'Purely Pragmatic',
  'Protagonist Hunter',
  'Vengeance Driven',
  'Villainous Lead',
  'The Chaotic Evil / True Villain',
  'The Demon King / Monster Overlord',
  'Grim-Politics'
);

-- ============================================================
-- 英文 (en) - Horror
-- ============================================================
UPDATE novel_creation_method SET novel_type = 'Horror', updated_at = NOW()
WHERE language = 'en' AND novel_type IN (
  'Eldritch & Cosmic Horror',
  'Gaslamp Eldritch / Steampunk',
  'Death Game / Cosmic Streamer',
  'forensic_paranormal'
);

-- ============================================================
-- 英文 (en) - Romantasy
-- ============================================================
UPDATE novel_creation_method SET novel_type = 'Romantasy', updated_at = NOW()
WHERE language = 'en' AND novel_type IN (
  'Romantasy/Thriller',
  'Cozy Fantasy / Low-Stakes',
  'Romantic Fantasy / Otome Game Reincarnation'
);

-- ============================================================
-- 英文 (en) - Sci-Fi
-- ============================================================
UPDATE novel_creation_method SET novel_type = 'Sci-Fi', updated_at = NOW()
WHERE language = 'en' AND novel_type IN (
  'Cli-Fi / Climate Fiction'
);

-- ============================================================
-- 英文 (en) - Superhero
-- ============================================================
UPDATE novel_creation_method SET novel_type = 'Superhero', updated_at = NOW()
WHERE language = 'en' AND novel_type = 'Superhero / Cape Fiction';

-- ============================================================
-- 英文 (en) - Meta Fiction
-- ============================================================
UPDATE novel_creation_method SET novel_type = 'Meta Fiction', updated_at = NOW()
WHERE language = 'en' AND novel_type = 'Trope Subversion / System Exploitation';

-- ============================================================
-- 中文 (zh) - 女性向（数据库中手动创建的记录）
-- ============================================================
UPDATE novel_creation_method SET novel_type = '女性向', updated_at = NOW()
WHERE language = 'zh' AND novel_type = '女性向/恶役千金';

-- ============================================================
-- 英文 (en) - 补充分类（数据库中手动创建的记录）
-- ============================================================
UPDATE novel_creation_method SET novel_type = 'LitRPG', updated_at = NOW()
WHERE language = 'en' AND novel_type = 'Deckbuilder / Card LitRPG';

UPDATE novel_creation_method SET novel_type = 'Romantasy', updated_at = NOW()
WHERE language = 'en' AND novel_type = 'Alpha Werewolf / Paranormal Romance';

UPDATE novel_creation_method SET novel_type = 'Mastermind', updated_at = NOW()
WHERE language = 'en' AND novel_type = 'The Mastermind / DiHua';

-- ============================================================
-- 验证结果
-- ============================================================
SELECT language, novel_type, COUNT(*) AS count
FROM novel_creation_method
WHERE is_preset = 1
GROUP BY language, novel_type
ORDER BY language DESC, count DESC;
