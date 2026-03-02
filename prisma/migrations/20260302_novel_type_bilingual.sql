-- 将 novel_type 单字段替换为 novel_type_zh + novel_type_en 双语字段

-- 1. 添加新字段
ALTER TABLE novel_creation_method
  ADD COLUMN novel_type_zh VARCHAR(50) NULL AFTER novel_type,
  ADD COLUMN novel_type_en VARCHAR(50) NULL AFTER novel_type_zh;

-- 2. 迁移数据：中文原始值
UPDATE novel_creation_method SET novel_type_zh = '东方玄幻', novel_type_en = 'Eastern Fantasy' WHERE novel_type = '东方玄幻';
UPDATE novel_creation_method SET novel_type_zh = '女性向', novel_type_en = 'Romance (Female-oriented)' WHERE novel_type = '女性向';
UPDATE novel_creation_method SET novel_type_zh = '幕后黑手/迪化流', novel_type_en = 'Mastermind / Manipulator' WHERE novel_type = '幕后黑手/迪化流';
UPDATE novel_creation_method SET novel_type_zh = '悬疑推理', novel_type_en = 'Mystery' WHERE novel_type = '悬疑推理';
UPDATE novel_creation_method SET novel_type_zh = '悬疑灵异', novel_type_en = 'Supernatural Mystery' WHERE novel_type = '悬疑灵异';
UPDATE novel_creation_method SET novel_type_zh = '游戏竞技', novel_type_en = 'Gaming / Esports' WHERE novel_type = '游戏竞技';
UPDATE novel_creation_method SET novel_type_zh = '科幻', novel_type_en = 'Sci-Fi' WHERE novel_type = '科幻';
UPDATE novel_creation_method SET novel_type_zh = '穿越', novel_type_en = 'Isekai / Time Travel' WHERE novel_type = '穿越';
UPDATE novel_creation_method SET novel_type_zh = '轻小说', novel_type_en = 'Light Novel' WHERE novel_type = '轻小说';
UPDATE novel_creation_method SET novel_type_zh = '都市脑洞', novel_type_en = 'Urban Fantasy' WHERE novel_type = '都市脑洞';

-- 3. 迁移数据：英文原始值
UPDATE novel_creation_method SET novel_type_zh = '浪漫幻想', novel_type_en = 'Romantasy' WHERE novel_type = 'Romantasy';
UPDATE novel_creation_method SET novel_type_zh = '科幻', novel_type_en = 'Sci-Fi' WHERE novel_type = 'Sci-Fi';
UPDATE novel_creation_method SET novel_type_zh = '恐怖', novel_type_en = 'Horror' WHERE novel_type = 'Horror';
UPDATE novel_creation_method SET novel_type_zh = '黑暗奇幻', novel_type_en = 'Dark Fantasy' WHERE novel_type = 'Dark Fantasy';
UPDATE novel_creation_method SET novel_type_zh = '异世界', novel_type_en = 'Isekai' WHERE novel_type = 'Isekai';
UPDATE novel_creation_method SET novel_type_zh = '文字RPG', novel_type_en = 'LitRPG' WHERE novel_type = 'LitRPG';
UPDATE novel_creation_method SET novel_type_zh = '超级英雄', novel_type_en = 'Superhero' WHERE novel_type = 'Superhero';
UPDATE novel_creation_method SET novel_type_zh = '幕后黑手', novel_type_en = 'Mastermind' WHERE novel_type = 'Mastermind';
UPDATE novel_creation_method SET novel_type_zh = '元小说', novel_type_en = 'Meta Fiction' WHERE novel_type = 'Meta Fiction';

-- 4. 迁移数据：旧格式小写英文 key
UPDATE novel_creation_method SET novel_type_zh = '灵异', novel_type_en = 'Supernatural' WHERE novel_type = 'supernatural';
UPDATE novel_creation_method SET novel_type_zh = '悬疑', novel_type_en = 'Suspense' WHERE novel_type = 'suspense';
UPDATE novel_creation_method SET novel_type_zh = '修仙', novel_type_en = 'Cultivation' WHERE novel_type = 'cultivation';
UPDATE novel_creation_method SET novel_type_zh = '情感虐文', novel_type_en = 'Emotional Angst' WHERE novel_type = 'emotional_angst';
UPDATE novel_creation_method SET novel_type_zh = '修仙无限流', novel_type_en = 'Cultivation Infinite' WHERE novel_type = 'xiuxian_infinite';

-- 5. 兜底：未命中映射的记录
UPDATE novel_creation_method SET novel_type_zh = novel_type WHERE novel_type_zh IS NULL AND novel_type IS NOT NULL AND language = 'zh';
UPDATE novel_creation_method SET novel_type_en = novel_type WHERE novel_type_en IS NULL AND novel_type IS NOT NULL AND language = 'en';
UPDATE novel_creation_method SET novel_type_zh = novel_type WHERE novel_type_zh IS NULL AND novel_type IS NOT NULL AND novel_type_en IS NULL;
