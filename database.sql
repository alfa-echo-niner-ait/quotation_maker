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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'Warehouse','347b49742a1b914b4277.jpg',631.35),(2,'Warehouse','761d6420b5c7184d64dd.jpg',52.46),(4,'Container Loading','25790cdf14aec1a52816.jpg',4307.68),(5,'Foundation Bolts','abc3070f91a53bd06040.jpg',270.77),(7,'Floor Deck','2f7bb9cd7ef4f926dbb8.png',785.21),(8,'H-type Purlin','0525d64ef8dfa6e0567e.png',742.24),(9,'Rivet','e418672097fae435da92.png',160.13),(10,'Steel Beam','2c2a8e2568665c9ad945.jpg',5745.93),(11,'Support','c81aa1f8340d95e7133f.png',28.02),(12,'Drainage Gutter','70b3f74354b147efdb47.png',394.97),(13,'Anchor Bolts','fb0da2a9a3ad739f4cee.png',389.42),(14,'PVC Pipes','f3a41c5e1d237ba05897.png',812.71),(15,'Color Steel Tiles','f4921a6cc37c7591fedf.jpg',59.02),(16,'purlin','9d431c21696eabcfc727.png',420.38),(17,'staircase','394bab7a17fcaa5ae242.png',745.19),(18,'bolts','386d9a80a88d8d1bc5b0.png',121.47),(19,'high strenghth bolt','cc19fb5bda0c44564868.png',306.97),(20,'door','610eccb643af39ecd76a.png',380.23),(21,'EPS panel','cd79f1911b10d21f94bd.png',521.07),(22,'window','eca29341651956e8318c.png',69.97),(23,'Ordinary galvanized bolts','0089e75ea6d70293835e.png',53.4),(24,'nuts','adf8ba0548e6ed414de2.png',471.25),(25,'Shear studs','5493e604c54c04c85576.png',542.18),(26,'Waterproof sealant','5b69a281b89c84c1fe3a.png',502.4),(27,'Roofing self-tapping nails','353691ff8c28e09096c0.png',385.41),(28,'Wall self-tapping nails','367c385b5158076b275d.png',174.29),(30,'roofing saddle','8ff4df110bb14595c312.png',778.14),(31,'packing','6873749962002b3d2214.jpg',3657.68),(32,'Double door','cd3993f2b3fa20c36479.jpg',101.42),(33,'Electric roller shutter doors','8fd641ab539fb8bd5cf8.jpg',193.76),(34,'downpipe','67a139a0f7a0d52381d4.jpg',506.64),(35,'Roof color steel plate - canopy','86e203c53af01dc406db.jpg',247.99),(37,'Fiberglass panels','6b54bc577d29b30cfbef.jpg',266.6),(38,'Plain galvanized nuts','df5c3f798d09f5db60be.png',292.47),(39,'expansion pipe','5d50b34013f0080e096e.png',245.47),(40,'Cullis','7c35609b2becb7312885.png',559.06),(41,'Drainage System (fittings)','6cc483461359b3483348.png',538.26),(42,'Port Miscellaneous Charges ','11cdd386c6aee7682547.jpg',221.16);
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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_items`
--

LOCK TABLES `quote_items` WRITE;
/*!40000 ALTER TABLE `quote_items` DISABLE KEYS */;
INSERT INTO `quote_items` VALUES (13,10,'support','10*9*8','10',10,880,8800,'','/static/images/abc3070f91a53bd06040.jpg'),(16,13,'Q355B','HN250*125','T',21,830,17430,'','/static/images/0525d64ef8dfa6e0567e.png'),(22,16,'steel','100','t',10,1,10,'none','/static/images/0525d64ef8dfa6e0567e.png'),(24,17,'Steel frame columns\\beams','HN250*125','T',754.8,830,626484,'Q355','/static/images/0525d64ef8dfa6e0567e.png'),(25,17,'Wall roofing purlins','Galvanized C160*60*20*2.0','T',44.55,830,36976.5,'Q355','/static/images/9d431c21696eabcfc727.png'),(26,17,'Support system','HN198*99*4.5*7     ¢20 round bars          L50*3 angle steel  ¢12 round bar/¢32x2 round pipe','T',41.85,820,34317,'Q235','/static/images/2c2a8e2568665c9ad945.jpg'),(27,17,'Staircase and freight lift systems','C20A channel steel ¢50*3 round tubes P200*8/P200*6 square tube','T',48.48,820,39753.6,'Q235','/static/images/394bab7a17fcaa5ae242.png'),(28,17,'Edge board','1.0mm*200mm*640m','T',1.05,10,10.5,'','/static/images/70b3f74354b147efdb47.png'),(29,17,'roofing and wall systems','50mm EPS panels（puff panels）','m',13750,12,165000,'','/static/images/cd79f1911b10d21f94bd.png'),(30,17,'Mezzanine floor deck','0.4mm color steel plate 1.0mm*750 type','m',15250,12,183000,'','/static/images/2f7bb9cd7ef4f926dbb8.png'),(31,17,'High-strength bolts','M20x75','set',54000,0.55,29700,'One bolt, one nut, two gaskets','/static/images/cc19fb5bda0c44564868.png'),(32,17,'Ordinary galvanized bolts','M12*35','set',11500,0.12,1380,'One bolt, one nut, two gaskets','/static/images/0089e75ea6d70293835e.png'),(33,17,'foundation bolt','M24x870 M30*1000','set',1584,4,6336,'One bolt, three nuts','/static/images/abc3070f91a53bd06040.jpg'),(34,17,'Ordinary nuts','M12、M20','pcs',4100,0.15,615,'','/static/images/adf8ba0548e6ed414de2.png'),(35,17,'Puff bolt（expansion anchor bolt）','M16*150','pcs',30,0.5,15,'','/static/images/fb0da2a9a3ad739f4cee.png'),(36,17,'Shear studs','M16*80','pcs',42000,0.5,21000,'','/static/images/5493e604c54c04c85576.png'),(37,17,'Waterproof sealant','','pcs',120,4,480,'','/static/images/5b69a281b89c84c1fe3a.png'),(38,17,'Roofing self-tapping nails','φ5.5*110','pcs',26000,0.16,4160,'','/static/images/353691ff8c28e09096c0.png'),(39,17,'Wall self-tapping nails','φ5.5*50','pcs',15000,0.16,2400,'','/static/images/367c385b5158076b275d.png'),(40,17,'Roofing saddle','','pcs',26000,0.02,520,'','/static/images/8ff4df110bb14595c312.png'),(41,17,'Pull rivets','','set',6000,0.02,120,'','/static/images/e418672097fae435da92.png'),(42,17,'Packing','','',60,500,30000,'','/static/images/6873749962002b3d2214.jpg'),(43,18,'Steel frame columns\\beams','H300~650*240*6*10/H650~400*180*6*8','T',82.22,840,69064.8,'Q355','/static/images/2c2a8e2568665c9ad945.jpg'),(44,18,'Wall roofing purlins','Galvanized C160*60*20*2.0','T',31.58,840,26527.2,'Q355','/static/images/9d431c21696eabcfc727.png'),(45,18,'Support system','￠89*3 Round tubes；      ￠20 Round Bars；          Galvanized L50*3 angle steel；       ￠12 /¢32x2 round bars','T',11.93,830,9901.9,'Q235','/static/images/0525d64ef8dfa6e0567e.png'),(46,18,'Roofing and wall systems','50mm glass fabric panels（0.4+50+0.4*970）','m',8600,12,103200,'','/static/images/6b54bc577d29b30cfbef.jpg'),(47,18,'Steel Canopy','0.4mm color steel plate','m',750,12.5,9375,'','/static/images/86e203c53af01dc406db.jpg'),(48,18,'Drainage System (Main Material)','1.0mm stainless steel φ110mm downpipe','m',774,7,5418,'','/static/images/67a139a0f7a0d52381d4.jpg'),(49,18,'Drainage System (fittings)','Fittings/Elbows/Pipe clamps/Sinkhole','pcs',770,1.1,847,'','/static/images/67a139a0f7a0d52381d4.jpg'),(50,18,'Double doors','1880*2100*3 frame','m²',11.84,41,485.44,'','/static/images/cd3993f2b3fa20c36479.jpg'),(51,18,'Electric roller shutter doors','4000*3000*11 frame','m²',132,31,4092,'','/static/images/8fd641ab539fb8bd5cf8.jpg'),(52,18,'Aluminum alloy windows','3000*1500*35 frame','m²',157,56,8792,'','/static/images/eca29341651956e8318c.png'),(53,18,'High-strength bolts','M20x75','set',1450,0.55,797.5,'','/static/images/cc19fb5bda0c44564868.png'),(54,18,'Ordinary galvanized bolts','M12*35','set',6200,0.12,744,'','/static/images/0089e75ea6d70293835e.png'),(55,18,'Ordinary bolts','M20*60','set',600,0.1,60,'','/static/images/386d9a80a88d8d1bc5b0.png'),(56,18,'foundation bolts','M24x800','set',348,4.3,1496.4,'','/static/images/abc3070f91a53bd06040.jpg'),(57,18,'Ordinary galvanized nuts','M12、M20','pcs',4050,0.16,648,'','/static/images/df5c3f798d09f5db60be.png'),(58,18,'Waterproof sealant','','pcs',60,4.3,258,'','/static/images/5b69a281b89c84c1fe3a.png'),(59,18,'Roofing self-tapping nails','φ5.5*110','pcs',13500,0.1,1350,'','/static/images/353691ff8c28e09096c0.png'),(60,18,'Wall self-tapping nails','φ5.5*75','pcs',12000,0.05,600,'','/static/images/367c385b5158076b275d.png'),(61,18,'Saddle roofing','','pcs',13500,0.16,2160,'','/static/images/8ff4df110bb14595c312.png'),(62,18,'Pull rivets','φ5*16','set',72000,0.16,11520,'','/static/images/e418672097fae435da92.png'),(63,18,'Expansion pipe','M8*60','set',1000,1,1000,'','/static/images/5d50b34013f0080e096e.png'),(64,18,'Packing fee （FOB price）','','',17,510,8670,'','/static/images/6873749962002b3d2214.jpg'),(65,19,'Steel frame columns\\beams','WH300*200*6*8/HN298*149*5.5*8','T',22.3,920,20516,'Q355','/static/images/2c2a8e2568665c9ad945.jpg'),(66,19,'Wall roofing purlins','Galvanized C160*60*20*2.0','T',11.49,880,10111.2,'Q235','/static/images/9d431c21696eabcfc727.png'),(67,19,'Support system','￠89*3 Round tubes；      ￠20 Round Bars；          Galvanized L50*3 angle steel；       ￠12 /¢32x2 round bars','T',4.59,880,4039.2,'Q235','/static/images/0525d64ef8dfa6e0567e.png'),(68,19,'Roofing and wall systems','50mm EPS panels（0.4+50+0.4*970）','m',3040,12,36480,'','/static/images/cd79f1911b10d21f94bd.png'),(69,19,'Edge','0.4mm color steel plate','m',270,4.2,1134,'','/static/images/2f7bb9cd7ef4f926dbb8.png'),(70,19,'Cullis','1000mm wide 1.0mm stainless steel','m',260,21,5460,'','/static/images/7c35609b2becb7312885.png'),(71,19,'Drainage System (Main Material)','φ160mm','m',176,14,2464,'','/static/images/5d50b34013f0080e096e.png'),(72,19,'Drainage System (fittings)','Fittings/Elbows/Pipe clamps/Sinkhole','pcs',400,1.1,440,'','/static/images/6cc483461359b3483348.png'),(73,19,'Doors','1880*2100*3 frame','m²',12.8,45,576,'','/static/images/8fd641ab539fb8bd5cf8.jpg'),(74,19,'High-strength bolts','M20*75','set',400,0.8,320,'One bolt, one nut, two gaskets','/static/images/cc19fb5bda0c44564868.png'),(75,19,'Ordinary galvanized bolts','M12*35、M20*60','set',2780,0.14,389.2,'One bolt, one nut, two gaskets','/static/images/0089e75ea6d70293835e.png'),(76,19,'Foundation bolts','M24*800','set',188,4.3,808.4,'One bolt, three nuts','/static/images/abc3070f91a53bd06040.jpg'),(77,19,'Expansion bolt','M12*120','set',28,0.8,22.4,'','/static/images/386d9a80a88d8d1bc5b0.png'),(78,19,'Pull rivets','φ5*16','set',4800,0.16,768,'','/static/images/e418672097fae435da92.png'),(79,19,'Plain galvanized nuts','M12、M20','pcs',800,0.16,128,'','/static/images/adf8ba0548e6ed414de2.png'),(80,19,'Roofing self-tapping nails','φ5.5*110、φ5.5*75','pcs',7200,0.14,1008,'','/static/images/353691ff8c28e09096c0.png'),(81,19,'saddle roofing','','pcs',4300,0.16,688,'','/static/images/8ff4df110bb14595c312.png'),(82,19,'Waterproof sealant','','pcs',30,4.3,129,'','/static/images/5b69a281b89c84c1fe3a.png'),(83,19,'Packing fee','','',4,550,2200,'','/static/images/6873749962002b3d2214.jpg'),(84,19,'FOB fee（Qingdao）','','',4,625,2500,'Port Miscellaneous Charges (excluding insurance and sea freight)','/static/images/11cdd386c6aee7682547.jpg'),(86,7,'','','T',150,35,3000,'',''),(87,20,'Steel Frame Columns\\Beams','WH300*200*6*8/HN298*149*5.5*8','T',22.3,920,20516,'Q355','/static/images/2c2a8e2568665c9ad945.jpg'),(88,20,'Wall Roofing Purlins','Galvanized C160*60*20*2.0','T',11.49,880,10111.2,'Q235','/static/images/9d431c21696eabcfc727.png'),(89,20,'Support System','￠89*3 Round tubes； ￠20 Round Bars； Galvanized L50*3 angle steel； ￠12 /¢32x2 round bars','T',4.59,880,4039.2,'Q235','/static/images/0525d64ef8dfa6e0567e.png'),(90,20,'Roofing & Wall System','50mm EPS Panels（0.4+50+0.4*970）','m',3040,12,36480,'','/static/images/cd79f1911b10d21f94bd.png'),(91,20,'Edge','0.4mm Color Steel Plate','m',270,4.2,1134,'','/static/images/2f7bb9cd7ef4f926dbb8.png'),(92,20,'Cullis','1000mm wide 1.0mm Stainless Steel','m',260,21,5460,'','/static/images/7c35609b2becb7312885.png'),(93,20,'Drainage System (Main Material)','φ160mm','m',176,14,2464,'','/static/images/5d50b34013f0080e096e.png'),(94,20,'Drainage System (Fittings)','Fittings/Elbows/Clamps/Sinkhole','pcs',400,1.1,440,'','/static/images/6cc483461359b3483348.png'),(95,20,'Doors','1880*2100*3 Frame','m²',12.8,45,576,'Shutter','/static/images/8fd641ab539fb8bd5cf8.jpg'),(96,20,'High-strength Bolts','M20*75','Set',400,0.8,320,'1 Bolt, 1 Nut, 2 Gaskets','/static/images/cc19fb5bda0c44564868.png'),(97,20,'Normal Galvanized Bolts','M12*35, M20*60','Set',2780,0.14,389.2,'1 Bolt, 1 Nut, 2 Gaskets','/static/images/0089e75ea6d70293835e.png'),(98,20,'Foundation Bolts','M24*800','Set',188,4.3,808.4,'1 Bolt, 3 Nuts','/static/images/abc3070f91a53bd06040.jpg'),(99,20,'Expansion Bolt','M12*120','Set',28,0.8,22.4,'','/static/images/386d9a80a88d8d1bc5b0.png'),(100,20,'Pull Rivets','φ5*16','Set',4800,0.16,768,'','/static/images/e418672097fae435da92.png'),(101,20,'Plain Galvanized Nuts','M12, M20','pcs',800,0.16,128,'','/static/images/adf8ba0548e6ed414de2.png'),(102,20,'Self-tapping Roofing Nails','φ5.5*110, φ5.5*75','pcs',7200,0.14,1008,'','/static/images/353691ff8c28e09096c0.png'),(103,20,'Saddle Roofing','','pcs',4300,0.16,688,'','/static/images/8ff4df110bb14595c312.png'),(104,20,'Waterproof Sealant','','pcs',30,4.3,129,'','/static/images/5b69a281b89c84c1fe3a.png'),(105,20,'Packaging Fees','','Cnt',4,550,2200,'','/static/images/6873749962002b3d2214.jpg'),(106,20,'FOB Fees','Port Miscellaneous Charges','Cnt',4,625,2500,'Excluding Insurance & Sea Freight','/static/images/11cdd386c6aee7682547.jpg'),(107,21,'Steel Frame Columns\\Beams','	H300~650*240*6*10/H650~400*180*6*8','T',82.22,840,69064.8,'Q355','/static/images/2c2a8e2568665c9ad945.jpg'),(108,21,'Wall Roofing Purlins','Galvanized C160*60*20*2.0','T',31.58,840,26527.2,'Q355','/static/images/9d431c21696eabcfc727.png'),(109,21,'Support system','￠89*3 Round Tubes； ￠20 Round Bars； Galvanized L50*3 Angle Steel； ￠12 /¢32x2 Round Bars','T',11.93,830,9901.9,'Q235','/static/images/0525d64ef8dfa6e0567e.png'),(110,21,'Roofing & Wall Systems','50mm Glass Fabric Panels (0.4+50+0.4*970)','m',8600,12,103200,'','/static/images/6b54bc577d29b30cfbef.jpg'),(111,21,'Steel Canopy','0.4mm Color Steel Plate','m',750,12.5,9375,'','/static/images/86e203c53af01dc406db.jpg'),(112,21,'Drainage System (Main Material)','1.0mm Stainless Steel, φ110mm Downpipe','m',774,7,5418,'','/static/images/67a139a0f7a0d52381d4.jpg'),(113,21,'Drainage System (Fittings)','Fittings/Elbows/Clamps/Sinkhole','pcs',770,1.1,847,'','/static/images/6cc483461359b3483348.png'),(114,21,'Double Doors','1880*2100*3 Frame','m²',11.84,41,485.44,'','/static/images/cd3993f2b3fa20c36479.jpg'),(115,21,'Electric Roller Shutter Doors','4000*3000*11 Frame','m²',132,31,4092,'','/static/images/8fd641ab539fb8bd5cf8.jpg'),(116,21,'Aluminum Alloy Windows','3000*1500*35 Frame','m²',157,56,8792,'','/static/images/eca29341651956e8318c.png'),(117,21,'High-strength Bolts','M20*75','Set',1450,0.55,797.5,'','/static/images/cc19fb5bda0c44564868.png'),(118,21,'Normal Galvanized Bolts','M12*35','Set',6200,0.12,744,'','/static/images/0089e75ea6d70293835e.png'),(119,21,'Normal Bolts','M20*60','Set',600,0.1,60,'','/static/images/386d9a80a88d8d1bc5b0.png'),(120,21,'Foundation Bolts','M24*800','Set',348,4.3,1496.4,'','/static/images/abc3070f91a53bd06040.jpg'),(121,21,'Galvanized Nuts','M12, M20','pcs',4050,0.16,648,'','/static/images/df5c3f798d09f5db60be.png'),(122,21,'Waterproof Sealant','','pcs',60,4.3,258,'','/static/images/5b69a281b89c84c1fe3a.png'),(123,21,'Self-tapping Roofing Nails','φ5.5*110','pcs',13500,0.1,1350,'','/static/images/353691ff8c28e09096c0.png'),(124,21,'Self-tapping Wall Nails','φ5.5*75','pcs',12000,0.05,600,'','/static/images/367c385b5158076b275d.png'),(125,21,'Saddle Roofing','','pcs',13500,0.16,2160,'','/static/images/8ff4df110bb14595c312.png'),(126,21,'Pull Rivets','φ5*16','Set',72000,0.16,11520,'','/static/images/e418672097fae435da92.png'),(127,21,'Expansion Pipe','M8*60','Set',1000,1,1000,'','/static/images/5d50b34013f0080e096e.png'),(128,21,'Packaging Fees','','Cnt',17,510,8670,'','/static/images/6873749962002b3d2214.jpg'),(129,21,'FOB Fees','Port Miscellaneous Charges','Cnt',17,580,9860,'	Excluding Insurance & Sea Freight','/static/images/11cdd386c6aee7682547.jpg'),(130,22,'Steel Frame Columns\\Beams','P120*5 Square Tube/HN200*100*5.5*8','T',6.58,1,6.58,'','');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (7,3,'Sunday','Apple cabin','USD','5.13*2.14m','None','2024-07-26','30 days'),(9,4,'amini','warehouse','USD','100*60*10','none','2024-07-26','30'),(10,6,'aaa','aaaaa','USD','9*7*6','no','2024-07-26','8-10'),(12,9,'beily wang','container house','USD','900*900*900','900*900*900','2024-07-26','2024.7.26'),(13,6,'Alazzwai','Chicken Coop Engineering','USD','16.3*142*2.5','none','2024-07-26','20 days'),(16,8,'sally','garage','USD','100*100*100','none','2024-07-29','10days'),(17,6,'mamta and KT','Congo warehouse','USD','104*80*18m','none','2024-07-30','September 20, 2024'),(18,6,'Artvin Spor','Türkiye sheep shed（1 set）','USD','135*30*10m','none','2024-08-06','September 20, 2024'),(19,6,'Mr N\'SINDI Bwato','Congo (Goma City) chicken coop','USD','18m*85m*4.8m','none','2024-08-22','September 22, 2024'),(20,1,'Yousif Mohhamed Ahmed','Chicken House','USD','18m*85m*4.8m','N/A','2024-09-04','30 Days'),(21,1,'N/A','Sheep Shed','USD','135m*30m*10m','N/A','2024-09-04','15 Days'),(22,1,'N/A','Two Story Villa','USD','8m*10m*6.2m','N/A','2024-09-04','30 Days');
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
INSERT INTO `user_info` VALUES (1,'Ayub Ali Emon','harvest23@ruigangsteel.com','16678665112'),(2,NULL,NULL,NULL),(3,'Primo','harvest22@ruigangsteel.com','16678665106'),(4,'Charly Zheng','harvest25@ruigangsteel.com','16678665101'),(5,'Sally Hou','harvest28@ruigangsteel.com','16678665113'),(6,'Gelin Sun','harvest26@ruigangsteel.com','16678665107'),(7,'Iris Yi','harvest30@ruigangsteel.com','16678665103'),(8,'Amelia Liu ','harvest21@ruigangsteel.com','16678665110'),(9,'beily wang','harvest31@ruiqangsteel.com','16678665102');
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

--
-- Dumping events for database 'ruigang_quote'
--

--
-- Dumping routines for database 'ruigang_quote'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-06 14:16:24
