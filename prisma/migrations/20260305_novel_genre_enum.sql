-- 添加 novel_genre 枚举字段，替代 novel_type_zh + novel_type_en 自由文本
ALTER TABLE novel_creation_method ADD COLUMN novel_genre VARCHAR(50) NULL AFTER description_en;

-- 从旧的 novel_type_zh 映射到新的枚举 key
UPDATE novel_creation_method SET novel_genre = 'xuanhuan' WHERE novel_type_zh = '东方玄幻';
UPDATE novel_creation_method SET novel_genre = 'romance' WHERE novel_type_zh = '女性向';
UPDATE novel_creation_method SET novel_genre = 'romance' WHERE novel_type_zh = '浪漫幻想';
UPDATE novel_creation_method SET novel_genre = 'romance' WHERE novel_type_zh = '情感虐文';
UPDATE novel_creation_method SET novel_genre = 'mystery' WHERE novel_type_zh = '悬疑推理';
UPDATE novel_creation_method SET novel_genre = 'mystery' WHERE novel_type_zh = '悬疑';
UPDATE novel_creation_method SET novel_genre = 'supernatural' WHERE novel_type_zh = '悬疑灵异';
UPDATE novel_creation_method SET novel_genre = 'supernatural' WHERE novel_type_zh = '灵异';
UPDATE novel_creation_method SET novel_genre = 'gaming' WHERE novel_type_zh = '游戏竞技';
UPDATE novel_creation_method SET novel_genre = 'sci-fi' WHERE novel_type_zh = '科幻';
UPDATE novel_creation_method SET novel_genre = 'isekai' WHERE novel_type_zh = '穿越';
UPDATE novel_creation_method SET novel_genre = 'isekai' WHERE novel_type_zh = '异世界';
UPDATE novel_creation_method SET novel_genre = 'light-novel' WHERE novel_type_zh = '轻小说';
UPDATE novel_creation_method SET novel_genre = 'urban-fantasy' WHERE novel_type_zh = '都市脑洞';
UPDATE novel_creation_method SET novel_genre = 'horror' WHERE novel_type_zh = '恐怖';
UPDATE novel_creation_method SET novel_genre = 'gothic' WHERE novel_type_zh = '黑暗奇幻';
UPDATE novel_creation_method SET novel_genre = 'system-litrpg' WHERE novel_type_zh = '文字RPG';
UPDATE novel_creation_method SET novel_genre = 'system-litrpg' WHERE novel_type_zh = '修仙无限流';
UPDATE novel_creation_method SET novel_genre = 'xianxia' WHERE novel_type_zh = '修仙';
UPDATE novel_creation_method SET novel_genre = 'fantasy' WHERE novel_type_zh = '超级英雄';
UPDATE novel_creation_method SET novel_genre = 'literary' WHERE novel_type_zh = '元小说';
UPDATE novel_creation_method SET novel_genre = 'mystery' WHERE novel_type_zh IN ('幕后黑手/迪化流', '幕后黑手');

-- 兜底：未命中映射的记录保留 NULL
