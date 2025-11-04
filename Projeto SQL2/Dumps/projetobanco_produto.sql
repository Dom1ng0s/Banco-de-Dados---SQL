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
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `ID_Produto` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Funcao` varchar(100) DEFAULT NULL COMMENT 'Ex: "Vacina", "Ração", "Material de Cerca"',
  `Preco` decimal(10,2) DEFAULT NULL,
  `Quantidade_Estoque` int DEFAULT '0',
  PRIMARY KEY (`ID_Produto`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Produto 90','Vacina',111.86,427),(2,'Produto 80','Medicamento',45.24,305),(3,'Produto 70','Material de Cerca',62.78,462),(4,'Produto 60','Vacina',95.66,39),(5,'Produto 50','Medicamento',112.51,89),(6,'Produto 40','Material de Cerca',136.71,343),(7,'Produto 30','Vacina',144.97,219),(8,'Produto 20','Medicamento',83.94,74),(9,'Produto 10','Material de Cerca',50.18,445),(10,'Produto 0','Vacina',107.99,296),(11,'Produto 91','Material de Cerca',10.09,113),(12,'Produto 81','Vacina',29.76,489),(13,'Produto 71','Medicamento',84.73,277),(14,'Produto 61','Material de Cerca',52.05,368),(15,'Produto 51','Vacina',136.41,1),(16,'Produto 41','Medicamento',83.25,215),(17,'Produto 31','Material de Cerca',114.07,86),(18,'Produto 21','Vacina',128.15,208),(19,'Produto 11','Medicamento',118.26,178),(20,'Produto 1','Material de Cerca',103.62,23),(21,'Produto 92','Medicamento',64.35,335),(22,'Produto 82','Material de Cerca',50.14,162),(23,'Produto 72','Vacina',133.42,69),(24,'Produto 62','Medicamento',43.78,354),(25,'Produto 52','Material de Cerca',141.03,119),(26,'Produto 42','Vacina',95.52,68),(27,'Produto 32','Medicamento',155.68,223),(28,'Produto 22','Material de Cerca',58.25,133),(29,'Produto 12','Vacina',65.54,25),(30,'Produto 2','Medicamento',31.13,276),(31,'Produto 93','Vacina',61.51,28),(32,'Produto 83','Medicamento',48.56,56),(33,'Produto 73','Material de Cerca',129.11,315),(34,'Produto 63','Vacina',126.11,488),(35,'Produto 53','Medicamento',94.00,435),(36,'Produto 43','Material de Cerca',111.02,377),(37,'Produto 33','Vacina',123.30,255),(38,'Produto 23','Medicamento',53.65,460),(39,'Produto 13','Material de Cerca',119.61,445),(40,'Produto 3','Vacina',49.73,325),(41,'Produto 94','Material de Cerca',78.38,164),(42,'Produto 84','Vacina',51.57,199),(43,'Produto 74','Medicamento',34.45,309),(44,'Produto 64','Material de Cerca',100.40,79),(45,'Produto 54','Vacina',157.54,221),(46,'Produto 44','Medicamento',49.65,496),(47,'Produto 34','Material de Cerca',35.43,435),(48,'Produto 24','Vacina',136.37,300),(49,'Produto 14','Medicamento',82.16,300),(50,'Produto 4','Material de Cerca',93.77,495),(51,'Produto 95','Medicamento',52.09,214),(52,'Produto 85','Material de Cerca',55.87,120),(53,'Produto 75','Vacina',52.62,349),(54,'Produto 65','Medicamento',107.00,66),(55,'Produto 55','Material de Cerca',119.42,122),(56,'Produto 45','Vacina',15.99,231),(57,'Produto 35','Medicamento',39.06,290),(58,'Produto 25','Material de Cerca',58.30,434),(59,'Produto 15','Vacina',66.18,134),(60,'Produto 5','Medicamento',42.61,141),(61,'Produto 96','Vacina',123.94,475),(62,'Produto 86','Medicamento',81.43,264),(63,'Produto 76','Material de Cerca',41.75,237),(64,'Produto 66','Vacina',120.32,127),(65,'Produto 56','Medicamento',20.27,288),(66,'Produto 46','Material de Cerca',112.35,339),(67,'Produto 36','Vacina',62.13,350),(68,'Produto 26','Medicamento',79.44,105),(69,'Produto 16','Material de Cerca',110.08,351),(70,'Produto 6','Vacina',86.63,223),(71,'Produto 97','Material de Cerca',115.24,83),(72,'Produto 87','Vacina',119.88,80),(73,'Produto 77','Medicamento',100.49,267),(74,'Produto 67','Material de Cerca',140.42,369),(75,'Produto 57','Vacina',23.59,116),(76,'Produto 47','Medicamento',144.42,389),(77,'Produto 37','Material de Cerca',41.73,358),(78,'Produto 27','Vacina',153.05,307),(79,'Produto 17','Medicamento',42.29,115),(80,'Produto 7','Material de Cerca',86.17,423),(81,'Produto 98','Medicamento',116.53,5),(82,'Produto 88','Material de Cerca',148.53,292),(83,'Produto 78','Vacina',33.24,9),(84,'Produto 68','Medicamento',104.79,50),(85,'Produto 58','Material de Cerca',101.78,377),(86,'Produto 48','Vacina',150.83,214),(87,'Produto 38','Medicamento',59.72,184),(88,'Produto 28','Material de Cerca',137.26,68),(89,'Produto 18','Vacina',30.38,135),(90,'Produto 8','Medicamento',151.94,459),(91,'Produto 99','Vacina',123.35,10),(92,'Produto 89','Medicamento',136.15,70),(93,'Produto 79','Material de Cerca',36.75,235),(94,'Produto 69','Vacina',132.92,342),(95,'Produto 59','Medicamento',154.70,384),(96,'Produto 49','Material de Cerca',152.98,228),(97,'Produto 39','Vacina',74.33,385),(98,'Produto 29','Medicamento',95.38,266),(99,'Produto 19','Material de Cerca',153.32,89),(100,'Produto 9','Vacina',14.74,309);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
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
