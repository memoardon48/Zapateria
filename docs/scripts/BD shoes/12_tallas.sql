DROP TABLE IF EXISTS `tallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tallas` (
  `tallacod` bigint NOT NULL AUTO_INCREMENT,
  `descripciontalla` varchar(50) NOT NULL,
  PRIMARY KEY (`tallacod`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tallas`
--

LOCK TABLES `tallas` WRITE;
/*!40000 ALTER TABLE `tallas` DISABLE KEYS */;
INSERT INTO `tallas` VALUES (1,'4'),(2,'4.5'),(3,'5'),(4,'5.5'),(5,'6'),(6,'6.5'),(7,'7'),(8,'7.5'),(9,'8'),(10,'8.5'),(11,'9'),(12,'9.5'),(13,'10'),(14,'10.5'),(15,'11');
/*!40000 ALTER TABLE `tallas` ENABLE KEYS */;
UNLOCK TABLES;
