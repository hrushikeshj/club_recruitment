-- MySQL dump 10.13  Distrib 5.7.42, for Linux (x86_64)
--
-- Host: localhost    Database: club_recruitment_development
-- ------------------------------------------------------
-- Server version	5.7.42-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `action_text_rich_texts`
--

DROP TABLE IF EXISTS `action_text_rich_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_text_rich_texts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `body` longtext,
  `record_type` varchar(255) NOT NULL,
  `record_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_action_text_rich_texts_uniqueness` (`record_type`,`record_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_text_rich_texts`
--

LOCK TABLES `action_text_rich_texts` WRITE;
/*!40000 ALTER TABLE `action_text_rich_texts` DISABLE KEYS */;
INSERT INTO `action_text_rich_texts` VALUES (1,'info','<div>orem ipsum dolor sit amet, consectetur adipiscing elit. Duis orci elit, vestibulum sed dictum eget, euismod sit amet leo. Aliquam rutrumLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis orci elit, vestibulum sed dictum eget, euismod sit amet leo. Aliquam rutrumLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis orci elit, vestibulum sed dictum eget, euismod sit amet leo. Aliquam rutrum</div>','Club',1,'2022-03-29 09:30:07.981843','2022-05-04 13:22:10.835292'),(2,'projects','<ul><li>p1</li><li>p2</li><li>p3</li><li>p4</li></ul>','Application',1,'2022-03-29 09:44:31.203184','2022-04-30 10:52:20.506860'),(3,'skills','<ol><li>s3</li><li>s4</li><li>sss</li><li>aa</li></ol>','Application',1,'2022-03-29 09:44:31.259196','2022-04-30 10:52:20.540491'),(6,'projects','<div>proj</div>','Application',3,'2022-03-29 11:24:14.648927','2022-03-29 11:24:14.648927'),(7,'skills','<div>skills</div>','Application',3,'2022-03-29 11:24:14.660690','2022-03-29 11:24:14.660690'),(8,'info','<div>lo1</div>','Club',2,'2022-04-05 17:55:23.662890','2022-04-05 17:55:23.662890'),(9,'info','<div>a</div>','Club',3,'2022-04-05 17:57:47.473221','2022-04-05 17:57:47.473221'),(10,'info','<div>qqq</div>','Club',4,'2022-04-07 11:02:10.362905','2022-04-07 11:02:10.362905'),(11,'projects','<div>q</div>','Application',4,'2022-04-07 12:09:17.248958','2022-04-07 12:09:17.248958'),(12,'skills','<div>s</div>','Application',4,'2022-04-07 12:09:17.256342','2022-04-07 12:09:17.256342'),(13,'info','<div>qq</div>','Club',5,'2022-04-07 13:37:13.754515','2022-04-07 13:37:13.754515'),(14,'projects','<ul><li>Project-1</li><li>project-2</li><li>p-3</li></ul>','Application',5,'2022-04-08 12:35:12.637992','2022-04-08 12:35:12.637992'),(15,'skills','<div>Skills</div>','Application',5,'2022-04-08 12:35:12.648884','2022-04-08 12:35:12.648884'),(16,'info','<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis orci elit, vestibulum sed dictum eget, euismod sit amet leo. Aliquam rutrumLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis orci elit, vestibulum sed dictum eget, euismod sit amet leo. Aliquam rutrum</div>','Club',6,'2022-04-10 06:49:30.379022','2022-04-10 06:49:30.379022'),(17,'info','','Club',7,'2022-04-14 06:37:43.093847','2022-04-14 06:37:43.093847'),(20,'projects','<div>p</div>','Application',7,'2022-04-21 14:30:41.441969','2022-04-21 14:30:41.441969'),(21,'skills','<div>s</div>','Application',7,'2022-04-21 14:30:41.457452','2022-04-21 14:30:41.457452'),(22,'projects','<div>p</div>','Application',8,'2022-04-27 18:32:45.019788','2022-04-27 18:32:45.019788'),(23,'skills','<div>s</div>','Application',8,'2022-04-27 18:32:45.032544','2022-04-27 18:32:45.032544');
/*!40000 ALTER TABLE `action_text_rich_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_admin_comments`
--

DROP TABLE IF EXISTS `active_admin_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_admin_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) DEFAULT NULL,
  `body` text,
  `resource_type` varchar(255) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `author_type` varchar(255) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_active_admin_comments_on_resource` (`resource_type`,`resource_id`),
  KEY `index_active_admin_comments_on_author` (`author_type`,`author_id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_admin_comments`
--

LOCK TABLES `active_admin_comments` WRITE;
/*!40000 ALTER TABLE `active_admin_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_admin_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_attachments`
--

DROP TABLE IF EXISTS `active_storage_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_storage_attachments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `record_id` bigint(20) NOT NULL,
  `blob_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_attachments_uniqueness` (`record_type`,`record_id`,`name`,`blob_id`),
  KEY `index_active_storage_attachments_on_blob_id` (`blob_id`),
  CONSTRAINT `fk_rails_c3b3935057` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_attachments`
--

LOCK TABLES `active_storage_attachments` WRITE;
/*!40000 ALTER TABLE `active_storage_attachments` DISABLE KEYS */;
INSERT INTO `active_storage_attachments` VALUES (4,'cover_pic','Club',5,4,'2022-04-07 13:49:52'),(7,'cover_pic','Club',6,7,'2022-04-10 06:49:30'),(8,'cover_pic','Club',1,8,'2022-05-04 12:51:16'),(10,'cover_pic','Club',2,10,'2022-05-04 12:53:02');
/*!40000 ALTER TABLE `active_storage_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_blobs`
--

DROP TABLE IF EXISTS `active_storage_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_storage_blobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `metadata` text,
  `service_name` varchar(255) NOT NULL,
  `byte_size` bigint(20) NOT NULL,
  `checksum` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_blobs_on_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_blobs`
--

LOCK TABLES `active_storage_blobs` WRITE;
/*!40000 ALTER TABLE `active_storage_blobs` DISABLE KEYS */;
INSERT INTO `active_storage_blobs` VALUES (4,'5rvw9jhk8e61wiv0x0gfmko5puhf','ad_pr.png','image/png','{\"identified\":true,\"width\":1389,\"height\":712,\"analyzed\":true}','local',57325,'9vGFEI8JHn8EpEmhb9t8Sw==','2022-04-07 13:49:52'),(7,'ulyjboaxon3fn9907v081ahtof1t','q1_g.png','image/png','{\"identified\":true,\"width\":1152,\"height\":658,\"analyzed\":true}','local',42020,'o9iW+mMhzji1fduri5LzQA==','2022-04-10 06:49:30'),(8,'7kxhznnn4q1ak70usriookn4l9iv','thats.png','image/png','{\"identified\":true,\"width\":440,\"height\":268,\"analyzed\":true}','local',76125,'xDXIiTvOSsQAtN7rGDgcaw==','2022-05-04 12:51:16'),(10,'ovpc926q06b6w32vucsaxwuufj10','acm.447x260.png','image/png','{\"identified\":true,\"width\":447,\"height\":260,\"analyzed\":true}','local',5799,'LtzTpC5SwTcJ1AF76qyA8Q==','2022-05-04 12:53:02');
/*!40000 ALTER TABLE `active_storage_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_variant_records`
--

DROP TABLE IF EXISTS `active_storage_variant_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_storage_variant_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blob_id` bigint(20) NOT NULL,
  `variation_digest` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_variant_records_uniqueness` (`blob_id`,`variation_digest`),
  CONSTRAINT `fk_rails_993965df05` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_variant_records`
--

LOCK TABLES `active_storage_variant_records` WRITE;
/*!40000 ALTER TABLE `active_storage_variant_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_storage_variant_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_submissions`
--

DROP TABLE IF EXISTS `application_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_submissions`
--

LOCK TABLES `application_submissions` WRITE;
/*!40000 ALTER TABLE `application_submissions` DISABLE KEYS */;
INSERT INTO `application_submissions` VALUES (2,3,2,4,0,NULL,1,'2022-04-05 17:56:28.675483','2022-05-04 13:10:08.211606'),(3,3,3,2,0,NULL,0,'2022-04-05 17:57:48.527616','2022-04-07 12:43:37.537822'),(4,1,3,3,0,NULL,0,'2022-04-05 18:08:33.163416','2022-05-02 11:13:25.207540'),(5,3,1,1,0,NULL,0,'2022-04-07 11:00:56.148417','2022-04-07 12:43:35.113110'),(9,3,4,3,0,NULL,0,'2022-04-07 11:45:53.909478','2022-04-07 12:43:22.588570'),(35,4,1,4,0,NULL,1,'2022-04-07 14:33:59.835584','2022-05-05 03:50:41.500966'),(36,4,2,5,0,NULL,0,'2022-04-07 14:34:12.058563','2022-04-08 12:09:45.915548'),(37,4,4,3,NULL,NULL,0,'2022-04-07 14:34:14.883115','2022-04-08 12:09:36.309776'),(38,4,5,1,0,NULL,0,'2022-04-07 16:54:12.060130','2022-04-08 14:12:25.629156'),(39,5,3,3,0,NULL,0,'2022-04-08 12:35:34.880189','2022-04-08 12:35:34.880189'),(40,5,1,1,0,NULL,1,'2022-04-08 12:35:41.221767','2022-05-04 18:12:49.946725'),(41,5,5,2,0,NULL,0,'2022-04-08 12:35:42.925127','2022-04-08 12:35:46.848578'),(42,4,3,2,0,NULL,0,'2022-04-08 13:57:28.952824','2022-04-08 14:09:48.635666'),(43,1,5,6,0,NULL,0,'2022-04-08 16:59:46.852966','2022-04-27 17:00:18.500794'),(44,1,4,5,NULL,NULL,1,'2022-04-08 17:00:23.021419','2022-05-02 11:13:29.438713'),(45,1,6,4,0,NULL,0,'2022-04-10 07:02:11.370860','2022-05-02 17:07:36.366714'),(46,1,1,2,1,100,1,'2022-04-14 06:38:34.859394','2022-05-02 17:28:09.073584'),(47,1,7,1,0,NULL,0,'2022-04-27 18:07:50.834890','2022-05-04 13:10:44.907531'),(48,8,1,3,3,NULL,1,'2022-04-27 18:35:04.629437','2022-05-05 06:44:50.839648'),(49,8,2,2,0,NULL,0,'2022-04-27 18:35:20.802461','2022-04-27 18:41:58.622715'),(50,8,7,1,0,NULL,1,'2022-04-27 18:35:23.185410','2022-05-04 18:45:55.387290'),(52,1,2,7,0,NULL,1,'2022-05-02 17:29:09.512961','2022-05-04 13:10:59.072938'),(53,5,7,4,0,NULL,0,'2022-05-04 13:09:44.651530','2022-05-04 13:09:44.651530'),(54,5,2,5,0,NULL,1,'2022-05-04 13:09:50.797800','2022-05-04 13:10:11.983130'),(55,8,3,5,0,NULL,0,'2022-05-04 18:49:47.015535','2022-05-05 06:44:12.558018'),(56,8,6,4,0,NULL,0,'2022-05-05 06:44:00.461460','2022-05-05 06:44:00.461460');
/*!40000 ALTER TABLE `application_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,4,NULL,NULL,'q','2022-03-29 09:44:31.176996','2022-04-30 10:52:20.557934'),(3,8,NULL,NULL,'glglglg','2022-03-29 11:24:14.637939','2022-03-29 11:24:14.668243'),(4,9,NULL,NULL,'q','2022-04-07 12:09:17.241309','2022-04-07 12:09:17.272703'),(5,12,NULL,NULL,'github.com/hrushikeshj','2022-04-08 12:35:12.622501','2022-04-08 12:35:12.654494'),(7,18,NULL,NULL,'g','2022-04-21 14:30:41.434008','2022-04-21 14:30:41.461758'),(8,19,NULL,NULL,'ggg','2022-04-27 18:32:45.011793','2022-04-27 18:32:45.036584');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2022-03-29 08:39:23.824493','2022-03-29 08:39:23.824493');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (7,'Computer science','CSE','2022-03-29 09:02:12.179264','2022-03-29 09:02:12.179264'),(8,'Information Technology','IT','2022-03-29 09:02:12.246500','2022-03-29 09:02:12.246500'),(9,'Electronics and Communication Engineering','ECE','2022-03-29 09:02:12.267542','2022-03-29 09:02:12.267542');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clubs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `info` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'Institute of Electrical and Electronics Engineers',NULL,'2022-03-29 09:30:07.905485','2022-05-04 13:22:10.835691','IEEE','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis orci elit, vestibulum sed dictum eget, euismod sit amet leo. Aliquam rutrum'),(2,'Association for Computing Machinery',NULL,'2022-04-05 17:55:23.633925','2022-05-04 12:53:02.667803','ACM','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis orci elit, vestibulum sed dictum eget, euismod sit amet leo. Aliquam rutrum placerat imperdiet. Curabitur sed arcu neque. '),(3,'IIAA',NULL,'2022-04-05 17:57:47.462556','2022-04-07 13:57:50.099117','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis orci elit, vestibulum sed dictum eget, euismod sit amet leo. Aliquam rutrum'),(4,'hh',NULL,'2022-04-07 11:02:10.346646','2022-04-21 13:54:18.096744','hh',''),(5,'qqqq',NULL,'2022-04-07 13:37:13.746052','2022-04-07 13:49:52.219542','qqq','qqq'),(6,'qaz',NULL,'2022-04-10 06:49:30.367028','2022-04-10 06:49:30.456178','lol','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis orci elit, vestibulum sed dictum eget, euismod sit amet leo. Aliquam rutrum'),(7,'ACM',NULL,'2022-04-14 06:37:42.990855','2022-04-14 06:37:43.149612','ACM','Description');
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruitment_configs`
--

DROP TABLE IF EXISTS `recruitment_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruitment_configs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `congif` text,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruitment_configs`
--

LOCK TABLES `recruitment_configs` WRITE;
/*!40000 ALTER TABLE `recruitment_configs` DISABLE KEYS */;
INSERT INTO `recruitment_configs` VALUES (4,'deadline',NULL,'2022-05-01 17:23:00','2022-05-02 17:23:57.586640','2022-05-05 06:49:37.998878'),(5,'lock','0','2022-05-05 09:33:21','2022-05-05 04:03:21.253049','2022-05-05 06:50:03.100070');
/*!40000 ALTER TABLE `recruitment_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_assignments`
--

DROP TABLE IF EXISTS `role_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_assignments`
--

LOCK TABLES `role_assignments` WRITE;
/*!40000 ALTER TABLE `role_assignments` DISABLE KEYS */;
INSERT INTO `role_assignments` VALUES (2,4,8,'2022-03-29 09:02:12.684602','2022-03-29 09:02:12.684602'),(3,5,8,'2022-03-29 09:28:28.682907','2022-03-29 09:28:28.682907'),(4,5,9,'2022-03-29 09:28:28.740854','2022-03-29 09:28:28.740854'),(5,12,1,'2022-04-08 12:33:38.123230','2022-04-08 12:33:38.123230'),(6,8,1,'2022-04-08 12:36:47.958376','2022-04-08 12:36:47.958376'),(8,10,1,'2022-04-08 12:37:03.846700','2022-04-08 12:37:03.846700'),(9,9,1,'2022-04-08 12:37:10.299585','2022-04-08 12:37:10.299585'),(10,13,1,'2022-04-14 06:36:34.282679','2022-04-14 06:36:34.282679'),(11,12,12,'2022-04-14 06:41:43.040899','2022-04-14 06:41:43.040899'),(12,14,1,'2022-04-14 06:46:36.260279','2022-04-14 06:46:36.260279'),(13,15,1,'2022-04-20 17:53:57.757203','2022-04-20 17:53:57.757203'),(17,19,1,'2022-04-27 18:17:26.932855','2022-04-27 18:17:26.932855'),(19,20,10,'2022-05-05 03:46:52.042356','2022-05-05 03:46:52.042356'),(21,21,9,'2022-05-05 03:52:31.428550','2022-05-05 03:52:31.428550'),(22,18,9,'2022-05-05 06:49:17.238413','2022-05-05 06:49:17.238413'),(23,18,10,'2022-05-05 06:49:17.245477','2022-05-05 06:49:17.245477');
/*!40000 ALTER TABLE `role_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Applicant','2022-04-08 12:26:44.715943','2022-04-08 12:26:44.715943'),(8,'Admin','2022-03-29 09:02:12.280981','2022-03-29 09:02:12.280981'),(9,'Council','2022-03-29 09:02:12.289846','2022-03-29 09:02:12.289846'),(10,'Convener','2022-03-29 09:02:12.308709','2022-03-29 09:02:12.308709'),(11,'club_member','2022-03-29 09:30:32.189993','2022-03-29 09:30:32.189993'),(12,'club_president','2022-04-14 06:41:14.721641','2022-04-14 06:41:14.721641');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20220319071144'),('20220319142959'),('20220319145203'),('20220319145842'),('20220319163340'),('20220319182311'),('20220319182312'),('20220319193537'),('20220325171932'),('20220329082842'),('20220329084030'),('20220407132740'),('20220502112349');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `roll_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_branch_id` (`branch_id`),
  CONSTRAINT `fk_rails_bda81e12f5` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'Admin','','admin@rails.com',1,'$2a$12$hFZzbvgR9n0L8arkauRmLO0IWzZTPGSMqgZvzVpjtqGzu0MW0V3Hu','2022-03-29 09:02:12.591976','2023-11-18 05:55:36.454086',8),(5,'hrushi','201cs220','h@h.com',NULL,'$2a$12$theOw9mZ009o9Cpa2SwNlebCk9UnNaf63Usjx1BgJ5lAUSliErZpe','2022-03-29 09:27:49.181168','2022-03-29 09:27:49.181168',NULL),(8,'hj','1112','z@z.com',NULL,'$2a$12$WcSI7MemK6sqddtWbm7DPOp3z1p3251klXIOfveB3S66E9qGH.VRK','2022-03-29 09:57:40.909014','2022-03-29 09:57:40.909014',7),(9,'test-h','201cs220','t@tt.tt',NULL,'$2a$12$O52.2KFRfFyxiafuhDuO7eDAhd1Gl6E6saChi9bLaK.fB.4XIVjyK','2022-04-07 11:46:41.234167','2022-04-07 15:43:41.892952',7),(10,'zz','201cs220','x@x.x',NULL,'$2a$12$qxWhRIspPWRlEFOzpHVu8ev2zGevwgn.mfQiH2agimpeWAFeoUnvO','2022-04-07 19:08:40.726339','2022-04-07 19:08:40.726339',7),(12,'af','af','af@af.af',NULL,'$2a$12$lOVGELaqCJIbcR91ATu.mOVT3WyQW/kHBYxXoPVu19AaYoZy/B1eG','2022-04-08 12:33:38.091258','2022-04-08 12:33:38.091258',NULL),(13,'Hrushikesh','201CS220','hrushikeshj.201cs220@nitk.edu.in',NULL,'$2a$12$HwxAzj5W1f16Vwb4bsbwZOL0c1RcxOHe1Xq48BtWiuw0sYlq9K2ji','2022-04-14 06:36:34.185317','2022-04-14 06:36:34.185317',7),(14,'test','','hrushikeshj.201cs220@nitk.edu.in	',NULL,'$2a$12$xat.JhSzUvpD9cGE77oAwueYYnOpikL9HYLtq6RphIw/Sp.JBSON6','2022-04-14 06:46:36.229552','2022-04-14 06:46:36.229552',NULL),(15,'new-t','201`','2@2.com',NULL,'$2a$12$ucvFeb69OGKS5GmXhW449.nY8co2dy.PxroYoiG.1AP6IFwpwpFZy','2022-04-20 17:53:57.739677','2022-04-20 17:55:12.966121',7),(18,'1','1','1@1.com',NULL,'$2a$12$nnvQtIFSswxFwURX57cQYuur.9zs7bGIJ7wXaE4e1/RutbtTDhWp2','2022-04-21 14:29:42.746098','2022-04-21 14:29:42.746098',7),(19,'hrushi27','201cs220','hrushi27@hrushi27.com',NULL,'$2a$12$6H37mNMC42noRjBUf6WXmOIiXjl4/opfD68BlfoRrS0nXuipuLRRK','2022-04-27 18:17:26.855120','2022-04-27 18:17:26.855120',7),(20,'IEEE-Convener','201cs888','convener@ieee.com',1,'$2a$12$MwEKkiaBo/QDCy94tixoXu6YiMmaE31WrrYtFvUgDukxJ4bMOR17i','2022-05-05 03:46:27.151068','2022-05-05 03:46:52.051622',7),(21,'Council','201cs777','council@nitk.com',NULL,'$2a$12$fe55yTT6mj2qqFLcDovgme7AnCypURkgiCRTHf5Vourl0WAgMOOM2','2022-05-05 03:52:06.550569','2022-05-05 03:52:06.550569',8);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-18 16:44:18
