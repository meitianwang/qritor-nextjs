-- 初始化 11 个 LLM 模型配置
-- 基准模型：GLM-5 (1.0x)，其他模型倍率基于续写场景 (20K input + 3K output) 计算

INSERT INTO `llm_config`
  (`model_name`, `display_name`, `owned_by`, `is_default`, `enabled`, `input_price_per_m`, `output_price_per_m`, `pricing_multiplier`, `model_tier`, `context_window`, `created_at`, `updated_at`)
VALUES
  -- 经济型 (0.3x ~ 0.5x)
  ('zai/glm-4.7-flash',                'GLM-4.7 Flash',             'zai',        0, 1, 0.30,  0.50,   0.3, NULL, 128000, NOW(), NOW()),
  ('xai/grok-4.1-fast-reasoning',      'Grok 4.1 Fast Reasoning',   'xai',        0, 1, 0.40,  0.60,   0.3, NULL, 131072, NOW(), NOW()),
  ('deepseek/deepseek-v3.2-thinking',  'DeepSeek V3.2 Thinking',    'deepseek',   0, 1, 0.40,  0.60,   0.3, NULL, 131072, NOW(), NOW()),
  ('minimax/minimax-m2.5',             'MiniMax M2.5',              'minimax',    0, 1, 0.50,  1.40,   0.5, NULL, 200000, NOW(), NOW()),

  -- 标准型 (0.8x ~ 1.0x)
  ('google/gemini-3-flash',            'Gemini 3 Flash',            'google',     0, 1, 0.70,  3.50,   0.8, NULL, 200000, NOW(), NOW()),
  ('moonshotai/kimi-k2.5',             'Kimi K2.5',                 'moonshotai', 0, 1, 0.80,  3.00,   0.8, NULL, 131072, NOW(), NOW()),
  ('zai/glm-5',                        'GLM-5',                     'zai',        1, 1, 1.00,  3.20,   1.0, NULL, 128000, NOW(), NOW()),

  -- 高级型 (2.6x)
  ('openai/gpt-5.2',                   'GPT-5.2',                   'openai',     0, 1, 1.75,  14.00,  2.6, NULL, 400000, NOW(), NOW()),
  ('google/gemini-3-pro',              'Gemini 3 Pro',              'google',     0, 1, 2.00,  12.00,  2.6, NULL, 1000000, NOW(), NOW()),

  -- 旗舰型 (3.5x ~ 5.9x)
  ('anthropic/claude-sonnet-4.5',      'Claude Sonnet 4.5',         'anthropic',  0, 1, 3.00,  15.00,  3.5, NULL, 200000, NOW(), NOW()),
  ('anthropic/claude-opus-4.6',        'Claude Opus 4.6',           'anthropic',  0, 1, 5.00,  25.00,  5.9, NULL, 200000, NOW(), NOW())

ON DUPLICATE KEY UPDATE
  `input_price_per_m`  = VALUES(`input_price_per_m`),
  `output_price_per_m` = VALUES(`output_price_per_m`),
  `pricing_multiplier` = VALUES(`pricing_multiplier`),
  `display_name`       = VALUES(`display_name`),
  `updated_at`         = NOW();
