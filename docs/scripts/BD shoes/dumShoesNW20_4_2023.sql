CREATE DATABASE  IF NOT EXISTS `shoesnw` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shoesnw`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: shoesnw
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
-- Table structure for table `carretilla`
--

DROP TABLE IF EXISTS `carretilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carretilla` (
  `usercod` bigint NOT NULL,
  `talla_zapatocod` bigint NOT NULL,
  `crrctd` int NOT NULL,
  `crrprc` decimal(12,2) NOT NULL,
  `crrfching` datetime NOT NULL,
  PRIMARY KEY (`usercod`,`talla_zapatocod`),
  KEY `talla_zapatocod_idx` (`talla_zapatocod`),
  CONSTRAINT `carretilla_prd_key` FOREIGN KEY (`talla_zapatocod`) REFERENCES `tallas_zapatos` (`talla_zapatocod`),
  CONSTRAINT `carretilla_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carretilla`
--

LOCK TABLES `carretilla` WRITE;
/*!40000 ALTER TABLE `carretilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `carretilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carretillaanon`
--

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

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `clientcod` bigint NOT NULL AUTO_INCREMENT,
  `clientname` varchar(128) DEFAULT NULL,
  `clientgender` char(3) DEFAULT NULL,
  `clientphone1` varchar(255) DEFAULT NULL,
  `clientemail` varchar(255) DEFAULT NULL,
  `clientstatus` char(3) DEFAULT NULL,
  `clientdatecrt` datetime DEFAULT NULL,
  `clientusercreates` bigint DEFAULT NULL,
  PRIMARY KEY (`clientcod`),
  UNIQUE KEY `unique_clientname` (`clientname`),
  UNIQUE KEY `unique_clientemail` (`clientemail`),
  UNIQUE KEY `unique_clientphone1` (`clientphone1`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Denisse Garcia','F','33786545','agarciagomez13@gmail.com','ACT','2023-04-18 15:12:35',4);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `departamentocod` bigint NOT NULL AUTO_INCREMENT,
  `nombredepartamento` varchar(50) NOT NULL,
  PRIMARY KEY (`departamentocod`),
  UNIQUE KEY `unique_nombredepartamento` (`nombredepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Caballeros'),(2,'Damas'),(3,'Niños');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleventa`
--

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

--
-- Table structure for table `funciones`
--

DROP TABLE IF EXISTS `funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(45) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL,
  PRIMARY KEY (`fncod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones`
--

LOCK TABLES `funciones` WRITE;
/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
INSERT INTO `funciones` VALUES ('Controllers\\Admin\\Admin','Controllers\\Admin\\Admin','ACT','CTR'),('Controllers\\Mnt\\Departamento','Controllers\\Mnt\\Departamento','ACT','CTR'),('Controllers\\Mnt\\Departamentos','Controllers\\Mnt\\Departamentos','ACT','CTR'),('Controllers\\Mnt\\DetallesVentas','Controllers\\Mnt\\DetallesVentas','ACT','CTR'),('Controllers\\Mnt\\Funcion','Controllers\\Mnt\\Funcion','ACT','CTR'),('Controllers\\Mnt\\Funciones','Controllers\\Mnt\\Funciones','ACT','CTR'),('Controllers\\Mnt\\FuncionesRoles','Controllers\\Mnt\\FuncionesRoles','ACT','CTR'),('Controllers\\Mnt\\FuncionRol','Controllers\\Mnt\\FuncionRol','ACT','CTR'),('Controllers\\Mnt\\Marca','Controllers\\Mnt\\Marca','ACT','CTR'),('Controllers\\Mnt\\Marcas','Controllers\\Mnt\\Marcas','ACT','CTR'),('Controllers\\Mnt\\Pedidos','Controllers\\Mnt\\Pedidos','ACT','CTR'),('Controllers\\Mnt\\Rol','Controllers\\Mnt\\Rol','ACT','CTR'),('Controllers\\Mnt\\Roles','Controllers\\Mnt\\Roles','ACT','CTR'),('Controllers\\Mnt\\RolesUsuario','Controllers\\Mnt\\RolesUsuario','ACT','CTR'),('Controllers\\Mnt\\RolesUsuarios','Controllers\\Mnt\\RolesUsuarios','ACT','CTR'),('Controllers\\Mnt\\Talla','Controllers\\Mnt\\Talla','ACT','CTR'),('Controllers\\Mnt\\Tallas','Controllers\\Mnt\\Tallas','ACT','CTR'),('Controllers\\Mnt\\Usuario','Controllers\\Mnt\\Usuario','ACT','CTR'),('Controllers\\Mnt\\Usuarios','Controllers\\Mnt\\Usuarios','ACT','CTR'),('Controllers\\Mnt\\Ventas','Controllers\\Mnt\\Ventas','ACT','CTR'),('Controllers\\Mnt\\Zapato','Controllers\\Mnt\\Zapato','ACT','CTR'),('Controllers\\Mnt\\Zapatos','Controllers\\Mnt\\Zapatos','ACT','CTR'),('Menu_MntCategorias','Menu_MntCategorias','ACT','CTR'),('Menu_MntDepartamentos','Menu_MntDepartamentos','ACT','CTR'),('Menu_MntFunciones','Menu_MntFunciones','ACT','CTR'),('Menu_MntFuncionesRoles','Menu_MntFuncionesRoles','ACT','CTR'),('Menu_MntHistorialTransacciones','Menu_MntHistorialTransacciones','ACT','CTR'),('Menu_MntMarcas','Menu_MntMarcas','ACT','CTR'),('Menu_MntPedidos','Menu_MntPedidos','ACT','CTR'),('Menu_MntQuotes','Menu_MntQuotes','ACT','CTR'),('Menu_MntRoles','Menu_MntRoles','ACT','CTR'),('Menu_MntRolesUsuarios','Menu_MntRolesUsuarios','ACT','CTR'),('Menu_MntTallas','Menu_MntTallas','ACT','CTR'),('Menu_MntUsuarios','Menu_MntUsuarios','ACT','CTR'),('Menu_MntZapatos','Menu_MntZapatos','ACT','CTR'),('Menu_PaymentCheckout','Menu_PaymentCheckout','ACT','CTR'),('Menu_Perfil','Menu_Perfil','ACT','CTR'),('mnt_departamentos_delete','mnt_departamentos_delete','ACT','CTR'),('mnt_departamentos_edit','mnt_departamentos_edit','ACT','CTR'),('mnt_departamentos_new','mnt_departamentos_new','ACT','CTR'),('mnt_departamentos_view','mnt_departamentos_view','ACT','CTR'),('mnt_funcionesroles_delete','mnt_funcionesroles_delete','ACT','CTR'),('mnt_funcionesroles_edit','mnt_funcionesroles_edit','ACT','CTR'),('mnt_funcionesroles_new','mnt_funcionesroles_new','ACT','CTR'),('mnt_funcionesroles_view','mnt_funcionesroles_view','ACT','CTR'),('mnt_funciones_delete','mnt_funciones_delete','ACT','CTR'),('mnt_funciones_edit','mnt_funciones_edit','ACT','CTR'),('mnt_funciones_new','mnt_funciones_new','ACT','CTR'),('mnt_funciones_view','mnt_funciones_view','ACT','CTR'),('mnt_marcas_delete','mnt_marcas_delete','ACT','CTR'),('mnt_marcas_edit','mnt_marcas_edit','ACT','CTR'),('mnt_marcas_new','mnt_marcas_new','ACT','CTR'),('mnt_marcas_view','mnt_marcas_view','ACT','CTR'),('mnt_pedidos_view','mnt_pedidos_view','ACT','CTR'),('mnt_pedido_change','mnt_pedido_change','ACT','CTR'),('mnt_rolesUsuarios_delete','mnt_rolesUsuarios_delete','ACT','CTR'),('mnt_rolesUsuarios_edit','mnt_rolesUsuarios_edit','ACT','CTR'),('mnt_rolesUsuarios_new','mnt_rolesUsuarios_new','ACT','CTR'),('mnt_rolesUsuarios_view','mnt_rolesUsuarios_view','ACT','CTR'),('mnt_roles_delete','mnt_roles_delete','ACT','CTR'),('mnt_roles_edit','mnt_roles_edit','ACT','CTR'),('mnt_roles_new','mnt_roles_new','ACT','CTR'),('mnt_roles_view','mnt_roles_view','ACT','CTR'),('mnt_tallas_delete','mnt_tallas_delete','ACT','CTR'),('mnt_tallas_edit','mnt_tallas_edit','ACT','CTR'),('mnt_tallas_new','mnt_tallas_new','ACT','CTR'),('mnt_tallas_view','mnt_tallas_view','ACT','CTR'),('mnt_usuarios_delete','mnt_usuarios_delete','ACT','CTR'),('mnt_usuarios_edit','mnt_usuarios_edit','ACT','CTR'),('mnt_usuarios_new','mnt_usuarios_new','ACT','CTR'),('mnt_usuarios_view','mnt_usuarios_view','ACT','CTR'),('mnt_ventas_view','mnt_ventas_view','ACT','CTR'),('mnt_zapatos_delete','mnt_zapatos_delete','ACT','CTR'),('mnt_zapatos_edit','mnt_zapatos_edit','ACT','CTR'),('mnt_zapatos_new','mnt_zapatos_new','ACT','CTR'),('mnt_zapatos_view','mnt_zapatos_view','ACT','CTR');
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funciones_roles`
--

DROP TABLE IF EXISTS `funciones_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funciones_roles` (
  `rolescod` varchar(15) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL,
  PRIMARY KEY (`rolescod`,`fncod`),
  KEY `rol_funcion_key_idx` (`fncod`),
  CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`),
  CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones_roles`
--

LOCK TABLES `funciones_roles` WRITE;
/*!40000 ALTER TABLE `funciones_roles` DISABLE KEYS */;
INSERT INTO `funciones_roles` VALUES ('ADMIN','Controllers\\Admin\\Admin','ACT','2022-04-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Departamento','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Departamentos','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\DetallesVentas','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Funcion','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Funciones','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\FuncionesRoles','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\FuncionRol','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Marca','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Marcas','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Pedidos','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Rol','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Roles','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\RolesUsuario','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\RolesUsuarios','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Talla','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Tallas','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Usuario','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Usuarios','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Ventas','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Zapato','ACT','2022-06-23 00:00:00'),('ADMIN','Controllers\\Mnt\\Zapatos','ACT','2022-06-23 00:00:00'),('ADMIN','Menu_MntDepartamentos','ACT','2022-06-23 00:00:00'),('ADMIN','Menu_MntFunciones','ACT','2022-06-23 00:00:00'),('ADMIN','Menu_MntFuncionesRoles','ACT','2022-06-23 00:00:00'),('ADMIN','Menu_MntHistorialTransacciones','ACT','2023-05-06 00:00:00'),('ADMIN','Menu_MntMarcas','ACT','2022-06-23 00:00:00'),('ADMIN','Menu_MntPedidos','ACT','2022-06-23 00:00:00'),('ADMIN','Menu_MntRoles','ACT','2022-06-23 00:00:00'),('ADMIN','Menu_MntRolesUsuarios','ACT','2022-06-23 00:00:00'),('ADMIN','Menu_MntTallas','ACT','2022-06-23 00:00:00'),('ADMIN','Menu_MntUsuarios','ACT','2022-06-23 00:00:00'),('ADMIN','Menu_MntZapatos','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_departamentos_delete','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_departamentos_edit','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_departamentos_new','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_departamentos_view','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_funcionesroles_delete','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_funcionesroles_edit','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_funcionesroles_new','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_funcionesroles_view','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_funciones_delete','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_funciones_edit','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_funciones_new','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_funciones_view','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_marcas_delete','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_marcas_edit','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_marcas_new','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_marcas_view','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_pedido_change','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_rolesUsuarios_delete','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_rolesUsuarios_edit','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_rolesUsuarios_new','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_rolesUsuarios_view','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_roles_delete','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_roles_edit','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_roles_new','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_roles_view','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_tallas_delete','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_tallas_edit','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_tallas_new','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_tallas_view','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_usuarios_delete','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_usuarios_edit','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_usuarios_new','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_usuarios_view','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_ventas_view','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_zapatos_delete','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_zapatos_edit','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_zapatos_new','ACT','2022-06-23 00:00:00'),('ADMIN','mnt_zapatos_view','ACT','2023-04-28 00:00:00');
/*!40000 ALTER TABLE `funciones_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

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

--
-- Table structure for table `pedidos`
--

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

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `rolescod` varchar(15) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL,
  PRIMARY KEY (`rolescod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('ADMIN','administrador del sistema','ACT'),('CLIENTE','Cliente','ACT');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_usuarios` (
  `usercod` bigint NOT NULL,
  `rolescod` varchar(15) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL,
  PRIMARY KEY (`usercod`,`rolescod`),
  KEY `rol_usuario_key_idx` (`rolescod`),
  CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`),
  CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_usuarios`
--

LOCK TABLES `roles_usuarios` WRITE;
/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
INSERT INTO `roles_usuarios` VALUES (4,'CLIENTE','ACT','2023-04-20 08:10:21','2023-05-06 00:00:00'),(6,'ADMIN','ACT','2023-02-12 00:00:00','2023-04-29 00:00:00');
/*!40000 ALTER TABLE `roles_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tallas`
--

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

--
-- Table structure for table `tallas_zapatos`
--

DROP TABLE IF EXISTS `tallas_zapatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tallas_zapatos` (
  `talla_zapatocod` bigint NOT NULL AUTO_INCREMENT,
  `tallacod` bigint NOT NULL,
  `zapatocod` bigint NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`talla_zapatocod`),
  KEY `tallacod` (`tallacod`),
  KEY `zapatocod` (`zapatocod`),
  CONSTRAINT `tallas_zapatos_ibfk_1` FOREIGN KEY (`tallacod`) REFERENCES `tallas` (`tallacod`),
  CONSTRAINT `tallas_zapatos_ibfk_2` FOREIGN KEY (`zapatocod`) REFERENCES `zapatos` (`zapatocod`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tallas_zapatos`
--

LOCK TABLES `tallas_zapatos` WRITE;
/*!40000 ALTER TABLE `tallas_zapatos` DISABLE KEYS */;
INSERT INTO `tallas_zapatos` VALUES (1,1,1,50),(2,2,1,50),(3,3,1,50),(4,4,1,50),(5,5,1,50),(6,6,1,50),(7,7,1,50),(8,1,2,50),(9,2,2,49),(10,3,2,50),(11,4,2,50),(12,5,2,50),(13,6,2,50),(14,7,2,50),(15,1,13,48),(16,2,13,50),(17,3,13,50),(18,4,13,50),(19,5,13,50),(20,6,13,50),(21,7,13,50),(22,8,13,50),(23,7,3,50),(24,8,3,50),(25,9,3,50),(26,10,3,50),(27,11,3,50),(28,12,3,50),(29,15,4,50),(30,14,4,50),(31,13,4,50),(32,12,4,50),(33,11,4,50),(34,10,4,50),(35,7,5,50),(36,8,5,50),(37,9,5,50),(38,10,5,50),(39,11,5,50),(40,12,5,50),(41,9,6,49),(42,10,6,50),(43,11,6,50),(44,12,6,50),(45,13,6,50),(46,14,6,50),(47,15,6,50),(48,5,7,50),(49,6,7,50),(50,7,7,50),(51,8,7,50),(52,9,7,50),(53,10,7,50),(54,11,7,50),(55,12,7,50),(56,3,8,50),(57,4,8,50),(58,5,8,50),(59,6,8,50),(60,7,8,50),(61,10,8,50),(62,4,9,50),(63,6,9,50),(64,7,9,50),(65,5,9,50),(66,3,9,50),(67,7,10,50),(68,8,10,50),(69,9,10,50),(70,11,10,50),(71,2,11,50),(72,4,11,50),(73,9,11,50),(74,6,11,50),(75,10,11,50),(76,12,11,50),(77,1,12,50),(78,2,12,50),(79,9,12,50),(80,10,12,50),(81,11,12,50),(82,5,12,50),(83,5,13,50),(84,6,13,50),(85,7,13,50),(86,8,13,50),(87,9,13,50),(88,3,14,48),(89,4,14,50),(90,7,14,50),(91,6,14,50),(92,5,14,50),(93,10,15,50),(94,9,15,50),(95,5,15,50),(96,11,15,50),(97,12,15,50),(98,3,16,50),(99,4,16,50),(100,5,16,50),(101,8,16,50),(102,11,17,50),(103,10,17,50),(104,12,17,50),(105,5,17,50),(106,6,18,50),(107,7,18,50),(108,8,18,50),(109,11,18,50),(110,11,19,50),(111,10,19,50),(112,9,19,50),(113,7,19,50),(114,6,19,50),(115,9,20,50),(116,10,20,50),(117,11,20,50),(118,12,20,50),(119,13,20,50),(120,6,20,50),(121,7,21,50),(122,8,21,50),(123,9,21,50),(124,6,22,50),(125,5,22,50),(126,7,22,50),(127,8,22,50),(128,9,22,50),(129,9,23,50),(130,5,23,50),(131,4,23,50),(132,6,23,50),(133,8,23,50),(134,3,24,50),(135,4,24,50),(136,5,24,50),(137,6,24,50),(138,7,24,50),(139,8,25,50),(140,5,25,50),(141,3,25,50),(142,9,25,50),(143,10,25,50),(144,10,26,50),(145,11,26,50),(146,12,26,50),(147,13,26,50),(148,12,27,50),(149,13,27,50),(150,14,27,50),(151,15,27,50),(152,11,27,50),(153,6,28,50),(154,7,28,50),(155,8,28,50),(156,9,28,50),(157,10,28,50),(158,5,29,50),(159,6,29,50),(160,7,29,50),(161,8,29,50),(162,10,30,50),(163,9,30,50),(164,11,30,50),(165,12,30,50),(166,6,31,50),(167,8,31,50),(168,12,31,50),(169,15,32,50),(170,14,32,50),(171,11,32,50),(172,12,32,50),(173,13,32,50),(182,9,33,50),(183,10,33,50),(184,11,33,50),(185,12,33,50),(186,13,33,50),(187,8,34,50),(188,7,34,50),(189,6,34,50),(190,10,34,50),(191,13,34,50),(192,8,35,50),(193,9,35,50),(194,10,35,50),(195,11,35,50),(196,7,36,50),(197,8,36,50),(198,9,36,50),(199,10,37,50),(200,11,37,50),(201,15,37,50),(202,6,37,50),(203,9,38,50),(204,10,38,50),(205,11,38,50),(206,12,38,50),(207,7,39,50),(208,8,39,50),(209,8,40,50),(210,6,40,50),(211,7,40,50),(212,12,40,50),(213,13,40,50),(214,1,41,50),(215,2,41,50),(216,3,41,50),(217,4,41,50),(218,2,42,50),(219,3,42,50),(220,4,42,50),(221,5,42,50),(222,6,42,50),(223,1,43,50),(224,2,43,50),(225,3,43,50),(226,4,43,50),(227,5,43,50),(228,1,44,50),(229,2,44,50),(230,3,44,50),(231,4,44,50),(232,5,44,50),(233,1,45,50),(234,2,45,50),(235,3,45,50),(236,4,45,50),(237,5,45,50),(238,1,46,50),(239,2,46,50),(240,3,46,50),(241,4,46,50),(242,5,46,50),(243,6,47,50),(244,7,47,50),(245,1,47,50),(246,2,47,50),(247,3,47,50),(248,1,48,50),(249,2,48,50),(250,3,48,50),(251,4,48,50),(252,5,48,50),(253,6,49,50),(254,1,49,50),(255,2,49,50),(256,3,49,50),(257,4,49,50),(258,1,50,50),(259,2,50,50),(260,3,50,50),(261,4,50,50),(262,5,50,50),(263,2,51,50),(264,3,51,50),(265,4,51,50),(266,5,51,50),(267,6,51,50),(268,7,51,50),(269,1,52,50),(270,2,52,50),(271,3,52,50),(272,4,52,50),(273,1,53,50),(274,2,53,50),(275,3,53,50),(276,4,53,50),(277,5,53,50),(278,6,53,50),(279,2,54,50),(280,3,54,50),(281,4,54,50),(282,5,54,50),(283,1,55,50),(284,2,55,50),(285,3,55,50),(286,4,55,50),(287,5,55,50),(288,6,55,50),(289,7,55,50),(290,1,56,50),(291,2,56,50),(292,3,56,50),(293,4,56,50),(294,5,56,50),(295,1,57,50),(296,2,57,50),(297,3,57,50),(298,4,57,50),(299,5,57,50),(300,6,57,50),(301,1,58,50),(302,2,58,50),(303,3,58,50),(304,4,58,50),(305,5,58,50),(306,6,58,50),(307,7,58,50),(308,8,58,50);
/*!40000 ALTER TABLE `tallas_zapatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

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

--
-- Table structure for table `ventas`
--

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

--
-- Table structure for table `zapatos`
--

DROP TABLE IF EXISTS `zapatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zapatos` (
  `zapatocod` bigint NOT NULL AUTO_INCREMENT,
  `marcacod` bigint NOT NULL,
  `departamentocod` bigint NOT NULL,
  `precio` float NOT NULL,
  `zapatoest` char(3) DEFAULT 'ACT',
  `imagenzapato` varchar(255) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `detalles` varchar(255) DEFAULT NULL,
  `nombrezapato` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zapatocod`),
  KEY `marcacod` (`marcacod`),
  KEY `departamentocod` (`departamentocod`),
  CONSTRAINT `zapatos_ibfk_1` FOREIGN KEY (`marcacod`) REFERENCES `marcas` (`marcacod`),
  CONSTRAINT `zapatos_ibfk_3` FOREIGN KEY (`departamentocod`) REFERENCES `departamentos` (`departamentocod`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zapatos`
--

LOCK TABLES `zapatos` WRITE;
/*!40000 ALTER TABLE `zapatos` DISABLE KEYS */;
INSERT INTO `zapatos` VALUES (1,1,1,50,'ACT','1.jpg','Blanco-Rojo','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(2,1,1,60,'ACT','2.jpg','Gris-Negro','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Super star'),(3,1,1,55,'ACT','3.jpg','Negro-Blanco','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Fluffly ones'),(4,1,1,65,'ACT','4.jpg','Negro-Blanco','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(5,2,1,40,'ACT','5.jpg','Negro-Blanco-Rojo','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(6,2,1,35,'ACT','6.jpg','Negro-Rojo','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(7,2,1,45,'ACT','7.jpg','Negro','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(8,2,1,50,'ACT','8.jpg','Negro','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(9,3,1,60,'ACT','9.jpg','Negro-Verde-Azul','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(10,3,1,55,'ACT','10.jpg','Negro-Blanco','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(11,3,1,40,'ACT','11.jpg','Amarillo','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(12,3,1,45,'ACT','12.jpg','Negro-Blanco','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(13,1,2,45,'ACT','20.jpg','Rosado-Blanco','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Super fly'),(14,1,2,50,'ACT','21.jpg','Negro-Blanco','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Air jordan'),(15,1,2,65,'ACT','22.jpg','Rojo','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Air 98'),(16,1,2,70,'ACT','23.jpg','Blanco-Amarillo','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(17,2,2,30,'ACT','24.jpg','Rosado','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(18,2,2,40,'ACT','25.jpg','Gris','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(19,2,2,45,'ACT','26.jpg','Gris','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(20,2,2,50,'ACT','27.jpg','Beige','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(21,3,2,45,'ACT','28.jpg','Rosado','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(22,3,2,50,'ACT','29.jpg','Blanco','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(23,3,2,54,'ACT','30.jpg','Negro-Rosado','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(24,3,2,32,'ACT','31.jpg','Blanco','Stay cool and casual in the Cool Cat Sport slides. Featuring a comfortable textured foot bed andmolded EVA outsole, the Cool Cat Sport combines soft cushioning and classic style for every day.','Breathable knit upper, Slip-on sock collar, Extended lacing system for additional support and midsolelockdown, Soft, cushioned midsole, ','Tenis Adidas Rosado'),(25,1,1,50,'ACT','13.jpg','Negro-Gris','Zapatos a la Chuy','Great catch! This exclusive product is only available at adidas and can\'t be found anywhere else. This product is excluded from all promotional discounts and offers.','Nike casual'),(26,1,1,50,'ACT','14.jpg','Negro-Cafe','Zapatos que hasta Denisse usaria ','Great catch! This exclusive product is only available at adidas and can\'t be found anywhere else. This product is excluded from all promotional discounts and offers.','Nike casual'),(27,2,1,60,'ACT','15.jpg','Blanco-Gris','Relax n chill','Great catch! This exclusive product is only available at adidas and can\'t be found anywhere else. This product is excluded from all promotional discounts and offers.','Ultraboost'),(28,2,1,80,'ACT','16.jpg','Negro-beige','U wanna Run use this','Experience epic energy in every stride with the Ultraboost Light. ','Ultraboost'),(29,2,1,50,'ACT','17.jpg','Azul-verde','Whaat r doeees!','Experience epic energy in every stride with the Ultraboost Light. ','Ultraboost'),(30,3,1,20,'ACT','18.jpg','Nego-Blanco','Velooz como puma','The Deviate NITRO 2 – just like v1, only improved. It’s the max cushion, max performance running shoe that makes going faster even easier.','Pumas'),(31,3,1,50,'ACT','15.jpg','Amarillo','Visita fondo de bikini con este look ','Colaboracion de SpongeBob x Pumas ','Pumas'),(32,3,1,30,'ACT','16.jpg','Negro-blanco','Nices and sweets ','An all-in-one neutral running shoe for any distance, the Velocity NITRO 2 is a lightweight and sleek update to the Run PUMA roster.','Pumas'),(33,3,1,20,'ACT','16.jpg','Black','Los Black Panther ','Wakanda Forever, feel the power of the panther','Pumas'),(34,3,1,30,'ACT','16.jpg','Naranja','Juega como los grandes, Juega como Ney','Drive your opponents crazy and channel the power of one of soccers\'s greatest-ever players, Neymar Jr, with these FUTURE 2.4 soccer cleat','Pumas'),(35,1,2,30,'ACT','32.jpg','Blanco-gris','I\'m a Material Girl  ','This product is excluded from all promotional discounts and offers.','AdidasW'),(36,1,2,50,'ACT','33.jpg','Multicolor','Rise like a flower in the dawn',NULL,'AdidasW'),(37,2,2,62,'ACT','34.jpg','Negro-Blanco','La piel duradera aporta un toque clásico a estas zapatillas, al tiempo que los logotipos Swoosh bordados y los paneles laterales perforados añaden la cantidad perfecta de estilo para hacerte brillar.','Modelo: FJ4211-100','NikeW'),(38,2,2,60,'ACT','35.jpg','Negro-Dorado','Esta versión ofrece la misma reactividad y sujeción neutra que tanto te gusta, pero con más comodidad en las zonas sensibles del pie, como el puente y los dedos.','Con una pisada fluida para cualquier sesión de running, las Pegasus perfectas para ti vuelven para ayudarte a alcanzar tus objetivos.','NikeW'),(39,3,2,50,'ACT','36.jpg','Negro-Cafe','Catch eyes and make strides in the sleek and streamlined fit of the Star Vital Training Shoes','With a breathable knit upper, extended lacing system and soft, cushioned midsole, this training shoe will give you a smooth, comfortable feel with every step.','PumasYes'),(40,3,2,50,'ACT','37.jpg','lila','You thought Mayze made enough of a statement? ','The Mayze Stack Injex sandal takes it to a whole new level','Adidas'),(41,1,3,50,'ACT','38.jpg','Negro-Blanco','Que tu pequeño ande con flow','Plantillas suaves y alcochonados','Adidas'),(42,1,3,50,'ACT','39.jpg','Rosa-negro','Nuevo año nuevo look  para que tus pequeños estrenen','Zapper para una forma facil para ponerle los tennis a tus hijos','Adidas'),(43,1,3,50,'ACT','40.jpg','Blanco-estampados','Cool Sneaker for cool kids','zapatilla comodas para plantillas delicadas','adidas'),(44,1,3,40,'ACT','41.jpg','Rosado','Que tu mundo sea de rosa ','Zapatillas para plantillas delicadas','Adidas'),(45,1,3,50,'ACT','42.jpg','Negros-blancos','SuperStars para la estrella que llevas dentro ','Estillo y comodidad en un zapato','adidas'),(46,1,3,50,'ACT','43.jpg','Negro-Gris','Sneaker goof for you','Zapatilla resistentes para los chicos que le gusta lo extremo','adidas'),(47,2,3,40,'ACT','44.jpg','Rosado-Blanco ','A pinky promise for you ','Las Nike Air Max 270 GO están preparadas para que los más pequeños lo den todo. ','Adidas'),(48,2,3,40,'ACT','45.jpg','Negro-Blanco ','Is nike is cool ','Acercamos un diseño de los 90 a una nueva generación','NIke airmax'),(49,2,3,40,'ACT','46.jpg','Blanc-Rosado','Nike is for girls too','Las Nike Air Max 90 LTR vuelven en una versión aún mejor.','Air Max 90 LTR '),(50,2,3,50,'ACT','47.jpg','Gris-Azul','Feel the Flow kid','Las primeras zapatillas Air Max para el día a día de Nike cuentan con todo lo que imaginaste para las Nike Air Max 270','Nike Air Max 270'),(51,2,3,40,'ACT','48.jpg','Gris-Negro','Los favs de memo','Perfecciona tu look con las primeras Air Max para el día a día de Nike','Nike ultraduper mega cool 2'),(52,2,3,50,'ACT','49.jpg','Blanco-Gris','Ando caminando con un flow violento ','La amortiguación Air de gran tamaño es un básico en cualquier gran aventura.','nike Air Max 360'),(53,3,3,50,'ACT','50.jpg','Verde-Blanco','Soy veloz ','Estos zapatos para niños están diseñados con una suela resistente y antideslizante para brindar estabilidad y seguridad al caminar, correr y juga','Pumas Green'),(54,3,3,50,'ACT','51.jpg','Azul-blanco','Los avatars','cuentan con una parte superior cómoda y transpirable para mantener los pies frescos y secos durante todo el día.','PumasAvatar'),(55,3,3,50,'ACT','52.jpg','Amarillo-Anaranjado','Wuack Wuack Wuack','Estos zapatos también tienen cierres de velcro o cordones ajustables para un ajuste personalizado y fácil de poner y quitar. ','PumasWuack'),(56,3,3,50,'ACT','53.jpg','Blanco-Rosado','Los Pumas para las chicas ','Cuentan con una suela suave y flexible que permite que los pies se muevan de manera natural y se adapten a cualquier superficie.','PumasGirl'),(57,3,3,55,'ACT','54.jpg','Rosado-Rosado','Sparky pumas, brilla mas con los pumas Sparky','La parte superior está hecha de materiales suaves y transpirables para brindar comodidad y mantener los pies frescos y secos. Además, estos zapatos tienen cierres de velcro o cordones elásticos para un ajuste fácil y seguro. ','PumasSparky'),(58,3,3,10,'ACT','55.jpg','Negro','las sandals, they are called sandals','Estas sandalias para niños son perfectas para los días cálidos de verano. Cuentan con una suela resistente y antideslizante para proporcionar estabilidad y seguridad en superficies resbaladizas. ','PumasSandals'),(70,1,1,55,'ACT','IMG-64417f5261a3a3.09476299.jpg','Verde','Zapatos super comodos','super comodos','Elevate ');
/*!40000 ALTER TABLE `zapatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'shoesnw'
--

--
-- Dumping routines for database 'shoesnw'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-20 12:31:15
