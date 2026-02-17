-- Add stripe_customer_id to users table for saved payment methods
ALTER TABLE users ADD COLUMN stripe_customer_id VARCHAR(255) NULL AFTER role;
CREATE INDEX ix_users_stripe_customer_id ON users(stripe_customer_id);

-- Add stripe_payment_intent_id to orders table for direct charges
ALTER TABLE orders ADD COLUMN stripe_payment_intent_id VARCHAR(255) NULL AFTER payment_method;
