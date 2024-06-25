DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usercod` bigint NOT NULL AUTO_INCREMENT,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
  PRIMARY KEY (`usercod`),
  UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (4,'agarciagomez13@gmail.com','John Doe','$2y$10$ycgauE.203eElkcoMUN9cub1k8iP4wz24ZyJCveB8XLtgfJUmLgRG','2023-03-28 11:38:07','ACT','2023-06-26 00:00:00','ACT','45b31666d5e88446c660b96c1b3a63cdf5b4a5b831cb324d6fc96a3ba2c61a63','2023-03-28 11:38:07','PBL'),(6,'kevin@gmail.com','John Doe','$2y$10$9p.XpmnLENFHtztawXgoa.de4.fNtfu6A99qijznIjIkcT1T1D6fy','2023-03-29 01:11:49','ACT','2023-06-27 00:00:00','ACT','c09f62aa99988d3bfc4fa381257d3680ca221fa55f3f5c136105273ed6bb2486','2023-03-29 01:11:49','ADM');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
