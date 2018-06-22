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
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,'',1),(2,1,'author_id','text','Author',1,0,1,1,0,1,'',2),(3,1,'category_id','text','Category',1,0,1,1,1,0,'',3),(4,1,'title','text','Title',1,1,1,1,1,1,'',4),(5,1,'excerpt','text_area','excerpt',1,0,1,1,1,1,'',5),(6,1,'body','rich_text_box','Body',1,0,1,1,1,1,'',6),(7,1,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(8,1,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}',8),(9,1,'meta_description','text_area','meta_description',1,0,1,1,1,1,'',9),(10,1,'meta_keywords','text_area','meta_keywords',1,0,1,1,1,1,'',10),(11,1,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(12,1,'created_at','timestamp','created_at',0,1,1,0,0,0,'',12),(13,1,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',13),(14,2,'id','number','id',1,0,0,0,0,0,'',1),(15,2,'author_id','text','author_id',1,0,0,0,0,0,'',2),(16,2,'title','text','title',1,1,1,1,1,1,'',3),(17,2,'excerpt','text_area','excerpt',1,0,1,1,1,1,'',4),(18,2,'body','rich_text_box','body',1,0,1,1,1,1,'',5),(19,2,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"}}',6),(20,2,'meta_description','text','meta_description',1,0,1,1,1,1,'',7),(21,2,'meta_keywords','text','meta_keywords',1,0,1,1,1,1,'',8),(22,2,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(23,2,'created_at','timestamp','created_at',1,1,1,0,0,0,'',10),(24,2,'updated_at','timestamp','updated_at',1,0,0,0,0,0,'',11),(25,2,'image','image','image',0,1,1,1,1,1,'',12),(26,3,'id','number','id',1,0,0,0,0,0,'',1),(27,3,'name','text','name',1,1,1,1,1,1,'',2),(28,3,'email','text','email',1,1,1,1,1,1,'',3),(29,3,'password','password','password',0,0,0,1,1,0,'',4),(30,3,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}',10),(31,3,'remember_token','text','remember_token',0,0,0,0,0,0,'',5),(32,3,'created_at','timestamp','created_at',0,1,1,0,0,0,'',6),(33,3,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',7),(34,3,'avatar','image','avatar',0,1,1,1,1,1,'',8),(35,5,'id','number','id',1,0,0,0,0,0,'',1),(36,5,'name','text','name',1,1,1,1,1,1,'',2),(37,5,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(38,5,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(39,4,'id','number','id',1,0,0,0,0,0,'',1),(40,4,'parent_id','select_dropdown','parent_id',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(41,4,'order','text','order',1,1,1,1,1,1,'{\"default\":1}',3),(42,4,'name','text','name',1,1,1,1,1,1,'',4),(43,4,'slug','text','slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(44,4,'created_at','timestamp','created_at',0,0,1,0,0,0,'',6),(45,4,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',7),(46,6,'id','number','id',1,0,0,0,0,0,'',1),(47,6,'name','text','Name',1,1,1,1,1,1,'',2),(48,6,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(49,6,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(50,6,'display_name','text','Display Name',1,1,1,1,1,1,'',5),(51,1,'seo_title','text','seo_title',0,1,1,1,1,1,'',14),(52,1,'featured','checkbox','featured',1,1,1,1,1,1,'',15),(53,3,'role_id','text','role_id',1,1,1,1,1,1,'',9),(72,9,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(74,9,'name','text','Name',0,1,1,1,1,1,NULL,3),(75,9,'logo','image','Logo',0,1,1,1,1,1,NULL,4),(76,9,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,5),(77,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,6),(79,9,'code','text','Code',0,1,1,1,1,1,NULL,2),(80,10,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(81,10,'name','text','Name',0,1,1,1,1,1,NULL,2),(82,10,'price','text','Price',0,1,1,1,1,1,NULL,3),(83,10,'currency','text','Currency',0,1,1,1,1,1,NULL,4),(84,10,'url','text','Url',0,1,1,1,1,1,NULL,5),(85,10,'image_url','text','Image Url',0,1,1,1,1,1,NULL,6),(86,10,'country','text','Country',0,1,1,1,1,1,NULL,7),(87,10,'city','text','City',0,1,1,1,1,1,NULL,8),(88,10,'service_type','text','Service Type',0,1,1,1,1,1,NULL,9),(89,10,'stars','text','Stars',0,1,1,1,1,1,NULL,10),(90,10,'provider_id','checkbox','Provider Id',0,1,1,1,1,1,NULL,11),(91,10,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,12),(92,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,13),(93,10,'tour_belongsto_provider_relationship','relationship','providers',0,1,1,1,1,1,'{\"model\":\"App\\\\Provider\",\"table\":\"providers\",\"type\":\"belongsTo\",\"column\":\"provider_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',14),(94,11,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(95,11,'departure_date','checkbox','Departure Date',0,1,1,1,1,1,NULL,2),(96,11,'duration','number','Duration',0,1,1,1,1,1,NULL,3),(97,11,'departure_price','number','Departure Price',0,1,1,1,1,1,NULL,4),(98,11,'number_of_persons','number','Number Of Persons',0,1,1,1,1,1,NULL,5),(99,11,'transport_type','text','Transport Type',0,1,1,1,1,1,NULL,6),(100,11,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,7),(101,11,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,8),(102,11,'tour_id','checkbox','Tour Id',0,1,1,1,1,1,NULL,9),(103,11,'variation_belongsto_tour_relationship','relationship','tours',0,1,1,1,1,1,'{\"model\":\"App\\\\Tour\",\"table\":\"tours\",\"type\":\"belongsTo\",\"column\":\"tour_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',10),(104,12,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(105,12,'country','text','Country',0,1,1,1,1,1,NULL,2),(106,12,'city','text','City',0,1,1,1,1,1,NULL,3),(107,12,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,4),(108,12,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,5),(109,10,'view_count','number','View Count',0,1,1,1,1,1,NULL,14),(110,12,'view_count','number','View Count',0,1,1,1,1,1,NULL,6);
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
INSERT INTO `data_types` VALUES (1,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy','','',1,0,'2018-02-01 13:08:15','2018-02-01 13:08:15'),(2,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,'2018-02-01 13:08:15','2018-02-01 13:08:15'),(3,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','','',1,0,'2018-02-01 13:08:15','2018-02-01 13:08:15'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,'2018-02-01 13:08:15','2018-02-01 13:08:15'),(5,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,'2018-02-01 13:08:15','2018-02-01 13:08:15'),(6,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,'2018-02-01 13:08:15','2018-02-01 13:08:15'),(9,'providers','providers','Provider','Providers',NULL,'App\\Provider',NULL,NULL,NULL,1,0,'2018-05-11 09:23:58','2018-05-11 09:23:58'),(10,'tours','tours','Tour','Tours',NULL,'App\\Tour',NULL,NULL,NULL,1,0,'2018-05-11 10:34:06','2018-05-11 10:34:06'),(11,'variations','variations','Variation','Variations',NULL,'App\\Variation',NULL,NULL,NULL,1,0,'2018-05-11 10:36:07','2018-05-11 10:36:07'),(12,'destinations','destinations','Destination','Destinations',NULL,'App\\Destination',NULL,NULL,NULL,1,0,'2018-06-03 09:20:31','2018-06-03 09:20:31');
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
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1);
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
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(2,'browse_database',NULL,'2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(3,'browse_media',NULL,'2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(4,'browse_compass',NULL,'2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(5,'browse_menus','menus','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(6,'read_menus','menus','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(7,'edit_menus','menus','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(8,'add_menus','menus','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(9,'delete_menus','menus','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(10,'browse_pages','pages','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(11,'read_pages','pages','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(12,'edit_pages','pages','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(13,'add_pages','pages','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(14,'delete_pages','pages','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(15,'browse_roles','roles','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(16,'read_roles','roles','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(17,'edit_roles','roles','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(18,'add_roles','roles','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(19,'delete_roles','roles','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(20,'browse_users','users','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(21,'read_users','users','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(22,'edit_users','users','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(23,'add_users','users','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(24,'delete_users','users','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(25,'browse_posts','posts','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(26,'read_posts','posts','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(27,'edit_posts','posts','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(28,'add_posts','posts','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(29,'delete_posts','posts','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(30,'browse_categories','categories','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(31,'read_categories','categories','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(32,'edit_categories','categories','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(33,'add_categories','categories','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(34,'delete_categories','categories','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(35,'browse_settings','settings','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(36,'read_settings','settings','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(37,'edit_settings','settings','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(38,'add_settings','settings','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(39,'delete_settings','settings','2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(40,'browse_hooks',NULL,'2018-02-01 13:08:16','2018-02-01 13:08:16',NULL),(51,'browse_providers','providers','2018-05-11 09:23:58','2018-05-11 09:23:58',NULL),(52,'read_providers','providers','2018-05-11 09:23:58','2018-05-11 09:23:58',NULL),(53,'edit_providers','providers','2018-05-11 09:23:58','2018-05-11 09:23:58',NULL),(54,'add_providers','providers','2018-05-11 09:23:58','2018-05-11 09:23:58',NULL),(55,'delete_providers','providers','2018-05-11 09:23:58','2018-05-11 09:23:58',NULL),(56,'browse_tours','tours','2018-05-11 10:34:06','2018-05-11 10:34:06',NULL),(57,'read_tours','tours','2018-05-11 10:34:06','2018-05-11 10:34:06',NULL),(58,'edit_tours','tours','2018-05-11 10:34:06','2018-05-11 10:34:06',NULL),(59,'add_tours','tours','2018-05-11 10:34:06','2018-05-11 10:34:06',NULL),(60,'delete_tours','tours','2018-05-11 10:34:06','2018-05-11 10:34:06',NULL),(61,'browse_variations','variations','2018-05-11 10:36:07','2018-05-11 10:36:07',NULL),(62,'read_variations','variations','2018-05-11 10:36:07','2018-05-11 10:36:07',NULL),(63,'edit_variations','variations','2018-05-11 10:36:07','2018-05-11 10:36:07',NULL),(64,'add_variations','variations','2018-05-11 10:36:07','2018-05-11 10:36:07',NULL),(65,'delete_variations','variations','2018-05-11 10:36:07','2018-05-11 10:36:07',NULL),(66,'browse_destinations','destinations','2018-06-03 09:20:31','2018-06-03 09:20:31',NULL),(67,'read_destinations','destinations','2018-06-03 09:20:31','2018-06-03 09:20:31',NULL),(68,'edit_destinations','destinations','2018-06-03 09:20:31','2018-06-03 09:20:31',NULL),(69,'add_destinations','destinations','2018-06-03 09:20:31','2018-06-03 09:20:31',NULL),(70,'delete_destinations','destinations','2018-06-03 09:20:31','2018-06-03 09:20:31',NULL);
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
  `name` text COLLATE utf8_unicode_ci,
  `logo` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (1,'SUNWEB','Sunweb','providers/May2018/AfB37v1DSzpOu7J3q7p6.png','2018-05-11 10:13:46','2018-05-11 10:13:46');
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
  `service_type` text COLLATE utf8_unicode_ci,
  `stars` text COLLATE utf8_unicode_ci,
  `provider_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `view_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours`
--

LOCK TABLES `tours` WRITE;
/*!40000 ALTER TABLE `tours` DISABLE KEYS */;
INSERT INTO `tours` VALUES (1,'Hotel Ambrosia',1998,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_ambrosia.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/22900000/8000/22908240-Web1.jpg','Tyrkiet','Bitez','Halvpension','4',1,'2018-06-01 12:01:14','2018-06-19 17:59:22',27),(2,'Hotel Bitez Garden Life',1873,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_bitez_garden_life.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/16800000/7000/16807976-Web1.jpg','Tyrkiet','Bitez','all inclusive','3,5',1,'2018-06-01 12:01:14','2018-06-18 18:51:12',2),(3,'Hotel Costa 3/S Beach Club',3270,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_costa_3_s_beach_club_.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/800000/22000/822125-Web1.jpg','Tyrkiet','Bitez','all inclusive','3',1,'2018-06-01 12:01:15','2018-06-18 19:31:56',8),(4,'Hotel Costa Bitezhan',3379,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_costa_bitezhan.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/31700000/68000/31768740-Web1.jpg','Tyrkiet','Bitez','all inclusive','3',1,'2018-06-01 12:01:15','2018-06-18 19:32:20',4),(5,'Hotel Natur Garden',2297,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_natur_garden.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/31900000/68000/31968305-Web1.jpg','Tyrkiet','Bitez','all inclusive','3',1,'2018-06-01 12:01:15','2018-06-18 20:35:30',4),(6,'Hotel Okaliptus',2273,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_okaliptus.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/1900000/28000/1928237-Web1.jpg','Tyrkiet','Bitez','Halvpension','3,5',1,'2018-06-01 12:01:15','2018-06-19 15:51:21',4),(7,'Hotel Paloma Family Club',2093,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_paloma_family_club.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/22800000/35000/22835399-Web1.jpg','Tyrkiet','Bitez','all inclusive','3,5',1,'2018-06-01 12:01:15','2018-06-01 12:01:15',NULL),(8,'Hotel Summer Garden',1737,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Fhotel_summer_garden.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/20200000/51000/20251757-Web1.jpg','Tyrkiet','Bitez','Halvpension','3',1,'2018-06-01 12:01:15','2018-06-19 17:59:45',5),(9,'Lejl. Sirca',1287,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Flejligheder_sirca.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/22800000/40000/22840026-Web1.jpg','Tyrkiet','Bitez','uden pension','3',1,'2018-06-01 12:01:16','2018-06-18 20:06:02',5),(10,'Lejl. Summer Garden',1377,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbitez%2Flejligheder_summer_garden.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/20200000/51000/20251757-Web1.jpg','Tyrkiet','Bitez','uden pension','3',1,'2018-06-01 12:01:16','2018-06-18 19:18:13',2),(11,'Hotel Bodrum Holiday Resort',3494,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbodrum%2Fhotel_bodrum_holiday_resort.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/3200000/46000/3246849-Web1.jpg','Tyrkiet','Bodrum','all inclusive','5',1,'2018-06-01 12:01:16','2018-06-01 12:01:16',NULL),(12,'Hotel Labranda TMT Bodrum Resort',4419,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbodrum%2Fhotel_labranda_tmt_bodrum_resort_.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/33900000/86000/33986112-Web1.jpg','Tyrkiet','Bodrum','all inclusive','5',1,'2018-06-01 12:01:16','2018-06-18 19:31:20',2),(13,'Hotel Mandarin Resort',3409,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbodrum%2Fhotel_mandarin_resort.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/35000000/68000/35068974-Web1.png','Tyrkiet','Bodrum','all inclusive','4',1,'2018-06-01 12:01:16','2018-06-18 19:20:02',3),(14,'Hotel Salmakis Beach Resort & Spa',4427,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbodrum%2Fhotel_salmakis_beach_resort_spa.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/22300000/87000/22387632-Web1.jpg','Tyrkiet','Bodrum','all inclusive','4,5',1,'2018-06-01 12:01:16','2018-06-18 19:31:27',4),(15,'Hotel Voyage Bodrum',4989,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbodrum%2Fhotel_voyage_bodrum.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/19400000/98000/19498376-Web1.jpg','Tyrkiet','Bodrum','Ultra all inclusive','5',1,'2018-06-01 12:01:00','2018-06-19 11:16:43',104),(16,'Hotel Baia',3853,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbodrum-gundogan%2Fhotel_baia.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/33800000/22000/33822550-Web1.jpg','Tyrkiet','Bodrum - Gündogan','Ultra all inclusive','5',1,'2018-06-01 12:01:17','2018-06-18 19:19:50',9),(17,'Hotel Latanya Park Resort',4825,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fbodrum-yaliciftlik%2Fhotel_latanya_park_resort.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/34400000/56000/34456354-Web1.jpg','Tyrkiet','Bodrum - Yaliciftlik','Ultra all inclusive','4',1,'2018-06-01 12:01:17','2018-06-01 12:01:17',NULL),(18,'Aquasis Deluxe Resort & Spa',4169,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fdidim%2Faquasis_deluxe_resort_spa.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/30700000/41000/30741422-Web1.jpg','Tyrkiet','Didim','Ultra all inclusive','5',1,'2018-06-01 12:01:17','2018-06-18 19:20:04',1),(19,'Hotel Didim Beach Resort & Elegance',3685,'DKK','https://sol.sunweb.dk/rejser/?tt=7809_919799_304736_&r=https%3A%2F%2Fsol.sunweb.dk%2Ftyrkiet%2Fbodrum-halvoen%2Fdidim%2Fhotel_didim_beach_resort_elegance.htm','https://sol.sunweb.dk/utilpages/getimage.ashx?width=600&height=400&file=Images/Web1/22600000/18000/22618752-Web1.jpg','Tyrkiet','Didim','all inclusive','4',1,'2018-06-01 12:01:17','2018-06-18 18:51:57',1);
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

--
-- Table structure for table `variations`
--

DROP TABLE IF EXISTS `variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departure_date` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `departure_price` int(11) DEFAULT NULL,
  `number_of_persons` int(11) DEFAULT NULL,
  `transport_type` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tour_id` int(11) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `view_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=761 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variations`
--

LOCK TABLES `variations` WRITE;
/*!40000 ALTER TABLE `variations` DISABLE KEYS */;
INSERT INTO `variations` VALUES (1,'2018-06-10',8,2829,2,'Flight','2018-06-01 12:01:14','2018-06-19 17:53:21',1,1,1),(2,'2018-06-10',8,2919,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(3,'2018-10-07',8,3074,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(4,'2018-10-07',8,3174,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(5,'2018-06-10',8,3201,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(6,'2018-06-10',8,3291,3,'Flight','2018-06-01 12:01:14','2018-06-19 17:59:04',1,1,1),(7,'2018-10-07',8,3445,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(8,'2018-06-10',8,3519,1,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(9,'2018-09-23',8,3519,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(10,'2018-09-30',8,3521,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(11,'2018-09-30',8,3521,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(12,'2018-06-17',8,3527,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(13,'2018-09-16',8,3535,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(14,'2018-09-09',8,3539,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(15,'2018-09-09',8,3539,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(16,'2018-10-07',8,3545,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(17,'2018-10-07',8,3569,1,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(18,'2018-08-26',8,3583,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(19,'2018-09-23',8,3609,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(20,'2018-06-17',8,3617,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(21,'2018-08-22',8,3620,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(22,'2018-08-19',8,3620,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(23,'2018-09-30',8,3621,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(24,'2018-09-30',8,3621,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(25,'2018-09-16',8,3625,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(26,'2018-09-09',8,3629,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(27,'2018-09-09',8,3629,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(28,'2018-08-05',4,3670,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(29,'2018-08-26',8,3673,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(30,'2018-08-22',8,3710,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(31,'2018-08-19',8,3710,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(32,'2018-08-12',8,3715,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(33,'2018-08-05',4,3715,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(34,'2018-06-24',8,3739,2,'Flight','2018-06-01 12:01:14','2018-06-19 17:59:22',1,1,1),(35,'2018-08-12',8,3805,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(36,'2018-06-24',8,3839,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(37,'2018-08-01',5,3862,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(38,'2018-08-12',8,3864,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(39,'2018-08-29',8,3880,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',1,1,0),(40,'2018-06-10',8,3891,1,'Flight','2018-06-01 12:01:14','2018-06-19 17:55:40',1,1,1),(41,'2018-08-29',5,3085,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(42,'2018-08-29',5,3085,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(43,'2018-08-29',5,3145,4,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(44,'2018-08-15',5,3155,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(45,'2018-08-15',5,3155,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(46,'2018-08-15',5,3215,4,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(47,'2018-08-26',4,3308,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(48,'2018-08-26',4,3308,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(49,'2018-08-26',4,3348,4,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(50,'2018-09-19',5,3407,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(51,'2018-09-19',5,3407,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(52,'2018-08-19',4,3445,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(53,'2018-08-19',4,3445,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(54,'2018-09-26',5,3455,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(55,'2018-09-26',5,3455,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(56,'2018-09-23',4,3459,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(57,'2018-09-23',4,3459,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(58,'2018-09-19',5,3467,4,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(59,'2018-08-19',4,3495,4,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(60,'2018-09-23',4,3499,4,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(61,'2018-08-22',5,3505,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(62,'2018-08-22',5,3505,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(63,'2018-09-26',5,3515,4,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(64,'2018-08-12',4,3550,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(65,'2018-08-12',4,3550,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(66,'2018-08-22',5,3565,4,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(67,'2018-08-12',4,3590,4,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(68,'2018-09-16',4,3615,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(69,'2018-09-16',4,3615,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(70,'2018-09-09',4,3619,3,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(71,'2018-09-09',4,3619,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(72,'2018-09-09',4,3619,2,'Flight','2018-06-01 12:01:14','2018-06-01 12:01:14',2,1,0),(73,'2018-09-09',4,3619,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',2,1,0),(74,'2018-09-09',4,3659,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',2,1,0),(75,'2018-09-09',4,3659,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',2,1,0),(76,'2018-09-16',4,3665,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',2,1,0),(77,'2018-09-02',4,3674,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',2,1,0),(78,'2018-09-02',4,3674,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',2,1,0),(79,'2018-08-12',4,3699,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',2,1,0),(80,'2018-08-12',4,3699,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',2,1,0),(81,'2018-09-16',8,3270,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(82,'2018-09-16',8,3270,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(83,'2018-10-07',8,3324,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(84,'2018-10-07',8,3324,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(85,'2018-10-07',8,3419,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(86,'2018-09-23',8,3569,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(87,'2018-09-23',8,3569,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(88,'2018-09-16',8,3642,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(89,'2018-09-16',8,3642,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(90,'2018-10-07',8,3695,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(91,'2018-10-07',8,3695,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(92,'2018-10-07',8,3790,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(93,'2018-09-30',8,3791,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(94,'2018-09-30',8,3791,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(95,'2018-09-30',8,3791,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(96,'2018-09-30',8,3791,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(97,'2018-10-07',8,3904,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(98,'2018-09-16',8,3935,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(99,'2018-09-16',8,3935,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(100,'2018-09-26',8,3945,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(101,'2018-09-26',8,3945,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(102,'2018-09-30',8,3951,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(103,'2018-09-30',8,3951,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(104,'2018-08-01',5,4012,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(105,'2018-08-01',5,4012,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(106,'2018-08-01',5,4161,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(107,'2018-08-01',5,4161,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(108,'2018-09-23',8,4164,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(109,'2018-09-23',8,4164,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(110,'2018-09-23',8,4189,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(111,'2018-09-23',8,4189,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(112,'2018-10-07',8,4275,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(113,'2018-09-16',8,4307,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(114,'2018-09-16',8,4307,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(115,'2018-09-30',8,4366,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(116,'2018-09-30',8,4366,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(117,'2018-07-25',5,4405,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(118,'2018-07-25',5,4405,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(119,'2018-09-23',15,4459,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(120,'2018-09-23',15,4459,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',3,1,0),(121,'2018-10-07',8,3379,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(122,'2018-10-07',8,3379,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(123,'2018-10-07',8,3464,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(124,'2018-09-23',8,3694,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(125,'2018-09-23',8,3694,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(126,'2018-10-07',8,3750,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(127,'2018-10-07',8,3750,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(128,'2018-09-30',8,3831,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(129,'2018-09-30',8,3831,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(130,'2018-09-30',8,3831,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(131,'2018-09-30',8,3831,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(132,'2018-10-07',8,3835,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(133,'2018-09-26',8,3990,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(134,'2018-09-26',8,3990,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(135,'2018-09-30',8,4001,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(136,'2018-09-30',8,4001,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(137,'2018-08-12',8,4205,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(138,'2018-08-12',8,4205,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(139,'2018-09-23',8,4249,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(140,'2018-09-23',8,4289,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(141,'2018-09-23',8,4289,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(142,'2018-08-12',8,4354,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(143,'2018-08-12',8,4354,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(144,'2018-07-25',5,4505,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(145,'2018-07-25',5,4505,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(146,'2018-09-26',8,4625,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(147,'2018-10-14',8,4689,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(148,'2018-10-14',8,4689,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(149,'2018-10-14',8,4689,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(150,'2018-10-14',8,4689,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(151,'2018-09-23',15,4724,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(152,'2018-09-23',15,4724,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(153,'2018-07-18',5,4762,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(154,'2018-07-18',5,4762,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(155,'2018-10-14',8,4774,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(156,'2018-10-14',8,4774,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(157,'2018-09-23',8,4844,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(158,'2018-07-25',5,4877,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(159,'2018-07-25',5,4877,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(160,'2018-07-29',4,4900,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',4,1,0),(161,'2018-08-15',5,2525,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(162,'2018-08-15',5,2525,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(163,'2018-08-22',5,2795,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(164,'2018-08-22',5,2795,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(165,'2018-08-29',5,2795,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(166,'2018-08-29',5,2795,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(167,'2018-08-26',4,2878,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(168,'2018-08-26',4,2878,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(169,'2018-08-19',4,2935,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(170,'2018-08-19',4,2935,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(171,'2018-06-10',8,3039,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(172,'2018-06-10',8,3039,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(173,'2018-09-26',5,3065,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(174,'2018-09-26',5,3065,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(175,'2018-08-12',4,3080,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(176,'2018-08-12',4,3080,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(177,'2018-08-15',5,3125,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(178,'2018-09-19',5,3157,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(179,'2018-09-19',5,3157,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(180,'2018-09-16',4,3195,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(181,'2018-09-16',4,3195,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(182,'2018-08-15',8,3215,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(183,'2018-08-15',8,3215,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(184,'2018-08-12',4,3229,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(185,'2018-09-23',4,3229,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(186,'2018-09-23',4,3229,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(187,'2018-08-12',4,3229,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(188,'2018-09-09',4,3259,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(189,'2018-09-09',4,3259,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(190,'2018-09-09',4,3259,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(191,'2018-09-09',4,3259,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(192,'2018-08-26',4,3288,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(193,'2018-09-19',8,3297,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(194,'2018-09-19',8,3297,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(195,'2018-09-12',5,3305,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(196,'2018-09-12',5,3305,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(197,'2018-08-29',8,3335,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(198,'2018-08-22',8,3335,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(199,'2018-08-22',8,3335,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(200,'2018-08-29',8,3335,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',5,1,0),(201,'2018-06-10',8,3089,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(202,'2018-06-10',8,3089,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(203,'2018-08-26',8,3388,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(204,'2018-08-26',8,3388,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(205,'2018-06-10',8,3429,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(206,'2018-06-10',8,3461,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(207,'2018-06-10',8,3461,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(208,'2018-10-07',8,3539,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(209,'2018-10-07',8,3539,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(210,'2018-10-07',8,3539,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(211,'2018-09-16',8,3605,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(212,'2018-09-16',8,3605,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(213,'2018-09-23',8,3679,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(214,'2018-09-23',8,3679,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(215,'2018-09-23',8,3679,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(216,'2018-08-29',8,3685,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(217,'2018-08-29',8,3685,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(218,'2018-06-10',8,3801,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(219,'2018-09-09',8,3829,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(220,'2018-09-09',8,3829,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(221,'2018-09-09',8,3829,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(222,'2018-09-09',8,3829,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(223,'2018-08-05',4,3865,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(224,'2018-08-05',4,3865,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(225,'2018-10-07',8,3910,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(226,'2018-10-07',8,3910,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(227,'2018-10-07',8,3910,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(228,'2018-08-19',8,3915,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(229,'2018-08-22',8,3915,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(230,'2018-08-22',8,3915,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(231,'2018-08-19',8,3915,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(232,'2018-06-17',8,3917,2,'Flight','2018-06-01 12:01:15','2018-06-19 15:51:21',6,1,1),(233,'2018-06-17',8,3917,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(234,'2018-09-30',8,3976,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(235,'2018-09-30',8,3976,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(236,'2018-09-30',8,3976,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(237,'2018-09-30',8,3976,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(238,'2018-09-30',8,3976,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(239,'2018-09-30',8,3976,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(240,'2018-09-16',8,3977,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',6,1,0),(241,'2018-10-07',8,2954,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(242,'2018-10-07',8,2954,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(243,'2018-10-07',8,3039,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(244,'2018-09-16',8,3135,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(245,'2018-09-16',8,3135,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(246,'2018-09-16',8,3245,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(247,'2018-08-26',8,3318,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(248,'2018-08-26',8,3318,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(249,'2018-09-09',8,3319,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(250,'2018-09-09',8,3319,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(251,'2018-09-09',8,3319,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(252,'2018-09-09',8,3319,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(253,'2018-10-07',8,3325,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(254,'2018-10-07',8,3325,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(255,'2018-10-07',8,3384,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(256,'2018-10-07',8,3410,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(257,'2018-09-09',8,3419,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(258,'2018-09-09',8,3419,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(259,'2018-08-26',8,3428,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(260,'2018-09-30',8,3441,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(261,'2018-09-30',8,3441,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(262,'2018-09-30',8,3441,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(263,'2018-09-30',8,3441,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(264,'2018-09-16',8,3507,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(265,'2018-09-16',8,3507,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(266,'2018-09-23',8,3509,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(267,'2018-09-23',8,3509,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(268,'2018-09-30',8,3536,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(269,'2018-09-30',8,3536,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(270,'2018-08-29',8,3615,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(271,'2018-08-29',8,3615,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(272,'2018-09-16',8,3617,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(273,'2018-09-23',8,3619,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(274,'2018-08-29',8,3725,4,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(275,'2018-08-05',4,3735,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(276,'2018-08-05',4,3735,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(277,'2018-10-07',8,3755,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(278,'2018-09-16',8,3785,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(279,'2018-08-12',8,3860,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(280,'2018-08-12',8,3860,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',7,1,0),(281,'2018-06-10',8,2479,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(282,'2018-06-10',8,2479,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(283,'2018-06-10',8,2851,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(284,'2018-06-10',8,2851,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(285,'2018-08-26',8,2908,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(286,'2018-08-26',8,2908,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(287,'2018-10-07',8,2949,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(288,'2018-10-07',8,2949,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(289,'2018-06-17',8,3017,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(290,'2018-06-17',8,3017,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(291,'2018-08-22',8,3095,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(292,'2018-08-22',8,3095,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(293,'2018-08-19',8,3095,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(294,'2018-08-19',8,3095,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(295,'2018-08-12',8,3190,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(296,'2018-08-12',8,3190,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(297,'2018-08-29',8,3205,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(298,'2018-08-29',8,3205,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(299,'2018-06-24',8,3229,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(300,'2018-06-24',8,3229,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(301,'2018-10-07',8,3229,1,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(302,'2018-09-16',8,3295,3,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(303,'2018-09-16',8,3295,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(304,'2018-09-09',8,3299,2,'Flight','2018-06-01 12:01:15','2018-06-01 12:01:15',8,1,0),(305,'2018-09-09',8,3299,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',8,1,0),(306,'2018-09-09',8,3299,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',8,1,0),(307,'2018-09-09',8,3299,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',8,1,0),(308,'2018-10-07',8,3320,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',8,1,0),(309,'2018-10-07',8,3320,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',8,1,0),(310,'2018-08-12',8,3339,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',8,1,0),(311,'2018-08-12',8,3339,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',8,1,0),(312,'2018-06-17',8,3389,2,'Flight','2018-06-01 12:01:16','2018-06-19 17:59:45',8,1,1),(313,'2018-06-17',8,3389,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',8,1,0),(314,'2018-09-23',8,3409,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',8,1,0),(315,'2018-09-23',8,3409,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',8,1,0),(316,'2018-08-05',4,3445,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',8,1,0),(317,'2018-08-05',4,3445,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',8,1,0),(318,'2018-08-26',8,3518,1,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',8,1,0),(319,'2018-09-30',8,3526,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',8,1,0),(320,'2018-09-30',8,3526,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',8,1,0),(321,'2018-08-26',8,2028,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(322,'2018-06-10',8,2029,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(323,'2018-08-26',8,2138,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(324,'2018-06-10',8,2139,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(325,'2018-08-22',8,2155,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(326,'2018-08-19',8,2155,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(327,'2018-08-19',8,2285,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(328,'2018-08-22',8,2285,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(329,'2018-06-10',8,2349,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(330,'2018-08-12',8,2350,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(331,'2018-08-26',8,2358,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(332,'2018-06-10',8,2401,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(333,'2018-09-16',8,2445,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(334,'2018-08-19',15,2475,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(335,'2018-08-12',8,2499,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(336,'2018-06-10',8,2511,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(337,'2018-08-12',8,2530,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(338,'2018-09-16',8,2545,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(339,'2018-06-17',8,2557,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(340,'2018-08-19',8,2565,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(341,'2018-08-22',8,2565,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(342,'2018-10-07',8,2629,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(343,'2018-06-17',8,2667,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(344,'2018-08-19',8,2676,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(345,'2018-08-12',8,2679,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(346,'2018-08-26',8,2697,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(347,'2018-10-07',8,2719,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(348,'2018-06-10',8,2721,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(349,'2018-08-19',15,2725,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(350,'2018-06-17',15,2739,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(351,'2018-08-12',15,2740,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(352,'2018-09-16',8,2745,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(353,'2018-06-24',8,2779,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(354,'2018-09-23',8,2779,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(355,'2018-06-10',15,2795,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(356,'2018-08-19',8,2806,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(357,'2018-08-26',8,2807,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(358,'2018-09-16',8,2817,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(359,'2018-09-23',8,2869,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(360,'2018-08-12',8,2870,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',9,1,0),(361,'2018-06-10',8,2119,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(362,'2018-08-26',8,2218,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(363,'2018-06-10',8,2259,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(364,'2018-06-10',8,2299,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(365,'2018-08-19',8,2315,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(366,'2018-08-22',8,2315,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(367,'2018-08-26',8,2398,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(368,'2018-08-12',8,2410,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(369,'2018-08-26',8,2438,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(370,'2018-06-10',8,2491,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(371,'2018-08-22',8,2505,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(372,'2018-08-19',8,2505,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(373,'2018-08-29',8,2515,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(374,'2018-08-12',8,2559,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(375,'2018-10-07',8,2579,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(376,'2018-08-12',8,2600,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(377,'2018-08-19',8,2625,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(378,'2018-08-22',8,2625,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(379,'2018-06-10',8,2631,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(380,'2018-09-16',8,2645,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(381,'2018-06-17',8,2647,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(382,'2018-09-09',8,2649,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(383,'2018-10-07',8,2649,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(384,'2018-09-09',8,2649,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(385,'2018-10-07',8,2659,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(386,'2018-06-10',8,2671,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(387,'2018-08-29',8,2695,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(388,'2018-08-12',8,2720,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(389,'2018-08-29',8,2735,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(390,'2018-08-12',8,2749,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(391,'2018-06-17',8,2787,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(392,'2018-09-16',8,2805,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(393,'2018-09-09',8,2809,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(394,'2018-09-09',8,2809,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(395,'2018-09-16',8,2825,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(396,'2018-06-17',8,2827,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(397,'2018-09-09',8,2829,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(398,'2018-09-09',8,2829,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(399,'2018-08-22',15,2835,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(400,'2018-08-19',15,2835,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',10,1,0),(401,'2018-10-07',8,3494,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(402,'2018-10-07',8,3494,1,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(403,'2018-10-07',8,3664,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(404,'2018-10-07',8,3664,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(405,'2018-10-07',8,3769,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(406,'2018-10-07',8,3769,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(407,'2018-10-07',8,3865,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(408,'2018-10-07',8,3865,1,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(409,'2018-10-07',8,3994,5,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(410,'2018-10-07',8,4035,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(411,'2018-10-07',8,4035,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(412,'2018-10-07',8,4054,6,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(413,'2018-10-07',8,4054,5,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(414,'2018-10-07',8,4140,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(415,'2018-10-07',8,4140,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(416,'2018-09-16',8,4285,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(417,'2018-10-07',8,4365,5,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(418,'2018-09-09',8,4389,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(419,'2018-09-09',8,4389,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(420,'2018-10-07',8,4425,6,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(421,'2018-10-07',8,4425,5,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(422,'2018-09-30',8,4476,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(423,'2018-09-30',8,4476,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(424,'2018-09-16',8,4495,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(425,'2018-09-16',8,4495,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(426,'2018-08-26',8,4563,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(427,'2018-08-26',8,4563,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(428,'2018-09-09',8,4589,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(429,'2018-09-09',8,4589,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(430,'2018-09-09',8,4589,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(431,'2018-09-09',8,4589,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(432,'2018-09-16',8,4625,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(433,'2018-09-16',8,4625,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(434,'2018-09-16',8,4657,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(435,'2018-09-23',8,4659,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(436,'2018-09-30',8,4686,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(437,'2018-09-30',8,4686,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(438,'2018-09-30',8,4686,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(439,'2018-09-30',8,4686,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(440,'2018-09-09',8,4779,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',11,1,0),(441,'2018-10-07',8,4419,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(442,'2018-10-07',8,4419,1,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(443,'2018-06-10',8,4789,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(444,'2018-10-07',8,4790,1,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(445,'2018-10-07',8,4790,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(446,'2018-10-07',8,4989,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(447,'2018-10-07',8,4989,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(448,'2018-08-05',4,5045,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(449,'2018-10-07',8,5149,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(450,'2018-06-10',8,5161,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(451,'2018-09-16',8,5235,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(452,'2018-10-07',8,5360,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(453,'2018-10-07',8,5360,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(454,'2018-08-05',4,5417,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(455,'2018-10-07',8,5520,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(456,'2018-08-26',8,5578,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(457,'2018-09-16',8,5607,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(458,'2018-09-23',8,5609,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(459,'2018-06-10',8,5619,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(460,'2018-06-10',8,5619,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(461,'2018-08-05',4,5645,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(462,'2018-08-05',4,5645,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(463,'2018-08-01',5,5677,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(464,'2018-06-17',8,5767,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(465,'2018-10-14',8,5809,1,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(466,'2018-10-14',8,5809,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(467,'2018-10-14',8,5809,1,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(468,'2018-10-14',8,5809,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(469,'2018-08-01',5,5826,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(470,'2018-07-11',5,5836,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(471,'2018-08-29',8,5875,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(472,'2018-07-08',4,5893,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(473,'2018-09-30',8,5906,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(474,'2018-09-30',8,5906,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(475,'2018-07-11',5,5910,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(476,'2018-06-10',8,5939,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(477,'2018-06-10',8,5991,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(478,'2018-06-10',8,5991,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(479,'2018-07-25',5,6015,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(480,'2018-08-05',4,6017,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',12,1,0),(481,'2018-10-07',8,3409,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(482,'2018-10-07',8,3409,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(483,'2018-10-07',8,3569,1,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(484,'2018-08-26',8,3628,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(485,'2018-08-26',8,3628,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(486,'2018-09-23',8,3669,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(487,'2018-09-23',8,3669,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(488,'2018-10-07',8,3780,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(489,'2018-10-07',8,3780,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(490,'2018-10-07',8,3849,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(491,'2018-08-29',8,3925,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(492,'2018-08-29',8,3925,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(493,'2018-10-07',8,3940,1,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(494,'2018-09-30',8,3966,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(495,'2018-09-30',8,3966,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(496,'2018-09-30',8,3966,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(497,'2018-09-30',8,3966,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(498,'2018-08-01',5,4127,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(499,'2018-08-01',5,4127,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(500,'2018-08-12',8,4180,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(501,'2018-08-12',8,4180,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(502,'2018-09-26',8,4195,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(503,'2018-09-26',8,4195,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(504,'2018-10-07',8,4220,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(505,'2018-09-23',8,4239,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(506,'2018-09-23',8,4239,1,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(507,'2018-09-23',8,4264,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(508,'2018-09-23',8,4264,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(509,'2018-08-01',5,4276,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(510,'2018-08-01',5,4276,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(511,'2018-08-26',8,4297,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(512,'2018-08-26',8,4297,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(513,'2018-08-12',8,4329,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(514,'2018-08-12',8,4329,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(515,'2018-09-02',8,4374,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(516,'2018-09-02',8,4374,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(517,'2018-09-30',8,4536,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(518,'2018-09-30',8,4536,1,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(519,'2018-09-30',8,4536,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(520,'2018-09-30',8,4536,1,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',13,1,0),(521,'2018-10-07',8,4669,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(522,'2018-10-07',8,4669,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(523,'2018-08-05',4,4985,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(524,'2018-08-05',4,4985,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(525,'2018-08-05',4,4985,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(526,'2018-10-07',8,5040,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(527,'2018-10-07',8,5040,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(528,'2018-06-10',8,5169,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(529,'2018-06-10',8,5169,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(530,'2018-06-10',8,5169,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(531,'2018-08-05',4,5357,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(532,'2018-08-05',4,5357,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(533,'2018-08-05',4,5357,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(534,'2018-08-26',8,5508,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(535,'2018-08-26',8,5508,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(536,'2018-08-26',8,5508,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(537,'2018-09-30',8,5526,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(538,'2018-09-30',8,5526,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(539,'2018-09-30',8,5526,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(540,'2018-09-30',8,5526,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(541,'2018-09-30',8,5526,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(542,'2018-09-30',8,5526,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(543,'2018-06-10',8,5541,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(544,'2018-06-10',8,5541,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(545,'2018-06-10',8,5541,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(546,'2018-08-01',5,5617,3,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(547,'2018-08-01',5,5617,4,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(548,'2018-08-01',5,5617,2,'Flight','2018-06-01 12:01:16','2018-06-01 12:01:16',14,1,0),(549,'2018-10-14',8,5679,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',14,1,0),(550,'2018-10-14',8,5679,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',14,1,0),(551,'2018-10-14',8,5679,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',14,1,0),(552,'2018-10-07',8,5679,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',14,1,0),(553,'2018-10-07',8,5679,1,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',14,1,0),(554,'2018-10-14',8,5679,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',14,1,0),(555,'2018-10-14',8,5679,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',14,1,0),(556,'2018-10-14',8,5679,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',14,1,0),(557,'2018-08-01',5,5766,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',14,1,0),(558,'2018-08-01',5,5766,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',14,1,0),(559,'2018-08-01',5,5766,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',14,1,0),(560,'2018-08-29',8,5805,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',14,1,0),(561,'2018-08-29',5,4305,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(562,'2018-08-29',5,4305,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(563,'2018-08-15',5,4695,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(564,'2018-08-15',5,4695,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(565,'2018-09-12',5,4975,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(566,'2018-09-12',5,4975,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(567,'2018-10-07',8,4989,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(568,'2018-10-07',8,4989,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(569,'2018-09-26',5,5155,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(570,'2018-09-26',5,5155,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(571,'2018-09-19',5,5177,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(572,'2018-09-19',5,5177,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(573,'2018-10-03',5,5229,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(574,'2018-10-03',5,5229,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(575,'2018-09-05',5,5247,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(576,'2018-09-05',5,5247,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(577,'2018-10-07',8,5360,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(578,'2018-10-07',8,5360,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(579,'2018-09-30',8,5566,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(580,'2018-09-30',8,5566,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(581,'2018-09-30',8,5566,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(582,'2018-09-30',8,5566,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(583,'2018-08-29',5,5575,1,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(584,'2018-08-29',8,5985,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(585,'2018-08-29',8,5985,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(586,'2018-10-03',5,5999,1,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(587,'2018-08-01',5,6087,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(588,'2018-08-01',5,6087,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(589,'2018-10-14',8,6129,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(590,'2018-10-14',8,6129,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(591,'2018-10-14',8,6129,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(592,'2018-10-14',8,6129,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(593,'2018-08-26',8,6168,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(594,'2018-08-26',8,6168,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(595,'2018-09-12',5,6185,1,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(596,'2018-08-01',5,6236,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(597,'2018-08-01',5,6236,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(598,'2018-10-07',8,6269,1,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(599,'2018-08-15',5,6335,1,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(600,'2018-09-26',8,6425,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',15,1,0),(601,'2018-06-10',8,4719,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(602,'2018-08-05',4,4775,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(603,'2018-08-05',4,4815,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(604,'2018-06-10',8,4819,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(605,'2018-08-05',4,4905,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(606,'2018-09-26',8,4975,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(607,'2018-06-10',8,4979,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(608,'2018-09-30',8,5026,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(609,'2018-09-30',8,5026,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(610,'2018-09-26',8,5075,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(611,'2018-06-10',8,5091,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(612,'2018-09-19',8,5097,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(613,'2018-09-30',8,5136,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(614,'2018-09-30',8,5136,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(615,'2018-08-05',4,5147,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(616,'2018-09-16',8,5165,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(617,'2018-08-05',4,5187,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(618,'2018-06-10',8,5191,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(619,'2018-09-19',8,5197,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(620,'2018-09-26',8,5235,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(621,'2018-09-16',8,5265,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(622,'2018-09-23',8,5269,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(623,'2018-08-05',4,5277,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(624,'2018-09-30',8,5286,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(625,'2018-09-30',8,5286,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(626,'2018-08-01',5,5317,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(627,'2018-06-10',8,5351,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(628,'2018-09-19',8,5357,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(629,'2018-09-23',8,5369,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(630,'2018-08-01',5,5377,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(631,'2018-08-26',8,5378,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(632,'2018-09-16',8,5425,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(633,'2018-08-29',8,5455,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(634,'2018-07-29',4,5460,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(635,'2018-08-01',5,5466,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(636,'2018-08-26',8,5478,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(637,'2018-08-01',5,5497,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(638,'2018-07-29',4,5500,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(639,'2018-08-01',5,5526,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(640,'2018-09-23',8,5529,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',16,1,0),(641,'2018-08-26',4,3528,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(642,'2018-08-26',4,3528,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(643,'2018-08-26',4,3568,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(644,'2018-08-29',5,3655,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(645,'2018-08-29',5,3655,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(646,'2018-08-29',5,3715,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(647,'2018-08-15',5,3925,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(648,'2018-08-15',5,3925,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(649,'2018-08-15',5,3985,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(650,'2018-08-19',4,4035,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(651,'2018-08-19',4,4035,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(652,'2018-08-19',4,4075,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(653,'2018-09-02',4,4104,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(654,'2018-09-02',4,4104,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(655,'2018-08-12',4,4140,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(656,'2018-08-12',4,4140,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(657,'2018-09-02',4,4154,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(658,'2018-08-12',4,4180,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(659,'2018-08-26',4,4197,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(660,'2018-08-26',4,4197,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(661,'2018-08-26',4,4218,1,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(662,'2018-08-26',4,4237,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(663,'2018-08-22',5,4275,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(664,'2018-08-22',5,4275,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(665,'2018-08-12',4,4289,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(666,'2018-08-12',4,4289,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(667,'2018-08-12',4,4329,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(668,'2018-08-22',5,4335,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(669,'2018-09-02',4,4476,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(670,'2018-09-02',4,4476,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(671,'2018-09-02',4,4526,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(672,'2018-08-19',4,4556,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(673,'2018-08-19',4,4556,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(674,'2018-08-29',5,4575,1,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(675,'2018-09-05',5,4587,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(676,'2018-09-05',5,4587,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(677,'2018-08-19',4,4596,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(678,'2018-09-05',5,4647,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(679,'2018-08-05',4,4775,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(680,'2018-08-05',4,4775,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',17,1,0),(681,'2018-10-07',8,4169,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(682,'2018-10-07',8,4169,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(683,'2018-10-07',8,4169,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(684,'2018-10-07',8,4329,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(685,'2018-10-07',8,4329,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(686,'2018-10-07',8,4540,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(687,'2018-10-07',8,4540,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(688,'2018-10-07',8,4540,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(689,'2018-10-07',8,4700,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(690,'2018-10-07',8,4700,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(691,'2018-09-26',8,4895,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(692,'2018-09-26',8,4895,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(693,'2018-09-26',8,4895,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(694,'2018-09-23',8,4899,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(695,'2018-09-23',8,4899,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(696,'2018-09-23',8,4899,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(697,'2018-09-30',8,4946,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(698,'2018-09-30',8,4946,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(699,'2018-09-30',8,4946,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(700,'2018-09-30',8,4946,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(701,'2018-09-30',8,4946,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(702,'2018-09-30',8,4946,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(703,'2018-10-14',8,5039,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(704,'2018-10-14',8,5039,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(705,'2018-10-14',8,5039,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(706,'2018-10-14',8,5039,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(707,'2018-10-14',8,5039,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(708,'2018-10-14',8,5039,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(709,'2018-09-23',8,5049,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(710,'2018-09-23',8,5049,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(711,'2018-09-26',8,5055,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(712,'2018-09-26',8,5055,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(713,'2018-09-30',8,5106,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(714,'2018-09-30',8,5106,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(715,'2018-09-30',8,5106,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(716,'2018-09-30',8,5106,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(717,'2018-10-14',8,5199,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(718,'2018-10-14',8,5199,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(719,'2018-10-14',8,5199,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(720,'2018-10-14',8,5199,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',18,1,0),(721,'2018-09-16',8,3685,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(722,'2018-09-16',8,3685,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(723,'2018-09-09',8,3789,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(724,'2018-09-09',8,3789,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(725,'2018-09-09',8,3789,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(726,'2018-09-09',8,3789,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(727,'2018-09-09',8,3789,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(728,'2018-09-09',8,3789,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(729,'2018-09-16',8,3795,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(730,'2018-09-16',8,3795,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(731,'2018-09-23',8,4029,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(732,'2018-09-23',8,4029,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(733,'2018-09-30',8,4056,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(734,'2018-09-30',8,4056,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(735,'2018-09-30',8,4056,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(736,'2018-09-30',8,4056,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(737,'2018-09-16',8,4057,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(738,'2018-09-16',8,4057,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(739,'2018-09-23',8,4139,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(740,'2018-09-23',8,4139,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(741,'2018-09-30',8,4141,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(742,'2018-09-30',8,4141,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(743,'2018-09-30',8,4141,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(744,'2018-09-30',8,4141,1,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(745,'2018-09-30',8,4141,1,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(746,'2018-09-30',8,4141,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(747,'2018-09-16',8,4167,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(748,'2018-09-16',8,4167,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(749,'2018-09-16',8,4355,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(750,'2018-09-09',8,4359,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(751,'2018-09-09',8,4359,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(752,'2018-06-17',8,4397,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(753,'2018-06-17',8,4397,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(754,'2018-06-17',8,4397,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(755,'2018-09-26',8,4555,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(756,'2018-09-26',8,4555,3,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(757,'2018-09-16',8,4595,1,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(758,'2018-09-30',8,4596,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(759,'2018-09-30',8,4596,4,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0),(760,'2018-09-23',8,4624,2,'Flight','2018-06-01 12:01:17','2018-06-01 12:01:17',19,1,0);
/*!40000 ALTER TABLE `variations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-20 15:07:41
