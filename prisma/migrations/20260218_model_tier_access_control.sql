-- 模型等级访问控制
-- 1. 为 subscription_plans 添加 allowed_model_tiers 字段（JSON 数组）
-- 2. 为 llm_config 的 model_tier 填充实际值

-- ============================================================================
-- 1. subscription_plans: 添加 allowed_model_tiers
-- ============================================================================

ALTER TABLE `subscription_plans`
  ADD COLUMN `allowed_model_tiers` JSON NULL AFTER `features_i18n`;

-- FREE: 仅经济型模型
UPDATE `subscription_plans`
  SET `allowed_model_tiers` = JSON_ARRAY('economy')
  WHERE `name` = 'FREE';

-- PLUS: 经济型 + 标准型
UPDATE `subscription_plans`
  SET `allowed_model_tiers` = JSON_ARRAY('economy', 'standard')
  WHERE `name` = 'PLUS';

-- PRO: 全部模型
UPDATE `subscription_plans`
  SET `allowed_model_tiers` = JSON_ARRAY('economy', 'standard', 'advanced', 'flagship')
  WHERE `name` = 'PRO';

-- MAX: 全部模型
UPDATE `subscription_plans`
  SET `allowed_model_tiers` = JSON_ARRAY('economy', 'standard', 'advanced', 'flagship')
  WHERE `name` = 'MAX';

-- ============================================================================
-- 2. llm_config: 填充 model_tier
-- ============================================================================

-- 经济型 (0.3x ~ 0.5x)
UPDATE `llm_config` SET `model_tier` = 'economy'  WHERE `model_name` = 'zai/glm-4.7-flash';
UPDATE `llm_config` SET `model_tier` = 'economy'  WHERE `model_name` = 'xai/grok-4.1-fast-reasoning';
UPDATE `llm_config` SET `model_tier` = 'economy'  WHERE `model_name` = 'deepseek/deepseek-v3.2-thinking';
UPDATE `llm_config` SET `model_tier` = 'economy'  WHERE `model_name` = 'minimax/minimax-m2.5';

-- 标准型 (0.8x ~ 1.0x)
UPDATE `llm_config` SET `model_tier` = 'standard' WHERE `model_name` = 'google/gemini-3-flash';
UPDATE `llm_config` SET `model_tier` = 'standard' WHERE `model_name` = 'moonshotai/kimi-k2.5';
UPDATE `llm_config` SET `model_tier` = 'standard' WHERE `model_name` = 'zai/glm-5';

-- 高级型 (2.6x)
UPDATE `llm_config` SET `model_tier` = 'advanced' WHERE `model_name` = 'openai/gpt-5.2';
UPDATE `llm_config` SET `model_tier` = 'advanced' WHERE `model_name` = 'google/gemini-3-pro';

-- 旗舰型 (3.5x ~ 5.9x)
UPDATE `llm_config` SET `model_tier` = 'flagship' WHERE `model_name` = 'anthropic/claude-sonnet-4.5';
UPDATE `llm_config` SET `model_tier` = 'flagship' WHERE `model_name` = 'anthropic/claude-opus-4.6';
