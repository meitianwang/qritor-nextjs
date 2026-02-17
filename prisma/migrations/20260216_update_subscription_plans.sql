-- 订阅计划更新（配合积分计费 v3.0）
-- 公式：1 USD = 100 积分 × 2 加成 = 200 积分/USD
-- 套餐积分 = 价格 × 100（不含加成，加成体现在消费侧）

-- 1. 更新 FREE：500 → 100
UPDATE `subscription_plans`
  SET `monthly_credits` = 100
  WHERE `name` = 'FREE';

-- 2. 更新 PRO：$69/2000 → $60/6000
UPDATE `subscription_plans`
  SET `price` = 60.00, `monthly_credits` = 6000, `display_name` = 'Pro'
  WHERE `name` = 'PRO';

-- 3. 重命名 ULTRA → MAX：$199/6000 → $200/20000
UPDATE `subscription_plans`
  SET `name` = 'MAX', `display_name` = 'Max', `price` = 200.00, `monthly_credits` = 20000
  WHERE `name` = 'ULTRA';

-- 4. 新增 PLUS 档位
INSERT INTO `subscription_plans`
  (`name`, `display_name`, `price`, `monthly_credits`, `max_projects`, `is_active`, `created_at`)
VALUES
  ('PLUS', 'Plus', 20.00, 2000, 10, 1, NOW())
ON DUPLICATE KEY UPDATE
  `price` = 20.00, `monthly_credits` = 2000;
