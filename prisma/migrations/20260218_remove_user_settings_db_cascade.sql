-- Remove DB-level cascade for user_settings to enforce app-managed cleanup
ALTER TABLE `user_settings`
  DROP FOREIGN KEY `user_settings_ibfk_1`;

ALTER TABLE `user_settings`
  ADD CONSTRAINT `user_settings_ibfk_1`
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
