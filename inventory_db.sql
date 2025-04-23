-- MySQL dump 10.13  Distrib 9.3.0, for macos15.2 (arm64)
--
-- Host: localhost    Database: inventory_db
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add customer',8,'add_customer'),(30,'Can change customer',8,'change_customer'),(31,'Can delete customer',8,'delete_customer'),(32,'Can view customer',8,'view_customer'),(33,'Can add inventory',9,'add_inventory'),(34,'Can change inventory',9,'change_inventory'),(35,'Can delete inventory',9,'delete_inventory'),(36,'Can view inventory',9,'view_inventory'),(37,'Can add product',10,'add_product'),(38,'Can change product',10,'change_product'),(39,'Can delete product',10,'delete_product'),(40,'Can view product',10,'view_product'),(41,'Can add supplier',11,'add_supplier'),(42,'Can change supplier',11,'change_supplier'),(43,'Can delete supplier',11,'delete_supplier'),(44,'Can view supplier',11,'view_supplier'),(45,'Can add business owner',12,'add_businessowner'),(46,'Can change business owner',12,'change_businessowner'),(47,'Can delete business owner',12,'delete_businessowner'),(48,'Can view business owner',12,'view_businessowner'),(49,'Can add order',13,'add_order'),(50,'Can change order',13,'change_order'),(51,'Can delete order',13,'delete_order'),(52,'Can view order',13,'view_order'),(53,'Can add contains',14,'add_contains'),(54,'Can change contains',14,'change_contains'),(55,'Can delete contains',14,'delete_contains'),(56,'Can view contains',14,'view_contains'),(57,'Can add delivers',15,'add_delivers'),(58,'Can change delivers',15,'change_delivers'),(59,'Can delete delivers',15,'delete_delivers'),(60,'Can view delivers',15,'view_delivers'),(61,'Can add composed of',16,'add_composedof'),(62,'Can change composed of',16,'change_composedof'),(63,'Can delete composed of',16,'delete_composedof'),(64,'Can view composed of',16,'view_composedof'),(65,'Can add shipment',17,'add_shipment'),(66,'Can change shipment',17,'change_shipment'),(67,'Can delete shipment',17,'delete_shipment'),(68,'Can view shipment',17,'view_shipment'),(69,'Can add stored in',18,'add_storedin'),(70,'Can change stored in',18,'change_storedin'),(71,'Can delete stored in',18,'delete_storedin'),(72,'Can view stored in',18,'view_storedin'),(73,'Can add supply',19,'add_supply'),(74,'Can change supply',19,'change_supply'),(75,'Can delete supply',19,'delete_supply'),(76,'Can view supply',19,'view_supply');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$tbD6SBF8fWqJsHKs9EacA3$F7lHEMl1psaoz56ky+eFdtxMTutFCiMnfdLbWDDOzQg=','2025-04-23 02:33:31.098486',1,'owner2','','','',1,1,'2025-04-22 04:26:54.197696'),(2,'pbkdf2_sha256$1000000$8Sob50QgfVuCxL91GutSQ5$COv5CL02VbuIp3AVTiIycqJ3kIuqjDNioscqsdjftDI=','2025-04-23 02:30:34.012498',0,'customer1','','','',0,1,'2025-04-22 04:28:04.750921'),(3,'pbkdf2_sha256$1000000$0oEV1rxuVMmW7jYzx9lPmK$X5eF8sinoyA2J/eJOfUo6HfbiQCtvOlWdzk3pRHLXQc=','2025-04-23 02:31:29.890117',0,'customer2','','','',0,1,'2025-04-22 04:38:42.120716'),(4,'pbkdf2_sha256$1000000$ouHQXKnQO0MIiSN1uz5dhV$QtDnIsbt8toS7eBJCeRPWd+oaNuIUoU5+6MMa1liTUk=','2025-04-23 02:32:11.496778',0,'customer3','','','',0,1,'2025-04-22 04:38:46.941635'),(5,'pbkdf2_sha256$1000000$PxT97DgWOLPHv9UG096t62$FgJGsYa7H0PpqWZfGTS8iiDvcSw3Ne3y9bizzupW6hY=','2025-04-23 02:32:43.198465',0,'customer4','','','',0,1,'2025-04-22 04:38:51.398748'),(6,'pbkdf2_sha256$1000000$0iC3ym4HhqAoYAexGvwi8b$+nSsJmLx1NkqxKVVCCYL2bNbT2ZwHCHnQYmFReV0Qps=','2025-04-22 05:53:08.507973',0,'karan','','','',0,1,'2025-04-22 05:51:54.518304'),(7,'pbkdf2_sha256$1000000$l1UNiaVkCZKEgIbt1TQI5L$p4nihx+5XVCKPV05S/qFYJMvLYOGvUe1v0z1lCoAxOE=','2025-04-22 08:49:43.634704',0,'sana','','','',0,1,'2025-04-22 08:48:25.748226');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'inventory','businessowner'),(16,'inventory','composedof'),(14,'inventory','contains'),(8,'inventory','customer'),(15,'inventory','delivers'),(9,'inventory','inventory'),(13,'inventory','order'),(10,'inventory','product'),(17,'inventory','shipment'),(18,'inventory','storedin'),(11,'inventory','supplier'),(19,'inventory','supply'),(7,'inventory','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-22 04:26:18.686303'),(2,'auth','0001_initial','2025-04-22 04:26:18.793879'),(3,'admin','0001_initial','2025-04-22 04:26:18.820185'),(4,'admin','0002_logentry_remove_auto_add','2025-04-22 04:26:18.823259'),(5,'admin','0003_logentry_add_action_flag_choices','2025-04-22 04:26:18.825924'),(6,'contenttypes','0002_remove_content_type_name','2025-04-22 04:26:18.889208'),(7,'auth','0002_alter_permission_name_max_length','2025-04-22 04:26:18.907388'),(8,'auth','0003_alter_user_email_max_length','2025-04-22 04:26:18.916229'),(9,'auth','0004_alter_user_username_opts','2025-04-22 04:26:18.918495'),(10,'auth','0005_alter_user_last_login_null','2025-04-22 04:26:18.928792'),(11,'auth','0006_require_contenttypes_0002','2025-04-22 04:26:18.929395'),(12,'auth','0007_alter_validators_add_error_messages','2025-04-22 04:26:18.931801'),(13,'auth','0008_alter_user_username_max_length','2025-04-22 04:26:18.947304'),(14,'auth','0009_alter_user_last_name_max_length','2025-04-22 04:26:18.962279'),(15,'auth','0010_alter_group_name_max_length','2025-04-22 04:26:18.967766'),(16,'auth','0011_update_proxy_permissions','2025-04-22 04:26:18.970059'),(17,'auth','0012_alter_user_first_name_max_length','2025-04-22 04:26:18.983792'),(18,'inventory','0001_initial','2025-04-22 04:26:19.144941'),(19,'sessions','0001_initial','2025-04-22 04:26:19.151717'),(20,'inventory','0002_order_status','2025-04-22 05:47:18.267006');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('sepqlq9pnnzm6tbq4bi680v7n1m1ux75','.eJxVjLsOAiEQAP-F2hDheIilvd9AdtlFTg0kx11l_HcluULbmcm8RIRtLXHrvMSZxFkocfhlCOnBdQi6Q701mVpdlxnlSORuu7w24udlb_8GBXoZWyDKECgclWafyZhMaJ232eM0YQjZUUiQlEoWNal0Yu0Ma-ZvZgjE-wMTkzlV:1u7PvX:z1eAnyl_zFuqU6_gMykwedMr7cmlmBmgVou-G9Hw7G8','2025-05-07 02:33:31.100299');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_businessowner`
--

DROP TABLE IF EXISTS `inventory_businessowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_businessowner` (
  `owner_id` int NOT NULL,
  PRIMARY KEY (`owner_id`),
  CONSTRAINT `inventory_businessow_owner_id_a617c80b_fk_inventory` FOREIGN KEY (`owner_id`) REFERENCES `inventory_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_businessowner`
--

LOCK TABLES `inventory_businessowner` WRITE;
/*!40000 ALTER TABLE `inventory_businessowner` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_businessowner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_composedof`
--

