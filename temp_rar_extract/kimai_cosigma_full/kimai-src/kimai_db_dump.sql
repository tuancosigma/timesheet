-- MySQL dump 10.13  Distrib 8.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: kimai
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `kimai2_access_token`
--

DROP TABLE IF EXISTS `kimai2_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_access_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_usage` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6FB0DB1E5F37A13B` (`token`),
  KEY `IDX_6FB0DB1EA76ED395` (`user_id`),
  CONSTRAINT `FK_6FB0DB1EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_access_token`
--

LOCK TABLES `kimai2_access_token` WRITE;
/*!40000 ALTER TABLE `kimai2_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_activities`
--

DROP TABLE IF EXISTS `kimai2_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_budget` int NOT NULL,
  `budget` double NOT NULL,
  `budget_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT '1',
  `invoice_text` longtext COLLATE utf8mb4_unicode_ci,
  `number` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_8811FE1C166D1F9C` (`project_id`),
  KEY `IDX_8811FE1C7AB0E859166D1F9C` (`visible`,`project_id`),
  KEY `IDX_8811FE1C7AB0E859166D1F9C5E237E06` (`visible`,`project_id`,`name`),
  KEY `IDX_8811FE1C7AB0E8595E237E06` (`visible`,`name`),
  CONSTRAINT `FK_8811FE1C166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_activities`
--

LOCK TABLES `kimai2_activities` WRITE;
/*!40000 ALTER TABLE `kimai2_activities` DISABLE KEYS */;
INSERT INTO `kimai2_activities` VALUES (1,1,'Infra',NULL,1,NULL,0,0,NULL,1,NULL,'0002','2026-02-23 12:31:03'),(2,2,'Dev',NULL,1,NULL,0,0,NULL,1,NULL,'0003','2026-02-23 12:31:12'),(3,3,'Infra',NULL,1,NULL,0,0,NULL,1,NULL,'0004','2026-02-23 12:36:01'),(4,4,'Consulting PLM',NULL,1,NULL,0,0,NULL,1,NULL,'0005','2026-02-23 13:29:31'),(5,5,'Infra',NULL,1,NULL,0,0,NULL,1,NULL,'0006','2026-02-27 04:00:46'),(6,5,'Dev',NULL,1,NULL,0,0,NULL,1,NULL,'0007','2026-02-27 04:01:03'),(7,7,'Executive Assistant',NULL,1,NULL,0,0,NULL,1,NULL,'0008','2026-03-05 09:34:41'),(8,3,'Dev',NULL,1,'#800000',0,0,NULL,1,NULL,'0009','2026-03-20 08:22:20'),(9,3,'UX / UI',NULL,1,'#808080',0,0,NULL,1,NULL,'0010','2026-03-27 12:35:42'),(10,5,'UX / UI',NULL,1,'#808080',0,0,NULL,1,NULL,'0011','2026-03-27 12:37:22'),(11,8,'Data Engineer',NULL,1,'#ffe4e1',0,0,NULL,1,NULL,'0012','2026-04-02 03:10:07'),(12,9,'UX / UI',NULL,1,'#c0c0c0',0,0,NULL,1,NULL,'0013','2026-04-06 02:31:27');
/*!40000 ALTER TABLE `kimai2_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_activities_meta`
--

DROP TABLE IF EXISTS `kimai2_activities_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_activities_meta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A7C0A43D81C060965E237E06` (`activity_id`,`name`),
  KEY `IDX_A7C0A43D81C06096` (`activity_id`),
  CONSTRAINT `FK_A7C0A43D81C06096` FOREIGN KEY (`activity_id`) REFERENCES `kimai2_activities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_activities_meta`
--

LOCK TABLES `kimai2_activities_meta` WRITE;
/*!40000 ALTER TABLE `kimai2_activities_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_activities_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_activities_rates`
--

DROP TABLE IF EXISTS `kimai2_activities_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_activities_rates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `activity_id` int NOT NULL,
  `rate` double NOT NULL,
  `fixed` tinyint(1) NOT NULL,
  `internal_rate` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4A7F11BEA76ED39581C06096` (`user_id`,`activity_id`),
  KEY `IDX_4A7F11BEA76ED395` (`user_id`),
  KEY `IDX_4A7F11BE81C06096` (`activity_id`),
  CONSTRAINT `FK_4A7F11BE81C06096` FOREIGN KEY (`activity_id`) REFERENCES `kimai2_activities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4A7F11BEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_activities_rates`
--

LOCK TABLES `kimai2_activities_rates` WRITE;
/*!40000 ALTER TABLE `kimai2_activities_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_activities_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_activities_teams`
--

DROP TABLE IF EXISTS `kimai2_activities_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_activities_teams` (
  `activity_id` int NOT NULL,
  `team_id` int NOT NULL,
  PRIMARY KEY (`activity_id`,`team_id`),
  KEY `IDX_986998DA81C06096` (`activity_id`),
  KEY `IDX_986998DA296CD8AE` (`team_id`),
  CONSTRAINT `FK_986998DA296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `kimai2_teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_986998DA81C06096` FOREIGN KEY (`activity_id`) REFERENCES `kimai2_activities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_activities_teams`
--

