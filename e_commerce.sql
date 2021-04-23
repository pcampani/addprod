CREATE DATABASE  IF NOT EXISTS `e_commerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `e_commerce`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: e_commerce
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_billing_cart_idx` (`cart_id`),
  CONSTRAINT `fk_billing_cart` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (1,2,49591.19,'John Doe','123 Some City, Some Province','0215','2021-04-13 16:11:31','2021-04-13 16:11:31'),(2,2,49591.19,'Jane Doe','321 Some City, Some Province','4242','2021-04-13 16:16:01','2021-04-13 16:16:01'),(3,2,66791.64,'qwe','qwe','1235','2021-04-13 16:17:21','2021-04-13 16:17:21'),(4,2,75591.62,'Jovic Abengona','215 Some Brgy, Some City, Some Province','1318','2021-04-13 17:15:03','2021-04-13 17:15:03'),(5,2,34400.90,'Try','Try','1234','2021-04-13 17:23:27','2021-04-13 17:23:27'),(6,2,34400.90,'Sample','Sample','1234','2021-04-14 17:07:51','2021-04-14 17:07:51'),(7,2,34400.90,'Sample2','Sample2','1234','2021-04-14 17:08:47','2021-04-14 17:08:47'),(8,2,77581.94,'Sample3','Sample3','0215','2021-04-14 17:10:19','2021-04-14 17:10:19'),(9,2,45191.20,'[removed]alert&#40;\"hi\"&#41;[removed]','asd','1234','2021-04-14 17:14:05','2021-04-14 17:14:05'),(10,2,45191.20,'[removed]alert&#40;\"Hello world\"&#41;[removed]','qwe','1234','2021-04-14 17:22:29','2021-04-14 17:22:29'),(11,2,45191.20,'\'; UPDATE cart_details SET status = \"added\" WHERE id = 14','qwe','1234','2021-04-14 17:26:24','2021-04-14 17:26:24'),(12,2,21600.44,'\"; UPDATE cart_details SET status = \"added\" WHERE id = 14','try','4321','2021-04-14 17:27:10','2021-04-14 17:27:10');
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_details`
--

DROP TABLE IF EXISTS `cart_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_details_carts1_idx` (`cart_id`),
  KEY `fk_cart_details_products1_idx` (`product_id`),
  CONSTRAINT `fk_cart_details_carts1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  CONSTRAINT `fk_cart_details_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_details`
--

LOCK TABLES `cart_details` WRITE;
/*!40000 ALTER TABLE `cart_details` DISABLE KEYS */;
INSERT INTO `cart_details` VALUES (14,2,1,2,'bought','2021-04-13 12:38:57','2021-04-14 17:27:10'),(15,2,2,2,'bought','2021-04-13 12:39:27','2021-04-14 17:27:10'),(17,2,3,2,'bought','2021-04-13 14:26:56','2021-04-14 17:27:10'),(18,2,1,2,'bought','2021-04-13 16:14:54','2021-04-14 17:27:10'),(19,2,2,2,'bought','2021-04-13 16:14:55','2021-04-14 17:27:10'),(20,2,3,2,'bought','2021-04-13 16:14:57','2021-04-14 17:27:10'),(21,2,1,2,'bought','2021-04-13 16:16:57','2021-04-14 17:27:10'),(22,2,2,2,'bought','2021-04-13 16:16:58','2021-04-14 17:27:10'),(23,2,3,2,'bought','2021-04-13 16:16:58','2021-04-14 17:27:10'),(24,2,1,2,'bought','2021-04-13 16:19:57','2021-04-14 17:27:10'),(25,2,2,2,'bought','2021-04-13 16:19:59','2021-04-14 17:27:10'),(26,2,3,2,'bought','2021-04-13 16:20:02','2021-04-14 17:27:10'),(27,2,1,2,'bought','2021-04-13 17:23:08','2021-04-14 17:27:10'),(38,2,1,2,'bought','2021-04-14 17:04:28','2021-04-14 17:27:10'),(40,2,1,2,'bought','2021-04-14 17:08:17','2021-04-14 17:27:10'),(41,2,2,1,'bought','2021-04-14 17:09:34','2021-04-14 17:27:10'),(42,2,1,1,'bought','2021-04-14 17:09:34','2021-04-14 17:27:10'),(43,2,3,2,'bought','2021-04-14 17:09:35','2021-04-14 17:27:10'),(44,2,1,1,'bought','2021-04-14 17:13:38','2021-04-14 17:27:10'),(45,2,3,1,'bought','2021-04-14 17:13:39','2021-04-14 17:27:10'),(46,2,1,1,'bought','2021-04-14 17:21:55','2021-04-14 17:27:10'),(47,2,3,1,'bought','2021-04-14 17:21:56','2021-04-14 17:27:10'),(48,2,1,1,'bought','2021-04-14 17:25:05','2021-04-14 17:27:10'),(49,2,3,1,'bought','2021-04-14 17:25:08','2021-04-14 17:27:10'),(50,2,1,1,'bought','2021-04-14 17:26:46','2021-04-14 17:27:10'),(51,2,2,1,'bought','2021-04-14 17:26:47','2021-04-14 17:27:10');
/*!40000 ALTER TABLE `cart_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (2,'2021-04-12 13:06:34','2021-04-12 13:06:34');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Ryzen 7 3700x','A beautifully balanced design for serious PC enthusiasts','17200','2021-04-09 16:23:22','2021-04-19 12:29:04'),(2,'The Last of Us Part II: Special Edition','Confront the devastating physical and emotional repercussions of Ellie\'s actions.','4399.99','2021-04-09 16:23:36','2021-04-09 16:23:36'),(3,'PlayStation 5 (Disc)','Experience lightning-fast loading with an ultra-high-speed SSD, deeper immersion with support for haptic feedback, adaptive triggers and 3D Audio, and an all-new generation of incredible PlayStation games.','27990.75','2021-04-09 16:23:53','2021-04-09 16:23:53'),(10,'Sample Data','Sample Description','999','2021-04-19 13:01:08','2021-04-19 13:01:17');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-19 13:04:29
