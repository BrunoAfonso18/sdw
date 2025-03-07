-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.30

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
  `Customer_ID` int NOT NULL,
  `Customer_type` varchar(255) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `Nipost` varchar(255) NOT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Member','Female','Lagos','Lagos Mainland: 101233'),(2,'Member','Female','Lagos','Lagos Island: 101245'),(3,'Member','Female','Lagos','Victoria Island: 101241'),(4,'Member','Female','Lagos','Ikeja: 100271'),(5,'Member','Female','Lagos','Lekki: 105102'),(6,'Member','Female','Lagos','Ajah: 105103'),(7,'Member','Female','Lagos','Ikeja GRA: 100271'),(8,'Member','Female','Lagos','Surulere: 101283'),(9,'Normal','Female','Lagos','Lagos Mainland: 101233'),(10,'Normal','Female','Lagos','Lagos Island: 101245'),(11,'Normal','Female','Lagos','Victoria Island: 101241'),(12,'Normal','Female','Lagos','Ikeja: 100271'),(13,'Normal','Female','Lagos','Lekki: 105102'),(14,'Normal','Female','Lagos','Ajah: 105103'),(15,'Normal','Female','Lagos','Ikeja GRA: 100271'),(16,'Normal','Female','Lagos','Surulere: 101283'),(17,'Member','male','Lagos','Lagos Mainland: 101233'),(18,'Member','male','Lagos','Lagos Island: 101245'),(19,'Member','male','Lagos','Victoria Island: 101241'),(20,'Member','male','Lagos','Ikeja: 100271'),(21,'Member','male','Lagos','Lekki: 105102'),(22,'Member','male','Lagos','Ajah: 105103'),(23,'Member','male','Lagos','Ikeja GRA: 100271'),(24,'Member','male','Lagos','Surulere: 101283'),(25,'Normal','male','Lagos','Lagos Mainland: 101233'),(26,'Normal','male','Lagos','Lagos Island: 101245'),(27,'Normal','male','Lagos','Victoria Island: 101241'),(28,'Normal','male','Lagos','Ikeja: 100271'),(29,'Normal','male','Lagos','Lekki: 105102'),(30,'Normal','male','Lagos','Ajah: 105103'),(31,'Normal','male','Lagos','Ikeja GRA: 100271'),(32,'Normal','male','Lagos','Surulere: 101283');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-21  0:44:53