LOCK TABLES `kimai2_activities_teams` WRITE;
/*!40000 ALTER TABLE `kimai2_activities_teams` DISABLE KEYS */;
INSERT INTO `kimai2_activities_teams` VALUES (11,8);
/*!40000 ALTER TABLE `kimai2_activities_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_bookmarks`
--

DROP TABLE IF EXISTS `kimai2_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_bookmarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4016EF25A76ED3955E237E06` (`user_id`,`name`),
  KEY `IDX_4016EF25A76ED395` (`user_id`),
  CONSTRAINT `FK_4016EF25A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_bookmarks`
--

LOCK TABLES `kimai2_bookmarks` WRITE;
/*!40000 ALTER TABLE `kimai2_bookmarks` DISABLE KEYS */;
INSERT INTO `kimai2_bookmarks` VALUES (1,4,'columns','timesheet','{\"starttime\":true,\"endtime\":true,\"duration\":true,\"customer\":true,\"project\":true,\"activity\":true,\"billable\":true,\"actions\":true}');
/*!40000 ALTER TABLE `kimai2_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_configuration`
--

DROP TABLE IF EXISTS `kimai2_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_configuration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1C5D63D85E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_configuration`
--

LOCK TABLES `kimai2_configuration` WRITE;
/*!40000 ALTER TABLE `kimai2_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_customers`
--

DROP TABLE IF EXISTS `kimai2_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `visible` tinyint(1) NOT NULL,
  `company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `homepage` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_budget` int NOT NULL,
  `budget` double NOT NULL,
  `vat_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT '1',
  `invoice_template_id` int DEFAULT NULL,
  `invoice_text` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `address_line1` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line2` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line3` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_reference` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5A9760447AB0E859` (`visible`),
  KEY `IDX_5A97604412946D8B` (`invoice_template_id`),
  CONSTRAINT `FK_5A97604412946D8B` FOREIGN KEY (`invoice_template_id`) REFERENCES `kimai2_invoice_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_customers`
--

LOCK TABLES `kimai2_customers` WRITE;
/*!40000 ALTER TABLE `kimai2_customers` DISABLE KEYS */;
INSERT INTO `kimai2_customers` VALUES (1,'Breachunt','0002',NULL,1,NULL,NULL,NULL,'DE','EUR',NULL,NULL,NULL,NULL,NULL,'UTC',NULL,0,0,NULL,NULL,1,NULL,NULL,'2026-02-23 12:19:45',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Cosigma','0003',NULL,1,NULL,NULL,NULL,'FR','EUR',NULL,NULL,NULL,NULL,NULL,'UTC',NULL,0,0,NULL,NULL,1,NULL,NULL,'2026-02-23 12:21:04',NULL,NULL,NULL,NULL,NULL,NULL),(3,'Safran Transmission Systems','0004',NULL,1,NULL,NULL,NULL,'DE','EUR',NULL,NULL,NULL,NULL,NULL,'UTC',NULL,0,0,NULL,NULL,1,NULL,NULL,'2026-02-23 12:21:46',NULL,NULL,NULL,NULL,NULL,NULL),(4,'Orano','0005',NULL,1,NULL,NULL,NULL,'DE','EUR',NULL,NULL,NULL,NULL,NULL,'UTC',NULL,0,0,NULL,NULL,1,NULL,NULL,'2026-02-23 12:22:04',NULL,NULL,NULL,NULL,NULL,NULL),(5,'Scal-e','0006',NULL,1,NULL,NULL,NULL,'DE','EUR',NULL,NULL,NULL,NULL,NULL,'UTC',NULL,0,0,NULL,NULL,1,NULL,NULL,'2026-02-23 12:23:32',NULL,NULL,NULL,NULL,NULL,NULL),(6,'EU Informatique','0007',NULL,1,NULL,NULL,NULL,'DE','EUR',NULL,NULL,NULL,NULL,NULL,'Asia/Ho_Chi_Minh',NULL,0,0,NULL,NULL,1,NULL,NULL,'2026-02-27 04:00:05',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `kimai2_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_customers_comments`
--

DROP TABLE IF EXISTS `kimai2_customers_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_customers_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `created_by_id` int NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_A5B142D99395C3F3` (`customer_id`),
  KEY `IDX_A5B142D9B03A8386` (`created_by_id`),
  CONSTRAINT `FK_A5B142D99395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A5B142D9B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_customers_comments`
--

LOCK TABLES `kimai2_customers_comments` WRITE;
/*!40000 ALTER TABLE `kimai2_customers_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_customers_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_customers_meta`
--

DROP TABLE IF EXISTS `kimai2_customers_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_customers_meta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A48A760F9395C3F35E237E06` (`customer_id`,`name`),
  KEY `IDX_A48A760F9395C3F3` (`customer_id`),
  CONSTRAINT `FK_A48A760F9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_customers_meta`
--

LOCK TABLES `kimai2_customers_meta` WRITE;
/*!40000 ALTER TABLE `kimai2_customers_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_customers_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_customers_rates`
--

DROP TABLE IF EXISTS `kimai2_customers_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_customers_rates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `customer_id` int NOT NULL,
  `rate` double NOT NULL,
  `fixed` tinyint(1) NOT NULL,
  `internal_rate` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_82AB0AECA76ED3959395C3F3` (`user_id`,`customer_id`),
  KEY `IDX_82AB0AECA76ED395` (`user_id`),
  KEY `IDX_82AB0AEC9395C3F3` (`customer_id`),
  CONSTRAINT `FK_82AB0AEC9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_82AB0AECA76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_customers_rates`
--

LOCK TABLES `kimai2_customers_rates` WRITE;
/*!40000 ALTER TABLE `kimai2_customers_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_customers_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_customers_teams`
--

DROP TABLE IF EXISTS `kimai2_customers_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_customers_teams` (
  `customer_id` int NOT NULL,
  `team_id` int NOT NULL,
  PRIMARY KEY (`customer_id`,`team_id`),
  KEY `IDX_50BD83889395C3F3` (`customer_id`),
  KEY `IDX_50BD8388296CD8AE` (`team_id`),
  CONSTRAINT `FK_50BD8388296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `kimai2_teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_50BD83889395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_customers_teams`
--

LOCK TABLES `kimai2_customers_teams` WRITE;
/*!40000 ALTER TABLE `kimai2_customers_teams` DISABLE KEYS */;
INSERT INTO `kimai2_customers_teams` VALUES (1,1),(1,2),(1,6),(2,1),(2,2),(5,1),(6,1),(6,2);
/*!40000 ALTER TABLE `kimai2_customers_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_export_templates`
--

DROP TABLE IF EXISTS `kimai2_export_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_export_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `columns` json NOT NULL,
  `options` json NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2F0CA26F2B36786B` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_export_templates`
--

LOCK TABLES `kimai2_export_templates` WRITE;
/*!40000 ALTER TABLE `kimai2_export_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_export_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_ext_absence`
--

DROP TABLE IF EXISTS `kimai2_ext_absence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_ext_absence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `duration` int NOT NULL DEFAULT '0',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  PRIMARY KEY (`id`),
  KEY `IDX_A1B9A817A76ED395` (`user_id`),
  CONSTRAINT `FK_A1B9A817A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_ext_absence`
--

LOCK TABLES `kimai2_ext_absence` WRITE;
/*!40000 ALTER TABLE `kimai2_ext_absence` DISABLE KEYS */;
INSERT INTO `kimai2_ext_absence` VALUES (1,2,'holiday','2026-02-16',144000,'rejected'),(2,9,'annual_leave','2026-03-31',28800,'approved'),(5,10,'annual_leave','2026-04-10',28800,'pending'),(6,10,'annual_leave','2026-04-09',28800,'pending'),(7,10,'annual_leave','2026-04-08',14400,'pending'),(8,8,'annual_leave','2026-04-17',28800,'pending'),(9,8,'annual_leave','2026-04-23',28800,'pending');
/*!40000 ALTER TABLE `kimai2_ext_absence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_ext_approval`
--

DROP TABLE IF EXISTS `kimai2_ext_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_ext_approval` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `approved_by_id` int NOT NULL,
  `month` date NOT NULL,
  `approved_at` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_775C89B0A76ED395` (`user_id`),
  KEY `IDX_775C89B02D234F6A` (`approved_by_id`),
  CONSTRAINT `FK_775C89B02D234F6A` FOREIGN KEY (`approved_by_id`) REFERENCES `kimai2_users` (`id`),
  CONSTRAINT `FK_775C89B0A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_ext_approval`
--

LOCK TABLES `kimai2_ext_approval` WRITE;
/*!40000 ALTER TABLE `kimai2_ext_approval` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_ext_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_ext_public_holiday`
--

DROP TABLE IF EXISTS `kimai2_ext_public_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_ext_public_holiday` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int NOT NULL DEFAULT '28800',
  `country` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'france',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_ext_public_holiday`
--

LOCK TABLES `kimai2_ext_public_holiday` WRITE;
/*!40000 ALTER TABLE `kimai2_ext_public_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_ext_public_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_ext_team_work_contract`
--

DROP TABLE IF EXISTS `kimai2_ext_team_work_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_ext_team_work_contract` (
  `id` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `holidays_per_year` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_967FC156296CD8AE` (`team_id`),
  CONSTRAINT `FK_967FC156296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `kimai2_teams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_ext_team_work_contract`
--

LOCK TABLES `kimai2_ext_team_work_contract` WRITE;
/*!40000 ALTER TABLE `kimai2_ext_team_work_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_ext_team_work_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_ext_work_contract`
--

DROP TABLE IF EXISTS `kimai2_ext_work_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_ext_work_contract` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `expected_working_time_monday` int NOT NULL DEFAULT '0',
  `expected_working_time_tuesday` int NOT NULL DEFAULT '0',
  `expected_working_time_wednesday` int NOT NULL DEFAULT '0',
  `expected_working_time_thursday` int NOT NULL DEFAULT '0',
  `expected_working_time_friday` int NOT NULL DEFAULT '0',
  `expected_working_time_saturday` int NOT NULL DEFAULT '0',
  `expected_working_time_sunday` int NOT NULL DEFAULT '0',
  `holidays_per_year` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_308101B1A76ED395` (`user_id`),
  CONSTRAINT `FK_308101B1A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_ext_work_contract`
--

LOCK TABLES `kimai2_ext_work_contract` WRITE;
/*!40000 ALTER TABLE `kimai2_ext_work_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_ext_work_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_invoice_templates`
--

DROP TABLE IF EXISTS `kimai2_invoice_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_invoice_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `due_days` int NOT NULL,
  `vat` double NOT NULL,
  `calculator` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_generator` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_terms` longtext COLLATE utf8mb4_unicode_ci,
  `vat_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` longtext COLLATE utf8mb4_unicode_ci,
  `payment_details` longtext COLLATE utf8mb4_unicode_ci,
  `language` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1626CFE95E237E06` (`name`),
  KEY `IDX_1626CFE99395C3F3` (`customer_id`),
  CONSTRAINT `FK_1626CFE99395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_invoice_templates`
--

LOCK TABLES `kimai2_invoice_templates` WRITE;
/*!40000 ALTER TABLE `kimai2_invoice_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_invoice_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_invoice_templates_meta`
--

DROP TABLE IF EXISTS `kimai2_invoice_templates_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_invoice_templates_meta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A165B0555DA0FB85E237E06` (`template_id`,`name`),
  KEY `IDX_A165B0555DA0FB8` (`template_id`),
  CONSTRAINT `FK_A165B0555DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `kimai2_invoice_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_invoice_templates_meta`
--

LOCK TABLES `kimai2_invoice_templates_meta` WRITE;
/*!40000 ALTER TABLE `kimai2_invoice_templates_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_invoice_templates_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_invoices`
--

DROP TABLE IF EXISTS `kimai2_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `user_id` int NOT NULL,
  `invoice_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `timezone` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double NOT NULL,
  `tax` double NOT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_days` int NOT NULL,
  `vat` double NOT NULL,
  `invoice_filename` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` date DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_76C38E372DA68207` (`invoice_number`),
  UNIQUE KEY `UNIQ_76C38E372323B33D` (`invoice_filename`),
  KEY `IDX_76C38E37A76ED395` (`user_id`),
  KEY `IDX_76C38E379395C3F3` (`customer_id`),
  CONSTRAINT `FK_76C38E379395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_76C38E37A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_invoices`
--

LOCK TABLES `kimai2_invoices` WRITE;
/*!40000 ALTER TABLE `kimai2_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_invoices_meta`
--

DROP TABLE IF EXISTS `kimai2_invoices_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_invoices_meta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7EDC37D92989F1FD5E237E06` (`invoice_id`,`name`),
  KEY `IDX_7EDC37D92989F1FD` (`invoice_id`),
  CONSTRAINT `FK_7EDC37D92989F1FD` FOREIGN KEY (`invoice_id`) REFERENCES `kimai2_invoices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_invoices_meta`
--

LOCK TABLES `kimai2_invoices_meta` WRITE;
/*!40000 ALTER TABLE `kimai2_invoices_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_invoices_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_projects`
--

DROP TABLE IF EXISTS `kimai2_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` tinytext COLLATE utf8mb4_unicode_ci,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `visible` tinyint(1) NOT NULL,
  `budget` double NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_budget` int NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT '1',
  `invoice_text` longtext COLLATE utf8mb4_unicode_ci,
  `global_activities` tinyint(1) NOT NULL DEFAULT '1',
  `number` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_407F12069395C3F3` (`customer_id`),
  KEY `IDX_407F12069395C3F37AB0E8595E237E06` (`customer_id`,`visible`,`name`),
  KEY `IDX_407F12069395C3F37AB0E859BF396750` (`customer_id`,`visible`,`id`),
  CONSTRAINT `FK_407F12069395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_projects`
--

LOCK TABLES `kimai2_projects` WRITE;
/*!40000 ALTER TABLE `kimai2_projects` DISABLE KEYS */;
INSERT INTO `kimai2_projects` VALUES (1,1,'Infra',NULL,NULL,1,0,NULL,0,NULL,NULL,NULL,'UTC',NULL,1,NULL,1,'0002','2026-02-23 12:20:31'),(2,1,'Dev',NULL,NULL,1,0,NULL,0,NULL,NULL,NULL,'UTC',NULL,1,NULL,1,'0003','2026-02-23 12:20:52'),(3,2,'Doc Review',NULL,NULL,1,0,NULL,0,NULL,NULL,NULL,'UTC',NULL,1,NULL,1,'0004','2026-02-23 12:21:22'),(4,3,'STS - Consulting',NULL,NULL,1,0,NULL,0,NULL,NULL,NULL,'UTC',NULL,1,NULL,1,'0005','2026-02-23 12:26:56'),(5,6,'EU - nextcloud',NULL,NULL,1,0,NULL,0,NULL,NULL,NULL,'Asia/Ho_Chi_Minh',NULL,1,NULL,1,'0006','2026-02-27 04:00:25'),(7,2,'Attendance',NULL,'for internal use - attendance sheet',1,0,NULL,0,NULL,'2026-02-24 17:00:00',NULL,'Asia/Ho_Chi_Minh',NULL,1,NULL,1,'007','2026-03-05 09:34:11'),(8,2,'Data Engineer',NULL,NULL,1,0,'#ffe4e1',0,NULL,'2026-03-24 17:00:00',NULL,'Asia/Ho_Chi_Minh',NULL,1,NULL,1,'0008','2026-04-02 03:06:37'),(9,2,'Cosigma Branding',NULL,NULL,1,0,'#c0c0c0',0,NULL,NULL,NULL,'UTC',NULL,1,NULL,1,'0009','2026-04-06 02:29:49');
/*!40000 ALTER TABLE `kimai2_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_projects_comments`
--

DROP TABLE IF EXISTS `kimai2_projects_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_projects_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `created_by_id` int NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_29A23638166D1F9C` (`project_id`),
  KEY `IDX_29A23638B03A8386` (`created_by_id`),
  CONSTRAINT `FK_29A23638166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_29A23638B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_projects_comments`
--

LOCK TABLES `kimai2_projects_comments` WRITE;
/*!40000 ALTER TABLE `kimai2_projects_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_projects_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_projects_meta`
--

DROP TABLE IF EXISTS `kimai2_projects_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_projects_meta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_50536EF2166D1F9C5E237E06` (`project_id`,`name`),
  KEY `IDX_50536EF2166D1F9C` (`project_id`),
  CONSTRAINT `FK_50536EF2166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_projects_meta`
--

LOCK TABLES `kimai2_projects_meta` WRITE;
/*!40000 ALTER TABLE `kimai2_projects_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_projects_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_projects_rates`
--

DROP TABLE IF EXISTS `kimai2_projects_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_projects_rates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `project_id` int NOT NULL,
  `rate` double NOT NULL,
  `fixed` tinyint(1) NOT NULL,
  `internal_rate` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_41535D55A76ED395166D1F9C` (`user_id`,`project_id`),
  KEY `IDX_41535D55A76ED395` (`user_id`),
  KEY `IDX_41535D55166D1F9C` (`project_id`),
  CONSTRAINT `FK_41535D55166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_41535D55A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_projects_rates`
--

LOCK TABLES `kimai2_projects_rates` WRITE;
/*!40000 ALTER TABLE `kimai2_projects_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_projects_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_projects_teams`
--

DROP TABLE IF EXISTS `kimai2_projects_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_projects_teams` (
  `project_id` int NOT NULL,
  `team_id` int NOT NULL,
  PRIMARY KEY (`project_id`,`team_id`),
  KEY `IDX_9345D431166D1F9C` (`project_id`),
  KEY `IDX_9345D431296CD8AE` (`team_id`),
  CONSTRAINT `FK_9345D431166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9345D431296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `kimai2_teams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_projects_teams`
--

LOCK TABLES `kimai2_projects_teams` WRITE;
/*!40000 ALTER TABLE `kimai2_projects_teams` DISABLE KEYS */;
INSERT INTO `kimai2_projects_teams` VALUES (1,1),(2,1),(2,2),(3,1),(3,2),(7,2),(7,4),(8,8),(9,1),(9,2),(9,5);
/*!40000 ALTER TABLE `kimai2_projects_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_roles`
--

DROP TABLE IF EXISTS `kimai2_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_roles`
--

LOCK TABLES `kimai2_roles` WRITE;
/*!40000 ALTER TABLE `kimai2_roles` DISABLE KEYS */;
INSERT INTO `kimai2_roles` VALUES (3,'ROLE_ADMIN'),(4,'ROLE_SUPER_ADMIN'),(2,'ROLE_TEAMLEAD'),(1,'ROLE_USER');
/*!40000 ALTER TABLE `kimai2_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_roles_permissions`
--

DROP TABLE IF EXISTS `kimai2_roles_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_roles_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `permission` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_permission` (`role_id`,`permission`),
  KEY `IDX_D263A3B8D60322AC` (`role_id`),
  CONSTRAINT `FK_D263A3B8D60322AC` FOREIGN KEY (`role_id`) REFERENCES `kimai2_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_roles_permissions`
--

LOCK TABLES `kimai2_roles_permissions` WRITE;
/*!40000 ALTER TABLE `kimai2_roles_permissions` DISABLE KEYS */;
INSERT INTO `kimai2_roles_permissions` VALUES (1,1,'create_activity',0);
/*!40000 ALTER TABLE `kimai2_roles_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_sessions`
--

DROP TABLE IF EXISTS `kimai2_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_sessions` (
  `id` varbinary(128) NOT NULL,
  `data` longblob NOT NULL,
  `time` int unsigned NOT NULL,
  `lifetime` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lifetime_idx` (`lifetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_sessions`
--

LOCK TABLES `kimai2_sessions` WRITE;
/*!40000 ALTER TABLE `kimai2_sessions` DISABLE KEYS */;
INSERT INTO `kimai2_sessions` VALUES (_binary '06fkv236obmuo7t5dv09sah3t4',_binary '_sf2_attributes|a:6:{s:18:\"_csrf/https-search\";s:43:\"vVv1s8taZooyHuKZjK6xJ-wddpHRM19eTDnlZ2VA7SE\";s:28:\"_csrf/https-datatable_update\";s:43:\"TDqC_ULd-j0e7x-MEOB1xV7lXwshGj-DP1E6zeeGgwM\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"u6Bn032QdQYVdEd8pJCpurHSNK0GmZgCPMGzTWl7g8w\";s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:32:\"_csrf/https-timesheet_quick_edit\";s:43:\"cBHHc0veQDn1CdpMJYZwV3hfYNb7vIOzaYyagQm6sts\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"3CLnNz1ewtLgm2PkVcbAXDLqrIhDvN2G2HM79HB1NQA\";}_sf2_meta|a:3:{s:1:\"u\";i:1775468348;s:1:\"c\";i:1775442773;s:1:\"l\";i:0;}',1775468348,1776073148),(_binary '0dja1081itk1m96lb2jrd4f46h',_binary '_sf2_attributes|a:4:{s:22:\"_security_secured_area\";s:1602:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:5;s:8:\"username\";s:25:\"yannis.bourebi@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:25:\"yannis.bourebi@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$n/NKAAJFawih9E53c17d5uuEkOMd.M4shn7CenRskXp87CygEbdyK\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"5f100293-a690-4740-969c-7239d8588d98\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:14:\"Yannis BOUREBI\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:2:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";i:1;s:49:\"http://schemas.microsoft.com/claims/multipleauthn\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:6:\"Yannis\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:7:\"BOUREBI\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:25:\"yannis.bourebi@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:25:\"yannis.bourebi@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_773e0610-a953-48ca-bf1b-b75b9f602800\";}i:4;a:4:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";i:3;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"gqOsl-7na92F3-C3CQuYGimlUjxvIJv_Xw2TZKSiCAg\";s:28:\"_csrf/https-datatable_update\";s:43:\"XxmBUNQH_DB5BvBzJRkC1Iu_J58XRRHi_JUpTwwYGk8\";s:32:\"_csrf/https-timesheet_quick_edit\";s:43:\"LcSC9cl5AdNZgrlxjXoHQiUHuDJ3Mcdznx2wN2tFocw\";}_sf2_meta|a:3:{s:1:\"u\";i:1775643085;s:1:\"c\";i:1775642562;s:1:\"l\";i:0;}',1775643085,1776247885),(_binary '0n07vkcl8vhcde0iv7oi885vef',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"aW02_OqayMQVYK1icJ-EyF6s70eLeXh77p29uDrUUIc\";}_sf2_meta|a:3:{s:1:\"u\";i:1775029182;s:1:\"c\";i:1775029182;s:1:\"l\";i:0;}',1775029182,1775633982),(_binary '1ls36nrvvrq84auvt1hk34vqja',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:33:\"http://localhost:8001/en/homepage\";}_sf2_meta|a:3:{s:1:\"u\";i:1774871012;s:1:\"c\";i:1774871012;s:1:\"l\";i:0;}',1774871012,1775475812),(_binary '21dog889kt4apkiot4hnug7r45',_binary '_sf2_attributes|a:4:{s:18:\"_csrf/https-search\";s:43:\"e9sdPUxX_q-NPTqTteDaqJEPQgO6ildaOqSGSdm4oys\";s:28:\"_csrf/https-datatable_update\";s:43:\"dXlEj5Y2W5NJFdU0zXIQdzE8USfVR-JBC9l714E3MoU\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"nOEHeoaBkAKfzpS34Fs-Wp2CYV61fu6CPd86nLTMQ0Q\";s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";}_sf2_meta|a:3:{s:1:\"u\";i:1775046066;s:1:\"c\";i:1775046066;s:1:\"l\";i:0;}',1775046066,1775650866),(_binary '25mbnqk3ch675l7rgs6prcr4ug',_binary '_sf2_attributes|a:4:{s:22:\"_security_secured_area\";s:446:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:12;s:8:\"username\";s:23:\"baduy.nguyen@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:23:\"baduy.nguyen@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$UdMOLjNebHGuG1Kh/dghWObFClP26sjS3P8A6.BOOKMDCESG3SQwW\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"GEITZDpt313q2R0_1Onpx0vQ0QbnstOrtQqyec7DBpA\";s:28:\"_csrf/https-datatable_update\";s:43:\"aShPbtls4INCd4ZnAVqmVDWcXb3HRfgbaPOvxaQwg1I\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"9CTuGWqh_cfAwi1-8NNFolVX9zHgrOuuM48Wje_zfbM\";}_sf2_meta|a:3:{s:1:\"u\";i:1775732379;s:1:\"c\";i:1775726791;s:1:\"l\";i:0;}',1775732379,1776337179),(_binary '2ap4esj2mm9n04qu64m4a6nvrn',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:393:\"O:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":3:{i:0;N;i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:13;s:8:\"username\";s:4:\"test\";s:7:\"enabled\";b:1;s:5:\"email\";s:21:\"tinyly90891@gmail.com\";s:8:\"password\";s:60:\"$2y$13$cYHZBgrDP9poKlv9oDa6gOo8MCXuX.u3JEQH/95JDEjxqBP.iAT3W\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:23:\"_security.last_username\";s:4:\"test\";s:26:\"_csrf/https-public_holiday\";s:43:\"UbZfzTsWZ2pVS_DD1S2shf9Yy_rD4xT7zeH_4sqlDNE\";s:29:\"_csrf/https-edit_user_profile\";s:43:\"h-8TW0fzhNJJElELsto3lZ2W0TnGqxDoBwgnMeokUGc\";s:33:\"_csrf/https-edit_user_preferences\";s:43:\"UKBCqX_-ir2E941gWMxUZMYWRNO4EAzMsWj-LNJwzhw\";}_sf2_meta|a:3:{s:1:\"u\";i:1774870408;s:1:\"c\";i:1774870262;s:1:\"l\";i:0;}',1774870408,1775475208),(_binary '2f581tijujv08bpvu33c3q17lk',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:15;s:8:\"username\";s:18:\"tu.tran@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"tu.tran@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$gd.vctpFhFU1AYFVdr2A3uP.Fue//1IvXyoo1IIZ3c5pKQzKF3EHO\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"vp4scSN2Qyv5hV9zQmihReQB-U4gDXyVCUP9XG4Qkkw\";s:18:\"_csrf/https-search\";s:43:\"70liT4mlInacLStHHFeDsq4vzuOHzL4eVJiK1x6f9hw\";s:28:\"_csrf/https-datatable_update\";s:43:\"3zmilVfCijgvs-UR9Vrsd2KiZUUiikPkrF7lRf2bFUg\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"ThGApf0XA6tVgtjRuNETYd2wnH8vG1JfVnc0WEqV5Xw\";}_sf2_meta|a:3:{s:1:\"u\";i:1776137711;s:1:\"c\";i:1776137686;s:1:\"l\";i:0;}',1776137711,1776742511),(_binary '2ld12jf85o36d0gnk0cdevik18',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:446:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:12;s:8:\"username\";s:23:\"baduy.nguyen@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:23:\"baduy.nguyen@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$UdMOLjNebHGuG1Kh/dghWObFClP26sjS3P8A6.BOOKMDCESG3SQwW\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"ZyqlTDZ_uiQQUd1zPfOqiBGSAxQnDC3ird4OZ0EW5YM\";s:28:\"_csrf/https-datatable_update\";s:43:\"hEYkQalU8sKYQJDc8wZsYEpvxhBktf8JqYZOkSaqO_g\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"GAiFJ2FJgQCTDbNnP5fnEH9olM8BLgZfxTnYLmtiPGo\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"ABy168aylvblDw08fBOlHVWeAKgajL8f9ynTtm1dP6g\";}_sf2_meta|a:3:{s:1:\"u\";i:1775818513;s:1:\"c\";i:1775818447;s:1:\"l\";i:0;}',1775818513,1776423313),(_binary '36633i34jp8cjun941pmec0571',_binary '_sf2_attributes|a:4:{s:18:\"_csrf/https-search\";s:43:\"KfD80OtEDMihI-R4sg3BkVtsKdMk7W1PqWHrOSsJxuI\";s:28:\"_csrf/https-datatable_update\";s:43:\"ME2nOszFMx6wUfumElnNjCy7YDYcS1zD9lZim_MA90M\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"-o8wWr1Mmmsp6MP_rJSiXsxJplFMcfveg9Q5osVThWE\";s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";}_sf2_meta|a:3:{s:1:\"u\";i:1775393994;s:1:\"c\";i:1775393961;s:1:\"l\";i:0;}',1775393994,1775998794),(_binary '376voh89t5cabo0sh4h7eblkpl',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"ljTU2j-FCUDAmL6LNZz_cmXU4WtuOQmlhd9JCgu2Z7M\";}_sf2_meta|a:3:{s:1:\"u\";i:1775009465;s:1:\"c\";i:1775009465;s:1:\"l\";i:0;}',1775009465,1775614265),(_binary '388h3bpmr7skm0ljog3qb45k56',_binary '_sf2_attributes|a:8:{s:18:\"_csrf/https-search\";s:43:\"AtXjWHxiH0eJruNogObStK09fthvps8ZlcsgLd3mIs8\";s:28:\"_csrf/https-datatable_update\";s:43:\"_x5tiC5z5-1l9psZ_5QOHHjpb96QbrSQAg0je6f2NMM\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"bu2ahinVYl84BTkvWprCIndY3LmzKGdPiHJT7HeZtwA\";s:22:\"_security_secured_area\";s:437:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:4;s:8:\"username\";s:19:\"hoang.vu@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"hoang.vu@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$ruTDOzYmGbW16JUxk9rA2uD4kpcVs.suYreFn7CIGe9u8mOw4wjfq\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:29:\"_csrf/https-edit_user_profile\";s:43:\"5o22x2W2y4yc26atfVPQhyOC1_TvKo1jIvYi8dcrhVI\";s:33:\"_csrf/https-edit_user_preferences\";s:43:\"kxZZ0V6OYdfIcOrNTk7SETJ2NhnY-tUkGSpXHrCo_YY\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"hqXssHAmOkYkRpD_VvVKsKOCKdb8nFS_TF3f_VPGv6c\";s:32:\"_csrf/https-timesheet_quick_edit\";s:43:\"KlbaoBtLAIKsl5lWKAMAdkSf1jl-MNMzFiG9rI118cQ\";}_sf2_meta|a:3:{s:1:\"u\";i:1774872632;s:1:\"c\";i:1774870094;s:1:\"l\";i:0;}',1774872632,1775477432),(_binary '38fnu1lm0ekbl5deh9u6tb7lfr',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";}_sf2_meta|a:3:{s:1:\"u\";i:1775996841;s:1:\"c\";i:1775996841;s:1:\"l\";i:0;}',1775996841,1776601641),(_binary '3baulg2l9lrl7ibpci2imkpqng',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"Nl3LeTwQiVdki_2vYoOSVWq9EcChTdbmASR-2euPJFA\";}_sf2_meta|a:3:{s:1:\"u\";i:1775273477;s:1:\"c\";i:1775273477;s:1:\"l\";i:0;}',1775273477,1775878277),(_binary '3jkmmrkulk0ccgjf8iffv06ghh',_binary '_sf2_attributes|a:4:{s:22:\"_security_secured_area\";s:1424:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"b1552955-2cbd-463a-94e5-8601b845170e\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:7:\"Duc CAO\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:3:\"Duc\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:3:\"CAO\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:18:\"duc.cao@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:18:\"duc.cao@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_f0044b95-18c5-4873-af0a-4fc2e03d2200\";}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"IkdK24RJiLIIBpfn6lsfOXvv-Dajbac4r7MyXo7Gjrc\";s:28:\"_csrf/https-datatable_update\";s:43:\"yCIb7P8IsSH4eL_Aw1mY9U3GQs6n6MJ16roinbRcW_k\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"bILqSsg5sBojqcKFX3tMlKat_dVslfYbXKc_UVJCT2g\";}_sf2_meta|a:3:{s:1:\"u\";i:1776141304;s:1:\"c\";i:1776141303;s:1:\"l\";i:0;}',1776141304,1776746104),(_binary '3tfhrtj2um4eap0cql4napaful',_binary '_sf2_attributes|a:4:{s:18:\"_csrf/https-search\";s:43:\"TVnzw1UtNdM-YjpcxAQIpAEI7sgfJfPkBP9fRO3MZqs\";s:28:\"_csrf/https-datatable_update\";s:43:\"3W_fX-UjBeLKqhQUliBdLw8rYo0ym23p9WvmbhN-VAk\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"lJMa8rI5gyr8YzzshoK18J6qi10xJl3LAH1v2BOChhU\";s:22:\"_security_secured_area\";s:512:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:9;s:8:\"username\";s:19:\"nhu.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"nhu.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$/Tv6jyHZwPnfoSTN.09bYOJPlh1O4/DjlPJMovAZyXNq8HfVPJjRq\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:4:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";i:3;s:9:\"ROLE_USER\";}}}\";}_sf2_meta|a:3:{s:1:\"u\";i:1775444564;s:1:\"c\";i:1775444564;s:1:\"l\";i:0;}',1775444564,1776049364),(_binary '4d4o3q392ftq68aam9p8isl5fr',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"F5GvczScbP7pbTIH8_FkqIxwg-Lmuo_0pWSdBnScRf8\";}_sf2_meta|a:3:{s:1:\"u\";i:1774877744;s:1:\"c\";i:1774877744;s:1:\"l\";i:0;}',1774877744,1775482544),(_binary '4hfub33jv3hm96b7ti39o76g0m',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";}_sf2_meta|a:3:{s:1:\"u\";i:1774870083;s:1:\"c\";i:1774870083;s:1:\"l\";i:0;}',1774870083,1775474883),(_binary '4hme0ha05f4nve874kql6rivd0',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";}_sf2_meta|a:3:{s:1:\"u\";i:1775273286;s:1:\"c\";i:1775273286;s:1:\"l\";i:0;}',1775273286,1775878086),(_binary '4jmc9le27qi106to06b9kj2p5g',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"7fyvj1EXEp_wApzvCrJpTMmXe7xCJotbBBejFwOnfsA\";}_sf2_meta|a:3:{s:1:\"u\";i:1775343900;s:1:\"c\";i:1775343900;s:1:\"l\";i:0;}',1775343900,1775948700),(_binary '4ngvb9p127au42u9akarnn6680',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";s:24:\"_csrf/https-authenticate\";s:43:\"wYkncM1GPRQslCgf8X7yIK7WbowgKjtS3K9h_8fgMtc\";}_sf2_meta|a:3:{s:1:\"u\";i:1775533519;s:1:\"c\";i:1775533513;s:1:\"l\";i:0;}',1775533519,1776138319),(_binary '4ptjpdo6g3qrcddm5ps9e8armo',_binary '_sf2_attributes|a:12:{s:22:\"_security_secured_area\";s:1490:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:10;s:8:\"username\";s:21:\"chau.hoang@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:21:\"chau.hoang@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$NK1G2nIcDVblgQ9/o5zO4eIYdW6B7aUlQds9DLzPMIIxk.pT2s4ve\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"b8fdd067-f297-4ec5-b270-eced2515b104\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:10:\"Chau HOANG\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:4:\"Chau\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:5:\"HOANG\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:21:\"chau.hoang@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:21:\"chau.hoang@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_84330aa4-b353-4c59-9f17-35d811870200\";}i:4;a:3:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"y3evzUAF1mAP71OKIYvRxZHb5OhYCz8mS9YPuf9rb_8\";s:28:\"_csrf/https-datatable_update\";s:43:\"aydHu-ZDhJVCTZ4SC-BsCw9wo0zCGjifL_ASpiI2sKA\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"8OA3Mw6bRn7DaeRC2UPkHtTrB_UDQaea1gAYo5C55D8\";s:19:\"_csrf/https-absence\";s:43:\"uHfqqRo0RRw9eFHD2he_dMdePb1ikVpV4uXYyTw1udg\";s:34:\"_csrf/https-admin_customer_comment\";s:43:\"Dl-KpobxyVEpGCRXcPWhVuVziJtcK1u8YANPH2h18qU\";s:29:\"_csrf/https-project.duplicate\";s:43:\"QuHm-W3S4LHPuw6QdmUU1TiJ4P28TVdhfkZzrFhNNOg\";s:33:\"_csrf/https-admin_project_comment\";s:43:\"H5Mh5fiAKl4cPTEDa7TJGOAutlGg_QkKF5zFDMGuzhU\";s:36:\"_csrf/https-admin_project_teams_edit\";s:43:\"aRXGkTe0YB2iCd3Aj8N2eEWCdyqy_rBVmTxQsMd4SYQ\";s:27:\"_csrf/https-admin_team_edit\";s:43:\"H5U-CAX4lfUEFZoGMHRGnSLzZQOx2uV9miDd6zOY8T8\";s:30:\"_csrf/https-team_customer_form\";s:43:\"yQ6s-kNyUl3kTZy6qJEmOV2AvnuFDSjn3ZL3ZvyOs1I\";s:29:\"_csrf/https-team_project_form\";s:43:\"TjIp0dRAh5ETRlLx5zJPTCdk6B7DdpWTxdNx_wL_Nuk\";}_sf2_meta|a:3:{s:1:\"u\";i:1775017220;s:1:\"c\";i:1775017120;s:1:\"l\";i:0;}',1775017220,1775622020),(_binary '4r0t2nmnr6q77rodn9qr4baers',_binary '_sf2_attributes|a:9:{s:22:\"_security_secured_area\";s:489:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:10;s:8:\"username\";s:21:\"chau.hoang@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:21:\"chau.hoang@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$NK1G2nIcDVblgQ9/o5zO4eIYdW6B7aUlQds9DLzPMIIxk.pT2s4ve\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:3:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"CnxMH86RncqXc2Afre0SRpv-HRbAswAsflJ-YtVajAE\";s:28:\"_csrf/https-datatable_update\";s:43:\"Cjxvg3hPtcvNMtc8AY3BNxGQ3ReBeeWiC2im9QOr1TA\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"GD1M1e3ZZwkicN4tmUArYTQWlhenhyRqt0wS7axcGeE\";s:29:\"_csrf/https-project.duplicate\";s:43:\"Wx6coxzYEjxq2G5sBp64tzPtS3zi0f4WzDKhQlYER7c\";s:30:\"_csrf/https-admin_project_edit\";s:43:\"h9gsTirHv16qtj6NjQ4z5ovHxl8CXJh99Ar_bqnywsA\";s:33:\"_csrf/https-admin_project_comment\";s:43:\"FFcSnN5R66-ty7Q54BDZiCbLg8_deBKxjpRObQLCXE4\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"wyQOXMAHvhi2QmV9kPq89_lKIRVU8Z-2xwRvZSDm30Y\";s:31:\"_csrf/https-admin_activity_edit\";s:43:\"hBKhbelvZRTmoRwLhzPr_gRoCLuS4sVZjRU-MA6Y4UA\";}_sf2_meta|a:3:{s:1:\"u\";i:1775455243;s:1:\"c\";i:1775442444;s:1:\"l\";i:0;}',1775455243,1776060043),(_binary '52eujk7kdu2451e45sa67nl67r',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";}_sf2_meta|a:3:{s:1:\"u\";i:1774870082;s:1:\"c\";i:1774870082;s:1:\"l\";i:0;}',1774870082,1775474882),(_binary '56f045dtn7seao3tea6rgkggdr',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";s:24:\"_csrf/https-authenticate\";s:43:\"7yMk1IKbSVaV73rFPABaOYl-X-iMjJ9alIVsrEwTWPQ\";}_sf2_meta|a:3:{s:1:\"u\";i:1775017118;s:1:\"c\";i:1775017033;s:1:\"l\";i:0;}',1775017118,1775621918),(_binary '5ipojmmrq7s945h44mnevavatj',_binary '_sf2_attributes|a:6:{s:22:\"_security_secured_area\";s:1448:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:3;s:8:\"username\";s:22:\"hung.nguyen@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:22:\"hung.nguyen@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$VpzT4zN8Xckj/LWusCxbO.ziyBnSR7IspR4X1dRPiEn.4qqtS3QzG\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"9b457df9-733d-49ca-a485-43470290da5a\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:11:\"Hung NGUYEN\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:4:\"Hung\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:6:\"NGUYEN\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:22:\"hung.nguyen@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:22:\"hung.nguyen@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_f50738f8-06ea-442c-908f-7bd982d00c00\";}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"fkHCzEk0bSUOxttOttc3iWusnu0vJbwhQdWB08DsN7Q\";s:28:\"_csrf/https-datatable_update\";s:43:\"L7t2WVOKiB90Be7VKm6GdyZlKCX5Fym2987asNeAjm4\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"d_fp902MYd9NBGu8arORuHeiP49w9ep_LcnSeH4DQeU\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"RQQ4PixGbdbRurFEDyVYAMEEEvX6fRQtvf-7_sWo_Zs\";s:32:\"_csrf/https-timesheet_quick_edit\";s:43:\"N0bbqnL-BV9FFqO0_rcAv3u61JSjyEc4FFU2Nuh_kY4\";}_sf2_meta|a:3:{s:1:\"u\";i:1776151273;s:1:\"c\";i:1776151041;s:1:\"l\";i:0;}',1776151273,1776756073),(_binary '5p777el2vd9dg2bm4rnofsa1oh',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"rj_XOF2PBR4t61zJKZJGJfe9gY4a8q0yaLNwzFPxG9c\";}_sf2_meta|a:3:{s:1:\"u\";i:1775810400;s:1:\"c\";i:1775810400;s:1:\"l\";i:0;}',1775810400,1776415200),(_binary '5tjk6it9m4iuesesn7at946mvi',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"E-Qf23_EV8hGAXtXwbH0JQyTMNyGplnT61qWsJPGxck\";}_sf2_meta|a:3:{s:1:\"u\";i:1775443047;s:1:\"c\";i:1775443047;s:1:\"l\";i:0;}',1775443047,1776047847),(_binary '61qvvkmsd2cv74c1uk1v9jum9s',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:446:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:12;s:8:\"username\";s:23:\"baduy.nguyen@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:23:\"baduy.nguyen@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$UdMOLjNebHGuG1Kh/dghWObFClP26sjS3P8A6.BOOKMDCESG3SQwW\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"uL4WWgmqyzOSRlmnsfoyU1TPsYx5OjszmeayoAZLiMs\";s:28:\"_csrf/https-datatable_update\";s:43:\"mZdjDrqfrOXavw0myYh9Exq4xr8FnAjCluIEUhc2BK8\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"QyxJ8SoDZDkbuHD-adSw7psQdE8q-KLHRSbuyVMkJVQ\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"DhtO731uD9fzyHrX4Ybnb1f1LvY_oxCN-eAt2qoLpxI\";}_sf2_meta|a:3:{s:1:\"u\";i:1776074850;s:1:\"c\";i:1776074746;s:1:\"l\";i:0;}',1776074850,1776679650),(_binary '62el02gkm1656ptsf41047tesf',_binary '_sf2_attributes|a:5:{s:18:\"_csrf/https-search\";s:43:\"ZMOMWHEpejMffw1QTnfvVUxV3SgJmjp3jhLcu05Pwaw\";s:28:\"_csrf/https-datatable_update\";s:43:\"VoH2Ug6BCeczFw5rQ1MTR7VtrTL6fL8PtHiT_sCmQco\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"OA_R2wt1fhZkmxVhuAIBWyBAgXpdw-ioJbmr57NkL4g\";s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"1FUMAw5_6f30r3AXn5cYDep6vD7WHOhO-V0v5MM58fc\";}_sf2_meta|a:3:{s:1:\"u\";i:1775718820;s:1:\"c\";i:1775718734;s:1:\"l\";i:0;}',1775718820,1776323620),(_binary '63m0asmjr444uc45bdpg648l0g',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/dashboard/\";s:24:\"_csrf/https-authenticate\";s:43:\"jX8QDGYKrN2c706sg8-_dTTrsmc8cMycALRiw3eoJ6g\";}_sf2_meta|a:3:{s:1:\"u\";i:1775814765;s:1:\"c\";i:1775814760;s:1:\"l\";i:0;}',1775814765,1776419565),(_binary '6809o9rucue8bgskhmdiom2kgf',_binary '_sf2_attributes|a:7:{s:22:\"_security_secured_area\";s:1424:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"b1552955-2cbd-463a-94e5-8601b845170e\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:7:\"Duc CAO\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:3:\"Duc\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:3:\"CAO\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:18:\"duc.cao@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:18:\"duc.cao@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_c177dca7-98b6-47ee-9de3-622e953e0000\";}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:16:\"_csrf/https-form\";s:43:\"soRTTQJaAhgOMCmje98H4LWmiK7_XgzQgmagHuFBuss\";s:18:\"_csrf/https-search\";s:43:\"D-tSule-c95GMfKzAlK0NYrlWH9e2KoKFH5EwzQ04jo\";s:28:\"_csrf/https-datatable_update\";s:43:\"226a5wcfGQjR7wLvN0DABxbZfYElt4aqW_R0VejgVSI\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"mEQN_0ZeXylH-pkCqAquYxEVJDmaEeeoMOJjFhEakEM\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"kEU4uSMupK5K8JB7oe0OZMWVHNirA-h5vUaxtylZwsQ\";s:26:\"_csrf/https-public_holiday\";s:43:\"HluEJLwsWoA6fyaCKTp1AgBgo9Zgpp6Cim7bh4_yQ7s\";}_sf2_meta|a:3:{s:1:\"u\";i:1775031291;s:1:\"c\";i:1775017065;s:1:\"l\";i:0;}',1775031291,1775636091),(_binary '6bcou091jsr6h9l9mh0l6l5kti',_binary '_sf2_attributes|a:13:{s:22:\"_security_secured_area\";s:1504:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:9;s:8:\"username\";s:19:\"nhu.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"nhu.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$/Tv6jyHZwPnfoSTN.09bYOJPlh1O4/DjlPJMovAZyXNq8HfVPJjRq\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"cbb1b579-b18c-4da6-8529-a6a2c1540fbc\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:8:\"Nhu PHAM\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:3:\"Nhu\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:4:\"PHAM\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:19:\"nhu.pham@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:19:\"nhu.pham@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_d3191a86-4f05-4f98-80cd-1a3efd860c00\";}i:4;a:4:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";i:3;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"aTKa6S6bg5T2088GN2B0kqCQ7LHCK0ynD24YZW7yxg0\";s:28:\"_csrf/https-datatable_update\";s:43:\"Xkk_AcEeY16rrfC9e8r3zM_qEy_byac2lOrBRbtIr3w\";s:29:\"_csrf/https-edit_user_profile\";s:43:\"naG0XrcgQvIh07rTcoPAjwP_6nfch1K10xVvqmZcyG0\";s:33:\"_csrf/https-edit_user_preferences\";s:43:\"ZwRGZ96KxZC20J2oWLOstiYT52JxWYeJmVaNzb9qZzc\";s:36:\"_csrf/https-edit_user_password_token\";s:43:\"2S2IbFkh-pGG_VkxZrIYE3uvjaLX4x2HPNhki9Pgo7Y\";s:27:\"_csrf/https-edit_user_teams\";s:43:\"0f2eo5cia1ZtCppmfCoztf9-stT6EzXWN2jge6rgodw\";s:27:\"_csrf/https-edit_user_roles\";s:43:\"inWgZwnL3Lt87WtD6d5bl71d0orp642uth4gGKFd0vo\";s:30:\"_csrf/https-edit_user_contract\";s:43:\"dMAZvXf5QBjZz1CpyvzJocXbN1_7kWwwnub2vLgtcuY\";s:27:\"_csrf/https-admin_team_edit\";s:43:\"FxaRok5cwgyhHzfJld8MRQcvmaADm5GD58d2KsQneWs\";s:30:\"_csrf/https-team_customer_form\";s:43:\"Y-kQbMWmJ6Mtm88r5NZoEUHMs90ZU9TmpioXmjLj9cM\";s:29:\"_csrf/https-team_project_form\";s:43:\"2pzF2iRDyPiXTwXSWQ3Q8CdPUu094NK-LuyMu7JwDzg\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"n4pDXHEw56roUDjGb9gLhu8Dbhp0oZ_UinNVWkngsLA\";}_sf2_meta|a:3:{s:1:\"u\";i:1775029691;s:1:\"c\";i:1775029378;s:1:\"l\";i:0;}',1775029691,1775634491),(_binary '6e9ue18amd06qiq5tqh3lap3m1',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";}_sf2_meta|a:3:{s:1:\"u\";i:1775029179;s:1:\"c\";i:1775029179;s:1:\"l\";i:0;}',1775029179,1775633979),(_binary '6n43r0l2dd9tc73apad3v17h4r',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:15;s:8:\"username\";s:18:\"tu.tran@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"tu.tran@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$gd.vctpFhFU1AYFVdr2A3uP.Fue//1IvXyoo1IIZ3c5pKQzKF3EHO\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"J1F3-oG54Pu1249G7HAsRSv5FAvOZdY46Ao75-92TqY\";s:18:\"_csrf/https-search\";s:43:\"mLDX0OTekhwv7ot2bofdM7Ri3BlDgpmRjQql8FM1kAI\";s:28:\"_csrf/https-datatable_update\";s:43:\"CPwzNeLH6J7jLnBxGbXaf0JekLraRCashjbCOXeif0A\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"QJ98PPO03GbtOIfuV4zDGtXHE_301KQrIzaeWg9Q0XA\";}_sf2_meta|a:3:{s:1:\"u\";i:1775719089;s:1:\"c\";i:1775614207;s:1:\"l\";i:0;}',1775719089,1776323889),(_binary '6pko0f8p9eb87c7vq948irphc8',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";}_sf2_meta|a:3:{s:1:\"u\";i:1774869653;s:1:\"c\";i:1774869653;s:1:\"l\";i:0;}',1774869653,1775474453),(_binary '7sj2vobn0cbus27pco62pthmb5',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";}_sf2_meta|a:3:{s:1:\"u\";i:1776160148;s:1:\"c\";i:1776160148;s:1:\"l\";i:0;}',1776160148,1776764948),(_binary '83nctemgqcpmld679vtbq8a37m',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";s:24:\"_csrf/https-authenticate\";s:43:\"SL4ISZIV4apFMbp8kBVtncXTLAuVc3l5AQObu7kQs4g\";}_sf2_meta|a:3:{s:1:\"u\";i:1774872733;s:1:\"c\";i:1774872727;s:1:\"l\";i:0;}',1774872733,1775477533),(_binary '8a5s5ir19rs23riquse9ffvjcu',_binary '_sf2_attributes|a:7:{s:22:\"_security_secured_area\";s:393:\"O:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":3:{i:0;N;i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:13;s:8:\"username\";s:4:\"test\";s:7:\"enabled\";b:1;s:5:\"email\";s:21:\"tinyly90891@gmail.com\";s:8:\"password\";s:60:\"$2y$13$cYHZBgrDP9poKlv9oDa6gOo8MCXuX.u3JEQH/95JDEjxqBP.iAT3W\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:23:\"_security.last_username\";s:4:\"test\";s:18:\"_csrf/https-search\";s:43:\"pmtN-y8-w_fnsO9ltYz3H0ucWuyjkLnco7PoJDjvtL0\";s:28:\"_csrf/https-datatable_update\";s:43:\"v3V-NosHaEJY8zszblqGph3ZLkLGDCblMX7pIXvHH7U\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"VEZr6ZxdXpMmC03AOcuwgMir2qnFcG5COG0Aq_QGbzU\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"MEIppehcx-JJFrukfG5XKzd8avrceO3tknDxr75ljWQ\";s:19:\"_csrf/https-absence\";s:43:\"mi9OMVqCXqtO0WnswlZax4gGNThQAWETpHKTy5VP4Dw\";}_sf2_meta|a:3:{s:1:\"u\";i:1774870117;s:1:\"c\";i:1774869696;s:1:\"l\";i:0;}',1774870117,1775474917),(_binary '8f6shqlbm5krlaf6i4v0n9tcqp',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";s:24:\"_csrf/https-authenticate\";s:43:\"Fpn80Dr6deXvALbnJlWgq2moZNYe4uY4wRhailUYi1I\";}_sf2_meta|a:3:{s:1:\"u\";i:1775029191;s:1:\"c\";i:1775029190;s:1:\"l\";i:0;}',1775029191,1775633991),(_binary '8jb65amneaao79e2b8sv9qotoe',_binary '_sf2_attributes|a:14:{s:18:\"_csrf/https-search\";s:43:\"-mH_eelNZ5ZAJMoozHgQW9NmG-XOjk-InoU_eOUjDIc\";s:28:\"_csrf/https-datatable_update\";s:43:\"ADeYPkA99iwRkqk2Rx1A9vErUjLHCPPvmpDjOiKpRsM\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"Ui5fIW0OhGUwgAErBGVHQdJ4g6-szmUtg8ey7-eUK9M\";s:22:\"_security_secured_area\";s:512:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:9;s:8:\"username\";s:19:\"nhu.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"nhu.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$/Tv6jyHZwPnfoSTN.09bYOJPlh1O4/DjlPJMovAZyXNq8HfVPJjRq\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:4:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";i:3;s:9:\"ROLE_USER\";}}}\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"xqVzcLgga8ZIztELoMPtB_aqEZKVeF0GMWD_T-9Ho9A\";s:19:\"_csrf/https-absence\";s:43:\"xvCFCVUSi9w1ZBy4ZD5fvBCZc3odatg-JAmSXGzqu0U\";s:30:\"_csrf/https-absence_withdraw_2\";s:43:\"2aeYfkFqB8pqgUAK6jf6m5-F7c8QWRSXcyETZveqXlY\";s:28:\"_csrf/https-absence_delete_2\";s:43:\"azSwQExmRoBkggCOkFAgh1OQB5HcN1aFhaNd86o8IMA\";s:29:\"_csrf/https-absence_approve_2\";s:43:\"NTKutoErI6ImVBN9VfHvsw5rpzbQQxifxN7Q2xzBhWg\";s:28:\"_csrf/https-absence_reject_2\";s:43:\"ieM_wo0trUXYQrMYQnZ-HPiqIy2fALQa9wuJMqXXCqI\";s:28:\"_csrf/https-absence_delete_3\";s:43:\"1ChNgnkT1-CYG7vKJCdg_upzGHS25QuWz_Zzx2CVACk\";s:28:\"_csrf/https-absence_delete_1\";s:43:\"PnLpp0o4aQMlqdUnQz3VgsV3pRozjqfp59uYKGEDVi4\";s:34:\"_security.secured_area.target_path\";s:38:\"https://time.cosigma.io/en/admin/user/\";s:24:\"_csrf/https-authenticate\";s:43:\"S1u9m9WQjWut16B9lMKbAm9PIsxz5vEjEKKZUkQNbY0\";}_sf2_meta|a:3:{s:1:\"u\";i:1775638883;s:1:\"c\";i:1775547638;s:1:\"l\";i:0;}',1775638883,1776243683),(_binary '8o58kt42lim0qm4ucmjcgbo305',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:446:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:12;s:8:\"username\";s:23:\"baduy.nguyen@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:23:\"baduy.nguyen@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$UdMOLjNebHGuG1Kh/dghWObFClP26sjS3P8A6.BOOKMDCESG3SQwW\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"qSBsJBGLc5P1SlT1VuCX2xOWRtGyryx0elVVgQvbhJI\";s:28:\"_csrf/https-datatable_update\";s:43:\"SGn-SU0U5WBcZm8XvZ8fM65b4MOU8G6uGa21VImEWWw\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"kofV8-hd_QA1V_cbAQCkdY1Szu4WTSqx2U0OK2rmJiI\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"LXo4UU5E0CENVwX9Z4hHazciMPn0nk33Jz5ZScSrDzE\";}_sf2_meta|a:3:{s:1:\"u\";i:1774955353;s:1:\"c\";i:1774955206;s:1:\"l\";i:0;}',1774955353,1775560153),(_binary '8p1rtlsohgbrmmc1mv8lg6do1b',_binary '_sf2_attributes|a:6:{s:22:\"_security_secured_area\";s:446:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:12;s:8:\"username\";s:23:\"baduy.nguyen@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:23:\"baduy.nguyen@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$UdMOLjNebHGuG1Kh/dghWObFClP26sjS3P8A6.BOOKMDCESG3SQwW\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"ELz4vOC2ObNYy2UneKqpwJ0wlujrneKsETFXugnmqVo\";s:28:\"_csrf/https-datatable_update\";s:43:\"ZoKYlDmEkwjzle-ew1qHqvvJthQwJL086tyYLwlwYog\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"1G42c26Q4EOUJGCGeakcW7T5NqKp7nRGMuzk4bfAkxs\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"XSqEzltX5R6DLuqLUOZWhuhIFKNlZthWxFcyTyDA74Q\";s:32:\"_csrf/https-timesheet_quick_edit\";s:43:\"c3q_yaPQb6wsI5HNN9vCLzOK_riFETyNC9DMso_9bTg\";}_sf2_meta|a:3:{s:1:\"u\";i:1775633899;s:1:\"c\";i:1775633727;s:1:\"l\";i:0;}',1775633899,1776238699),(_binary '8qk6t5lhg33o44n28o21m1t7k8',_binary '_sf2_attributes|a:6:{s:18:\"_csrf/https-search\";s:43:\"YW3ARiTlUf6OysBezrT-Mwz5RXaD7mec8Hn5qsAFC-0\";s:28:\"_csrf/https-datatable_update\";s:43:\"gkw8WwRajkeGk4paSQC_Ld8s720zokS8Qnn1kwa-tSs\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"JPPEWO5PvLi1Acc0M-TRP1i7zNeb-nAGQduqhS1Clxs\";s:22:\"_security_secured_area\";s:437:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:4;s:8:\"username\";s:19:\"hoang.vu@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"hoang.vu@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$ruTDOzYmGbW16JUxk9rA2uD4kpcVs.suYreFn7CIGe9u8mOw4wjfq\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:32:\"_csrf/https-timesheet_quick_edit\";s:43:\"0snSkjNoB-Z93-acxKTO8iU3fxB_puVmXQAX69YnOKE\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"fBywbZShKMLjgviwQgedUjZ0JJ75j8f-Fr9HnsO8c5k\";}_sf2_meta|a:3:{s:1:\"u\";i:1776065174;s:1:\"c\";i:1776048718;s:1:\"l\";i:0;}',1776065174,1776669974),(_binary '97ebp752q2goovfqv6dcmqu5ui',_binary '_sf2_attributes|a:5:{s:24:\"_csrf/https-authenticate\";s:43:\"qX119ssR8bXyVf7OXHO1zI644ewuZejjzVSp7hKNbak\";s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"l26gTRuI2yRUJXJe50sj3SebLJ17SEimskObW-TRwMI\";s:28:\"_csrf/https-datatable_update\";s:43:\"u-7QTQKjSStAZDGhX7plv0j1lD6qVbqhzYA0tehYX0U\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"0HhGNWJHqQt0T5wmqdnIPP9IaDYF_OTTLNkwoDuR_Bo\";}_sf2_meta|a:3:{s:1:\"u\";i:1775747648;s:1:\"c\";i:1775747534;s:1:\"l\";i:0;}',1775747648,1776352448),(_binary '991cmrkliqaj6fpdn2i9d418cf',_binary '_sf2_attributes|a:4:{s:18:\"_csrf/https-search\";s:43:\"CgbZSqC9SosZZMqmu6k5CsooB-pOmtpl_XINxM88sf0\";s:28:\"_csrf/https-datatable_update\";s:43:\"YZTxx-wtPu577fw5DvAzXWfeeD_Y9uqyAsEWL3Iwww0\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"5fkpLef1SnjbURmZOCzphKSsSRW5CVU3EUzv-Q_beUQ\";s:22:\"_security_secured_area\";s:512:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:9;s:8:\"username\";s:19:\"nhu.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"nhu.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$/Tv6jyHZwPnfoSTN.09bYOJPlh1O4/DjlPJMovAZyXNq8HfVPJjRq\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:4:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";i:3;s:9:\"ROLE_USER\";}}}\";}_sf2_meta|a:3:{s:1:\"u\";i:1776055070;s:1:\"c\";i:1776055044;s:1:\"l\";i:0;}',1776055070,1776659870),(_binary '9gnkc14tuj14a1vmei1jq4f2vi',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"Ii3yAj-TxfbqDncz4-UboLfnHTBGN8t_D2ebM8Fs2CM\";}_sf2_meta|a:3:{s:1:\"u\";i:1774869653;s:1:\"c\";i:1774869653;s:1:\"l\";i:0;}',1774869653,1775474453),(_binary '9qnojevcorm6qbng4m1mr069o4',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";s:24:\"_csrf/https-authenticate\";s:43:\"zIxNl-lxPffaHb3jxSK86XZDQv-bLRgvJ6o_1HxeV7M\";}_sf2_meta|a:3:{s:1:\"u\";i:1775491993;s:1:\"c\";i:1775468444;s:1:\"l\";i:0;}',1775491993,1776096793),(_binary 'a0jo629oteppj2e68m1g5oi5qt',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";}_sf2_meta|a:3:{s:1:\"u\";i:1776137598;s:1:\"c\";i:1776137598;s:1:\"l\";i:0;}',1776137598,1776742398),(_binary 'a39j400josvda2hu9gnehf4cdb',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";}_sf2_meta|a:3:{s:1:\"u\";i:1775343899;s:1:\"c\";i:1775343899;s:1:\"l\";i:0;}',1775343899,1775948699),(_binary 'abthcg56ka343f0l7c4hclka7c',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";s:24:\"_csrf/https-authenticate\";s:43:\"bBvSgzRSEzu2TMAwQEi6dIMdWfLO1LxhFgDECV3WPEk\";}_sf2_meta|a:3:{s:1:\"u\";i:1775007136;s:1:\"c\";i:1775005848;s:1:\"l\";i:0;}',1775007136,1775611936),(_binary 'ae2ndo5qaq1cmh98g3r8rl6vek',_binary '_sf2_attributes|a:7:{s:18:\"_csrf/https-search\";s:43:\"Ht02sD0PIdZJzxGk5gEbs3m_EHRZz_e1pM_WEdwULFA\";s:28:\"_csrf/https-datatable_update\";s:43:\"T7a6Ga0DsykjnG4rZ5iaTphfL5E9oxBWI8mMXKNHTsE\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"kgZQheTFCLVWJ4MHF7I5tlgrBFROfagfS3kejgS5iDg\";s:22:\"_security_secured_area\";s:512:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:9;s:8:\"username\";s:19:\"nhu.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"nhu.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$/Tv6jyHZwPnfoSTN.09bYOJPlh1O4/DjlPJMovAZyXNq8HfVPJjRq\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:4:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";i:3;s:9:\"ROLE_USER\";}}}\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"P1c2iT4H6fQDAyXDZGC_GaRYgz4BXUgetLgkatPLiSc\";s:34:\"_security.secured_area.target_path\";s:38:\"https://time.cosigma.io/en/admin/user/\";s:24:\"_csrf/https-authenticate\";s:43:\"be8QPcdyGaCki83NljRagsrxNaRdBpH-n56ao9Ll4Aw\";}_sf2_meta|a:3:{s:1:\"u\";i:1775029377;s:1:\"c\";i:1775029158;s:1:\"l\";i:0;}',1775029377,1775634177),(_binary 'af8e07rjri06rn61ptu1s621oh',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";s:24:\"_csrf/https-authenticate\";s:43:\"0BVQsnqR4ZCnJbA2bSytRFNLiTiaheCQmj2_-U9SuYs\";}_sf2_meta|a:3:{s:1:\"u\";i:1776064867;s:1:\"c\";i:1776064857;s:1:\"l\";i:0;}',1776064867,1776669667),(_binary 'an0plrrnggi09n5mekabbnrr69',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"pGUXOg_z_m-ODgq7tdloeZHyDdcrNnm9BoKK1JRAd4k\";}_sf2_meta|a:3:{s:1:\"u\";i:1776137599;s:1:\"c\";i:1776137599;s:1:\"l\";i:0;}',1776137599,1776742399),(_binary 'asf66eke2ou2rn8sqknomivcqa',_binary '_sf2_attributes|a:6:{s:22:\"_security_secured_area\";s:1424:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"b1552955-2cbd-463a-94e5-8601b845170e\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:7:\"Duc CAO\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:3:\"Duc\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:3:\"CAO\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:18:\"duc.cao@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:18:\"duc.cao@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_52e67c72-1546-43dd-8ae3-d625a7fa1700\";}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"VQa-4WNj5LwObdc8G6J9NXli2VFGsuHgcpBgju_C8DA\";s:28:\"_csrf/https-datatable_update\";s:43:\"Ic7ySgbOCI6v2M5GYSoemZndqlC7LTPaC0ONlHfWaMg\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"5qpFVrjIn9WAEuJCKQGxDGYa-SbUaDgy4GN3f2TJ6Nc\";s:33:\"_csrf/https-edit_user_preferences\";s:43:\"Zzckw3-r1ITdlCFV1tSCtrJMkqcNJJOfQyQekRlKcJM\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"vINqZxPqODlDo_uqcWG-5-H67ofZI2I_awvsh4NEeYs\";}_sf2_meta|a:3:{s:1:\"u\";i:1776156204;s:1:\"c\";i:1776141320;s:1:\"l\";i:0;}',1776156204,1776761004),(_binary 'at6fnklohpgrdprqiik69idfvb',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"sMrqWl8DJ-yFs28kE2FolWUnTUo4c_z5-wGSCm157Q4\";}_sf2_meta|a:3:{s:1:\"u\";i:1774870083;s:1:\"c\";i:1774870083;s:1:\"l\";i:0;}',1774870083,1775474883),(_binary 'bhasnqtc12aubu3fchlila7mnp',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";}_sf2_meta|a:3:{s:1:\"u\";i:1775547583;s:1:\"c\";i:1775547583;s:1:\"l\";i:0;}',1775547583,1776152383),(_binary 'bt9i8p7ajl8g758peobcv5eh1d',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"WlFVzsDz31II1u6qhzWIsxeYd2eTBh_lQLGUUGWZ5dw\";}_sf2_meta|a:3:{s:1:\"u\";i:1776137600;s:1:\"c\";i:1776137600;s:1:\"l\";i:0;}',1776137600,1776742400),(_binary 'bu0dmvbkuv0m8fbihk82sqsfe6',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:1424:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:15;s:8:\"username\";s:18:\"tu.tran@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"tu.tran@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$gd.vctpFhFU1AYFVdr2A3uP.Fue//1IvXyoo1IIZ3c5pKQzKF3EHO\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"98b80853-096a-4cae-aaef-90bfa6e35456\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:7:\"Tu TRAN\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:2:\"Tu\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:4:\"TRAN\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:18:\"tu.tran@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:18:\"tu.tran@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_44998559-df26-49f1-b3e1-1a8895025300\";}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"YD_kAEA1vwqA49uDemIO7sCyw7J7iI_UxckwoqAZ2JE\";s:18:\"_csrf/https-search\";s:43:\"kNUQthPxun6XQPKwlKz5gHlhtggDVoAiomnQ8WOozP8\";s:28:\"_csrf/https-datatable_update\";s:43:\"gTtpjMDKkmOwZWp35dUxUGPcaPym-wp0cg3oIVUzKA8\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"ppojg_bKpQXUWjramoOLUl-bMA6R2CehX_lORnAaYQQ\";}_sf2_meta|a:3:{s:1:\"u\";i:1776052835;s:1:\"c\";i:1776052803;s:1:\"l\";i:0;}',1776052835,1776657635),(_binary 'cfat35k45dgba0pmaslu18j2ka',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:1448:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:3;s:8:\"username\";s:22:\"hung.nguyen@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:22:\"hung.nguyen@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$VpzT4zN8Xckj/LWusCxbO.ziyBnSR7IspR4X1dRPiEn.4qqtS3QzG\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"9b457df9-733d-49ca-a485-43470290da5a\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:11:\"Hung NGUYEN\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:4:\"Hung\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:6:\"NGUYEN\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:22:\"hung.nguyen@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:22:\"hung.nguyen@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_46e7f6dd-8062-4d80-834e-1fa80c4f7000\";}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"LmFVm-IvZR48DunZq3_lSWJAzydvkSTb8OT2EwTvRtc\";s:28:\"_csrf/https-datatable_update\";s:43:\"cHiTBbwVmo4pWyfyWzAF9pF9jgHXLv7cXtMFvq84tS4\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"xnwb3qVJGNT-xDBZJKJ-Rw9TZdukmjsHCQ3KZwh6gaw\";s:32:\"_csrf/https-timesheet_quick_edit\";s:43:\"jPb9WxGlR6b_JKKpOqLbqkNDHTIti9kxBylsCpnJGnA\";}_sf2_meta|a:3:{s:1:\"u\";i:1774872789;s:1:\"c\";i:1774872743;s:1:\"l\";i:0;}',1774872789,1775477589),(_binary 'crg507mgehgmt8oe14jilns80a',_binary '_sf2_attributes|a:7:{s:22:\"_security_secured_area\";s:1504:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:9;s:8:\"username\";s:19:\"nhu.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"nhu.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$/Tv6jyHZwPnfoSTN.09bYOJPlh1O4/DjlPJMovAZyXNq8HfVPJjRq\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"cbb1b579-b18c-4da6-8529-a6a2c1540fbc\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:8:\"Nhu PHAM\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:3:\"Nhu\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:4:\"PHAM\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:19:\"nhu.pham@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:19:\"nhu.pham@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_74893a44-de0f-4692-a67d-c2adbb7c0900\";}i:4;a:4:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";i:3;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"g7Efxiud7FLvQ5HKhtzDhWWQaMssVW1M4ACmJVZZFlg\";s:28:\"_csrf/https-datatable_update\";s:43:\"UjS0RHwt_pOoR_nHF96TjALNGanPEk0xLST5Pq5jlls\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"UY72qSVHXrxzNpx_Ct2Kx-ezb9AkNbP4OeRptoaajkU\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"84shLN06RukNH6Y8aAS66vGzGp-KUuT4fURzf8eLJjU\";s:33:\"_csrf/https-edit_user_preferences\";s:43:\"45EcNxSctNry44ZIEUoxJPZCnKCWXofSiPXjxE0567Q\";s:34:\"_csrf/https-admin_invoice_template\";s:43:\"0fXe8sS_r24tsb23W5zRFm4OijS3c1zjuODmDcsvnN4\";}_sf2_meta|a:3:{s:1:\"u\";i:1775741286;s:1:\"c\";i:1775638884;s:1:\"l\";i:0;}',1775741286,1776346086),(_binary 'dbbb8eihb9pg6oeq347nagt2j3',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"obElrGpId3I_ivtQwT49TjKIokzfaflK3PIYzmWIwBE\";}_sf2_meta|a:3:{s:1:\"u\";i:1775996842;s:1:\"c\";i:1775996842;s:1:\"l\";i:0;}',1775996842,1776601642),(_binary 'djclcuretgdi2fji3ah6ibg6gb',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";s:24:\"_csrf/https-authenticate\";s:43:\"VkI2uLtrFeM57vAhsbeOe8ScQpz_v0MpvjgB-kbx9rQ\";}_sf2_meta|a:3:{s:1:\"u\";i:1774872742;s:1:\"c\";i:1774872720;s:1:\"l\";i:0;}',1774872742,1775477542),(_binary 'dtn3ll0t3ore8p60g96klphc3i',_binary '_sf2_attributes|a:2:{s:23:\"_security.last_username\";s:4:\"test\";s:24:\"_csrf/https-authenticate\";s:43:\"kMzBC8EjQb5s5PiGudkmkyAnh__RhqeRHAMG2AEz62Q\";}_sf2_meta|a:3:{s:1:\"u\";i:1775220049;s:1:\"c\";i:1775220049;s:1:\"l\";i:0;}',1775220049,1775824849),(_binary 'duqigkm5jqdk01pm9095n5i1us',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";s:24:\"_csrf/https-authenticate\";s:43:\"w4STped9d_CXFPEOy17AFCbr3kQriq8RBe7ANdHocxs\";}_sf2_meta|a:3:{s:1:\"u\";i:1775831133;s:1:\"c\";i:1775831129;s:1:\"l\";i:0;}',1775831133,1776435933),(_binary 'e82iipeimmj1uvq3if9h6bda4k',_binary '_sf2_attributes|a:4:{s:18:\"_csrf/https-search\";s:43:\"LUTLsyO1qlZa6LvQd7pd7Tws2lIfrcWQE-RfvMLmXxA\";s:28:\"_csrf/https-datatable_update\";s:43:\"PuBmB6yYNPf14--qnMnTh-Bno3NiaSBOv8pbdrysJow\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"fXFss9LtKyTqt31XFOIaee2qUHUKhtvAp72ICxB95w4\";s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";}_sf2_meta|a:3:{s:1:\"u\";i:1775213862;s:1:\"c\";i:1775213862;s:1:\"l\";i:0;}',1775213862,1775818662),(_binary 'echf8ldnvagvrbjpj6pspsqe44',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"RSOHyAdbJVHoP8L8Ic6sDhg5loEiTDIGMcbjFjbpINk\";}_sf2_meta|a:3:{s:1:\"u\";i:1776162430;s:1:\"c\";i:1776162430;s:1:\"l\";i:0;}',1776162430,1776767230),(_binary 'ee3qtqbmgq44osqd0lncu7j3kp',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";s:24:\"_csrf/https-authenticate\";s:43:\"DnWga5ei8vwGPSMsQweooLh4uR9aOpNyg0N_6lUQxWE\";}_sf2_meta|a:3:{s:1:\"u\";i:1775268073;s:1:\"c\";i:1775268073;s:1:\"l\";i:0;}',1775268073,1775872873),(_binary 'eed28afisirq3dlabl882tomsj',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"6pgPkQDxinI3w6cH60XdCRIY04_qvXhAXpZ7gBxnggI\";}_sf2_meta|a:3:{s:1:\"u\";i:1775017063;s:1:\"c\";i:1775017053;s:1:\"l\";i:0;}',1775017063,1775621863),(_binary 'f02ub5omh5b8gnvsdbcq12360d',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:446:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:12;s:8:\"username\";s:23:\"baduy.nguyen@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:23:\"baduy.nguyen@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$UdMOLjNebHGuG1Kh/dghWObFClP26sjS3P8A6.BOOKMDCESG3SQwW\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"cDzS8-5EhkO4SDmSe_G8JI_TSY4yKvVgsZnTThN3rTA\";s:28:\"_csrf/https-datatable_update\";s:43:\"wABccmQWXSuPD8FMMPHImNXHd5DGKxeli5N87fvvqHk\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"ciaBR0ijicOUYunL2eLXO2J5owbUWVo99BL5kvfcXqE\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"52KxwYKyEYJtgyOxF0isEw5NAAckKdNeqNolX1bGuiw\";}_sf2_meta|a:3:{s:1:\"u\";i:1775540315;s:1:\"c\";i:1775538940;s:1:\"l\";i:0;}',1775540315,1776145115),(_binary 'fbq59khsc68qna3dbb51quhj3k',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";}_sf2_meta|a:3:{s:1:\"u\";i:1775443047;s:1:\"c\";i:1775443047;s:1:\"l\";i:0;}',1775443047,1776047847),(_binary 'g5meic6ojbgdhcjepl9jh9l232',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:15;s:8:\"username\";s:18:\"tu.tran@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"tu.tran@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$gd.vctpFhFU1AYFVdr2A3uP.Fue//1IvXyoo1IIZ3c5pKQzKF3EHO\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"sDlkQ9gIhrru4ifd0AHFRcV_u_XEhqols5Pde3QSIzE\";s:18:\"_csrf/https-search\";s:43:\"DLtrHA0HPbFM5s9Mc_UgonwNQzSSg45Hr-mZtQ5I9_g\";s:28:\"_csrf/https-datatable_update\";s:43:\"Oin84W2x8TnTezuzK0gbT-uv35tngacGvHMxz0Pb6uE\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"DS8lUJ-rvAk0otwOEolNsVvN3bfOqaLbO_DS25QnJBE\";}_sf2_meta|a:3:{s:1:\"u\";i:1775535222;s:1:\"c\";i:1775535182;s:1:\"l\";i:0;}',1775535222,1776140022),(_binary 'g8uuapo01kbb5lo2h5ru2p2jj3',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"YDcDT_i6vBNeub-Likn-H6WdA3JUs95jBieF_C2YiZw\";}_sf2_meta|a:3:{s:1:\"u\";i:1775029179;s:1:\"c\";i:1775029179;s:1:\"l\";i:0;}',1775029179,1775633979),(_binary 'gctpd4mm2llgm7bal3r2tbls9j',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"hdS8NO3YDiXWeGpOd4I2UYjsskIFf6cySMMRnoD29Mk\";}_sf2_meta|a:3:{s:1:\"u\";i:1775017041;s:1:\"c\";i:1775017041;s:1:\"l\";i:0;}',1775017041,1775621841),(_binary 'glvo7dg1afm8d7qh40gcdmeqlc',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";s:24:\"_csrf/https-authenticate\";s:43:\"Zo1ZnwrtE-5YW3S-qCWwodtpWPE9DVKtDZGeP7qCDW0\";}_sf2_meta|a:3:{s:1:\"u\";i:1775010201;s:1:\"c\";i:1775010198;s:1:\"l\";i:0;}',1775010201,1775615001),(_binary 'gmsfmrkj3pfgv9ngnluv73ph69',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"zEzrom_0GORWUkAuWkB2N_JwPguNhlZnp0rlb3BNRmA\";}_sf2_meta|a:3:{s:1:\"u\";i:1775312232;s:1:\"c\";i:1775312232;s:1:\"l\";i:0;}',1775312232,1775917032),(_binary 'h6takn12terve9v53dfrjkmhum',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:446:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:12;s:8:\"username\";s:23:\"baduy.nguyen@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:23:\"baduy.nguyen@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$UdMOLjNebHGuG1Kh/dghWObFClP26sjS3P8A6.BOOKMDCESG3SQwW\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"YJjYr9JrRjq2iF76vyZwoIpOkQs0-Aq5GK4JEHjw0A8\";s:28:\"_csrf/https-datatable_update\";s:43:\"kCx-9JPhh1T2Emv3CYrqq4nN7_0OXTOQqJ-OhShN6q4\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"31CenmNtogfEAZZ0qLzEqBjcruEEWT_0wdfcVnvc-Po\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"dixVBVuXSUg3O9bCca6XjnWOpTeHTOvUM0hGN0vWbyk\";}_sf2_meta|a:3:{s:1:\"u\";i:1775034735;s:1:\"c\";i:1775034600;s:1:\"l\";i:0;}',1775034735,1775639535),(_binary 'hajclifcep5r03fl58m4pm7gk7',_binary '_sf2_attributes|a:5:{s:18:\"_csrf/https-search\";s:43:\"1lAzy7p8VoDq6dAdLtvpHjV7MS6u5B-zD7Xk2ciKMLo\";s:28:\"_csrf/https-datatable_update\";s:43:\"BY_RQok_4bZUHzSnA0SEDDAHvXzNpFk2hZsFYPAqunk\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"EEK8WyzMaLWUka67WRor76Qyn6sA6qydPLZsfwTYnVg\";s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"bjXfgw405ML9MRHU8QbXiwS98KoPfmMULoicYWDXGrM\";}_sf2_meta|a:3:{s:1:\"u\";i:1775541740;s:1:\"c\";i:1775541670;s:1:\"l\";i:0;}',1775541740,1776146540),(_binary 'hjjp9qjrprgv222bfd9ts4p0j2',_binary '_sf2_attributes|a:7:{s:22:\"_security_secured_area\";s:1578:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:2;s:8:\"username\";s:21:\"hai.nguyen@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:21:\"hai.nguyen@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$VDfmpoXTGEJeHxBgmHXegu/.2oGMrK0Kj9RLoHLA8W04mg6Iiy5jq\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"97fb4104-376b-478d-bd5e-d0056cc14a48\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:10:\"Hai NGUYEN\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:2:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";i:1;s:49:\"http://schemas.microsoft.com/claims/multipleauthn\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:3:\"Hai\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:6:\"NGUYEN\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:21:\"hai.nguyen@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:21:\"hai.nguyen@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_dab7841c-8385-408f-a990-ea057afb0400\";}i:4;a:4:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";i:3;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"j5TxMUY0vM5mlrr4dEi9oIFX4yiAPyTIw9oEkoCNrHE\";s:28:\"_csrf/https-datatable_update\";s:43:\"ss1rahh2zxYGR3gU8YvghvL9tCyHudhrfjlNYKi6Dok\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"ApwMj8zlNwY7JkrCa8zsrCTKUROtZrOIm5oULTznrdE\";s:19:\"_csrf/https-absence\";s:43:\"ipKVofXSDQ8pAx0_Ee0t2970gWog4XrKhFnE4wI_T9A\";s:28:\"_csrf/https-absence_delete_1\";s:43:\"jTrHW7vAfv6aBLQW7CSDI0PBYl1gDhOKLC75iCl5H4k\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"5OkFGta_7C7OaTXi3Y-_PldySBiqyV10kulupRQXzsI\";}_sf2_meta|a:3:{s:1:\"u\";i:1775638911;s:1:\"c\";i:1775010206;s:1:\"l\";i:0;}',1775638911,1776243711),(_binary 'hmtf8pqaf34lkc8m1glh4gsjue',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"5khA9LKZrAMllSJwjB0QpZsV5n6j9FwTXB-U4B7J_VM\";}_sf2_meta|a:3:{s:1:\"u\";i:1776137598;s:1:\"c\";i:1776137598;s:1:\"l\";i:0;}',1776137598,1776742398),(_binary 'i0k5aq3s8n9hakfrsonsrh8br5',_binary '_sf2_attributes|a:16:{s:22:\"_security_secured_area\";s:489:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:10;s:8:\"username\";s:21:\"chau.hoang@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:21:\"chau.hoang@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$NK1G2nIcDVblgQ9/o5zO4eIYdW6B7aUlQds9DLzPMIIxk.pT2s4ve\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:3:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"22YfuEFWViWPuRPSHuyozTfQN70trLNLOi0cQ13WtME\";s:28:\"_csrf/https-datatable_update\";s:43:\"0ugyJSfoYEMisPHoVpXtYe5ReRb3FpnYeUrFZg9U4Dc\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"P2MAHdmWAvuD8v8daphLHTSnx-e8693RQ4HabcxXaRY\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"W4fxQ1An3JCob9zgjr5yuccnINfK5-vuSdfvCvgcJrQ\";s:19:\"_csrf/https-absence\";s:43:\"RM_RRteWQoYSVhxcvcLjs62XziIh27kL0IhdhsetSE8\";s:30:\"_csrf/https-absence_withdraw_4\";s:43:\"2Lnt9wtQFlAfZcfG6haFqSeYQsz7qpGrLI2VykgZFFQ\";s:28:\"_csrf/https-absence_delete_4\";s:43:\"7x_MBmsPDbyYpi8zqYmt8GBV2nYavw0xJA86b3-1_jA\";s:28:\"_csrf/https-absence_delete_2\";s:43:\"iEgbId9lBSpxUy2VhEuZ1PmSaelqEXDQ0bYx5E40jtA\";s:28:\"_csrf/https-absence_delete_1\";s:43:\"xIIPsV304vfwzrwVG_hXht7z-nxUNCTFhW35FCgfcZ4\";s:30:\"_csrf/https-absence_withdraw_5\";s:43:\"PXGbIgI7RLNDxxu7RovY2pW-yp7CjfF-VHEkYXUjBEQ\";s:28:\"_csrf/https-absence_delete_5\";s:43:\"8pUzR2tPy4bAMwolVwj95rq7zpMjJ1iiOqJ1ZlwOgdY\";s:30:\"_csrf/https-absence_withdraw_6\";s:43:\"zImuJEzqohzCzsVz-QDrtwQuXNyu-umJj_pn4xa7kWY\";s:28:\"_csrf/https-absence_delete_6\";s:43:\"YGJ5TW47kwCRGAySw8df_vOdyI5FaeZINaGOlLOzpqo\";s:30:\"_csrf/https-absence_withdraw_7\";s:43:\"-lsE-fSePkTtOmY_irjpjAqNIOcs6fly5iS4q-oqAoA\";s:28:\"_csrf/https-absence_delete_7\";s:43:\"XUziiiRp-Y0-KByfLfF910-aM9XtJR9yKSXnPC-jKuc\";}_sf2_meta|a:3:{s:1:\"u\";i:1775808897;s:1:\"c\";i:1775808603;s:1:\"l\";i:0;}',1775808897,1776413697),(_binary 'i80a21c0jghhud29viifiom28q',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";s:24:\"_csrf/https-authenticate\";s:43:\"R36A87BfOUZbFRyiNJt_oC0dRKju2A30C0vc7wzuJXA\";}_sf2_meta|a:3:{s:1:\"u\";i:1775477353;s:1:\"c\";i:1775477349;s:1:\"l\";i:0;}',1775477353,1776082153),(_binary 'it961sp71tpugvu8g1scrogo9q',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"ZZ5UnpwU_D2Gx327meLziKdtgc34kejFo6d-tlAxpe0\";}_sf2_meta|a:3:{s:1:\"u\";i:1775077385;s:1:\"c\";i:1775077385;s:1:\"l\";i:0;}',1775077385,1775682185),(_binary 'iusjd8vg841g7o6iq8svtum7dk',_binary '_sf2_attributes|a:4:{s:18:\"_csrf/https-search\";s:43:\"0w2Mr15OF8Adbourdl0IrwJlVfye06I9BAtul2FM35c\";s:28:\"_csrf/https-datatable_update\";s:43:\"JkzMhl01xnSCk24uDCh0qmQ9nmrBTnSj6DTii19o6ZI\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"S1HrPEZmiFdjGaGVGek15jcABvgPE4GnPPiGUTcB9uw\";s:22:\"_security_secured_area\";s:512:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:9;s:8:\"username\";s:19:\"nhu.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"nhu.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$/Tv6jyHZwPnfoSTN.09bYOJPlh1O4/DjlPJMovAZyXNq8HfVPJjRq\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:4:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";i:3;s:9:\"ROLE_USER\";}}}\";}_sf2_meta|a:3:{s:1:\"u\";i:1775806130;s:1:\"c\";i:1775806130;s:1:\"l\";i:0;}',1775806130,1776410930),(_binary 'ivj57cg3eaafie7l6epjl2g3nd',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";}_sf2_meta|a:3:{s:1:\"u\";i:1775657714;s:1:\"c\";i:1775657714;s:1:\"l\";i:0;}',1775657714,1776262514),(_binary 'j0t2chu7n2db1to4oar8t4d4i5',_binary '_sf2_attributes|a:7:{s:23:\"_security.last_username\";s:4:\"test\";s:22:\"_security_secured_area\";s:393:\"O:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":3:{i:0;N;i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:13;s:8:\"username\";s:4:\"test\";s:7:\"enabled\";b:1;s:5:\"email\";s:21:\"tinyly90891@gmail.com\";s:8:\"password\";s:60:\"$2y$13$cYHZBgrDP9poKlv9oDa6gOo8MCXuX.u3JEQH/95JDEjxqBP.iAT3W\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:16:\"_csrf/https-form\";s:43:\"RMby0SuTxIdbfyO0nyKyFeY_F6YeFoRjGUVjMpafTj8\";s:18:\"_csrf/https-search\";s:43:\"VpWs7uV23rkSRCQ8gzY6v1hngA-tuN2M_pUE0rbw7jI\";s:28:\"_csrf/https-datatable_update\";s:43:\"c-DHOylBY5r_GDIAfhuXeMCNXBzD3ID09Gk3Id_2s9M\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"mAdzC3LT8fnbFmwpAqGH2WF-xL_WJlLsTP0uKGMqoik\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"QYeeIE4DmK_Rvt-ZqakLHtNh9TXQk8-E-I6Rrus_f_0\";}_sf2_meta|a:3:{s:1:\"u\";i:1774869639;s:1:\"c\";i:1774869391;s:1:\"l\";i:0;}',1774869639,1775474439),(_binary 'j1mdivcd4b3uoa7vkag99gldde',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";s:24:\"_csrf/https-authenticate\";s:43:\"S0UtM1rfBg2ywBs7CLo0qVNx79vL0N6ADWVDWObUXbw\";}_sf2_meta|a:3:{s:1:\"u\";i:1774870194;s:1:\"c\";i:1774870192;s:1:\"l\";i:0;}',1774870194,1775474994),(_binary 'j251dfkr18ip0igumnpt56bi2a',_binary '_sf2_attributes|a:3:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/dashboard/\";s:24:\"_csrf/https-authenticate\";s:43:\"SUsEjwWtzfAGSr6hPlkOWutaRv6Fl0L8KcvEManCftA\";s:23:\"_security.last_username\";s:10:\"Hungnguyen\";}_sf2_meta|a:3:{s:1:\"u\";i:1775106877;s:1:\"c\";i:1774857305;s:1:\"l\";i:0;}',1775106877,1775711677),(_binary 'j664egrgsf9urh969tcpijd95i',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/dashboard/\";s:24:\"_csrf/https-authenticate\";s:43:\"zOyw1QEy0RIbhH5H9jNs36DYPZinsmIvj-LVMcYYzto\";}_sf2_meta|a:3:{s:1:\"u\";i:1775642561;s:1:\"c\";i:1775642514;s:1:\"l\";i:0;}',1775642561,1776247361),(_binary 'j9jnu2r89lagc8ts8c97llgajb',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/dashboard/\";s:24:\"_csrf/https-authenticate\";s:43:\"5c5azewCY2EB5GoN3vPuYEgK6zeGnEy8NKooHXRu95I\";}_sf2_meta|a:3:{s:1:\"u\";i:1776151039;s:1:\"c\";i:1776151036;s:1:\"l\";i:0;}',1776151039,1776755839),(_binary 'jdv5q5dmgn6ghchm53r2v2860k',_binary '_sf2_attributes|a:4:{s:18:\"_csrf/https-search\";s:43:\"qJYoWuC5w_zektugeiwW_gpY8Tep9vKXhiSwamW6cD4\";s:28:\"_csrf/https-datatable_update\";s:43:\"cDFsmulwIfDt0iOw3RwgkU6lb5MRjGbMnvYv0pWoH0c\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"YSrDBfMx-Edi31vx65LUk0U-9kYas9Du1pByBx4IBeY\";s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";}_sf2_meta|a:3:{s:1:\"u\";i:1775105421;s:1:\"c\";i:1775105421;s:1:\"l\";i:0;}',1775105421,1775710221),(_binary 'jtp3kq6cg2r420sp8gqr7npvlg',_binary '_sf2_attributes|a:7:{s:16:\"_csrf/https-form\";s:43:\"AQry7zA2nRjJNooWZ4AX6X1y_c60F1Myv__Sfy2kXGs\";s:22:\"_security_secured_area\";s:437:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:8;s:8:\"username\";s:19:\"duy.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"duy.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$B0KM750aAWEC7vu4PrYlwu4Qg8Jj2T98Rlouh3TGJ.GdMNHBzUCo6\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:19:\"_csrf/https-absence\";s:43:\"l8f3KrpcVJc3Zk2qhfAZ6gtG1LUJP_ybQ1JyKgMAY_I\";s:30:\"_csrf/https-absence_withdraw_8\";s:43:\"bqQDBPsfg1xpS4_dCd0yF1akwT-wuQh6mYnT2lTL_Ec\";s:28:\"_csrf/https-absence_delete_8\";s:43:\"XRXT1Ht-RTymJgdQF8oIxwW5hiSARC_zGA_0yBTjNhc\";s:30:\"_csrf/https-absence_withdraw_9\";s:43:\"pRhLAm7wOCsiL2s8vK4jyIQf18Wo-5PjlaqAHacrvoc\";s:28:\"_csrf/https-absence_delete_9\";s:43:\"xBGlV9fZ5Of7V27FALOzfh9I8yHRJWSul-X79e6CvME\";}_sf2_meta|a:3:{s:1:\"u\";i:1776133552;s:1:\"c\";i:1776052891;s:1:\"l\";i:0;}',1776133552,1776738352),(_binary 'k96r95755gkm23butlir06mbik',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";}_sf2_meta|a:3:{s:1:\"u\";i:1776137597;s:1:\"c\";i:1776137597;s:1:\"l\";i:0;}',1776137597,1776742397),(_binary 'ka5pd6ib3ij84ol0nj8ab2o60j',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"vir4OfsNuVesd250EU_kzNYk3pnjKh8NCBPIVv3GMcY\";}_sf2_meta|a:3:{s:1:\"u\";i:1776160150;s:1:\"c\";i:1776160150;s:1:\"l\";i:0;}',1776160150,1776764950),(_binary 'kbf4rj1dsfrsb7bgm2q2gr4498',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:1424:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:15;s:8:\"username\";s:18:\"tu.tran@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"tu.tran@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$gd.vctpFhFU1AYFVdr2A3uP.Fue//1IvXyoo1IIZ3c5pKQzKF3EHO\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"98b80853-096a-4cae-aaef-90bfa6e35456\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:7:\"Tu TRAN\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:2:\"Tu\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:4:\"TRAN\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:18:\"tu.tran@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:18:\"tu.tran@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_178585ad-6698-4bcb-b618-6c54ddfc2500\";}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"q3UDX5JObYXip40EYG5fkTwkX_sdilHVPDxo4YCu6VM\";s:28:\"_csrf/https-datatable_update\";s:43:\"XEYDhqDCCEt8bHwA-2kNHXhUtz7m6M3kB5z1Pj4DB70\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"LUcdf4Hvo8G4Nn2EaCbENS1uBPHp-IcQFXBjTUv3a8g\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"W09FECNAqpPDNGcf34g04hZZZulMp6j4ByzrozPiRo4\";}_sf2_meta|a:3:{s:1:\"u\";i:1775831173;s:1:\"c\";i:1775831136;s:1:\"l\";i:0;}',1775831173,1776435973),(_binary 'kbrhagjqgisv4seehhbc89l86k',_binary '_sf2_attributes|a:6:{s:22:\"_security_secured_area\";s:1448:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:3;s:8:\"username\";s:22:\"hung.nguyen@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:22:\"hung.nguyen@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$VpzT4zN8Xckj/LWusCxbO.ziyBnSR7IspR4X1dRPiEn.4qqtS3QzG\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"9b457df9-733d-49ca-a485-43470290da5a\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:11:\"Hung NGUYEN\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:4:\"Hung\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:6:\"NGUYEN\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:22:\"hung.nguyen@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:22:\"hung.nguyen@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_253a65cb-cf35-4a30-b45c-17ba5b672200\";}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:32:\"_csrf/https-timesheet_quick_edit\";s:43:\"R8wTX8U1C4uqNmEga0dnBePTjhkIoTgPmxA5irB9Ak8\";s:18:\"_csrf/https-search\";s:43:\"aXNgtX56g2nD7eQpVlB4QtQRVkpeJ2ld8SpWurdKwgc\";s:28:\"_csrf/https-datatable_update\";s:43:\"sod1h6AxcqAfjU9eNTcs6ZRyl6Qha5dFv8EzoVtK_qI\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"R4mVVjXl6Epub4ikvmwg0_i0irAH7U09CQF49Iath7A\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"gQh-u5gCIHnOTHWTpOx3IJbR625JlsY4msop48v_L4g\";}_sf2_meta|a:3:{s:1:\"u\";i:1776050188;s:1:\"c\";i:1775106878;s:1:\"l\";i:0;}',1776050188,1776654988),(_binary 'kd38cd5s29tf42u8g57a46d8dm',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:1490:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:10;s:8:\"username\";s:21:\"chau.hoang@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:21:\"chau.hoang@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$NK1G2nIcDVblgQ9/o5zO4eIYdW6B7aUlQds9DLzPMIIxk.pT2s4ve\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"b8fdd067-f297-4ec5-b270-eced2515b104\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:10:\"Chau HOANG\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:4:\"Chau\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:5:\"HOANG\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:21:\"chau.hoang@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:21:\"chau.hoang@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_878f4458-a7f9-41d9-99f6-865399387600\";}i:4;a:3:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"mnUJMW5KX018y8uqKvpIHHCbHWhgBXRRr9zq3inbFTc\";s:28:\"_csrf/https-datatable_update\";s:43:\"JHyOxmeAzMH_dpwbMetDfyA7IjVAeIEoo1bQdCGgK7k\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"QUnhWVUe8Pixh8NY0wvfeLGAd79j7MgZ0SaNIkquwvg\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"csIJz__kGNfLvGXJMfeXyrRxBy07KY4-k-vi0waSCkE\";}_sf2_meta|a:3:{s:1:\"u\";i:1775040837;s:1:\"c\";i:1774872734;s:1:\"l\";i:0;}',1775040837,1775645637),(_binary 'ktug71h9r8qigu2crh8ndkk10o',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";s:24:\"_csrf/https-authenticate\";s:43:\"gcXv5vs80g4LKEAColiWhXDqPmRdtD8sCzjazcN68rY\";}_sf2_meta|a:3:{s:1:\"u\";i:1775637048;s:1:\"c\";i:1775637048;s:1:\"l\";i:0;}',1775637048,1776241848),(_binary 'lbdvl4hloejrv8a5tb2qcc4il2',_binary '_sf2_attributes|a:14:{s:22:\"_security_secured_area\";s:1504:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:9;s:8:\"username\";s:19:\"nhu.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"nhu.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$/Tv6jyHZwPnfoSTN.09bYOJPlh1O4/DjlPJMovAZyXNq8HfVPJjRq\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"cbb1b579-b18c-4da6-8529-a6a2c1540fbc\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:8:\"Nhu PHAM\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:3:\"Nhu\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:4:\"PHAM\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:19:\"nhu.pham@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:19:\"nhu.pham@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_7046320d-57d8-4a6b-aaf3-0b46eba80d00\";}i:4;a:4:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";i:3;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"oL1QqjcReFq96Jhd4uzoT7vdIIjOLn0DD8VqPNaX4dk\";s:28:\"_csrf/https-datatable_update\";s:43:\"Xjzd8MHKzPjlYjFlQCEfqmYo5GXDfnd5db36FXgealQ\";s:27:\"_csrf/https-admin_team_edit\";s:43:\"imUngdZAHxyPuXHlVgDJB-qd1_-Cjbn-brkmFSZxUoQ\";s:30:\"_csrf/https-team_customer_form\";s:43:\"q-2UHjnM5f-hZeqLKv84LbSVx0CznRauwnm6oMLa2Sk\";s:29:\"_csrf/https-team_project_form\";s:43:\"qE_ERxLaAFPEnHY7cCzG_-PAK5Qu4u287lCmv4sXFGA\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"zB1ix7-BhCK0eCbkK0eALmk10bIiWhLQNAFrxdUGdKw\";s:29:\"_csrf/https-project.duplicate\";s:43:\"r20PCKnMDNjlLKPU90FmgXObza1SKgHfid250Jal368\";s:34:\"_csrf/https-admin_customer_comment\";s:43:\"-GxCwM73USEQz1kAkHbMh5RKivaFlFJwpx7SIEMeWKw\";s:31:\"_csrf/https-admin_customer_edit\";s:43:\"9Rf8x4r2EENDFAr2SYv2pIa18IU4Ywxort5Igvl-PKc\";s:30:\"_csrf/https-admin_project_edit\";s:43:\"8A8kZXQ_QRF-OMzWgBpZL4bjE379TSHeJwAvlRTXV34\";s:33:\"_csrf/https-admin_project_comment\";s:43:\"eGvXQsHo-m9dsFWSrV9H9gFNaY8RpG1Hdc3nW9MsC_o\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"UVDYnYsDem-WWjFDTL9v4YfBvRaWvKTItSTi_m-5b0o\";s:31:\"_csrf/https-admin_activity_edit\";s:43:\"cNRyKIWU854MEgAB9ADWSDsVyDQ0qMfkVp_brZKBaeU\";}_sf2_meta|a:3:{s:1:\"u\";i:1775190564;s:1:\"c\";i:1775098867;s:1:\"l\";i:0;}',1775190564,1775795364),(_binary 'm3lmtstvkunrtkflltsb3j8205',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:38:\"https://time.cosigma.io/en/admin/user/\";s:24:\"_csrf/https-authenticate\";s:43:\"V-_GWgGnqp5iIDYxec0WQ__ppHiRHTVgkoNI4TVVm-g\";}_sf2_meta|a:3:{s:1:\"u\";i:1776145089;s:1:\"c\";i:1776145088;s:1:\"l\";i:0;}',1776145089,1776749889),(_binary 'm4d3i1n4c8c1ornuo1dpqkjekm',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";s:24:\"_csrf/https-authenticate\";s:43:\"Epq_u5OJdKb2yy4s0sowChrGGnl0XMXlCfBBRkI4B3c\";}_sf2_meta|a:3:{s:1:\"u\";i:1775029190;s:1:\"c\";i:1775029190;s:1:\"l\";i:0;}',1775029190,1775633990),(_binary 'moi5acisvv9ndj376e9hekdnkh',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:1543:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:12;s:8:\"username\";s:23:\"baduy.nguyen@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:23:\"baduy.nguyen@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$UdMOLjNebHGuG1Kh/dghWObFClP26sjS3P8A6.BOOKMDCESG3SQwW\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"56ddac72-d971-4cb6-8c55-b1c41abf7fdb\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:13:\"Ba Duy NGUYEN\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:2:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";i:1;s:74:\"http://schemas.microsoft.com/ws/2008/06/identity/authenticationmethod/x509\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:6:\"Ba Duy\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:6:\"NGUYEN\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:23:\"baduy.nguyen@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:23:\"baduy.nguyen@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_bdb5b08b-7049-4cb0-a0f9-31bc7ba24000\";}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"hVITv80xlXEKAq6tYht40S4FQOEJFzS2vx7ACPleiwM\";s:28:\"_csrf/https-datatable_update\";s:43:\"25AKbkoT4dbNjrhj0e8Q5um8TnF1BjVzbj_a-Bd3F0k\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"jZH5NqMwu_X50680rSVKaLmzx0WItnSMApggo45H7Go\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"xYl8epf39OeBDq1a7d7UFSGjlncBRucq0Yi4e-WCnBo\";}_sf2_meta|a:3:{s:1:\"u\";i:1775477413;s:1:\"c\";i:1775477355;s:1:\"l\";i:0;}',1775477413,1776082213),(_binary 'n3cnvc712asfgiosesn806v4b0',_binary '_sf2_attributes|a:9:{s:22:\"_security_secured_area\";s:1429:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:8;s:8:\"username\";s:19:\"duy.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"duy.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$B0KM750aAWEC7vu4PrYlwu4Qg8Jj2T98Rlouh3TGJ.GdMNHBzUCo6\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"65cefabd-5eb6-4157-8bfd-ba5795d2b6f2\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:8:\"Duy PHAM\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:3:\"Duy\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:4:\"PHAM\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:19:\"duy.pham@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:19:\"duy.pham@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_c7318e14-6f02-4244-8ceb-1bc993ef8100\";}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"jSj3qJR7EuaR7SNlXGy3ZJlnCbK2JhYfRRLcUWLOHts\";s:28:\"_csrf/https-datatable_update\";s:43:\"9nk8DtErEvqWGqEo2HtDI-70WL2eAgrTJsm0S3m9iQo\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"n-qz0JFENc-0BI6VVIUUoMQ8JqFomsMKHaJq90lyx4I\";s:19:\"_csrf/https-absence\";s:43:\"Ewy9WWb04tMhc6rsvq0JLMG3QPvGGsCQAqCvRuigKtI\";s:30:\"_csrf/https-absence_withdraw_8\";s:43:\"Fr5v2kBrQZfgbAxaF2jRGlocSbtHF6EQfFdYKEgPOOQ\";s:28:\"_csrf/https-absence_delete_8\";s:43:\"CdRmXg_Bj5jqm0mmCKOioyUGC82jPD2m_e_iQdd4Qvo\";s:30:\"_csrf/https-absence_withdraw_9\";s:43:\"kHX1SGLxpKgOILzoRQlNYQXbr2VDz3_ZBTX8lLCAR7Q\";s:28:\"_csrf/https-absence_delete_9\";s:43:\"G0jrtpQJZ506luiHfzAHvDgqOHIS0Qx02ZoPex5TwCo\";}_sf2_meta|a:3:{s:1:\"u\";i:1776064948;s:1:\"c\";i:1776064868;s:1:\"l\";i:0;}',1776064948,1776669748),(_binary 'n3nn7f7emu8hdhr8qd5uqu0ibc',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";s:24:\"_csrf/https-authenticate\";s:43:\"RJ97bCXwCM2_Gjuu4ruRLBytdDmUWMNQdVTmElc2EcU\";}_sf2_meta|a:3:{s:1:\"u\";i:1776137622;s:1:\"c\";i:1776137613;s:1:\"l\";i:0;}',1776137622,1776742422),(_binary 'n7tjb6t28b4jsg29jd310imgkt',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:446:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:12;s:8:\"username\";s:23:\"baduy.nguyen@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:23:\"baduy.nguyen@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$UdMOLjNebHGuG1Kh/dghWObFClP26sjS3P8A6.BOOKMDCESG3SQwW\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"lT6F0Cu-H9y5lxmF5oqsEhvGYq_Qg0oFZ1ViwuOmm2E\";s:28:\"_csrf/https-datatable_update\";s:43:\"BWeHCSOHIkp43c9u5fir1N2TJKso0B468SBmB4awskQ\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"vql9PiTJzmx6nrc6oj3ko0P_2YQdgowPZXh_SDt3p1I\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"T2fBiJjbde-CIaJdSe0y6FFOQeSLMmp00m0MLm-u3Kk\";}_sf2_meta|a:3:{s:1:\"u\";i:1775189410;s:1:\"c\";i:1775188925;s:1:\"l\";i:0;}',1775189410,1775794210),(_binary 'naqbkg70cdcbk4kum1bqulunrm',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"Q5JKG-m8ns8svEY3J-NSwu6BVgJyUFOOlFl7zr_4vFg\";}_sf2_meta|a:3:{s:1:\"u\";i:1775017043;s:1:\"c\";i:1775017043;s:1:\"l\";i:0;}',1775017043,1775621843),(_binary 'ndtpe275eqdps2inhkuqfhiihs',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:15;s:8:\"username\";s:18:\"tu.tran@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"tu.tran@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$gd.vctpFhFU1AYFVdr2A3uP.Fue//1IvXyoo1IIZ3c5pKQzKF3EHO\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"KH0G7QJMzvdbLWpa8idMp7FsUieRs7XXTD4zSBdbsmQ\";s:18:\"_csrf/https-search\";s:43:\"pJ1Wq0RK1sHZVwwHZFGItTtpaSxklNCCEwtHpYKtvcU\";s:28:\"_csrf/https-datatable_update\";s:43:\"fF5nuQuc-K428IoCyHWU1vE6xJCM_FX34G8xWO0EVwM\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"HT-Iqyzcy0c30lh_y8A6nBpQSVd46Ur_nHohzcltmbk\";}_sf2_meta|a:3:{s:1:\"u\";i:1775444269;s:1:\"c\";i:1775444224;s:1:\"l\";i:0;}',1775444269,1776049069),(_binary 'nfn6r17ehro91flgjisj43ev06',_binary '_sf2_attributes|a:4:{s:22:\"_security_secured_area\";s:1424:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"b1552955-2cbd-463a-94e5-8601b845170e\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:7:\"Duc CAO\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:3:\"Duc\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:3:\"CAO\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:18:\"duc.cao@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:18:\"duc.cao@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_2fdc86fb-69ae-4fbd-83d4-781c2a3b0500\";}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"-qsM0_KjiYPvOBi08snvo5A8zfpVOPo9tvsPe8WlqnM\";s:28:\"_csrf/https-datatable_update\";s:43:\"a-jxXb5ivks7S9TfOQy4PELN4oj5b4kCxLKgW93oAzw\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"rmEGpPyFgNF8_e7Ihu9_smCzvkKdBvdzqyUuxQhLJtE\";}_sf2_meta|a:3:{s:1:\"u\";i:1776141418;s:1:\"c\";i:1776141413;s:1:\"l\";i:0;}',1776141418,1776746218),(_binary 'o6sehj2d1k2tt0j994us1cjb0l',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:489:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:10;s:8:\"username\";s:21:\"chau.hoang@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:21:\"chau.hoang@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$NK1G2nIcDVblgQ9/o5zO4eIYdW6B7aUlQds9DLzPMIIxk.pT2s4ve\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:3:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"nEVsl1XGuD5n1QY4dw28JUC3S8_rBvMxnoJXNqwlcXA\";s:28:\"_csrf/https-datatable_update\";s:43:\"dq13hdywO8m9RdVXudwgpc1MN3HyG1wIxUBHIb35LGY\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"gnuJK4v7eI_e4qBhpXoYGYnsXDEEt4n6NfjC2CfUfMk\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"ZnSa74pgWVbLIS7wl14aBAlomX4jmKx1EX2X8WmVRuc\";}_sf2_meta|a:3:{s:1:\"u\";i:1775208437;s:1:\"c\";i:1775208408;s:1:\"l\";i:0;}',1775208437,1775813237),(_binary 'o8joksg06r7u81urv5v6ptumfn',_binary '_sf2_attributes|a:9:{s:23:\"_security.last_username\";s:4:\"test\";s:17:\"datatable_profile\";s:6:\"mobile\";s:22:\"_security_secured_area\";s:393:\"O:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":3:{i:0;N;i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:13;s:8:\"username\";s:4:\"test\";s:7:\"enabled\";b:1;s:5:\"email\";s:21:\"tinyly90891@gmail.com\";s:8:\"password\";s:60:\"$2y$13$cYHZBgrDP9poKlv9oDa6gOo8MCXuX.u3JEQH/95JDEjxqBP.iAT3W\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"r7M7kGpJkfDyBXRiCDKWTWJw0vALigBn-teJxod6OiY\";s:28:\"_csrf/https-datatable_update\";s:43:\"oUE-u6QESO6XpGTPwJfjYc0i2kgd-t6BdEvp94vFEmE\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"1BeAlGuTe2Y6hx-ngslDJizWHP9s-LNATH865mf2MH8\";s:20:\"_security.last_error\";O:67:\"Symfony\\Component\\Security\\Core\\Exception\\InvalidCsrfTokenException\":5:{i:0;N;i:1;i:0;i:2;s:19:\"Invalid CSRF token.\";i:3;s:80:\"/opt/kimai/vendor/symfony/security-http/EventListener/CsrfProtectionListener.php\";i:4;i:51;}s:32:\"_csrf/https-timesheet_quick_edit\";s:43:\"CW0zJuOpwMdZxsc6MEPXIzv0A9r1OCYpyKfge5iAW8E\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"YJvdAyfqh1Rr5tEoZS4I4vRiNHIw_MRcIhB77xEq_5Y\";}_sf2_meta|a:3:{s:1:\"u\";i:1774878284;s:1:\"c\";i:1774873370;s:1:\"l\";i:0;}',1774878284,1775483084),(_binary 'oacpkprql94f7spns0m2s237el',_binary '_sf2_attributes|a:5:{s:18:\"_csrf/https-search\";s:43:\"R0eqSYrkCff8Iy6Wl8-t-fUcmi2-sF4cY14ldH6mn78\";s:28:\"_csrf/https-datatable_update\";s:43:\"qW5GD_uxVnPip0H-tqNL7cBrdl_yP3Y7ABfMqJbkGjQ\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"Klq5xVkov3WPF2cWO8AW6A2mOZoq3UgXrt3FTMKendU\";s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"UG_rT9Lq3K1fDIxvhqj5QOdqLEz5ICxVrVROp5XrycU\";}_sf2_meta|a:3:{s:1:\"u\";i:1775817160;s:1:\"c\";i:1775817111;s:1:\"l\";i:0;}',1775817160,1776421960),(_binary 'ojdubbrn7bgokgigedc1ag3eus',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";s:24:\"_csrf/https-authenticate\";s:43:\"NmSKzlrtX8i02t0r8fWYEuibl70wU9wbLh6rOICck9Q\";}_sf2_meta|a:3:{s:1:\"u\";i:1776140318;s:1:\"c\";i:1776140318;s:1:\"l\";i:0;}',1776140318,1776745118),(_binary 'oubiin96eotlfcspdiok0ejeej',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:1429:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:8;s:8:\"username\";s:19:\"duy.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"duy.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$B0KM750aAWEC7vu4PrYlwu4Qg8Jj2T98Rlouh3TGJ.GdMNHBzUCo6\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"65cefabd-5eb6-4157-8bfd-ba5795d2b6f2\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:8:\"Duy PHAM\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:3:\"Duy\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:4:\"PHAM\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:19:\"duy.pham@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:19:\"duy.pham@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_17897dc1-6470-45d0-b17a-939f12ef0d00\";}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"crEMzGLv9OuOqMyDAwHqSTX0cZM5WeX_XvKG07ju67Q\";s:28:\"_csrf/https-datatable_update\";s:43:\"vmzTcck5J290azhiRCL3dPj3tFFgEGT-J24kmsm9n8M\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"Ichyd4NUiGs32pdU07Du1tKeZCnzXvaYbLdlJyad0EU\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"4NOBPK1yTro-I3TyPgRsaiRQbYo7fjh-wIEpNOL2gSE\";}_sf2_meta|a:3:{s:1:\"u\";i:1775814861;s:1:\"c\";i:1775814766;s:1:\"l\";i:0;}',1775814861,1776419661),(_binary 'ovrquor7v9p9593qi9vhmjcjm1',_binary '_sf2_attributes|a:3:{s:23:\"_security.last_username\";s:4:\"test\";s:17:\"datatable_profile\";s:6:\"mobile\";s:22:\"_security_secured_area\";s:393:\"O:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":3:{i:0;N;i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:13;s:8:\"username\";s:4:\"test\";s:7:\"enabled\";b:1;s:5:\"email\";s:21:\"tinyly90891@gmail.com\";s:8:\"password\";s:60:\"$2y$13$cYHZBgrDP9poKlv9oDa6gOo8MCXuX.u3JEQH/95JDEjxqBP.iAT3W\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";}_sf2_meta|a:3:{s:1:\"u\";i:1775220048;s:1:\"c\";i:1775220048;s:1:\"l\";i:0;}',1775220048,1775824848),(_binary 'p2fngps1abhgqds3lpcm061r2q',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";}_sf2_meta|a:3:{s:1:\"u\";i:1775312231;s:1:\"c\";i:1775312231;s:1:\"l\";i:0;}',1775312231,1775917031),(_binary 'p4ngpjck5bsqusl174rklrinmi',_binary '_sf2_attributes|a:5:{s:18:\"_csrf/https-search\";s:43:\"lkOU8NY46dMH_zYYtpsepkq86YizXn4-RLOImiYhosU\";s:28:\"_csrf/https-datatable_update\";s:43:\"wNlGPA5QzuDDAkjl4FaENwJhPFay2Uiz1tN7fRknOzY\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"Gj0qDceFc6xTvw-OCmM7Z4hkdH_A1A042yTHyQL--gE\";s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"PMWLaYdqZApn0sbabMRZp_jIRU-CYJGdX5Ll196qjaQ\";}_sf2_meta|a:3:{s:1:\"u\";i:1776140090;s:1:\"c\";i:1776136762;s:1:\"l\";i:0;}',1776140090,1776744890),(_binary 'pqvo1tan0m4aqjg0fo4fgguk3d',_binary '_sf2_attributes|a:6:{s:18:\"_csrf/https-search\";s:43:\"-u4JyetssEX3yvzd9S8lOiwY0plJ3_crxQosb3tX4CQ\";s:28:\"_csrf/https-datatable_update\";s:43:\"btrwKH-X7QfHHsRymGcUJkz5QfG7fZOs764oEpByICc\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"fyfl2H69eIIS4BJVt-4SbYnF0X6DtrkCTkmLw0K79Ws\";s:22:\"_security_secured_area\";s:512:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:9;s:8:\"username\";s:19:\"nhu.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"nhu.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$/Tv6jyHZwPnfoSTN.09bYOJPlh1O4/DjlPJMovAZyXNq8HfVPJjRq\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:4:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";i:3;s:9:\"ROLE_USER\";}}}\";s:34:\"_security.secured_area.target_path\";s:38:\"https://time.cosigma.io/en/admin/user/\";s:24:\"_csrf/https-authenticate\";s:43:\"phXa1deGETFwtMP1MYwyA_w9pQwrIKz_gjCsp_aEKno\";}_sf2_meta|a:3:{s:1:\"u\";i:1775098865;s:1:\"c\";i:1775098858;s:1:\"l\";i:0;}',1775098865,1775703665),(_binary 'psgppc0g0421q72fh4m1of8ns5',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";s:24:\"_csrf/https-authenticate\";s:43:\"FUvxcdzHd1JD0ldCt5lh4ETjsQQUjhcxfyA-PoENoPI\";}_sf2_meta|a:3:{s:1:\"u\";i:1774870094;s:1:\"c\";i:1774870094;s:1:\"l\";i:0;}',1774870094,1775474894),(_binary 'pue2987ndg9ji6s20j909jvahq',_binary '_sf2_attributes|a:5:{s:18:\"_csrf/https-search\";s:43:\"NdXFT3EuGqXNAnrOOf4bopzJNFKzAIG4aS_Bt1zfyes\";s:28:\"_csrf/https-datatable_update\";s:43:\"Pw5BV8qQKQhtHPqm6u2j6R30YrvDodT14ekxUHOD5D4\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"HVeoizBVX3rR5O6ysx8EJ9YUlnpXJSFFoPg8C0vI4lc\";s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"PqdGF5HpehFn9-YLTbf0LFI467JwTPSWPCa5CfdvE1Y\";}_sf2_meta|a:3:{s:1:\"u\";i:1775210289;s:1:\"c\";i:1775183679;s:1:\"l\";i:0;}',1775210289,1775815089),(_binary 'pummulmato776hk1o0i5tngpng',_binary '_sf2_attributes|a:10:{s:22:\"_security_secured_area\";s:393:\"O:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":3:{i:0;N;i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:13;s:8:\"username\";s:4:\"test\";s:7:\"enabled\";b:1;s:5:\"email\";s:21:\"tinyly90891@gmail.com\";s:8:\"password\";s:60:\"$2y$13$cYHZBgrDP9poKlv9oDa6gOo8MCXuX.u3JEQH/95JDEjxqBP.iAT3W\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:23:\"_security.last_username\";s:4:\"test\";s:29:\"_csrf/https-edit_user_profile\";s:43:\"Xfue8ecI-0qmAjkRNtA4rk_0zwNl8L8dTDfZGoBRUus\";s:33:\"_csrf/https-edit_user_preferences\";s:43:\"zuHZ0wz20RN8MPGn-Z5Wu3lPAFK81qAkBU022rfH7RI\";s:18:\"_csrf/https-search\";s:43:\"8yHR54e9Pp35lb8BdIUIw8ka6VoTCT3cIFOrho1iWZU\";s:28:\"_csrf/https-datatable_update\";s:43:\"SJXhZbjGO-FRYi4Hol3k3Fmx5IGtYVbMkPlsSbhh7UI\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"jHE_F1VSXL0wWoZpFUKEeNLOU3JXhnK-Z3S6akyZqtM\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"YHCbrBhVYbV5g76oBxRCusFarC1YImysIWI7y1Caskg\";s:32:\"_csrf/https-timesheet_quick_edit\";s:43:\"ljsYSnqxoTsqjjeRK-NdV5CZcS4OKUEWZKhH9JBwyXQ\";s:19:\"_csrf/https-absence\";s:43:\"sEdLkduRDhVhREys2G52zH2B1eiVOVbUW44V8_s02-c\";}_sf2_meta|a:3:{s:1:\"u\";i:1774871780;s:1:\"c\";i:1774870617;s:1:\"l\";i:0;}',1774871780,1775476580),(_binary 'pusb86dq2lokgiqas7hom88irf',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";}_sf2_meta|a:3:{s:1:\"u\";i:1775077385;s:1:\"c\";i:1775077385;s:1:\"l\";i:0;}',1775077385,1775682185),(_binary 'q44nflpdnveievomnf05lkt5mv',_binary '_sf2_attributes|a:3:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";s:24:\"_csrf/https-authenticate\";s:43:\"Dh2CerfuSDz6_FB_SywrV2sVNOGgEIIE23FsSSkb-k8\";s:23:\"_security.last_username\";s:18:\"tu.tran@cosigma.io\";}_sf2_meta|a:3:{s:1:\"u\";i:1775029251;s:1:\"c\";i:1775029210;s:1:\"l\";i:0;}',1775029251,1775634051),(_binary 'qahtgepirvdk8k93930eo5d6ea',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";}_sf2_meta|a:3:{s:1:\"u\";i:1774877744;s:1:\"c\";i:1774877744;s:1:\"l\";i:0;}',1774877744,1775482544),(_binary 'qc5p7rf6qorpvhssgnei92fs9n',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";s:24:\"_csrf/https-authenticate\";s:43:\"2Cxd3DkouwiyYfDtgUY6RE30MR_cERO-v-_JXmA79tM\";}_sf2_meta|a:3:{s:1:\"u\";i:1775044875;s:1:\"c\";i:1775044875;s:1:\"l\";i:0;}',1775044875,1775649675),(_binary 'qcevs2g9chvk954vsihjur35p8',_binary '_sf2_attributes|a:5:{s:22:\"_security_secured_area\";s:446:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:12;s:8:\"username\";s:23:\"baduy.nguyen@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:23:\"baduy.nguyen@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$UdMOLjNebHGuG1Kh/dghWObFClP26sjS3P8A6.BOOKMDCESG3SQwW\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"6onMD2oQDY-0vYHPmF3FhoydJEXdf2jBGiRG-Oo4w9I\";s:28:\"_csrf/https-datatable_update\";s:43:\"dEO5CHPgDVadjNk01dZY97dn0BUKpyHdIU8C1Rnz-iw\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"_hGxdixRCIkrNcwheokK9EGH5GKbqwq4NS3BakG3BiM\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"2r-ELGlXw4vTGCEVteYbvcP2lGNuxJm0uFhhkAj7GJA\";}_sf2_meta|a:3:{s:1:\"u\";i:1775205173;s:1:\"c\";i:1775204980;s:1:\"l\";i:0;}',1775205173,1775809973),(_binary 'qi5tp1cksu37toqmhrl7orit31',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";}_sf2_meta|a:3:{s:1:\"u\";i:1775413439;s:1:\"c\";i:1775413439;s:1:\"l\";i:0;}',1775413439,1776018239),(_binary 'qtllonkgau3dopof564k1odmhi',_binary '_sf2_attributes|a:8:{s:18:\"_csrf/https-search\";s:43:\"77VGxXx8rQSrqywzIquOTdWI36RQKeyydZ9p2tXFZZI\";s:28:\"_csrf/https-datatable_update\";s:43:\"RNEaKP5_X-jtXa0KJ32SdVnseO9PLY4aTdCThoUpBfc\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"wOkJhUv3Us2CZPuqbCoxpqJShlMmQHQQsYnwWFLJ0DA\";s:22:\"_security_secured_area\";s:437:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:4;s:8:\"username\";s:19:\"hoang.vu@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"hoang.vu@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$ruTDOzYmGbW16JUxk9rA2uD4kpcVs.suYreFn7CIGe9u8mOw4wjfq\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:32:\"_csrf/https-timesheet_quick_edit\";s:43:\"P4ICNwXlN6mLIeArWXTglSJa3JRf7OB9srAsWbmfiOA\";s:29:\"_csrf/https-edit_user_profile\";s:43:\"Db2ZHKq-UYSk_bTaBWzKkbYN9pDcYz67M878OJNc0iY\";s:33:\"_csrf/https-edit_user_preferences\";s:43:\"D9Lgi-WcQm9NwlKmlgT7bbneDFCl9U2B9hUtOYbQBKg\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"AdkPXoCKBk8bjovts2k7W5JZAR7WnoAMBiBGUJwqdPs\";}_sf2_meta|a:3:{s:1:\"u\";i:1775442877;s:1:\"c\";i:1775442598;s:1:\"l\";i:0;}',1775442877,1776047677),(_binary 'quuol8g6t9prfs5gbm93tv7ivf',_binary '_sf2_attributes|a:5:{s:18:\"_csrf/https-search\";s:43:\"mPBTMwAcNbFhhSqbkdDlJ44gU73AgSPo5QZlTplpJsI\";s:28:\"_csrf/https-datatable_update\";s:43:\"f5RsL2Pb2w2UqHezRdbquhQ67JtuQYfqJ5WkUQ2YmV8\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"s8h8-tqWJiv98FaJBrklE9XH3Qktomm0MJ7EFDqOy9w\";s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"auiUItGTV3cr7YvT_WD81nqkzQejn0E78ptMgP1anV8\";}_sf2_meta|a:3:{s:1:\"u\";i:1775097176;s:1:\"c\";i:1775097090;s:1:\"l\";i:0;}',1775097176,1775701976),(_binary 'r939d8nqn28q0rfbbb5bap542j',_binary '_sf2_attributes|a:7:{s:22:\"_security_secured_area\";s:1429:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:8;s:8:\"username\";s:19:\"duy.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"duy.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$B0KM750aAWEC7vu4PrYlwu4Qg8Jj2T98Rlouh3TGJ.GdMNHBzUCo6\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"65cefabd-5eb6-4157-8bfd-ba5795d2b6f2\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:8:\"Duy PHAM\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:3:\"Duy\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:4:\"PHAM\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:19:\"duy.pham@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:19:\"duy.pham@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_da4c5ae4-025f-45e5-92ca-445f590a0400\";}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"Ki0-u6VTGRiQgKqbEJQ_inih7GBQ76gEO8fJKxCEiFw\";s:28:\"_csrf/https-datatable_update\";s:43:\"LRdoGkYdQLfnZ4dnUCSP3jhYHMSnWa8v9qX2DK0EiRw\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"EwWUKZx9z5F7-dNbdeMAPGS5SWRM5tXpAE9AF8qGkeY\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"oOxVuw7i6FDdZCrxPSlaKloaJoeQdPLQO0mE2LWcogQ\";s:26:\"_csrf/https-public_holiday\";s:43:\"9231i9Tgm-RZ5A_FJnNfu83XUbct0ojKsm-idG5lGy4\";s:19:\"_csrf/https-absence\";s:43:\"6YGLQkqigBDTt1rdlpwUvu72Rg966mM7n6qsRwsYX0Y\";}_sf2_meta|a:3:{s:1:\"u\";i:1775533756;s:1:\"c\";i:1775533523;s:1:\"l\";i:0;}',1775533756,1776138556),(_binary 'riuvm0qf9vlt33nivhemepcou1',_binary '_sf2_attributes|a:4:{s:22:\"_security_secured_area\";s:1516:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:16;s:8:\"username\";s:23:\"thung.nguyen@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:23:\"thung.nguyen@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$NWROJuK0PuRFcTELa.k4eePlz5lYqN/Z811vlSEcpwG83xANXY0Rm\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"f0277fab-36dd-4b7c-b08b-bc1f9d9f06b2\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:12:\"Thung Nguyen\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:2:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";i:1;s:49:\"http://schemas.microsoft.com/claims/multipleauthn\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:5:\"Thung\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:6:\"Nguyen\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:23:\"thung.nguyen@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:23:\"thung.nguyen@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_7edf5b7b-9352-4bfd-bc37-1c4193479c00\";}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:16:\"_csrf/https-form\";s:43:\"yRo98_EUjRMbNexm8Idwc9cb4yJObAfFXoW9AI4y5Hg\";s:18:\"_csrf/https-search\";s:43:\"ChHw75fwvuouYq3CIpXFtJ5ODKwtQovLtgz4ncq8ZT0\";s:28:\"_csrf/https-datatable_update\";s:43:\"QgEDJyOWOvzr8enxvUoZKjZKRGwJ9XdNmv0cxpjLPXc\";}_sf2_meta|a:3:{s:1:\"u\";i:1776137690;s:1:\"c\";i:1776137624;s:1:\"l\";i:0;}',1776137690,1776742490),(_binary 'rl3qfht9rkjveaeg1pjcsbc285',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";}_sf2_meta|a:3:{s:1:\"u\";i:1776162430;s:1:\"c\";i:1776162430;s:1:\"l\";i:0;}',1776162430,1776767230),(_binary 'rsfr83oaa7smu6vverbpi1lri3',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";}_sf2_meta|a:3:{s:1:\"u\";i:1775029178;s:1:\"c\";i:1775029178;s:1:\"l\";i:0;}',1775029178,1775633978),(_binary 'sb648b65tvub7oh244q8lfkb7i',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";}_sf2_meta|a:3:{s:1:\"u\";i:1776137600;s:1:\"c\";i:1776137600;s:1:\"l\";i:0;}',1776137600,1776742400),(_binary 'scp3rj1va7jl8ah8g3r5udpo1j',_binary '_sf2_attributes|a:4:{s:18:\"_csrf/https-search\";s:43:\"ws7T_ZSGBANV2gpLsx9eH6UJyAIrFEE1jf4A5_eryx4\";s:28:\"_csrf/https-datatable_update\";s:43:\"USNtC7bEyA4SteWUx8rr9ifLBW4CIKLRBDrPeJ5LdDQ\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"E914si8I2bxdFSMFqUEFhG3WZxJr4qmZ3YKcKSa2THQ\";s:22:\"_security_secured_area\";s:512:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:9;s:8:\"username\";s:19:\"nhu.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"nhu.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$/Tv6jyHZwPnfoSTN.09bYOJPlh1O4/DjlPJMovAZyXNq8HfVPJjRq\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:4:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";i:3;s:9:\"ROLE_USER\";}}}\";}_sf2_meta|a:3:{s:1:\"u\";i:1775029158;s:1:\"c\";i:1775029158;s:1:\"l\";i:0;}',1775029158,1775633958),(_binary 'snpace95t15gj4he61e4katsa2',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";}_sf2_meta|a:3:{s:1:\"u\";i:1775810400;s:1:\"c\";i:1775810400;s:1:\"l\";i:0;}',1775810400,1776415200),(_binary 'svepta0fhcaig9rceeer9id88a',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/timesheet/\";}_sf2_meta|a:3:{s:1:\"u\";i:1775029181;s:1:\"c\";i:1775029181;s:1:\"l\";i:0;}',1775029181,1775633981),(_binary 't19mg9nhhq2uln4f39e766so0n',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";s:24:\"_csrf/https-authenticate\";s:43:\"w8YwYAn8VmrzkvMR2GKeIa6_BWvUCD5taPafpJN-D74\";}_sf2_meta|a:3:{s:1:\"u\";i:1775489583;s:1:\"c\";i:1775489582;s:1:\"l\";i:0;}',1775489583,1776094383),(_binary 't7ei3nksi7prtqq712ule6ho16',_binary '_sf2_attributes|a:5:{s:18:\"_csrf/https-search\";s:43:\"Z28WH2_Ut12Y_6qnr_rOx1bssm7LHZA4MsKvoBeg_fk\";s:28:\"_csrf/https-datatable_update\";s:43:\"aaubu6CK-ZXlIRiY3-vmzS4cW7O_s98KgbblhiRjzPs\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"5_RfCa7QMlWoOK_gy3MawLal8UmtVv3fH20kcdBBft4\";s:22:\"_security_secured_area\";s:437:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:8;s:8:\"username\";s:19:\"duy.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"duy.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$B0KM750aAWEC7vu4PrYlwu4Qg8Jj2T98Rlouh3TGJ.GdMNHBzUCo6\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:33:\"_csrf/https-edit_user_preferences\";s:43:\"E3zk3noFIpV4vcoXs7dsZgAOfCTS9c2_BvDu5QtXLUY\";}_sf2_meta|a:3:{s:1:\"u\";i:1774877734;s:1:\"c\";i:1774877646;s:1:\"l\";i:0;}',1774877734,1775482534),(_binary 'tdqvv45qb7n45p0kdooc4nn05p',_binary '_sf2_attributes|a:1:{s:22:\"_security_secured_area\";s:424:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:13;s:8:\"username\";s:4:\"test\";s:7:\"enabled\";b:1;s:5:\"email\";s:21:\"tinyly90891@gmail.com\";s:8:\"password\";s:60:\"$2y$13$cYHZBgrDP9poKlv9oDa6gOo8MCXuX.u3JEQH/95JDEjxqBP.iAT3W\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";}_sf2_meta|a:3:{s:1:\"u\";i:1775470709;s:1:\"c\";i:1775470707;s:1:\"l\";i:0;}',1775470709,1776075509),(_binary 'tlg65lajtrsr9j2nvl9to70cn8',_binary '_sf2_attributes|a:11:{s:22:\"_security_secured_area\";s:1424:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:15;s:8:\"username\";s:18:\"tu.tran@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"tu.tran@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$gd.vctpFhFU1AYFVdr2A3uP.Fue//1IvXyoo1IIZ3c5pKQzKF3EHO\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"98b80853-096a-4cae-aaef-90bfa6e35456\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:7:\"Tu TRAN\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:1:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:2:\"Tu\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:4:\"TRAN\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:18:\"tu.tran@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:18:\"tu.tran@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_3caf7dc5-8215-4a6c-a0db-2b4784e90800\";}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:16:\"_csrf/https-form\";s:43:\"x3JMsC5Zb3Oy4-vnlrGHSrynuoyWGLSfbpZx3pYhMWY\";s:18:\"_csrf/https-search\";s:43:\"_JkYQMmv4rsqvSpFSolHqiVgYWv6KuL6UMU5smbclKI\";s:28:\"_csrf/https-datatable_update\";s:43:\"zLElRE3qypqx-2R-uXpAazi4wXJiJdJtslQWss6UlfE\";s:29:\"_csrf/https-edit_user_profile\";s:43:\"QG3tChUmcWV83bhOxfHMUL-BBuX7heg36xovcfg4EsM\";s:33:\"_csrf/https-edit_user_preferences\";s:43:\"XL1mI7iYsJ591UCSij4Iq-d-txwGULzU2HEKEm6Jevk\";s:25:\"_csrf/https-edit_user_2fa\";s:43:\"zmnQL_hnFXyJAe1Ilv-l4x_S9iEMHylYzk_IJWkK9dY\";s:36:\"_csrf/https-edit_user_password_token\";s:43:\"HYOT0D6iVfWQz1N9t8PIVJTKJv-_XmBT8RfpS_f0k1A\";s:32:\"_csrf/https-timesheet_quick_edit\";s:43:\"_hZlKAiCCxTrrBTkBC9IsWsxOGkbD0TpnsGvHHto-Hs\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"EjgmTMbfB-T88hFf9cgbWKYffxXiBiGzXfGbAA8M90w\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"7BA5lPKUzOn7LE5BNZ0m-uFdS6KdX1EJyWQZ-_vbFWw\";}_sf2_meta|a:3:{s:1:\"u\";i:1775189138;s:1:\"c\";i:1775029252;s:1:\"l\";i:0;}',1775189138,1775793938),(_binary 'toaisr624uei6qb4acadj6msfv',_binary '_sf2_attributes|a:14:{s:22:\"_security_secured_area\";s:1547:\"O:18:\"App\\Saml\\SamlToken\":2:{i:0;s:12:\"secured_area\";i:1;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:11;s:8:\"username\";s:20:\"tuan.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:20:\"tuan.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$s4Kp068hD8bUKTSjh5RZju3Ym2gVAbCiatHWBXpHapdgC7O.jR/jm\";}i:1;b:1;i:2;N;i:3;a:10:{s:53:\"http://schemas.microsoft.com/identity/claims/tenantid\";a:1:{i:0;s:36:\"d8fab091-9852-41e1-8300-057ce10d3ca9\";}s:61:\"http://schemas.microsoft.com/identity/claims/objectidentifier\";a:1:{i:0;s:36:\"250d082c-7b5a-40f1-b926-d2d0799a1abf\";}s:56:\"http://schemas.microsoft.com/identity/claims/displayname\";a:1:{i:0;s:9:\"Tuan PHAM\";}s:61:\"http://schemas.microsoft.com/identity/claims/identityprovider\";a:1:{i:0;s:61:\"https://sts.windows.net/d8fab091-9852-41e1-8300-057ce10d3ca9/\";}s:58:\"http://schemas.microsoft.com/claims/authnmethodsreferences\";a:2:{i:0;s:65:\"urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport\";i:1;s:49:\"http://schemas.microsoft.com/claims/multipleauthn\";}s:63:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname\";a:1:{i:0;s:4:\"Tuan\";}s:61:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname\";a:1:{i:0;s:4:\"PHAM\";}s:66:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\";a:1:{i:0;s:20:\"tuan.pham@cosigma.io\";}s:58:\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name\";a:1:{i:0;s:20:\"tuan.pham@cosigma.io\";}s:12:\"sessionIndex\";s:37:\"_6a202c39-0127-4ebf-8d99-c546d0200900\";}i:4;a:3:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:16:\"ROLE_SUPER_ADMIN\";i:2;s:9:\"ROLE_USER\";}}}\";s:18:\"_csrf/https-search\";s:43:\"9C4xmRzrE7j9PDlnlcJNhhuA410ZcF5qSLPM5sjcql8\";s:28:\"_csrf/https-datatable_update\";s:43:\"kz-BpZvyTnASwiM4nRjER0k0S3yci4PAB0koxWAI4FA\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"K4XYaPGokbCx27B5zKG3xVlLNM0y6UJSj7YmFzhWesM\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"sBAdpSf_8nQ8kUpzk0_cFOX88kVSTV1VmCOYQvdryfY\";s:32:\"_csrf/https-timesheet_quick_edit\";s:43:\"ajfF3OiJJsnSbMB0lpCne-fiq2XKwO3vwR59gE-tRSo\";s:33:\"_csrf/https-user_role_permissions\";s:43:\"waHJ30kXtaxFyOI6qOuo1FmZ3P7FLXYHIdRg9CS8Qtg\";s:33:\"_csrf/https-edit_user_preferences\";s:43:\"IiNu_pefFMwy3r5cg8nbtIXRSpuc7q3svplUlkw5sOY\";s:16:\"_csrf/https-form\";s:43:\"1bDju92L44C_GNKhl3R8xqiLrqmpuxdsLFXW3Lq1FMA\";s:25:\"_csrf/https-edit_user_2fa\";s:43:\"ZTwUzfcJnn3WKT1wyvaY0F1J4kgk4NeEF3qcQiSivBI\";s:27:\"_csrf/https-edit_user_teams\";s:43:\"AATWdAknt0mu_QccAdWStuGLYwT_EpzvYx8LUo8QgqA\";s:36:\"_csrf/https-edit_user_password_token\";s:43:\"ClVu5KRmn4TZ57orXJ0WGnNxdT9cSvRRH9E8afnFGMU\";s:29:\"_csrf/https-edit_user_profile\";s:43:\"HyduRbs30qrZhaDoeBAne6O4Y9kuM0am0ffk71fuC08\";s:27:\"_csrf/https-edit_user_roles\";s:43:\"xGMQF-Fqu1oXiX7FX9utJYenFyMVnaOQ_SFF8HNK5oE\";}_sf2_meta|a:3:{s:1:\"u\";i:1776145149;s:1:\"c\";i:1775491997;s:1:\"l\";i:0;}',1776145149,1776749949),(_binary 'tv1mlo59c8l098je6ss5pugfd5',_binary '_sf2_attributes|a:4:{s:18:\"_csrf/https-search\";s:43:\"Z4SEuRdG0j7va_Q6KsrwaJ9nHw1xS5GwbeBUbqo7U-c\";s:28:\"_csrf/https-datatable_update\";s:43:\"8sUitIK_TT36Jt1zJgAMIEGMlCFk01xugYefRUmezVY\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"AmS6INi_Xmsjw_7h5JIJkWBwVUtyeBHhO6R4XznmI90\";s:22:\"_security_secured_area\";s:437:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:4;s:8:\"username\";s:19:\"hoang.vu@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"hoang.vu@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$ruTDOzYmGbW16JUxk9rA2uD4kpcVs.suYreFn7CIGe9u8mOw4wjfq\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";}_sf2_meta|a:3:{s:1:\"u\";i:1775529034;s:1:\"c\";i:1775529034;s:1:\"l\";i:0;}',1775529034,1776133834),(_binary 'u12akpu16as79bl42pio99ckh0',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"cr0y35CrS1voDK5C58738U2zrZRy2UJeyU0ssZ02X6I\";}_sf2_meta|a:3:{s:1:\"u\";i:1775657716;s:1:\"c\";i:1775657716;s:1:\"l\";i:0;}',1775657716,1776262516),(_binary 'uaakmevf6l0uhcudpcgu8lel14',_binary '_sf2_attributes|a:6:{s:18:\"_csrf/https-search\";s:43:\"4KAHaDUiyJX19g5hNbXDxmkxyz1aGHFOiJMTL0LrUcY\";s:28:\"_csrf/https-datatable_update\";s:43:\"iN2N0UMFZEMtS7SrqLWWAME2h38nGunvUdKih2W-lko\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"5L2zjTngN-22L_lEfNMjPiGBc1Nr8TpkTNPzbAyW1-4\";s:22:\"_security_secured_area\";s:512:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:9;s:8:\"username\";s:19:\"nhu.pham@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:19:\"nhu.pham@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$/Tv6jyHZwPnfoSTN.09bYOJPlh1O4/DjlPJMovAZyXNq8HfVPJjRq\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:4:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";i:3;s:9:\"ROLE_USER\";}}}\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"PwGUyyyBqYx4F7krn7j7leIsFL83fnuJosmTPcgIeXk\";s:19:\"_csrf/https-absence\";s:43:\"CYuEBY3wpMu4SpOF4x5qF0zogOHeKm9WJpPcTXXoHOw\";}_sf2_meta|a:3:{s:1:\"u\";i:1776146499;s:1:\"c\";i:1776137388;s:1:\"l\";i:0;}',1776146499,1776751299),(_binary 'udhv8p5tqto52qf8aevpgfv8fh',_binary '_sf2_attributes|a:5:{s:18:\"_csrf/https-search\";s:43:\"4-dPAocwPaaz5C13gituyvIJ-uMmEYdeB7gbsmpsY4g\";s:28:\"_csrf/https-datatable_update\";s:43:\"QaMuCdn3pWnC0_u-mr5cOnb3eavfodfpRPFs1eqp2MU\";s:32:\"_csrf/https-entities_multiupdate\";s:43:\"kVdQbh9XSuXB75u3WzYQY3KlZpaHYIUKolVxOvAgxPQ\";s:22:\"_security_secured_area\";s:436:\"O:68:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\RememberMeToken\":3:{i:0;s:31:\"change_this_to_something_unique\";i:1;s:12:\"secured_area\";i:2;a:5:{i:0;O:15:\"App\\Entity\\User\":5:{s:2:\"id\";i:14;s:8:\"username\";s:18:\"duc.cao@cosigma.io\";s:7:\"enabled\";b:1;s:5:\"email\";s:18:\"duc.cao@cosigma.io\";s:8:\"password\";s:60:\"$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC\";}i:1;b:1;i:2;N;i:3;a:0:{}i:4;a:1:{i:0;s:9:\"ROLE_USER\";}}}\";s:26:\"_csrf/https-timesheet_edit\";s:43:\"Jfvh22UXttsdqVDD68ptIwjLqTIprNKz40Vm-rHNYSQ\";}_sf2_meta|a:3:{s:1:\"u\";i:1776079669;s:1:\"c\";i:1776079636;s:1:\"l\";i:0;}',1776079669,1776684469),(_binary 'ugulca1f4lmiqslqlrd5ud45ej',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";}_sf2_meta|a:3:{s:1:\"u\";i:1775548018;s:1:\"c\";i:1775548018;s:1:\"l\";i:0;}',1775548018,1776152818),(_binary 'vb5n3jftv3gt83divc66q6gvlp',_binary '_sf2_attributes|a:1:{s:34:\"_security.secured_area.target_path\";s:35:\"https://time.cosigma.io/en/homepage\";}_sf2_meta|a:3:{s:1:\"u\";i:1775009464;s:1:\"c\";i:1775009464;s:1:\"l\";i:0;}',1775009464,1775614264),(_binary 'vmiblep0ncgqbt7pn28l6mfkcd',_binary '_sf2_attributes|a:2:{s:34:\"_security.secured_area.target_path\";s:37:\"https://time.cosigma.io/en/dashboard/\";s:24:\"_csrf/https-authenticate\";s:43:\"DzGOFKs13vxgOXeSr5DJAsUVLZOD_d_D9R-_6l2yeTI\";}_sf2_meta|a:3:{s:1:\"u\";i:1776052800;s:1:\"c\";i:1776052795;s:1:\"l\";i:0;}',1776052800,1776657600),(_binary 'vpkmtsds8c5lec9b781udv0d82',_binary '_sf2_attributes|a:1:{s:24:\"_csrf/https-authenticate\";s:43:\"aGNenZrfT0Mw2VER6eRBwLLpIq6u7TIkeeRA2zpWy0g\";}_sf2_meta|a:3:{s:1:\"u\";i:1775547584;s:1:\"c\";i:1775547584;s:1:\"l\";i:0;}',1775547584,1776152384);
/*!40000 ALTER TABLE `kimai2_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_tags`
--

DROP TABLE IF EXISTS `kimai2_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_27CAF54C5E237E06` (`name`),
  KEY `IDX_27CAF54C7AB0E859` (`visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_tags`
--

LOCK TABLES `kimai2_tags` WRITE;
/*!40000 ALTER TABLE `kimai2_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_teams`
--

DROP TABLE IF EXISTS `kimai2_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3BEDDC7F5E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_teams`
--

LOCK TABLES `kimai2_teams` WRITE;
/*!40000 ALTER TABLE `kimai2_teams` DISABLE KEYS */;
INSERT INTO `kimai2_teams` VALUES (1,'Vietnam - Infra',NULL),(2,'Vietnam - Dev',NULL),(3,'France - STS',NULL),(4,'Department Administration','#ff00ff'),(5,'Vietnam - UX / UI',NULL),(6,'Breachunt',NULL),(7,'Infra',NULL),(8,'Data Engineer','#ffe4e1');
/*!40000 ALTER TABLE `kimai2_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_timesheet`
--

DROP TABLE IF EXISTS `kimai2_timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_timesheet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `activity_id` int NOT NULL,
  `project_id` int NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `rate` double NOT NULL,
  `fixed_rate` double DEFAULT NULL,
  `hourly_rate` double DEFAULT NULL,
  `exported` tinyint(1) NOT NULL DEFAULT '0',
  `timezone` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `internal_rate` double DEFAULT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT '1',
  `category` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'work',
  `modified_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `date_tz` date NOT NULL COMMENT '(DC2Type:date_immutable)',
  `break` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4F60C6B18D93D649` (`user`),
  KEY `IDX_4F60C6B181C06096` (`activity_id`),
  KEY `IDX_4F60C6B1166D1F9C` (`project_id`),
  KEY `IDX_4F60C6B18D93D649502DF587` (`user`,`start_time`),
  KEY `IDX_4F60C6B1502DF587` (`start_time`),
  KEY `IDX_4F60C6B1502DF58741561401` (`start_time`,`end_time`),
  KEY `IDX_4F60C6B1502DF587415614018D93D649` (`start_time`,`end_time`,`user`),
  KEY `IDX_4F60C6B1BDF467148D93D649` (`date_tz`,`user`),
  KEY `IDX_4F60C6B1415614018D93D649` (`end_time`,`user`),
  KEY `IDX_TIMESHEET_TICKTAC` (`end_time`,`user`,`start_time`),
  KEY `IDX_TIMESHEET_RECENT_ACTIVITIES` (`user`,`project_id`,`activity_id`),
  KEY `IDX_TIMESHEET_RESULT_STATS` (`user`,`id`,`duration`),
  CONSTRAINT `FK_4F60C6B1166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4F60C6B181C06096` FOREIGN KEY (`activity_id`) REFERENCES `kimai2_activities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4F60C6B18D93D649` FOREIGN KEY (`user`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_timesheet`
--

LOCK TABLES `kimai2_timesheet` WRITE;
/*!40000 ALTER TABLE `kimai2_timesheet` DISABLE KEYS */;
INSERT INTO `kimai2_timesheet` VALUES (6,10,1,1,'2026-02-23 12:33:00','2026-02-23 20:33:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-02-23 12:36:31','2026-02-23',0),(8,10,1,1,'2026-02-25 12:33:00','2026-02-25 20:33:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-02-23 12:36:31','2026-02-25',0),(13,10,3,3,'2026-02-24 12:36:00','2026-02-24 20:36:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-02-23 12:36:31','2026-02-24',0),(14,10,3,3,'2026-02-26 12:36:00','2026-02-26 20:36:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-02-23 12:36:31','2026-02-26',0),(15,10,3,3,'2026-02-27 12:36:00','2026-02-27 20:36:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-02-23 12:36:31','2026-02-27',0),(18,4,6,5,'2026-02-23 04:03:00','2026-02-23 12:03:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-02-27 04:03:58','2026-02-23',0),(19,4,6,5,'2026-02-24 04:03:00','2026-02-24 12:03:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-02-27 04:03:58','2026-02-24',0),(20,4,6,5,'2026-02-25 04:03:00','2026-02-25 12:03:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-02-27 04:03:58','2026-02-25',0),(21,4,6,5,'2026-02-26 04:03:00','2026-02-26 12:03:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-02-27 04:03:58','2026-02-26',0),(22,4,6,5,'2026-02-27 04:03:00','2026-02-27 12:03:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-02-27 04:03:58','2026-02-27',0),(23,8,6,5,'2026-02-23 02:00:00','2026-02-23 07:00:00',18000,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-02-27 04:39:20','2026-02-23',0),(24,8,6,5,'2026-02-24 02:00:00','2026-02-24 08:00:00',21600,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-02-27 04:39:39','2026-02-24',0),(25,8,6,5,'2026-02-25 02:00:00','2026-02-25 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-02-27 04:39:54','2026-02-25',0),(26,8,6,5,'2026-02-26 02:00:00','2026-02-26 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-02-27 04:40:08','2026-02-26',0),(27,8,6,5,'2026-02-27 02:00:00','2026-02-27 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-02-27 04:40:57','2026-02-27',0),(28,11,3,3,'2026-02-27 09:00:00','2026-02-27 17:00:00',28800,'Intern activity',0,NULL,0,0,'UTC',0,1,'work','2026-03-03 07:03:31','2026-02-27',0),(29,11,3,3,'2026-02-25 09:00:00','2026-02-25 17:00:00',28800,'Intern activity',0,NULL,0,0,'UTC',0,1,'work','2026-03-03 07:29:27','2026-02-25',0),(30,11,3,3,'2026-02-26 09:00:00','2026-02-26 17:00:00',28800,'Intern Activity',0,NULL,0,0,'UTC',0,1,'work','2026-03-03 07:03:42','2026-02-26',0),(31,9,7,7,'2026-03-02 03:00:00','2026-03-02 05:00:00',7200,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,0,'work','2026-03-05 09:48:11','2026-03-02',0),(32,9,7,7,'2026-03-03 03:00:00','2026-03-03 05:00:00',7200,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-05 09:52:33','2026-03-03',0),(33,9,7,7,'2026-03-02 06:00:00','2026-03-02 12:00:00',21600,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-05 09:53:13','2026-03-02',0),(34,9,7,7,'2026-03-03 06:00:00','2026-03-03 12:00:00',21600,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-05 09:53:32','2026-03-03',0),(35,9,7,7,'2026-03-04 03:00:00','2026-03-04 05:00:00',7200,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-05 09:54:07','2026-03-04',0),(36,9,7,7,'2026-03-05 03:00:00','2026-03-05 05:00:00',7200,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-05 09:55:00','2026-03-05',0),(37,9,7,7,'2026-03-04 06:00:00','2026-03-04 12:00:00',21600,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-05 09:55:17','2026-03-04',0),(38,9,7,7,'2026-02-25 03:00:00','2026-02-25 05:00:00',7200,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-05 09:55:46','2026-02-25',0),(41,9,7,7,'2026-02-25 06:00:00','2026-02-25 12:00:00',21600,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-05 09:56:39','2026-02-25',0),(42,9,7,7,'2026-02-26 03:00:00','2026-02-26 05:00:00',7200,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-05 09:57:07','2026-02-26',0),(43,9,7,7,'2026-02-26 06:00:00','2026-02-26 12:00:00',21600,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-05 09:57:24','2026-02-26',0),(44,9,7,7,'2026-03-05 06:00:00','2026-03-05 12:00:00',21600,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-05 09:57:59','2026-03-05',0),(45,9,7,7,'2026-02-27 03:00:00','2026-02-27 05:00:00',7200,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-05 09:59:13','2026-02-27',0),(46,9,7,7,'2026-02-27 06:00:00','2026-02-27 12:00:00',21600,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-05 09:59:32','2026-02-27',0),(47,4,2,2,'2026-03-06 14:29:00','2026-03-06 18:29:00',14400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-05 14:29:26','2026-03-06',0),(48,4,6,5,'2026-03-02 14:29:00','2026-03-02 22:29:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-05 14:29:26','2026-03-02',0),(49,4,6,5,'2026-03-03 14:29:00','2026-03-03 22:29:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-05 14:29:26','2026-03-03',0),(50,4,6,5,'2026-03-04 14:29:00','2026-03-04 22:29:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-05 14:29:26','2026-03-04',0),(51,4,6,5,'2026-03-05 14:29:00','2026-03-05 22:29:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-05 14:29:26','2026-03-05',0),(52,4,6,5,'2026-03-06 14:29:00','2026-03-06 18:29:00',14400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-05 14:29:26','2026-03-06',0),(53,8,6,5,'2026-03-02 02:00:00','2026-03-02 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-06 07:06:04','2026-03-02',0),(54,8,6,5,'2026-03-03 02:00:00','2026-03-03 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-06 08:50:21','2026-03-03',0),(55,8,6,5,'2026-03-04 02:00:00','2026-03-04 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-06 08:50:16','2026-03-04',0),(56,8,6,5,'2026-03-05 02:00:00','2026-03-05 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-06 08:51:07','2026-03-05',0),(57,8,6,5,'2026-03-06 02:00:00','2026-03-06 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-06 08:50:54','2026-03-06',0),(58,11,3,3,'2026-03-02 09:00:00','2026-03-02 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-06 09:36:09','2026-03-02',0),(59,11,3,3,'2026-03-04 09:00:00','2026-03-04 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-06 09:36:38','2026-03-04',0),(60,11,3,3,'2026-03-03 09:00:00','2026-03-03 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-06 09:37:04','2026-03-03',0),(61,11,3,3,'2026-03-05 09:00:00','2026-03-05 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-06 09:37:21','2026-03-05',0),(62,11,3,3,'2026-03-06 09:00:00','2026-03-06 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-06 09:37:36','2026-03-06',0),(63,10,1,1,'2026-03-02 09:00:00','2026-03-02 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-06 10:40:21','2026-03-02',0),(64,10,1,1,'2026-03-03 09:00:00','2026-03-03 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-06 10:37:09','2026-03-03',0),(65,10,2,2,'2026-03-06 09:00:00','2026-03-06 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-06 10:40:03','2026-03-06',0),(66,10,3,3,'2026-03-05 09:00:00','2026-03-05 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-06 10:40:41','2026-03-05',0),(67,10,3,3,'2026-03-04 09:00:00','2026-03-04 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-06 10:41:18','2026-03-04',0),(68,3,10,5,'2026-03-09 08:00:00','2026-03-09 16:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:45:33','2026-03-09',0),(69,3,10,5,'2026-03-10 08:00:00','2026-03-10 16:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:48:27','2026-03-10',0),(70,11,3,3,'2026-03-09 09:00:00','2026-03-09 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-10 10:12:32','2026-03-09',0),(71,11,3,3,'2026-03-10 09:00:00','2026-03-10 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-10 10:12:51','2026-03-10',0),(72,3,9,3,'2026-03-11 08:30:00','2026-03-11 17:00:00',30600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:39:33','2026-03-11',0),(73,3,9,3,'2026-03-12 07:30:00','2026-03-12 15:30:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:44:17','2026-03-12',0),(74,3,9,3,'2026-03-13 08:00:00','2026-03-13 16:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:47:43','2026-03-13',0),(75,3,9,3,'2026-03-02 08:30:00','2026-03-02 16:30:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:48:04','2026-03-02',0),(76,3,10,5,'2026-03-03 08:00:00','2026-03-03 16:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:48:16','2026-03-03',0),(77,3,10,5,'2026-03-04 09:00:00','2026-03-04 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:44:36','2026-03-04',0),(78,8,6,5,'2026-03-09 02:00:00','2026-03-09 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-13 03:07:09','2026-03-09',0),(79,4,6,5,'2026-03-09 03:07:00','2026-03-09 11:07:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-13 03:07:25','2026-03-09',0),(80,4,6,5,'2026-03-10 03:07:00','2026-03-10 11:07:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-13 03:07:25','2026-03-10',0),(81,4,6,5,'2026-03-11 03:07:00','2026-03-11 11:07:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-13 03:07:25','2026-03-11',0),(82,4,6,5,'2026-03-12 03:07:00','2026-03-12 11:07:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-13 03:07:25','2026-03-12',0),(83,4,6,5,'2026-03-13 03:07:00','2026-03-13 11:07:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-13 03:07:25','2026-03-13',0),(84,3,10,5,'2026-03-05 08:30:00','2026-03-05 17:00:00',30600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:40:00','2026-03-05',0),(85,3,9,3,'2026-03-06 08:30:00','2026-03-06 16:30:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:45:13','2026-03-06',0),(86,8,6,5,'2026-03-10 02:00:00','2026-03-10 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-13 03:50:34','2026-03-10',0),(87,8,6,5,'2026-03-11 02:00:00','2026-03-11 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-13 03:50:49','2026-03-11',0),(88,8,6,5,'2026-03-12 02:00:00','2026-03-12 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-13 03:51:03','2026-03-12',0),(89,8,6,5,'2026-03-13 02:00:00','2026-03-13 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-13 03:51:16','2026-03-13',0),(90,9,7,7,'2026-03-13 03:00:00','2026-03-13 05:00:00',7200,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-13 07:37:55','2026-03-13',0),(91,9,7,7,'2026-03-13 06:00:00','2026-03-13 12:00:00',21600,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-13 07:38:08','2026-03-13',0),(92,11,1,1,'2026-03-11 09:00:00','2026-03-11 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-13 08:26:53','2026-03-11',0),(93,11,1,1,'2026-03-12 09:00:00','2026-03-12 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-13 08:27:14','2026-03-12',0),(94,11,1,1,'2026-03-13 09:00:00','2026-03-13 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-13 08:27:46','2026-03-13',0),(95,10,1,1,'2026-03-09 09:00:00','2026-03-09 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-13 10:01:46','2026-03-09',0),(96,10,1,1,'2026-03-10 09:00:00','2026-03-10 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-13 10:12:49','2026-03-10',0),(97,10,3,3,'2026-03-11 09:00:00','2026-03-11 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-13 10:14:51','2026-03-11',0),(98,10,2,2,'2026-03-12 09:00:00','2026-03-12 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-13 10:15:45','2026-03-12',0),(99,10,2,2,'2026-03-13 09:00:00','2026-03-13 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-13 10:15:33','2026-03-13',0),(100,3,9,3,'2026-03-16 09:15:00','2026-03-16 17:15:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:38:48','2026-03-16',0),(101,11,3,3,'2026-03-16 09:00:00','2026-03-16 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-16 06:09:29','2026-03-16',0),(102,9,7,7,'2026-03-12 03:00:00','2026-03-12 05:00:00',7200,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-16 11:39:38','2026-03-12',0),(103,9,7,7,'2026-03-12 06:00:00','2026-03-12 12:00:00',21600,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-16 11:39:51','2026-03-12',0),(104,9,7,7,'2026-03-11 03:00:00','2026-03-11 05:00:00',7200,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-16 11:40:07','2026-03-11',0),(105,9,7,7,'2026-03-11 06:00:00','2026-03-11 12:00:00',21600,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-16 11:40:22','2026-03-11',0),(106,9,7,7,'2026-03-10 03:00:00','2026-03-10 05:00:00',7200,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-16 11:40:39','2026-03-10',0),(107,9,7,7,'2026-03-10 06:00:00','2026-03-10 12:00:00',21600,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-16 11:40:55','2026-03-10',0),(108,9,7,7,'2026-03-09 03:00:00','2026-03-09 05:00:00',7200,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-16 11:41:12','2026-03-09',0),(109,9,7,7,'2026-03-09 06:00:00','2026-03-09 12:00:00',21600,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-16 11:41:27','2026-03-09',0),(110,9,7,7,'2026-03-06 03:00:00','2026-03-06 05:00:00',7200,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-16 12:01:15','2026-03-06',0),(111,9,7,7,'2026-03-06 06:00:00','2026-03-06 12:00:00',21600,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-16 12:01:27','2026-03-06',0),(112,7,6,5,'2026-03-02 01:03:00','2026-03-02 04:03:00',10800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-17 01:03:10','2026-03-02',0),(113,7,6,5,'2026-03-03 01:03:00','2026-03-03 04:03:00',10800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-17 01:03:10','2026-03-03',0),(114,7,6,5,'2026-03-04 01:03:00','2026-03-04 04:03:00',10800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-17 01:03:10','2026-03-04',0),(115,7,6,5,'2026-03-05 01:03:00','2026-03-05 06:03:00',18000,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-17 01:03:10','2026-03-05',0),(116,7,6,5,'2026-03-06 01:03:00','2026-03-06 04:03:00',10800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-17 01:03:10','2026-03-06',0),(117,7,6,5,'2026-03-09 01:03:00','2026-03-09 04:03:00',10800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-17 01:03:58','2026-03-09',0),(118,7,6,5,'2026-03-10 01:03:00','2026-03-10 04:03:00',10800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-17 01:03:58','2026-03-10',0),(119,7,6,5,'2026-03-11 01:03:00','2026-03-11 04:03:00',10800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-17 01:03:58','2026-03-11',0),(120,7,6,5,'2026-03-12 01:03:00','2026-03-12 04:03:00',10800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-17 01:03:58','2026-03-12',0),(121,7,6,5,'2026-03-13 01:03:00','2026-03-13 04:03:00',10800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-17 01:03:58','2026-03-13',0),(122,3,9,3,'2026-03-17 08:30:00','2026-03-17 17:00:00',30600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:38:34','2026-03-17',0),(123,9,7,7,'2026-03-16 18:00:00','2026-03-17 01:00:00',25200,'In office',0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-17 06:13:03','2026-03-17',0),(124,9,7,7,'2026-03-17 06:19:00','2026-03-17 06:20:00',60,'In office',0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-17 06:19:12','2026-03-17',0),(125,3,9,3,'2026-03-18 08:00:00','2026-03-18 16:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:48:50','2026-03-18',0),(131,11,7,7,'2026-03-17 09:00:00','2026-03-17 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-18 08:13:37','2026-03-17',0),(132,11,7,7,'2026-03-18 09:00:00','2026-03-18 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-18 08:14:03','2026-03-18',0),(133,3,9,3,'2026-03-19 09:00:00','2026-03-19 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:38:14','2026-03-19',0),(134,3,9,3,'2026-03-20 08:30:00','2026-03-20 17:00:00',30600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:38:05','2026-03-20',0),(135,11,7,7,'2026-03-19 09:00:00','2026-03-19 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 02:59:51','2026-03-19',0),(136,11,7,7,'2026-03-20 09:00:00','2026-03-20 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 03:00:12','2026-03-20',0),(137,12,3,3,'2026-03-20 02:00:00','2026-03-20 05:00:00',10800,'- Understand and analyze the project’s codebase\n- Learn Python and FastAPI',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-03-20 04:36:20','2026-03-20',0),(138,12,3,3,'2026-03-20 06:00:00','2026-03-20 11:00:00',18000,'- Understand and analyze the project’s codebase\n- Learn Python and FastAPI\n- Learn Microservices and Monorepo',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-03-20 04:38:26','2026-03-20',0),(139,10,1,1,'2026-03-16 09:00:00','2026-03-16 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 07:35:00','2026-03-16',0),(140,10,1,1,'2026-03-17 09:00:00','2026-03-17 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 07:35:31','2026-03-17',0),(141,10,3,3,'2026-03-19 09:00:00','2026-03-19 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 07:35:46','2026-03-19',0),(142,10,1,1,'2026-03-18 09:00:00','2026-03-18 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 07:36:15','2026-03-18',0),(143,10,5,5,'2026-03-20 09:00:00','2026-03-20 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 07:36:46','2026-03-20',0),(144,4,8,3,'2026-03-16 07:45:00','2026-03-16 11:45:00',14400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 08:29:55','2026-03-16',0),(145,4,8,3,'2026-03-17 07:45:00','2026-03-17 13:45:00',21600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 08:29:55','2026-03-17',0),(146,4,8,3,'2026-03-18 07:45:00','2026-03-18 13:45:00',21600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 08:29:55','2026-03-18',0),(147,4,8,3,'2026-03-19 07:45:00','2026-03-19 12:45:00',18000,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 08:29:55','2026-03-19',0),(148,4,8,3,'2026-03-20 07:45:00','2026-03-20 13:45:00',21600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 08:29:55','2026-03-20',0),(149,4,6,5,'2026-03-16 07:45:00','2026-03-16 11:45:00',14400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 08:29:55','2026-03-16',0),(150,4,6,5,'2026-03-17 07:45:00','2026-03-17 09:45:00',7200,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 08:29:55','2026-03-17',0),(151,4,6,5,'2026-03-18 07:45:00','2026-03-18 09:45:00',7200,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 08:29:55','2026-03-18',0),(152,4,6,5,'2026-03-19 07:45:00','2026-03-19 10:45:00',10800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 08:29:55','2026-03-19',0),(153,4,6,5,'2026-03-20 07:45:00','2026-03-20 09:45:00',7200,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-20 08:29:55','2026-03-20',0),(154,8,6,5,'2026-03-16 02:00:00','2026-03-16 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-20 09:16:19','2026-03-16',0),(155,8,6,5,'2026-03-17 02:00:00','2026-03-17 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-20 09:16:31','2026-03-17',0),(156,8,6,5,'2026-03-18 02:00:00','2026-03-18 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-20 09:25:27','2026-03-18',0),(157,8,6,5,'2026-03-19 02:00:00','2026-03-19 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-20 09:25:39','2026-03-19',0),(158,8,6,5,'2026-03-20 02:00:00','2026-03-20 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-20 09:25:49','2026-03-20',0),(159,3,9,3,'2026-03-23 13:00:00','2026-03-23 21:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:37:47','2026-03-23',0),(160,12,8,3,'2026-03-23 02:00:00','2026-03-23 05:00:00',10800,'- Learn Python and FastAPI\n- Learn Microservices and Monorepo',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-03-23 10:38:15','2026-03-23',0),(161,12,8,3,'2026-03-23 06:00:00','2026-03-23 11:00:00',18000,'- Learn Python and FastAPI\n- Learn Microservices and Monorepo',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-03-23 10:38:39','2026-03-23',0),(163,12,8,3,'2026-03-24 02:00:00','2026-03-24 05:00:00',10800,'Setup backend environment',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-03-24 11:05:11','2026-03-24',0),(164,12,8,3,'2026-03-24 06:00:00','2026-03-24 11:00:00',18000,'Setup backend environment',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-03-24 11:05:42','2026-03-24',0),(165,11,1,1,'2026-03-23 09:00:00','2026-03-23 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-24 11:09:55','2026-03-23',0),(166,11,1,1,'2026-03-24 09:00:00','2026-03-24 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-24 11:10:14','2026-03-24',0),(167,3,9,3,'2026-03-24 09:00:00','2026-03-24 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:37:37','2026-03-24',0),(168,12,8,3,'2026-03-25 02:00:00','2026-03-25 05:00:00',10800,'Set up Logto and frontend environment',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-03-25 10:26:17','2026-03-25',0),(169,12,8,3,'2026-03-25 06:00:00','2026-03-25 11:00:00',18000,'Set up Logto and frontend environment',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-03-25 10:26:43','2026-03-25',0),(170,3,9,3,'2026-03-25 09:30:00','2026-03-25 18:00:00',30600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:37:26','2026-03-25',0),(171,3,9,3,'2026-03-26 08:00:00','2026-03-26 16:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:43:55','2026-03-26',0),(172,7,6,5,'2026-03-16 02:06:00','2026-03-16 04:06:00',7200,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-26 02:06:58','2026-03-16',0),(173,7,6,5,'2026-03-17 02:06:00','2026-03-17 04:36:00',9000,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-26 02:06:58','2026-03-17',0),(174,7,6,5,'2026-03-18 02:06:00','2026-03-18 03:06:00',3600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-26 02:06:58','2026-03-18',0),(175,7,6,5,'2026-03-19 02:06:00','2026-03-19 03:06:00',3600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-26 02:06:58','2026-03-19',0),(176,7,6,5,'2026-03-20 02:06:00','2026-03-20 04:06:00',7200,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-26 02:06:58','2026-03-20',0),(177,7,6,5,'2026-03-23 02:07:00','2026-03-23 03:07:00',3600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-29 04:45:34','2026-03-23',0),(178,7,6,5,'2026-03-24 02:07:00','2026-03-24 03:07:00',3600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-29 04:45:34','2026-03-24',0),(179,7,6,5,'2026-03-25 02:07:00','2026-03-25 06:07:00',14400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-29 04:45:34','2026-03-25',0),(180,9,7,7,'2026-03-26 03:00:00','2026-03-26 12:00:00',32400,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-26 08:22:15','2026-03-26',0),(181,9,7,7,'2026-03-25 03:00:00','2026-03-25 12:00:00',32400,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-26 08:22:40','2026-03-25',0),(182,9,7,7,'2026-03-24 03:00:00','2026-03-24 12:00:00',32400,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,0,'work','2026-03-26 08:32:01','2026-03-24',0),(183,9,7,7,'2026-03-23 03:00:00','2026-03-23 12:00:00',32400,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-26 08:23:30','2026-03-23',0),(184,9,7,7,'2026-03-20 03:00:00','2026-03-20 12:00:00',32400,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-26 08:29:30','2026-03-20',0),(185,9,7,7,'2026-03-19 03:00:00','2026-03-19 12:00:00',32400,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-26 08:29:52','2026-03-19',0),(186,9,7,7,'2026-03-18 03:00:00','2026-03-18 12:00:00',32400,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-26 08:30:21','2026-03-18',0),(187,9,7,7,'2026-03-16 03:00:00','2026-03-16 12:00:00',32400,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-26 08:30:48','2026-03-16',0),(188,12,8,3,'2026-03-26 02:00:00','2026-03-26 05:00:00',10800,'Run the frontend in local',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-03-26 10:52:31','2026-03-26',0),(189,12,8,3,'2026-03-26 06:00:00','2026-03-26 11:00:00',18000,'Understand the project structure',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-03-26 10:53:46','2026-03-26',0),(190,7,6,5,'2026-03-26 01:47:00','2026-03-26 02:47:00',3600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-29 04:45:34','2026-03-26',0),(191,3,9,3,'2026-03-27 09:00:00','2026-03-27 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 12:37:00','2026-03-27',0),(192,11,7,7,'2026-03-25 09:00:00','2026-03-25 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 08:52:18','2026-03-25',0),(193,11,7,7,'2026-03-26 09:00:00','2026-03-26 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 08:52:46','2026-03-26',0),(194,11,7,7,'2026-03-27 09:00:00','2026-03-27 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-27 08:53:29','2026-03-27',0),(195,8,6,5,'2026-03-23 02:00:00','2026-03-23 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-27 15:42:09','2026-03-23',0),(196,8,6,5,'2026-03-24 02:00:00','2026-03-24 11:00:00',32400,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-27 15:42:27','2026-03-24',0),(197,8,6,5,'2026-03-25 02:00:00','2026-03-25 12:00:00',36000,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-27 15:42:47','2026-03-25',0),(198,8,8,3,'2026-03-26 02:00:00','2026-03-26 08:00:00',21600,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-27 15:43:05','2026-03-26',0),(199,8,6,5,'2026-03-26 15:43:00','2026-03-26 17:43:00',7200,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-27 15:43:29','2026-03-26',0),(200,8,8,3,'2026-03-27 02:00:00','2026-03-27 10:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-03-27 15:43:46','2026-03-27',0),(201,4,8,3,'2026-03-23 03:31:00','2026-03-23 10:31:00',25200,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-29 03:31:05','2026-03-23',0),(202,4,8,3,'2026-03-24 03:31:00','2026-03-24 10:31:00',25200,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-29 03:31:05','2026-03-24',0),(203,4,8,3,'2026-03-25 03:31:00','2026-03-25 10:31:00',25200,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-29 03:31:05','2026-03-25',0),(204,4,8,3,'2026-03-26 03:31:00','2026-03-26 11:31:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-29 03:31:05','2026-03-26',0),(205,4,8,3,'2026-03-27 03:31:00','2026-03-27 11:31:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-29 03:31:05','2026-03-27',0),(206,4,8,3,'2026-03-28 03:31:00','2026-03-28 03:31:00',0,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-29 03:31:05','2026-03-28',0),(207,4,6,5,'2026-03-23 03:31:00','2026-03-23 04:31:00',3600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-29 03:31:05','2026-03-23',0),(208,4,6,5,'2026-03-24 03:31:00','2026-03-24 04:31:00',3600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-29 03:31:05','2026-03-24',0),(209,4,6,5,'2026-03-25 03:31:00','2026-03-25 04:31:00',3600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-29 03:31:05','2026-03-25',0),(210,7,6,5,'2026-03-27 04:45:00','2026-03-27 07:45:00',10800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-29 04:45:34','2026-03-27',0),(211,3,9,3,'2026-03-30 08:15:00','2026-03-30 16:15:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-30 01:16:58','2026-03-30',0),(212,11,1,1,'2026-03-30 09:00:00','2026-03-30 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-31 05:51:46','2026-03-30',3600),(215,4,8,3,'2026-04-01 09:00:00','2026-04-01 16:00:00',21600,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-06 02:33:05','2026-04-01',3600),(216,4,8,3,'2026-04-01 04:00:00','2026-04-01 06:00:00',7200,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-06 02:33:05','2026-04-01',0),(218,10,1,1,'2026-03-30 09:00:00','2026-03-30 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-30 12:13:12','2026-03-30',3600),(220,11,1,1,'2026-03-31 09:00:00','2026-03-31 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-03-31 05:50:58','2026-03-31',3600),(221,12,8,3,'2026-03-31 02:00:00','2026-03-31 05:00:00',10800,'Update document datamodel based on the form of document creation',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-03-31 11:08:54','2026-03-31',0),(222,12,8,3,'2026-03-31 06:00:00','2026-03-31 11:00:00',18000,'Update document datamodel based on the form of document creation',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-03-31 11:09:12','2026-03-31',0),(223,14,3,3,'2026-04-01 09:00:00','2026-04-01 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-01 04:21:49','2026-04-01',3600),(224,15,11,8,'2026-04-01 09:00:00','2026-04-01 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-02 03:21:03','2026-04-01',3600),(225,12,8,3,'2026-04-01 02:00:00','2026-04-01 10:00:00',25200,'Update document data model based on the form of document creation',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-04-01 09:12:14','2026-04-01',3600),(226,11,7,7,'2026-04-01 09:00:00','2026-04-01 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-02 02:13:48','2026-04-01',3600),(227,11,7,7,'2026-04-02 09:00:00','2026-04-02 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-02 02:14:05','2026-04-02',3600),(228,15,11,8,'2026-04-02 09:00:00','2026-04-02 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-02 03:20:55','2026-04-02',3600),(229,14,3,3,'2026-04-02 09:30:00','2026-04-02 18:30:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-02 02:32:56','2026-04-02',3600),(230,9,7,7,'2026-04-02 03:00:00','2026-04-02 12:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-02 03:09:12','2026-04-02',3600),(231,9,7,7,'2026-04-01 02:30:00','2026-04-01 11:30:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-02 03:09:40','2026-04-01',3600),(232,3,9,3,'2026-04-01 08:00:00','2026-04-01 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-03 06:41:58','2026-04-01',3600),(233,3,9,3,'2026-04-02 08:00:00','2026-04-02 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-03 06:41:44','2026-04-02',3600),(234,3,9,3,'2026-03-31 08:00:00','2026-03-31 16:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-02 05:18:30','2026-03-31',0),(236,15,11,8,'2026-04-03 09:00:00','2026-04-03 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-03 04:05:34','2026-04-03',3600),(237,9,7,7,'2026-04-03 03:00:00','2026-04-03 12:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-03 04:29:23','2026-04-03',3600),(238,3,9,3,'2026-04-03 08:00:00','2026-04-03 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-03 06:43:16','2026-04-03',3600),(239,12,8,3,'2026-04-03 02:00:00','2026-04-03 11:00:00',28800,'- Test AI suggestion\n- Research codebase',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-04-03 08:32:52','2026-04-03',3600),(240,2,7,7,'2026-04-01 01:00:00','2026-04-01 09:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-03 09:18:40','2026-04-01',0),(241,11,1,1,'2026-04-03 09:00:00','2026-04-03 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-03 09:27:20','2026-04-03',3600),(242,14,3,3,'2026-04-03 09:29:00','2026-04-03 17:00:00',23460,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-03 09:58:08','2026-04-03',3600),(243,3,12,9,'2026-04-06 08:00:00','2026-04-06 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-06 02:33:13','2026-04-06',3600),(244,4,2,2,'2026-04-06 02:32:00','2026-04-06 02:32:00',0,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-13 02:53:08','2026-04-06',0),(245,4,8,3,'2026-03-30 02:32:00','2026-03-30 10:32:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-06 02:33:05','2026-03-30',0),(246,4,8,3,'2026-03-31 02:32:00','2026-03-31 10:32:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-06 02:33:05','2026-03-31',0),(247,4,8,3,'2026-04-02 02:32:00','2026-04-02 10:32:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-06 02:33:05','2026-04-02',0),(248,4,8,3,'2026-04-03 02:32:00','2026-04-03 10:32:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-06 02:33:05','2026-04-03',0),(249,15,11,8,'2026-04-06 09:00:00','2026-04-06 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-06 02:57:45','2026-04-06',0),(250,14,3,3,'2026-04-06 09:00:00','2026-04-06 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-06 09:39:07','2026-04-06',3600),(251,12,8,3,'2026-04-06 02:00:00','2026-04-06 11:00:00',28800,'Split document creation from first revision creation',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-04-06 12:10:12','2026-04-06',3600),(252,8,8,3,'2026-03-30 02:00:00','2026-03-30 11:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-07 03:47:58','2026-03-30',3600),(253,8,8,3,'2026-03-31 02:00:00','2026-03-31 11:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-07 03:48:18','2026-03-31',3600),(254,8,8,3,'2026-04-01 02:00:00','2026-04-01 11:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-07 03:48:36','2026-04-01',3600),(255,8,8,3,'2026-04-02 02:00:00','2026-04-02 11:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-07 03:48:49','2026-04-02',3600),(256,8,8,3,'2026-04-03 02:00:00','2026-04-03 11:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-07 03:49:06','2026-04-03',3600),(257,15,11,8,'2026-04-07 09:00:00','2026-04-07 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-07 04:13:28','2026-04-07',3600),(258,12,8,3,'2026-04-07 14:00:00','2026-04-07 23:00:00',28800,'- Split document creation from first revision creation\n- Test DocReview staging',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-04-07 05:38:35','2026-04-07',3600),(259,14,3,3,'2026-04-07 08:00:00','2026-04-07 16:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-07 06:02:19','2026-04-07',0),(260,9,7,7,'2026-04-06 03:00:00','2026-04-06 12:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-07 08:53:40','2026-04-06',3600),(261,9,7,7,'2026-03-30 03:00:00','2026-03-30 12:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-07 08:53:59','2026-03-30',3600),(263,9,7,7,'2026-03-27 03:00:00','2026-03-27 12:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-07 08:54:37','2026-03-27',3600),(264,15,11,8,'2026-04-08 09:00:00','2026-04-08 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-08 02:10:37','2026-04-08',3600),(265,12,8,3,'2026-04-08 02:00:00','2026-04-08 10:00:00',25200,'Functional test DocReview web',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-04-08 07:38:18','2026-04-08',3600),(266,5,4,4,'2026-03-02 11:05:00','2026-03-02 19:05:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:05:47','2026-03-02',0),(267,5,4,4,'2026-03-03 11:05:00','2026-03-03 19:05:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:05:47','2026-03-03',0),(268,5,4,4,'2026-03-04 11:05:00','2026-03-04 19:05:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:05:47','2026-03-04',0),(269,5,4,4,'2026-03-05 11:05:00','2026-03-05 19:05:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:05:47','2026-03-05',0),(270,5,4,4,'2026-03-06 11:05:00','2026-03-06 19:05:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:05:47','2026-03-06',0),(271,5,4,4,'2026-03-09 11:06:00','2026-03-09 19:06:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:06:16','2026-03-09',0),(272,5,4,4,'2026-03-10 11:06:00','2026-03-10 19:06:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:06:16','2026-03-10',0),(273,5,4,4,'2026-03-11 11:06:00','2026-03-11 19:06:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:06:16','2026-03-11',0),(274,5,4,4,'2026-03-12 11:06:00','2026-03-12 19:06:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:06:16','2026-03-12',0),(275,5,4,4,'2026-03-13 11:06:00','2026-03-13 19:06:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:06:16','2026-03-13',0),(276,5,4,4,'2026-03-16 11:06:00','2026-03-16 19:06:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:06:42','2026-03-16',0),(277,5,4,4,'2026-03-17 11:06:00','2026-03-17 19:06:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:06:42','2026-03-17',0),(278,5,4,4,'2026-03-18 11:06:00','2026-03-18 19:06:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:06:42','2026-03-18',0),(279,5,4,4,'2026-03-19 11:06:00','2026-03-19 19:06:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:06:42','2026-03-19',0),(280,5,4,4,'2026-03-20 11:06:00','2026-03-20 19:06:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:06:42','2026-03-20',0),(281,5,4,4,'2026-03-23 11:07:00','2026-03-23 19:07:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:07:05','2026-03-23',0),(282,5,4,4,'2026-03-24 11:07:00','2026-03-24 19:07:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:07:05','2026-03-24',0),(283,5,4,4,'2026-03-25 11:07:00','2026-03-25 19:07:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:07:05','2026-03-25',0),(284,5,4,4,'2026-03-26 11:07:00','2026-03-26 19:07:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:07:05','2026-03-26',0),(285,5,4,4,'2026-03-27 11:07:00','2026-03-27 19:07:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:07:05','2026-03-27',0),(286,5,4,4,'2026-03-30 10:07:00','2026-03-30 18:07:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:07:29','2026-03-30',0),(287,5,4,4,'2026-03-31 10:07:00','2026-03-31 18:07:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:07:29','2026-03-31',0),(288,5,4,4,'2026-04-01 10:07:00','2026-04-01 18:07:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:07:29','2026-04-01',0),(289,5,4,4,'2026-04-02 10:07:00','2026-04-02 18:07:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:07:29','2026-04-02',0),(290,5,4,4,'2026-04-03 10:07:00','2026-04-03 18:07:00',28800,NULL,0,NULL,0,0,'Europe/Paris',0,1,'work','2026-04-08 10:07:29','2026-04-03',0),(291,14,3,3,'2026-04-08 09:00:00','2026-04-08 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-09 07:13:39','2026-04-08',3600),(292,14,3,3,'2026-04-09 09:00:00','2026-04-09 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-09 07:13:27','2026-04-09',3600),(293,15,11,8,'2026-04-09 09:00:00','2026-04-09 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-09 07:18:05','2026-04-09',0),(294,3,12,9,'2026-04-07 09:02:00','2026-04-07 18:02:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-09 09:03:05','2026-04-07',3600),(295,3,12,9,'2026-04-08 09:03:00','2026-04-08 18:03:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-09 09:03:38','2026-04-08',3600),(296,3,12,9,'2026-04-09 09:04:00','2026-04-09 18:04:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-09 09:04:17','2026-04-09',3600),(297,3,12,9,'2026-04-10 09:04:00','2026-04-10 18:04:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-09 09:04:40','2026-04-10',3600),(298,10,1,1,'2026-04-01 09:00:00','2026-04-01 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-10 08:10:54','2026-04-01',3600),(299,10,1,1,'2026-04-07 09:00:00','2026-04-07 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-10 08:12:04','2026-04-07',3600),(300,10,1,1,'2026-04-03 09:00:00','2026-04-03 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-10 08:11:44','2026-04-03',3600),(301,10,1,1,'2026-04-02 09:00:00','2026-04-02 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-10 08:12:35','2026-04-02',3600),(302,10,1,1,'2026-04-08 09:00:00','2026-04-08 12:00:00',10800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-10 08:14:57','2026-04-08',0),(303,10,1,1,'2026-04-06 09:00:00','2026-04-06 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-10 08:14:43','2026-04-06',3600),(304,8,8,3,'2026-04-06 02:00:00','2026-04-06 11:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-10 09:53:08','2026-04-06',3600),(305,8,8,3,'2026-04-07 02:00:00','2026-04-07 11:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-10 09:53:24','2026-04-07',3600),(306,8,8,3,'2026-04-08 02:00:00','2026-04-08 11:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-10 09:53:45','2026-04-08',3600),(307,8,8,3,'2026-04-09 02:00:00','2026-04-09 11:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-10 09:54:01','2026-04-09',3600),(308,8,8,3,'2026-04-10 02:00:00','2026-04-10 11:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-10 09:54:20','2026-04-10',3600),(309,14,3,3,'2026-04-10 09:00:00','2026-04-10 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-10 10:32:39','2026-04-10',3600),(310,12,8,3,'2026-04-10 02:00:00','2026-04-10 10:00:00',25200,'Functional test DocReview web',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-04-10 10:55:13','2026-04-10',3600),(311,15,11,8,'2026-04-10 09:00:00','2026-04-10 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-10 14:26:03','2026-04-10',3600),(312,11,1,1,'2026-04-06 09:00:00','2026-04-06 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-10 16:06:29','2026-04-06',3600),(313,11,1,1,'2026-04-07 09:00:00','2026-04-07 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-10 16:06:21','2026-04-07',3600),(314,11,1,1,'2026-04-08 09:00:00','2026-04-08 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-10 16:06:11','2026-04-08',3600),(315,11,1,1,'2026-04-09 09:00:00','2026-04-09 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-10 16:06:00','2026-04-09',3600),(316,11,1,1,'2026-04-10 09:00:00','2026-04-10 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-10 15:39:46','2026-04-10',3600),(317,4,8,3,'2026-04-13 02:52:00','2026-04-13 02:52:00',0,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-13 02:52:54','2026-04-13',0),(318,4,8,3,'2026-04-14 02:52:00','2026-04-14 02:52:00',0,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-13 02:52:54','2026-04-14',0),(319,4,8,3,'2026-04-15 02:52:00','2026-04-15 02:52:00',0,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-13 02:52:54','2026-04-15',0),(320,4,8,3,'2026-04-16 02:52:00','2026-04-16 02:52:00',0,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-13 02:52:54','2026-04-16',0),(321,4,8,3,'2026-04-17 02:52:00','2026-04-17 02:52:00',0,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-13 02:52:54','2026-04-17',0),(322,4,8,3,'2026-04-06 02:53:00','2026-04-06 10:53:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-13 02:53:08','2026-04-06',0),(323,4,8,3,'2026-04-07 02:53:00','2026-04-07 11:53:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-13 07:26:13','2026-04-07',3600),(324,4,8,3,'2026-04-08 02:53:00','2026-04-08 11:53:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-13 07:25:30','2026-04-08',3600),(325,4,8,3,'2026-04-09 02:53:00','2026-04-09 11:53:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-13 07:25:20','2026-04-09',3600),(326,4,8,3,'2026-04-10 02:53:00','2026-04-10 11:53:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-13 07:24:58','2026-04-10',3600),(327,3,12,9,'2026-04-13 09:00:00','2026-04-13 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-13 03:12:42','2026-04-13',3600),(328,15,11,8,'2026-04-13 09:00:00','2026-04-13 18:00:00',32400,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-13 04:00:27','2026-04-13',0),(329,12,8,3,'2026-04-13 02:00:00','2026-04-13 11:00:00',28800,'Get author name by ID from Logto',0,NULL,0,0,'Asia/Bangkok',0,1,'work','2026-04-13 10:07:29','2026-04-13',3600),(330,14,1,1,'2026-04-13 09:00:00','2026-04-13 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-13 11:27:48','2026-04-13',3600),(331,14,1,1,'2026-04-14 21:00:00','2026-04-15 06:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-14 03:19:53','2026-04-14',3600),(332,15,11,8,'2026-04-14 09:00:00','2026-04-14 18:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-14 03:35:07','2026-04-14',3600),(333,9,7,7,'2026-04-07 03:00:00','2026-04-07 12:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-14 06:00:30','2026-04-07',3600),(334,9,7,7,'2026-04-08 03:00:00','2026-04-08 12:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-14 06:00:22','2026-04-08',3600),(335,9,7,7,'2026-04-09 03:00:00','2026-04-09 12:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-14 06:00:45','2026-04-09',3600),(336,9,7,7,'2026-04-10 03:00:00','2026-04-10 12:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-14 06:01:09','2026-04-10',3600),(337,9,7,7,'2026-04-13 03:00:00','2026-04-13 12:00:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-14 06:01:23','2026-04-13',3600),(338,9,7,7,'2026-04-14 02:30:00','2026-04-14 11:30:00',28800,NULL,0,NULL,0,0,'Asia/Ho_Chi_Minh',0,1,'work','2026-04-14 06:01:39','2026-04-14',3600),(339,3,12,9,'2026-04-14 08:00:00','2026-04-14 17:00:00',28800,NULL,0,NULL,0,0,'UTC',0,1,'work','2026-04-14 07:17:59','2026-04-14',3600);
/*!40000 ALTER TABLE `kimai2_timesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_timesheet_meta`
--

DROP TABLE IF EXISTS `kimai2_timesheet_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_timesheet_meta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timesheet_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CB606CBAABDD46BE5E237E06` (`timesheet_id`,`name`),
  KEY `IDX_CB606CBAABDD46BE` (`timesheet_id`),
  CONSTRAINT `FK_CB606CBAABDD46BE` FOREIGN KEY (`timesheet_id`) REFERENCES `kimai2_timesheet` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_timesheet_meta`
--

LOCK TABLES `kimai2_timesheet_meta` WRITE;
/*!40000 ALTER TABLE `kimai2_timesheet_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_timesheet_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_timesheet_tags`
--

DROP TABLE IF EXISTS `kimai2_timesheet_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_timesheet_tags` (
  `timesheet_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`timesheet_id`,`tag_id`),
  KEY `IDX_732EECA9ABDD46BE` (`timesheet_id`),
  KEY `IDX_732EECA9BAD26311` (`tag_id`),
  CONSTRAINT `FK_732EECA9ABDD46BE` FOREIGN KEY (`timesheet_id`) REFERENCES `kimai2_timesheet` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_732EECA9BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `kimai2_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_timesheet_tags`
--

LOCK TABLES `kimai2_timesheet_tags` WRITE;
/*!40000 ALTER TABLE `kimai2_timesheet_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `kimai2_timesheet_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_user_preferences`
--

DROP TABLE IF EXISTS `kimai2_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_user_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D08F631A76ED3955E237E06` (`user_id`,`name`),
  KEY `IDX_8D08F631A76ED395` (`user_id`),
  CONSTRAINT `FK_8D08F631A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_user_preferences`
--

LOCK TABLES `kimai2_user_preferences` WRITE;
/*!40000 ALTER TABLE `kimai2_user_preferences` DISABLE KEYS */;
INSERT INTO `kimai2_user_preferences` VALUES (1,1,'timezone','UTC'),(2,1,'language','en'),(3,1,'skin','auto'),(4,1,'hourly_rate','0'),(5,1,'internal_rate',NULL),(6,1,'locale','en'),(7,1,'first_weekday','monday'),(8,1,'update_browser_title','1'),(9,1,'calendar_initial_view','month'),(10,1,'login_initial_view','timesheet'),(11,1,'favorite_routes',''),(12,1,'daily_stats',''),(13,1,'export_decimal',''),(14,1,'__wizards__','intro,profile'),(15,2,'timezone','Asia/Ho_Chi_Minh'),(16,2,'language','en'),(17,2,'skin','auto'),(18,2,'hourly_rate','0'),(19,2,'internal_rate',NULL),(20,2,'locale','en'),(21,2,'first_weekday','monday'),(22,2,'update_browser_title','1'),(23,2,'calendar_initial_view','month'),(24,2,'login_initial_view','timesheet'),(25,2,'favorite_routes',''),(26,2,'daily_stats',''),(27,2,'export_decimal',''),(28,2,'__wizards__','intro,profile'),(29,3,'timezone','UTC'),(30,3,'language','en'),(31,3,'skin','auto'),(32,3,'hourly_rate','0'),(33,3,'internal_rate',NULL),(34,3,'locale','en'),(35,3,'first_weekday','monday'),(36,3,'update_browser_title','1'),(37,3,'calendar_initial_view','month'),(38,3,'login_initial_view','timesheet'),(39,3,'favorite_routes',''),(40,3,'daily_stats','0'),(41,3,'export_decimal','0'),(42,3,'__wizards__','intro,profile'),(43,4,'timezone','UTC'),(44,4,'language','en'),(45,4,'skin','dark'),(46,4,'hourly_rate','0'),(47,4,'internal_rate',NULL),(48,4,'locale','en'),(49,4,'first_weekday','monday'),(50,4,'update_browser_title','1'),(51,4,'calendar_initial_view','month'),(52,4,'login_initial_view','timesheet'),(53,4,'favorite_routes',''),(54,4,'daily_stats','0'),(55,4,'export_decimal','0'),(56,4,'__wizards__','intro,profile'),(57,3,'_latest_approval',NULL),(58,5,'timezone','Europe/Paris'),(59,5,'language','fr'),(60,5,'skin','auto'),(61,5,'hourly_rate','0'),(62,5,'internal_rate',NULL),(63,5,'locale','fr'),(64,5,'first_weekday','monday'),(65,5,'update_browser_title','1'),(66,5,'calendar_initial_view','month'),(67,5,'login_initial_view','timesheet'),(68,5,'favorite_routes',''),(69,5,'daily_stats',''),(70,5,'export_decimal',''),(71,5,'__wizards__','intro,profile'),(72,6,'timezone','Europe/Paris'),(73,6,'language','fr'),(74,6,'skin','auto'),(75,6,'hourly_rate','0'),(76,6,'internal_rate',NULL),(77,6,'locale','fr'),(78,6,'first_weekday','monday'),(79,6,'update_browser_title','1'),(80,6,'calendar_initial_view','month'),(81,6,'login_initial_view','timesheet'),(82,6,'favorite_routes',''),(83,6,'daily_stats',''),(84,6,'export_decimal',''),(85,6,'__wizards__','intro,profile'),(86,6,'_latest_approval',NULL),(87,7,'timezone','UTC'),(88,7,'language','en'),(89,7,'skin','auto'),(90,7,'hourly_rate','0'),(91,7,'internal_rate',NULL),(92,7,'locale','en'),(93,7,'first_weekday','monday'),(94,7,'update_browser_title','1'),(95,7,'calendar_initial_view','month'),(96,7,'login_initial_view','timesheet'),(97,7,'favorite_routes',''),(98,7,'daily_stats','0'),(99,7,'export_decimal','0'),(100,7,'__wizards__','intro,profile'),(101,7,'_latest_approval',NULL),(102,8,'timezone','Asia/Ho_Chi_Minh'),(103,8,'language','en'),(104,8,'skin','auto'),(105,8,'hourly_rate','0'),(106,8,'internal_rate',NULL),(107,8,'locale','en'),(108,8,'first_weekday','monday'),(109,8,'update_browser_title','1'),(110,8,'calendar_initial_view','month'),(111,8,'login_initial_view','timesheet'),(112,8,'favorite_routes',''),(113,8,'daily_stats','0'),(114,8,'export_decimal','0'),(115,8,'__wizards__','intro,profile'),(116,8,'_latest_approval',NULL),(117,9,'timezone','Asia/Ho_Chi_Minh'),(118,9,'language','en'),(119,9,'skin','auto'),(120,9,'hourly_rate','0'),(121,9,'internal_rate',NULL),(122,9,'locale','en'),(123,9,'first_weekday','monday'),(124,9,'update_browser_title','1'),(125,9,'calendar_initial_view','month'),(126,9,'login_initial_view','timesheet'),(127,9,'favorite_routes',''),(128,9,'daily_stats','0'),(129,9,'export_decimal','0'),(130,9,'__wizards__','intro,profile'),(131,10,'timezone','UTC'),(132,10,'language','en'),(133,10,'skin','dark'),(134,10,'hourly_rate','0'),(135,10,'internal_rate',NULL),(136,10,'locale','en'),(137,10,'first_weekday','monday'),(138,10,'update_browser_title','1'),(139,10,'calendar_initial_view','month'),(140,10,'login_initial_view','timesheet'),(141,10,'favorite_routes',''),(142,10,'daily_stats','0'),(143,10,'export_decimal','0'),(144,10,'__wizards__','intro,profile'),(145,1,'_latest_approval',NULL),(146,10,'_latest_approval',NULL),(147,2,'_latest_approval',NULL),(148,9,'_latest_approval',NULL),(149,4,'_latest_approval',NULL),(150,11,'timezone','UTC'),(151,11,'language','en'),(152,11,'skin','default'),(153,11,'hourly_rate','0'),(154,11,'internal_rate',NULL),(155,11,'locale','en'),(156,11,'first_weekday','monday'),(157,11,'update_browser_title','1'),(158,11,'calendar_initial_view','month'),(159,11,'login_initial_view','timesheet'),(160,11,'favorite_routes',''),(161,11,'daily_stats','0'),(162,11,'export_decimal','0'),(163,11,'__wizards__','intro,profile'),(164,11,'_latest_approval',NULL),(165,9,'work_contract_type','day'),(166,9,'work_monday','28800'),(167,9,'work_tuesday','28800'),(168,9,'work_wednesday','28800'),(169,9,'work_thursday','28800'),(170,9,'work_friday','28800'),(171,10,'work_contract_type','day'),(172,10,'work_monday','28800'),(173,10,'work_tuesday','28800'),(174,10,'work_wednesday','28800'),(175,10,'work_thursday','28800'),(176,10,'work_friday','28800'),(177,2,'work_contract_type','day'),(178,2,'work_monday','28800'),(179,2,'work_tuesday','28800'),(180,2,'work_wednesday','28800'),(181,2,'work_thursday','28800'),(182,2,'work_friday','28800'),(183,11,'work_contract_type','day'),(184,11,'work_monday','28800'),(185,11,'work_tuesday','28800'),(186,11,'work_wednesday','28800'),(187,11,'work_thursday','28800'),(188,11,'work_friday','28800'),(189,3,'work_contract_type','day'),(190,3,'work_monday','28800'),(191,3,'work_tuesday','28800'),(192,3,'work_wednesday','28800'),(193,3,'work_thursday','28800'),(194,3,'work_friday','28800'),(195,12,'timezone','Asia/Bangkok'),(196,12,'language','en'),(197,12,'skin','dark'),(198,12,'hourly_rate','0'),(199,12,'internal_rate',NULL),(200,12,'locale','en'),(201,12,'first_weekday','monday'),(202,12,'update_browser_title','1'),(203,12,'calendar_initial_view','month'),(204,12,'login_initial_view','timesheet'),(205,12,'favorite_routes',''),(206,12,'daily_stats','0'),(207,12,'export_decimal','0'),(208,12,'__wizards__','intro,profile'),(209,12,'_latest_approval',NULL),(226,12,'work_start_day','2026-03-19'),(227,12,'al_carried_over','0'),(228,11,'work_start_day','2026-02-25'),(229,11,'al_carried_over','0'),(230,10,'work_start_day','2025-12-15'),(231,10,'al_carried_over','0'),(232,9,'work_start_day','2025-10-20'),(233,9,'al_carried_over','0'),(234,8,'work_start_day','2025-10-30'),(235,8,'al_carried_over','0'),(236,7,'work_start_day','2025-11-21'),(237,7,'al_carried_over','0'),(238,4,'work_start_day','2026-01-15'),(239,4,'al_carried_over','0'),(240,3,'work_start_day','2026-02-05'),(241,3,'al_carried_over','0'),(243,14,'timezone','UTC'),(244,14,'language','en'),(245,14,'skin','auto'),(246,14,'hourly_rate','0'),(247,14,'internal_rate',NULL),(248,14,'locale','en'),(249,14,'first_weekday','monday'),(250,14,'update_browser_title','1'),(251,14,'calendar_initial_view','month'),(252,14,'login_initial_view','timesheet'),(253,14,'favorite_routes',''),(254,14,'daily_stats','0'),(255,14,'export_decimal','0'),(256,14,'work_start_day','2026-04-01'),(257,14,'al_carried_over','0'),(258,14,'__wizards__','intro,profile'),(259,15,'timezone','UTC'),(260,15,'language','en'),(261,15,'skin','auto'),(262,15,'hourly_rate','0'),(263,15,'internal_rate',NULL),(264,15,'locale','en'),(265,15,'first_weekday','monday'),(266,15,'update_browser_title','1'),(267,15,'calendar_initial_view','month'),(268,15,'login_initial_view','timesheet'),(269,15,'favorite_routes',''),(270,15,'daily_stats','0'),(271,15,'export_decimal','0'),(272,15,'work_start_day','2026-04-01'),(273,15,'al_carried_over','0'),(274,15,'__wizards__','intro,profile'),(275,15,'_latest_approval',NULL),(276,14,'work_contract_type','day'),(277,14,'work_monday','28800'),(278,14,'work_tuesday','28800'),(279,14,'work_wednesday','28800'),(280,14,'work_thursday','28800'),(281,14,'work_friday','28800'),(282,15,'work_contract_type','day'),(283,15,'work_monday','28800'),(284,15,'work_tuesday','28800'),(285,15,'work_wednesday','28800'),(286,15,'work_thursday','28800'),(287,15,'work_friday','28800'),(288,14,'_latest_approval',NULL),(289,5,'work_start_day',NULL),(290,5,'al_carried_over','0'),(291,5,'_latest_approval',NULL),(292,16,'timezone','UTC'),(293,16,'language','en'),(294,16,'skin','auto'),(295,16,'hourly_rate','0'),(296,16,'internal_rate',NULL),(297,16,'locale','en'),(298,16,'first_weekday','monday'),(299,16,'update_browser_title','1'),(300,16,'calendar_initial_view','month'),(301,16,'login_initial_view','timesheet'),(302,16,'favorite_routes',''),(303,16,'daily_stats',''),(304,16,'export_decimal',''),(305,16,'work_start_day',NULL),(306,16,'al_carried_over','0'),(307,16,'__wizards__','intro,profile');
/*!40000 ALTER TABLE `kimai2_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_users`
--

DROP TABLE IF EXISTS `kimai2_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `registration_date` datetime DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totp_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totp_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `system_account` tinyint(1) NOT NULL DEFAULT '0',
  `supervisor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B9AC5BCEF85E0677` (`username`),
  UNIQUE KEY `UNIQ_B9AC5BCEE7927C74` (`email`),
  UNIQUE KEY `UNIQ_B9AC5BCEC05FB297` (`confirmation_token`),
  KEY `IDX_B9AC5BCE19E9AC5F` (`supervisor_id`),
  CONSTRAINT `FK_B9AC5BCE19E9AC5F` FOREIGN KEY (`supervisor_id`) REFERENCES `kimai2_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_users`
--

LOCK TABLES `kimai2_users` WRITE;
/*!40000 ALTER TABLE `kimai2_users` DISABLE KEYS */;
INSERT INTO `kimai2_users` VALUES (1,'admin','hai@cosigma.io','$2y$13$jVo4dBly0iL0/Amn72SY8.3ddL8R2X1vEN/lFPjDJD0mjiEn4WIii',NULL,1,'2026-02-21 05:07:23',NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}','2026-02-21 05:09:17',NULL,NULL,NULL,'kimai',NULL,NULL,NULL,0,0,NULL),(2,'hai.nguyen@cosigma.io','hai.nguyen@cosigma.io','$2y$13$VDfmpoXTGEJeHxBgmHXegu/.2oGMrK0Kj9RLoHLA8W04mg6Iiy5jq','Hai NGUYEN',1,'2026-02-21 05:08:29',NULL,NULL,'a:3:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";}','2026-04-01 02:23:26',NULL,NULL,NULL,'saml',NULL,NULL,'HBDDU326BXO3AJ3QUNOFQOPUTMHQ4L2QEX6EMVKUZIE7GGEP2JXQ',0,0,NULL),(3,'hung.nguyen@cosigma.io','hung.nguyen@cosigma.io','$2y$13$VpzT4zN8Xckj/LWusCxbO.ziyBnSR7IspR4X1dRPiEn.4qqtS3QzG','Hung NGUYEN',1,'2026-02-21 05:12:34','UX/UI Designer',NULL,'a:0:{}','2026-04-14 07:17:21',NULL,NULL,NULL,'saml',NULL,NULL,NULL,0,0,NULL),(4,'hoang.vu@cosigma.io','hoang.vu@cosigma.io','$2y$13$ruTDOzYmGbW16JUxk9rA2uD4kpcVs.suYreFn7CIGe9u8mOw4wjfq','Hoang VU',1,'2026-02-21 05:12:45',NULL,NULL,'a:0:{}','2026-04-13 02:51:58',NULL,NULL,NULL,'saml',NULL,NULL,NULL,0,0,NULL),(5,'yannis.bourebi@cosigma.io','yannis.bourebi@cosigma.io','$2y$13$n/NKAAJFawih9E53c17d5uuEkOMd.M4shn7CenRskXp87CygEbdyK','Yannis BOUREBI',1,'2026-02-21 09:31:14',NULL,NULL,'a:3:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";}','2026-04-08 10:02:42',NULL,NULL,NULL,'saml',NULL,NULL,'P73EUSBYWFXPTLNYLUIMDZMZ234PSF7HMJ5N3KSANK7KNEK4M7UQ',0,0,NULL),(6,'matthieu.rouau@cosigma.io','matthieu.rouau@cosigma.io','$2y$13$dIC0Rwgkh4EJjQq/Gqq4Eel89xPduGzoqWvyOV09tezRB0oDK8oiq','Matthieu ROUAU',1,'2026-02-21 10:08:05',NULL,NULL,'a:0:{}','2026-02-21 10:08:05',NULL,NULL,NULL,'saml',NULL,NULL,NULL,0,0,NULL),(7,'dang.tran@cosigma.io','dang.tran@cosigma.io','$2y$13$AVkIag2bk9OkSFfOX86wqeVKVjbmSD2anqdW7EG9s764UW6lCnpWu','Dang TRAN',1,'2026-02-23 00:21:21',NULL,NULL,'a:0:{}','2026-03-26 02:03:04',NULL,NULL,NULL,'saml',NULL,NULL,NULL,0,0,NULL),(8,'duy.pham@cosigma.io','duy.pham@cosigma.io','$2y$13$B0KM750aAWEC7vu4PrYlwu4Qg8Jj2T98Rlouh3TGJ.GdMNHBzUCo6','Duy PHAM',1,'2026-02-23 03:03:13',NULL,NULL,'a:0:{}','2026-04-13 07:21:08',NULL,NULL,NULL,'saml','#add8e6',NULL,'L2N5A5C4OK5X34KKXHBXIZPKTQF55FSONDLJTKYEP747ALCBFCLQ',0,0,NULL),(9,'nhu.pham@cosigma.io','nhu.pham@cosigma.io','$2y$13$/Tv6jyHZwPnfoSTN.09bYOJPlh1O4/DjlPJMovAZyXNq8HfVPJjRq','Nhu PHAM',1,'2026-02-23 03:16:55',NULL,NULL,'a:3:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";i:2;s:16:\"ROLE_SUPER_ADMIN\";}','2026-04-14 03:29:48',NULL,NULL,NULL,'saml',NULL,NULL,'HA6O4OEIQO6N7FROSEWFDXN4NKOGU6Y647HG43MUAAGVMXCH33RA',0,0,NULL),(10,'chau.hoang@cosigma.io','chau.hoang@cosigma.io','$2y$13$NK1G2nIcDVblgQ9/o5zO4eIYdW6B7aUlQds9DLzPMIIxk.pT2s4ve','Chau HOANG',1,'2026-02-23 12:28:48',NULL,NULL,'a:2:{i:0;s:13:\"ROLE_TEAMLEAD\";i:1;s:10:\"ROLE_ADMIN\";}','2026-04-10 08:10:03',NULL,NULL,NULL,'saml',NULL,NULL,NULL,0,0,NULL),(11,'tuan.pham@cosigma.io','tuan.pham@cosigma.io','$2y$13$s4Kp068hD8bUKTSjh5RZju3Ym2gVAbCiatHWBXpHapdgC7O.jR/jm','Tuan PHAM',1,'2026-02-27 04:01:07',NULL,NULL,'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:16:\"ROLE_SUPER_ADMIN\";}','2026-04-06 16:13:17',NULL,NULL,NULL,'saml',NULL,NULL,'F4Q2YF2Y54PLFIYC5C5H2JVQDRLMMBZOK53UPD53UCEP3FLWD23Q',0,0,NULL),(12,'baduy.nguyen@cosigma.io','baduy.nguyen@cosigma.io','$2y$13$UdMOLjNebHGuG1Kh/dghWObFClP26sjS3P8A6.BOOKMDCESG3SQwW','Ba Duy NGUYEN',1,'2026-03-20 04:08:44','Full Stack Developer Intern',NULL,'a:0:{}','2026-04-13 10:05:46',NULL,NULL,NULL,'saml',NULL,NULL,'JPLNMTJCTYVI6D2FMWCNW4ZSJPSN2IUQJAC2IZR43ZIP4HBZGVHQ',0,0,NULL),(14,'duc.cao@cosigma.io','duc.cao@cosigma.io','$2y$13$.ofmKp3YO.NfjMmVgv7rm.T0MGaM6jBpcTWj6NNVyNP5nT8wb3/yC','Duc CAO',1,'2026-04-01 04:17:45','System Infrastructure Intern',NULL,'a:3:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:13:\"ROLE_TEAMLEAD\";i:2;s:16:\"ROLE_SUPER_ADMIN\";}','2026-04-14 04:36:53',NULL,NULL,NULL,'saml',NULL,NULL,NULL,0,0,10),(15,'tu.tran@cosigma.io','tu.tran@cosigma.io','$2y$13$gd.vctpFhFU1AYFVdr2A3uP.Fue//1IvXyoo1IIZ3c5pKQzKF3EHO','Tu TRAN',1,'2026-04-01 07:40:51','Data Analyst Intern',NULL,'a:0:{}','2026-04-14 03:34:46',NULL,NULL,NULL,'saml','#ffff00',NULL,'WTTHEFDQWPRGKL6647XHVSY6LPV54ALAAOLQLBQHPI7APU5TIS6Q',0,0,9),(16,'thung.nguyen@cosigma.io','thung.nguyen@cosigma.io','$2y$13$NWROJuK0PuRFcTELa.k4eePlz5lYqN/Z811vlSEcpwG83xANXY0Rm','Thung Nguyen',1,'2026-04-14 03:33:43',NULL,NULL,'a:0:{}','2026-04-14 03:33:44',NULL,NULL,NULL,'saml',NULL,NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `kimai2_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_users_teams`
--

DROP TABLE IF EXISTS `kimai2_users_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_users_teams` (
  `user_id` int NOT NULL,
  `team_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `teamlead` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B5E92CF8A76ED395296CD8AE` (`user_id`,`team_id`),
  KEY `IDX_B5E92CF8A76ED395` (`user_id`),
  KEY `IDX_B5E92CF8296CD8AE` (`team_id`),
  CONSTRAINT `FK_B5E92CF8296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `kimai2_teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B5E92CF8A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_users_teams`
--

LOCK TABLES `kimai2_users_teams` WRITE;
/*!40000 ALTER TABLE `kimai2_users_teams` DISABLE KEYS */;
INSERT INTO `kimai2_users_teams` VALUES (2,1,1,1),(4,2,2,0),(2,2,3,1),(6,3,4,0),(5,3,5,1),(10,2,6,0),(10,1,7,0),(7,2,8,0),(8,2,9,0),(9,4,10,1),(2,4,11,0),(11,1,12,0),(3,2,13,0),(3,5,14,0),(2,5,15,1),(12,2,16,0),(10,6,17,1),(10,7,18,1),(14,1,19,0),(14,6,20,0),(11,7,21,0),(14,7,22,0),(2,7,23,0),(15,2,24,0),(2,8,25,1),(15,8,26,0);
/*!40000 ALTER TABLE `kimai2_users_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kimai2_working_times`
--

DROP TABLE IF EXISTS `kimai2_working_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kimai2_working_times` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `approved_by` int DEFAULT NULL,
  `date` date NOT NULL COMMENT '(DC2Type:date_immutable)',
  `expected` int NOT NULL,
  `actual` int NOT NULL,
  `approved_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `onesite` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F95E4933A76ED395AA9E377A` (`user_id`,`date`),
  KEY `IDX_F95E4933A76ED395` (`user_id`),
  KEY `IDX_F95E49334EA3CB3D` (`approved_by`),
  CONSTRAINT `FK_F95E49334EA3CB3D` FOREIGN KEY (`approved_by`) REFERENCES `kimai2_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_F95E4933A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kimai2_working_times`
--

LOCK TABLES `kimai2_working_times` WRITE;
/*!40000 ALTER TABLE `kimai2_working_times` DISABLE KEYS */;
INSERT INTO `kimai2_working_times` VALUES (2,11,NULL,'2026-03-30',0,0,NULL,0),(3,4,NULL,'2026-04-01',0,0,NULL,1),(4,11,NULL,'2026-03-24',0,0,NULL,1),(5,14,NULL,'2026-04-01',0,0,NULL,1),(6,15,NULL,'2026-04-01',0,0,NULL,1),(7,12,NULL,'2026-04-01',0,0,NULL,1),(8,11,NULL,'2026-04-01',0,0,NULL,1),(9,11,NULL,'2026-04-02',0,0,NULL,1),(10,15,NULL,'2026-04-02',0,0,NULL,1),(11,14,NULL,'2026-04-02',0,0,NULL,1),(12,9,NULL,'2026-04-01',0,0,NULL,1),(13,3,NULL,'2026-04-01',0,0,NULL,1),(14,3,NULL,'2026-04-02',0,0,NULL,1),(15,14,NULL,'2026-04-03',0,0,NULL,1),(16,15,NULL,'2026-04-03',0,0,NULL,1),(17,9,NULL,'2026-04-03',0,0,NULL,1),(18,3,NULL,'2026-04-03',0,0,NULL,1),(19,2,NULL,'2026-04-01',0,0,NULL,1),(20,11,NULL,'2026-04-03',0,0,NULL,1),(21,3,NULL,'2026-04-06',0,0,NULL,1),(22,14,NULL,'2026-04-06',0,0,NULL,1),(23,15,NULL,'2026-04-07',0,0,NULL,1),(24,12,NULL,'2026-04-07',0,0,NULL,1),(25,9,NULL,'2026-04-06',0,0,NULL,1),(26,15,NULL,'2026-04-08',0,0,NULL,1),(27,12,NULL,'2026-04-08',0,0,NULL,1),(28,14,NULL,'2026-04-08',0,0,NULL,1),(29,14,NULL,'2026-04-09',0,0,NULL,1),(30,3,NULL,'2026-04-07',0,0,NULL,1),(31,3,NULL,'2026-04-08',0,0,NULL,1),(32,3,NULL,'2026-04-09',0,0,NULL,1),(33,3,NULL,'2026-04-10',0,0,NULL,1),(34,10,NULL,'2026-04-01',0,0,NULL,1),(35,10,NULL,'2026-04-10',0,0,NULL,1),(36,10,NULL,'2026-04-03',0,0,NULL,1),(37,10,NULL,'2026-04-07',0,0,NULL,1),(38,10,NULL,'2026-04-02',0,0,NULL,1),(39,10,NULL,'2026-04-08',0,0,NULL,1),(40,10,NULL,'2026-04-06',0,0,NULL,1),(41,8,NULL,'2026-04-09',0,0,NULL,1),(42,8,NULL,'2026-04-10',0,0,NULL,1),(43,14,NULL,'2026-04-10',0,0,NULL,1),(44,12,NULL,'2026-04-10',0,0,NULL,1),(45,15,NULL,'2026-04-10',0,0,NULL,1),(46,11,NULL,'2026-04-06',0,0,NULL,1),(47,11,NULL,'2026-04-10',0,0,NULL,1),(48,3,NULL,'2026-04-13',0,0,NULL,1),(49,4,NULL,'2026-04-10',0,0,NULL,1),(50,4,NULL,'2026-04-09',0,0,NULL,1),(51,4,NULL,'2026-04-08',0,0,NULL,1),(52,4,NULL,'2026-04-07',0,0,NULL,1),(53,14,NULL,'2026-04-13',0,0,NULL,1),(54,14,NULL,'2026-04-14',0,0,NULL,1),(55,15,NULL,'2026-04-14',0,0,NULL,1),(56,9,NULL,'2026-04-08',0,0,NULL,1),(57,9,NULL,'2026-04-07',0,0,NULL,1),(58,9,NULL,'2026-04-10',0,0,NULL,1),(59,9,NULL,'2026-04-14',0,0,NULL,1);
/*!40000 ALTER TABLE `kimai2_working_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` VALUES ('DoctrineMigrations\\Version20180701120000','2026-02-21 05:07:19',102),('DoctrineMigrations\\Version20180715160326','2026-02-21 05:07:19',62),('DoctrineMigrations\\Version20180730044139','2026-02-21 05:07:19',20),('DoctrineMigrations\\Version20180805183527','2026-02-21 05:07:19',15),('DoctrineMigrations\\Version20180903202256','2026-02-21 05:07:19',9),('DoctrineMigrations\\Version20180905190737','2026-02-21 05:07:19',26),('DoctrineMigrations\\Version20180924111853','2026-02-21 05:07:19',11),('DoctrineMigrations\\Version20181031220003','2026-02-21 05:07:19',96),('DoctrineMigrations\\Version20190124004014','2026-02-21 05:07:19',14),('DoctrineMigrations\\Version20190201150324','2026-02-21 05:07:19',5),('DoctrineMigrations\\Version20190219200020','2026-02-21 05:07:19',1),('DoctrineMigrations\\Version20190305152308','2026-02-21 05:07:19',51),('DoctrineMigrations\\Version20190321181243','2026-02-21 05:07:19',6),('DoctrineMigrations\\Version20190502161758','2026-02-21 05:07:19',24),('DoctrineMigrations\\Version20190510205245','2026-02-21 05:07:19',20),('DoctrineMigrations\\Version20190605171157','2026-02-21 05:07:19',26),('DoctrineMigrations\\Version20190617100845','2026-02-21 05:07:19',82),('DoctrineMigrations\\Version20190706224211','2026-02-21 05:07:19',42),('DoctrineMigrations\\Version20190706224219','2026-02-21 05:07:19',73),('DoctrineMigrations\\Version20190729162655','2026-02-21 05:07:20',35),('DoctrineMigrations\\Version20190730123324','2026-02-21 05:07:20',116),('DoctrineMigrations\\Version20190813162649','2026-02-21 05:07:20',26),('DoctrineMigrations\\Version20191024100951','2026-02-21 05:07:20',19),('DoctrineMigrations\\Version20191108151534','2026-02-21 05:07:20',35),('DoctrineMigrations\\Version20191113132640','2026-02-21 05:07:20',13),('DoctrineMigrations\\Version20191116110124','2026-02-21 05:07:20',23),('DoctrineMigrations\\Version20191204120823','2026-02-21 05:07:20',20),('DoctrineMigrations\\Version20200109102138','2026-02-21 05:07:20',75),('DoctrineMigrations\\Version20200125123942','2026-02-21 05:07:20',25),('DoctrineMigrations\\Version20200204124425','2026-02-21 05:07:20',17),('DoctrineMigrations\\Version20200205115243','2026-02-21 05:07:20',114),('DoctrineMigrations\\Version20200205115244','2026-02-21 05:07:20',42),('DoctrineMigrations\\Version20200308171950','2026-02-21 05:07:20',54),('DoctrineMigrations\\Version20200323163038','2026-02-21 05:07:20',35),('DoctrineMigrations\\Version20200323163039','2026-02-21 05:07:20',0),('DoctrineMigrations\\Version20200413133226','2026-02-21 05:07:20',19),('DoctrineMigrations\\Version20200524142042','2026-02-21 05:07:20',20),('DoctrineMigrations\\Version20200705152310','2026-02-21 05:07:20',25),('DoctrineMigrations\\Version20200725213424','2026-02-21 05:07:20',46),('DoctrineMigrations\\Version20210316224358','2026-02-21 05:07:20',32),('DoctrineMigrations\\Version20210320162820','2026-02-21 05:07:20',21),('DoctrineMigrations\\Version20210405105611','2026-02-21 05:07:20',17),('DoctrineMigrations\\Version20210605154245','2026-02-21 05:07:20',46),('DoctrineMigrations\\Version20210704111542','2026-02-21 05:07:20',34),('DoctrineMigrations\\Version20210717211144','2026-02-21 05:07:20',25),('DoctrineMigrations\\Version20210719123928','2026-02-21 05:07:20',40),('DoctrineMigrations\\Version20210727104955','2026-02-21 05:07:21',59),('DoctrineMigrations\\Version20210802152259','2026-02-21 05:07:21',21),('DoctrineMigrations\\Version20210802152814','2026-02-21 05:07:21',6),('DoctrineMigrations\\Version20210802160837','2026-02-21 05:07:21',36),('DoctrineMigrations\\Version20210802174318','2026-02-21 05:07:21',25),('DoctrineMigrations\\Version20210802174319','2026-02-21 05:07:21',0),('DoctrineMigrations\\Version20210802174320','2026-02-21 05:07:21',28),('DoctrineMigrations\\Version20211008092010','2026-02-21 05:07:21',14),('DoctrineMigrations\\Version20211230163612','2026-02-21 05:07:21',19),('DoctrineMigrations\\Version20220101204501','2026-02-21 05:07:21',35),('DoctrineMigrations\\Version20220315224645','2026-02-21 05:07:21',41),('DoctrineMigrations\\Version20220404150236','2026-02-21 05:07:21',25),('DoctrineMigrations\\Version20220531145920','2026-02-21 05:07:21',33),('DoctrineMigrations\\Version20220722125847','2026-02-21 05:07:21',24),('DoctrineMigrations\\Version20230126002049','2026-02-21 05:07:21',105),('DoctrineMigrations\\Version20230126002050','2026-02-21 05:07:21',27),('DoctrineMigrations\\Version20230327143628','2026-02-21 05:07:21',53),('DoctrineMigrations\\Version20230606125948','2026-02-21 05:07:21',19),('DoctrineMigrations\\Version20230819090536','2026-02-21 05:07:21',62),('DoctrineMigrations\\Version20231130000719','2026-02-21 05:07:21',1),('DoctrineMigrations\\Version20240214061246','2026-02-21 05:07:21',34),('DoctrineMigrations\\Version20240326125247','2026-02-21 05:07:21',18),('DoctrineMigrations\\Version20240920105524','2026-02-21 05:07:21',0),('DoctrineMigrations\\Version20240926111739','2026-02-21 05:07:21',34),('DoctrineMigrations\\Version20250608143244','2026-02-21 05:07:21',22),('DoctrineMigrations\\Version20251031142000','2026-02-21 05:07:21',46),('DoctrineMigrations\\Version20251031143000','2026-02-21 05:07:21',18),('DoctrineMigrations\\Version20251214160001','2026-02-21 05:07:21',24),('DoctrineMigrations\\Version20260323120000','2026-03-30 11:09:59',7);
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-14 14:47:00
