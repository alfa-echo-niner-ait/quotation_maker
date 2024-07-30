CREATE DATABASE  IF NOT EXISTS `ruigang_quote` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ruigang_quote`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: ruigang_quote
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `img_id` int NOT NULL AUTO_INCREMENT,
  `img_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `img_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `img_size_kb` float NOT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'Warehouse','347b49742a1b914b4277.jpg',631.35),(2,'Warehouse','761d6420b5c7184d64dd.jpg',52.46),(4,'Container Loading','25790cdf14aec1a52816.jpg',4307.68),(5,'Foundation Bolts','abc3070f91a53bd06040.jpg',270.77),(7,'Floor Deck','2f7bb9cd7ef4f926dbb8.png',785.21),(8,'H-type Purlin','0525d64ef8dfa6e0567e.png',742.24),(9,'Rivet','e418672097fae435da92.png',160.13),(10,'Steel Beam','2c2a8e2568665c9ad945.jpg',5745.93),(11,'Support','c81aa1f8340d95e7133f.png',28.02),(12,'Drainage Gutter','70b3f74354b147efdb47.png',394.97),(13,'Anchor Bolts','fb0da2a9a3ad739f4cee.png',389.42),(14,'PVC Pipes','f3a41c5e1d237ba05897.png',812.71),(15,'Color Steel Tiles','f4921a6cc37c7591fedf.jpg',59.02);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_items`
--

DROP TABLE IF EXISTS `quote_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `quote_id` int NOT NULL,
  `material` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `spec` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `note` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ref_img` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`item_id`,`quote_id`),
  KEY `quote_id_idx` (`quote_id`),
  CONSTRAINT `quote_id` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`q_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_items`
--

LOCK TABLES `quote_items` WRITE;
/*!40000 ALTER TABLE `quote_items` DISABLE KEYS */;
INSERT INTO `quote_items` VALUES (1,6,'Test name','test spec','T',10,30,300,'None','/static/images/347b49742a1b914b4277.jpg'),(2,6,'Test name 2','test spec 2','Piece',20,20,400,'None',''),(3,6,'Test name 2','test spec 2','Piece',20,20,400,'None','/static/images/0525d64ef8dfa6e0567e.png'),(5,6,'Test name xx','test spec 2','Piece',532,3,1596,'None','/static/images/761d6420b5c7184d64dd.jpg'),(11,7,'Steel column','HW200x200x8x12 HN300x150x6.5x9','T',6,850,5100,'Q235B','/static/images/0525d64ef8dfa6e0567e.png'),(12,8,'steel','','piece',1,1000000000,1000000000,'none','/static/images/761d6420b5c7184d64dd.jpg'),(13,10,'support','10*9*8','10',10,880,8800,'','/static/images/abc3070f91a53bd06040.jpg'),(16,13,'Q355B','HN250*125','T',21,830,17430,'','/static/images/0525d64ef8dfa6e0567e.png'),(17,6,'Test name edit','test spec edit','Piece',10,10,100,'None','/static/images/e418672097fae435da92.png'),(18,6,'Fountation Bolts','250x12x15 mm','Piece',100,10,1000,'None','/static/images/abc3070f91a53bd06040.jpg'),(22,16,'steel','100','t',10,1,10,'none','/static/images/0525d64ef8dfa6e0567e.png');
/*!40000 ALTER TABLE `quote_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotes` (
  `q_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `customer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `project` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `size` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `truss` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `validity` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`q_id`,`user_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (6,1,'Mhamid Mahmoudi','Warehouse','USD','22mx54mx9m+10T		','None','2024-07-26','10 Days'),(7,3,'Sunday','Apple cabin','USD','5.13*2.14m','None','2024-07-26','30 days'),(8,2,'Trump','natioal security building','USD','none','none','2024-07-26','20 days'),(9,4,'amini','warehouse','USD','100*60*10','none','2024-07-26','30'),(10,6,'aaa','aaaaa','USD','9*7*6','no','2024-07-26','8-10'),(12,9,'beily wang','container house','USD','900*900*900','900*900*900','2024-07-26','2024.7.26'),(13,6,'Alazzwai','Chicken Coop Engineering','USD','16.3*142*2.5','none','2024-07-26','20 days'),(15,1,'Mr. Primo','2 Story Villla','USD','100x80 m','N/A','2024-07-29','20 Days'),(16,8,'sally','garage','USD','100*100*100','none','2024-07-29','10days'),(17,6,'mamta and KT','Congo warehouse','USD','104*80*18m','none','2024-07-30','40 days');
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'Ayub Ali Emon','harvest23@ruigangsteel.com','16678665112'),(2,NULL,NULL,NULL),(3,'Primo','harvest22@ruigangsteel.com','16678665106'),(4,'Charly Zheng','harvest25@ruigangsteel.com','16678665101'),(5,'Sally Hou','harvest28@ruigangsteel.com','16678665113'),(6,NULL,NULL,NULL),(7,'Iris Yi','harvest30@ruigangsteel.com','16678665103'),(8,'Amelia Liu ','harvest21@ruigangsteel.com','16678665110'),(9,'beily wang','harvest31@ruiqangsteel.com','16678665102');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`,`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'emon','123456','admin'),(2,'ross','123456','user'),(3,'primo','123456','user'),(4,'charly','123456','user'),(5,'sally','123456','user'),(6,'gelin','123456','user'),(7,'iris','123456','user'),(8,'amelia','123456','user'),(9,'beily','123456','user');
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

-- Dump completed on 2024-07-29 16:57:25
