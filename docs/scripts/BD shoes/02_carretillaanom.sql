DROP TABLE IF EXISTS `carretillaanon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carretillaanon` (
  `anoncod` varchar(128) NOT NULL,
  `talla_zapatocod` bigint NOT NULL,
  `crrctd` int NOT NULL,
  `crrprc` decimal(12,2) NOT NULL,
  `crrfching` datetime NOT NULL,
  PRIMARY KEY (`anoncod`,`talla_zapatocod`),
  KEY `talla_zapatocod_idx` (`talla_zapatocod`),
  CONSTRAINT `carretillaanon_prd_key` FOREIGN KEY (`talla_zapatocod`) REFERENCES `tallas_zapatos` (`talla_zapatocod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carretillaanon`
--

LOCK TABLES `carretillaanon` WRITE;
/*!40000 ALTER TABLE `carretillaanon` DISABLE KEYS */;
/*!40000 ALTER TABLE `carretillaanon` ENABLE KEYS */;
UNLOCK TABLES;