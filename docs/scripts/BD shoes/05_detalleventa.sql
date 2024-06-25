DROP TABLE IF EXISTS `detalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleventa` (
  `detallecod` bigint NOT NULL AUTO_INCREMENT,
  `ventacod` bigint NOT NULL,
  `talla_zapatocod` bigint NOT NULL,
  `cantidad` int NOT NULL,
  `precioUnit` float NOT NULL,
  PRIMARY KEY (`detallecod`),
  KEY `ventacod` (`ventacod`),
  KEY `talla_zapatocod` (`talla_zapatocod`),
  CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`ventacod`) REFERENCES `ventas` (`ventacod`),
  CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`talla_zapatocod`) REFERENCES `tallas_zapatos` (`talla_zapatocod`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventa`
--

LOCK TABLES `detalleventa` WRITE;
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
INSERT INTO `detalleventa` VALUES (1,1,23,1,55),(2,1,88,1,50),(3,2,48,1,45),(4,3,15,2,45),(5,3,41,1,35),(6,4,9,1,60),(7,4,88,2,50);
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;
UNLOCK TABLES;