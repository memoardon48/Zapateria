DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `ventacod` bigint NOT NULL AUTO_INCREMENT,
  `usercod` bigint NOT NULL,
  `fechaventa` datetime DEFAULT CURRENT_TIMESTAMP,
  `isv` float NOT NULL,
  `cantidadBruta` float NOT NULL,
  `comisionPayPal` float NOT NULL,
  `cantidadNeta` float NOT NULL,
  `amount` float DEFAULT NULL,
  PRIMARY KEY (`ventacod`),
  KEY `usercod` (`usercod`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,4,'2023-04-19 02:57:09',15.75,120.75,4.7,120.75,105),(2,4,'2023-04-19 21:26:05',6.75,51.75,2.3,49.45,45),(3,4,'2023-04-20 11:07:32',18.75,143.75,5.51,138.24,125),(4,4,'2023-04-20 11:58:49',24,184,6.91,177.09,160);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;