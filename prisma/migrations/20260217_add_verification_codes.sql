-- Add persistent verification code storage for auth flows
CREATE TABLE verification_codes (
  id BIGINT NOT NULL AUTO_INCREMENT,
  code_key VARCHAR(150) NOT NULL,
  code VARCHAR(6) NOT NULL,
  expires_at DATETIME(0) NOT NULL,
  created_at DATETIME(0) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY ix_verification_codes_code_key (code_key),
  KEY ix_verification_codes_id (id),
  KEY ix_verification_codes_created_at (created_at),
  KEY ix_verification_codes_expires_at (expires_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
