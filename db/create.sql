CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `roll_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `club_id` int(11) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `role_assignments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_role_assignments_on_user_id` (`user_id`),
  KEY `index_role_assignments_on_role_id` (`role_id`),
  CONSTRAINT `fk_rails_8ddd873ee0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_e4bfc1cd2c` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ;

CREATE TABLE `clubs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `info` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `applications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `projects` text,
  `skills` text,
  `github_link` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_applications_on_user_id` (`user_id`)
);

CREATE TABLE `application_submissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `application_id` bigint(20) NOT NULL,
  `club_id` bigint(20) NOT NULL,
  `preference_no` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `marks` decimal(10,0) DEFAULT NULL,
  `selected` tinyint(1) DEFAULT '0',
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_application_submissions_on_application_id` (`application_id`),
  KEY `index_application_submissions_on_club_id` (`club_id`),
  CONSTRAINT `fk_rails_2199d56b7d` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`),
  CONSTRAINT `fk_rails_e676731578` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
);