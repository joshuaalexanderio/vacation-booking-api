-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: full-stack-ecommerce
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
                              `cart_item_id` bigint NOT NULL AUTO_INCREMENT,
                              `create_date` datetime(6) DEFAULT NULL,
                              `last_update` datetime(6) DEFAULT NULL,
                              `cart_id` bigint NOT NULL,
                              `vacation_id` bigint NOT NULL,
                              PRIMARY KEY (`cart_item_id`),
                              KEY `cart_id` (`cart_id`),
                              KEY `vacation_id` (`vacation_id`),
                              CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`vacation_id`) REFERENCES `vacations` (`vacation_id`),
                              CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (10,'2025-06-30 20:30:38.135997','2025-06-30 20:30:38.151133',9,2),(11,'2025-06-30 20:31:19.458758','2025-06-30 20:31:19.467022',10,6),(12,'2025-06-30 20:34:57.887322','2025-06-30 20:34:57.899819',11,4),(13,'2025-06-30 20:34:57.888508','2025-06-30 20:34:57.900245',11,4),(14,'2025-06-30 20:37:53.637345','2025-06-30 20:37:53.650535',12,4);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
                         `cart_id` bigint NOT NULL AUTO_INCREMENT,
                         `package_price` decimal(19,2) DEFAULT NULL,
                         `party_size` int DEFAULT NULL,
                         `status` enum('pending','ordered','canceled') DEFAULT NULL,
                         `order_tracking_number` varchar(255) DEFAULT NULL,
                         `create_date` datetime(6) DEFAULT NULL,
                         `last_update` datetime(6) DEFAULT NULL,
                         `customer_id` bigint NOT NULL,
                         PRIMARY KEY (`cart_id`),
                         KEY `customer_id` (`customer_id`),
                         CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (2,0.00,1,'pending',NULL,NULL,NULL,1),(6,1500.00,1,'pending','31490a43-b0d9-457b-bb86-ffa17bd8dbda','2025-06-30 20:24:10.256114','2025-06-30 20:24:10.269822',13),(9,1100.00,1,'pending','482bd218-9b79-49d8-a914-2f30e3267418','2025-06-30 20:30:38.119323','2025-06-30 20:30:38.150443',13),(10,1625.00,1,'pending','fe8994dd-a3e5-46a6-b8c2-31b57c059e70','2025-06-30 20:31:19.456728','2025-06-30 20:31:19.466198',13),(11,3125.00,1,'pending','ddb1223b-65fc-459e-82d5-0d74418dc487','2025-06-30 20:34:57.875751','2025-06-30 20:34:57.899256',13),(12,1625.00,1,'pending','d089677b-6e16-4fbc-927f-6612ac113ff4','2025-06-30 20:37:53.623486','2025-06-30 20:37:53.649879',13);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
                             `country_id` bigint NOT NULL AUTO_INCREMENT,
                             `country` varchar(255) DEFAULT NULL,
                             `create_date` datetime(6) DEFAULT NULL,
                             `last_update` datetime(6) DEFAULT NULL,
                             PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'U.S','2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000'),(2,'UK','2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000'),(3,'Canada','2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
                             `customer_id` bigint NOT NULL AUTO_INCREMENT,
                             `address` varchar(255) DEFAULT NULL,
                             `create_date` datetime(6) DEFAULT NULL,
                             `customer_first_name` varchar(255) DEFAULT NULL,
                             `customer_last_name` varchar(255) DEFAULT NULL,
                             `last_update` datetime(6) DEFAULT NULL,
                             `phone` varchar(255) DEFAULT NULL,
                             `postal_code` varchar(255) DEFAULT NULL,
                             `division_id` bigint DEFAULT NULL,
                             PRIMARY KEY (`customer_id`),
                             KEY `division_id` (`division_id`),
                             CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`division_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'123 Easy St',NULL,'John','Doe',NULL,'(555)555-5555','55555',31),(8,'17 Maple Crescent',NULL,'Alice','Nguyen','2025-06-26 20:42:53.909752','555-111-2222','30303',4),(9,'88 Riverbend Drive',NULL,'Carlos','Martinez','2025-06-26 21:01:52.659327','555-333-4444','60606',31),(10,'2500 Elmwood Ave','2025-06-26 20:41:45.012196','Priya','Singh','2025-06-26 20:41:45.012205','555-555-6666','77077',42),(11,'42 Ocean View Rd','2025-06-26 20:41:45.014498','Liam','O\'Connor','2025-06-26 20:41:45.014504','555-777-8888','33133',9),(12,'900 Summit Lane','2025-06-26 20:41:45.015842','Fatima','Al-Farsi','2025-06-26 20:41:45.015849','555-999-0000','80909',5),(13,'',NULL,'','','2025-06-30 20:37:53.647368','','',2);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisions` (
  `division` varchar(255) DEFAULT NULL,
  `division_id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `last_update` datetime(6) DEFAULT NULL,
  `country_id` bigint NOT NULL,
  PRIMARY KEY (`division_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `divisions_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES ('Arizona',2,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Arkansas',3,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('California',4,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Colorado',5,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Connecticut',6,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Delaware',7,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('District of Columbia',8,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Florida',9,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Georgia',10,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Idaho',11,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Illinois',12,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Indiana',13,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Iowa',14,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Kansas',15,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Kentucky',16,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Louisiana',17,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Maine',18,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Maryland',19,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Massachusetts',20,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Michigan',21,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Minnesota',22,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Mississippi',23,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Missouri',24,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Montana',25,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Nebraska',26,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Nevada',27,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('New Hampshire',28,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('New Jersey',29,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('New Mexico',30,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('New York',31,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('North Carolina',32,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('North Dakota',33,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Ohio',34,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Oklahoma',35,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Oregon',36,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Pennsylvania',37,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Rhode Island',38,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('South Carolina',39,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('South Dakota',40,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Tennessee',41,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Texas',42,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Utah',43,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Vermont',44,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Virginia',45,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Washington',46,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('West Virginia',47,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Wisconsin',48,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Wyoming',49,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Hawaii',52,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Alaska',54,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',1),('Northwest Territories',60,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',3),('Alberta',61,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',3),('British Columbia',62,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',3),('Manitoba',63,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',3),('New Brunswick',64,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',3),('Nova Scotia',65,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',3),('Prince Edward Island',66,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',3),('Ontario',67,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',3),('Québec',68,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',3),('Saskatchewan',69,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',3),('Nunavut',70,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',3),('Yukon',71,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',3),('Newfoundland and Labrador',72,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',3),('England',101,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',2),('Wales',102,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',2),('Scotland',103,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',2),('Northern Ireland',104,'2025-06-26 19:41:14.000000','2025-06-26 19:41:14.000000',2);
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excursion_cartitem`
--

DROP TABLE IF EXISTS `excursion_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `excursion_cartitem` (
  `cart_item_id` bigint NOT NULL,
  `excursion_id` bigint NOT NULL,
  PRIMARY KEY (`cart_item_id`,`excursion_id`),
  KEY `excursion_id` (`excursion_id`),
  CONSTRAINT `excursion_cartitem_ibfk_1` FOREIGN KEY (`cart_item_id`) REFERENCES `cart_items` (`cart_item_id`),
  CONSTRAINT `excursion_cartitem_ibfk_2` FOREIGN KEY (`excursion_id`) REFERENCES `excursions` (`excursion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excursion_cartitem`
--

LOCK TABLES `excursion_cartitem` WRITE;
/*!40000 ALTER TABLE `excursion_cartitem` DISABLE KEYS */;
INSERT INTO `excursion_cartitem` VALUES (10,2),(13,18),(14,18),(13,22),(14,22),(11,34),(11,38);
/*!40000 ALTER TABLE `excursion_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excursions`
--

DROP TABLE IF EXISTS `excursions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `excursions` (
  `excursion_id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `excursion_price` decimal(19,2) DEFAULT NULL,
  `excursion_title` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `last_update` datetime(6) DEFAULT NULL,
  `vacation_id` bigint NOT NULL,
  PRIMARY KEY (`excursion_id`),
  KEY `vacation_id` (`vacation_id`),
  CONSTRAINT `excursions_ibfk_1` FOREIGN KEY (`vacation_id`) REFERENCES `vacations` (`vacation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excursions`
--

LOCK TABLES `excursions` WRITE;
/*!40000 ALTER TABLE `excursions` DISABLE KEYS */;
INSERT INTO `excursions` VALUES (2,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,2),(3,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,2),(4,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,2),(5,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,2),(6,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,2),(7,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,2),(8,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,2),(9,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,2),(10,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,3),(11,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,3),(12,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,3),(13,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,3),(14,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,3),(15,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,3),(16,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,3),(17,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,3),(18,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,4),(19,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,4),(20,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,4),(21,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,4),(22,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,4),(23,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,4),(24,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,4),(25,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,4),(26,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,5),(27,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,5),(28,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,5),(29,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,5),(30,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,5),(31,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,5),(32,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,5),(33,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,5),(34,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,6),(35,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,6),(36,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,6),(37,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,6),(38,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,6),(39,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,6),(40,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,6),(41,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,6),(42,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,7),(43,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,7),(44,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,7),(45,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,7),(46,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,7),(47,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,7),(48,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,7),(49,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,7),(50,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,8),(51,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,8),(52,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,8),(53,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,8),(54,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,8),(55,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,8),(56,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,8),(57,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,8),(58,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,9),(59,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,9),(60,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,9),(61,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,9),(62,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,9),(63,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,9),(64,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,9),(65,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,9);
/*!40000 ALTER TABLE `excursions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacations`
--

DROP TABLE IF EXISTS `vacations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacations` (
  `vacation_id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `last_update` datetime(6) DEFAULT NULL,
  `travel_fare_price` decimal(19,2) DEFAULT NULL,
  `vacation_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vacation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacations`
--

LOCK TABLES `vacations` WRITE;
/*!40000 ALTER TABLE `vacations` DISABLE KEYS */;
INSERT INTO `vacations` VALUES (2,NULL,'Visit the beautiful country of Italy','https://images.unsplash.com/photo-1515859005217-8a1f08870f59?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1110&q=80',NULL,1000.00,'Italy'),(3,NULL,'Visit the beautiful country of Greece','https://images.unsplash.com/photo-1533105079780-92b9be482077?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,1500.00,'Greece'),(4,NULL,'Visit the beautiful country of France','https://images.unsplash.com/photo-1502602898657-3e91760cbb34?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,1500.00,'France'),(5,NULL,'Visit the beautiful country of Belgium','https://images.unsplash.com/photo-1491557345352-5929e343eb89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,1500.00,'Belgium'),(6,NULL,'Visit the beautiful country of Brazil','https://images.unsplash.com/photo-1483729558449-99ef09a8c325?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,1500.00,'Brazil'),(7,NULL,'Visit the beautiful state of South Dakota','https://images.unsplash.com/photo-1605801495512-f47a64d01f4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1472&q=80',NULL,1500.00,'South Dakota'),(8,NULL,'Visit the beautiful city of Nashville','https://images.unsplash.com/photo-1545419913-775e3e82c7db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1636&q=80',NULL,1500.00,'Nashville'),(9,NULL,'Visit the beautiful state of Wisconsin','https://images.unsplash.com/photo-1566419808810-658178380987?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80',NULL,1500.00,'Wisconsin');
/*!40000 ALTER TABLE `vacations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'full-stack-ecommerce'
--

--
-- Dumping routines for database 'full-stack-ecommerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-05 19:15:46