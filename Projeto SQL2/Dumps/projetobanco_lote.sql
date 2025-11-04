-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: projetobanco
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lote` (
  `ID_Lote` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(255) DEFAULT NULL,
  `Data_Criacao` date DEFAULT NULL,
  PRIMARY KEY (`ID_Lote`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` VALUES (1,'Lote Descrição 90','2025-03-27'),(2,'Lote Descrição 80','2025-06-16'),(3,'Lote Descrição 70','2025-09-28'),(4,'Lote Descrição 60','2025-06-28'),(5,'Lote Descrição 50','2025-05-22'),(6,'Lote Descrição 40','2025-08-18'),(7,'Lote Descrição 30','2025-02-19'),(8,'Lote Descrição 20','2024-12-16'),(9,'Lote Descrição 10','2025-07-16'),(10,'Lote Descrição 0','2024-12-22'),(11,'Lote Descrição 91','2025-06-02'),(12,'Lote Descrição 81','2025-04-28'),(13,'Lote Descrição 71','2025-07-07'),(14,'Lote Descrição 61','2025-10-07'),(15,'Lote Descrição 51','2025-06-11'),(16,'Lote Descrição 41','2025-01-28'),(17,'Lote Descrição 31','2025-03-17'),(18,'Lote Descrição 21','2024-12-19'),(19,'Lote Descrição 11','2025-05-14'),(20,'Lote Descrição 1','2025-02-03'),(21,'Lote Descrição 92','2025-07-10'),(22,'Lote Descrição 82','2025-06-28'),(23,'Lote Descrição 72','2025-01-15'),(24,'Lote Descrição 62','2024-11-20'),(25,'Lote Descrição 52','2025-06-21'),(26,'Lote Descrição 42','2024-11-10'),(27,'Lote Descrição 32','2025-01-13'),(28,'Lote Descrição 22','2025-10-05'),(29,'Lote Descrição 12','2024-11-11'),(30,'Lote Descrição 2','2025-03-07'),(31,'Lote Descrição 93','2025-06-22'),(32,'Lote Descrição 83','2024-12-26'),(33,'Lote Descrição 73','2025-08-31'),(34,'Lote Descrição 63','2025-07-10'),(35,'Lote Descrição 53','2025-10-12'),(36,'Lote Descrição 43','2025-06-27'),(37,'Lote Descrição 33','2025-04-04'),(38,'Lote Descrição 23','2024-12-24'),(39,'Lote Descrição 13','2025-04-16'),(40,'Lote Descrição 3','2025-08-30'),(41,'Lote Descrição 94','2025-08-10'),(42,'Lote Descrição 84','2025-03-15'),(43,'Lote Descrição 74','2025-05-06'),(44,'Lote Descrição 64','2025-04-10'),(45,'Lote Descrição 54','2025-06-29'),(46,'Lote Descrição 44','2025-10-20'),(47,'Lote Descrição 34','2025-09-07'),(48,'Lote Descrição 24','2025-03-08'),(49,'Lote Descrição 14','2025-01-07'),(50,'Lote Descrição 4','2025-09-12'),(51,'Lote Descrição 95','2025-08-04'),(52,'Lote Descrição 85','2025-01-07'),(53,'Lote Descrição 75','2025-06-23'),(54,'Lote Descrição 65','2025-06-28'),(55,'Lote Descrição 55','2025-03-03'),(56,'Lote Descrição 45','2025-07-18'),(57,'Lote Descrição 35','2025-05-16'),(58,'Lote Descrição 25','2025-05-21'),(59,'Lote Descrição 15','2024-12-21'),(60,'Lote Descrição 5','2024-11-11'),(61,'Lote Descrição 96','2025-07-21'),(62,'Lote Descrição 86','2025-05-02'),(63,'Lote Descrição 76','2025-03-01'),(64,'Lote Descrição 66','2024-12-22'),(65,'Lote Descrição 56','2025-07-18'),(66,'Lote Descrição 46','2024-12-17'),(67,'Lote Descrição 36','2025-04-29'),(68,'Lote Descrição 26','2024-11-26'),(69,'Lote Descrição 16','2025-09-14'),(70,'Lote Descrição 6','2024-12-17'),(71,'Lote Descrição 97','2024-11-07'),(72,'Lote Descrição 87','2025-07-14'),(73,'Lote Descrição 77','2025-04-08'),(74,'Lote Descrição 67','2024-11-24'),(75,'Lote Descrição 57','2024-11-05'),(76,'Lote Descrição 47','2025-09-09'),(77,'Lote Descrição 37','2025-01-28'),(78,'Lote Descrição 27','2025-06-20'),(79,'Lote Descrição 17','2025-04-07'),(80,'Lote Descrição 7','2025-01-29'),(81,'Lote Descrição 98','2025-10-04'),(82,'Lote Descrição 88','2025-09-19'),(83,'Lote Descrição 78','2025-06-20'),(84,'Lote Descrição 68','2025-05-08'),(85,'Lote Descrição 58','2025-07-01'),(86,'Lote Descrição 48','2025-08-09'),(87,'Lote Descrição 38','2025-09-09'),(88,'Lote Descrição 28','2025-10-15'),(89,'Lote Descrição 18','2025-01-11'),(90,'Lote Descrição 8','2024-12-10'),(91,'Lote Descrição 99','2025-10-11'),(92,'Lote Descrição 89','2025-03-22'),(93,'Lote Descrição 79','2024-12-08'),(94,'Lote Descrição 69','2025-03-03'),(95,'Lote Descrição 59','2025-03-14'),(96,'Lote Descrição 49','2025-08-22'),(97,'Lote Descrição 39','2025-10-09'),(98,'Lote Descrição 29','2025-02-03'),(99,'Lote Descrição 19','2025-04-20'),(100,'Lote Descrição 9','2025-05-23');
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-04 13:49:07
