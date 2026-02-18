-- 删除 orders 表的 payment_method 字段（支付方式始终为 Stripe，无需存储）

ALTER TABLE `orders` DROP COLUMN `payment_method`;
