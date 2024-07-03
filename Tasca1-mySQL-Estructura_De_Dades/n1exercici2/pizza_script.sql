-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: pizza_parlor
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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `id_town` int DEFAULT NULL,
  `phone` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_town1_idx` (`id_town`),
  CONSTRAINT `fk_client_town1` FOREIGN KEY (`id_town`) REFERENCES `town` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Carlos','García','Calle Sol 10','28100',1,612345678),(2,'Ana','López','Avenida Libertad 25','28904',2,622345678),(3,'Luis','Martínez','Carrer del Mar 15','08911',3,632345678),(4,'María','Pérez','Carrer de la Riera 20','08903',4,642345678),(5,'Elena','Sánchez','Calle Mayor 30','46900',5,652345678),(6,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,NULL,NULL,NULL,NULL,NULL);
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
  `id_shop` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `nif` varchar(10) NOT NULL,
  `phone` int NOT NULL,
  `job` enum('cook','delivery') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_shop1_idx` (`id_shop`),
  CONSTRAINT `fk_employee_shop1` FOREIGN KEY (`id_shop`) REFERENCES `shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,'Juan','García','12345678A',600123456,'cook'),(2,1,'María','López','23456789B',600123457,'delivery'),(3,1,'Pedro','Martínez','34567890C',600123458,'cook'),(4,1,'Laura','Sánchez','45678901D',600123459,'delivery'),(5,1,'Luis','Fernández','56789012E',600123450,'cook'),(6,2,'Ana','González','67890123F',601123456,'cook'),(7,2,'Carlos','Rodríguez','78901234G',601123457,'delivery'),(8,2,'Elena','Pérez','89012345H',601123458,'cook'),(9,2,'Jorge','Gómez','90123456I',601123459,'delivery'),(10,2,'Isabel','Díaz','01234567J',601123450,'cook'),(11,3,'Raúl','Ruiz','12345678K',602123456,'cook'),(12,3,'Sara','Moreno','23456789L',602123457,'delivery'),(13,3,'Miguel','Jiménez','34567890M',602123458,'cook'),(14,3,'Lucía','Hernández','45678901N',602123459,'delivery'),(15,3,'Pablo','Muñoz','56789012O',602123450,'cook'),(16,4,'Alberto','Romero','67890123P',603123456,'cook'),(17,4,'Cristina','Navarro','78901234Q',603123457,'delivery'),(18,4,'David','Torres','89012345R',603123458,'cook'),(19,4,'Laura','Domínguez','90123456S',603123459,'delivery'),(20,4,'Fernando','Vázquez','01234567T',603123450,'cook'),(21,5,'Javier','Castro','12345678U',604123456,'cook'),(22,5,'Patricia','Suárez','23456789V',604123457,'delivery'),(23,5,'Roberto','Molina','34567890W',604123458,'cook'),(24,5,'Marta','Ortega','45678901X',604123459,'delivery'),(25,5,'Andrea','Ramos','56789012Y',604123450,'cook');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL,
  `id_employee` int NOT NULL,
  `id_client` int NOT NULL,
  `datetime_order` timestamp NOT NULL,
  `delivery` tinyint(1) NOT NULL,
  `pizzas_total` int DEFAULT NULL,
  `burgers_total` int DEFAULT NULL,
  `drinks_total` int DEFAULT NULL,
  `price` float NOT NULL,
  `id_shop` int NOT NULL,
  `id_delivery_employee` int DEFAULT NULL,
  `datetime_delivered` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_client1_idx` (`id_client`),
  KEY `fk_order_employee1_idx` (`id_delivery_employee`),
  KEY `fk_order_shop1_idx` (`id_shop`),
  KEY `fk_order_employee2_idx` (`id_employee`),
  CONSTRAINT `fk_order_client1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`),
  CONSTRAINT `fk_order_employee1` FOREIGN KEY (`id_delivery_employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_order_employee2` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_order_shop1` FOREIGN KEY (`id_shop`) REFERENCES `shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,1,'2024-06-05 10:30:00',1,3,1,1,40.45,1,2,'2024-06-05 11:30:00'),(2,1,1,'2024-06-10 14:45:00',1,2,1,2,39.95,1,4,'2024-06-10 15:45:00'),(3,3,6,'2024-06-15 08:00:00',0,3,1,1,53.45,3,NULL,NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `id_order` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_item_order1_idx` (`id_order`),
  KEY `fk_order_item_product1_idx` (`id_product`),
  CONSTRAINT `fk_order_item_order1` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`),
  CONSTRAINT `fk_order_item_product1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1),(2,2,1),(3,3,1),(4,11,1),(5,16,1),(6,4,2),(7,5,2),(8,12,2),(9,17,2),(10,19,2),(11,6,3),(12,7,3),(13,8,3),(14,13,3),(15,20,3);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza` (
  `id_pizza` int NOT NULL,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id_pizza`),
  KEY `fk_pizza_pizza_category1_idx` (`id_category`),
  CONSTRAINT `fk_pizza_pizza_category1` FOREIGN KEY (`id_category`) REFERENCES `pizza_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (1,1),(2,1),(7,1),(9,1),(6,2),(8,2),(10,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_category`
--

DROP TABLE IF EXISTS `pizza_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_category`
--

LOCK TABLES `pizza_category` WRITE;
/*!40000 ALTER TABLE `pizza_category` DISABLE KEYS */;
INSERT INTO `pizza_category` VALUES (1,'Pizzas Tradicionales'),(2,'Pizzas Gourmet'),(3,'Pizzas Vegetarianas'),(4,'Pizzas de Mariscos'),(5,'Pizzas Picantes');
/*!40000 ALTER TABLE `pizza_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` enum('pizza','burger','drink') NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_product_pizza1` FOREIGN KEY (`id`) REFERENCES `pizza` (`id_pizza`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'pizza','Margarita','Pizza clásica con salsa de tomate, mozzarella y albahaca fresca.','margarita.jpg',8.99),(2,'pizza','Pepperoni','Pizza con salsa de tomate, mozzarella y pepperoni.','pepperoni.jpg',9.99),(3,'pizza','Vegetariana','Pizza con salsa de tomate, mozzarella y verduras frescas.','vegetariana.jpg',10.99),(4,'pizza','Frutti di Mare','Pizza con salsa de tomate, mozzarella y mariscos frescos.','frutti_di_mare.jpg',12.99),(5,'pizza','Diavola','Pizza picante con salsa de tomate, mozzarella y salami picante.','diavola.jpg',11.99),(6,'pizza','Cuatro Quesos','Pizza con mezcla de cuatro quesos: mozzarella, gorgonzola, parmesano y queso de cabra.','cuatro_quesos.jpg',13.99),(7,'pizza','Hawaiana','Pizza con salsa de tomate, mozzarella, jamón y piña.','hawaiana.jpg',10.49),(8,'pizza','Caprichosa','Pizza con salsa de tomate, mozzarella, champiñones, jamón y alcachofas.','caprichosa.jpg',14.49),(9,'pizza','Barbacoa','Pizza con salsa barbacoa, mozzarella, pollo y maíz.','barbacoa.jpg',12.49),(10,'pizza','Carbonara','Pizza con salsa carbonara, mozzarella, panceta y champiñones.','carbonara.jpg',13.49),(11,'burger','Cheeseburger','Hamburguesa clásica con queso cheddar, lechuga, tomate y cebolla.','cheeseburger.jpg',7.99),(12,'burger','Bacon Burger','Hamburguesa con queso cheddar, bacon crujiente y salsa barbacoa.','bacon_burger.jpg',8.99),(13,'burger','Veggie Burger','Hamburguesa vegetariana con patty de garbanzos, lechuga, tomate y aguacate.','veggie_burger.jpg',9.49),(14,'burger','Chicken Burger','Hamburguesa de pollo empanizado con lechuga, tomate y mayonesa.','chicken_burger.jpg',8.49),(15,'burger','Double Burger','Hamburguesa doble con queso, lechuga, tomate, cebolla y salsa especial.','double_burger.jpg',10.99),(16,'drink','Coca Cola','Refresco de cola.','coca_cola.jpg',2.49),(17,'drink','Fanta Naranja','Refresco de naranja.','fanta_naranja.jpg',2.49),(18,'drink','Agua Mineral','Agua mineral sin gas.','agua_mineral.jpg',1.99),(19,'drink','Cerveza','Cerveza rubia.','cerveza.jpg',3.49),(20,'drink','Vino Tinto','Vaso de vino tinto.','vino_tinto.jpg',4.99);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'Madrid'),(2,'Barcelona'),(3,'Valencia'),(4,'Sevilla'),(5,'Bilbao');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `address` varchar(40) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `id_town` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shop_town1_idx` (`id_town`),
  CONSTRAINT `fk_shop_town1` FOREIGN KEY (`id_town`) REFERENCES `town` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (1,'Pizza Delight','Calle Mayor 10','28100',1),(2,'Tasty Pizza','Avenida de la Libertad 15','28904',2),(3,'Pizza Palace','Carrer de Mar 25','08911',3),(4,'Pizza Town','Carrer de la Riera Blanca 30','08903',4),(5,'Pizza Paradise','Calle Mayor 5','46900',5);
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `town`
--

DROP TABLE IF EXISTS `town`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `town` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `id_province` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_town_province1_idx` (`id_province`),
  CONSTRAINT `fk_town_province1` FOREIGN KEY (`id_province`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `town`
--

LOCK TABLES `town` WRITE;
/*!40000 ALTER TABLE `town` DISABLE KEYS */;
INSERT INTO `town` VALUES (1,'Alcobendas',1),(2,'Getafe',1),(3,'Badalona',2),(4,'Hospitalet de Llobregat',2),(5,'Gandia',3),(6,'Torrent',3),(7,'Dos Hermanas',4),(8,'Utrera',4),(9,'Barakaldo',5),(10,'Getxo',5);
/*!40000 ALTER TABLE `town` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-28 15:42:34
