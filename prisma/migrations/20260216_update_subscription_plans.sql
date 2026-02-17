-- 订阅计划更新（配合积分计费 v3.0）
-- 公式：1 USD = 100 积分 × 2 加成 = 200 积分/USD
-- 套餐积分 = 价格 × 100（不含加成，加成体现在消费侧）

-- 1. 更新 FREE：500 → 100
UPDATE `subscription_plans`
  SET `monthly_credits` = 100,
      `descriptions` = JSON_OBJECT(
        'zh', '适合初次体验 AI 创作',
        'en', 'Perfect for trying AI-powered writing'
      ),
      `features_i18n` = JSON_OBJECT(
        'zh', JSON_ARRAY('每月 100 积分', '基础 AI 续写功能', '经济型模型可用', '最多 3 个创作项目'),
        'en', JSON_ARRAY('100 credits/month', 'Basic AI continuation', 'Budget models available', 'Up to 3 projects')
      )
  WHERE `name` = 'FREE';

-- 2. 更新 PRO：$69/2000 → $60/6000
UPDATE `subscription_plans`
  SET `price` = 60.00, `monthly_credits` = 6000, `display_name` = 'Pro',
      `descriptions` = JSON_OBJECT(
        'zh', '专业创作者的不二之选',
        'en', 'The go-to choice for professional writers'
      ),
      `features_i18n` = JSON_OBJECT(
        'zh', JSON_ARRAY('每月 6,000 积分', '全部模型可用（含旗舰）', '无限创作项目', '漫画与分镜生成', '优先体验新功能'),
        'en', JSON_ARRAY('6,000 credits/month', 'All models including flagships', 'Unlimited projects', 'Comic & storyboard generation', 'Early access to new features')
      )
  WHERE `name` = 'PRO';

-- 3. 重命名 ULTRA → MAX：$199/6000 → $200/20000
UPDATE `subscription_plans`
  SET `name` = 'MAX', `display_name` = 'Max', `price` = 200.00, `monthly_credits` = 20000,
      `descriptions` = JSON_OBJECT(
        'zh', '为重度创作者与工作室打造',
        'en', 'Built for power users and studios'
      ),
      `features_i18n` = JSON_OBJECT(
        'zh', JSON_ARRAY('每月 20,000 积分', '全部旗舰模型无限制', '无限创作项目', '漫画、短剧、有声书全功能', '最优先体验新功能', '专属技术支持'),
        'en', JSON_ARRAY('20,000 credits/month', 'All flagship models unlimited', 'Unlimited projects', 'Comics, scripts & audiobook features', 'Highest priority for new features', 'Dedicated support')
      )
  WHERE `name` = 'ULTRA';

-- 4. 新增 PLUS 档位
INSERT INTO `subscription_plans`
  (`name`, `display_name`, `price`, `monthly_credits`, `max_projects`, `descriptions`, `features_i18n`, `is_active`, `created_at`)
VALUES
  ('PLUS', 'Plus', 20.00, 2000, 10,
    JSON_OBJECT(
      'zh', '个人创作者的日常之选',
      'en', 'Ideal for everyday creative writing'
    ),
    JSON_OBJECT(
      'zh', JSON_ARRAY('每月 2,000 积分', '全部标准模型可用', '无限创作项目', '灵感助手完整功能', '优先技术支持'),
      'en', JSON_ARRAY('2,000 credits/month', 'All standard models available', 'Unlimited projects', 'Full Inspiration Assistant', 'Priority support')
    ),
    1, NOW())
ON DUPLICATE KEY UPDATE
  `price` = 20.00, `monthly_credits` = 2000,
  `descriptions` = VALUES(`descriptions`),
  `features_i18n` = VALUES(`features_i18n`);
