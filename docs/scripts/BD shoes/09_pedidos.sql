DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `pedidocod` bigint NOT NULL AUTO_INCREMENT,
  `ventacod` bigint NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `ciudad` varchar(60) NOT NULL,
  `estado` varchar(60) NOT NULL,
  `pais` varchar(60) NOT NULL,
  `telefonoCont` varchar(15) NOT NULL,
  `pedidoest` char(4) DEFAULT 'PEND',
  PRIMARY KEY (`pedidocod`),
  KEY `ventacod` (`ventacod`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ventacod`) REFERENCES `ventas` (`ventacod`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'Honduras','Tegucigalpa','Francisco Morazán','Honduras','33445566','DONE'),(2,2,'Honduras','Tegucigalpa','Francisco Morazan','Honduras','33896745','DONE'),(3,3,'Honduras','Tegucigalpa','Francisco Morazan','Honduras','33778844','DONE'),(4,4,'Honduras','Tegucigalpa','Francisco Morazan','Honduras','33778844','PEND');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;
