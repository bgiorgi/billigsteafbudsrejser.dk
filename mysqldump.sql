-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: c9
-- ------------------------------------------------------
-- Server version	5.5.57-0ubuntu0.14.04.1

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
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'Category 1','category-1','2018-02-01 13:08:16','2018-02-01 13:08:16'),(2,NULL,1,'Category 2','category-2','2018-02-01 13:08:16','2018-02-01 13:08:16');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,'',1),(2,1,'author_id','text','Author',1,0,1,1,0,1,'',2),(3,1,'category_id','text','Category',1,0,1,1,1,0,'',3),(4,1,'title','text','Title',1,1,1,1,1,1,'',4),(5,1,'excerpt','text_area','excerpt',1,0,1,1,1,1,'',5),(6,1,'body','rich_text_box','Body',1,0,1,1,1,1,'',6),(7,1,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(8,1,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}',8),(9,1,'meta_description','text_area','meta_description',1,0,1,1,1,1,'',9),(10,1,'meta_keywords','text_area','meta_keywords',1,0,1,1,1,1,'',10),(11,1,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(12,1,'created_at','timestamp','created_at',0,1,1,0,0,0,'',12),(13,1,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',13),(14,2,'id','number','id',1,0,0,0,0,0,'',1),(15,2,'author_id','text','author_id',1,0,0,0,0,0,'',2),(16,2,'title','text','title',1,1,1,1,1,1,'',3),(17,2,'excerpt','text_area','excerpt',1,0,1,1,1,1,'',4),(18,2,'body','rich_text_box','body',1,0,1,1,1,1,'',5),(19,2,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"}}',6),(20,2,'meta_description','text','meta_description',1,0,1,1,1,1,'',7),(21,2,'meta_keywords','text','meta_keywords',1,0,1,1,1,1,'',8),(22,2,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(23,2,'created_at','timestamp','created_at',1,1,1,0,0,0,'',10),(24,2,'updated_at','timestamp','updated_at',1,0,0,0,0,0,'',11),(25,2,'image','image','image',0,1,1,1,1,1,'',12),(26,3,'id','number','id',1,0,0,0,0,0,'',1),(27,3,'name','text','name',1,1,1,1,1,1,'',2),(28,3,'email','text','email',1,1,1,1,1,1,'',3),(29,3,'password','password','password',0,0,0,1,1,0,'',4),(30,3,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}',10),(31,3,'remember_token','text','remember_token',0,0,0,0,0,0,'',5),(32,3,'created_at','timestamp','created_at',0,1,1,0,0,0,'',6),(33,3,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',7),(34,3,'avatar','image','avatar',0,1,1,1,1,1,'',8),(35,5,'id','number','id',1,0,0,0,0,0,'',1),(36,5,'name','text','name',1,1,1,1,1,1,'',2),(37,5,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(38,5,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(39,4,'id','number','id',1,0,0,0,0,0,'',1),(40,4,'parent_id','select_dropdown','parent_id',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(41,4,'order','text','order',1,1,1,1,1,1,'{\"default\":1}',3),(42,4,'name','text','name',1,1,1,1,1,1,'',4),(43,4,'slug','text','slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(44,4,'created_at','timestamp','created_at',0,0,1,0,0,0,'',6),(45,4,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',7),(46,6,'id','number','id',1,0,0,0,0,0,'',1),(47,6,'name','text','Name',1,1,1,1,1,1,'',2),(48,6,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(49,6,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(50,6,'display_name','text','Display Name',1,1,1,1,1,1,'',5),(51,1,'seo_title','text','seo_title',0,1,1,1,1,1,'',14),(52,1,'featured','checkbox','featured',1,1,1,1,1,1,'',15),(53,3,'role_id','text','role_id',1,1,1,1,1,1,'',9),(72,9,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(75,9,'logo','image','Logo',0,1,1,1,1,1,NULL,4),(76,9,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,5),(77,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,6),(79,9,'code','text','Code',0,1,1,1,1,1,NULL,2),(80,10,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(81,10,'name','text','Name',0,1,1,1,1,1,NULL,2),(82,10,'price','text','Price',0,1,1,1,1,1,NULL,3),(83,10,'currency','text','Currency',0,1,1,1,1,1,NULL,4),(84,10,'url','text','Url',0,1,1,1,1,1,NULL,5),(85,10,'image_url','text','Image Url',0,1,1,1,1,1,NULL,6),(86,10,'country','text','Country',0,1,1,1,1,1,NULL,7),(87,10,'city','text','City',0,1,1,1,1,1,NULL,8),(88,10,'service_type','text','Service Type',0,1,1,1,1,1,NULL,9),(89,10,'stars','text','Stars',0,1,1,1,1,1,NULL,10),(90,10,'provider_id','checkbox','Provider Id',0,1,1,1,1,1,NULL,11),(91,10,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,12),(92,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,13),(93,10,'tour_belongsto_provider_relationship','relationship','providers',0,1,1,1,1,1,'{\"model\":\"App\\\\Provider\",\"table\":\"providers\",\"type\":\"belongsTo\",\"column\":\"provider_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',14),(104,12,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(105,12,'country','text','Country',0,1,1,1,1,1,NULL,2),(106,12,'city','text','City',0,1,1,1,1,1,NULL,3),(107,12,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,4),(108,12,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,5),(109,10,'view_count','number','View Count',0,1,1,1,1,1,NULL,14),(110,12,'view_count','number','View Count',0,1,1,1,1,1,NULL,6);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy','','',1,0,'2018-02-01 13:08:15','2018-02-01 13:08:15'),(2,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,'2018-02-01 13:08:15','2018-02-01 13:08:15'),(3,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','','',1,0,'2018-02-01 13:08:15','2018-02-01 13:08:15'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,'2018-02-01 13:08:15','2018-02-01 13:08:15'),(5,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,'2018-02-01 13:08:15','2018-02-01 13:08:15'),(6,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,'2018-02-01 13:08:15','2018-02-01 13:08:15'),(9,'providers','providers','Provider','Providers',NULL,'App\\Provider',NULL,NULL,NULL,1,0,'2018-05-11 09:23:58','2018-05-11 09:23:58'),(10,'tours','tours','Tour','Tours',NULL,'App\\Tour',NULL,NULL,NULL,1,0,'2018-05-11 10:34:06','2018-05-11 10:34:06'),(12,'destinations','destinations','Destination','Destinations',NULL,'App\\Destination',NULL,NULL,NULL,1,0,'2018-06-03 09:20:31','2018-06-03 09:20:31');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinations`
--

DROP TABLE IF EXISTS `destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destinations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country` text COLLATE utf8_unicode_ci,
  `city` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `view_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinations`
--

LOCK TABLES `destinations` WRITE;
/*!40000 ALTER TABLE `destinations` DISABLE KEYS */;
INSERT INTO `destinations` VALUES (4,'Tyrkiet','Bitez','2018-06-18 17:32:52','2018-06-19 17:59:45',46),(5,'Tyrkiet','Bodrum - Gündogan','2018-06-18 17:36:49','2018-06-18 19:19:51',8),(6,'Tyrkiet','Bodrum','2018-06-18 17:36:58','2018-06-19 11:16:43',13),(7,'Tyrkiet','Didim','2018-06-18 18:51:57','2018-06-18 19:20:04',2);
/*!40000 ALTER TABLE `destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2018-02-01 13:08:15','2018-02-01 13:08:15','voyager.dashboard',NULL),(4,1,'Users','','_self','voyager-person',NULL,NULL,3,'2018-02-01 13:08:16','2018-02-01 13:08:16','voyager.users.index',NULL),(6,1,'Pages','','_self','voyager-file-text',NULL,NULL,7,'2018-02-01 13:08:16','2018-02-01 13:08:16','voyager.pages.index',NULL),(7,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2018-02-01 13:08:16','2018-02-01 13:08:16','voyager.roles.index',NULL),(8,1,'Tools','','_self','voyager-tools',NULL,NULL,9,'2018-02-01 13:08:16','2018-02-01 13:08:16',NULL,NULL),(9,1,'Menu Builder','','_self','voyager-list',NULL,8,10,'2018-02-01 13:08:16','2018-02-01 13:08:16','voyager.menus.index',NULL),(10,1,'Database','','_self','voyager-data',NULL,8,11,'2018-02-01 13:08:16','2018-02-01 13:08:16','voyager.database.index',NULL),(11,1,'Compass','','_self','voyager-compass',NULL,8,12,'2018-02-01 13:08:16','2018-02-01 13:08:16','voyager.compass.index',NULL),(12,1,'Hooks','','_self','voyager-hook',NULL,8,13,'2018-02-01 13:08:16','2018-02-01 13:08:16','voyager.hooks',NULL),(13,1,'Settings','','_self','voyager-settings',NULL,NULL,14,'2018-02-01 13:08:16','2018-02-01 13:08:16','voyager.settings.index',NULL),(14,1,'Tours','/admin/tours','_self',NULL,NULL,NULL,15,'2018-05-07 13:16:06','2018-05-07 13:16:06',NULL,NULL),(15,1,'Providers','/admin/providers','_self',NULL,NULL,NULL,16,'2018-05-07 13:18:17','2018-05-07 13:18:17',NULL,NULL),(16,1,'Variations','/admin/variations','_self',NULL,NULL,NULL,17,'2018-05-11 10:36:07','2018-05-11 10:36:07',NULL,NULL),(17,1,'Destinations','/admin/destinations','_self',NULL,NULL,NULL,18,'2018-06-03 09:20:31','2018-06-03 09:20:31',NULL,NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2018-02-01 13:08:15','2018-02-01 13:08:15');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_01_01_000000_create_pages_table',1),(6,'2016_01_01_000000_create_posts_table',1),(7,'2016_02_15_204651_create_categories_table',1),(8,'2016_05_19_173453_create_menu_table',1),(9,'2016_10_21_190000_create_roles_table',1),(10,'2016_10_21_190000_create_settings_table',1),(11,'2016_11_30_135954_create_permission_table',1),(12,'2016_11_30_141208_create_permission_role_table',1),(13,'2016_12_26_201236_data_types__add__server_side',1),(14,'2017_01_13_000000_add_route_to_menu_items_table',1),(15,'2017_01_14_005015_create_translations_table',1),(16,'2017_01_15_000000_add_permission_group_id_to_permissions_table',1),(17,'2017_01_15_000000_create_permission_groups_table',1),(18,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(19,'2017_03_06_000000_add_controller_to_data_types_table',1),(20,'2017_04_11_000000_alter_post_nullable_fields_table',1),(21,'2017_04_21_000000_add_order_to_data_rows_table',1),(22,'2017_07_05_210000_add_policyname_to_data_types_table',1),(23,'2017_08_05_000000_add_group_to_settings_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lang` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (2,1,'About','.','<p>&nbsp;</p>\r\n<div style=\"margin: 0px 14.3906px 0px 28.7969px; padding: 0px; width: 436.797px; text-align: left; float: left; color: #000000; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\">\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n</div>',NULL,'about','.','.','ACTIVE','2018-06-12 13:42:35','2018-06-12 13:42:35',NULL);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_groups`
--

DROP TABLE IF EXISTS `permission_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_groups`
--

LOCK TABLES `permission_groups` WRITE;
/*!40000 ALTER TABLE `permission_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(66,1),(67,1),(68,1),(69,1),(70,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(2,'browse_database',NULL,'2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(3,'browse_media',NULL,'2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(4,'browse_compass',NULL,'2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(5,'browse_menus','menus','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(6,'read_menus','menus','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(7,'edit_menus','menus','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(8,'add_menus','menus','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(9,'delete_menus','menus','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(10,'browse_pages','pages','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(11,'read_pages','pages','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(12,'edit_pages','pages','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(13,'add_pages','pages','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(14,'delete_pages','pages','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(15,'browse_roles','roles','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(16,'read_roles','roles','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(17,'edit_roles','roles','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(18,'add_roles','roles','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(19,'delete_roles','roles','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(20,'browse_users','users','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(21,'read_users','users','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(22,'edit_users','users','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(23,'add_users','users','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(24,'delete_users','users','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(25,'browse_posts','posts','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(26,'read_posts','posts','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(27,'edit_posts','posts','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(28,'add_posts','posts','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(29,'delete_posts','posts','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(30,'browse_categories','categories','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(31,'read_categories','categories','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(32,'edit_categories','categories','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(33,'add_categories','categories','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(34,'delete_categories','categories','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(35,'browse_settings','settings','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(36,'read_settings','settings','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(37,'edit_settings','settings','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(38,'add_settings','settings','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(39,'delete_settings','settings','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(40,'browse_hooks',NULL,'2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(51,'browse_providers','providers','2018-05-11 09:23:58','2018-05-11 09:23:58',NULL),(52,'read_providers','providers','2018-05-11 09:23:58','2018-05-11 09:23:58',NULL),(53,'edit_providers','providers','2018-05-11 09:23:58','2018-05-11 09:23:58',NULL),(54,'add_providers','providers','2018-05-11 09:23:58','2018-05-11 09:23:58',NULL),(55,'delete_providers','providers','2018-05-11 09:23:58','2018-05-11 09:23:58',NULL),(56,'browse_tours','tours','2018-05-11 10:34:06','2018-05-11 10:34:06',NULL),(57,'read_tours','tours','2018-05-11 10:34:06','2018-05-11 10:34:06',NULL),(58,'edit_tours','tours','2018-05-11 10:34:06','2018-05-11 10:34:06',NULL),(59,'add_tours','tours','2018-05-11 10:34:06','2018-05-11 10:34:06',NULL),(60,'delete_tours','tours','2018-05-11 10:34:06','2018-05-11 10:34:06',NULL),(66,'browse_destinations','destinations','2018-06-03 09:20:31','2018-06-03 09:20:31',NULL),(67,'read_destinations','destinations','2018-06-03 09:20:31','2018-06-03 09:20:31',NULL),(68,'edit_destinations','destinations','2018-06-03 09:20:31','2018-06-03 09:20:31',NULL),(69,'add_destinations','destinations','2018-06-03 09:20:31','2018-06-03 09:20:31',NULL),(70,'delete_destinations','destinations','2018-06-03 09:20:31','2018-06-03 09:20:31',NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,0,NULL,'Lorem Ipsum Post',NULL,'This is the excerpt for the Lorem Ipsum Post','<p>This is the body of the lorem ipsum post</p>','posts/post1.jpg','lorem-ipsum-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2018-02-01 13:08:16','2018-02-01 13:08:16'),(2,0,NULL,'My Sample Post',NULL,'This is the excerpt for the sample Post','<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>','posts/post2.jpg','my-sample-post','Meta Description for sample post','keyword1, keyword2, keyword3','PUBLISHED',0,'2018-02-01 13:08:16','2018-02-01 13:08:16'),(3,0,NULL,'Latest Post',NULL,'This is the excerpt for the latest post','<p>This is the body for the latest post</p>','posts/post3.jpg','latest-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2018-02-01 13:08:16','2018-02-01 13:08:16'),(4,0,NULL,'Yarr Post',NULL,'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.','<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>','posts/post4.jpg','yarr-post','this be a meta descript','keyword1, keyword2, keyword3','PUBLISHED',0,'2018-02-01 13:08:16','2018-02-01 13:08:16');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` text COLLATE utf8_unicode_ci,
  `logo` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (1,'SUNWEB','providers/May2018/AfB37v1DSzpOu7J3q7p6.png','2018-05-11 10:13:46','2018-05-11 10:13:46'),(2,'SUNCHARTER','providers/June2018/W2eYODnfngSDYCc1J3Y4.png','2018-06-24 13:22:37','2018-06-24 13:22:37'),(3,'AARHUSCHARTER','providers/June2018/kiWVDBQNYlMnT91Ak7Su.png','2018-06-24 13:23:15','2018-06-24 13:23:15'),(4,'PRIMOTOURS','providers/June2018/nFgW7kPZ1qcNS2NAH9E8.png','2018-06-24 13:23:36','2018-06-24 13:23:36'),(5,'TRAVELBIRD','providers/June2018/9CEQg03N7wEIpg0wyXwm.png','2018-06-24 13:23:52','2018-06-24 13:23:52');
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2018-02-01 13:08:16','2018-02-01 13:08:16'),(2,'user','Normal User','2018-02-01 13:08:16','2018-02-01 13:08:16');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Site Title','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID','','','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)','','','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tours`
--

DROP TABLE IF EXISTS `tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tours` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `price` double DEFAULT NULL,
  `currency` text COLLATE utf8_unicode_ci,
  `url` text COLLATE utf8_unicode_ci,
  `image_url` text COLLATE utf8_unicode_ci,
  `country` text COLLATE utf8_unicode_ci,
  `city` text COLLATE utf8_unicode_ci,
  `stars` text COLLATE utf8_unicode_ci,
  `provider_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `view_count` int(11) DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `number_of_persons` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours`
--

LOCK TABLES `tours` WRITE;
/*!40000 ALTER TABLE `tours` DISABLE KEYS */;
INSERT INTO `tours` VALUES (39,'Hotel Ambrosia',3149,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_ambrosia.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/22900000/8000/22908240-Web1.jpg','Tyrkiet','Bitez','4',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-09-12',8,3),(40,'Hotel Bitez Garden Life',2902,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_bitez_garden_life.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/16800000/7000/16807976-Web1.jpg','Tyrkiet','Bitez','3,5',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-08-08',5,2),(41,'Hotel Costa 3/S Beach Club',3479,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_costa_3_s_beach_club_.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/800000/22000/822125-Web1.jpg','Tyrkiet','Bitez','3',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-10-07',8,4),(42,'Hotel Costa Bitezhan',3384,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_costa_bitezhan.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/31700000/68000/31768740-Web1.jpg','Tyrkiet','Bitez','3',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-07-29',4,3),(43,'Hotel Natur Garden',3215,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_natur_garden.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/31900000/68000/31968305-Web1.jpg','Tyrkiet','Bitez','3',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-08-22',8,3),(44,'Hotel Okaliptus',3388,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_okaliptus.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/1900000/28000/1928237-Web1.jpg','Tyrkiet','Bitez','3,5',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-08-22',8,3),(45,'Hotel Paloma Family Club',2954,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_paloma_family_club.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/22800000/35000/22835399-Web1.jpg','Tyrkiet','Bitez','3,5',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-09-16',8,4),(46,'Hotel Summer Garden',2908,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_summer_garden.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/20200000/51000/20251757-Web1.jpg','Tyrkiet','Bitez','3',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-08-05',4,2),(47,'Lejl. Sirca',1895,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Flejligheder_sirca.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/22800000/40000/22840026-Web1.jpg','Tyrkiet','Bitez','3',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-09-16',8,4),(48,'Lejl. Summer Garden',2218,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Flejligheder_summer_garden.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/20200000/51000/20251757-Web1.jpg','Tyrkiet','Bitez','3',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-08-22',15,4),(49,'Hotel Bodrum Holiday Resort',3664,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbodrum%2Fhotel_bodrum_holiday_resort.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/3200000/46000/3246849-Web1.jpg','Tyrkiet','Bodrum','5',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-09-16',8,2),(50,'Hotel Labranda TMT Bodrum Resort',4419,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbodrum%2Fhotel_labranda_tmt_bodrum_resort_.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/33900000/86000/33986112-Web1.jpg','Tyrkiet','Bodrum','5',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-07-25',5,2),(51,'Hotel Mandarin Resort',3409,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbodrum%2Fhotel_mandarin_resort.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/35000000/68000/35068974-Web1.png','Tyrkiet','Bodrum','4',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-08-26',8,2),(52,'Hotel Salmakis Beach Resort & Spa',4669,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbodrum%2Fhotel_salmakis_beach_resort_spa.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/22300000/87000/22387632-Web1.jpg','Tyrkiet','Bodrum','4,5',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-10-14',8,3),(53,'Hotel Voyage Bodrum',4989,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbodrum%2Fhotel_voyage_bodrum.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/19400000/98000/19498376-Web1.jpg','Tyrkiet','Bodrum','5',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-09-30',8,3),(54,'Hotel Baia',4729,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbodrum-gundogan%2Fhotel_baia.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/33800000/22000/33822550-Web1.jpg','Tyrkiet','Bodrum - Gündogan','5',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-09-23',8,4),(55,'Hotel Latanya Park Resort',4825,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbodrum-yaliciftlik%2Fhotel_latanya_park_resort.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/34400000/56000/34456354-Web1.jpg','Tyrkiet','Bodrum - Yaliciftlik','4',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-08-29',5,1),(56,'Aquasis Deluxe Resort & Spa',4169,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fdidim%2Faquasis_deluxe_resort_spa.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/30700000/41000/30741422-Web1.jpg','Tyrkiet','Didim','5',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-08-01',5,3),(57,'Hotel Didim Beach Resort & Elegance',3302,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fdidim%2Fhotel_didim_beach_resort_elegance.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/22600000/18000/22618752-Web1.jpg','Tyrkiet','Didim','4',1,'2018-06-24 13:19:38','2018-06-24 13:19:38',NULL,'2018-09-23',8,3),(58,'Egen lejlighed i Kroatien',1229,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F110641%2Faparthotel-del-mar-pula-kroatien%2F%3F','https://travelbird.imgix.net/offer-image-c7/98389/RVUKW763/2.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','Kroatien','Pula',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,6,NULL),(59,'Kulinariske Kreta',4919,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F110781%2Fharidimos-apartments-tavronitis-kreta%2F%3F','https://travelbird.imgix.net/offer-image-c7/98616/WZ5R6URM.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','Grækenland','Tavronitis',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,5,NULL),(60,'Frankrig og Italien',4349,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F110794%2Frundrejse-frankrig-italien%2F%3F','https://travelbird.imgix.net/offer-image-c7/98536/WZH2BREN/2.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','','',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,8,NULL),(61,'Lige ned til Middelhavet',2829,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F110803%2Fhotel-ms-amaragua-torremolinos-spanien%2F%3F','https://travelbird.imgix.net/offer-image-c7/98669/APBKBU2G/4.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','Spanien','Torremolinos',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,6,NULL),(62,'Mountainbiking i Østrig',1359,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F110805%2Fscol-hotel-zillertal-fugen-oestrig%2F%3F','https://travelbird.imgix.net/offer-image-c7/98541/UKHKDDYT/3.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','Østrig','Fügen',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,4,NULL),(63,'Forført af Marrakech',2019,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F110735%2Fpalais-el-miria-spa-marrakech%2F%3F','https://travelbird.imgix.net/offer-image-c7/98600/EVZ6ODQ7/3.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','Marokko','Marrakech',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,4,NULL),(64,'Tenerife og all-inclusive',4159,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F110889%2Flagos-de-cesar-santa-cruz-de-tenerife%2F%3F','https://travelbird.imgix.net/offer-image-c7/98643/SKA6TT44.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','Spanien','Santiago',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,8,NULL),(65,'Solferie på Tenerife',3099,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F86610%2Fapartementos-pez-azul-puerto-de-la-cruz-tenerife%2F%3F','https://travelbird.imgix.net/offer-image-c7/72579/5WVZMVQT.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','','',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,6,NULL),(66,'Ferieresort i Norditalien',819,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F108693%2Fcastellaro-golf-resort-spa-ligurien%2F%3F','https://travelbird.imgix.net/offer-image-c7/96338/52MFXE4Q.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','Italien','Castellaro',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,4,NULL),(67,'Nice: By og strand',1669,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F110725%2Fdays-inn-nice-centre%2F%3F','https://travelbird.imgix.net/offer-image-c7/98473/IWD5OTV2/2.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','Frankrig','Nice',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,3,NULL),(68,'Rundrejse i Sri Lanka',9389,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F110602%2Frundrejse-syd-sri-lanka%2F%3F','https://travelbird.imgix.net/offer-image-c7/98332/7RNLV7JH.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','','',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,15,NULL),(69,'Lombardiet & Ligurien',1469,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F110664%2Frundrejse-lombardiet-ligurien%2F%3F','https://travelbird.imgix.net/offer-image-c7/98406/SZF75HV6.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','','',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,7,NULL),(70,'I London på trendy hotel',1009,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F110774%2Fmoxy-london-excel%2F%3F','https://travelbird.imgix.net/offer-image-c7/98521/IO2SL26Z.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','Storbritannien','',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,3,NULL),(71,'Naturskønne Møn',579,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F110592%2Fpraestekilde-hotel-stege-moen-danmark%2F%3F','https://travelbird.imgix.net/offer-image-c7/98438/NYWRPHH7.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','Danmark','Stege',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,2,NULL),(72,'Mallorcas østkyst',2749,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F108537%2Fhotel-vistamar-by-pierre-vacances-mallorca%2F%3F','https://travelbird.imgix.net/offer-image-c7/96138/PYWFMXFK.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','Spanien','Portocolom',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,6,NULL),(73,'Italiens riviera i bil',509,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F109712%2Fresidence-ai-pozzi-village-spa-loano-ligurien%2F%3F','https://travelbird.imgix.net/offer-image-c7/97642/NZ6TLKOM/4.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','Italien','Loano',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,4,NULL),(74,'4* hotel midt i Gdańsk',779,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F110626%2Fscandic-gdansk%2F%3F','https://travelbird.imgix.net/offer-image-c7/98380/DLBWGSZH.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','Polen','Gdańsk',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,3,NULL),(75,'Spanske Costa Blanca',4679,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F82831%2Fsun-palace-albir-fly-alicante-spanien%2F%3F','https://travelbird.imgix.net/offer-image-c7/68915/P4WMPOP4.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','Spanien','l\'Alfàs del Pi',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,6,NULL),(76,'Idyl ved Gardasøen',819,'DKK','http://tc.tradetracker.net/?c=14980&m=1041339&a=304736&u=https%3A%2F%2Ftravelbird.dk%2F108843%2Fhotel-bazzanega-voltino%2F%3F','https://travelbird.imgix.net/offer-image-c7/96421/M6IL5XOR.jpg?auto=compress%2Cenhance&ch=DPR&crop=faces%2Cedges%2Ccenter&fit=crop&fm=jpg&h=960&w=1200','Italien','Voltino',NULL,5,'2018-06-24 13:29:40','2018-06-24 13:29:40',NULL,NULL,4,NULL),(77,'Flybillet Kreta Chania t/r - UDEN hotel & transfer',1798,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fagia-marina%2Ffly-kreta-chania%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D99%26children%3D0%26redirect%3D1%26unique_price_id%3D1649706%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=43663','Kreta','Agia Marina','1',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(78,'Flybillet Kreta Chania t/r - UDEN hotel & transfer',1998,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fagia-marina%2Ffly-kreta-chania%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D99%26children%3D0%26redirect%3D1%26unique_price_id%3D1649731%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=43663','Kreta','Agia Marina','1',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(79,'Lejligheder Primo Achilles Paradise',4396,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fagia-marina%2Fprimo-achilles-paradise%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1468607%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=5131','Kreta','Agia Marina','3',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(80,'Lejligheder Primo Achilles Paradise',4596,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fagia-marina%2Fprimo-achilles-paradise%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1468711%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=5131','Kreta','Agia Marina','3',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(81,'Lejligheder Primo Achilles Paradise',4996,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fagia-marina%2Fprimo-achilles-paradise%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1468737%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=5131','Kreta','Agia Marina','3',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(82,'Lejligheder Primo Achilles Paradise',3996,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fagia-marina%2Fprimo-achilles-paradise%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1470063%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=5131','Kreta','Agia Marina','3',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(83,'Lejligheder Primo Achilles Paradise',4196,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fagia-marina%2Fprimo-achilles-paradise%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1470167%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=5131','Kreta','Agia Marina','3',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(84,'Lejligheder Primo Achilles Paradise',4596,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fagia-marina%2Fprimo-achilles-paradise%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1470193%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=5131','Kreta','Agia Marina','3',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(85,'Panorama Hotel m/Mini All Inclusive',5596,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fkato-stalos-agia-marina%2Fpanorama-hotel%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1661507%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=5176','Kreta','Kato Stalos / Agia Marina','4',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(86,'Panorama Hotel m/Mini All Inclusive',5996,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fkato-stalos-agia-marina%2Fpanorama-hotel%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1661513%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=5176','Kreta','Kato Stalos / Agia Marina','4',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(87,'Panorama Hotel m/Mini All Inclusive',5996,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fkato-stalos-agia-marina%2Fpanorama-hotel%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1661525%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=5176','Kreta','Kato Stalos / Agia Marina','4',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(88,'Panorama Hotel m/Mini All Inclusive',6396,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fkato-stalos-agia-marina%2Fpanorama-hotel%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1661537%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=5176','Kreta','Kato Stalos / Agia Marina','4',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(89,'Lejligheder Athina Beach',3996,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fagioi-apostoloi%2Fathina-beach%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1729103%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=76659','Kreta','Agioi Apostoloi','3+',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(90,'Lejligheder Athina Beach',4396,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fagioi-apostoloi%2Fathina-beach%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1729127%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=76659','Kreta','Agioi Apostoloi','3+',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(91,'Lejligheder Athina Beach',4796,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fagioi-apostoloi%2Fathina-beach%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1729151%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=76659','Kreta','Agioi Apostoloi','3+',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(92,'Lejligheder Athina Beach',4396,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Fkreta%2Fagioi-apostoloi%2Fathina-beach%3Fdepartures%3D44%26departure_date%3D24-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1729175%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=76659','Kreta','Agioi Apostoloi','3+',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-24',7,NULL),(93,'Flybillet Rhodos t/r - UDEN hotel & transfer',1798,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Frhodos%2Frhodos-by-kalithea-koskinou%2Fflybillet-rhodos%3Fdepartures%3D44%26departure_date%3D25-06-2018%26adults%3D99%26children%3D0%26redirect%3D1%26unique_price_id%3D1526290%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=43666','Rhodos','Rhodos By/Kalithea/Koskinou','1',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-25',7,NULL),(94,'Oceanis Hotel m/All Inclusive',6996,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Frhodos%2Fialyssos-ixia%2Foceanis-hotel%3Fdepartures%3D44%26departure_date%3D25-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1548124%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=30455','Rhodos','Ialyssos / Ixia','4',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-25',7,NULL),(95,'Kresten Royal Villas & Spa m/ All Inclusive',9996,'DKK','http://tc.tradetracker.net/?c=27752&m=1329114&a=304736&u=http%3A%2F%2Fwww.primotours.dk%2Frejsemal%2Frhodos%2Frhodos-by-kalithea-koskinou%2Fkresten-royal-villas-spa%3Fdepartures%3D44%26departure_date%3D25-06-2018%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1527783%26save_query%3D1','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=48061','Rhodos','Rhodos By/Kalithea/Koskinou','5',4,'2018-06-24 13:32:29','2018-06-24 13:32:29',NULL,'2018-06-25',7,NULL),(96,'Kun flybillet til Antalya',1799,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Ftyrkiet%2Falanya%2Ffly-ayt%3Fdepartures%3D158%26date%3D2018-06-23%26adults%3D99%26children%3D0%26redirect%3D1%26unique_price_id%3D1518259','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=48570','Tyrkiet','Alanya','3',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-23',7,NULL),(97,'Kun flybillet',1799,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Fmalta%2FMellieha%2Fflybillet-malta%3Fdepartures%3D158%26date%3D2018-06-23%26adults%3D99%26children%3D0%26redirect%3D1%26unique_price_id%3D1649187','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=48567','Malta','Mellieha','3',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-23',7,NULL),(98,'Palmiye Beach m/morgenmad',4398,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Ftyrkiet%2Falanya%2Fpalmiye-beach-morgenmad%3Fdepartures%3D158%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1517255','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=39112','Tyrkiet','Alanya','3+',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-23',7,NULL),(99,'Saint Nicholas',3199,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Fkorfu%2FGouvia%2Fsaint-nicholas-hotel%3Fdepartures%3D158%26date%3D2018-06-24%26adults%3D1%26children%3D0%26redirect%3D1%26unique_price_id%3D1508950','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=42901','Korfu','Gouvia','3',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-24',7,NULL),(100,'Kun flybillet',1799,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Fkorfu%2Fkorfu-by%2Fflybillet-korfu%3Fdepartures%3D158%26date%3D2018-06-24%26adults%3D99%26children%3D0%26redirect%3D1%26unique_price_id%3D1518691','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=48569','Korfu','Korfu by','3',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-24',7,NULL),(101,'Kun flybillet til Kreta',2299,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Fkreta%2Fchania-kysten%2Fflybillet-kreta%3Fdepartures%3D158%26date%3D2018-06-24%26adults%3D99%26children%3D0%26redirect%3D1%26unique_price_id%3D1649211','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=48568','Kreta','Chania Kysten','3',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-24',7,NULL),(102,'Kun flybillet til Kreta',1799,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Fkreta%2Fchania-kysten%2Fflybillet-kreta%3Fdepartures%3D158%26date%3D2018-06-24%26adults%3D99%26children%3D0%26redirect%3D1%26unique_price_id%3D1649235','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=48568','Kreta','Chania Kysten','3',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-24',8,NULL),(103,'Alkionides',4998,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Fkreta%2Fchania-kysten%2Falkionides-apart%3Fdepartures%3D158%26date%3D2018-06-24%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1623538','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=42991','Kreta','Chania Kysten','3+',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-24',7,NULL),(104,'Alkionides',4998,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Fkreta%2Fchania-kysten%2Falkionides-apart%3Fdepartures%3D158%26date%3D2018-06-24%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1623562','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=42991','Kreta','Chania Kysten','3+',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-24',7,NULL),(105,'Alkionides',5398,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Fkreta%2Fchania-kysten%2Falkionides-apart%3Fdepartures%3D158%26date%3D2018-06-24%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1623610','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=42991','Kreta','Chania Kysten','3+',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-24',7,NULL),(106,'Alkionides',3998,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Fkreta%2Fchania-kysten%2Falkionides-apart%3Fdepartures%3D158%26date%3D2018-06-24%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1623774','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=42991','Kreta','Chania Kysten','3+',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-24',8,NULL),(107,'Alkionides',3998,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Fkreta%2Fchania-kysten%2Falkionides-apart%3Fdepartures%3D158%26date%3D2018-06-24%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1623798','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=42991','Kreta','Chania Kysten','3+',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-24',8,NULL),(108,'Alkionides',4398,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Fkreta%2Fchania-kysten%2Falkionides-apart%3Fdepartures%3D158%26date%3D2018-06-24%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1623846','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=42991','Kreta','Chania Kysten','3+',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-24',8,NULL),(109,'Govino Bay',4598,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Fkorfu%2FGouvia%2Fgovino-bay%3Fdepartures%3D158%26date%3D2018-06-24%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1512447','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=47298','Korfu','Gouvia','3',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-24',7,NULL),(110,'Ionian Park (All Inclusive)',5598,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Fkorfu%2FGouvia%2Fionian-park-hotel%3Fdepartures%3D158%26date%3D2018-06-24%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1508973','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=76880','Korfu','Gouvia','3+',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-24',7,NULL),(111,'Saint Nicholas',3998,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Fkorfu%2FGouvia%2Fsaint-nicholas-hotel%3Fdepartures%3D158%26date%3D2018-06-24%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1508904','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=42901','Korfu','Gouvia','3',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-24',7,NULL),(112,'Saint Nicholas',4198,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Fkorfu%2FGouvia%2Fsaint-nicholas-hotel%3Fdepartures%3D158%26date%3D2018-06-24%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1508927','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=42901','Korfu','Gouvia','3',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-24',7,NULL),(113,'Flybillet til Rhodos t/r - UDEN hotel og transfer',1799,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Frhodos%2Frhodos-by%2Fflybillet-rhodos%3Fdepartures%3D158%26date%3D2018-06-25%26adults%3D99%26children%3D0%26redirect%3D1%26unique_price_id%3D1648531','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=48566','Rhodos','Rhodos By og Ixia','3',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-25',7,NULL),(114,'Eden Roc Resort (All Inclusive)',7998,'DKK','http://tc.tradetracker.net/?c=27808&m=1326662&a=304736&u=http%3A%2F%2Fwww.suncharter.dk%2Frejsemaal%2Frhodos%2Fkalithea%2Feden-roc-resort%3Fdepartures%3D158%26date%3D2018-06-25%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1539424','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=47492','Rhodos','Kalithea','4+',2,'2018-06-24 13:35:04','2018-06-24 13:35:04',NULL,'2018-06-25',7,NULL),(115,'Flybillet Antalya - Tyrkiet t/r - UDEN hotel og transfer',1799,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Ftyrkiet%2Falanya%2Fflybillet-tyrkiet%3Fdepartures%3D158%26date%3D2018-06-23%26adults%3D99%26children%3D0%26redirect%3D1%26unique_price_id%3D1544915','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=43660','Tyrkiet','Alanya','1',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(116,'Flybillet Paphos - Cypern t/r - UDEN hotel og transfer',1799,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fcypern%2Fpafos%2Fflybillet-cypern%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D99%26children%3D0%26redirect%3D1%26unique_price_id%3D1458153','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=43658','Cypern','Pafos','1',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(117,'Mentor m/morgenmad',4499,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fpreveza%2Fithaca%2Fhotel-mentor%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D1%26children%3D0%26redirect%3D1%26unique_price_id%3D1532587','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=39331','Ithaca','Ithaca','3',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(118,'Flybillet Preveza t/r - UDEN hotel og transfer',1799,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fpreveza%2Fithaca%2Ffly-preveza%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D99%26children%3D0%26redirect%3D1%26unique_price_id%3D1532867','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=43657','Ithaca','Ithaca','1',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(119,'Chrisovalanto',3998,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fpreveza%2Fsivota%2Fchrisovalanto-hotel%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1605990','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=76908','Ithaca','Sivota','3',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(120,'Mourtos',4398,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fpreveza%2Fsivota%2Fmourtos-hotel%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1616481','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=48018','Ithaca','Sivota','3+',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(121,'Akteon Village m/ All Inclusive',7998,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fcypern%2Fpafos%2Fakteon-hollidyavillage%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1541266','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=76912','Cypern','Pafos','3+',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(122,'Akteon Village m/ All Inclusive',8398,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fcypern%2Fpafos%2Fakteon-hollidyavillage%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1541292','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=76912','Cypern','Pafos','3+',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(123,'Damon',3998,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fcypern%2Fpafos%2Fdamon-apts%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1527188','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=76451','Cypern','Pafos','3',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(124,'Damon',4398,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fcypern%2Fpafos%2Fdamon-apts%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1527214','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=76451','Cypern','Pafos','3',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(125,'Dioskouri',5998,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fpreveza%2Fithaca%2Fhotel-dioskouri%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1531578','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=39317','Ithaca','Ithaca','3',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(126,'Dioskouri',4998,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fpreveza%2Fithaca%2Fhotel-dioskouri%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1531640','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=39317','Ithaca','Ithaca','3',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(127,'Dream Family Club m/All Inclusive',6598,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Ftyrkiet%2Fside%2FDream-family-club%3Fdepartures%3D158%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1513624','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=76988','Tyrkiet','Side','4',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(128,'Dream Family Club m/All Inclusive',8398,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Ftyrkiet%2Fside%2FDream-family-club%3Fdepartures%3D158%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1513649','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=76988','Tyrkiet','Side','4',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(129,'Ithaca\'s Poem',5998,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fpreveza%2Fithaca%2Fithacas-poem%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1532723','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=26381','Ithaca','Ithaca','3',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(130,'Ithaca\'s Poem',6598,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fpreveza%2Fithaca%2Fithacas-poem%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1532745','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=26381','Ithaca','Ithaca','3',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(131,'Lazareto Palace m/morgenmad',5398,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fpreveza%2Fithaca%2Flazareto-palace%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1531933','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=39325','Ithaca','Ithaca','3+',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(132,'Mentor m/morgenmad',4998,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fpreveza%2Fithaca%2Fhotel-mentor%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1532521','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=39331','Ithaca','Ithaca','3',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL),(133,'Mentor m/morgenmad',4998,'DKK','http://tc.tradetracker.net/?c=27753&m=1329103&a=304736&u=http%3A%2F%2Fwww.aarhuscharter.dk%2Frejsemaal%2Fpreveza%2Fithaca%2Fhotel-mentor%3Fdepartures%3D157%26date%3D2018-06-23%26adults%3D2%26children%3D0%26redirect%3D1%26unique_price_id%3D1532543','http://photos.booking.tourpaq.com/media/getphoto.ashx?type=Hotel&photosize=570x294&photoid=39331','Ithaca','Ithaca','3',3,'2018-06-24 13:36:27','2018-06-24 13:36:27',NULL,'2018-06-23',7,NULL);
/*!40000 ALTER TABLE `tours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',1,'pt','Post','2018-02-01 13:08:16','2018-02-01 13:08:16'),(2,'data_types','display_name_singular',2,'pt','Página','2018-02-01 13:08:16','2018-02-01 13:08:16'),(3,'data_types','display_name_singular',3,'pt','Utilizador','2018-02-01 13:08:16','2018-02-01 13:08:16'),(4,'data_types','display_name_singular',4,'pt','Categoria','2018-02-01 13:08:16','2018-02-01 13:08:16'),(5,'data_types','display_name_singular',5,'pt','Menu','2018-02-01 13:08:16','2018-02-01 13:08:16'),(6,'data_types','display_name_singular',6,'pt','Função','2018-02-01 13:08:16','2018-02-01 13:08:16'),(7,'data_types','display_name_plural',1,'pt','Posts','2018-02-01 13:08:16','2018-02-01 13:08:16'),(8,'data_types','display_name_plural',2,'pt','Páginas','2018-02-01 13:08:16','2018-02-01 13:08:16'),(9,'data_types','display_name_plural',3,'pt','Utilizadores','2018-02-01 13:08:16','2018-02-01 13:08:16'),(10,'data_types','display_name_plural',4,'pt','Categorias','2018-02-01 13:08:16','2018-02-01 13:08:16'),(11,'data_types','display_name_plural',5,'pt','Menus','2018-02-01 13:08:16','2018-02-01 13:08:16'),(12,'data_types','display_name_plural',6,'pt','Funções','2018-02-01 13:08:16','2018-02-01 13:08:16'),(13,'categories','slug',1,'pt','categoria-1','2018-02-01 13:08:16','2018-02-01 13:08:16'),(14,'categories','name',1,'pt','Categoria 1','2018-02-01 13:08:16','2018-02-01 13:08:16'),(15,'categories','slug',2,'pt','categoria-2','2018-02-01 13:08:16','2018-02-01 13:08:16'),(16,'categories','name',2,'pt','Categoria 2','2018-02-01 13:08:16','2018-02-01 13:08:16'),(17,'pages','title',1,'pt','Olá Mundo','2018-02-01 13:08:16','2018-02-01 13:08:16'),(18,'pages','slug',1,'pt','ola-mundo','2018-02-01 13:08:16','2018-02-01 13:08:16'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2018-02-01 13:08:16','2018-02-01 13:08:16'),(20,'menu_items','title',1,'pt','Painel de Controle','2018-02-01 13:08:16','2018-02-01 13:08:16'),(21,'menu_items','title',2,'pt','Media','2018-02-01 13:08:16','2018-02-01 13:08:16'),(22,'menu_items','title',3,'pt','Publicações','2018-02-01 13:08:16','2018-02-01 13:08:16'),(23,'menu_items','title',4,'pt','Utilizadores','2018-02-01 13:08:16','2018-02-01 13:08:16'),(24,'menu_items','title',5,'pt','Categorias','2018-02-01 13:08:16','2018-02-01 13:08:16'),(25,'menu_items','title',6,'pt','Páginas','2018-02-01 13:08:16','2018-02-01 13:08:16'),(26,'menu_items','title',7,'pt','Funções','2018-02-01 13:08:16','2018-02-01 13:08:16'),(27,'menu_items','title',8,'pt','Ferramentas','2018-02-01 13:08:16','2018-02-01 13:08:16'),(28,'menu_items','title',9,'pt','Menus','2018-02-01 13:08:16','2018-02-01 13:08:16'),(29,'menu_items','title',10,'pt','Base de dados','2018-02-01 13:08:16','2018-02-01 13:08:16'),(30,'menu_items','title',13,'pt','Configurações','2018-02-01 13:08:16','2018-02-01 13:08:16');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin','admin@admin.com','users/default.png','$2y$10$jYrtdELNUPOaoCfQ0Jxhk.RisEa5MUm10dbIAW6hLr/hmxQ2ysVmC','zHrtk3xcXGPmXNdAgZKJHvK05DVADSruy2NAsMlEZItXwRKqvLEtlxUxyg2j','2018-02-01 13:08:16','2018-02-01 13:08:16');
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

-- Dump completed on 2018-06-24 13:59:09
