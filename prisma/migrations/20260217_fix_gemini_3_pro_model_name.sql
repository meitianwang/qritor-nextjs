-- Map deprecated Gemini 3 Pro id to the current Gateway model id.
UPDATE `llm_config`
SET
  `model_name` = 'google/gemini-3-pro-preview',
  `display_name` = CASE
    WHEN `display_name` = 'Gemini 3 Pro' THEN 'Gemini 3 Pro Preview'
    ELSE `display_name`
  END,
  `updated_at` = NOW()
WHERE `model_name` = 'google/gemini-3-pro';
