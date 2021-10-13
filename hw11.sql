-- MySQL dump 10.13  Distrib 5.7.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sandbox
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT,
    `title`      varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `slug`       varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK
TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories`
VALUES (1, 'test1', 'test1', '2021-10-04 13:03:06', '2021-10-04 13:03:06'),
       (2, 'categ', 'categ', '2021-10-04 13:45:17', '2021-10-04 13:45:17'),
       (3, 'categ3', 'categ3', '2021-10-04 14:53:49', '2021-10-04 14:53:49'),
       (4, 'categ 4', 'categ 4', '2021-10-13 18:20:25', '2021-10-13 18:20:25');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tag`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT,
    `post_id`    bigint unsigned NOT NULL,
    `tag_id`     bigint unsigned NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY          `post_tag_post_id_foreign` (`post_id`),
    KEY          `post_tag_tag_id_foreign` (`tag_id`),
    CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK
TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag`
VALUES (7, 5, 1, '2021-10-13 22:44:28', '2021-10-13 22:44:38'),
       (8, 5, 3, '2021-10-13 22:44:29', '2021-10-13 22:44:38'),
       (9, 4, 1, '2021-10-13 20:50:49', '2021-10-13 20:50:49'),
       (10, 4, 3, '2021-10-13 20:50:49', '2021-10-13 20:50:49'),
       (11, 1, 3, '2021-10-13 20:51:05', '2021-10-13 20:51:05'),
       (12, 1, 4, '2021-10-13 20:51:05', '2021-10-13 20:51:05'),
       (13, 6, 1, '2021-10-13 20:57:00', '2021-10-13 20:57:00'),
       (14, 6, 4, '2021-10-13 20:57:01', '2021-10-13 20:57:01'),
       (16, 9, 3, '2021-10-13 21:00:16', '2021-10-13 21:00:16'),
       (17, 9, 4, '2021-10-13 21:00:16', '2021-10-13 21:00:16'),
       (18, 10, 1, '2021-10-13 21:10:25', '2021-10-13 21:10:25'),
       (20, 10, 4, '2021-10-13 21:10:25', '2021-10-13 21:10:25'),
       (21, 7, 3, '2021-10-13 21:29:32', '2021-10-13 21:29:32'),
       (22, 3, 1, '2021-10-13 21:29:43', '2021-10-13 21:29:43'),
       (23, 3, 3, '2021-10-13 21:29:45', '2021-10-13 21:29:45'),
       (24, 3, 4, '2021-10-13 21:29:45', '2021-10-13 21:29:45'),
       (25, 3, 5, '2021-10-13 21:29:45', '2021-10-13 21:29:45');
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT,
    `title`       varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `slug`        varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `body`        text COLLATE utf8_unicode_ci         NOT NULL,
    `category_id` bigint unsigned NOT NULL,
    `created_at`  timestamp NULL DEFAULT NULL,
    `updated_at`  timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY           `posts_category_id_foreign` (`category_id`),
    CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK
TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts`
VALUES (1, 'post1', 'post1', 'post1', 1, '2021-10-04 14:06:38', '2021-10-04 14:06:38'),
       (3, 'post3', 'post3', 'post3', 1, '2021-10-04 14:54:16', '2021-10-04 14:54:16'),
       (4, 'post4', 'post4', 'post4', 3, '2021-10-13 18:22:02', '2021-10-13 18:22:02'),
       (5, 'post5', 'post5', 'post5', 2, '2021-10-13 18:34:27', '2021-10-13 18:34:27'),
       (6, 'post 6', 'post 6', 'post 6', 2, '2021-10-13 20:56:46', '2021-10-13 20:56:46'),
       (7, 'post7', 'post7', 'post7', 1, '2021-10-13 20:57:26', '2021-10-13 20:57:26'),
       (8, 'post8', 'post8', 'post8', 1, '2021-10-13 20:59:49', '2021-10-13 20:59:49'),
       (9, 'post9', 'post9', 'post9', 2, '2021-10-13 21:00:15', '2021-10-13 21:00:15'),
       (10, 'post10', 'post10', 'post10', 1, '2021-10-13 21:10:24', '2021-10-13 21:10:38');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT,
    `title`      varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `slug`       varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK
TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags`
VALUES (1, 'tag11', 'tag11', '2021-10-04 13:49:00', '2021-10-04 13:49:40'),
       (3, 'tag2', 'tag2', '2021-10-04 14:54:40', '2021-10-04 14:54:40'),
       (4, 'tag3', 'tag3', '2021-10-13 18:34:52', '2021-10-13 18:34:52'),
       (5, 'пять', '5', '2021-10-13 21:18:43', '2021-10-13 21:18:43');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK
TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-14  0:47:40
