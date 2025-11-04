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
-- Table structure for table `pasto`
--

DROP TABLE IF EXISTS `pasto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasto` (
  `ID_Pasto` int NOT NULL AUTO_INCREMENT,
  `Nome_Pasto` varchar(100) NOT NULL,
  `Tamanho` decimal(10,2) DEFAULT NULL COMMENT 'Ex: em hectares',
  `Situacao_Cerca` varchar(50) DEFAULT NULL COMMENT 'Ex: "Boa", "Requer Manutenção"',
  PRIMARY KEY (`ID_Pasto`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasto`
--

LOCK TABLES `pasto` WRITE;
/*!40000 ALTER TABLE `pasto` DISABLE KEYS */;
INSERT INTO `pasto` VALUES (1,'Pasto 90',112.81,'Boa'),(2,'Pasto 80',129.19,'Ruim'),(3,'Pasto 70',57.50,'Requer Manutenção'),(4,'Pasto 60',149.95,'Boa'),(5,'Pasto 50',127.26,'Ruim'),(6,'Pasto 40',136.42,'Requer Manutenção'),(7,'Pasto 30',50.35,'Boa'),(8,'Pasto 20',92.47,'Ruim'),(9,'Pasto 10',61.29,'Requer Manutenção'),(10,'Pasto 0',79.03,'Boa'),(11,'Pasto 91',61.31,'Requer Manutenção'),(12,'Pasto 81',119.45,'Boa'),(13,'Pasto 71',63.32,'Ruim'),(14,'Pasto 61',108.25,'Requer Manutenção'),(15,'Pasto 51',101.28,'Boa'),(16,'Pasto 41',131.67,'Ruim'),(17,'Pasto 31',104.51,'Requer Manutenção'),(18,'Pasto 21',77.52,'Boa'),(19,'Pasto 11',124.07,'Ruim'),(20,'Pasto 1',137.78,'Requer Manutenção'),(21,'Pasto 92',66.68,'Ruim'),(22,'Pasto 82',70.09,'Requer Manutenção'),(23,'Pasto 72',100.39,'Boa'),(24,'Pasto 62',141.71,'Ruim'),(25,'Pasto 52',57.35,'Requer Manutenção'),(26,'Pasto 42',111.64,'Boa'),(27,'Pasto 32',136.14,'Ruim'),(28,'Pasto 22',95.76,'Requer Manutenção'),(29,'Pasto 12',120.41,'Boa'),(30,'Pasto 2',64.77,'Ruim'),(31,'Pasto 93',112.62,'Boa'),(32,'Pasto 83',118.78,'Ruim'),(33,'Pasto 73',106.04,'Requer Manutenção'),(34,'Pasto 63',123.87,'Boa'),(35,'Pasto 53',51.21,'Ruim'),(36,'Pasto 43',134.45,'Requer Manutenção'),(37,'Pasto 33',68.61,'Boa'),(38,'Pasto 23',89.72,'Ruim'),(39,'Pasto 13',92.74,'Requer Manutenção'),(40,'Pasto 3',144.57,'Boa'),(41,'Pasto 94',94.61,'Requer Manutenção'),(42,'Pasto 84',89.35,'Boa'),(43,'Pasto 74',112.90,'Ruim'),(44,'Pasto 64',146.46,'Requer Manutenção'),(45,'Pasto 54',143.62,'Boa'),(46,'Pasto 44',128.69,'Ruim'),(47,'Pasto 34',62.58,'Requer Manutenção'),(48,'Pasto 24',76.86,'Boa'),(49,'Pasto 14',146.56,'Ruim'),(50,'Pasto 4',52.21,'Requer Manutenção'),(51,'Pasto 95',71.37,'Ruim'),(52,'Pasto 85',50.21,'Requer Manutenção'),(53,'Pasto 75',86.94,'Boa'),(54,'Pasto 65',134.07,'Ruim'),(55,'Pasto 55',59.52,'Requer Manutenção'),(56,'Pasto 45',145.40,'Boa'),(57,'Pasto 35',98.44,'Ruim'),(58,'Pasto 25',106.02,'Requer Manutenção'),(59,'Pasto 15',84.76,'Boa'),(60,'Pasto 5',55.72,'Ruim'),(61,'Pasto 96',74.35,'Boa'),(62,'Pasto 86',54.59,'Ruim'),(63,'Pasto 76',99.90,'Requer Manutenção'),(64,'Pasto 66',85.74,'Boa'),(65,'Pasto 56',79.00,'Ruim'),(66,'Pasto 46',87.76,'Requer Manutenção'),(67,'Pasto 36',51.81,'Boa'),(68,'Pasto 26',145.78,'Ruim'),(69,'Pasto 16',123.48,'Requer Manutenção'),(70,'Pasto 6',130.04,'Boa'),(71,'Pasto 97',129.77,'Requer Manutenção'),(72,'Pasto 87',108.73,'Boa'),(73,'Pasto 77',104.35,'Ruim'),(74,'Pasto 67',145.57,'Requer Manutenção'),(75,'Pasto 57',64.78,'Boa'),(76,'Pasto 47',137.19,'Ruim'),(77,'Pasto 37',141.62,'Requer Manutenção'),(78,'Pasto 27',146.51,'Boa'),(79,'Pasto 17',57.70,'Ruim'),(80,'Pasto 7',98.97,'Requer Manutenção'),(81,'Pasto 98',71.77,'Ruim'),(82,'Pasto 88',111.92,'Requer Manutenção'),(83,'Pasto 78',94.30,'Boa'),(84,'Pasto 68',85.75,'Ruim'),(85,'Pasto 58',95.85,'Requer Manutenção'),(86,'Pasto 48',71.99,'Boa'),(87,'Pasto 38',122.38,'Ruim'),(88,'Pasto 28',145.96,'Requer Manutenção'),(89,'Pasto 18',112.63,'Boa'),(90,'Pasto 8',75.29,'Ruim'),(91,'Pasto 99',88.56,'Boa'),(92,'Pasto 89',66.92,'Ruim'),(93,'Pasto 79',118.93,'Requer Manutenção'),(94,'Pasto 69',143.89,'Boa'),(95,'Pasto 59',112.64,'Ruim'),(96,'Pasto 49',81.55,'Requer Manutenção'),(97,'Pasto 39',119.83,'Boa'),(98,'Pasto 29',104.49,'Ruim'),(99,'Pasto 19',112.97,'Requer Manutenção'),(100,'Pasto 9',101.36,'Boa');
/*!40000 ALTER TABLE `pasto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-04 13:49:08
