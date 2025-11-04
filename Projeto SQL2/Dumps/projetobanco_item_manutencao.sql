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
-- Table structure for table `item_manutencao`
--

DROP TABLE IF EXISTS `item_manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_manutencao` (
  `ID_Manutencao` int NOT NULL,
  `ID_Produto` int NOT NULL,
  `Quantidade_Usada` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Manutencao`,`ID_Produto`),
  KEY `ID_Produto` (`ID_Produto`),
  CONSTRAINT `item_manutencao_ibfk_1` FOREIGN KEY (`ID_Manutencao`) REFERENCES `manutencao` (`ID_Manutencao`) ON DELETE CASCADE,
  CONSTRAINT `item_manutencao_ibfk_2` FOREIGN KEY (`ID_Produto`) REFERENCES `produto` (`ID_Produto`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_manutencao`
--

LOCK TABLES `item_manutencao` WRITE;
/*!40000 ALTER TABLE `item_manutencao` DISABLE KEYS */;
INSERT INTO `item_manutencao` VALUES (1,36,4),(1,39,7),(2,33,5),(2,41,4),(3,41,10),(4,22,9),(5,74,5),(5,88,9),(6,25,7),(7,28,1),(7,74,6),(8,66,9),(9,85,5),(10,66,10),(11,11,5),(12,3,2),(13,50,3),(13,93,5),(14,25,7),(15,25,3),(16,36,1),(16,58,7),(17,41,3),(17,88,5),(18,11,5),(19,3,4),(19,52,3),(20,25,4),(21,85,6),(22,28,2),(22,33,3),(23,80,6),(24,20,9),(24,25,1),(25,55,1),(25,74,10),(26,47,3),(26,66,2),(27,28,4),(27,44,3),(28,36,7),(29,66,8),(29,96,4),(30,22,5),(31,80,10),(32,20,1),(32,85,3),(33,9,4),(34,44,2),(35,69,7),(36,25,9),(37,11,1),(38,25,4),(39,55,1),(39,93,3),(40,82,3),(41,99,2),(42,44,1),(42,47,5),(43,20,8),(43,80,2),(44,66,6),(44,96,1),(45,85,2),(45,93,10),(46,33,1),(47,36,1),(48,22,3),(49,66,8),(50,69,1),(50,85,4),(51,11,5),(51,93,5),(52,96,5),(53,11,2),(53,74,5),(54,33,8),(54,69,5),(55,36,9),(56,88,4),(57,44,4),(57,47,2),(58,25,3),(58,39,3),(59,93,3),(60,33,9),(61,77,3),(61,88,1),(62,71,1),(62,96,8),(63,44,5),(63,99,2),(64,25,3),(65,80,6),(66,22,7),(66,28,1),(67,41,3),(67,63,10),(68,20,7),(69,74,1),(70,74,5),(70,85,4),(71,47,3),(71,66,1),(72,36,10),(73,58,2),(73,82,4),(74,14,9),(74,55,4),(75,20,7),(76,74,1),(76,88,2),(77,25,2),(78,52,6),(79,66,10),(79,82,3),(80,11,2),(80,36,1),(81,14,6),(82,50,1),(82,80,10),(83,9,5),(83,80,5),(84,50,4),(84,93,9),(85,58,5),(86,58,3),(86,82,10),(87,14,4),(87,17,2),(88,22,5),(89,28,4),(89,50,3),(90,11,5),(90,44,1),(91,14,2),(91,71,8),(92,33,8),(93,58,5),(93,85,5),(94,77,10),(95,3,2),(95,63,8),(96,55,9),(96,77,4),(97,41,9),(98,82,4),(99,22,7),(100,58,6);
/*!40000 ALTER TABLE `item_manutencao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-04 13:49:06