DROP TABLE IF EXISTS `inventory_composedof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_composedof` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `supply_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_composedof_supply_id_d5c52e9d_fk_inventory` (`supply_id`),
  KEY `inventory_composedof_product_id_d125293a_fk_inventory` (`product_id`),
  CONSTRAINT `inventory_composedof_product_id_d125293a_fk_inventory` FOREIGN KEY (`product_id`) REFERENCES `inventory_product` (`product_id`),
  CONSTRAINT `inventory_composedof_supply_id_d5c52e9d_fk_inventory` FOREIGN KEY (`supply_id`) REFERENCES `inventory_supply` (`supply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_composedof`
--

LOCK TABLES `inventory_composedof` WRITE;
/*!40000 ALTER TABLE `inventory_composedof` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_composedof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_contains`
--

DROP TABLE IF EXISTS `inventory_contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_contains` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_contains_order_id_3562c408_fk_inventory_order_order_id` (`order_id`),
  KEY `inventory_contains_product_id_65903f47_fk_inventory` (`product_id`),
  CONSTRAINT `inventory_contains_order_id_3562c408_fk_inventory_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `inventory_order` (`order_id`),
  CONSTRAINT `inventory_contains_product_id_65903f47_fk_inventory` FOREIGN KEY (`product_id`) REFERENCES `inventory_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_contains`
--

LOCK TABLES `inventory_contains` WRITE;
/*!40000 ALTER TABLE `inventory_contains` DISABLE KEYS */;
INSERT INTO `inventory_contains` VALUES (1,1,1,1),(2,1,1,1),(3,1,2,2),(4,1,2,2),(5,10,3,1),(6,12,3,2),(7,4,4,1),(8,6,4,2),(9,3,5,1),(10,3,5,2),(11,3,5,1),(12,3,5,2),(13,1,6,1),(14,1,6,2),(15,5,7,1),(16,9,7,2),(17,6,8,2),(18,4,8,1),(19,5,9,1),(20,5,9,2),(21,100,10,1),(22,3,10,2),(23,1,11,1),(24,1,11,2),(25,1,12,1),(26,1,12,2),(27,80,13,1),(28,2,13,2),(29,300,14,1),(30,1,14,2),(31,100,15,1),(32,1,15,2),(33,100,16,1),(34,1,16,2),(35,100,17,1),(36,1,17,2),(37,100,18,1),(38,100,18,2),(39,100,19,1),(40,122,19,2),(41,100,20,1),(42,111,20,2),(43,11,21,1),(44,13,21,2),(45,100,22,1),(46,1,22,2),(47,50,23,1),(48,1,23,2),(49,100,24,1),(50,1,24,2),(51,199,24,3),(52,2,25,1),(53,1,25,2),(54,1,25,3),(55,12,26,3),(56,11,26,2),(57,11,26,1),(58,7,27,1),(59,10,27,2),(60,1,27,3),(61,155,28,2),(62,37,28,3),(63,16,29,2),(64,14,29,3),(65,11,30,1),(66,12,30,3);
/*!40000 ALTER TABLE `inventory_contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_customer`
--

DROP TABLE IF EXISTS `inventory_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_customer`
--

LOCK TABLES `inventory_customer` WRITE;
/*!40000 ALTER TABLE `inventory_customer` DISABLE KEYS */;
INSERT INTO `inventory_customer` VALUES (1,'customer1','0423232332'),(2,'customer4','32432123534'),(3,'customer3','5466443453'),(4,'customer2','535333224'),(5,'customer2','633434432'),(6,'customer1','786656545'),(7,'customer3','1234455632'),(8,'customer2','65654545'),(9,'customer1','1234455632'),(10,'karan metha','5873887561'),(11,'customer2','232323443'),(12,'john','5658685658'),(13,'Sana','5873356789'),(14,'customer1','34234242352'),(15,'customer3','12322133332'),(16,'customer2','32432123534'),(17,'customer1','123553231'),(18,'customer1','878767554'),(19,'customer1','656453534'),(20,'customer1','65654545'),(21,'customer1','32432123534'),(22,'customer1','1234455632'),(23,'customer2','0493943324'),(24,'customer1','65654545'),(25,'customer1','32432123534'),(26,'customer1','1234455632'),(27,'customer1','5634574435'),(28,'customer2','7363646355'),(29,'customer3','6463534353'),(30,'customer2','34553534255');
/*!40000 ALTER TABLE `inventory_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_delivers`
--

DROP TABLE IF EXISTS `inventory_delivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_delivers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_delivers_product_id_39bff2be_fk_inventory` (`product_id`),
  KEY `inventory_delivers_supplier_id_83110f32_fk_inventory` (`supplier_id`),
  CONSTRAINT `inventory_delivers_product_id_39bff2be_fk_inventory` FOREIGN KEY (`product_id`) REFERENCES `inventory_product` (`product_id`),
  CONSTRAINT `inventory_delivers_supplier_id_83110f32_fk_inventory` FOREIGN KEY (`supplier_id`) REFERENCES `inventory_supplier` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_delivers`
--

LOCK TABLES `inventory_delivers` WRITE;
/*!40000 ALTER TABLE `inventory_delivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_delivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_inventory`
--

DROP TABLE IF EXISTS `inventory_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`inventory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_inventory`
--

LOCK TABLES `inventory_inventory` WRITE;
/*!40000 ALTER TABLE `inventory_inventory` DISABLE KEYS */;
INSERT INTO `inventory_inventory` VALUES (1,'Vancouver',4000),(2,'Calgary',2000),(3,'Toronto',4500),(4,'Halifax',321);
/*!40000 ALTER TABLE `inventory_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_order`
--

DROP TABLE IF EXISTS `inventory_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `customer_id` int NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `inventory_order_customer_id_d5dd9c46_fk_inventory` (`customer_id`),
  CONSTRAINT `inventory_order_customer_id_d5dd9c46_fk_inventory` FOREIGN KEY (`customer_id`) REFERENCES `inventory_customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_order`
--

LOCK TABLES `inventory_order` WRITE;
/*!40000 ALTER TABLE `inventory_order` DISABLE KEYS */;
INSERT INTO `inventory_order` VALUES (1,'2025-04-22',2.00,1,'approved'),(2,'2025-04-22',4.00,2,'pending'),(3,'2025-04-22',34.00,3,'pending'),(4,'2025-04-22',16.00,4,'pending'),(5,'2025-04-22',18.00,5,'pending'),(6,'2025-04-22',3.00,6,'pending'),(7,'2025-04-22',23.00,7,'approved'),(8,'2025-04-22',16.00,8,'pending'),(9,'2025-04-22',15.00,9,'approved'),(10,'2025-04-22',106.00,10,'approved'),(11,'2025-04-22',3.00,11,'approved'),(12,'2025-04-22',3.00,12,'approved'),(13,'2025-04-22',84.00,13,'approved'),(14,'2025-04-22',302.00,14,'approved'),(15,'2025-04-22',102.00,15,'approved'),(16,'2025-04-22',102.00,16,'approved'),(17,'2025-04-22',102.00,17,'approved'),(18,'2025-04-22',300.00,18,'approved'),(19,'2025-04-22',344.00,19,'approved'),(20,'2025-04-22',322.00,20,'approved'),(21,'2025-04-22',37.00,21,'approved'),(22,'2025-04-22',102.00,22,'approved'),(23,'2025-04-22',52.00,23,'approved'),(24,'2025-04-22',400.50,24,'approved'),(25,'2025-04-22',5.50,25,'approved'),(26,'2025-04-23',51.00,26,'approved'),(27,'2025-04-23',28.50,27,'pending'),(28,'2025-04-23',365.50,28,'pending'),(29,'2025-04-23',53.00,29,'pending'),(30,'2025-04-23',29.00,30,'pending');
/*!40000 ALTER TABLE `inventory_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_product`
--

DROP TABLE IF EXISTS `inventory_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_product`
--

LOCK TABLES `inventory_product` WRITE;
/*!40000 ALTER TABLE `inventory_product` DISABLE KEYS */;
INSERT INTO `inventory_product` VALUES (1,'Balls','Tennis Balls',1.00,94,'Calgary'),(2,'Cards','Gift Cards',2.00,1563,'Calgary'),(3,'Sticker','Funny stickers',1.50,488,'Montreal');
/*!40000 ALTER TABLE `inventory_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_shipment`
--

DROP TABLE IF EXISTS `inventory_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_shipment` (
  `shipment_id` int NOT NULL AUTO_INCREMENT,
  `shipping_date` date NOT NULL,
  `tracking_number` varchar(255) NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`shipment_id`),
  UNIQUE KEY `order_id` (`order_id`),
  CONSTRAINT `inventory_shipment_order_id_e323c5f6_fk_inventory_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `inventory_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_shipment`
--

LOCK TABLES `inventory_shipment` WRITE;
/*!40000 ALTER TABLE `inventory_shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_storedin`
--

DROP TABLE IF EXISTS `inventory_storedin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_storedin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `inventory_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_storedin_inventory_id_product_id_9281f7cd_uniq` (`inventory_id`,`product_id`),
  KEY `inventory_storedin_product_id_5f69da22_fk_inventory` (`product_id`),
  CONSTRAINT `inventory_storedin_inventory_id_ca7aa1b7_fk_inventory` FOREIGN KEY (`inventory_id`) REFERENCES `inventory_inventory` (`inventory_id`),
  CONSTRAINT `inventory_storedin_product_id_5f69da22_fk_inventory` FOREIGN KEY (`product_id`) REFERENCES `inventory_product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_storedin`
--

LOCK TABLES `inventory_storedin` WRITE;
/*!40000 ALTER TABLE `inventory_storedin` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_storedin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_supplier`
--

DROP TABLE IF EXISTS `inventory_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_supplier` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `contact_info` longtext NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_supplier`
--

LOCK TABLES `inventory_supplier` WRITE;
/*!40000 ALTER TABLE `inventory_supplier` DISABLE KEYS */;
INSERT INTO `inventory_supplier` VALUES (1,'john doe','324234324'),(2,'Morgan Stanley','4245435545'),(3,'Theon Greyjoy','theon@gmail.com');
/*!40000 ALTER TABLE `inventory_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_supply`
--

DROP TABLE IF EXISTS `inventory_supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_supply` (
  `supply_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`supply_id`),
  KEY `inventory_supply_supplier_id_7f6fb547_fk_inventory` (`supplier_id`),
  CONSTRAINT `inventory_supply_supplier_id_7f6fb547_fk_inventory` FOREIGN KEY (`supplier_id`) REFERENCES `inventory_supplier` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_supply`
--

LOCK TABLES `inventory_supply` WRITE;
/*!40000 ALTER TABLE `inventory_supply` DISABLE KEYS */;
INSERT INTO `inventory_supply` VALUES (1,'paper',0.50,1),(2,'wood',2.00,1);
/*!40000 ALTER TABLE `inventory_supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_user`
--

DROP TABLE IF EXISTS `inventory_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_user`
--

LOCK TABLES `inventory_user` WRITE;
/*!40000 ALTER TABLE `inventory_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-22 20:38:29
