-- 重命名 owned_by -> platform，新增 provider 字段

-- 1. 重命名 owned_by 为 platform
ALTER TABLE `llm_config`
  CHANGE COLUMN `owned_by` `platform` VARCHAR(100) NULL;

-- 2. 添加 provider 字段
ALTER TABLE `llm_config`
  ADD COLUMN `provider` VARCHAR(100) NOT NULL DEFAULT '' AFTER `model_name`;

-- 3. 从 model_name 的 "/" 前缀提取 provider
UPDATE `llm_config`
  SET `provider` = SUBSTRING_INDEX(`model_name`, '/', 1)
  WHERE `model_name` LIKE '%/%';

-- 4. 无前缀的 model_name，根据 platform 推断 provider
UPDATE `llm_config`
  SET `provider` = `platform`
  WHERE `model_name` NOT LIKE '%/%'
    AND `platform` IS NOT NULL
    AND `platform` != ''
    AND `platform` != 'vercel';
