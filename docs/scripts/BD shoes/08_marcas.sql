DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `marcacod` bigint NOT NULL AUTO_INCREMENT,
  `nombremarca` varchar(50) NOT NULL,
  PRIMARY KEY (`marcacod`),
  UNIQUE KEY `unique_nombremarca` (`nombremarca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Adidas'),(2,'Nike'),(3,'Puma');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;