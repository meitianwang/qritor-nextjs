-- 为 skill 表添加英文字段，支持中英双语
ALTER TABLE skill
  ADD COLUMN description_en VARCHAR(500) NULL AFTER description,
  ADD COLUMN instructions_en LONGTEXT NULL AFTER instructions;
