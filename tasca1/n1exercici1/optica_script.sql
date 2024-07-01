-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: optical
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(45) DEFAULT NULL,
  `house_number` int DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `door` varchar(10) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Passeig de Gracia',45,3,'A','Barcelona','08035','Spain'),(2,'Passeig Maragall',30,2,'B','Barcelona','08033','Spain'),(3,'Carrer Santa Caterina',102,1,'A','Barcelona','08032','Spain'),(4,'Gran Via',137,4,'C','Badalona','08911','Spain'),(5,'Carrer Gran de Gràcia',30,1,'A','Barcelona','08034','Spain'),(6,'Calle Patata Frita',17,2,'1','Barcelona','08033','Spain'),(7,'Calle a las Afueras',10,1,'1','Cornellá','08940','Spain');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `id_supplier` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_brands_suppliers1_idx` (`id_supplier`),
  CONSTRAINT `fk_brands_suppliers1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Gaffix',1),(2,'HappyGlass',1),(3,'GlaGlass',2);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `id_address` int DEFAULT NULL,
  `phone` int NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `date_registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_recommender` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clients_addresses1_idx` (`id_address`),
  KEY `fk_clients_clients1_idx` (`id_recommender`),
  CONSTRAINT `fk_clients_addresses1` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_clients_clients1` FOREIGN KEY (`id_recommender`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Santiago Caracol',5,603404040,'santicara@hotmail.com','2024-06-24 09:30:12',NULL),(2,'Laura Estapé',6,613131313,'lauesta@hotmail.com','2024-06-24 09:30:12',1),(3,'Carla Estapé',6,623232323,'carla.e@gmail.com','2024-06-24 09:30:12',2);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `id_address` int DEFAULT NULL,
  `phone` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employees_addresses1_idx` (`id_address`),
  CONSTRAINT `fk_employees_addresses1` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Enrique Perez',2,602303030),(2,'Luisa Cámara',3,603313131);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_brand` int NOT NULL,
  `grade_left_glass` float NOT NULL,
  `grade_right_glass` float NOT NULL,
  `frame` enum('rimless','horn-rimmed','metallic') NOT NULL,
  `frame_color` varchar(20) DEFAULT NULL,
  `color_left_glass` varchar(20) DEFAULT NULL,
  `color_right_glass` varchar(20) DEFAULT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_glasses_brands_idx` (`id_brand`),
  CONSTRAINT `fk_glasses_brands` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (1,1,1.25,2,'rimless','black',NULL,NULL,80.75),(2,2,2.5,2.25,'metallic',NULL,NULL,NULL,102.3),(3,1,3,2.75,'rimless','blue',NULL,NULL,98.35),(4,3,1.25,2,'horn-rimmed','red',NULL,NULL,89.2),(5,2,1.25,2,'horn-rimmed','black',NULL,NULL,82);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_client` int NOT NULL,
  `id_employee` int DEFAULT NULL,
  `id_glasses` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_sales_glasses1_idx` (`id_glasses`),
  KEY `fk_sales_clients1_idx` (`id_client`),
  KEY `fk_sales_employees1_idx` (`id_employee`),
  CONSTRAINT `fk_sales_clients1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`),
  CONSTRAINT `fk_sales_employees1` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_sales_glasses1` FOREIGN KEY (`id_glasses`) REFERENCES `glasses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,1,2,1,'2024-04-19 11:10:04'),(2,2,2,2,'2024-05-22 13:10:04'),(3,3,1,3,'2024-05-23 08:10:04'),(4,1,1,4,'2023-05-24 11:10:04'),(5,1,2,5,'2024-05-24 11:15:04');
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `id_address` int DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `fax` int DEFAULT NULL,
  `nif` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif_UNIQUE` (`nif`),
  KEY `fk_suppliers_addresses1_idx` (`id_address`),
  CONSTRAINT `fk_suppliers_addresses1` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Euro Optics',1,600121212,123456789,'12345678J'),(2,'Corbellini Optics',4,600232323,987654321,'77777777K'),(3,'MegaGlass',7,600989898,900121212,'66666666H');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-25 13:26:37
