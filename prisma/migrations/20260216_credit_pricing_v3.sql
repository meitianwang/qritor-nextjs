-- 积分计费方案 v3.0 迁移
-- 从 credit_rate/normalization_factor 切换到 input_price_per_m/output_price_per_m

-- ============================================================
-- 1. llm_config 表：添加新字段
-- ============================================================

ALTER TABLE `llm_config`
  ADD COLUMN `input_price_per_m` FLOAT NULL COMMENT '输入价格 ($/1M tokens)' AFTER `enabled`,
  ADD COLUMN `output_price_per_m` FLOAT NULL COMMENT '输出价格 ($/1M tokens)' AFTER `input_price_per_m`,
  ADD COLUMN `pricing_multiplier` FLOAT NULL COMMENT '模型选择器展示倍率' AFTER `output_price_per_m`,
  ADD COLUMN `context_window` INT NULL COMMENT '模型上下文窗口大小' AFTER `pricing_multiplier`;

-- ============================================================
-- 2. llm_config 表：填充已有模型的价格数据
-- ============================================================

-- 入门级
UPDATE `llm_config` SET `input_price_per_m` = 0.20, `output_price_per_m` = 0.50, `pricing_multiplier` = 0.3
  WHERE `model_name` = 'xai/grok-4.1-fast-reasoning';

UPDATE `llm_config` SET `input_price_per_m` = 0.20, `output_price_per_m` = 0.40, `pricing_multiplier` = 0.3
  WHERE `model_name` = 'zai/glm-4.7-flash';

UPDATE `llm_config` SET `input_price_per_m` = 0.28, `output_price_per_m` = 0.42, `pricing_multiplier` = 0.3
  WHERE `model_name` = 'deepseek/deepseek-v3.2-thinking';

UPDATE `llm_config` SET `input_price_per_m` = 0.30, `output_price_per_m` = 1.20, `pricing_multiplier` = 0.3
  WHERE `model_name` = 'minimax/minimax-m2.5';

-- 中级
UPDATE `llm_config` SET `input_price_per_m` = 0.50, `output_price_per_m` = 2.80, `pricing_multiplier` = 0.7
  WHERE `model_name` = 'moonshotai/kimi-k2.5';

UPDATE `llm_config` SET `input_price_per_m` = 0.50, `output_price_per_m` = 3.00, `pricing_multiplier` = 0.7
  WHERE `model_name` = 'google/gemini-3-flash';

UPDATE `llm_config` SET `input_price_per_m` = 1.00, `output_price_per_m` = 3.20, `pricing_multiplier` = 1.0
  WHERE `model_name` = 'zai/glm-5';

-- 旗舰
UPDATE `llm_config` SET `input_price_per_m` = 3.00, `output_price_per_m` = 15.00, `pricing_multiplier` = 3.5
  WHERE `model_name` = 'anthropic/claude-sonnet-4.5';

UPDATE `llm_config` SET `input_price_per_m` = 5.00, `output_price_per_m` = 25.00, `pricing_multiplier` = 5.8
  WHERE `model_name` = 'anthropic/claude-opus-4.6';

-- 未匹配到的模型设默认值
UPDATE `llm_config` SET `input_price_per_m` = 0.20, `output_price_per_m` = 0.40, `pricing_multiplier` = 0.3
  WHERE `input_price_per_m` IS NULL;

-- ============================================================
-- 3. llm_config 表：移除旧字段
-- ============================================================

ALTER TABLE `llm_config`
  DROP COLUMN `credit_rate`,
  DROP COLUMN `normalization_factor`;

-- ============================================================
-- 4. credit_transactions 表：添加新字段
-- ============================================================

ALTER TABLE `credit_transactions`
  ADD COLUMN `input_price_per_m` FLOAT NULL COMMENT '记录当时的输入价格' AFTER `total_tokens`,
  ADD COLUMN `output_price_per_m` FLOAT NULL COMMENT '记录当时的输出价格' AFTER `input_price_per_m`;

-- ============================================================
-- 5. credit_transactions 表：移除旧字段
-- ============================================================

ALTER TABLE `credit_transactions`
  DROP COLUMN `credit_rate`,
  DROP COLUMN `normalization_factor`;
