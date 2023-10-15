CREATE DATABASE  IF NOT EXISTS `bd_gran_bazar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_gran_bazar`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_gran_bazar
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `tbb_catalogos`
--

DROP TABLE IF EXISTS `tbb_catalogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_catalogos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `CATEGORIA_ID` int unsigned NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `ESTATUS` bit(1) NOT NULL DEFAULT b'1',
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FECHA_ULTIMA_ACTUALIZACION` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_tbb_catalogos_CATEGORIA_ID` (`CATEGORIA_ID`),
  CONSTRAINT `FK_tbb_catalogos_CATEGORIA_ID` FOREIGN KEY (`CATEGORIA_ID`) REFERENCES `tbb_categorias` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_catalogos`
--

LOCK TABLES `tbb_catalogos` WRITE;
/*!40000 ALTER TABLE `tbb_catalogos` DISABLE KEYS */;
INSERT INTO `tbb_catalogos` VALUES (1,1,'Moda Femenina',_binary '','2023-08-16 13:21:41',NULL),(2,2,'Moda Juvenil Femenina',_binary '','2023-08-16 13:21:41',NULL),(3,3,'Moda Juvenil Masculina',_binary '','2023-08-16 13:21:41',NULL),(4,4,'Moda Bebé',_binary '','2023-08-16 13:21:41',NULL),(5,5,'Complementos',_binary '','2023-08-16 13:21:41',NULL),(6,6,'Lencería',_binary '','2023-08-16 13:21:41',NULL),(7,7,'Outfits Completos',_binary '','2023-08-16 13:21:41',NULL),(8,8,'Calcetería',_binary '','2023-08-16 13:21:41',NULL),(9,9,'Vestidos de Moda',_binary '','2023-08-16 13:21:41',NULL),(10,10,'Moda de Playa',_binary '','2023-08-16 13:21:41',NULL);
/*!40000 ALTER TABLE `tbb_catalogos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgr_ai_catalogo` AFTER INSERT ON `tbb_catalogos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_catalogos", "CREATE",
    CONCAT_WS("","El usuario: ", USER(), " ha insertado un nuevo CATÁLOGO con el ID: ", new.id, " con el CATEGORIA_ID: ", 
    new.categoria_id, " con el NOMBRE: ", new.nombre, " con ESTATUS por defecto: ", 
    IF(new.estatus,'1','0'), " con FECHA DE REGISTRO: ", new.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_catalogos_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_catalogos` FOR EACH ROW BEGIN
SET NEW.FECHA_ULTIMA_ACTUALIZACION = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_catalogos_AFTER_UPDATE` AFTER UPDATE ON `tbb_catalogos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_catalogos", "UPDATE",
    CONCAT_WS("","El usuario: ", USER(), " ha modificado el CATÁLOGO con ID: ",new.id,
    " con los siguientes cambios: ",
        IF(new.id = old.id,"", CONCAT_WS(""," el ID de: ", old.id," a: ", new.id)),
        IF(new.categoria_id = old.categoria_id,"", CONCAT_WS("",", el CATEGORIA_ID de: ", old.categoria_id," a: ", new.categoria_id)),
        IF(new.nombre = old.nombre,"", CONCAT_WS("",", el NOMBRE de: ", old.nombre," a:", new.nombre)),
        IF(new.estatus = old.estatus,"", CONCAT_WS("",", el ESTATUS de: ",  IF(old.estatus,'1','0')," a: ",  IF(new.estatus,'1','0'))),
        IF(new.fecha_registro = old.fecha_registro,"", CONCAT_WS(""," el FECHA_DE_REGISTRO de: ", old.fecha_registro," a: ", new.fecha_registro)),""), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_catalogos_BEFORE_DELETE` BEFORE DELETE ON `tbb_catalogos` FOR EACH ROW BEGIN
declare v_usuario varchar(80) default user();
    declare MESSAGGE_TEXT varchar(255) default "";
    
    if v_usuario != "root@localhost" then
		signal sqlstate '45000'
        set	MESSAGE_TEXT = 'No tienes los privilegios para borrar la infromacion de la tabla:tbb_catalogos ';
    end if; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_catalogos_AFTER_DELETE` AFTER DELETE ON `tbb_catalogos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_catalogos", "DELETE",
    CONCAT_WS("","El usuario: ", USER(), " ha eliminado un CATÁLOGO con el ID: ", old.ID, " con el CATEGORIA_ID: ", old.CATEGORIA_ID, " con el NOMBRE: ", 
    old.NOMBRE, " con ESTATUS por defecto: ", 
    IF(old.ESTATUS,'1','0'), " con FECHA DE REGISTRO: ", old.FECHA_REGISTRO), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_categorias`
--

DROP TABLE IF EXISTS `tbb_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_categorias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `ESTATUS` bit(1) NOT NULL DEFAULT b'1',
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FECHA_ULTIMA_ACTUALIZACION` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_categorias`
--

LOCK TABLES `tbb_categorias` WRITE;
/*!40000 ALTER TABLE `tbb_categorias` DISABLE KEYS */;
INSERT INTO `tbb_categorias` VALUES (1,'Ropa para mujer','Prendas de vestir diseñadas específicamente para mujeres, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones.',_binary '','2023-08-16 13:21:28',NULL),(2,'Ropa para niña y juvenil','Prendas de vestir diseñadas para niñas y jóvenes, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones.',_binary '','2023-08-16 13:21:28',NULL),(3,'Ropa para niño y juvenil','Prendas de vestir diseñadas para niños y jóvenes, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones.',_binary '','2023-08-16 13:21:28',NULL),(4,'Ropa para bebé','Prendas de vestir diseñadas específicamente para bebés, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones.',_binary '','2023-08-16 13:21:28',NULL),(5,'Accesorios','Artículos complementarios a la ropa, como bufandas, cinturones, abanicos, sombreros y relojes, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones.',_binary '','2023-08-16 13:21:28',NULL),(6,'Ropa íntima','Prendas de vestir que se usan debajo de la ropa exterior, como ropa interior, camisones, pijamas, etc.',_binary '','2023-08-16 13:21:28',NULL),(7,'Conjuntos','Combinaciones de prendas que se venden juntas como un conjunto, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones.',_binary '','2023-08-16 13:21:28',NULL),(8,'Medias','Prendas de vestir que cubren los pies y las piernas, como calcetines, medias, pantimedias, etc.',_binary '','2023-08-16 13:21:28',NULL),(9,'Vestidos','Prendas de vestir femeninas que cubren el cuerpo desde los hombros hasta las piernas.',_binary '','2023-08-16 13:21:28',NULL),(10,'Trajes de baño','Prendas de vestir diseñadas específicamente para usar en el agua o en la playa.',_binary '','2023-08-16 13:21:28',NULL);
/*!40000 ALTER TABLE `tbb_categorias` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgr_ai_categoria` AFTER INSERT ON `tbb_categorias` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_categorias", "CREATE",
    CONCAT_WS("","El usuario: ", USER(), " ha insertado una nueva CATEGORÍA con el ID: ", new.id, " con el NOMBRE: ", 
    new.nombre, " con la DESCRIPCIÓN: ", new.descripcion, " con ESTATUS por defecto: ", 
    IF(new.estatus,'1','0'), " con FECHA DE REGISTRO: ", new.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_categorias_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_categorias` FOR EACH ROW BEGIN
SET NEW.FECHA_ULTIMA_ACTUALIZACION = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_categorias_AFTER_UPDATE` AFTER UPDATE ON `tbb_categorias` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_categorias", "UPDATE",
    CONCAT_WS("","El usuario: ", USER(), " ha modificado la CATEGORÍA con ID: ",new.id,
    " con los siguientes cambios: ",
        IF(new.id = old.id,"", CONCAT_WS(""," el ID de: ", old.id," a: ", new.id)),
        IF(new.nombre = old.nombre,"", CONCAT_WS("",", el NOMBRE de: ", old.nombre," a: ", new.nombre)),
        IF(new.descripcion = old.descripcion,"", CONCAT_WS("",", la DESCRIPCIÓN de: ", old.descripcion," a:", new.descripcion)),
        IF(new.estatus = old.estatus,"", CONCAT_WS("",", el ESTATUS de: ",  IF(old.estatus,'1','0')," a: ",  IF(new.estatus,'1','0'))),
        IF(new.fecha_registro = old.fecha_registro,"", CONCAT_WS(""," el FECHA_DE_REGISTRO de: ", old.fecha_registro," a: ", new.fecha_registro)),""), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_categorias_BEFORE_DELETE` BEFORE DELETE ON `tbb_categorias` FOR EACH ROW BEGIN
declare v_usuario varchar(80) default user();
    declare MESSAGGE_TEXT varchar(255) default "";
    
    if v_usuario != "root@localhost" then
		signal sqlstate '45000'
        set	MESSAGE_TEXT = 'No tienes los privilegios para borrar la infromacion de la tabla: tbb_categorias';
    end if; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_categorias_AFTER_DELETE` AFTER DELETE ON `tbb_categorias` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_categorias", "DELETE",
    CONCAT_WS("","El usuario: ", USER(), " ha eliminado una CATEGORÍA con el ID: ", old.id, " con el NOMBRE: ", 
    old.nombre, " con la DESCRIPCIÓN: ", old.descripcion, " con ESTATUS por defecto: ", 
    IF(old.estatus,'1','0'), " con FECHA DE REGISTRO: ", old.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_inventarios`
--

DROP TABLE IF EXISTS `tbb_inventarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_inventarios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCTO_ID` int unsigned NOT NULL,
  `CANTIDAD_DISPONIBLE` int NOT NULL,
  `ESTATUS` bit(1) NOT NULL DEFAULT b'1',
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FECHA_ULTIMA_ACTUALIZACION` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PRODUCTO_ID` (`PRODUCTO_ID`),
  CONSTRAINT `tbb_inventarios_ibfk_1` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `tbb_productos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_inventarios`
--

LOCK TABLES `tbb_inventarios` WRITE;
/*!40000 ALTER TABLE `tbb_inventarios` DISABLE KEYS */;
INSERT INTO `tbb_inventarios` VALUES (1,1,10,_binary '','2023-08-17 09:29:13',NULL),(2,2,10,_binary '','2023-08-17 09:29:13',NULL),(3,3,10,_binary '','2023-08-17 09:29:13',NULL),(4,4,10,_binary '','2023-08-17 09:29:13',NULL),(5,5,10,_binary '','2023-08-17 09:29:13',NULL),(6,6,10,_binary '','2023-08-17 09:29:13',NULL),(7,7,10,_binary '','2023-08-17 09:29:13',NULL),(8,8,10,_binary '','2023-08-17 09:29:13',NULL),(9,9,10,_binary '','2023-08-17 09:29:13',NULL),(10,10,10,_binary '','2023-08-17 09:29:13',NULL),(11,11,10,_binary '','2023-08-17 09:29:13',NULL),(12,12,10,_binary '','2023-08-17 09:29:13',NULL),(13,13,10,_binary '','2023-08-17 09:29:13',NULL),(14,14,10,_binary '','2023-08-17 09:29:13',NULL),(15,15,10,_binary '','2023-08-17 09:29:13',NULL),(16,16,10,_binary '','2023-08-17 09:29:13',NULL),(17,17,10,_binary '','2023-08-17 09:29:13',NULL),(18,18,10,_binary '','2023-08-17 09:29:13',NULL),(19,19,10,_binary '','2023-08-17 09:29:13',NULL),(20,20,10,_binary '','2023-08-17 09:29:13',NULL),(21,21,10,_binary '','2023-08-17 09:29:13',NULL),(22,22,10,_binary '','2023-08-17 09:29:13',NULL),(23,23,10,_binary '','2023-08-17 09:29:13',NULL),(24,24,10,_binary '','2023-08-17 09:29:13',NULL),(25,25,10,_binary '','2023-08-17 09:29:13',NULL),(26,26,10,_binary '','2023-08-17 09:29:13',NULL),(27,27,10,_binary '','2023-08-17 09:29:13',NULL),(28,28,10,_binary '','2023-08-17 09:29:13',NULL),(29,29,10,_binary '','2023-08-17 09:29:13',NULL),(30,30,10,_binary '','2023-08-17 09:29:13',NULL),(31,31,10,_binary '','2023-08-17 09:29:13',NULL),(32,32,10,_binary '','2023-08-17 09:29:13',NULL),(33,33,10,_binary '','2023-08-17 09:29:13',NULL),(34,34,10,_binary '','2023-08-17 09:29:13',NULL),(35,35,10,_binary '','2023-08-17 09:29:13',NULL),(36,36,10,_binary '','2023-08-17 09:29:13',NULL),(37,37,10,_binary '','2023-08-17 09:29:13',NULL),(38,38,10,_binary '','2023-08-17 09:29:13',NULL),(39,39,10,_binary '','2023-08-17 09:29:13',NULL),(40,40,10,_binary '','2023-08-17 09:29:13',NULL),(41,41,10,_binary '','2023-08-17 09:29:13',NULL),(42,42,10,_binary '','2023-08-17 09:29:13',NULL),(43,43,10,_binary '','2023-08-17 09:29:13',NULL),(44,44,10,_binary '','2023-08-17 09:29:13',NULL),(45,45,10,_binary '','2023-08-17 09:29:13',NULL),(46,46,10,_binary '','2023-08-17 09:29:13',NULL),(47,47,10,_binary '','2023-08-17 09:29:13',NULL),(48,48,10,_binary '','2023-08-17 09:29:13',NULL),(49,49,10,_binary '','2023-08-17 09:29:13',NULL),(50,50,10,_binary '','2023-08-17 09:29:13',NULL),(51,51,10,_binary '','2023-08-17 09:29:13',NULL),(52,52,10,_binary '','2023-08-17 09:29:13',NULL),(53,53,10,_binary '','2023-08-17 09:29:13',NULL),(54,54,10,_binary '','2023-08-17 09:29:13',NULL),(55,55,10,_binary '','2023-08-17 09:29:13',NULL),(56,56,10,_binary '','2023-08-17 09:29:13',NULL),(57,57,10,_binary '','2023-08-17 09:29:13',NULL),(58,58,10,_binary '','2023-08-17 09:29:13',NULL),(59,59,10,_binary '','2023-08-17 09:29:13',NULL),(60,60,10,_binary '','2023-08-17 09:29:13',NULL),(61,61,10,_binary '','2023-08-17 09:29:13',NULL),(62,62,10,_binary '','2023-08-17 09:29:13',NULL),(63,63,10,_binary '','2023-08-17 09:29:13',NULL),(64,64,10,_binary '','2023-08-17 09:29:13',NULL),(65,65,10,_binary '','2023-08-17 09:29:13',NULL),(66,66,10,_binary '','2023-08-17 09:29:13',NULL),(67,67,10,_binary '','2023-08-17 09:29:13',NULL),(68,68,10,_binary '','2023-08-17 09:29:13',NULL),(69,69,10,_binary '','2023-08-17 09:29:13',NULL),(70,70,10,_binary '','2023-08-17 09:29:13',NULL),(71,71,10,_binary '','2023-08-17 09:29:13',NULL),(72,72,10,_binary '','2023-08-17 09:29:13',NULL),(73,73,10,_binary '','2023-08-17 09:29:13',NULL),(74,74,10,_binary '','2023-08-17 09:29:13',NULL),(75,75,10,_binary '','2023-08-17 09:29:13',NULL),(76,76,10,_binary '','2023-08-17 09:29:13',NULL),(77,77,10,_binary '','2023-08-17 09:29:13',NULL),(78,78,10,_binary '','2023-08-17 09:29:13',NULL),(79,79,10,_binary '','2023-08-17 09:29:13',NULL),(80,80,10,_binary '','2023-08-17 09:29:13',NULL),(81,81,10,_binary '','2023-08-17 09:29:13',NULL),(82,82,10,_binary '','2023-08-17 09:29:13',NULL),(83,83,10,_binary '','2023-08-17 09:29:13',NULL),(84,84,10,_binary '','2023-08-17 09:29:13',NULL),(85,85,10,_binary '','2023-08-17 09:29:13',NULL),(86,86,10,_binary '','2023-08-17 09:29:13',NULL),(87,87,10,_binary '','2023-08-17 09:29:13',NULL),(88,88,10,_binary '','2023-08-17 09:29:13',NULL),(89,89,10,_binary '','2023-08-17 09:29:13',NULL),(90,90,10,_binary '','2023-08-17 09:29:13',NULL),(91,91,10,_binary '','2023-08-17 09:29:13',NULL),(92,92,10,_binary '','2023-08-17 09:29:13',NULL),(93,93,10,_binary '','2023-08-17 09:29:13',NULL),(94,94,10,_binary '','2023-08-17 09:29:13',NULL),(95,95,10,_binary '','2023-08-17 09:29:13',NULL),(96,96,10,_binary '','2023-08-17 09:29:13',NULL),(97,97,10,_binary '','2023-08-17 09:29:13',NULL),(98,98,10,_binary '','2023-08-17 09:29:13',NULL),(99,99,10,_binary '','2023-08-17 09:29:13',NULL),(100,100,10,_binary '','2023-08-17 09:29:13',NULL);
/*!40000 ALTER TABLE `tbb_inventarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgr_ai_inventario` AFTER INSERT ON `tbb_inventarios` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_inventarios", "CREATE",
    CONCAT_WS("","El usuario: ", USER(), " ha insertado un nuevo INVENTARIO con el ID: ", new.id, " con el PRODUCTO_ID: ", 
    new.producto_id, " con la CANTIDAD_DISPONIBLE: ", new.cantidad_disponible, " con ESTATUS por defecto: ", 
    IF(new.estatus,'1','0'), " con FECHA DE REGISTRO: ", new.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_inventarios_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_inventarios` FOR EACH ROW BEGIN
SET NEW.FECHA_ULTIMA_ACTUALIZACION = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_inventarios_AFTER_UPDATE` AFTER UPDATE ON `tbb_inventarios` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_inventarios", "UPDATE",
    CONCAT_WS("","El usuario: ", USER(), " ha modificado el INVENTARIO con ID: ",new.id,
    " con los siguientes cambios: ",
        IF(new.id = old.id,"", CONCAT_WS(""," el ID de: ", old.id," a: ", new.id)),
        IF(new.producto_id = old.producto_id,"", CONCAT_WS("",", el PRODUCTO_ID de: ", old.producto_id," a: ", new.producto_id)),
        IF(new.cantidad_disponible = old.cantidad_disponible,"", CONCAT_WS("",", la CANTIDAD_DISPONIBLE de: ", old.cantidad_disponible," a:", new.cantidad_disponible)),
        IF(new.estatus = old.estatus,"", CONCAT_WS("",", el ESTATUS de: ",  IF(old.estatus,'1','0')," a: ",  IF(new.estatus,'1','0'))),
        IF(new.fecha_registro = old.fecha_registro,"", CONCAT_WS(""," el FECHA_DE_REGISTRO de: ", old.fecha_registro," a: ", new.fecha_registro)),""), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_inventarios_BEFORE_DELETE` BEFORE DELETE ON `tbb_inventarios` FOR EACH ROW BEGIN
declare v_usuario varchar(80) default user();
    declare MESSAGGE_TEXT varchar(255) default "";
    
    if v_usuario != "root@localhost" then
		signal sqlstate '45000'
        set	MESSAGE_TEXT = 'No tienes los privilegios para borrar la infromacion de la tabla: tbb_inventarios';
    end if; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_inventarios_AFTER_DELETE` AFTER DELETE ON `tbb_inventarios` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_inventarios", "DELETE",
    CONCAT_WS("","El usuario: ", USER(), " ha eliminado un INVENTARIO con el ID: ", old.id, " con el PRODUCTO_ID: ", 
    old.producto_id, " con la CANTIDAD_DISPONIBLE: ", old.cantidad_disponible, " con ESTATUS por defecto: ", 
    IF(old.estatus,'1','0'), " con FECHA DE REGISTRO: ", old.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_pedidos`
--

DROP TABLE IF EXISTS `tbb_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_pedidos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `USUARIO_ID` int unsigned NOT NULL,
  `PRODUCTO_ID` int unsigned NOT NULL,
  `OBSERVACIONES` text,
  `ESTATUS` bit(1) NOT NULL DEFAULT b'1',
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FECHA_ULTIMA_ACTUALIZACION` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USUARIO_ID` (`USUARIO_ID`),
  KEY `PRODUCTO_ID` (`PRODUCTO_ID`),
  CONSTRAINT `tbb_pedidos_ibfk_1` FOREIGN KEY (`USUARIO_ID`) REFERENCES `tbb_usuarios` (`PERSONA_ID`),
  CONSTRAINT `tbb_pedidos_ibfk_2` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `tbb_productos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_pedidos`
--

LOCK TABLES `tbb_pedidos` WRITE;
/*!40000 ALTER TABLE `tbb_pedidos` DISABLE KEYS */;
INSERT INTO `tbb_pedidos` VALUES (1,50,22,'El producto llegó a tiempo y en perfectas condiciones.',_binary '\0','2023-08-17 09:32:13',NULL),(2,27,38,'Excelente servicio al cliente durante el proceso de pedido.',_binary '\0','2023-08-17 09:32:13',NULL),(3,30,12,'El producto llegó a tiempo y en perfectas condiciones.',_binary '','2023-08-17 09:32:13',NULL),(4,18,12,'Hubo un pequeño problema con el envío, pero se solucionó rápidamente.',_binary '','2023-08-17 09:32:13',NULL),(5,50,100,'El producto llegó a tiempo y en perfectas condiciones.',_binary '\0','2023-08-17 09:32:13',NULL),(6,33,81,'Pedido realizado correctamente.',_binary '\0','2023-08-17 09:32:13',NULL),(7,36,58,'El pedido se realizó sin problemas y el producto es de alta calidad.',_binary '','2023-08-17 09:32:13',NULL),(8,43,18,'Pedido realizado correctamente.',_binary '\0','2023-08-17 09:32:13',NULL),(9,5,74,'El producto llegó a tiempo y en perfectas condiciones.',_binary '\0','2023-08-17 09:32:13',NULL),(10,5,87,'El pedido se realizó sin problemas y el producto es de alta calidad.',_binary '\0','2023-08-17 09:32:13',NULL),(11,13,22,'Excelente servicio al cliente durante el proceso de pedido.',_binary '\0','2023-08-17 09:32:13',NULL),(12,48,81,'El pedido se realizó sin problemas y el producto es de alta calidad.',_binary '\0','2023-08-17 09:32:13',NULL),(13,16,51,'El producto llegó a tiempo y en perfectas condiciones.',_binary '','2023-08-17 09:32:13',NULL),(14,31,60,'Hubo un pequeño problema con el envío, pero se solucionó rápidamente.',_binary '\0','2023-08-17 09:32:13',NULL),(15,37,54,'Pedido realizado correctamente.',_binary '\0','2023-08-17 09:32:13',NULL),(16,22,85,'Excelente servicio al cliente durante el proceso de pedido.',_binary '','2023-08-17 09:32:13',NULL),(17,28,59,'Pedido realizado correctamente.',_binary '\0','2023-08-17 09:32:13',NULL),(18,20,2,'Excelente servicio al cliente durante el proceso de pedido.',_binary '','2023-08-17 09:32:13',NULL),(19,19,66,'Hubo un pequeño problema con el envío, pero se solucionó rápidamente.',_binary '\0','2023-08-17 09:32:13',NULL),(20,17,44,'Excelente servicio al cliente durante el proceso de pedido.',_binary '\0','2023-08-17 09:32:13',NULL),(21,38,40,'Hubo un pequeño problema con el envío, pero se solucionó rápidamente.',_binary '','2023-08-17 09:32:13',NULL),(22,34,63,'Hubo un pequeño problema con el envío, pero se solucionó rápidamente.',_binary '\0','2023-08-17 09:32:13',NULL),(23,33,53,'Hubo un pequeño problema con el envío, pero se solucionó rápidamente.',_binary '','2023-08-17 09:32:13',NULL),(24,10,10,'Excelente servicio al cliente durante el proceso de pedido.',_binary '','2023-08-17 09:32:13',NULL),(25,20,31,'El producto llegó a tiempo y en perfectas condiciones.',_binary '\0','2023-08-17 09:32:13',NULL),(26,40,67,'Excelente servicio al cliente durante el proceso de pedido.',_binary '','2023-08-17 09:32:13',NULL),(27,6,16,'Excelente servicio al cliente durante el proceso de pedido.',_binary '\0','2023-08-17 09:32:13',NULL),(28,24,8,'Excelente servicio al cliente durante el proceso de pedido.',_binary '','2023-08-17 09:32:13',NULL),(29,31,60,'Hubo un pequeño problema con el envío, pero se solucionó rápidamente.',_binary '\0','2023-08-17 09:32:13',NULL),(30,6,88,'El pedido se realizó sin problemas y el producto es de alta calidad.',_binary '\0','2023-08-17 09:32:13',NULL),(31,33,62,'Hubo un pequeño problema con el envío, pero se solucionó rápidamente.',_binary '\0','2023-08-17 09:32:13',NULL),(32,10,80,'Excelente servicio al cliente durante el proceso de pedido.',_binary '\0','2023-08-17 09:32:13',NULL),(33,50,33,'El pedido se realizó sin problemas y el producto es de alta calidad.',_binary '','2023-08-17 09:32:13',NULL),(34,20,16,'El producto llegó a tiempo y en perfectas condiciones.',_binary '','2023-08-17 09:32:13',NULL),(35,43,64,'Hubo un pequeño problema con el envío, pero se solucionó rápidamente.',_binary '','2023-08-17 09:32:13',NULL),(36,26,67,'El producto llegó a tiempo y en perfectas condiciones.',_binary '','2023-08-17 09:32:13',NULL),(37,15,95,'Pedido realizado correctamente.',_binary '','2023-08-17 09:32:13',NULL),(38,49,32,'Hubo un pequeño problema con el envío, pero se solucionó rápidamente.',_binary '','2023-08-17 09:32:13',NULL),(39,23,41,'El producto llegó a tiempo y en perfectas condiciones.',_binary '','2023-08-17 09:32:13',NULL),(40,18,89,'El producto llegó a tiempo y en perfectas condiciones.',_binary '\0','2023-08-17 09:32:13',NULL),(41,2,49,'El producto llegó a tiempo y en perfectas condiciones.',_binary '\0','2023-08-17 09:32:13',NULL),(42,42,64,'Pedido realizado correctamente.',_binary '','2023-08-17 09:32:13',NULL),(43,14,29,'Excelente servicio al cliente durante el proceso de pedido.',_binary '','2023-08-17 09:32:13',NULL),(44,17,96,'El producto llegó a tiempo y en perfectas condiciones.',_binary '','2023-08-17 09:32:13',NULL),(45,44,19,'Pedido realizado correctamente.',_binary '\0','2023-08-17 09:32:13',NULL),(46,31,67,'Pedido realizado correctamente.',_binary '','2023-08-17 09:32:13',NULL),(47,17,89,'Hubo un pequeño problema con el envío, pero se solucionó rápidamente.',_binary '\0','2023-08-17 09:32:13',NULL),(48,3,18,'Excelente servicio al cliente durante el proceso de pedido.',_binary '','2023-08-17 09:32:13',NULL),(49,8,57,'Pedido realizado correctamente.',_binary '\0','2023-08-17 09:32:13',NULL),(50,34,90,'Pedido realizado correctamente.',_binary '\0','2023-08-17 09:32:13',NULL);
/*!40000 ALTER TABLE `tbb_pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgr_ai_pedido` AFTER INSERT ON `tbb_pedidos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_pedidos", "CREATE",
    CONCAT_WS("","El usuario: ", USER(), " ha insertado un nuevo PEDIDO con el ID: ", new.id, " con el USUARIO_ID: ", 
    new.usuario_id, " con el PRODUCTO_ID: ", new.producto_id, " con las OBSERVACIONES: ", 
    IFNULL(new.observaciones,""), " con ESTATUS por defecto: ", 
    IF(new.estatus,'1','0'), " con FECHA DE REGISTRO: ", new.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_pedidos_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_pedidos` FOR EACH ROW BEGIN
SET NEW.FECHA_ULTIMA_ACTUALIZACION = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_pedidos_AFTER_UPDATE` AFTER UPDATE ON `tbb_pedidos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_pedidos", "UPDATE",
    CONCAT_WS("","El usuario: ", USER(), " ha modificado el PEDIDO con ID: ",new.id,
    " con los siguientes cambios: ",
        IF(new.id = old.id,"", CONCAT_WS(""," el ID de: ", old.id," a: ", new.id)),
        IF(new.usuario_id = old.usuario_id,"", CONCAT_WS("",", el USUARIO_ID de: ", old.usuario_id," a: ", new.usuario_id)),
        IF(new.producto_id = old.producto_id,"", CONCAT_WS("",", el PRODUCTO_ID de: ", old.producto_id," a:", new.producto_id)),
        IF(new.observaciones is not null and old.observaciones is not null and new.observaciones !=old.observaciones, 
            CONCAT_WS("",", las OBSERVACIONES de: ", old.observaciones," a: ", new.observaciones), ""),
        IF(new.estatus = old.estatus,"", CONCAT_WS("",", el ESTATUS de: ",  IF(old.estatus,'1','0')," a: ",  IF(new.estatus,'1','0'))),
        IF(new.fecha_registro = old.fecha_registro,"", CONCAT_WS(""," el FECHA_DE_REGISTRO de: ", old.fecha_registro," a: ", new.fecha_registro)),""), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_pedidos_BEFORE_DELETE` BEFORE DELETE ON `tbb_pedidos` FOR EACH ROW BEGIN
declare v_usuario varchar(80) default user();
    declare MESSAGGE_TEXT varchar(255) default "";
    
    if v_usuario != "root@localhost" then
		signal sqlstate '45000'
        set	MESSAGE_TEXT = 'No tienes los privilegios para borrar la infromacion de la tabla: tbb_pedidos';
    end if; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_pedidos_AFTER_DELETE` AFTER DELETE ON `tbb_pedidos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_pedidos", "DELETE",
    CONCAT_WS("","El usuario: ", USER(), " ha eliminado un PEDIDO con el ID: ", old.id, " con el USUARIO_ID: ", 
    old.usuario_id, " con el PRODUCTO_ID: ", old.producto_id, " con las OBSERVACIONES: ", 
    IFNULL(old.observaciones,""), " con ESTATUS por defecto: ", 
    IF(old.estatus,'1','0'), " con FECHA DE REGISTRO: ", old.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_personas`
--

DROP TABLE IF EXISTS `tbb_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  `PRIMER_APELLIDO` varchar(150) NOT NULL,
  `SEGUNDO_APELLIDO` varchar(150) DEFAULT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `GENERO` enum('M','F','N/B') NOT NULL,
  `UBICACION_ID` int unsigned DEFAULT NULL,
  `ESTATUS` bit(1) NOT NULL DEFAULT b'1',
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FECHA_ULTIMA_ACTUALIZACION` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `UBICACION_ID` (`UBICACION_ID`),
  CONSTRAINT `tbb_personas_ibfk_1` FOREIGN KEY (`UBICACION_ID`) REFERENCES `tbb_ubicaciones` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personas`
--

LOCK TABLES `tbb_personas` WRITE;
/*!40000 ALTER TABLE `tbb_personas` DISABLE KEYS */;
INSERT INTO `tbb_personas` VALUES (1,'Daniela','Romero','Zúñiga','2004-01-01','F',51,_binary '','2023-08-17 09:31:28',NULL),(2,'Ignacio','Zamora','López','1976-01-01','M',52,_binary '','2023-08-17 09:31:28',NULL),(3,'Ricardo','Flores','Ramírez','1981-01-01','M',53,_binary '','2023-08-17 09:31:28',NULL),(4,'Dolores','Vega','Pacheco','1979-01-01','F',54,_binary '','2023-08-17 09:31:28',NULL),(5,'Karla','Delgado','Santos','1973-01-01','F',55,_binary '','2023-08-17 09:31:28',NULL),(6,'Paola','Estrada','Arias','1979-01-01','F',56,_binary '','2023-08-17 09:31:28',NULL),(7,'Julio','Vargas','Rivas','1977-01-01','M',57,_binary '','2023-08-17 09:31:28',NULL),(8,'Andrés Rubén','Silva','Ortiz','1995-01-01','M',58,_binary '','2023-08-17 09:31:28',NULL),(9,'Juan Carlos','Olivares','León','1980-01-01','M',59,_binary '','2023-08-17 09:31:28',NULL),(10,'César','Torres','Estrada','2001-01-01','M',60,_binary '','2023-08-17 09:31:28',NULL),(11,'Vanessa','López','Domínguez','1973-01-01','F',61,_binary '','2023-08-17 09:31:28',NULL),(12,'Manuel','Ponce','Rojas','1983-01-01','M',62,_binary '','2023-08-17 09:31:28',NULL),(13,'David','Carrillo','Ponce','1976-01-01','M',63,_binary '','2023-08-17 09:31:28',NULL),(14,'Joaquín','Granados','Rojas','1999-01-01','N/B',64,_binary '','2023-08-17 09:31:28',NULL),(15,'Sara','Lara','Estrada','2002-01-01','F',65,_binary '','2023-08-17 09:31:28',NULL),(16,'Fernando','Hernández','Gutiérrez','1985-01-01','M',66,_binary '','2023-08-17 09:31:28',NULL),(17,'Antonia','Peña','Rodríguez','1989-01-01','F',67,_binary '','2023-08-17 09:31:28',NULL),(18,'Carolina','Cordero','Castro','1994-01-01','F',68,_binary '','2023-08-17 09:31:28',NULL),(19,'Magdalena Georgina','Díaz','Gómez','2000-01-01','F',69,_binary '','2023-08-17 09:31:28',NULL),(20,'Ivonne','Campos','Quezada','1991-01-01','F',70,_binary '','2023-08-17 09:31:28',NULL),(21,'Marcela','Quezada','Paredes','1986-01-01','F',71,_binary '','2023-08-17 09:31:28',NULL),(22,'Carlos','Alvarez','Luna','2004-01-01','M',72,_binary '','2023-08-17 09:31:28',NULL),(23,'Erik','Hidalgo','Gutiérrez','1999-01-01','M',73,_binary '','2023-08-17 09:31:28',NULL),(24,'Antonio','Trejo','Aguilar','1993-01-01','M',74,_binary '','2023-08-17 09:31:28',NULL),(25,'Gloria','Olivares','Ponce','1975-01-01','F',75,_binary '','2023-08-17 09:31:28',NULL),(26,'Regina Dolores','Cortés','Zúñiga','2001-01-01','F',76,_binary '','2023-08-17 09:31:28',NULL),(27,'Raúl','Vega','Valencia','1974-01-01','M',77,_binary '','2023-08-17 09:31:28',NULL),(28,'Refugio Isabela','Zamora','Espinoza','1987-01-01','F',78,_binary '','2023-08-17 09:31:28',NULL),(29,'Andrés','Cordero','Osorio','1974-01-01','M',79,_binary '','2023-08-17 09:31:28',NULL),(30,'Roberto','Vega','Vargas','1972-01-01','M',80,_binary '','2023-08-17 09:31:28',NULL),(31,'Teresa Paula','Villalobos','Ramírez','1990-01-01','F',81,_binary '','2023-08-17 09:31:28',NULL),(32,'Jazmín Rosario','Alvarado','Paredes','1978-01-01','F',82,_binary '','2023-08-17 09:31:28',NULL),(33,'Hugo','Guerrero','Cabrera','1980-01-01','M',83,_binary '','2023-08-17 09:31:28',NULL),(34,'Esther','Rangel','Escobedo','1972-01-01','F',84,_binary '','2023-08-17 09:31:28',NULL),(35,'Antonio','Méndez','Granados','2002-01-01','M',85,_binary '','2023-08-17 09:31:28',NULL),(36,'Ángeles','Maldonado','Rivas','1991-01-01','F',86,_binary '','2023-08-17 09:31:28',NULL),(37,'Alicia Cristina','Solís','Hidalgo','1999-01-01','F',87,_binary '','2023-08-17 09:31:28',NULL),(38,'Adriana','Ochoa','Sánchez','1999-01-01','F',88,_binary '','2023-08-17 09:31:28',NULL),(39,'Concepción','Herrera','Romero','1973-01-01','F',89,_binary '','2023-08-17 09:31:28',NULL),(40,'Soledad Carmen','Villalobos','León','1999-01-01','N/B',90,_binary '','2023-08-17 09:31:28',NULL),(41,'Marco Antonio','Domínguez','Franco','1989-01-01','N/B',91,_binary '','2023-08-17 09:31:28',NULL),(42,'Rubén','Lara','Herrera','2000-01-01','M',92,_binary '','2023-08-17 09:31:28',NULL),(43,'Jesús','Luna','Santos','2000-01-01','M',93,_binary '','2023-08-17 09:31:28',NULL),(44,'Noemí','Castro','Valdez','1998-01-01','F',94,_binary '','2023-08-17 09:31:28',NULL),(45,'Gerardo','Ayala','Meza','2004-01-01','M',95,_binary '','2023-08-17 09:31:28',NULL),(46,'Salvador','Hidalgo','Meza','1972-01-01','M',96,_binary '','2023-08-17 09:31:28',NULL),(47,'Ariadna Leticia','Ramos','Santos','1991-01-01','F',97,_binary '','2023-08-17 09:31:28',NULL),(48,'Sergio','Corona','Aguirre','1980-01-01','M',98,_binary '','2023-08-17 09:31:28',NULL),(49,'Alejandra','Valencia','Ruíz','2000-01-01','F',99,_binary '','2023-08-17 09:31:29',NULL),(50,'Gabriel Francisco Javier','Ortiz','Sánchez','1991-01-01','N/B',100,_binary '','2023-08-17 09:31:29',NULL);
/*!40000 ALTER TABLE `tbb_personas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgr_ai_persona` AFTER INSERT ON `tbb_personas` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_personas", "CREATE",
    CONCAT_WS("","El usuario: ", USER(), " ha insertado una nueva PERSONA con el ID: ", new.id, " con el NOMBRE: ", 
    new.nombre, " con el PRIMER_APELLIDO: ", new.primer_apellido, " con el SEGUNDO_APELLIDO: ", 
    IFNULL(new.segundo_apellido,""), " con la FECHA_NACIMIENTO: ", new.fecha_nacimiento, " con el GÉNERO: ", new.genero,
    " con la UBICACION_ID: ", IFNULL(new.ubicacion_id,""), " con ESTATUS por defecto: ", 
    IF(new.estatus,'1','0'), " con FECHA DE REGISTRO: ", new.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_personas` FOR EACH ROW BEGIN
SET NEW.FECHA_ULTIMA_ACTUALIZACION = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_AFTER_UPDATE` AFTER UPDATE ON `tbb_personas` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_personas", "UPDATE",
    CONCAT_WS("","El usuario: ", USER(), " ha modificado la PERSONA con ID: ",new.id,
    " con los siguientes cambios: ",
        IF(new.id = old.id,"", CONCAT_WS(""," el ID de: ", old.id," a: ", new.id)),
        IF(new.nombre = old.nombre,"", CONCAT_WS("",", el NOMBRE de: ", old.nombre," a: ", new.nombre)),
        IF(new.primer_apellido = old.primer_apellido,"", CONCAT_WS("",", el PRIMER_APELLIDO de: ", old.primer_apellido," a:", new.primer_apellido)),
        IF(new.segundo_apellido is not null and old.segundo_apellido is not null and new.segundo_apellido !=old.segundo_apellido, 
            CONCAT_WS("",", el SEGUNDO_APELLIDO de: ", old.segundo_apellido," a: ", new.segundo_apellido), ""),
        IF(new.fecha_nacimiento = old.fecha_nacimiento,"", CONCAT_WS("",", la FECHA_NACIMIENTO de: ", old.fecha_nacimiento," a:", new.fecha_nacimiento)),
        IF(new.genero = old.genero,"", CONCAT_WS("",", el GÉNERO de: ", old.genero," a:", new.genero)),
        IF(new.ubicacion_id is not null and old.ubicacion_id is not null and new.ubicacion_id !=old.ubicacion_id, 
            CONCAT_WS("",", la UBICACION_ID de: ", old.ubicacion_id," a: ", new.ubicacion_id), ""),
        IF(new.estatus = old.estatus,"", CONCAT_WS("",", el ESTATUS de: ",  IF(old.estatus,'1','0')," a: ",  IF(new.estatus,'1','0'))),
        IF(new.fecha_registro = old.fecha_registro,"", CONCAT_WS(""," el FECHA_DE_REGISTRO de: ", old.fecha_registro," a: ", new.fecha_registro)),""), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_BEFORE_DELETE` BEFORE DELETE ON `tbb_personas` FOR EACH ROW BEGIN
declare v_usuario varchar(80) default user();
    declare MESSAGGE_TEXT varchar(255) default "";
    
    if v_usuario != "root@localhost" then
		signal sqlstate '45000'
        set	MESSAGE_TEXT = 'No tienes los privilegios para borrar la infromacion de la tabla: tbb_personas';
    end if; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_AFTER_DELETE` AFTER DELETE ON `tbb_personas` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_personas", "DELETE",
    CONCAT_WS("","El usuario: ", USER(), " ha eliminado una PERSONA con el ID: ", old.id, " con el NOMBRE: ", 
    old.nombre, " con el PRIMER_APELLIDO: ", old.primer_apellido, " con el SEGUNDO_APELLIDO: ", 
    IFNULL(old.segundo_apellido,""), " con la FECHA_NACIMIENTO: ", old.fecha_nacimiento, " con el GÉNERO: ", old.genero,
    " con la UBICACION_ID: ", IFNULL(old.ubicacion_id,""), " con ESTATUS por defecto: ", 
    IF(old.estatus,'1','0'), " con FECHA DE REGISTRO: ", old.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_productos`
--

DROP TABLE IF EXISTS `tbb_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_productos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `CATEGORIA_ID` int unsigned NOT NULL,
  `NOMBRE` varchar(155) NOT NULL,
  `PRECIO` decimal(10,2) NOT NULL,
  `IMAGEN` varchar(255) DEFAULT NULL,
  `DESCRIPCION` text NOT NULL,
  `ESTATUS` bit(1) NOT NULL DEFAULT b'1',
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FECHA_ULTIMA_ACTUALIZACION` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CATEGORIA_ID` (`CATEGORIA_ID`),
  CONSTRAINT `tbb_productos_ibfk_1` FOREIGN KEY (`CATEGORIA_ID`) REFERENCES `tbb_categorias` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_productos`
--

LOCK TABLES `tbb_productos` WRITE;
/*!40000 ALTER TABLE `tbb_productos` DISABLE KEYS */;
INSERT INTO `tbb_productos` VALUES (1,1,'Blusa',99.00,'https://m.media-amazon.com/images/I/61BZJIOtzfL._AC_SX679_.jpg','Este es un/a Blusa de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(2,1,'Falda',198.00,'https://m.media-amazon.com/images/I/71LuGvvWhQL._AC_SY741_.jpg','Este es un/a Falda de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(3,1,'Pantalón',297.00,'https://m.media-amazon.com/images/I/81f3Kl5nOJS._AC_SX569_.jpg','Este es un/a Pantalón de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(4,1,'Vestido',396.00,'https://m.media-amazon.com/images/I/71ACP2iCvYL._AC_SX679_.jpg','Este es un/a Vestido de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(5,1,'Chaqueta',495.00,'https://m.media-amazon.com/images/I/91hjbJi5rzL._AC_SY741_.jpg','Este es un/a Chaqueta de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(6,1,'Suéter',594.00,'https://m.media-amazon.com/images/I/71NeYmo8YML._AC_SX679_.jpg','Este es un/a Suéter de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(7,1,'Camiseta',693.00,'https://m.media-amazon.com/images/I/71pS2hIuhHL._AC_SX679_.jpg','Este es un/a Camiseta de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(8,1,'Shorts',792.00,'https://m.media-amazon.com/images/I/91E78mxrQFL._AC_SX569_.jpg','Este es un/a Shorts de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(9,1,'Abrigo',891.00,'https://m.media-amazon.com/images/I/81EB9MzAFDL._AC_SX679_.jpg','Este es un/a Abrigo de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(10,1,'Jeans',990.00,'https://m.media-amazon.com/images/I/81boEpB78-L._AC_SY741_.jpg','Este es un/a Jeans de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(11,2,'Vestido',99.00,'https://m.media-amazon.com/images/I/71VGigy2yrL._AC_SX679_.jpg','Este es un/a Vestido de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(12,2,'Falda',198.00,'https://m.media-amazon.com/images/I/61-+q3YxiKL._AC_SX679_.jpg','Este es un/a Falda de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(13,2,'Blusa',297.00,'https://m.media-amazon.com/images/I/91ipVsottIL._AC_SX679_.jpg','Este es un/a Blusa de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(14,2,'Pantalón',396.00,'https://m.media-amazon.com/images/I/716Va6byOyL._AC_SX679_.jpg','Este es un/a Pantalón de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(15,2,'Suéter',495.00,'https://m.media-amazon.com/images/I/81CYIo-6ujS._AC_SX679_.jpg','Este es un/a Suéter de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(16,2,'Chaqueta',594.00,'https://m.media-amazon.com/images/I/81Z2RuIYUJL._AC_SX679_.jpg','Este es un/a Chaqueta de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(17,2,'Camiseta',693.00,'https://m.media-amazon.com/images/I/61Kz6Yb9c6L._AC_SX679_.jpg','Este es un/a Camiseta de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(18,2,'Shorts',792.00,'https://m.media-amazon.com/images/I/91H5CS26hQL._AC_SX569_.jpg','Este es un/a Shorts de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(19,2,'Abrigo',891.00,'https://m.media-amazon.com/images/I/71vZKLoiRlL._AC_SY741_.jpg','Este es un/a Abrigo de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(20,2,'Jeans',990.00,'https://m.media-amazon.com/images/I/91QV-tf7-mL._AC_SX569_.jpg','Este es un/a Jeans de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(21,3,'Pantalón',99.00,'https://m.media-amazon.com/images/I/81boEpB78-L._AC_SY741_.jpg','Este es un/a Pantalón de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(22,3,'Camisa',198.00,'https://m.media-amazon.com/images/I/81QPMaffW4L._AC_SX569_.jpg','Este es un/a Camisa de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(23,3,'Camiseta',297.00,'https://m.media-amazon.com/images/I/71Fggn+RX0L._AC_SX679_.jpg','Este es un/a Camiseta de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(24,3,'Suéter',396.00,'https://m.media-amazon.com/images/I/71NeYmo8YML._AC_SX679_.jpg','Este es un/a Suéter de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(25,3,'Chaqueta',495.00,'https://m.media-amazon.com/images/I/61FRV9fNTeL._AC_SX679_.jpg','Este es un/a Chaqueta de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(26,3,'Shorts',594.00,'https://m.media-amazon.com/images/I/71FJJkm5r5L._AC_SX679_.jpg','Este es un/a Shorts de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(27,3,'Abrigo',693.00,'https://m.media-amazon.com/images/I/61bhPVJa7UL._AC_SX679_.jpg','Este es un/a Abrigo de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(28,3,'Jeans',792.00,'https://m.media-amazon.com/images/I/817FrT-nRmL._AC_SX679_.jpg','Este es un/a Jeans de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(29,3,'Sudadera',891.00,'https://m.media-amazon.com/images/I/61Pwuuyny7L._AC_SX679_.jpg','Este es un/a Sudadera de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(30,3,'Chándal',990.00,'https://m.media-amazon.com/images/I/81q7d7yHrYL._AC_SX679_.jpg','Este es un/a Chándal de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(31,4,'Body',99.00,'https://m.media-amazon.com/images/I/91Xpc1gOuQL._AC_SY741_.jpg','Este es un/a Body de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(32,4,'Pelele',198.00,'https://m.media-amazon.com/images/I/71YUofkqIUL._AC_SX679_.jpg','Este es un/a Pelele de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(33,4,'Vestido',297.00,'https://m.media-amazon.com/images/I/61e38+hD8hL._AC_SX679_.jpg','Este es un/a Vestido de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(34,4,'Pantalón Corto',396.00,'https://m.media-amazon.com/images/I/A1rJxpdxUbL._AC_SX569_.jpg','Este es un/a Pantalón Corto de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(35,4,'Pantalón Largo',495.00,'https://m.media-amazon.com/images/I/61U5oat3TcL._AC_SY741_.jpg','Este es un/a Pantalón Largo de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(36,4,'Camiseta',594.00,'https://m.media-amazon.com/images/I/71dS+orZ2lL._AC_SX679_.jpg','Este es un/a Camiseta de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(37,4,'Suéter',693.00,'https://m.media-amazon.com/images/I/71+CXetLqcL._AC_SX679_.jpg','Este es un/a Suéter de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(38,4,'Chaqueta',792.00,'https://m.media-amazon.com/images/I/61DZXt84HgL._AC_SX569_.jpg','Este es un/a Chaqueta de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(39,4,'Gorro',891.00,'https://m.media-amazon.com/images/I/51ZEgsmAfoL.__AC_SY445_SX342_QL70_ML2_.jpg','Este es un/a Gorro de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(40,4,'Calcetines',990.00,'https://m.media-amazon.com/images/I/715GL7jPIkL._AC_SX679_.jpg','Este es un/a Calcetines de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(41,5,'Bufanda',99.00,'https://m.media-amazon.com/images/I/71pDKBeCV7L._AC_SY741_.jpg','Este es un/a Bufanda de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(42,5,'Cinturón',198.00,'https://m.media-amazon.com/images/I/71o9r9qAHhL._AC_SX679_.jpg','Este es un/a Cinturón de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(43,5,'Sombrero',297.00,'https://m.media-amazon.com/images/I/91EoCWM6nOL._AC_SX679_.jpg','Este es un/a Sombrero de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(44,5,'Reloj de Pulsera',396.00,'https://m.media-amazon.com/images/I/71vPMKF0ipL._AC_SX679_.jpg','Este es un/a Reloj de Pulsera de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(45,5,'Collar',495.00,'https://m.media-amazon.com/images/I/518Pu8+4OSL._AC_SX679_.jpg','Este es un/a Collar de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(46,5,'Pulsera',594.00,'https://m.media-amazon.com/images/I/611Z-IoalcL._AC_SX679_.jpg','Este es un/a Pulsera de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(47,5,'Pendientes',693.00,'https://m.media-amazon.com/images/I/61cE2JfJazL._AC_SX679_.jpg','Este es un/a Pendientes de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(48,5,'Anillo',792.00,'https://m.media-amazon.com/images/I/61hX9FFmhKL._AC_SY575_.jpg','Este es un/a Anillo de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(49,5,'Gafas de Sol',891.00,'https://m.media-amazon.com/images/I/719ZaUu6f9L._AC_SX679_.jpg','Este es un/a Gafas de Sol de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(50,5,'Gafas de Sol',990.00,'https://m.media-amazon.com/images/I/41O-U3OkolS._AC_SX679_.jpg','Este es un/a Gafas de Sol de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(51,6,'Sujetador',99.00,'https://m.media-amazon.com/images/I/71xVcZ2FIuL.__AC_SX342_SY445_QL70_ML2_.jpg','Este es un/a Sujetador de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(52,6,'Bragas/Calzoncillos Bóxer',198.00,'https://m.media-amazon.com/images/I/51EiRsy7OYL._AC_SX679_.jpg','Este es un/a Bragas/Calzoncillos Bóxer de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(53,6,'Bikini/Slip/Tanga/Culotte',297.00,'https://m.media-amazon.com/images/I/61i-FmFDrSL._AC_SX679_.jpg','Este es un/a Bikini/Slip/Tanga/Culotte de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(54,6,'Camisón/Pijama/Ropa de Dormir',396.00,'https://m.media-amazon.com/images/I/61hGxxsjyzL._AC_SX679_.jpg','Este es un/a Camisón/Pijama/Ropa de Dormir de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(55,6,'Liguero/Medias con Liga',495.00,'https://m.media-amazon.com/images/I/51hDB-+bu-L._AC_SX679_.jpg','Este es un/a Liguero/Medias con Liga de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(56,6,'Body/Corsé',594.00,'https://m.media-amazon.com/images/I/81vhYd-KkUL._AC_SX679_.jpg','Este es un/a Body/Corsé de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(57,6,'Ropa íntima genérica',693.00,'https://m.media-amazon.com/images/I/71Xr25rGxxL._AC_SX679_.jpg','Este es un/a Ropa íntima genérica de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(58,6,'Ropa íntima genérica',792.00,'https://m.media-amazon.com/images/I/71XnD1YzqrL._AC_SX679_.jpg','Este es un/a Ropa íntima genérica de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(59,6,'Ropa íntima genérica',891.00,'https://m.media-amazon.com/images/I/61lK+9XTVdL._AC_SX679_.jpg','Este es un/a Ropa íntima genérica de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(60,6,'Ropa íntima genérica',990.00,'https://m.media-amazon.com/images/I/71MhbC4c+uL._AC_SX679_.jpg','Este es un/a Ropa íntima genérica de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(61,7,'Conjunto de Falda y Blusa',99.00,'https://m.media-amazon.com/images/I/51L7xzOp0IL._AC_SY741_.jpg','Este es un/a Conjunto de Falda y Blusa de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(62,7,'Conjunto de Pantalón y Blusa',198.00,'https://m.media-amazon.com/images/I/61HsUc4iMZL._AC_SY741_.jpg','Este es un/a Conjunto de Pantalón y Blusa de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(63,7,'Conjunto de Short y Blusa',297.00,'https://m.media-amazon.com/images/I/61ptzGmqvjL._AC_SY741_.jpg','Este es un/a Conjunto de Short y Blusa de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(64,7,'Conjunto de Vestido y Chaqueta',396.00,'https://m.media-amazon.com/images/I/8172RVyOweL._AC_SX679_.jpg','Este es un/a Conjunto de Vestido y Chaqueta de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(65,7,'Conjunto Deportivo',495.00,'https://m.media-amazon.com/images/I/81k132BpyoS._AC_SX679_.jpg','Este es un/a Conjunto Deportivo de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(66,7,'Conjunto genérico',594.00,'https://m.media-amazon.com/images/I/61em9S285oL._AC_SX679_.jpg','Este es un/a Conjunto genérico de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(67,7,'Conjunto genérico',693.00,'https://m.media-amazon.com/images/I/61ph3KL8wIL._AC_SY741_.jpg','Este es un/a Conjunto genérico de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(68,7,'Conjunto genérico',792.00,'https://m.media-amazon.com/images/I/71TxLvqGtGL._AC_SX569_.jpg','Este es un/a Conjunto genérico de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(69,7,'Conjunto genérico',891.00,'https://m.media-amazon.com/images/I/61l1FiyuP9L._AC_SY741_.jpg','Este es un/a Conjunto genérico de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(70,7,'Conjunto genérico',990.00,'https://m.media-amazon.com/images/I/61zNp6jDl0L._AC_SX679_.jpg','Este es un/a Conjunto genérico de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(71,8,'Calcetines Tobilleros',99.00,'https://m.media-amazon.com/images/I/61fgStbI+7L._AC_SX679_.jpg','Este es un/a Calcetines Tobilleros de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(72,8,'Calcetines Deportivos',198.00,'https://m.media-amazon.com/images/I/81zwruTidEL._AC_SX679_.jpg','Este es un/a Calcetines Deportivos de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(73,8,'Calcetines Largos',297.00,'https://m.media-amazon.com/images/I/711Sb9K-NVL._AC_SX679_.jpg','Este es un/a Calcetines Largos de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(74,8,'Medias Pantimedias',396.00,'https://m.media-amazon.com/images/I/71IkJblAYGL._AC_SX679_.jpg','Este es un/a Medias Pantimedias de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(75,8,'Medias Transparentes',495.00,'https://m.media-amazon.com/images/I/21VpHuvOx2L.__AC_SY300_SX300_QL70_ML2_.jpg','Este es un/a Medias Transparentes de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(76,8,'Medias Opacas',594.00,'https://m.media-amazon.com/images/I/71cF7cgsqqL._AC_SX679_.jpg\r\n','Este es un/a Medias Opacas de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(77,8,'Medias de Red',693.00,'https://m.media-amazon.com/images/I/71TZYIjtuPL._AC_SX679_.jpg','Este es un/a Medias de Red de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(78,8,'Leggings Lisos',792.00,'https://m.media-amazon.com/images/I/61aQBJ8606L._AC_SX679_.jpg','Este es un/a Leggings Lisos de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(79,8,'Leggings Estampados',891.00,'https://m.media-amazon.com/images/I/81Okq9azv9L._AC_SY741_.jpg','Este es un/a Leggings Estampados de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(80,8,'Leggings Deportivos',990.00,'https://m.media-amazon.com/images/I/51ZqhGsW5yL._AC_SX569_.jpg','Este es un/a Leggings Deportivos de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(81,9,'Vestido Largo',99.00,'https://m.media-amazon.com/images/I/51wlXznFwmL._AC_SX679_.jpg','Este es un/a Vestido Largo de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(82,9,'Vestido Corto',198.00,'https://m.media-amazon.com/images/I/61XoMCeXLXL._AC_SY741_.jpg','Este es un/a Vestido Corto de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(83,9,'Vestido Midi',297.00,'https://m.media-amazon.com/images/I/81-Se+TbIGL._AC_SX569_.jpg','Este es un/a Vestido Midi de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(84,9,'Vestido Ajustado',396.00,'https://m.media-amazon.com/images/I/61ppvDRybEL._AC_SY741_.jpg','Este es un/a Vestido Ajustado de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(85,9,'Vestido Suelto',495.00,'https://m.media-amazon.com/images/I/61VfgsJdJ6L._AC_SX569_.jpg','Este es un/a Vestido Suelto de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(86,9,'Vestido con Vuelo',594.00,'https://m.media-amazon.com/images/I/71VGigy2yrL._AC_SX679_.jpg','Este es un/a Vestido con Vuelo de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(87,9,'Vestido Camisero',693.00,'https://m.media-amazon.com/images/I/616EWiXHQmL._AC_SX679_.jpg','Este es un/a Vestido Camisero de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(88,9,'Vestido de Fiesta',792.00,'https://m.media-amazon.com/images/I/61sj3ERl5xL._AC_SX679_.jpg','Este es un/a Vestido de Fiesta de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(89,9,'Vestido Casual',891.00,'https://m.media-amazon.com/images/I/61br5SgMwKL._AC_SX569_.jpg','Este es un/a Vestido Casual de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(90,9,'Vestido Estampado',990.00,'https://m.media-amazon.com/images/I/71TC8Jp1BBS._AC_SY741_.jpg','Este es un/a Vestido Estampado de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(91,10,'Bikini',99.00,'https://m.media-amazon.com/images/I/71cgRbGYzDL._AC_SY741_.jpg','Este es un/a Bikini de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(92,10,'Traje de Baño de una Pieza',198.00,'https://m.media-amazon.com/images/I/716boxZKmTL._AC_SY741_.jpg','Este es un/a Traje de Baño de una Pieza de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(93,10,'Traje de Baño Deportivo',297.00,'https://m.media-amazon.com/images/I/61y41LzzUSS._AC_SY741_.jpg','Este es un/a Traje de Baño Deportivo de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(94,10,'Traje de Baño con Falda',396.00,'https://m.media-amazon.com/images/I/61dDXrzfu2L._AC_SY741_.jpg','Este es un/a Traje de Baño con Falda de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(95,10,'Traje de Baño con Short',495.00,'https://m.media-amazon.com/images/I/61rZePkdcXL._AC_SY741_.jpg','Este es un/a Traje de Baño con Short de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(96,10,'Traje de Baño con Volantes',594.00,'https://m.media-amazon.com/images/I/61mxTnZnhOL._AC_SX569_.jpg','Este es un/a Traje de Baño con Volantes de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(97,10,'Traje de Baño con Escote Halter',693.00,'https://m.media-amazon.com/images/I/71lMIxmao0L.__AC_SX342_SY445_QL70_ML2_.jpg','Este es un/a Traje de Baño con Escote Halter de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(98,10,'Traje de Baño con Escote Bandeau',792.00,NULL,'Este es un/a Traje de Baño con Escote Bandeau de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(99,10,'Traje de Baño con Escote en V',891.00,NULL,'Este es un/a Traje de Baño con Escote en V de alta calidad.',_binary '','2023-08-14 19:45:53',NULL),(100,10,'Traje de Baño con Escote en V',990.00,NULL,'Este es un/a Traje de Baño con Escote en V de alta calidad.',_binary '','2023-08-14 19:45:53',NULL);
/*!40000 ALTER TABLE `tbb_productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgr_ai_producto` AFTER INSERT ON `tbb_productos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_productos", "CREATE",
    CONCAT_WS("","El usuario: ", USER(), " ha insertado un nuevo PRODUCTO con el ID: ", new.id, " con el CATEGORIA_ID: ", 
    new.categoria_id, " con el NOMBRE: ", new.nombre, " con el PRECIO: ", new.precio, " con la IMAGEN: ", new.imagen,
    " con la DESCRIPCIÓN: ", new.descripcion, " con ESTATUS por defecto: ", 
    IF(new.estatus,'1','0'), " con FECHA DE REGISTRO: ", new.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_productos_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_productos` FOR EACH ROW BEGIN
SET NEW.FECHA_ULTIMA_ACTUALIZACION = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_productos_AFTER_UPDATE` AFTER UPDATE ON `tbb_productos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_productos", "UPDATE",
    CONCAT_WS("","El usuario: ", USER(), " ha modificado el PRODUCTO con ID: ",new.id,
    " con los siguientes cambios: ",
        IF(new.id = old.id,"", CONCAT_WS(""," el ID de: ", old.id," a: ", new.id)),
        IF(new.categoria_id = old.categoria_id,"", CONCAT_WS("",", el CATEGORIA_ID de: ", old.categoria_id," a: ", new.categoria_id)),
        IF(new.nombre = old.nombre,"", CONCAT_WS("",", el NOMBRE de: ", old.nombre," a:", new.nombre)),
        IF(new.precio = old.precio,"", CONCAT_WS("",", el PRECIO de: ", old.precio," a:", new.precio)),
        IF(new.imagen = old.imagen,"", CONCAT_WS("",", la IMAGEN de: ", old.imagen," a:", new.imagen)),
        IF(new.descripcion = old.descripcion,"", CONCAT_WS("",", la DESCRIPCIÓN de: ", old.descripcion," a:", new.descripcion)),
        IF(new.estatus = old.estatus,"", CONCAT_WS("",", el ESTATUS de: ",  IF(old.estatus,'1','0')," a: ",  IF(new.estatus,'1','0'))),
        IF(new.fecha_registro = old.fecha_registro,"", CONCAT_WS(""," el FECHA_DE_REGISTRO de: ", old.fecha_registro," a: ", new.fecha_registro)),""), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_productos_BEFORE_DELETE` BEFORE DELETE ON `tbb_productos` FOR EACH ROW BEGIN
declare v_usuario varchar(80) default user();
    declare MESSAGGE_TEXT varchar(255) default "";
    
    if v_usuario != "root@localhost" then
		signal sqlstate '45000'
        set	MESSAGE_TEXT = 'No tienes los privilegios para borrar la infromacion de la tabla: tbb_productos';
    end if; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_productos_AFTER_DELETE` AFTER DELETE ON `tbb_productos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_productos", "DELETE",
    CONCAT_WS("","El usuario: ", USER(), " ha eliminado un PRODUCTO con el ID: ", old.id, " con el CATEGORIA_ID: ", 
    old.categoria_id, " con el NOMBRE: ", old.nombre, " con el PRECIO: ", old.precio, " con la IMAGEN: ", old.imagen,
    " con la DESCRIPCIÓN: ", old.descripcion, " con ESTATUS por defecto: ", 
    IF(old.estatus,'1','0'), " con FECHA DE REGISTRO: ", old.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_reseñas`
--

DROP TABLE IF EXISTS `tbb_reseñas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_reseñas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `USUARIO_ID` int unsigned NOT NULL,
  `PRODUCTO_ID` int unsigned NOT NULL,
  `COMENTARIO` text NOT NULL,
  `CALIFICACION` int NOT NULL,
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FECHA_ULTIMA_ACTUALIZACION` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USUARIO_ID` (`USUARIO_ID`),
  KEY `PRODUCTO_ID` (`PRODUCTO_ID`),
  CONSTRAINT `tbb_reseñas_ibfk_1` FOREIGN KEY (`USUARIO_ID`) REFERENCES `tbb_usuarios` (`PERSONA_ID`),
  CONSTRAINT `tbb_reseñas_ibfk_2` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `tbb_productos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_reseñas`
--

LOCK TABLES `tbb_reseñas` WRITE;
/*!40000 ALTER TABLE `tbb_reseñas` DISABLE KEYS */;
INSERT INTO `tbb_reseñas` VALUES (1,33,1,'Este producto ha sido una excelente adquisición. Me encanta cómo funciona y la calidad es impresionante.',4,'2023-08-17 09:34:50',NULL),(2,10,2,'Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia.',5,'2023-08-17 09:34:50',NULL),(3,12,3,'Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia.',5,'2023-08-17 09:34:50',NULL),(4,14,4,'Un producto promedio. Cumple su función pero no me ha sorprendido en ninguno de sus aspectos.',2,'2023-08-17 09:34:50',NULL),(5,43,5,'Este producto es bastante decente. Cumple su propósito y no tuve problemas importantes, aunque creo que hay algunas áreas en las que se podría mejorar.',3,'2023-08-17 09:34:50',NULL),(6,48,6,'No quedé impresionado con este producto. Tuve varios problemas con su rendimiento y las características no eran lo que esperaba. Creo que hay otros productos en el mercado que ofrecen un mejor valor.',1,'2023-08-17 09:34:50',NULL),(7,1,7,'No quedé impresionado con este producto. Tuve varios problemas con su rendimiento y las características no eran lo que esperaba. Creo que hay otros productos en el mercado que ofrecen un mejor valor.',1,'2023-08-17 09:34:50',NULL),(8,42,8,'Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia.',4,'2023-08-17 09:34:50',NULL),(9,6,9,'Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia.',4,'2023-08-17 09:34:50',NULL),(10,1,10,'El producto me ha dejado muy satisfecho. Es de gran calidad, funciona perfectamente y me encanta su diseño.',4,'2023-08-17 09:34:50',NULL),(11,19,11,'Un producto promedio. Cumple su función pero no me ha sorprendido en ninguno de sus aspectos.',3,'2023-08-17 09:34:50',NULL),(12,37,12,'Este producto ha sido una excelente adquisición. Me encanta cómo funciona y la calidad es impresionante.',5,'2023-08-17 09:34:50',NULL),(13,24,13,'Honestamente, me ha decepcionado este producto. Creo que debería mejorar en varios aspectos para justificar su precio.',2,'2023-08-17 09:34:50',NULL),(14,32,14,'Este producto me ha dejado asombrado. No solo por su alta calidad, sino también por su atención al detalle y su diseño impresionante.',4,'2023-08-17 09:34:50',NULL),(15,35,15,'Este producto es bastante decente. Cumple su propósito y no tuve problemas importantes, aunque creo que hay algunas áreas en las que se podría mejorar.',2,'2023-08-17 09:34:50',NULL),(16,42,16,'El producto me ha dejado muy satisfecho. Es de gran calidad, funciona perfectamente y me encanta su diseño.',4,'2023-08-17 09:34:50',NULL),(17,15,17,'Honestamente, me ha decepcionado este producto. Creo que debería mejorar en varios aspectos para justificar su precio.',2,'2023-08-17 09:34:50',NULL),(18,21,18,'Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia.',5,'2023-08-17 09:34:50',NULL),(19,23,19,'Un producto promedio. Cumple su función pero no me ha sorprendido en ninguno de sus aspectos.',3,'2023-08-17 09:34:50',NULL),(20,46,20,'El producto no ha sido lo que esperaba. Los materiales parecen de baja calidad y ha habido varios problemas en su funcionamiento.',2,'2023-08-17 09:34:50',NULL),(21,41,21,'No quedé impresionado con este producto. Tuve varios problemas con su rendimiento y las características no eran lo que esperaba. Creo que hay otros productos en el mercado que ofrecen un mejor valor.',1,'2023-08-17 09:34:50',NULL),(22,4,22,'No quedé impresionado con este producto. Tuve varios problemas con su rendimiento y las características no eran lo que esperaba. Creo que hay otros productos en el mercado que ofrecen un mejor valor.',2,'2023-08-17 09:34:50',NULL),(23,40,23,'Este producto me ha dejado asombrado. No solo por su alta calidad, sino también por su atención al detalle y su diseño impresionante.',5,'2023-08-17 09:34:50',NULL),(24,8,24,'La calidad del producto es aceptable, pero no me ha sorprendido. Si buscas algo básico, puede ser una buena opción.',2,'2023-08-17 09:34:50',NULL),(25,11,25,'Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia.',5,'2023-08-17 09:34:50',NULL),(26,23,26,'No quedé impresionado con este producto. Tuve varios problemas con su rendimiento y las características no eran lo que esperaba. Creo que hay otros productos en el mercado que ofrecen un mejor valor.',1,'2023-08-17 09:34:50',NULL),(27,12,27,'Este producto ha sido una excelente adquisición. Me encanta cómo funciona y la calidad es impresionante.',4,'2023-08-17 09:34:50',NULL),(28,50,28,'Honestamente, me ha decepcionado este producto. Creo que debería mejorar en varios aspectos para justificar su precio.',1,'2023-08-17 09:34:50',NULL),(29,19,29,'Honestamente, me ha decepcionado este producto. Creo que debería mejorar en varios aspectos para justificar su precio.',1,'2023-08-17 09:34:50',NULL),(30,49,30,'La calidad del producto es aceptable, pero no me ha sorprendido. Si buscas algo básico, puede ser una buena opción.',3,'2023-08-17 09:34:50',NULL),(31,25,31,'Este producto ha sido una excelente adquisición. Me encanta cómo funciona y la calidad es impresionante.',5,'2023-08-17 09:34:50',NULL),(32,41,32,'Un producto promedio. Cumple su función pero no me ha sorprendido en ninguno de sus aspectos.',3,'2023-08-17 09:34:50',NULL),(33,38,33,'Este producto ha sido una excelente adquisición. Me encanta cómo funciona y la calidad es impresionante.',5,'2023-08-17 09:34:50',NULL),(34,41,34,'Honestamente, me ha decepcionado este producto. Creo que debería mejorar en varios aspectos para justificar su precio.',1,'2023-08-17 09:34:50',NULL),(35,30,35,'Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia.',5,'2023-08-17 09:34:50',NULL),(36,49,36,'Un producto promedio. Cumple su función pero no me ha sorprendido en ninguno de sus aspectos.',3,'2023-08-17 09:34:50',NULL),(37,45,37,'Este producto me ha dejado asombrado. No solo por su alta calidad, sino también por su atención al detalle y su diseño impresionante.',4,'2023-08-17 09:34:50',NULL),(38,24,38,'Este producto es bastante decente. Cumple su propósito y no tuve problemas importantes, aunque creo que hay algunas áreas en las que se podría mejorar.',2,'2023-08-17 09:34:50',NULL),(39,17,39,'Este producto ha sido una excelente adquisición. Me encanta cómo funciona y la calidad es impresionante.',5,'2023-08-17 09:34:50',NULL),(40,41,40,'Este producto es bastante decente. Cumple su propósito y no tuve problemas importantes, aunque creo que hay algunas áreas en las que se podría mejorar.',3,'2023-08-17 09:34:50',NULL),(41,31,41,'El producto me ha dejado muy satisfecho. Es de gran calidad, funciona perfectamente y me encanta su diseño.',4,'2023-08-17 09:34:50',NULL),(42,42,42,'El producto no ha sido lo que esperaba. Los materiales parecen de baja calidad y ha habido varios problemas en su funcionamiento.',2,'2023-08-17 09:34:50',NULL),(43,11,43,'Este producto es bastante decente. Cumple su propósito y no tuve problemas importantes, aunque creo que hay algunas áreas en las que se podría mejorar.',3,'2023-08-17 09:34:50',NULL),(44,20,44,'La calidad del producto es aceptable, pero no me ha sorprendido. Si buscas algo básico, puede ser una buena opción.',3,'2023-08-17 09:34:50',NULL),(45,43,45,'El producto me ha dejado muy satisfecho. Es de gran calidad, funciona perfectamente y me encanta su diseño.',4,'2023-08-17 09:34:50',NULL),(46,10,46,'La calidad del producto es aceptable, pero no me ha sorprendido. Si buscas algo básico, puede ser una buena opción.',3,'2023-08-17 09:34:50',NULL),(47,38,47,'Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia.',5,'2023-08-17 09:34:50',NULL),(48,3,48,'Este producto me ha dejado asombrado. No solo por su alta calidad, sino también por su atención al detalle y su diseño impresionante.',4,'2023-08-17 09:34:50',NULL),(49,25,49,'El producto no ha sido lo que esperaba. Los materiales parecen de baja calidad y ha habido varios problemas en su funcionamiento.',2,'2023-08-17 09:34:50',NULL),(50,17,50,'La calidad del producto es aceptable, pero no me ha sorprendido. Si buscas algo básico, puede ser una buena opción.',2,'2023-08-17 09:34:50',NULL);
/*!40000 ALTER TABLE `tbb_reseñas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgr_ai_reseña` AFTER INSERT ON `tbb_reseñas` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_reseñas", "CREATE",
    CONCAT_WS("","El usuario: ", USER(), " ha insertado una nueva RESEÑA con el ID: ", new.id, " con el USUARIO_ID: ", 
    new.usuario_id, " con el PRODUCTO_ID: ", new.producto_id, " con el COMENTARIO: ", new.comentario, " con la CALIFICACIÓN: ", new.calificacion,
    " con FECHA DE REGISTRO: ", new.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_reseñas_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_reseñas` FOR EACH ROW BEGIN
SET NEW.FECHA_ULTIMA_ACTUALIZACION = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_reseñas_AFTER_UPDATE` AFTER UPDATE ON `tbb_reseñas` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_reseñas", "UPDATE",
    CONCAT_WS("","El usuario: ", USER(), " ha modificado la RESEÑA con ID: ",new.id,
    " con los siguientes cambios: ",
        IF(new.id = old.id,"", CONCAT_WS(""," el ID de: ", old.id," a: ", new.id)),
        IF(new.usuario_id = old.usuario_id,"", CONCAT_WS("",", el USUARIO_ID de: ", old.usuario_id," a: ", new.usuario_id)),
        IF(new.producto_id = old.producto_id,"", CONCAT_WS("",", el PRODUCTO_ID de: ", old.producto_id," a:", new.producto_id)),
        IF(new.comentario = old.comentario,"", CONCAT_WS("",", el COMENTARIO de: ", old.comentario," a:", new.comentario)),
        IF(new.calificacion = old.calificacion,"", CONCAT_WS("",", la CALIFICACIÓN de: ", old.calificacion," a:", new.calificacion)),
        IF(new.fecha_registro = old.fecha_registro,"", CONCAT_WS(""," el FECHA_DE_REGISTRO de: ", old.fecha_registro," a: ", new.fecha_registro)),""), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_reseñas_BEFORE_DELETE` BEFORE DELETE ON `tbb_reseñas` FOR EACH ROW BEGIN
declare v_usuario varchar(80) default user();
    declare MESSAGGE_TEXT varchar(255) default "";
    
    if v_usuario != "root@localhost" then
		signal sqlstate '45000'
        set	MESSAGE_TEXT = 'No tienes los privilegios para borrar la infromacion de la tabla: tbb_reseñas';
    end if; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_reseñas_AFTER_DELETE` AFTER DELETE ON `tbb_reseñas` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_reseñas", "DELETE",
    CONCAT_WS("","El usuario: ", USER(), " ha eliminado una RESEÑA con el ID: ", old.id, " con el USUARIO_ID: ", 
    old.usuario_id, " con el PRODUCTO_ID: ", old.producto_id, " con el COMENTARIO: ", old.comentario, " con la CALIFICACIÓN: ", old.calificacion,
    " con FECHA DE REGISTRO: ", old.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_sistema_de_apartado`
--

DROP TABLE IF EXISTS `tbb_sistema_de_apartado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_sistema_de_apartado` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `USUARIO_ID` int unsigned NOT NULL,
  `PRODUCTO_ID` int unsigned NOT NULL,
  `ESTATUS` bit(1) NOT NULL DEFAULT b'1',
  `FECHA_ENTREGA_MAX` date NOT NULL,
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FECHA_ULTIMA_ACTUALIZACION` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USUARIO_ID` (`USUARIO_ID`),
  KEY `PRODUCTO_ID` (`PRODUCTO_ID`),
  CONSTRAINT `tbb_sistema_de_apartado_ibfk_1` FOREIGN KEY (`USUARIO_ID`) REFERENCES `tbb_usuarios` (`PERSONA_ID`),
  CONSTRAINT `tbb_sistema_de_apartado_ibfk_2` FOREIGN KEY (`PRODUCTO_ID`) REFERENCES `tbb_productos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_sistema_de_apartado`
--

LOCK TABLES `tbb_sistema_de_apartado` WRITE;
/*!40000 ALTER TABLE `tbb_sistema_de_apartado` DISABLE KEYS */;
INSERT INTO `tbb_sistema_de_apartado` VALUES (1,26,61,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(2,27,81,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(3,24,91,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(4,7,95,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(5,17,80,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(6,1,67,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(7,16,54,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(8,39,21,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(9,37,8,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(10,8,52,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(11,7,11,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(12,7,37,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(13,21,100,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(14,37,66,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(15,6,54,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(16,18,19,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(17,43,74,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(18,5,30,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(19,9,99,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(20,21,7,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(21,6,35,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(22,22,6,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(23,2,97,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(24,38,85,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(25,49,31,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(26,32,22,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(27,11,39,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(28,16,37,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(29,46,46,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(30,27,30,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(31,46,62,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(32,19,1,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(33,47,61,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(34,12,39,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(35,12,96,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(36,5,59,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(37,33,50,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(38,28,22,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(39,23,59,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(40,30,17,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(41,4,90,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(42,13,57,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(43,4,68,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(44,7,65,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(45,42,19,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(46,24,77,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(47,21,82,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(48,40,55,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(49,18,12,_binary '','2023-08-24','2023-08-17 09:36:02',NULL),(50,26,19,_binary '','2023-08-24','2023-08-17 09:36:02',NULL);
/*!40000 ALTER TABLE `tbb_sistema_de_apartado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgr_ai_sistema_de_apartado` AFTER INSERT ON `tbb_sistema_de_apartado` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_sistema_de_apartado", "CREATE",
    CONCAT_WS("","El usuario: ", USER(), " ha insertado un nuevo SISTEMA DE APARTADO con el ID: ", new.id, " con el USUARIO_ID: ", 
    new.usuario_id, " con el PRODUCTO_ID: ", new.producto_id, " con ESTATUS por defecto: ", 
    IF(new.estatus,'1','0'), " con FECHA_ENTREGA_MAX: ", new.fecha_entrega_max, " con FECHA DE REGISTRO: ", new.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_sistema_de_apartado_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_sistema_de_apartado` FOR EACH ROW BEGIN
SET NEW.FECHA_ULTIMA_ACTUALIZACION = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_sistema_de_apartado_AFTER_UPDATE` AFTER UPDATE ON `tbb_sistema_de_apartado` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_sistema_de_apartado", "UPDATE",
    CONCAT_WS("","El usuario: ", USER(), " ha modificado el SISTEMA DE APARTADO con ID: ",new.id,
    " con los siguientes cambios: ",
        IF(new.id = old.id,"", CONCAT_WS(""," el ID de: ", old.id," a: ", new.id)),
        IF(new.usuario_id = old.usuario_id,"", CONCAT_WS("",", el USUARIO_ID de: ", old.usuario_id," a: ", new.usuario_id)),
        IF(new.producto_id = old.producto_id,"", CONCAT_WS("",", el PRODUCTO_ID de: ", old.producto_id," a:", new.producto_id)),
        IF(new.estatus = old.estatus,"", CONCAT_WS("",", el ESTATUS de: ",  IF(old.estatus,'1','0')," a: ",  IF(new.estatus,'1','0'))),
        IF(new.fecha_entrega_max = old.fecha_entrega_max,"", CONCAT_WS("",", la FECHA_ENTREGA_MAX de: ", old.fecha_entrega_max," a:", new.fecha_entrega_max)),
        IF(new.fecha_registro = old.fecha_registro,"", CONCAT_WS(""," el FECHA_DE_REGISTRO de: ", old.fecha_registro," a: ", new.fecha_registro)),""), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_sistema_de_apartado_BEFORE_DELETE` BEFORE DELETE ON `tbb_sistema_de_apartado` FOR EACH ROW BEGIN
declare v_usuario varchar(80) default user();
    declare MESSAGGE_TEXT varchar(255) default "";
    
    if v_usuario != "root@localhost" then
		signal sqlstate '45000'
        set	MESSAGE_TEXT = 'No tienes los privilegios para borrar la infromacion de la tabla: tbb_sistema_de_apartado';
    end if; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_sistema_de_apartado_AFTER_DELETE` AFTER DELETE ON `tbb_sistema_de_apartado` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_sistema_de_apartado", "DELETE",
    CONCAT_WS("","El usuario: ", USER(), " ha eliminado un SISTEMA DE APARTADO con el ID: ", old.id, " con el USUARIO_ID: ", 
    old.usuario_id, " con el PRODUCTO_ID: ", old.producto_id, " con ESTATUS por defecto: ", 
    IF(old.estatus,'1','0'), " con FECHA_ENTREGA_MAX: ", old.fecha_entrega_max, " con FECHA DE REGISTRO: ", old.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_ubicaciones`
--

DROP TABLE IF EXISTS `tbb_ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ubicaciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DIRECCION` varchar(150) NOT NULL,
  `CIUDAD` varchar(55) NOT NULL,
  `ESTADO` varchar(55) NOT NULL,
  `ESTATUS` bit(1) NOT NULL DEFAULT b'1',
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FECHA_ULTIMA_ACTUALIZACION` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_ubicaciones`
--

LOCK TABLES `tbb_ubicaciones` WRITE;
/*!40000 ALTER TABLE `tbb_ubicaciones` DISABLE KEYS */;
INSERT INTO `tbb_ubicaciones` VALUES (1,'Calle Los Pinos 156','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(2,'Calle Lerdo 375','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(3,'Calle Aldama 99','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(4,'Avenida Juarez 1300','Juan Galindo','Puebla',_binary '','2023-08-17 09:30:43',NULL),(5,'Calle Lerdo 400','Zihuateutla','Puebla',_binary '','2023-08-17 09:30:43',NULL),(6,'Avenida Zapata 18','Zihuateutla','Puebla',_binary '','2023-08-17 09:30:43',NULL),(7,'Monte grande ','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:30:43',NULL),(8,'Calle Lerdo 375','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(9,'Avenida Revolución 678','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:30:43',NULL),(10,'Calle Lerdo 905','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(11,'Calle Morelos 309','Juan Galindo','Puebla',_binary '','2023-08-17 09:30:43',NULL),(12,'Avenida Hidalgo 98','Juan Galindo','Puebla',_binary '','2023-08-17 09:30:43',NULL),(13,'Calle Ocampo 432','Zihuateutla','Puebla',_binary '','2023-08-17 09:30:43',NULL),(14,'Calle Morelos 359','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:30:43',NULL),(15,'Avenida Hidalgo 567','Juan Galindo','Puebla',_binary '','2023-08-17 09:30:43',NULL),(16,'Calle Hidalgo 2','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:30:43',NULL),(17,'Calle Lerdo 400','Zihuateutla','Puebla',_binary '','2023-08-17 09:30:43',NULL),(18,'Calle Bravo 542','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(19,'Calle Los Pinos 156','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(20,'Calle Ocampo 432','Zihuateutla','Puebla',_binary '','2023-08-17 09:30:43',NULL),(21,'Call los perales 22','Juan Galindo','Puebla',_binary '','2023-08-17 09:30:43',NULL),(22,'Avenida Reforma 503','Zihuateutla','Puebla',_binary '','2023-08-17 09:30:43',NULL),(23,'Calle Princpal Venustiano Carranza','Zihuateutla','Puebla',_binary '','2023-08-17 09:30:43',NULL),(24,'Calle Iturbide 57','Zihuateutla','Puebla',_binary '','2023-08-17 09:30:43',NULL),(25,'Avenida Revolución 678','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:30:43',NULL),(26,'Calle Matamoros 100','Juan Galindo','Puebla',_binary '','2023-08-17 09:30:43',NULL),(27,'Avenida Revolución 678','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:30:43',NULL),(28,'Avenida Zapata 18','Zihuateutla','Puebla',_binary '','2023-08-17 09:30:43',NULL),(29,'Calle Zaragoza 234','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:30:43',NULL),(30,'Call los perales 22','Juan Galindo','Puebla',_binary '','2023-08-17 09:30:43',NULL),(31,'Calle Guerrero 897','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(32,'El tabacal 33','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:30:43',NULL),(33,'Calle Bravo 542','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(34,'Avenida Hidalgo 123','Zihuateutla','Puebla',_binary '','2023-08-17 09:30:43',NULL),(35,'Calle Matamoros 100','Juan Galindo','Puebla',_binary '','2023-08-17 09:30:43',NULL),(36,'Los Pinos 22','Zihuateutla','Puebla',_binary '','2023-08-17 09:30:43',NULL),(37,'Calle Morelos 67','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(38,'Calzada Independencia 897','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:30:43',NULL),(39,'Calle Lerdo 400','Zihuateutla','Puebla',_binary '','2023-08-17 09:30:43',NULL),(40,'Calle Lerdo 400','Zihuateutla','Puebla',_binary '','2023-08-17 09:30:43',NULL),(41,'Avenida Hidalgo 567','Juan Galindo','Puebla',_binary '','2023-08-17 09:30:43',NULL),(42,'Avenida Madero 543','Zihuateutla','Puebla',_binary '','2023-08-17 09:30:43',NULL),(43,'Calle Lerdo 375','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(44,'Calle Guerrero 897','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(45,'Calle Ocampo 432','Zihuateutla','Puebla',_binary '','2023-08-17 09:30:43',NULL),(46,'Colonia centro','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:30:43',NULL),(47,'Calle Morelos 67','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(48,'Calle Los Pinos 156','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(49,'Calle Lerdo 905','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(50,'Calle Aldama 83','Huachinango','Puebla',_binary '','2023-08-17 09:30:43',NULL),(51,'Calle Bravo 750','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(52,'Calle Los Pinos 156','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(53,'Calle Lerdo 950','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(54,'Calle Hidalgo 321','Juan Galindo','Puebla',_binary '','2023-08-17 09:31:28',NULL),(55,'Avenida Madero 609','Juan Galindo','Puebla',_binary '','2023-08-17 09:31:28',NULL),(56,'Calle Guerrero 897','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(57,'Calle Allende 295','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(58,'Avenida Hidalgo 600','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(59,'Avenida Juarez 1200','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(60,'Calle Lerdo 950','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(61,'Avenida Zapata 18','Zihuateutla','Puebla',_binary '','2023-08-17 09:31:28',NULL),(62,'Calle Morelos 67','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(63,'Calle Hidalgo 2','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(64,'Calle Morelos 359','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(65,'Calle Hidalgo 2','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(66,'Calle Lerdo 400','Zihuateutla','Puebla',_binary '','2023-08-17 09:31:28',NULL),(67,'Calle Matamoros 79','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(68,'Calle Bravo 542','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(69,'Avenida Zapata 12','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(70,'Calle Zaragoza 234','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(71,'Calle Matamoros 79','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(72,'Avenida Revolución 678','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(73,'Calle Reforma 345','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(74,'Avenida Reforma 553','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(75,'Calle Lerdo 400','Zihuateutla','Puebla',_binary '','2023-08-17 09:31:28',NULL),(76,'Calle Bravo 750','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(77,'Calle Lerdo 905','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(78,'Avenida Juarez 1300','Juan Galindo','Puebla',_binary '','2023-08-17 09:31:28',NULL),(79,'Calle Bravo 672','Zihuateutla','Puebla',_binary '','2023-08-17 09:31:28',NULL),(80,'Calle Los Pinos 156','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(81,'Calle Lerdo 375','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(82,'Calle Galeana 89','Juan Galindo','Puebla',_binary '','2023-08-17 09:31:28',NULL),(83,'Calle Allende 295','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(84,'Calle Lerdo 905','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(85,'Calle Reforma 11','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(86,'Calle Iturbide 57','Zihuateutla','Puebla',_binary '','2023-08-17 09:31:28',NULL),(87,'Calle Reforma 11','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(88,'Calle Lerdo 905','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(89,'Calle Allende 295','Xicotepec de Juárez','Puebla',_binary '','2023-08-17 09:31:28',NULL),(90,'Avenida Juarez 1023','Zihuateutla','Puebla',_binary '','2023-08-17 09:31:28',NULL),(91,'Avenida Madero 609','Juan Galindo','Puebla',_binary '','2023-08-17 09:31:28',NULL),(92,'Calle Morelos 309','Juan Galindo','Puebla',_binary '','2023-08-17 09:31:28',NULL),(93,'Avenida Hidalgo 567','Juan Galindo','Puebla',_binary '','2023-08-17 09:31:28',NULL),(94,'Calle Aldama 83','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(95,'Calle Los Pinos 156','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(96,'Calle Guerrero 945','Juan Galindo','Puebla',_binary '','2023-08-17 09:31:28',NULL),(97,'Avenida Hidalgo 600','Huachinango','Puebla',_binary '','2023-08-17 09:31:28',NULL),(98,'Calle Ocampo 432','Zihuateutla','Puebla',_binary '','2023-08-17 09:31:28',NULL),(99,'Calle Iturbide 57','Zihuateutla','Puebla',_binary '','2023-08-17 09:31:29',NULL),(100,'Calle Lerdo 950','Huachinango','Puebla',_binary '','2023-08-17 09:31:29',NULL);
/*!40000 ALTER TABLE `tbb_ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgr_ai_ubicacion` AFTER INSERT ON `tbb_ubicaciones` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_ubicaciones", "CREATE",
    CONCAT_WS("","El usuario: ", USER(), " ha insertado una nueva UBICACIÓN con el ID: ", new.id, " con la DIRECCIÓN: ", 
    new.direccion, " con la CIUDAD: ", new.ciudad, " con el ESTADO: ", new.estado, " con ESTATUS por defecto: ", 
    IF(new.estatus,'1','0'), " con FECHA DE REGISTRO: ", new.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_ubicaciones_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_ubicaciones` FOR EACH ROW BEGIN
SET NEW.FECHA_ULTIMA_ACTUALIZACION = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_ubicaciones_AFTER_UPDATE` AFTER UPDATE ON `tbb_ubicaciones` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_ubicaciones", "UPDATE",
    CONCAT_WS("","El usuario: ", USER(), " ha modificado la UBICACIÓN con ID: ",new.id,
    " con los siguientes cambios: ",
        IF(new.id = old.id,"", CONCAT_WS(""," el ID de: ", old.id," a: ", new.id)),
        IF(new.direccion = old.direccion,"", CONCAT_WS("",", la DIRECCIÓN de: ", old.direccion," a: ", new.direccion)),
        IF(new.ciudad = old.ciudad,"", CONCAT_WS("",", la CIUDAD de: ", old.ciudad," a:", new.ciudad)),
        IF(new.estado = old.estado,"", CONCAT_WS("",", el ESTADO de: ", old.estado," a:", new.estado)),
        IF(new.estatus = old.estatus,"", CONCAT_WS("",", el ESTATUS de: ",  IF(old.estatus,'1','0')," a: ",  IF(new.estatus,'1','0'))),
        IF(new.fecha_registro = old.fecha_registro,"", CONCAT_WS(""," el FECHA_DE_REGISTRO de: ", old.fecha_registro," a: ", new.fecha_registro)),""), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_ubicaciones_BEFORE_DELETE` BEFORE DELETE ON `tbb_ubicaciones` FOR EACH ROW BEGIN
declare v_usuario varchar(80) default user();
    declare MESSAGGE_TEXT varchar(255) default "";
    
    if v_usuario != "root@localhost" then
		signal sqlstate '45000'
        set	MESSAGE_TEXT = 'No tienes los privilegios para borrar la infromacion de la tabla: tbb_ubicaciones';
    end if; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_ubicaciones_AFTER_DELETE` AFTER DELETE ON `tbb_ubicaciones` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_ubicaciones", "DELETE",
    CONCAT_WS("","El usuario: ", USER(), " ha eliminado una UBICACIÓN con el ID: ", old.id, " con la DIRECCIÓN: ", 
    old.direccion, " con la CIUDAD: ", old.ciudad, " con el ESTADO: ", old.estado, " con ESTATUS por defecto: ", 
    IF(old.estatus,'1','0'), " con FECHA DE REGISTRO: ", old.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_usuarios`
--

DROP TABLE IF EXISTS `tbb_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_usuarios` (
  `PERSONA_ID` int unsigned NOT NULL,
  `NOMBRE_USUARIO` varchar(60) DEFAULT NULL,
  `EMAIL` varchar(42) NOT NULL,
  `CONTRASEÑA` varchar(15) NOT NULL,
  `NUMERO_TELEFONICO` varchar(15) DEFAULT NULL,
  `ESTATUS` bit(1) NOT NULL DEFAULT b'1',
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PERSONA_ID`),
  UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`),
  UNIQUE KEY `NOMBRE_USUARIO_UNIQUE` (`NOMBRE_USUARIO`),
  UNIQUE KEY `NUMERO_TELEFONICO_UNIQUE` (`NUMERO_TELEFONICO`),
  CONSTRAINT `tbb_usuarios_ibfk_1` FOREIGN KEY (`PERSONA_ID`) REFERENCES `tbb_personas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_usuarios`
--

LOCK TABLES `tbb_usuarios` WRITE;
/*!40000 ALTER TABLE `tbb_usuarios` DISABLE KEYS */;
INSERT INTO `tbb_usuarios` VALUES (1,'Daniela Romero','d.romero@hushmail.com','zD=1U(7l','7645759834',_binary '','2023-08-17 09:31:28'),(2,'Ignacio Zamora','i.zamora@mail.com','tpu4(Abdo!Op','2224463772',_binary '','2023-08-17 09:31:28'),(3,'Ricardo Flores','r.flores@live.com','$XZEb','7764070629',_binary '','2023-08-17 09:31:28'),(4,'Dolores Vega','d.vega@outlook.com','GW)655Ls3&y)','2227440719',_binary '','2023-08-17 09:31:28'),(5,'Karla Delgado','k.delgado@yahoo.com','PsWEkMf*z','7643947289',_binary '','2023-08-17 09:31:28'),(6,'Paola Estrada','p.estrada@excite.com','55O','2229417134',_binary '','2023-08-17 09:31:28'),(7,'Julio Vargas','j.vargas@yahoo.com','PSw6)Certy%','2226632339',_binary '','2023-08-17 09:31:28'),(8,'Andrés Rubén Silva','a.silva@zoho.com','Egs_cAWk9TR','7641339300',_binary '','2023-08-17 09:31:28'),(9,'Juan Carlos Olivares','j.olivares@hushmail.com','6%bPWSb','7743896425',_binary '','2023-08-17 09:31:28'),(10,'César Torres','c.torres@hushmail.com','Zrj+Fp9FXbn@','7647531999',_binary '','2023-08-17 09:31:28'),(11,'Vanessa López','v.lópez@live.com','D0uw0R6lMbU-','7640691028',_binary '','2023-08-17 09:31:28'),(12,'Manuel Ponce','m.ponce@gmail.com','7mNf@+','7741626451',_binary '','2023-08-17 09:31:28'),(13,'David Carrillo','d.carrillo@live.com','Tat','2225343813',_binary '','2023-08-17 09:31:28'),(14,'Joaquín Granados','j.granados@zoho.com','E_M','554005290',_binary '','2023-08-17 09:31:28'),(15,'Sara Lara','s.lara@apple.com','eMCC6ZiQFI','7764150089',_binary '','2023-08-17 09:31:28'),(16,'Fernando Hernández','f.hernández@live.com','yS=hT13','7762361155',_binary '','2023-08-17 09:31:28'),(17,'Antonia Peña','a.peña@aol.com','aOY0LFS27','553198388',_binary '','2023-08-17 09:31:28'),(18,'Carolina Cordero','c.cordero@hotmail.com','oSAaacl0=','553730250',_binary '','2023-08-17 09:31:28'),(19,'Magdalena Georgina Díaz','m.díaz@excite.com','6Kf_P^8xm_rz=','7646759693',_binary '','2023-08-17 09:31:28'),(20,'Ivonne Campos','i.campos@fastmail.com','Fc_Wz9b','7767240631',_binary '','2023-08-17 09:31:28'),(21,'Marcela Quezada','m.quezada@hushmail.com','Zcm3','7640780626',_binary '','2023-08-17 09:31:28'),(22,'Carlos Alvarez','c.alvarez@outlook.com','Tl-LL-','7747068010',_binary '','2023-08-17 09:31:28'),(23,'Erik Hidalgo','e.hidalgo@hotmail.com','og^mlviU1Z','2228058708',_binary '','2023-08-17 09:31:28'),(24,'Antonio Trejo','a.trejo@fastmail.com','9c','557977206',_binary '','2023-08-17 09:31:28'),(25,'Gloria Olivares','g.olivares@mail.com','qsSmkn','7765411226',_binary '','2023-08-17 09:31:28'),(26,'Regina Dolores Cortés','r.cortés@live.com','Gd=32E$','7649856043',_binary '','2023-08-17 09:31:28'),(27,'Raúl Vega','r.vega@outlook.com','RtQaD(HKe&uZR$','2225621632',_binary '','2023-08-17 09:31:28'),(28,'Refugio Isabela Zamora','r.zamora@aol.com','1BZ','7760173023',_binary '','2023-08-17 09:31:28'),(29,'Andrés Cordero','a.cordero@excite.com','$f9#6AHk','7763267750',_binary '','2023-08-17 09:31:28'),(30,'Roberto Vega','r.vega@aol.com','NziSSnlt','7649805843',_binary '','2023-08-17 09:31:28'),(31,'Teresa Paula Villalobos','t.villalobos@zoho.com','dm1bber','7763625645',_binary '','2023-08-17 09:31:28'),(32,'Jazmín Rosario Alvarado','j.alvarado@fastmail.com','hU7c#l','555766447',_binary '','2023-08-17 09:31:28'),(33,'Hugo Guerrero','h.guerrero@live.com','kUTk=HucF=Te','7748093060',_binary '','2023-08-17 09:31:28'),(34,'Esther Rangel','e.rangel@yahoo.com','3scJ','7644833392',_binary '','2023-08-17 09:31:28'),(35,'Antonio Méndez','a.méndez@gmx.com','rAcl0&L8Kd@-JD','7746569567',_binary '','2023-08-17 09:31:28'),(36,'Ángeles Maldonado','á.maldonado@excite.com','$7BKwfNBsnkmI','7747268269',_binary '','2023-08-17 09:31:28'),(37,'Alicia Cristina Solís','a.solís@mail.com','@mAsnmApaJxi0gF','2220523391',_binary '','2023-08-17 09:31:28'),(38,'Adriana Ochoa','a.ochoa@fastmail.com','EyJytw36X+','2226100339',_binary '','2023-08-17 09:31:28'),(39,'Concepción Herrera','c.herrera@zoho.com','r#Ojf44Ls4_R','7741200259',_binary '','2023-08-17 09:31:28'),(40,'Soledad Carmen Villalobos','s.villalobos@apple.com','bxJH7TWEgu','7746091310',_binary '','2023-08-17 09:31:28'),(41,'Marco Antonio Domínguez','m.domínguez@excite.com','2WbtoqN_pnyctnk','2223564755',_binary '','2023-08-17 09:31:28'),(42,'Rubén Lara','r.lara@outlook.com','Xz68Zab','2222589893',_binary '','2023-08-17 09:31:28'),(43,'Jesús Luna','j.luna@live.com','pw*YT-j3seS5-2','558191663',_binary '','2023-08-17 09:31:28'),(44,'Noemí Castro','n.castro@zoho.com','kc5Ycsj(qB','2227129619',_binary '','2023-08-17 09:31:28'),(45,'Gerardo Ayala','g.ayala@live.com','bdq(=iZ-+%','556629851',_binary '','2023-08-17 09:31:28'),(46,'Salvador Hidalgo','s.hidalgo@hotmail.com','_nd5U','2225918608',_binary '','2023-08-17 09:31:28'),(47,'Ariadna Leticia Ramos','a.ramos@fastmail.com','G8ZadraA65L','554366661',_binary '','2023-08-17 09:31:28'),(48,'Sergio Corona','s.corona@gmx.com','AOTEq&#PpFH=','557774559',_binary '','2023-08-17 09:31:28'),(49,'Alejandra Valencia','a.valencia@hushmail.com','7+KPu4%','7644975397',_binary '','2023-08-17 09:31:29'),(50,'Gabriel Francisco Javier Ortiz','g.ortiz@zoho.com','aMK%)fRVG','2222151063',_binary '','2023-08-17 09:31:29');
/*!40000 ALTER TABLE `tbb_usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tgr_ai_usuario` AFTER INSERT ON `tbb_usuarios` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_usuarios", "CREATE",
    CONCAT_WS("","El usuario: ", USER(), " ha insertado un nuevo USUARIO con el PERSONA_ID: ", new.persona_id, " con el NOMBRE_USUARIO: ", 
    IFNULL(new.nombre_usuario,""), " con el EMAIL: ", new.email, " con la CONTRASEÑA: ", new.contraseña, " con el NUMERO_TELEFONICO: ", IFNULL(new.numero_telefonico,""), " con ESTATUS por defecto: ", 
    IF(new.estatus,'1','0'), " con FECHA DE REGISTRO: ", new.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_usuarios_AFTER_UPDATE` AFTER UPDATE ON `tbb_usuarios` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_usuarios", "UPDATE",
    CONCAT_WS("","El usuario: ", USER(), " ha modificado el USUARIO con PERSONA_ID: ",new.persona_id,
    " con los siguientes cambios: ",
        IF(new.persona_id = old.persona_id,"", CONCAT_WS(""," el PERSONA_ID de: ", old.persona_id," a: ", new.persona_id)),
        IF(new.nombre_usuario is not null and old.nombre_usuario is not null and new.nombre_usuario !=old.nombre_usuario, 
            CONCAT_WS("",", el NOMBRE_USUARIO de: ", old.nombre_usuario," a: ", new.nombre_usuario), ""),
        IF(new.email = old.email,"", CONCAT_WS("",", el EMAIL de: ", old.email," a:", new.email)),
        IF(new.contraseña = old.contraseña,"", CONCAT_WS("",", la CONTRASEÑA de: ", old.contraseña," a:", new.contraseña)),
        IF(new.numero_telefonico is not null and old.numero_telefonico is not null and new.numero_telefonico !=old.numero_telefonico, 
            CONCAT_WS("",", el NUMERO_TELEFONICO de: ", old.numero_telefonico," a: ", new.numero_telefonico), ""),
        IF(new.estatus = old.estatus,"", CONCAT_WS("",", el ESTATUS de: ",  IF(old.estatus,'1','0')," a: ",  IF(new.estatus,'1','0'))),
        IF(new.fecha_registro = old.fecha_registro,"", CONCAT_WS(""," el FECHA_DE_REGISTRO de: ", old.fecha_registro," a: ", new.fecha_registro)),""), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_usuarios_BEFORE_DELETE` BEFORE DELETE ON `tbb_usuarios` FOR EACH ROW BEGIN
declare v_usuario varchar(80) default user();
    declare MESSAGGE_TEXT varchar(255) default "";
    
    if v_usuario != "root@localhost" then
		signal sqlstate '45000'
        set	MESSAGE_TEXT = 'No tienes los privilegios para borrar la infromacion de la tabla: tbb_usuarios';
    end if; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_usuarios_AFTER_DELETE` AFTER DELETE ON `tbb_usuarios` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora VALUES (DEFAULT, USER(), "tbb_usuarios", "DELETE",
    CONCAT_WS("","El usuario: ", USER(), " ha eliminado un USUARIO con el PERSONA_ID: ", old.persona_id, " con el NOMBRE_USUARIO: ", 
    IFNULL(old.nombre_usuario,""), " con el EMAIL: ", old.email, " con la CONTRASEÑA: ", old.contraseña, " con el NUMERO_TELEFONICO: ", IFNULL(old.numero_telefonico,""), " con ESTATUS por defecto: ", 
    IF(old.estatus,'1','0'), " con FECHA DE REGISTRO: ", old.fecha_registro), DEFAULT, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbi_bitacora`
--

DROP TABLE IF EXISTS `tbi_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbi_bitacora` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `USUARIO` varchar(80) NOT NULL,
  `TABLA` varchar(255) NOT NULL,
  `OPERACION` enum('Create','Read','Update','Delete') NOT NULL,
  `DESCRIPCION` text NOT NULL,
  `ESTATUS` bit(1) NOT NULL DEFAULT b'1',
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=668 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbi_bitacora`
--

LOCK TABLES `tbi_bitacora` WRITE;
/*!40000 ALTER TABLE `tbi_bitacora` DISABLE KEYS */;
INSERT INTO `tbi_bitacora` VALUES (1,'root@localhost','tbb_categorias','Create','El usuario: root@localhost ha insertado una nueva CATEGORÍA con el ID: 1 con el NOMBRE: Ropa para mujer con la DESCRIPCIÓN: Prendas de vestir diseñadas específicamente para mujeres, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:28',_binary '','2023-08-16 13:21:28'),(2,'root@localhost','tbb_categorias','Create','El usuario: root@localhost ha insertado una nueva CATEGORÍA con el ID: 2 con el NOMBRE: Ropa para niña y juvenil con la DESCRIPCIÓN: Prendas de vestir diseñadas para niñas y jóvenes, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:28',_binary '','2023-08-16 13:21:28'),(3,'root@localhost','tbb_categorias','Create','El usuario: root@localhost ha insertado una nueva CATEGORÍA con el ID: 3 con el NOMBRE: Ropa para niño y juvenil con la DESCRIPCIÓN: Prendas de vestir diseñadas para niños y jóvenes, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:28',_binary '','2023-08-16 13:21:28'),(4,'root@localhost','tbb_categorias','Create','El usuario: root@localhost ha insertado una nueva CATEGORÍA con el ID: 4 con el NOMBRE: Ropa para bebé con la DESCRIPCIÓN: Prendas de vestir diseñadas específicamente para bebés, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:28',_binary '','2023-08-16 13:21:28'),(5,'root@localhost','tbb_categorias','Create','El usuario: root@localhost ha insertado una nueva CATEGORÍA con el ID: 5 con el NOMBRE: Accesorios con la DESCRIPCIÓN: Artículos complementarios a la ropa, como bufandas, cinturones, abanicos, sombreros y relojes, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:28',_binary '','2023-08-16 13:21:28'),(6,'root@localhost','tbb_categorias','Create','El usuario: root@localhost ha insertado una nueva CATEGORÍA con el ID: 6 con el NOMBRE: Ropa íntima con la DESCRIPCIÓN: Prendas de vestir que se usan debajo de la ropa exterior, como ropa interior, camisones, pijamas, etc. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:28',_binary '','2023-08-16 13:21:28'),(7,'root@localhost','tbb_categorias','Create','El usuario: root@localhost ha insertado una nueva CATEGORÍA con el ID: 7 con el NOMBRE: Conjuntos con la DESCRIPCIÓN: Combinaciones de prendas que se venden juntas como un conjunto, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:28',_binary '','2023-08-16 13:21:28'),(8,'root@localhost','tbb_categorias','Create','El usuario: root@localhost ha insertado una nueva CATEGORÍA con el ID: 8 con el NOMBRE: Medias con la DESCRIPCIÓN: Prendas de vestir que cubren los pies y las piernas, como calcetines, medias, pantimedias, etc. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:28',_binary '','2023-08-16 13:21:28'),(9,'root@localhost','tbb_categorias','Create','El usuario: root@localhost ha insertado una nueva CATEGORÍA con el ID: 9 con el NOMBRE: Vestidos con la DESCRIPCIÓN: Prendas de vestir femeninas que cubren el cuerpo desde los hombros hasta las piernas. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:28',_binary '','2023-08-16 13:21:28'),(10,'root@localhost','tbb_categorias','Create','El usuario: root@localhost ha insertado una nueva CATEGORÍA con el ID: 10 con el NOMBRE: Trajes de baño con la DESCRIPCIÓN: Prendas de vestir diseñadas específicamente para usar en el agua o en la playa. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:28',_binary '','2023-08-16 13:21:28'),(11,'root@localhost','tbb_catalogos','Create','El usuario: root@localhost ha insertado un nuevo CATÁLOGO con el ID: 1 con el CATEGORIA_ID: 1 con el NOMBRE: Moda Femenina con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:41',_binary '','2023-08-16 13:21:41'),(12,'root@localhost','tbb_catalogos','Create','El usuario: root@localhost ha insertado un nuevo CATÁLOGO con el ID: 2 con el CATEGORIA_ID: 2 con el NOMBRE: Moda Juvenil Femenina con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:41',_binary '','2023-08-16 13:21:41'),(13,'root@localhost','tbb_catalogos','Create','El usuario: root@localhost ha insertado un nuevo CATÁLOGO con el ID: 3 con el CATEGORIA_ID: 3 con el NOMBRE: Moda Juvenil Masculina con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:41',_binary '','2023-08-16 13:21:41'),(14,'root@localhost','tbb_catalogos','Create','El usuario: root@localhost ha insertado un nuevo CATÁLOGO con el ID: 4 con el CATEGORIA_ID: 4 con el NOMBRE: Moda Bebé con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:41',_binary '','2023-08-16 13:21:41'),(15,'root@localhost','tbb_catalogos','Create','El usuario: root@localhost ha insertado un nuevo CATÁLOGO con el ID: 5 con el CATEGORIA_ID: 5 con el NOMBRE: Complementos con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:41',_binary '','2023-08-16 13:21:41'),(16,'root@localhost','tbb_catalogos','Create','El usuario: root@localhost ha insertado un nuevo CATÁLOGO con el ID: 6 con el CATEGORIA_ID: 6 con el NOMBRE: Lencería con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:41',_binary '','2023-08-16 13:21:41'),(17,'root@localhost','tbb_catalogos','Create','El usuario: root@localhost ha insertado un nuevo CATÁLOGO con el ID: 7 con el CATEGORIA_ID: 7 con el NOMBRE: Outfits Completos con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:41',_binary '','2023-08-16 13:21:41'),(18,'root@localhost','tbb_catalogos','Create','El usuario: root@localhost ha insertado un nuevo CATÁLOGO con el ID: 8 con el CATEGORIA_ID: 8 con el NOMBRE: Calcetería con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:41',_binary '','2023-08-16 13:21:41'),(19,'root@localhost','tbb_catalogos','Create','El usuario: root@localhost ha insertado un nuevo CATÁLOGO con el ID: 9 con el CATEGORIA_ID: 9 con el NOMBRE: Vestidos de Moda con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:41',_binary '','2023-08-16 13:21:41'),(20,'root@localhost','tbb_catalogos','Create','El usuario: root@localhost ha insertado un nuevo CATÁLOGO con el ID: 10 con el CATEGORIA_ID: 10 con el NOMBRE: Moda de Playa con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-16 13:21:41',_binary '','2023-08-16 13:21:41'),(118,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 1 con el CATEGORIA_ID: 1 con el NOMBRE: Blusa con el PRECIO: 99.00 con la IMAGEN: https://m.media-amazon.com/images/I/61BZJIOtzfL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Blusa de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(119,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 2 con el CATEGORIA_ID: 1 con el NOMBRE: Falda con el PRECIO: 198.00 con la IMAGEN: https://m.media-amazon.com/images/I/71LuGvvWhQL._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Falda de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(120,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 3 con el CATEGORIA_ID: 1 con el NOMBRE: Pantalón con el PRECIO: 297.00 con la IMAGEN: https://m.media-amazon.com/images/I/81f3Kl5nOJS._AC_SX569_.jpg con la DESCRIPCIÓN: Este es un/a Pantalón de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(121,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 4 con el CATEGORIA_ID: 1 con el NOMBRE: Vestido con el PRECIO: 396.00 con la IMAGEN: https://m.media-amazon.com/images/I/71ACP2iCvYL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Vestido de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(122,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 5 con el CATEGORIA_ID: 1 con el NOMBRE: Chaqueta con el PRECIO: 495.00 con la IMAGEN: https://m.media-amazon.com/images/I/91hjbJi5rzL._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Chaqueta de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(123,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 6 con el CATEGORIA_ID: 1 con el NOMBRE: Suéter con el PRECIO: 594.00 con la IMAGEN: https://m.media-amazon.com/images/I/71NeYmo8YML._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Suéter de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(124,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 7 con el CATEGORIA_ID: 1 con el NOMBRE: Camiseta con el PRECIO: 693.00 con la IMAGEN: https://m.media-amazon.com/images/I/71pS2hIuhHL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Camiseta de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(125,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 8 con el CATEGORIA_ID: 1 con el NOMBRE: Shorts con el PRECIO: 792.00 con la IMAGEN: https://m.media-amazon.com/images/I/91E78mxrQFL._AC_SX569_.jpg con la DESCRIPCIÓN: Este es un/a Shorts de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(126,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 9 con el CATEGORIA_ID: 1 con el NOMBRE: Abrigo con el PRECIO: 891.00 con la IMAGEN: https://m.media-amazon.com/images/I/81EB9MzAFDL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Abrigo de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(127,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 10 con el CATEGORIA_ID: 1 con el NOMBRE: Jeans con el PRECIO: 990.00 con la IMAGEN: https://m.media-amazon.com/images/I/81boEpB78-L._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Jeans de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(128,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 11 con el CATEGORIA_ID: 2 con el NOMBRE: Vestido con el PRECIO: 99.00 con la IMAGEN: https://m.media-amazon.com/images/I/71VGigy2yrL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Vestido de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(129,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 12 con el CATEGORIA_ID: 2 con el NOMBRE: Falda con el PRECIO: 198.00 con la IMAGEN: https://m.media-amazon.com/images/I/61-+q3YxiKL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Falda de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(130,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 13 con el CATEGORIA_ID: 2 con el NOMBRE: Blusa con el PRECIO: 297.00 con la IMAGEN: https://m.media-amazon.com/images/I/91ipVsottIL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Blusa de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(131,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 14 con el CATEGORIA_ID: 2 con el NOMBRE: Pantalón con el PRECIO: 396.00 con la IMAGEN: https://m.media-amazon.com/images/I/716Va6byOyL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Pantalón de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(132,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 15 con el CATEGORIA_ID: 2 con el NOMBRE: Suéter con el PRECIO: 495.00 con la IMAGEN: https://m.media-amazon.com/images/I/81CYIo-6ujS._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Suéter de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(133,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 16 con el CATEGORIA_ID: 2 con el NOMBRE: Chaqueta con el PRECIO: 594.00 con la IMAGEN: https://m.media-amazon.com/images/I/81Z2RuIYUJL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Chaqueta de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(134,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 17 con el CATEGORIA_ID: 2 con el NOMBRE: Camiseta con el PRECIO: 693.00 con la IMAGEN: https://m.media-amazon.com/images/I/61Kz6Yb9c6L._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Camiseta de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(135,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 18 con el CATEGORIA_ID: 2 con el NOMBRE: Shorts con el PRECIO: 792.00 con la IMAGEN: https://m.media-amazon.com/images/I/91H5CS26hQL._AC_SX569_.jpg con la DESCRIPCIÓN: Este es un/a Shorts de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(136,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 19 con el CATEGORIA_ID: 2 con el NOMBRE: Abrigo con el PRECIO: 891.00 con la IMAGEN: https://m.media-amazon.com/images/I/71vZKLoiRlL._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Abrigo de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(137,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 20 con el CATEGORIA_ID: 2 con el NOMBRE: Jeans con el PRECIO: 990.00 con la IMAGEN: https://m.media-amazon.com/images/I/91QV-tf7-mL._AC_SX569_.jpg con la DESCRIPCIÓN: Este es un/a Jeans de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(138,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 21 con el CATEGORIA_ID: 3 con el NOMBRE: Pantalón con el PRECIO: 99.00 con la IMAGEN: https://m.media-amazon.com/images/I/81boEpB78-L._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Pantalón de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(139,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 22 con el CATEGORIA_ID: 3 con el NOMBRE: Camisa con el PRECIO: 198.00 con la IMAGEN: https://m.media-amazon.com/images/I/81QPMaffW4L._AC_SX569_.jpg con la DESCRIPCIÓN: Este es un/a Camisa de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(140,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 23 con el CATEGORIA_ID: 3 con el NOMBRE: Camiseta con el PRECIO: 297.00 con la IMAGEN: https://m.media-amazon.com/images/I/71Fggn+RX0L._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Camiseta de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(141,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 24 con el CATEGORIA_ID: 3 con el NOMBRE: Suéter con el PRECIO: 396.00 con la IMAGEN: https://m.media-amazon.com/images/I/71NeYmo8YML._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Suéter de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(142,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 25 con el CATEGORIA_ID: 3 con el NOMBRE: Chaqueta con el PRECIO: 495.00 con la IMAGEN: https://m.media-amazon.com/images/I/61FRV9fNTeL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Chaqueta de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(143,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 26 con el CATEGORIA_ID: 3 con el NOMBRE: Shorts con el PRECIO: 594.00 con la IMAGEN: https://m.media-amazon.com/images/I/71FJJkm5r5L._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Shorts de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(144,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 27 con el CATEGORIA_ID: 3 con el NOMBRE: Abrigo con el PRECIO: 693.00 con la IMAGEN: https://m.media-amazon.com/images/I/61bhPVJa7UL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Abrigo de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(145,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 28 con el CATEGORIA_ID: 3 con el NOMBRE: Jeans con el PRECIO: 792.00 con la IMAGEN: https://m.media-amazon.com/images/I/817FrT-nRmL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Jeans de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(146,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 29 con el CATEGORIA_ID: 3 con el NOMBRE: Sudadera con el PRECIO: 891.00 con la IMAGEN: https://m.media-amazon.com/images/I/61Pwuuyny7L._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Sudadera de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(147,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 30 con el CATEGORIA_ID: 3 con el NOMBRE: Chándal con el PRECIO: 990.00 con la IMAGEN: https://m.media-amazon.com/images/I/81q7d7yHrYL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Chándal de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(148,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 31 con el CATEGORIA_ID: 4 con el NOMBRE: Body con el PRECIO: 99.00 con la IMAGEN: https://m.media-amazon.com/images/I/91Xpc1gOuQL._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Body de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(149,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 32 con el CATEGORIA_ID: 4 con el NOMBRE: Pelele con el PRECIO: 198.00 con la IMAGEN: https://m.media-amazon.com/images/I/71YUofkqIUL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Pelele de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(150,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 33 con el CATEGORIA_ID: 4 con el NOMBRE: Vestido con el PRECIO: 297.00 con la IMAGEN: https://m.media-amazon.com/images/I/61e38+hD8hL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Vestido de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(151,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 34 con el CATEGORIA_ID: 4 con el NOMBRE: Pantalón Corto con el PRECIO: 396.00 con la IMAGEN: https://m.media-amazon.com/images/I/A1rJxpdxUbL._AC_SX569_.jpg con la DESCRIPCIÓN: Este es un/a Pantalón Corto de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(152,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 35 con el CATEGORIA_ID: 4 con el NOMBRE: Pantalón Largo con el PRECIO: 495.00 con la IMAGEN: https://m.media-amazon.com/images/I/61U5oat3TcL._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Pantalón Largo de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(153,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 36 con el CATEGORIA_ID: 4 con el NOMBRE: Camiseta con el PRECIO: 594.00 con la IMAGEN: https://m.media-amazon.com/images/I/71dS+orZ2lL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Camiseta de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(154,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 37 con el CATEGORIA_ID: 4 con el NOMBRE: Suéter con el PRECIO: 693.00 con la IMAGEN: https://m.media-amazon.com/images/I/71+CXetLqcL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Suéter de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(155,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 38 con el CATEGORIA_ID: 4 con el NOMBRE: Chaqueta con el PRECIO: 792.00 con la IMAGEN: https://m.media-amazon.com/images/I/61DZXt84HgL._AC_SX569_.jpg con la DESCRIPCIÓN: Este es un/a Chaqueta de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(156,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 39 con el CATEGORIA_ID: 4 con el NOMBRE: Gorro con el PRECIO: 891.00 con la IMAGEN: https://m.media-amazon.com/images/I/51ZEgsmAfoL.__AC_SY445_SX342_QL70_ML2_.jpg con la DESCRIPCIÓN: Este es un/a Gorro de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(157,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 40 con el CATEGORIA_ID: 4 con el NOMBRE: Calcetines con el PRECIO: 990.00 con la IMAGEN: https://m.media-amazon.com/images/I/715GL7jPIkL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Calcetines de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(158,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 41 con el CATEGORIA_ID: 5 con el NOMBRE: Bufanda con el PRECIO: 99.00 con la IMAGEN: https://m.media-amazon.com/images/I/71pDKBeCV7L._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Bufanda de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(159,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 42 con el CATEGORIA_ID: 5 con el NOMBRE: Cinturón con el PRECIO: 198.00 con la IMAGEN: https://m.media-amazon.com/images/I/71o9r9qAHhL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Cinturón de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(160,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 43 con el CATEGORIA_ID: 5 con el NOMBRE: Sombrero con el PRECIO: 297.00 con la IMAGEN: https://m.media-amazon.com/images/I/91EoCWM6nOL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Sombrero de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(161,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 44 con el CATEGORIA_ID: 5 con el NOMBRE: Reloj de Pulsera con el PRECIO: 396.00 con la IMAGEN: https://m.media-amazon.com/images/I/71vPMKF0ipL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Reloj de Pulsera de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(162,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 45 con el CATEGORIA_ID: 5 con el NOMBRE: Collar con el PRECIO: 495.00 con la IMAGEN: https://m.media-amazon.com/images/I/518Pu8+4OSL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Collar de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(163,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 46 con el CATEGORIA_ID: 5 con el NOMBRE: Pulsera con el PRECIO: 594.00 con la IMAGEN: https://m.media-amazon.com/images/I/611Z-IoalcL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Pulsera de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(164,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 47 con el CATEGORIA_ID: 5 con el NOMBRE: Pendientes con el PRECIO: 693.00 con la IMAGEN: https://m.media-amazon.com/images/I/61cE2JfJazL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Pendientes de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(165,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 48 con el CATEGORIA_ID: 5 con el NOMBRE: Anillo con el PRECIO: 792.00 con la IMAGEN: https://m.media-amazon.com/images/I/61hX9FFmhKL._AC_SY575_.jpg con la DESCRIPCIÓN: Este es un/a Anillo de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(166,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 49 con el CATEGORIA_ID: 5 con el NOMBRE: Gafas de Sol con el PRECIO: 891.00 con la IMAGEN: https://m.media-amazon.com/images/I/719ZaUu6f9L._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Gafas de Sol de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(167,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 50 con el CATEGORIA_ID: 5 con el NOMBRE: Gafas de Sol con el PRECIO: 990.00 con la IMAGEN: https://m.media-amazon.com/images/I/41O-U3OkolS._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Gafas de Sol de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(168,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 51 con el CATEGORIA_ID: 6 con el NOMBRE: Sujetador con el PRECIO: 99.00 con la IMAGEN: https://m.media-amazon.com/images/I/71xVcZ2FIuL.__AC_SX342_SY445_QL70_ML2_.jpg con la DESCRIPCIÓN: Este es un/a Sujetador de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(169,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 52 con el CATEGORIA_ID: 6 con el NOMBRE: Bragas/Calzoncillos Bóxer con el PRECIO: 198.00 con la IMAGEN: https://m.media-amazon.com/images/I/51EiRsy7OYL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Bragas/Calzoncillos Bóxer de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(170,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 53 con el CATEGORIA_ID: 6 con el NOMBRE: Bikini/Slip/Tanga/Culotte con el PRECIO: 297.00 con la IMAGEN: https://m.media-amazon.com/images/I/61i-FmFDrSL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Bikini/Slip/Tanga/Culotte de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(171,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 54 con el CATEGORIA_ID: 6 con el NOMBRE: Camisón/Pijama/Ropa de Dormir con el PRECIO: 396.00 con la IMAGEN: https://m.media-amazon.com/images/I/61hGxxsjyzL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Camisón/Pijama/Ropa de Dormir de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(172,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 55 con el CATEGORIA_ID: 6 con el NOMBRE: Liguero/Medias con Liga con el PRECIO: 495.00 con la IMAGEN: https://m.media-amazon.com/images/I/51hDB-+bu-L._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Liguero/Medias con Liga de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(173,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 56 con el CATEGORIA_ID: 6 con el NOMBRE: Body/Corsé con el PRECIO: 594.00 con la IMAGEN: https://m.media-amazon.com/images/I/81vhYd-KkUL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Body/Corsé de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(174,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 57 con el CATEGORIA_ID: 6 con el NOMBRE: Ropa íntima genérica con el PRECIO: 693.00 con la IMAGEN: https://m.media-amazon.com/images/I/71Xr25rGxxL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Ropa íntima genérica de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(175,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 58 con el CATEGORIA_ID: 6 con el NOMBRE: Ropa íntima genérica con el PRECIO: 792.00 con la IMAGEN: https://m.media-amazon.com/images/I/71XnD1YzqrL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Ropa íntima genérica de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(176,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 59 con el CATEGORIA_ID: 6 con el NOMBRE: Ropa íntima genérica con el PRECIO: 891.00 con la IMAGEN: https://m.media-amazon.com/images/I/61lK+9XTVdL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Ropa íntima genérica de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(177,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 60 con el CATEGORIA_ID: 6 con el NOMBRE: Ropa íntima genérica con el PRECIO: 990.00 con la IMAGEN: https://m.media-amazon.com/images/I/71MhbC4c+uL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Ropa íntima genérica de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(178,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 61 con el CATEGORIA_ID: 7 con el NOMBRE: Conjunto de Falda y Blusa con el PRECIO: 99.00 con la IMAGEN: https://m.media-amazon.com/images/I/51L7xzOp0IL._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Conjunto de Falda y Blusa de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(179,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 62 con el CATEGORIA_ID: 7 con el NOMBRE: Conjunto de Pantalón y Blusa con el PRECIO: 198.00 con la IMAGEN: https://m.media-amazon.com/images/I/61HsUc4iMZL._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Conjunto de Pantalón y Blusa de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(180,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 63 con el CATEGORIA_ID: 7 con el NOMBRE: Conjunto de Short y Blusa con el PRECIO: 297.00 con la IMAGEN: https://m.media-amazon.com/images/I/61ptzGmqvjL._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Conjunto de Short y Blusa de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(181,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 64 con el CATEGORIA_ID: 7 con el NOMBRE: Conjunto de Vestido y Chaqueta con el PRECIO: 396.00 con la IMAGEN: https://m.media-amazon.com/images/I/8172RVyOweL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Conjunto de Vestido y Chaqueta de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(182,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 65 con el CATEGORIA_ID: 7 con el NOMBRE: Conjunto Deportivo con el PRECIO: 495.00 con la IMAGEN: https://m.media-amazon.com/images/I/81k132BpyoS._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Conjunto Deportivo de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(183,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 66 con el CATEGORIA_ID: 7 con el NOMBRE: Conjunto genérico con el PRECIO: 594.00 con la IMAGEN: https://m.media-amazon.com/images/I/61em9S285oL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Conjunto genérico de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(184,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 67 con el CATEGORIA_ID: 7 con el NOMBRE: Conjunto genérico con el PRECIO: 693.00 con la IMAGEN: https://m.media-amazon.com/images/I/61ph3KL8wIL._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Conjunto genérico de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(185,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 68 con el CATEGORIA_ID: 7 con el NOMBRE: Conjunto genérico con el PRECIO: 792.00 con la IMAGEN: https://m.media-amazon.com/images/I/71TxLvqGtGL._AC_SX569_.jpg con la DESCRIPCIÓN: Este es un/a Conjunto genérico de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(186,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 69 con el CATEGORIA_ID: 7 con el NOMBRE: Conjunto genérico con el PRECIO: 891.00 con la IMAGEN: https://m.media-amazon.com/images/I/61l1FiyuP9L._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Conjunto genérico de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(187,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 70 con el CATEGORIA_ID: 7 con el NOMBRE: Conjunto genérico con el PRECIO: 990.00 con la IMAGEN: https://m.media-amazon.com/images/I/61zNp6jDl0L._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Conjunto genérico de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(188,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 71 con el CATEGORIA_ID: 8 con el NOMBRE: Calcetines Tobilleros con el PRECIO: 99.00 con la IMAGEN: https://m.media-amazon.com/images/I/61fgStbI+7L._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Calcetines Tobilleros de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(189,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 72 con el CATEGORIA_ID: 8 con el NOMBRE: Calcetines Deportivos con el PRECIO: 198.00 con la IMAGEN: https://m.media-amazon.com/images/I/81zwruTidEL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Calcetines Deportivos de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(190,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 73 con el CATEGORIA_ID: 8 con el NOMBRE: Calcetines Largos con el PRECIO: 297.00 con la IMAGEN: https://m.media-amazon.com/images/I/711Sb9K-NVL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Calcetines Largos de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(191,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 74 con el CATEGORIA_ID: 8 con el NOMBRE: Medias Pantimedias con el PRECIO: 396.00 con la IMAGEN: https://m.media-amazon.com/images/I/71IkJblAYGL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Medias Pantimedias de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(192,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 75 con el CATEGORIA_ID: 8 con el NOMBRE: Medias Transparentes con el PRECIO: 495.00 con la IMAGEN: https://m.media-amazon.com/images/I/21VpHuvOx2L.__AC_SY300_SX300_QL70_ML2_.jpg con la DESCRIPCIÓN: Este es un/a Medias Transparentes de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(193,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 76 con el CATEGORIA_ID: 8 con el NOMBRE: Medias Opacas con el PRECIO: 594.00 con la IMAGEN: https://m.media-amazon.com/images/I/71cF7cgsqqL._AC_SX679_.jpg\r\n con la DESCRIPCIÓN: Este es un/a Medias Opacas de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(194,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 77 con el CATEGORIA_ID: 8 con el NOMBRE: Medias de Red con el PRECIO: 693.00 con la IMAGEN: https://m.media-amazon.com/images/I/71TZYIjtuPL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Medias de Red de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(195,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 78 con el CATEGORIA_ID: 8 con el NOMBRE: Leggings Lisos con el PRECIO: 792.00 con la IMAGEN: https://m.media-amazon.com/images/I/61aQBJ8606L._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Leggings Lisos de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(196,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 79 con el CATEGORIA_ID: 8 con el NOMBRE: Leggings Estampados con el PRECIO: 891.00 con la IMAGEN: https://m.media-amazon.com/images/I/81Okq9azv9L._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Leggings Estampados de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(197,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 80 con el CATEGORIA_ID: 8 con el NOMBRE: Leggings Deportivos con el PRECIO: 990.00 con la IMAGEN: https://m.media-amazon.com/images/I/51ZqhGsW5yL._AC_SX569_.jpg con la DESCRIPCIÓN: Este es un/a Leggings Deportivos de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(198,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 81 con el CATEGORIA_ID: 9 con el NOMBRE: Vestido Largo con el PRECIO: 99.00 con la IMAGEN: https://m.media-amazon.com/images/I/51wlXznFwmL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Vestido Largo de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(199,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 82 con el CATEGORIA_ID: 9 con el NOMBRE: Vestido Corto con el PRECIO: 198.00 con la IMAGEN: https://m.media-amazon.com/images/I/61XoMCeXLXL._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Vestido Corto de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(200,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 83 con el CATEGORIA_ID: 9 con el NOMBRE: Vestido Midi con el PRECIO: 297.00 con la IMAGEN: https://m.media-amazon.com/images/I/81-Se+TbIGL._AC_SX569_.jpg con la DESCRIPCIÓN: Este es un/a Vestido Midi de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(201,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 84 con el CATEGORIA_ID: 9 con el NOMBRE: Vestido Ajustado con el PRECIO: 396.00 con la IMAGEN: https://m.media-amazon.com/images/I/61ppvDRybEL._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Vestido Ajustado de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(202,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 85 con el CATEGORIA_ID: 9 con el NOMBRE: Vestido Suelto con el PRECIO: 495.00 con la IMAGEN: https://m.media-amazon.com/images/I/61VfgsJdJ6L._AC_SX569_.jpg con la DESCRIPCIÓN: Este es un/a Vestido Suelto de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(203,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 86 con el CATEGORIA_ID: 9 con el NOMBRE: Vestido con Vuelo con el PRECIO: 594.00 con la IMAGEN: https://m.media-amazon.com/images/I/71VGigy2yrL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Vestido con Vuelo de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(204,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 87 con el CATEGORIA_ID: 9 con el NOMBRE: Vestido Camisero con el PRECIO: 693.00 con la IMAGEN: https://m.media-amazon.com/images/I/616EWiXHQmL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Vestido Camisero de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(205,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 88 con el CATEGORIA_ID: 9 con el NOMBRE: Vestido de Fiesta con el PRECIO: 792.00 con la IMAGEN: https://m.media-amazon.com/images/I/61sj3ERl5xL._AC_SX679_.jpg con la DESCRIPCIÓN: Este es un/a Vestido de Fiesta de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(206,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 89 con el CATEGORIA_ID: 9 con el NOMBRE: Vestido Casual con el PRECIO: 891.00 con la IMAGEN: https://m.media-amazon.com/images/I/61br5SgMwKL._AC_SX569_.jpg con la DESCRIPCIÓN: Este es un/a Vestido Casual de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(207,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 90 con el CATEGORIA_ID: 9 con el NOMBRE: Vestido Estampado con el PRECIO: 990.00 con la IMAGEN: https://m.media-amazon.com/images/I/71TC8Jp1BBS._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Vestido Estampado de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(208,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 91 con el CATEGORIA_ID: 10 con el NOMBRE: Bikini con el PRECIO: 99.00 con la IMAGEN: https://m.media-amazon.com/images/I/71cgRbGYzDL._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Bikini de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(209,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 92 con el CATEGORIA_ID: 10 con el NOMBRE: Traje de Baño de una Pieza con el PRECIO: 198.00 con la IMAGEN: https://m.media-amazon.com/images/I/716boxZKmTL._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Traje de Baño de una Pieza de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(210,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 93 con el CATEGORIA_ID: 10 con el NOMBRE: Traje de Baño Deportivo con el PRECIO: 297.00 con la IMAGEN: https://m.media-amazon.com/images/I/61y41LzzUSS._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Traje de Baño Deportivo de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(211,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 94 con el CATEGORIA_ID: 10 con el NOMBRE: Traje de Baño con Falda con el PRECIO: 396.00 con la IMAGEN: https://m.media-amazon.com/images/I/61dDXrzfu2L._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Traje de Baño con Falda de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(212,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 95 con el CATEGORIA_ID: 10 con el NOMBRE: Traje de Baño con Short con el PRECIO: 495.00 con la IMAGEN: https://m.media-amazon.com/images/I/61rZePkdcXL._AC_SY741_.jpg con la DESCRIPCIÓN: Este es un/a Traje de Baño con Short de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(213,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 96 con el CATEGORIA_ID: 10 con el NOMBRE: Traje de Baño con Volantes con el PRECIO: 594.00 con la IMAGEN: https://m.media-amazon.com/images/I/61mxTnZnhOL._AC_SX569_.jpg con la DESCRIPCIÓN: Este es un/a Traje de Baño con Volantes de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(214,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 97 con el CATEGORIA_ID: 10 con el NOMBRE: Traje de Baño con Escote Halter con el PRECIO: 693.00 con la IMAGEN: https://m.media-amazon.com/images/I/71lMIxmao0L.__AC_SX342_SY445_QL70_ML2_.jpg con la DESCRIPCIÓN: Este es un/a Traje de Baño con Escote Halter de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(215,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 98 con el CATEGORIA_ID: 10 con el NOMBRE: Traje de Baño con Escote Bandeau con el PRECIO: 792.00 con la IMAGEN:  con la DESCRIPCIÓN: Este es un/a Traje de Baño con Escote Bandeau de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(216,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 99 con el CATEGORIA_ID: 10 con el NOMBRE: Traje de Baño con Escote en V con el PRECIO: 891.00 con la IMAGEN:  con la DESCRIPCIÓN: Este es un/a Traje de Baño con Escote en V de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(217,'root@localhost','tbb_productos','Create','El usuario: root@localhost ha insertado un nuevo PRODUCTO con el ID: 100 con el CATEGORIA_ID: 10 con el NOMBRE: Traje de Baño con Escote en V con el PRECIO: 990.00 con la IMAGEN:  con la DESCRIPCIÓN: Este es un/a Traje de Baño con Escote en V de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-14 19:45:53',_binary '','2023-08-16 13:24:44'),(218,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 1 con el PRODUCTO_ID: 1 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(219,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 2 con el PRODUCTO_ID: 2 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(220,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 3 con el PRODUCTO_ID: 3 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(221,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 4 con el PRODUCTO_ID: 4 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(222,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 5 con el PRODUCTO_ID: 5 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(223,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 6 con el PRODUCTO_ID: 6 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(224,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 7 con el PRODUCTO_ID: 7 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(225,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 8 con el PRODUCTO_ID: 8 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(226,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 9 con el PRODUCTO_ID: 9 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(227,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 10 con el PRODUCTO_ID: 10 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(228,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 11 con el PRODUCTO_ID: 11 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(229,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 12 con el PRODUCTO_ID: 12 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(230,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 13 con el PRODUCTO_ID: 13 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(231,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 14 con el PRODUCTO_ID: 14 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(232,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 15 con el PRODUCTO_ID: 15 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(233,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 16 con el PRODUCTO_ID: 16 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(234,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 17 con el PRODUCTO_ID: 17 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(235,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 18 con el PRODUCTO_ID: 18 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(236,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 19 con el PRODUCTO_ID: 19 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(237,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 20 con el PRODUCTO_ID: 20 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(238,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 21 con el PRODUCTO_ID: 21 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(239,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 22 con el PRODUCTO_ID: 22 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(240,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 23 con el PRODUCTO_ID: 23 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(241,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 24 con el PRODUCTO_ID: 24 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(242,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 25 con el PRODUCTO_ID: 25 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(243,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 26 con el PRODUCTO_ID: 26 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(244,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 27 con el PRODUCTO_ID: 27 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(245,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 28 con el PRODUCTO_ID: 28 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(246,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 29 con el PRODUCTO_ID: 29 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(247,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 30 con el PRODUCTO_ID: 30 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(248,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 31 con el PRODUCTO_ID: 31 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(249,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 32 con el PRODUCTO_ID: 32 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(250,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 33 con el PRODUCTO_ID: 33 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(251,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 34 con el PRODUCTO_ID: 34 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(252,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 35 con el PRODUCTO_ID: 35 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(253,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 36 con el PRODUCTO_ID: 36 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(254,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 37 con el PRODUCTO_ID: 37 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(255,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 38 con el PRODUCTO_ID: 38 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(256,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 39 con el PRODUCTO_ID: 39 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(257,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 40 con el PRODUCTO_ID: 40 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(258,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 41 con el PRODUCTO_ID: 41 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(259,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 42 con el PRODUCTO_ID: 42 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(260,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 43 con el PRODUCTO_ID: 43 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(261,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 44 con el PRODUCTO_ID: 44 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(262,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 45 con el PRODUCTO_ID: 45 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(263,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 46 con el PRODUCTO_ID: 46 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(264,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 47 con el PRODUCTO_ID: 47 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(265,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 48 con el PRODUCTO_ID: 48 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(266,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 49 con el PRODUCTO_ID: 49 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(267,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 50 con el PRODUCTO_ID: 50 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(268,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 51 con el PRODUCTO_ID: 51 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(269,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 52 con el PRODUCTO_ID: 52 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(270,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 53 con el PRODUCTO_ID: 53 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(271,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 54 con el PRODUCTO_ID: 54 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(272,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 55 con el PRODUCTO_ID: 55 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(273,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 56 con el PRODUCTO_ID: 56 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(274,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 57 con el PRODUCTO_ID: 57 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(275,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 58 con el PRODUCTO_ID: 58 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(276,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 59 con el PRODUCTO_ID: 59 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(277,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 60 con el PRODUCTO_ID: 60 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(278,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 61 con el PRODUCTO_ID: 61 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(279,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 62 con el PRODUCTO_ID: 62 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(280,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 63 con el PRODUCTO_ID: 63 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(281,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 64 con el PRODUCTO_ID: 64 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(282,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 65 con el PRODUCTO_ID: 65 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(283,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 66 con el PRODUCTO_ID: 66 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(284,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 67 con el PRODUCTO_ID: 67 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(285,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 68 con el PRODUCTO_ID: 68 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(286,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 69 con el PRODUCTO_ID: 69 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(287,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 70 con el PRODUCTO_ID: 70 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(288,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 71 con el PRODUCTO_ID: 71 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(289,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 72 con el PRODUCTO_ID: 72 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(290,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 73 con el PRODUCTO_ID: 73 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(291,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 74 con el PRODUCTO_ID: 74 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(292,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 75 con el PRODUCTO_ID: 75 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(293,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 76 con el PRODUCTO_ID: 76 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(294,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 77 con el PRODUCTO_ID: 77 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(295,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 78 con el PRODUCTO_ID: 78 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(296,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 79 con el PRODUCTO_ID: 79 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(297,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 80 con el PRODUCTO_ID: 80 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(298,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 81 con el PRODUCTO_ID: 81 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(299,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 82 con el PRODUCTO_ID: 82 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(300,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 83 con el PRODUCTO_ID: 83 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(301,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 84 con el PRODUCTO_ID: 84 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(302,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 85 con el PRODUCTO_ID: 85 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(303,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 86 con el PRODUCTO_ID: 86 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(304,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 87 con el PRODUCTO_ID: 87 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(305,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 88 con el PRODUCTO_ID: 88 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(306,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 89 con el PRODUCTO_ID: 89 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(307,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 90 con el PRODUCTO_ID: 90 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(308,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 91 con el PRODUCTO_ID: 91 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(309,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 92 con el PRODUCTO_ID: 92 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(310,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 93 con el PRODUCTO_ID: 93 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(311,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 94 con el PRODUCTO_ID: 94 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(312,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 95 con el PRODUCTO_ID: 95 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(313,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 96 con el PRODUCTO_ID: 96 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(314,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 97 con el PRODUCTO_ID: 97 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(315,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 98 con el PRODUCTO_ID: 98 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(316,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 99 con el PRODUCTO_ID: 99 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(317,'root@localhost','tbb_inventarios','Create','El usuario: root@localhost ha insertado un nuevo INVENTARIO con el ID: 100 con el PRODUCTO_ID: 100 con la CANTIDAD_DISPONIBLE: 10 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:29:13',_binary '','2023-08-17 09:29:13'),(318,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 1 con la DIRECCIÓN: Calle Los Pinos 156 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(319,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 2 con la DIRECCIÓN: Calle Lerdo 375 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(320,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 3 con la DIRECCIÓN: Calle Aldama 99 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(321,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 4 con la DIRECCIÓN: Avenida Juarez 1300 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(322,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 5 con la DIRECCIÓN: Calle Lerdo 400 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(323,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 6 con la DIRECCIÓN: Avenida Zapata 18 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(324,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 7 con la DIRECCIÓN: Monte grande  con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(325,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 8 con la DIRECCIÓN: Calle Lerdo 375 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(326,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 9 con la DIRECCIÓN: Avenida Revolución 678 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(327,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 10 con la DIRECCIÓN: Calle Lerdo 905 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(328,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 11 con la DIRECCIÓN: Calle Morelos 309 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(329,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 12 con la DIRECCIÓN: Avenida Hidalgo 98 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(330,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 13 con la DIRECCIÓN: Calle Ocampo 432 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(331,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 14 con la DIRECCIÓN: Calle Morelos 359 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(332,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 15 con la DIRECCIÓN: Avenida Hidalgo 567 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(333,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 16 con la DIRECCIÓN: Calle Hidalgo 2 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(334,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 17 con la DIRECCIÓN: Calle Lerdo 400 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(335,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 18 con la DIRECCIÓN: Calle Bravo 542 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(336,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 19 con la DIRECCIÓN: Calle Los Pinos 156 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(337,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 20 con la DIRECCIÓN: Calle Ocampo 432 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(338,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 21 con la DIRECCIÓN: Call los perales 22 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(339,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 22 con la DIRECCIÓN: Avenida Reforma 503 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(340,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 23 con la DIRECCIÓN: Calle Princpal Venustiano Carranza con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(341,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 24 con la DIRECCIÓN: Calle Iturbide 57 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(342,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 25 con la DIRECCIÓN: Avenida Revolución 678 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(343,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 26 con la DIRECCIÓN: Calle Matamoros 100 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(344,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 27 con la DIRECCIÓN: Avenida Revolución 678 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(345,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 28 con la DIRECCIÓN: Avenida Zapata 18 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(346,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 29 con la DIRECCIÓN: Calle Zaragoza 234 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(347,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 30 con la DIRECCIÓN: Call los perales 22 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(348,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 31 con la DIRECCIÓN: Calle Guerrero 897 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(349,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 32 con la DIRECCIÓN: El tabacal 33 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(350,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 33 con la DIRECCIÓN: Calle Bravo 542 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(351,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 34 con la DIRECCIÓN: Avenida Hidalgo 123 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(352,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 35 con la DIRECCIÓN: Calle Matamoros 100 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(353,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 36 con la DIRECCIÓN: Los Pinos 22 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(354,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 37 con la DIRECCIÓN: Calle Morelos 67 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(355,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 38 con la DIRECCIÓN: Calzada Independencia 897 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(356,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 39 con la DIRECCIÓN: Calle Lerdo 400 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(357,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 40 con la DIRECCIÓN: Calle Lerdo 400 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(358,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 41 con la DIRECCIÓN: Avenida Hidalgo 567 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(359,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 42 con la DIRECCIÓN: Avenida Madero 543 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(360,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 43 con la DIRECCIÓN: Calle Lerdo 375 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(361,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 44 con la DIRECCIÓN: Calle Guerrero 897 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(362,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 45 con la DIRECCIÓN: Calle Ocampo 432 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(363,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 46 con la DIRECCIÓN: Colonia centro con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(364,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 47 con la DIRECCIÓN: Calle Morelos 67 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(365,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 48 con la DIRECCIÓN: Calle Los Pinos 156 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(366,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 49 con la DIRECCIÓN: Calle Lerdo 905 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(367,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 50 con la DIRECCIÓN: Calle Aldama 83 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:30:43',_binary '','2023-08-17 09:30:43'),(368,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 51 con la DIRECCIÓN: Calle Bravo 750 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(369,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 1 con el NOMBRE: Daniela con el PRIMER_APELLIDO: Romero con el SEGUNDO_APELLIDO: Zúñiga con la FECHA_NACIMIENTO: 2004-01-01 con el GÉNERO: F con la UBICACION_ID: 51 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(370,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 1 con el NOMBRE_USUARIO: Daniela Romero con el EMAIL: d.romero@hushmail.com con la CONTRASEÑA: zD=1U(7l con el NUMERO_TELEFONICO: 7645759834 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(371,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 52 con la DIRECCIÓN: Calle Los Pinos 156 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(372,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 2 con el NOMBRE: Ignacio con el PRIMER_APELLIDO: Zamora con el SEGUNDO_APELLIDO: López con la FECHA_NACIMIENTO: 1976-01-01 con el GÉNERO: M con la UBICACION_ID: 52 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(373,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 2 con el NOMBRE_USUARIO: Ignacio Zamora con el EMAIL: i.zamora@mail.com con la CONTRASEÑA: tpu4(Abdo!Op con el NUMERO_TELEFONICO: 2224463772 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(374,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 53 con la DIRECCIÓN: Calle Lerdo 950 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(375,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 3 con el NOMBRE: Ricardo con el PRIMER_APELLIDO: Flores con el SEGUNDO_APELLIDO: Ramírez con la FECHA_NACIMIENTO: 1981-01-01 con el GÉNERO: M con la UBICACION_ID: 53 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(376,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 3 con el NOMBRE_USUARIO: Ricardo Flores con el EMAIL: r.flores@live.com con la CONTRASEÑA: $XZEb con el NUMERO_TELEFONICO: 7764070629 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(377,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 54 con la DIRECCIÓN: Calle Hidalgo 321 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(378,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 4 con el NOMBRE: Dolores con el PRIMER_APELLIDO: Vega con el SEGUNDO_APELLIDO: Pacheco con la FECHA_NACIMIENTO: 1979-01-01 con el GÉNERO: F con la UBICACION_ID: 54 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(379,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 4 con el NOMBRE_USUARIO: Dolores Vega con el EMAIL: d.vega@outlook.com con la CONTRASEÑA: GW)655Ls3&y) con el NUMERO_TELEFONICO: 2227440719 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(380,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 55 con la DIRECCIÓN: Avenida Madero 609 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(381,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 5 con el NOMBRE: Karla con el PRIMER_APELLIDO: Delgado con el SEGUNDO_APELLIDO: Santos con la FECHA_NACIMIENTO: 1973-01-01 con el GÉNERO: F con la UBICACION_ID: 55 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(382,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 5 con el NOMBRE_USUARIO: Karla Delgado con el EMAIL: k.delgado@yahoo.com con la CONTRASEÑA: PsWEkMf*z con el NUMERO_TELEFONICO: 7643947289 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(383,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 56 con la DIRECCIÓN: Calle Guerrero 897 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(384,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 6 con el NOMBRE: Paola con el PRIMER_APELLIDO: Estrada con el SEGUNDO_APELLIDO: Arias con la FECHA_NACIMIENTO: 1979-01-01 con el GÉNERO: F con la UBICACION_ID: 56 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(385,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 6 con el NOMBRE_USUARIO: Paola Estrada con el EMAIL: p.estrada@excite.com con la CONTRASEÑA: 55O con el NUMERO_TELEFONICO: 2229417134 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(386,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 57 con la DIRECCIÓN: Calle Allende 295 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(387,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 7 con el NOMBRE: Julio con el PRIMER_APELLIDO: Vargas con el SEGUNDO_APELLIDO: Rivas con la FECHA_NACIMIENTO: 1977-01-01 con el GÉNERO: M con la UBICACION_ID: 57 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(388,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 7 con el NOMBRE_USUARIO: Julio Vargas con el EMAIL: j.vargas@yahoo.com con la CONTRASEÑA: PSw6)Certy% con el NUMERO_TELEFONICO: 2226632339 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(389,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 58 con la DIRECCIÓN: Avenida Hidalgo 600 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(390,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 8 con el NOMBRE: Andrés Rubén con el PRIMER_APELLIDO: Silva con el SEGUNDO_APELLIDO: Ortiz con la FECHA_NACIMIENTO: 1995-01-01 con el GÉNERO: M con la UBICACION_ID: 58 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(391,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 8 con el NOMBRE_USUARIO: Andrés Rubén Silva con el EMAIL: a.silva@zoho.com con la CONTRASEÑA: Egs_cAWk9TR con el NUMERO_TELEFONICO: 7641339300 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(392,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 59 con la DIRECCIÓN: Avenida Juarez 1200 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(393,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 9 con el NOMBRE: Juan Carlos con el PRIMER_APELLIDO: Olivares con el SEGUNDO_APELLIDO: León con la FECHA_NACIMIENTO: 1980-01-01 con el GÉNERO: M con la UBICACION_ID: 59 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(394,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 9 con el NOMBRE_USUARIO: Juan Carlos Olivares con el EMAIL: j.olivares@hushmail.com con la CONTRASEÑA: 6%bPWSb con el NUMERO_TELEFONICO: 7743896425 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(395,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 60 con la DIRECCIÓN: Calle Lerdo 950 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(396,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 10 con el NOMBRE: César con el PRIMER_APELLIDO: Torres con el SEGUNDO_APELLIDO: Estrada con la FECHA_NACIMIENTO: 2001-01-01 con el GÉNERO: M con la UBICACION_ID: 60 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(397,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 10 con el NOMBRE_USUARIO: César Torres con el EMAIL: c.torres@hushmail.com con la CONTRASEÑA: Zrj+Fp9FXbn@ con el NUMERO_TELEFONICO: 7647531999 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(398,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 61 con la DIRECCIÓN: Avenida Zapata 18 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(399,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 11 con el NOMBRE: Vanessa con el PRIMER_APELLIDO: López con el SEGUNDO_APELLIDO: Domínguez con la FECHA_NACIMIENTO: 1973-01-01 con el GÉNERO: F con la UBICACION_ID: 61 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(400,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 11 con el NOMBRE_USUARIO: Vanessa López con el EMAIL: v.lópez@live.com con la CONTRASEÑA: D0uw0R6lMbU- con el NUMERO_TELEFONICO: 7640691028 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(401,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 62 con la DIRECCIÓN: Calle Morelos 67 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(402,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 12 con el NOMBRE: Manuel con el PRIMER_APELLIDO: Ponce con el SEGUNDO_APELLIDO: Rojas con la FECHA_NACIMIENTO: 1983-01-01 con el GÉNERO: M con la UBICACION_ID: 62 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(403,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 12 con el NOMBRE_USUARIO: Manuel Ponce con el EMAIL: m.ponce@gmail.com con la CONTRASEÑA: 7mNf@+ con el NUMERO_TELEFONICO: 7741626451 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(404,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 63 con la DIRECCIÓN: Calle Hidalgo 2 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(405,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 13 con el NOMBRE: David con el PRIMER_APELLIDO: Carrillo con el SEGUNDO_APELLIDO: Ponce con la FECHA_NACIMIENTO: 1976-01-01 con el GÉNERO: M con la UBICACION_ID: 63 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(406,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 13 con el NOMBRE_USUARIO: David Carrillo con el EMAIL: d.carrillo@live.com con la CONTRASEÑA: Tat con el NUMERO_TELEFONICO: 2225343813 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(407,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 64 con la DIRECCIÓN: Calle Morelos 359 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(408,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 14 con el NOMBRE: Joaquín con el PRIMER_APELLIDO: Granados con el SEGUNDO_APELLIDO: Rojas con la FECHA_NACIMIENTO: 1999-01-01 con el GÉNERO: N/B con la UBICACION_ID: 64 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(409,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 14 con el NOMBRE_USUARIO: Joaquín Granados con el EMAIL: j.granados@zoho.com con la CONTRASEÑA: E_M con el NUMERO_TELEFONICO: 554005290 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(410,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 65 con la DIRECCIÓN: Calle Hidalgo 2 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(411,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 15 con el NOMBRE: Sara con el PRIMER_APELLIDO: Lara con el SEGUNDO_APELLIDO: Estrada con la FECHA_NACIMIENTO: 2002-01-01 con el GÉNERO: F con la UBICACION_ID: 65 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(412,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 15 con el NOMBRE_USUARIO: Sara Lara con el EMAIL: s.lara@apple.com con la CONTRASEÑA: eMCC6ZiQFI con el NUMERO_TELEFONICO: 7764150089 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(413,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 66 con la DIRECCIÓN: Calle Lerdo 400 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(414,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 16 con el NOMBRE: Fernando con el PRIMER_APELLIDO: Hernández con el SEGUNDO_APELLIDO: Gutiérrez con la FECHA_NACIMIENTO: 1985-01-01 con el GÉNERO: M con la UBICACION_ID: 66 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(415,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 16 con el NOMBRE_USUARIO: Fernando Hernández con el EMAIL: f.hernández@live.com con la CONTRASEÑA: yS=hT13 con el NUMERO_TELEFONICO: 7762361155 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(416,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 67 con la DIRECCIÓN: Calle Matamoros 79 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(417,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 17 con el NOMBRE: Antonia con el PRIMER_APELLIDO: Peña con el SEGUNDO_APELLIDO: Rodríguez con la FECHA_NACIMIENTO: 1989-01-01 con el GÉNERO: F con la UBICACION_ID: 67 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(418,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 17 con el NOMBRE_USUARIO: Antonia Peña con el EMAIL: a.peña@aol.com con la CONTRASEÑA: aOY0LFS27 con el NUMERO_TELEFONICO: 553198388 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(419,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 68 con la DIRECCIÓN: Calle Bravo 542 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(420,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 18 con el NOMBRE: Carolina con el PRIMER_APELLIDO: Cordero con el SEGUNDO_APELLIDO: Castro con la FECHA_NACIMIENTO: 1994-01-01 con el GÉNERO: F con la UBICACION_ID: 68 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(421,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 18 con el NOMBRE_USUARIO: Carolina Cordero con el EMAIL: c.cordero@hotmail.com con la CONTRASEÑA: oSAaacl0= con el NUMERO_TELEFONICO: 553730250 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(422,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 69 con la DIRECCIÓN: Avenida Zapata 12 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(423,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 19 con el NOMBRE: Magdalena Georgina con el PRIMER_APELLIDO: Díaz con el SEGUNDO_APELLIDO: Gómez con la FECHA_NACIMIENTO: 2000-01-01 con el GÉNERO: F con la UBICACION_ID: 69 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(424,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 19 con el NOMBRE_USUARIO: Magdalena Georgina Díaz con el EMAIL: m.díaz@excite.com con la CONTRASEÑA: 6Kf_P^8xm_rz= con el NUMERO_TELEFONICO: 7646759693 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(425,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 70 con la DIRECCIÓN: Calle Zaragoza 234 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(426,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 20 con el NOMBRE: Ivonne con el PRIMER_APELLIDO: Campos con el SEGUNDO_APELLIDO: Quezada con la FECHA_NACIMIENTO: 1991-01-01 con el GÉNERO: F con la UBICACION_ID: 70 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(427,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 20 con el NOMBRE_USUARIO: Ivonne Campos con el EMAIL: i.campos@fastmail.com con la CONTRASEÑA: Fc_Wz9b con el NUMERO_TELEFONICO: 7767240631 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(428,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 71 con la DIRECCIÓN: Calle Matamoros 79 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(429,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 21 con el NOMBRE: Marcela con el PRIMER_APELLIDO: Quezada con el SEGUNDO_APELLIDO: Paredes con la FECHA_NACIMIENTO: 1986-01-01 con el GÉNERO: F con la UBICACION_ID: 71 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(430,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 21 con el NOMBRE_USUARIO: Marcela Quezada con el EMAIL: m.quezada@hushmail.com con la CONTRASEÑA: Zcm3 con el NUMERO_TELEFONICO: 7640780626 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(431,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 72 con la DIRECCIÓN: Avenida Revolución 678 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(432,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 22 con el NOMBRE: Carlos con el PRIMER_APELLIDO: Alvarez con el SEGUNDO_APELLIDO: Luna con la FECHA_NACIMIENTO: 2004-01-01 con el GÉNERO: M con la UBICACION_ID: 72 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(433,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 22 con el NOMBRE_USUARIO: Carlos Alvarez con el EMAIL: c.alvarez@outlook.com con la CONTRASEÑA: Tl-LL- con el NUMERO_TELEFONICO: 7747068010 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(434,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 73 con la DIRECCIÓN: Calle Reforma 345 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(435,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 23 con el NOMBRE: Erik con el PRIMER_APELLIDO: Hidalgo con el SEGUNDO_APELLIDO: Gutiérrez con la FECHA_NACIMIENTO: 1999-01-01 con el GÉNERO: M con la UBICACION_ID: 73 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(436,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 23 con el NOMBRE_USUARIO: Erik Hidalgo con el EMAIL: e.hidalgo@hotmail.com con la CONTRASEÑA: og^mlviU1Z con el NUMERO_TELEFONICO: 2228058708 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(437,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 74 con la DIRECCIÓN: Avenida Reforma 553 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(438,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 24 con el NOMBRE: Antonio con el PRIMER_APELLIDO: Trejo con el SEGUNDO_APELLIDO: Aguilar con la FECHA_NACIMIENTO: 1993-01-01 con el GÉNERO: M con la UBICACION_ID: 74 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(439,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 24 con el NOMBRE_USUARIO: Antonio Trejo con el EMAIL: a.trejo@fastmail.com con la CONTRASEÑA: 9c con el NUMERO_TELEFONICO: 557977206 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(440,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 75 con la DIRECCIÓN: Calle Lerdo 400 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(441,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 25 con el NOMBRE: Gloria con el PRIMER_APELLIDO: Olivares con el SEGUNDO_APELLIDO: Ponce con la FECHA_NACIMIENTO: 1975-01-01 con el GÉNERO: F con la UBICACION_ID: 75 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(442,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 25 con el NOMBRE_USUARIO: Gloria Olivares con el EMAIL: g.olivares@mail.com con la CONTRASEÑA: qsSmkn con el NUMERO_TELEFONICO: 7765411226 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(443,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 76 con la DIRECCIÓN: Calle Bravo 750 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(444,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 26 con el NOMBRE: Regina Dolores con el PRIMER_APELLIDO: Cortés con el SEGUNDO_APELLIDO: Zúñiga con la FECHA_NACIMIENTO: 2001-01-01 con el GÉNERO: F con la UBICACION_ID: 76 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(445,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 26 con el NOMBRE_USUARIO: Regina Dolores Cortés con el EMAIL: r.cortés@live.com con la CONTRASEÑA: Gd=32E$ con el NUMERO_TELEFONICO: 7649856043 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(446,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 77 con la DIRECCIÓN: Calle Lerdo 905 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(447,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 27 con el NOMBRE: Raúl con el PRIMER_APELLIDO: Vega con el SEGUNDO_APELLIDO: Valencia con la FECHA_NACIMIENTO: 1974-01-01 con el GÉNERO: M con la UBICACION_ID: 77 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(448,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 27 con el NOMBRE_USUARIO: Raúl Vega con el EMAIL: r.vega@outlook.com con la CONTRASEÑA: RtQaD(HKe&uZR$ con el NUMERO_TELEFONICO: 2225621632 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(449,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 78 con la DIRECCIÓN: Avenida Juarez 1300 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(450,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 28 con el NOMBRE: Refugio Isabela con el PRIMER_APELLIDO: Zamora con el SEGUNDO_APELLIDO: Espinoza con la FECHA_NACIMIENTO: 1987-01-01 con el GÉNERO: F con la UBICACION_ID: 78 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(451,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 28 con el NOMBRE_USUARIO: Refugio Isabela Zamora con el EMAIL: r.zamora@aol.com con la CONTRASEÑA: 1BZ con el NUMERO_TELEFONICO: 7760173023 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(452,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 79 con la DIRECCIÓN: Calle Bravo 672 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(453,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 29 con el NOMBRE: Andrés con el PRIMER_APELLIDO: Cordero con el SEGUNDO_APELLIDO: Osorio con la FECHA_NACIMIENTO: 1974-01-01 con el GÉNERO: M con la UBICACION_ID: 79 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(454,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 29 con el NOMBRE_USUARIO: Andrés Cordero con el EMAIL: a.cordero@excite.com con la CONTRASEÑA: $f9#6AHk con el NUMERO_TELEFONICO: 7763267750 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(455,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 80 con la DIRECCIÓN: Calle Los Pinos 156 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(456,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 30 con el NOMBRE: Roberto con el PRIMER_APELLIDO: Vega con el SEGUNDO_APELLIDO: Vargas con la FECHA_NACIMIENTO: 1972-01-01 con el GÉNERO: M con la UBICACION_ID: 80 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(457,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 30 con el NOMBRE_USUARIO: Roberto Vega con el EMAIL: r.vega@aol.com con la CONTRASEÑA: NziSSnlt con el NUMERO_TELEFONICO: 7649805843 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(458,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 81 con la DIRECCIÓN: Calle Lerdo 375 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(459,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 31 con el NOMBRE: Teresa Paula con el PRIMER_APELLIDO: Villalobos con el SEGUNDO_APELLIDO: Ramírez con la FECHA_NACIMIENTO: 1990-01-01 con el GÉNERO: F con la UBICACION_ID: 81 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(460,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 31 con el NOMBRE_USUARIO: Teresa Paula Villalobos con el EMAIL: t.villalobos@zoho.com con la CONTRASEÑA: dm1bber con el NUMERO_TELEFONICO: 7763625645 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(461,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 82 con la DIRECCIÓN: Calle Galeana 89 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(462,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 32 con el NOMBRE: Jazmín Rosario con el PRIMER_APELLIDO: Alvarado con el SEGUNDO_APELLIDO: Paredes con la FECHA_NACIMIENTO: 1978-01-01 con el GÉNERO: F con la UBICACION_ID: 82 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(463,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 32 con el NOMBRE_USUARIO: Jazmín Rosario Alvarado con el EMAIL: j.alvarado@fastmail.com con la CONTRASEÑA: hU7c#l con el NUMERO_TELEFONICO: 555766447 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(464,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 83 con la DIRECCIÓN: Calle Allende 295 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(465,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 33 con el NOMBRE: Hugo con el PRIMER_APELLIDO: Guerrero con el SEGUNDO_APELLIDO: Cabrera con la FECHA_NACIMIENTO: 1980-01-01 con el GÉNERO: M con la UBICACION_ID: 83 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(466,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 33 con el NOMBRE_USUARIO: Hugo Guerrero con el EMAIL: h.guerrero@live.com con la CONTRASEÑA: kUTk=HucF=Te con el NUMERO_TELEFONICO: 7748093060 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(467,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 84 con la DIRECCIÓN: Calle Lerdo 905 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(468,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 34 con el NOMBRE: Esther con el PRIMER_APELLIDO: Rangel con el SEGUNDO_APELLIDO: Escobedo con la FECHA_NACIMIENTO: 1972-01-01 con el GÉNERO: F con la UBICACION_ID: 84 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(469,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 34 con el NOMBRE_USUARIO: Esther Rangel con el EMAIL: e.rangel@yahoo.com con la CONTRASEÑA: 3scJ con el NUMERO_TELEFONICO: 7644833392 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(470,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 85 con la DIRECCIÓN: Calle Reforma 11 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(471,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 35 con el NOMBRE: Antonio con el PRIMER_APELLIDO: Méndez con el SEGUNDO_APELLIDO: Granados con la FECHA_NACIMIENTO: 2002-01-01 con el GÉNERO: M con la UBICACION_ID: 85 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(472,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 35 con el NOMBRE_USUARIO: Antonio Méndez con el EMAIL: a.méndez@gmx.com con la CONTRASEÑA: rAcl0&L8Kd@-JD con el NUMERO_TELEFONICO: 7746569567 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(473,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 86 con la DIRECCIÓN: Calle Iturbide 57 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(474,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 36 con el NOMBRE: Ángeles con el PRIMER_APELLIDO: Maldonado con el SEGUNDO_APELLIDO: Rivas con la FECHA_NACIMIENTO: 1991-01-01 con el GÉNERO: F con la UBICACION_ID: 86 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(475,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 36 con el NOMBRE_USUARIO: Ángeles Maldonado con el EMAIL: á.maldonado@excite.com con la CONTRASEÑA: $7BKwfNBsnkmI con el NUMERO_TELEFONICO: 7747268269 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(476,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 87 con la DIRECCIÓN: Calle Reforma 11 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(477,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 37 con el NOMBRE: Alicia Cristina con el PRIMER_APELLIDO: Solís con el SEGUNDO_APELLIDO: Hidalgo con la FECHA_NACIMIENTO: 1999-01-01 con el GÉNERO: F con la UBICACION_ID: 87 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(478,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 37 con el NOMBRE_USUARIO: Alicia Cristina Solís con el EMAIL: a.solís@mail.com con la CONTRASEÑA: @mAsnmApaJxi0gF con el NUMERO_TELEFONICO: 2220523391 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(479,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 88 con la DIRECCIÓN: Calle Lerdo 905 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(480,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 38 con el NOMBRE: Adriana con el PRIMER_APELLIDO: Ochoa con el SEGUNDO_APELLIDO: Sánchez con la FECHA_NACIMIENTO: 1999-01-01 con el GÉNERO: F con la UBICACION_ID: 88 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(481,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 38 con el NOMBRE_USUARIO: Adriana Ochoa con el EMAIL: a.ochoa@fastmail.com con la CONTRASEÑA: EyJytw36X+ con el NUMERO_TELEFONICO: 2226100339 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(482,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 89 con la DIRECCIÓN: Calle Allende 295 con la CIUDAD: Xicotepec de Juárez con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(483,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 39 con el NOMBRE: Concepción con el PRIMER_APELLIDO: Herrera con el SEGUNDO_APELLIDO: Romero con la FECHA_NACIMIENTO: 1973-01-01 con el GÉNERO: F con la UBICACION_ID: 89 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(484,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 39 con el NOMBRE_USUARIO: Concepción Herrera con el EMAIL: c.herrera@zoho.com con la CONTRASEÑA: r#Ojf44Ls4_R con el NUMERO_TELEFONICO: 7741200259 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(485,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 90 con la DIRECCIÓN: Avenida Juarez 1023 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(486,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 40 con el NOMBRE: Soledad Carmen con el PRIMER_APELLIDO: Villalobos con el SEGUNDO_APELLIDO: León con la FECHA_NACIMIENTO: 1999-01-01 con el GÉNERO: N/B con la UBICACION_ID: 90 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(487,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 40 con el NOMBRE_USUARIO: Soledad Carmen Villalobos con el EMAIL: s.villalobos@apple.com con la CONTRASEÑA: bxJH7TWEgu con el NUMERO_TELEFONICO: 7746091310 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(488,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 91 con la DIRECCIÓN: Avenida Madero 609 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(489,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 41 con el NOMBRE: Marco Antonio con el PRIMER_APELLIDO: Domínguez con el SEGUNDO_APELLIDO: Franco con la FECHA_NACIMIENTO: 1989-01-01 con el GÉNERO: N/B con la UBICACION_ID: 91 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(490,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 41 con el NOMBRE_USUARIO: Marco Antonio Domínguez con el EMAIL: m.domínguez@excite.com con la CONTRASEÑA: 2WbtoqN_pnyctnk con el NUMERO_TELEFONICO: 2223564755 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(491,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 92 con la DIRECCIÓN: Calle Morelos 309 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(492,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 42 con el NOMBRE: Rubén con el PRIMER_APELLIDO: Lara con el SEGUNDO_APELLIDO: Herrera con la FECHA_NACIMIENTO: 2000-01-01 con el GÉNERO: M con la UBICACION_ID: 92 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(493,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 42 con el NOMBRE_USUARIO: Rubén Lara con el EMAIL: r.lara@outlook.com con la CONTRASEÑA: Xz68Zab con el NUMERO_TELEFONICO: 2222589893 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(494,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 93 con la DIRECCIÓN: Avenida Hidalgo 567 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(495,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 43 con el NOMBRE: Jesús con el PRIMER_APELLIDO: Luna con el SEGUNDO_APELLIDO: Santos con la FECHA_NACIMIENTO: 2000-01-01 con el GÉNERO: M con la UBICACION_ID: 93 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(496,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 43 con el NOMBRE_USUARIO: Jesús Luna con el EMAIL: j.luna@live.com con la CONTRASEÑA: pw*YT-j3seS5-2 con el NUMERO_TELEFONICO: 558191663 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(497,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 94 con la DIRECCIÓN: Calle Aldama 83 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(498,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 44 con el NOMBRE: Noemí con el PRIMER_APELLIDO: Castro con el SEGUNDO_APELLIDO: Valdez con la FECHA_NACIMIENTO: 1998-01-01 con el GÉNERO: F con la UBICACION_ID: 94 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(499,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 44 con el NOMBRE_USUARIO: Noemí Castro con el EMAIL: n.castro@zoho.com con la CONTRASEÑA: kc5Ycsj(qB con el NUMERO_TELEFONICO: 2227129619 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(500,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 95 con la DIRECCIÓN: Calle Los Pinos 156 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(501,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 45 con el NOMBRE: Gerardo con el PRIMER_APELLIDO: Ayala con el SEGUNDO_APELLIDO: Meza con la FECHA_NACIMIENTO: 2004-01-01 con el GÉNERO: M con la UBICACION_ID: 95 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(502,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 45 con el NOMBRE_USUARIO: Gerardo Ayala con el EMAIL: g.ayala@live.com con la CONTRASEÑA: bdq(=iZ-+% con el NUMERO_TELEFONICO: 556629851 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(503,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 96 con la DIRECCIÓN: Calle Guerrero 945 con la CIUDAD: Juan Galindo con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(504,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 46 con el NOMBRE: Salvador con el PRIMER_APELLIDO: Hidalgo con el SEGUNDO_APELLIDO: Meza con la FECHA_NACIMIENTO: 1972-01-01 con el GÉNERO: M con la UBICACION_ID: 96 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(505,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 46 con el NOMBRE_USUARIO: Salvador Hidalgo con el EMAIL: s.hidalgo@hotmail.com con la CONTRASEÑA: _nd5U con el NUMERO_TELEFONICO: 2225918608 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(506,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 97 con la DIRECCIÓN: Avenida Hidalgo 600 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(507,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 47 con el NOMBRE: Ariadna Leticia con el PRIMER_APELLIDO: Ramos con el SEGUNDO_APELLIDO: Santos con la FECHA_NACIMIENTO: 1991-01-01 con el GÉNERO: F con la UBICACION_ID: 97 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(508,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 47 con el NOMBRE_USUARIO: Ariadna Leticia Ramos con el EMAIL: a.ramos@fastmail.com con la CONTRASEÑA: G8ZadraA65L con el NUMERO_TELEFONICO: 554366661 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(509,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 98 con la DIRECCIÓN: Calle Ocampo 432 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(510,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 48 con el NOMBRE: Sergio con el PRIMER_APELLIDO: Corona con el SEGUNDO_APELLIDO: Aguirre con la FECHA_NACIMIENTO: 1980-01-01 con el GÉNERO: M con la UBICACION_ID: 98 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(511,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 48 con el NOMBRE_USUARIO: Sergio Corona con el EMAIL: s.corona@gmx.com con la CONTRASEÑA: AOTEq&#PpFH= con el NUMERO_TELEFONICO: 557774559 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:28',_binary '','2023-08-17 09:31:28'),(512,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 99 con la DIRECCIÓN: Calle Iturbide 57 con la CIUDAD: Zihuateutla con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:29',_binary '','2023-08-17 09:31:29'),(513,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 49 con el NOMBRE: Alejandra con el PRIMER_APELLIDO: Valencia con el SEGUNDO_APELLIDO: Ruíz con la FECHA_NACIMIENTO: 2000-01-01 con el GÉNERO: F con la UBICACION_ID: 99 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:29',_binary '','2023-08-17 09:31:29'),(514,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 49 con el NOMBRE_USUARIO: Alejandra Valencia con el EMAIL: a.valencia@hushmail.com con la CONTRASEÑA: 7+KPu4% con el NUMERO_TELEFONICO: 7644975397 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:29',_binary '','2023-08-17 09:31:29'),(515,'root@localhost','tbb_ubicaciones','Create','El usuario: root@localhost ha insertado una nueva UBICACIÓN con el ID: 100 con la DIRECCIÓN: Calle Lerdo 950 con la CIUDAD: Huachinango con el ESTADO: Puebla con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:29',_binary '','2023-08-17 09:31:29'),(516,'root@localhost','tbb_personas','Create','El usuario: root@localhost ha insertado una nueva PERSONA con el ID: 50 con el NOMBRE: Gabriel Francisco Javier con el PRIMER_APELLIDO: Ortiz con el SEGUNDO_APELLIDO: Sánchez con la FECHA_NACIMIENTO: 1991-01-01 con el GÉNERO: N/B con la UBICACION_ID: 100 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:29',_binary '','2023-08-17 09:31:29'),(517,'root@localhost','tbb_usuarios','Create','El usuario: root@localhost ha insertado un nuevo USUARIO con el PERSONA_ID: 50 con el NOMBRE_USUARIO: Gabriel Francisco Javier Ortiz con el EMAIL: g.ortiz@zoho.com con la CONTRASEÑA: aMK%)fRVG con el NUMERO_TELEFONICO: 2222151063 con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:31:29',_binary '','2023-08-17 09:31:29'),(518,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 1 con el USUARIO_ID: 50 con el PRODUCTO_ID: 22 con las OBSERVACIONES: El producto llegó a tiempo y en perfectas condiciones. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(519,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 2 con el USUARIO_ID: 27 con el PRODUCTO_ID: 38 con las OBSERVACIONES: Excelente servicio al cliente durante el proceso de pedido. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(520,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 3 con el USUARIO_ID: 30 con el PRODUCTO_ID: 12 con las OBSERVACIONES: El producto llegó a tiempo y en perfectas condiciones. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(521,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 4 con el USUARIO_ID: 18 con el PRODUCTO_ID: 12 con las OBSERVACIONES: Hubo un pequeño problema con el envío, pero se solucionó rápidamente. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(522,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 5 con el USUARIO_ID: 50 con el PRODUCTO_ID: 100 con las OBSERVACIONES: El producto llegó a tiempo y en perfectas condiciones. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(523,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 6 con el USUARIO_ID: 33 con el PRODUCTO_ID: 81 con las OBSERVACIONES: Pedido realizado correctamente. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(524,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 7 con el USUARIO_ID: 36 con el PRODUCTO_ID: 58 con las OBSERVACIONES: El pedido se realizó sin problemas y el producto es de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(525,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 8 con el USUARIO_ID: 43 con el PRODUCTO_ID: 18 con las OBSERVACIONES: Pedido realizado correctamente. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(526,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 9 con el USUARIO_ID: 5 con el PRODUCTO_ID: 74 con las OBSERVACIONES: El producto llegó a tiempo y en perfectas condiciones. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(527,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 10 con el USUARIO_ID: 5 con el PRODUCTO_ID: 87 con las OBSERVACIONES: El pedido se realizó sin problemas y el producto es de alta calidad. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(528,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 11 con el USUARIO_ID: 13 con el PRODUCTO_ID: 22 con las OBSERVACIONES: Excelente servicio al cliente durante el proceso de pedido. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(529,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 12 con el USUARIO_ID: 48 con el PRODUCTO_ID: 81 con las OBSERVACIONES: El pedido se realizó sin problemas y el producto es de alta calidad. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(530,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 13 con el USUARIO_ID: 16 con el PRODUCTO_ID: 51 con las OBSERVACIONES: El producto llegó a tiempo y en perfectas condiciones. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(531,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 14 con el USUARIO_ID: 31 con el PRODUCTO_ID: 60 con las OBSERVACIONES: Hubo un pequeño problema con el envío, pero se solucionó rápidamente. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(532,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 15 con el USUARIO_ID: 37 con el PRODUCTO_ID: 54 con las OBSERVACIONES: Pedido realizado correctamente. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(533,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 16 con el USUARIO_ID: 22 con el PRODUCTO_ID: 85 con las OBSERVACIONES: Excelente servicio al cliente durante el proceso de pedido. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(534,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 17 con el USUARIO_ID: 28 con el PRODUCTO_ID: 59 con las OBSERVACIONES: Pedido realizado correctamente. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(535,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 18 con el USUARIO_ID: 20 con el PRODUCTO_ID: 2 con las OBSERVACIONES: Excelente servicio al cliente durante el proceso de pedido. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(536,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 19 con el USUARIO_ID: 19 con el PRODUCTO_ID: 66 con las OBSERVACIONES: Hubo un pequeño problema con el envío, pero se solucionó rápidamente. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(537,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 20 con el USUARIO_ID: 17 con el PRODUCTO_ID: 44 con las OBSERVACIONES: Excelente servicio al cliente durante el proceso de pedido. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(538,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 21 con el USUARIO_ID: 38 con el PRODUCTO_ID: 40 con las OBSERVACIONES: Hubo un pequeño problema con el envío, pero se solucionó rápidamente. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(539,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 22 con el USUARIO_ID: 34 con el PRODUCTO_ID: 63 con las OBSERVACIONES: Hubo un pequeño problema con el envío, pero se solucionó rápidamente. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(540,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 23 con el USUARIO_ID: 33 con el PRODUCTO_ID: 53 con las OBSERVACIONES: Hubo un pequeño problema con el envío, pero se solucionó rápidamente. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(541,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 24 con el USUARIO_ID: 10 con el PRODUCTO_ID: 10 con las OBSERVACIONES: Excelente servicio al cliente durante el proceso de pedido. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(542,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 25 con el USUARIO_ID: 20 con el PRODUCTO_ID: 31 con las OBSERVACIONES: El producto llegó a tiempo y en perfectas condiciones. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(543,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 26 con el USUARIO_ID: 40 con el PRODUCTO_ID: 67 con las OBSERVACIONES: Excelente servicio al cliente durante el proceso de pedido. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(544,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 27 con el USUARIO_ID: 6 con el PRODUCTO_ID: 16 con las OBSERVACIONES: Excelente servicio al cliente durante el proceso de pedido. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(545,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 28 con el USUARIO_ID: 24 con el PRODUCTO_ID: 8 con las OBSERVACIONES: Excelente servicio al cliente durante el proceso de pedido. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(546,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 29 con el USUARIO_ID: 31 con el PRODUCTO_ID: 60 con las OBSERVACIONES: Hubo un pequeño problema con el envío, pero se solucionó rápidamente. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(547,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 30 con el USUARIO_ID: 6 con el PRODUCTO_ID: 88 con las OBSERVACIONES: El pedido se realizó sin problemas y el producto es de alta calidad. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(548,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 31 con el USUARIO_ID: 33 con el PRODUCTO_ID: 62 con las OBSERVACIONES: Hubo un pequeño problema con el envío, pero se solucionó rápidamente. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(549,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 32 con el USUARIO_ID: 10 con el PRODUCTO_ID: 80 con las OBSERVACIONES: Excelente servicio al cliente durante el proceso de pedido. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(550,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 33 con el USUARIO_ID: 50 con el PRODUCTO_ID: 33 con las OBSERVACIONES: El pedido se realizó sin problemas y el producto es de alta calidad. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(551,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 34 con el USUARIO_ID: 20 con el PRODUCTO_ID: 16 con las OBSERVACIONES: El producto llegó a tiempo y en perfectas condiciones. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(552,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 35 con el USUARIO_ID: 43 con el PRODUCTO_ID: 64 con las OBSERVACIONES: Hubo un pequeño problema con el envío, pero se solucionó rápidamente. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(553,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 36 con el USUARIO_ID: 26 con el PRODUCTO_ID: 67 con las OBSERVACIONES: El producto llegó a tiempo y en perfectas condiciones. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(554,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 37 con el USUARIO_ID: 15 con el PRODUCTO_ID: 95 con las OBSERVACIONES: Pedido realizado correctamente. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(555,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 38 con el USUARIO_ID: 49 con el PRODUCTO_ID: 32 con las OBSERVACIONES: Hubo un pequeño problema con el envío, pero se solucionó rápidamente. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(556,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 39 con el USUARIO_ID: 23 con el PRODUCTO_ID: 41 con las OBSERVACIONES: El producto llegó a tiempo y en perfectas condiciones. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(557,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 40 con el USUARIO_ID: 18 con el PRODUCTO_ID: 89 con las OBSERVACIONES: El producto llegó a tiempo y en perfectas condiciones. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(558,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 41 con el USUARIO_ID: 2 con el PRODUCTO_ID: 49 con las OBSERVACIONES: El producto llegó a tiempo y en perfectas condiciones. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(559,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 42 con el USUARIO_ID: 42 con el PRODUCTO_ID: 64 con las OBSERVACIONES: Pedido realizado correctamente. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(560,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 43 con el USUARIO_ID: 14 con el PRODUCTO_ID: 29 con las OBSERVACIONES: Excelente servicio al cliente durante el proceso de pedido. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(561,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 44 con el USUARIO_ID: 17 con el PRODUCTO_ID: 96 con las OBSERVACIONES: El producto llegó a tiempo y en perfectas condiciones. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(562,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 45 con el USUARIO_ID: 44 con el PRODUCTO_ID: 19 con las OBSERVACIONES: Pedido realizado correctamente. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(563,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 46 con el USUARIO_ID: 31 con el PRODUCTO_ID: 67 con las OBSERVACIONES: Pedido realizado correctamente. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(564,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 47 con el USUARIO_ID: 17 con el PRODUCTO_ID: 89 con las OBSERVACIONES: Hubo un pequeño problema con el envío, pero se solucionó rápidamente. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(565,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 48 con el USUARIO_ID: 3 con el PRODUCTO_ID: 18 con las OBSERVACIONES: Excelente servicio al cliente durante el proceso de pedido. con ESTATUS por defecto: 1 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(566,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 49 con el USUARIO_ID: 8 con el PRODUCTO_ID: 57 con las OBSERVACIONES: Pedido realizado correctamente. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(567,'root@localhost','tbb_pedidos','Create','El usuario: root@localhost ha insertado un nuevo PEDIDO con el ID: 50 con el USUARIO_ID: 34 con el PRODUCTO_ID: 90 con las OBSERVACIONES: Pedido realizado correctamente. con ESTATUS por defecto: 0 con FECHA DE REGISTRO: 2023-08-17 09:32:13',_binary '','2023-08-17 09:32:13'),(568,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 1 con el USUARIO_ID: 33 con el PRODUCTO_ID: 1 con el COMENTARIO: Este producto ha sido una excelente adquisición. Me encanta cómo funciona y la calidad es impresionante. con la CALIFICACIÓN: 4 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(569,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 2 con el USUARIO_ID: 10 con el PRODUCTO_ID: 2 con el COMENTARIO: Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia. con la CALIFICACIÓN: 5 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(570,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 3 con el USUARIO_ID: 12 con el PRODUCTO_ID: 3 con el COMENTARIO: Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia. con la CALIFICACIÓN: 5 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(571,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 4 con el USUARIO_ID: 14 con el PRODUCTO_ID: 4 con el COMENTARIO: Un producto promedio. Cumple su función pero no me ha sorprendido en ninguno de sus aspectos. con la CALIFICACIÓN: 2 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(572,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 5 con el USUARIO_ID: 43 con el PRODUCTO_ID: 5 con el COMENTARIO: Este producto es bastante decente. Cumple su propósito y no tuve problemas importantes, aunque creo que hay algunas áreas en las que se podría mejorar. con la CALIFICACIÓN: 3 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(573,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 6 con el USUARIO_ID: 48 con el PRODUCTO_ID: 6 con el COMENTARIO: No quedé impresionado con este producto. Tuve varios problemas con su rendimiento y las características no eran lo que esperaba. Creo que hay otros productos en el mercado que ofrecen un mejor valor. con la CALIFICACIÓN: 1 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(574,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 7 con el USUARIO_ID: 1 con el PRODUCTO_ID: 7 con el COMENTARIO: No quedé impresionado con este producto. Tuve varios problemas con su rendimiento y las características no eran lo que esperaba. Creo que hay otros productos en el mercado que ofrecen un mejor valor. con la CALIFICACIÓN: 1 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(575,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 8 con el USUARIO_ID: 42 con el PRODUCTO_ID: 8 con el COMENTARIO: Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia. con la CALIFICACIÓN: 4 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(576,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 9 con el USUARIO_ID: 6 con el PRODUCTO_ID: 9 con el COMENTARIO: Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia. con la CALIFICACIÓN: 4 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(577,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 10 con el USUARIO_ID: 1 con el PRODUCTO_ID: 10 con el COMENTARIO: El producto me ha dejado muy satisfecho. Es de gran calidad, funciona perfectamente y me encanta su diseño. con la CALIFICACIÓN: 4 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(578,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 11 con el USUARIO_ID: 19 con el PRODUCTO_ID: 11 con el COMENTARIO: Un producto promedio. Cumple su función pero no me ha sorprendido en ninguno de sus aspectos. con la CALIFICACIÓN: 3 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(579,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 12 con el USUARIO_ID: 37 con el PRODUCTO_ID: 12 con el COMENTARIO: Este producto ha sido una excelente adquisición. Me encanta cómo funciona y la calidad es impresionante. con la CALIFICACIÓN: 5 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(580,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 13 con el USUARIO_ID: 24 con el PRODUCTO_ID: 13 con el COMENTARIO: Honestamente, me ha decepcionado este producto. Creo que debería mejorar en varios aspectos para justificar su precio. con la CALIFICACIÓN: 2 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(581,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 14 con el USUARIO_ID: 32 con el PRODUCTO_ID: 14 con el COMENTARIO: Este producto me ha dejado asombrado. No solo por su alta calidad, sino también por su atención al detalle y su diseño impresionante. con la CALIFICACIÓN: 4 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(582,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 15 con el USUARIO_ID: 35 con el PRODUCTO_ID: 15 con el COMENTARIO: Este producto es bastante decente. Cumple su propósito y no tuve problemas importantes, aunque creo que hay algunas áreas en las que se podría mejorar. con la CALIFICACIÓN: 2 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(583,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 16 con el USUARIO_ID: 42 con el PRODUCTO_ID: 16 con el COMENTARIO: El producto me ha dejado muy satisfecho. Es de gran calidad, funciona perfectamente y me encanta su diseño. con la CALIFICACIÓN: 4 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(584,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 17 con el USUARIO_ID: 15 con el PRODUCTO_ID: 17 con el COMENTARIO: Honestamente, me ha decepcionado este producto. Creo que debería mejorar en varios aspectos para justificar su precio. con la CALIFICACIÓN: 2 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(585,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 18 con el USUARIO_ID: 21 con el PRODUCTO_ID: 18 con el COMENTARIO: Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia. con la CALIFICACIÓN: 5 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(586,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 19 con el USUARIO_ID: 23 con el PRODUCTO_ID: 19 con el COMENTARIO: Un producto promedio. Cumple su función pero no me ha sorprendido en ninguno de sus aspectos. con la CALIFICACIÓN: 3 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(587,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 20 con el USUARIO_ID: 46 con el PRODUCTO_ID: 20 con el COMENTARIO: El producto no ha sido lo que esperaba. Los materiales parecen de baja calidad y ha habido varios problemas en su funcionamiento. con la CALIFICACIÓN: 2 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(588,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 21 con el USUARIO_ID: 41 con el PRODUCTO_ID: 21 con el COMENTARIO: No quedé impresionado con este producto. Tuve varios problemas con su rendimiento y las características no eran lo que esperaba. Creo que hay otros productos en el mercado que ofrecen un mejor valor. con la CALIFICACIÓN: 1 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(589,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 22 con el USUARIO_ID: 4 con el PRODUCTO_ID: 22 con el COMENTARIO: No quedé impresionado con este producto. Tuve varios problemas con su rendimiento y las características no eran lo que esperaba. Creo que hay otros productos en el mercado que ofrecen un mejor valor. con la CALIFICACIÓN: 2 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(590,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 23 con el USUARIO_ID: 40 con el PRODUCTO_ID: 23 con el COMENTARIO: Este producto me ha dejado asombrado. No solo por su alta calidad, sino también por su atención al detalle y su diseño impresionante. con la CALIFICACIÓN: 5 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(591,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 24 con el USUARIO_ID: 8 con el PRODUCTO_ID: 24 con el COMENTARIO: La calidad del producto es aceptable, pero no me ha sorprendido. Si buscas algo básico, puede ser una buena opción. con la CALIFICACIÓN: 2 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(592,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 25 con el USUARIO_ID: 11 con el PRODUCTO_ID: 25 con el COMENTARIO: Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia. con la CALIFICACIÓN: 5 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(593,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 26 con el USUARIO_ID: 23 con el PRODUCTO_ID: 26 con el COMENTARIO: No quedé impresionado con este producto. Tuve varios problemas con su rendimiento y las características no eran lo que esperaba. Creo que hay otros productos en el mercado que ofrecen un mejor valor. con la CALIFICACIÓN: 1 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(594,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 27 con el USUARIO_ID: 12 con el PRODUCTO_ID: 27 con el COMENTARIO: Este producto ha sido una excelente adquisición. Me encanta cómo funciona y la calidad es impresionante. con la CALIFICACIÓN: 4 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(595,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 28 con el USUARIO_ID: 50 con el PRODUCTO_ID: 28 con el COMENTARIO: Honestamente, me ha decepcionado este producto. Creo que debería mejorar en varios aspectos para justificar su precio. con la CALIFICACIÓN: 1 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(596,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 29 con el USUARIO_ID: 19 con el PRODUCTO_ID: 29 con el COMENTARIO: Honestamente, me ha decepcionado este producto. Creo que debería mejorar en varios aspectos para justificar su precio. con la CALIFICACIÓN: 1 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(597,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 30 con el USUARIO_ID: 49 con el PRODUCTO_ID: 30 con el COMENTARIO: La calidad del producto es aceptable, pero no me ha sorprendido. Si buscas algo básico, puede ser una buena opción. con la CALIFICACIÓN: 3 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(598,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 31 con el USUARIO_ID: 25 con el PRODUCTO_ID: 31 con el COMENTARIO: Este producto ha sido una excelente adquisición. Me encanta cómo funciona y la calidad es impresionante. con la CALIFICACIÓN: 5 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(599,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 32 con el USUARIO_ID: 41 con el PRODUCTO_ID: 32 con el COMENTARIO: Un producto promedio. Cumple su función pero no me ha sorprendido en ninguno de sus aspectos. con la CALIFICACIÓN: 3 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(600,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 33 con el USUARIO_ID: 38 con el PRODUCTO_ID: 33 con el COMENTARIO: Este producto ha sido una excelente adquisición. Me encanta cómo funciona y la calidad es impresionante. con la CALIFICACIÓN: 5 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(601,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 34 con el USUARIO_ID: 41 con el PRODUCTO_ID: 34 con el COMENTARIO: Honestamente, me ha decepcionado este producto. Creo que debería mejorar en varios aspectos para justificar su precio. con la CALIFICACIÓN: 1 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(602,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 35 con el USUARIO_ID: 30 con el PRODUCTO_ID: 35 con el COMENTARIO: Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia. con la CALIFICACIÓN: 5 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(603,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 36 con el USUARIO_ID: 49 con el PRODUCTO_ID: 36 con el COMENTARIO: Un producto promedio. Cumple su función pero no me ha sorprendido en ninguno de sus aspectos. con la CALIFICACIÓN: 3 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(604,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 37 con el USUARIO_ID: 45 con el PRODUCTO_ID: 37 con el COMENTARIO: Este producto me ha dejado asombrado. No solo por su alta calidad, sino también por su atención al detalle y su diseño impresionante. con la CALIFICACIÓN: 4 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(605,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 38 con el USUARIO_ID: 24 con el PRODUCTO_ID: 38 con el COMENTARIO: Este producto es bastante decente. Cumple su propósito y no tuve problemas importantes, aunque creo que hay algunas áreas en las que se podría mejorar. con la CALIFICACIÓN: 2 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(606,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 39 con el USUARIO_ID: 17 con el PRODUCTO_ID: 39 con el COMENTARIO: Este producto ha sido una excelente adquisición. Me encanta cómo funciona y la calidad es impresionante. con la CALIFICACIÓN: 5 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(607,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 40 con el USUARIO_ID: 41 con el PRODUCTO_ID: 40 con el COMENTARIO: Este producto es bastante decente. Cumple su propósito y no tuve problemas importantes, aunque creo que hay algunas áreas en las que se podría mejorar. con la CALIFICACIÓN: 3 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(608,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 41 con el USUARIO_ID: 31 con el PRODUCTO_ID: 41 con el COMENTARIO: El producto me ha dejado muy satisfecho. Es de gran calidad, funciona perfectamente y me encanta su diseño. con la CALIFICACIÓN: 4 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(609,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 42 con el USUARIO_ID: 42 con el PRODUCTO_ID: 42 con el COMENTARIO: El producto no ha sido lo que esperaba. Los materiales parecen de baja calidad y ha habido varios problemas en su funcionamiento. con la CALIFICACIÓN: 2 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(610,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 43 con el USUARIO_ID: 11 con el PRODUCTO_ID: 43 con el COMENTARIO: Este producto es bastante decente. Cumple su propósito y no tuve problemas importantes, aunque creo que hay algunas áreas en las que se podría mejorar. con la CALIFICACIÓN: 3 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(611,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 44 con el USUARIO_ID: 20 con el PRODUCTO_ID: 44 con el COMENTARIO: La calidad del producto es aceptable, pero no me ha sorprendido. Si buscas algo básico, puede ser una buena opción. con la CALIFICACIÓN: 3 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(612,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 45 con el USUARIO_ID: 43 con el PRODUCTO_ID: 45 con el COMENTARIO: El producto me ha dejado muy satisfecho. Es de gran calidad, funciona perfectamente y me encanta su diseño. con la CALIFICACIÓN: 4 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(613,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 46 con el USUARIO_ID: 10 con el PRODUCTO_ID: 46 con el COMENTARIO: La calidad del producto es aceptable, pero no me ha sorprendido. Si buscas algo básico, puede ser una buena opción. con la CALIFICACIÓN: 3 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(614,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 47 con el USUARIO_ID: 38 con el PRODUCTO_ID: 47 con el COMENTARIO: Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia. con la CALIFICACIÓN: 5 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(615,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 48 con el USUARIO_ID: 3 con el PRODUCTO_ID: 48 con el COMENTARIO: Este producto me ha dejado asombrado. No solo por su alta calidad, sino también por su atención al detalle y su diseño impresionante. con la CALIFICACIÓN: 4 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(616,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 49 con el USUARIO_ID: 25 con el PRODUCTO_ID: 49 con el COMENTARIO: El producto no ha sido lo que esperaba. Los materiales parecen de baja calidad y ha habido varios problemas en su funcionamiento. con la CALIFICACIÓN: 2 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(617,'root@localhost','tbb_reseñas','Create','El usuario: root@localhost ha insertado una nueva RESEÑA con el ID: 50 con el USUARIO_ID: 17 con el PRODUCTO_ID: 50 con el COMENTARIO: La calidad del producto es aceptable, pero no me ha sorprendido. Si buscas algo básico, puede ser una buena opción. con la CALIFICACIÓN: 2 con FECHA DE REGISTRO: 2023-08-17 09:34:50',_binary '','2023-08-17 09:34:50'),(618,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 1 con el USUARIO_ID: 26 con el PRODUCTO_ID: 61 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(619,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 2 con el USUARIO_ID: 27 con el PRODUCTO_ID: 81 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(620,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 3 con el USUARIO_ID: 24 con el PRODUCTO_ID: 91 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(621,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 4 con el USUARIO_ID: 7 con el PRODUCTO_ID: 95 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(622,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 5 con el USUARIO_ID: 17 con el PRODUCTO_ID: 80 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(623,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 6 con el USUARIO_ID: 1 con el PRODUCTO_ID: 67 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(624,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 7 con el USUARIO_ID: 16 con el PRODUCTO_ID: 54 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(625,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 8 con el USUARIO_ID: 39 con el PRODUCTO_ID: 21 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(626,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 9 con el USUARIO_ID: 37 con el PRODUCTO_ID: 8 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(627,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 10 con el USUARIO_ID: 8 con el PRODUCTO_ID: 52 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(628,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 11 con el USUARIO_ID: 7 con el PRODUCTO_ID: 11 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(629,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 12 con el USUARIO_ID: 7 con el PRODUCTO_ID: 37 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(630,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 13 con el USUARIO_ID: 21 con el PRODUCTO_ID: 100 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(631,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 14 con el USUARIO_ID: 37 con el PRODUCTO_ID: 66 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(632,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 15 con el USUARIO_ID: 6 con el PRODUCTO_ID: 54 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(633,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 16 con el USUARIO_ID: 18 con el PRODUCTO_ID: 19 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(634,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 17 con el USUARIO_ID: 43 con el PRODUCTO_ID: 74 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(635,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 18 con el USUARIO_ID: 5 con el PRODUCTO_ID: 30 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(636,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 19 con el USUARIO_ID: 9 con el PRODUCTO_ID: 99 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(637,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 20 con el USUARIO_ID: 21 con el PRODUCTO_ID: 7 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(638,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 21 con el USUARIO_ID: 6 con el PRODUCTO_ID: 35 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(639,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 22 con el USUARIO_ID: 22 con el PRODUCTO_ID: 6 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(640,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 23 con el USUARIO_ID: 2 con el PRODUCTO_ID: 97 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(641,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 24 con el USUARIO_ID: 38 con el PRODUCTO_ID: 85 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(642,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 25 con el USUARIO_ID: 49 con el PRODUCTO_ID: 31 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(643,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 26 con el USUARIO_ID: 32 con el PRODUCTO_ID: 22 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(644,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 27 con el USUARIO_ID: 11 con el PRODUCTO_ID: 39 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(645,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 28 con el USUARIO_ID: 16 con el PRODUCTO_ID: 37 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(646,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 29 con el USUARIO_ID: 46 con el PRODUCTO_ID: 46 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(647,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 30 con el USUARIO_ID: 27 con el PRODUCTO_ID: 30 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(648,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 31 con el USUARIO_ID: 46 con el PRODUCTO_ID: 62 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(649,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 32 con el USUARIO_ID: 19 con el PRODUCTO_ID: 1 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(650,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 33 con el USUARIO_ID: 47 con el PRODUCTO_ID: 61 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(651,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 34 con el USUARIO_ID: 12 con el PRODUCTO_ID: 39 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(652,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 35 con el USUARIO_ID: 12 con el PRODUCTO_ID: 96 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(653,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 36 con el USUARIO_ID: 5 con el PRODUCTO_ID: 59 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(654,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 37 con el USUARIO_ID: 33 con el PRODUCTO_ID: 50 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(655,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 38 con el USUARIO_ID: 28 con el PRODUCTO_ID: 22 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(656,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 39 con el USUARIO_ID: 23 con el PRODUCTO_ID: 59 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(657,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 40 con el USUARIO_ID: 30 con el PRODUCTO_ID: 17 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(658,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 41 con el USUARIO_ID: 4 con el PRODUCTO_ID: 90 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(659,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 42 con el USUARIO_ID: 13 con el PRODUCTO_ID: 57 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(660,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 43 con el USUARIO_ID: 4 con el PRODUCTO_ID: 68 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(661,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 44 con el USUARIO_ID: 7 con el PRODUCTO_ID: 65 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(662,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 45 con el USUARIO_ID: 42 con el PRODUCTO_ID: 19 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(663,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 46 con el USUARIO_ID: 24 con el PRODUCTO_ID: 77 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(664,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 47 con el USUARIO_ID: 21 con el PRODUCTO_ID: 82 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(665,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 48 con el USUARIO_ID: 40 con el PRODUCTO_ID: 55 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(666,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 49 con el USUARIO_ID: 18 con el PRODUCTO_ID: 12 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02'),(667,'root@localhost','tbb_sistema_de_apartado','Create','El usuario: root@localhost ha insertado un nuevo SISTEMA DE APARTADO con el ID: 50 con el USUARIO_ID: 26 con el PRODUCTO_ID: 19 con ESTATUS por defecto: 1 con FECHA_ENTREGA_MAX: 2023-08-24 con FECHA DE REGISTRO: 2023-08-17 09:36:02',_binary '','2023-08-17 09:36:02');
/*!40000 ALTER TABLE `tbi_bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_detalle_apartados`
--

DROP TABLE IF EXISTS `vista_detalle_apartados`;
/*!50001 DROP VIEW IF EXISTS `vista_detalle_apartados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_detalle_apartados` AS SELECT 
 1 AS `USUARIO_ID`,
 1 AS `NOMBRE_USUARIO`,
 1 AS `NUMERO_TELEFONICO`,
 1 AS `NOMBRE_PRODUCTO`,
 1 AS `PRECIO_PRODUCTO`,
 1 AS `FECHA_APARTADO`,
 1 AS `FECHA_MAXIMA_ENTREGA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_detalle_compras`
--

DROP TABLE IF EXISTS `vista_detalle_compras`;
/*!50001 DROP VIEW IF EXISTS `vista_detalle_compras`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_detalle_compras` AS SELECT 
 1 AS `NOMBRE`,
 1 AS `PRIMER_APELLIDO`,
 1 AS `SEGUNDO_APELLIDO`,
 1 AS `GENERO`,
 1 AS `UBICACION`,
 1 AS `PRODUCTOS_COMPRADOS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_detalle_pedidos`
--

DROP TABLE IF EXISTS `vista_detalle_pedidos`;
/*!50001 DROP VIEW IF EXISTS `vista_detalle_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_detalle_pedidos` AS SELECT 
 1 AS `USUARIO_ID`,
 1 AS `NOMBRE_USUARIO`,
 1 AS `EMAIL`,
 1 AS `NOMBRE_PRODUCTO`,
 1 AS `OBSERVACIONES`,
 1 AS `ESTATUS_PEDIDO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_resenas`
--

DROP TABLE IF EXISTS `vista_resenas`;
/*!50001 DROP VIEW IF EXISTS `vista_resenas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_resenas` AS SELECT 
 1 AS `PERSONA_ID`,
 1 AS `NOMBRE_USUARIO`,
 1 AS `EMAIL`,
 1 AS `NOMBRE_PRODUCTO`,
 1 AS `COMENTARIO`,
 1 AS `CALIFICACION`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_resumen_productos`
--

DROP TABLE IF EXISTS `vista_resumen_productos`;
/*!50001 DROP VIEW IF EXISTS `vista_resumen_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_resumen_productos` AS SELECT 
 1 AS `CATEGORIA`,
 1 AS `CATALOGO`,
 1 AS `NOMBRE_PRODUCTO`,
 1 AS `CANTIDAD_INVENTARIO`,
 1 AS `PROMEDIO_CALIFICACION`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'bd_gran_bazar'
--

--
-- Dumping routines for database 'bd_gran_bazar'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_bandera_porcentaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_bandera_porcentaje`(v_porcentaje INT) RETURNS int
    DETERMINISTIC
BEGIN
   /* Declaración de una variable con un valor aleatorio de entre 0 y 100*/
   DECLARE v_valor INT DEFAULT (fn_numero_aleatorio_rangos(0,100));
   /* Declaración de una variable booleana con valor inicial de falso */
   DECLARE v_bandera BOOLEAN DEFAULT false;
   
   IF v_valor <= v_porcentaje THEN 
      SET v_bandera = true;
   END IF;
   RETURN v_bandera;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_calcular_edad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_calcular_edad`(fecha_nacimiento DATE) RETURNS int
    DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_apellido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_apellido`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_apellido_generado VARCHAR(100) DEFAULT NULL;
 
	SET v_apellido_generado = ELT(fn_numero_aleatorio_rangos(1,100),
           "Hernández", "García", "Martínez", "López", "González", "Pérez", "Rodríguez", "Sánchez", "Ramírez", "Cruz", 
           "Flores", "Gómez", "Morales", "Torres", "Vázquez", "Castillo", "Aguilar", "Ortiz", "Reyes", "Gutiérrez", 
           "Ruíz", "Alvarez", "Mendoza", "Guerrero", "Ramos", "Medina", "Romero", "Espinoza", "Díaz", "Muñoz", 
           "Paredes", "Castro", "Guzmán", "Silva", "Rojas", "Delgado", "Estrada", "Contreras", "Jiménez", "Vargas", 
           "Santos", "Cortés", "Rivas", "Mata", "Moreno", "Salazar", "Herrera", "León", "Marín", "Núñez", 
           "Campos", "Navarro", "Cabrera", "Rosas", "Ponce", "Alvarado", "Figueroa", "Guillén", "Méndez", "Cárdenas", 
           "Ochoa", "Osorio", "Soto", "Trejo", "Solís", "Zamora", "Carrillo", "Lara", "Franco", "Escobar", 
           "Zúñiga", "Granados", "Meza", "Valdez", "Ayala", "Vega", "Cordero", "Peña", "Tovar", "Arias", 
           "Maldonado", "Mares", "Rangel", "Villalobos", "Domínguez", "Cano", "Bravo", "Pacheco", "Corona", "Escobedo", 
           "Aguirre", "Quezada", "Serrano", "Hidalgo", "Chávez", "Valencia", "Luna", "Padilla", "Olivares", "Palacios", 
           "Zarate", "Godínez", "Robles", "Paz", "Peralta", "Aguayo", "Villanueva", "Cervantes", "Lozano", "Aranda");

	RETURN v_apellido_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_email`(vnombre VARCHAR(60), vapellido_paterno VARCHAR(60)) RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

 DECLARE vusuario_correo VARCHAR(60) DEFAULT NULL;
 DECLARE vdominio VARCHAR(60) DEFAULT NULL;
 DECLARE vcorreo_existente BOOLEAN DEFAULT FALSE;
 DECLARE vnumeral INT DEFAULT NULL;
 DECLARE vcorreo_generado VARCHAR(60) DEFAULT NULL;
 DECLARE vnumeral_correo INT DEFAULT NULL;

	SET vusuario_correo = concat(substring(vnombre,1,1),".",vapellido_paterno);
    SET vdominio=ELT(fn_numero_aleatorio_rangos(1, 13),
			"hotmail.com", "live.com", "gmail.com", "outlook.com", "yahoo.com",
            "excite.com", "gmx.com", "zoho.com", "apple.com","mail.com", "fastmail.com", 
            "aol.com", "hushmail.com");
    SET vcorreo_generado= LOWER(CONCAT(vusuario_correo,'@',vdominio));
    IF vcorreo_generado IN (SELECT email FROM tbb_usuarios  where email like CONCAT(vusuario_correo,'%@', vdominio)) then 
    SET vnumeral_correo= (SELECT count(*) FROM tbb_usuarios WHERE email like  CONCAT(vusuario_correo,'%@', vdominio))+1;
	SET vcorreo_generado= LOWER(CONCAT(vusuario_correo,vnumeral_correo,'@',vdominio));
 END IF;

RETURN vcorreo_generado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_fechaNaci` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_fechaNaci`(fecha_inicio DATE, fecha_fin DATE) RETURNS date
    DETERMINISTIC
BEGIN
    RETURN fecha_inicio + INTERVAL FLOOR(1 + RAND() * TIMESTAMPDIFF(YEAR, fecha_inicio, fecha_fin)) YEAR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre`(v_genero CHAR) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_nombre_generado VARCHAR(50) DEFAULT NULL;
    DECLARE v_nombre2_generado VARCHAR(50) DEFAULT NULL;     
    DECLARE v_bandera_nombrecompuesto BOOLEAN DEFAULT (fn_bandera_porcentaje(35));
    
    SET v_nombre_generado = fn_genera_nombre_simple(v_genero);
    
    IF v_bandera_nombrecompuesto THEN 
        WHILE v_nombre2_generado IS NULL OR v_nombre2_generado = v_nombre_generado DO
             SET v_nombre2_generado = fn_genera_nombre_simple(v_genero);
        END WHILE;
        SET v_nombre_generado = CONCAT(v_nombre_generado," ", v_nombre2_generado);
    END IF;
    
    RETURN v_nombre_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_nombre_simple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre_simple`(v_genero CHAR) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_nombre_generado VARCHAR(100) DEFAULT NULL;
 

		IF v_genero = "M" THEN 
			SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,45),
               "José", "Juan", "Francisco", "Jesús", "Alejandro", "Miguel", "Carlos", "Roberto", "Fernando", "Jorge",
               "Pedro", "Ricardo", "Daniel", "Luis", "David", "Óscar", "Rafael", "Javier", "Antonio", "Manuel",
               "César", "Eduardo", "Gerardo", "Ramiro", "Raúl", "Sergio", "Mario", "Francisco Javier", "Martín", "Hugo",
               "Emilio", "Gustavo", "Marco Antonio", "Juan Carlos", "Víctor", "Alberto", "Rubén", "Ignacio", "Joaquín", "Erik",
               "Andrés", "Adrián", "Julio", "Gabriel", "Salvador");
		ELSEIF v_genero = "F" THEN 
            SET v_nombre_generado = ELT(fn_numero_aleatorio_rangos(1,125),
				"María", "Juana", "Guadalupe", "Francisca", "Luisa", "Josefina", "Carmen", "Teresa", "Rosa", "Isabel", 
				"Antonia", "Ángeles", "Patricia", "Luz", "Laura", "Elena", "Ana", "Soledad", "Gloria", "Beatriz", 
				"Leticia", "Gabriela", "Graciela", "Elizabeth", "Cristina", "Margarita", "Susana", "Norma", "Silvia", "Verónica",
				"Alicia", "Alejandra", "Isabel", "Yolanda", "Lourdes", "Magdalena", "Rosario", "Consuelo", "Alma", "Concepción", 
				"Esther", "Dolores", "Victoria", "Irene", "Olivia", "Amalia", "Adriana", "Clara", "Rebeca", "Angélica", 
				"Paula", "Estela", "Cristina", "Martha", "Berta", "Socorro", "Aurora", "Refugio", "Eva", "Paz", 
				"Andrea", "Alicia", "Elena", "Amparo", "Irma", "Emma", "Dolores", "Eugenia", "Carmen", "Sofía", 
				"Natalia", "Valeria", "Fernanda", "Daniela", "Ximena", "Isabela", "Camila", "Mariana", "Victoria", "Vanessa", 
				"Fabiola", "Adela", "Esmeralda", "Julia", "Lucia", "Valentina", "Melissa", "Paola", "Giselle", "Sara", 
				"Carolina", "Miriam", "Marcela", "Regina", "Eliana", "Liliana", "Brenda", "Cecilia", "Claudia", "Ivonne", 
				"Lorena", "Magdalena", "Mercedes", "Noemí", "Raquel", "Sonia", "Ariadna", "Cassandra", "Violeta", "Abril", 
				"Aitana", "Alba", "Bianca", "Catalina", "Diana", "Elsa", "Frida", "Georgina", "Hilda", "Inés", 
				"Jazmín", "Karla", "Lidia", "Mónica", "Nora");
		END IF; 

	RETURN v_nombre_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_nombre_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre_usuario`(vid INT) RETURNS varchar(255) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
    DECLARE vnombre VARCHAR(50) DEFAULT '-';
    DECLARE vapellido VARCHAR(50) DEFAULT '-';
    DECLARE vnumeral INT DEFAULT 0;

    SET vnombre = (SELECT NOMBRE FROM tbb_personas WHERE ID=vid);
    SET vapellido = (SELECT PRIMER_APELLIDO FROM tbb_personas WHERE ID=vid);

    SET vnumeral = (SELECT COUNT(*) FROM tbb_usuarios WHERE 
                    Nombre_Usuario LIKE CONCAT(vnombre,' ',vapellido,'%'));

    IF vnumeral > 0 THEN 
        RETURN CONCAT(vnombre,' ',vapellido,' ',vnumeral);
    ELSE
        RETURN CONCAT(vnombre,' ',vapellido);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_numerosAlea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_numerosAlea`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_telefono_generado VARCHAR(50) DEFAULT NULL;

	SET v_telefono_generado = CONCAT(
           ELT(fn_numero_aleatorio_rangos(1,5), "764", "776", "774", "222", "55"),
           LPAD(FLOOR(RAND() * 10000000), 7, '0')
    );

	RETURN v_telefono_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_numero_aleatorio_rangos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio_rangos`(v_limite_inferior int,
 v_limite_superior INT) RETURNS int
    DETERMINISTIC
BEGIN
     DECLARE v_numero_generado INT DEFAULT FLOOR(Rand()* (v_limite_superior-v_limite_inferior+1)+v_limite_inferior);
     SET @numero_generado = v_numero_generado;
RETURN v_numero_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_password_aleatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_password_aleatorio`(min_caracteres INT, max_caracteres INT) RETURNS char(32) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE chars VARCHAR(255) DEFAULT 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+=-';
    DECLARE password_chain CHAR(32) DEFAULT '';
    DECLARE i INT DEFAULT 0;
    DECLARE char_count INT DEFAULT 0;
    DECLARE password_length INT DEFAULT 0;

    SET password_length = fn_numero_aleatorio_rangos(min_caracteres,max_caracteres);

    WHILE i < password_length DO
        
        SET password_chain = CONCAT(password_chain, SUBSTRING(chars, fn_numero_aleatorio_rangos(0,length(chars)), 1));
        SET i = i + 1;
    END WHILE;

    RETURN password_chain;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_estatus_bd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_estatus_bd`()
BEGIN
    (SELECT "tbi_bitacora" as Tabla, COUNT(*) as Total_Registros FROM tbi_bitacora)
    UNION
    (SELECT "tbb_categorias" as Tabla, COUNT(*) as Total_Registros FROM tbb_categorias)
    UNION
    (SELECT "tbb_catalogos" as Tabla, COUNT(*) as Total_Registros FROM tbb_catalogos)
    UNION
    (SELECT "tbb_inventarios" as Tabla, COUNT(*) as Total_Registros FROM tbb_inventarios)
    UNION
    (SELECT "tbb_pedidos" as Tabla, COUNT(*) as Total_Registros FROM tbb_pedidos)
    UNION
    (SELECT "tbb_personas" as Tabla, COUNT(*) as Total_Registros FROM tbb_personas)
    UNION
    (SELECT "tbb_productos" as Tabla, COUNT(*) as Total_Registros FROM tbb_productos)
    UNION
    (SELECT "tbb_reseñas" as Tabla, COUNT(*) as Total_Registros FROM tbb_reseñas)
    UNION
    (SELECT "tbb_sistema_de_apartado" as Tabla, COUNT(*) as Total_Registros FROM tbb_sistema_de_apartado)
    UNION
    (SELECT "tbb_ubicaciones" as Tabla, COUNT(*) as Total_Registros FROM tbb_ubicaciones)
    UNION
    (SELECT "tbb_usuarios" as Tabla, COUNT(*) as Total_Registros FROM tbb_usuarios);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inserta_ubicaciones_aleatorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_inserta_ubicaciones_aleatorias`()
BEGIN
    DECLARE v_estado VARCHAR(50) DEFAULT 'Puebla';
    DECLARE v_estatus INT DEFAULT 1;
    DECLARE v_fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
    DECLARE v_fecha_ultima_actualizacion TIMESTAMP DEFAULT NULL;

    DECLARE indice INT;
    SET indice = fn_numero_aleatorio_rangos(1,60);

    CASE indice
        WHEN 1 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Los Pinos 156', 'Huachinango', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 2 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Revolución 678', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 3 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Privada Los Olivos 34', 'Huachinango', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 4 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calzada Independencia 897', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 5 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Hidalgo 349', 'Juan Galindo', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
	        WHEN 6 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Madero 98', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 7 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Iturbide 57', 'Zihuateutla', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 8 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Reforma 345', 'Huachinango', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 9 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Hidalgo 321', 'Juan Galindo', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 10 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Guerrero 109', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
		WHEN 11 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Morelos 67', 'Huachinango', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 12 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Zaragoza 234', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 13 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Ocampo 432', 'Zihuateutla', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 14 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Niños Héroes 78', 'Huachinango', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 15 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Galeana 89', 'Juan Galindo', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
		        WHEN 16 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Juarez 1023', 'Zihuateutla', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 17 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Bravo 542', 'Huachinango', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 18 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Lerdo 238', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 19 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Hidalgo 430', 'Juan Galindo', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 20 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Matamoros 67', 'Huachinango', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 21 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Allende 295', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 22 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Reforma 503', 'Zihuateutla', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 23 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Guerrero 897', 'Huachinango', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 24 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Morelos 309', 'Juan Galindo', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 25 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Zapata 12', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 26 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Aldama 83', 'Huachinango', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 27 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Madero 543', 'Zihuateutla', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 28 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Juarez 234', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 29 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Hidalgo 98', 'Juan Galindo', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 30 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Lerdo 905', 'Huachinango', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
		        WHEN 31 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Juarez 1200', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 32 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Bravo 672', 'Zihuateutla', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 33 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Lerdo 375', 'Huachinango', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 34 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Hidalgo 567', 'Juan Galindo', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 35 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Matamoros 79', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 36 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Allende 325', 'Zihuateutla', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 37 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Reforma 553', 'Huachinango', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 38 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Guerrero 945', 'Juan Galindo', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 39 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Morelos 359', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 40 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Zapata 18', 'Zihuateutla', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 41 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Aldama 99', 'Huachinango', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 42 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Madero 609', 'Juan Galindo', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 43 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Juarez 275', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 44 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Hidalgo 123', 'Zihuateutla', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 45 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Lerdo 950', 'Huachinango', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 46 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Juarez 1300', 'Juan Galindo', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 47 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Bravo 750', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 48 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Lerdo 400', 'Zihuateutla', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 49 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Avenida Hidalgo 600', 'Huachinango', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 50 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Matamoros 100', 'Juan Galindo', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
		WHEN 51 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Princpal Venustiano Carranza', 'Zihuateutla', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
		WHEN 52 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Reforma 11', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
        WHEN 53 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('El tabacal 33', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
		WHEN 54 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Calle Hidalgo 2', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
		WHEN 55 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Monte grande ', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
		WHEN 56 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Los Pinos 22', 'Zihuateutla', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
		WHEN 57 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Av Sayayin Centro', 'Zihuateutla', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
		WHEN 58 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Colonia centro', 'Xicotepec de Juárez', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
		WHEN 59 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Colonia La Fuerza', 'Juan Galindo', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
		WHEN 60 THEN 
            INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES ('Call los perales 22', 'Juan Galindo', v_estado, v_estatus, v_fecha_registro, v_fecha_ultima_actualizacion);
   END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inserta_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_inserta_usuario`()
BEGIN
   DECLARE v_genero CHAR(3) DEFAULT ELT(fn_numero_aleatorio_rangos(1,2), "M", "F");
   DECLARE v_nombre_generado VARCHAR(50) DEFAULT fn_genera_nombre(v_genero);
   DECLARE v_primer_apellido VARCHAR(50) DEFAULT fn_genera_apellido();
   DECLARE v_segundo_apellido VARCHAR(50) DEFAULT NULL;
   DECLARE v_fecha_nacimiento DATE DEFAULT NULL;
   DECLARE v_fecha_valida BOOLEAN DEFAULT FALSE;
   DECLARE v_edad_persona INT DEFAULT FALSE;
   DECLARE v_fecha_edadminima DATETIME DEFAULT NULL;
   DECLARE v_id_persona INT DEFAULT NULL;
   DECLARE v_bandera_nobinario BOOLEAN DEFAULT fn_bandera_porcentaje(5);
   DECLARE v_id_ubicacion INT DEFAULT 0;
   DECLARE v_nombre_usuario VARCHAR(80) DEFAULT NULL;
   DECLARE v_email_usuario VARCHAR(256) DEFAULT NULL;
   DECLARE v_numero_telefonico varchar (11);
	
    SET v_numero_telefonico = fn_genera_numerosAlea();
   SET v_segundo_apellido = fn_genera_apellido();
   
   WHILE NOT v_fecha_valida  OR v_edad_persona <= 16 DO 
	SET v_fecha_nacimiento = fn_genera_fechaNaci("1970-01-01",NOW());
    SET v_edad_persona = fn_calcular_edad(v_fecha_nacimiento);
    
    IF v_edad_persona >= 16 THEN
    SET v_fecha_valida = TRUE;
    END IF;
    
   END WHILE;
   
   SET v_fecha_edadminima= DATE_ADD(v_fecha_nacimiento, INTERVAL 13 YEAR);
   
   
   IF v_bandera_nobinario = TRUE THEN 
   SET v_genero = "N/B";
   END IF;
   
   
  /* Insertar una nueva ubicación y obtener su ID */
   CALL sp_inserta_ubicaciones_aleatorias();
   SET v_id_ubicacion = LAST_INSERT_ID();

   /* Paso 1: Insertar los Datos de la Persona */
   INSERT INTO tbb_personas VALUES (DEFAULT, v_nombre_generado, v_primer_apellido, 
   v_segundo_apellido, v_fecha_nacimiento, v_genero, v_id_ubicacion, DEFAULT, default, NULL);
   SELECT "La persona correspondiente al Usuario ha sido creada." as Mensaje; 
   SET v_id_persona = last_insert_id();
    

   /* Paso 2: Insertar los Datos del Usuario */
   SET v_nombre_usuario=fn_genera_nombre_usuario(v_id_persona);
   SET v_email_usuario= fn_genera_email(v_nombre_generado,v_primer_apellido);
   INSERT INTO tbb_usuarios VALUES (v_id_persona,v_nombre_usuario ,v_email_usuario, fn_password_aleatorio(3,15),
   v_numero_telefonico, DEFAULT,default);
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inserta_varias_Ubicaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_inserta_varias_Ubicaciones`(v_cuantos INT)
BEGIN
   DECLARE i INT DEFAULT 1;
   WHILE i <= v_cuantos DO 
     /*SELECT CONCAT("Insertando al Contenido: ",i) as Mensaje;*/
   		CALL sp_inserta_ubicaciones_aleatorias();
	/* ELSEIF 
		v_*/
     SET i=i+1;
   END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inserta_Varios_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_inserta_Varios_usuarios`(v_cuantos INT)
BEGIN
   DECLARE i INT DEFAULT 1;
   WHILE i <= v_cuantos DO 
     /*SELECT CONCAT("Insertando al Usuario: ",i) as Mensaje;*/
			CALL sp_inserta_usuario();
	
    SET i=i+1;
	END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertCatalogs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertCatalogs`()
BEGIN
  INSERT INTO tbb_catalogos(CATEGORIA_ID, NOMBRE, ESTATUS, FECHA_ULTIMA_ACTUALIZACION) 
  VALUES 
  (1, 'Moda Femenina', default, null),
  (2, 'Moda Juvenil Femenina', default, null),
  (3, 'Moda Juvenil Masculina', default, null),
  (4, 'Moda Bebé', default, null),
  (5, 'Complementos', default, null),
  (6, 'Lencería', default, null),
  (7, 'Outfits Completos', default, null),
  (8, 'Calcetería', default, null),
  (9, 'Vestidos de Moda', default, null),
  (10, 'Moda de Playa', default, null);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertCategories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertCategories`()
BEGIN
  INSERT INTO tbb_categorias(NOMBRE, DESCRIPCION, ESTATUS, FECHA_ULTIMA_ACTUALIZACION) 
  VALUES 
  ('Ropa para mujer', 'Prendas de vestir diseñadas específicamente para mujeres, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones.', default, null),
  ('Ropa para niña y juvenil', 'Prendas de vestir diseñadas para niñas y jóvenes, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones.', default, null),
  ('Ropa para niño y juvenil', 'Prendas de vestir diseñadas para niños y jóvenes, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones.', default, null),
  ('Ropa para bebé', 'Prendas de vestir diseñadas específicamente para bebés, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones.', default, null),
  ('Accesorios', 'Artículos complementarios a la ropa, como bufandas, cinturones, abanicos, sombreros y relojes, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones.', default, null),
  ('Ropa íntima', 'Prendas de vestir que se usan debajo de la ropa exterior, como ropa interior, camisones, pijamas, etc.', default, null),
  ('Conjuntos', 'Combinaciones de prendas que se venden juntas como un conjunto, que pueden incluir una amplia variedad de estilos y diseños para adaptarse a diferentes gustos y ocasiones.', default, null),
  ('Medias', 'Prendas de vestir que cubren los pies y las piernas, como calcetines, medias, pantimedias, etc.', default, null),
  ('Vestidos', 'Prendas de vestir femeninas que cubren el cuerpo desde los hombros hasta las piernas.', default, null),
  ('Trajes de baño', 'Prendas de vestir diseñadas específicamente para usar en el agua o en la playa.', default, null);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertInventory`()
BEGIN
  DECLARE i INT DEFAULT 0;
  DECLARE max_id INT;
  SELECT MAX(ID) INTO max_id FROM tbb_productos;
  WHILE i < max_id DO
    INSERT INTO tbb_inventarios(PRODUCTO_ID, CANTIDAD_DISPONIBLE, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION) 
    VALUES 
    (i + 1	,10	, b'1'	,default	,NULL	);
    SET i = i + 1;
  END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertProducts`()
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE j INT DEFAULT 1;
  DECLARE basePrice DECIMAL(10,2) DEFAULT 99.00;
  
  WHILE i <= 10 DO
    SET j = 1;
    WHILE j <= 10 DO
      INSERT INTO tbb_productos(CATEGORIA_ID, NOMBRE, PRECIO, IMAGEN, DESCRIPCION, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION) 
      VALUES 
      (
        i,
        CASE i
          WHEN 1 THEN 
            CASE j
              WHEN 1 THEN 'Blusa'
              WHEN 2 THEN 'Falda'
              WHEN 3 THEN 'Pantalón'
              WHEN 4 THEN 'Vestido'
              WHEN 5 THEN 'Chaqueta'
              WHEN 6 THEN 'Suéter'
              WHEN 7 THEN 'Camiseta'
              WHEN 8 THEN 'Shorts'
              WHEN 9 THEN 'Abrigo'
              ELSE 'Jeans'
            END
          WHEN 2 THEN 
            CASE j
              WHEN 1 THEN 'Vestido'
              WHEN 2 THEN 'Falda'
              WHEN 3 THEN 'Blusa'
              WHEN 4 THEN 'Pantalón'
              WHEN 5 THEN 'Suéter'
              WHEN 6 THEN 'Chaqueta'
              WHEN 7 THEN 'Camiseta'
              WHEN 8 THEN 'Shorts'
              WHEN 9 THEN 'Abrigo'
              ELSE 'Jeans'
            END
          WHEN 3 THEN 
            CASE j
              WHEN 1 THEN 'Pantalón'
              WHEN 2 THEN 'Camisa'
              WHEN 3 THEN 'Camiseta'
              WHEN 4 THEN 'Suéter'
              WHEN 5 THEN 'Chaqueta'
              WHEN 6 THEN 'Shorts'
              WHEN 7 THEN 'Abrigo'
              WHEN 8 THEN 'Jeans'
              WHEN 9 THEN 'Sudadera'
              ELSE 'Chándal'
            END
          WHEN 4 THEN 
            CASE j
              WHEN 1 THEN 'Body'
              WHEN 2 THEN 'Pelele'
              WHEN 3 THEN 'Vestido'
              WHEN 4 THEN 'Pantalón Corto'
              WHEN 5 THEN 'Pantalón Largo'
              WHEN 6 THEN 'Camiseta'
              WHEN 7 THEN 'Suéter'
              WHEN 8 THEN 'Chaqueta'
              WHEN 9 THEN 'Gorro'
              ELSE 'Calcetines'
            END
          WHEN 5 THEN 
            CASE j
              WHEN 1 THEN 'Bufanda'
              WHEN 2 THEN 'Cinturón'
              WHEN 3 THEN 'Sombrero'
              WHEN 4 THEN 'Reloj de Pulsera'
              WHEN 5 THEN 'Collar'
              WHEN 6 THEN 'Pulsera'
              WHEN 7 THEN 'Pendientes'
              WHEN 8 THEN 'Anillo'
              ELSE 'Gafas de Sol'
            END
          WHEN 6 THEN 
            CASE j
              WHEN 1 THEN 'Sujetador'
              WHEN 2 THEN 'Bragas/Calzoncillos Bóxer'
              WHEN 3 THEN 'Bikini/Slip/Tanga/Culotte'
              WHEN 4 THEN 'Camisón/Pijama/Ropa de Dormir'
              WHEN 5 THEN 'Liguero/Medias con Liga'
              WHEN 6 THEN 'Body/Corsé'
              ELSE 'Ropa íntima genérica'
            END
          WHEN 7 THEN 
            CASE j
              WHEN 1 THEN 'Conjunto de Falda y Blusa'
              WHEN 2 THEN 'Conjunto de Pantalón y Blusa'
              WHEN 3 THEN 'Conjunto de Short y Blusa'
              WHEN 4 THEN 'Conjunto de Vestido y Chaqueta'
              WHEN 5 THEN 'Conjunto Deportivo'
              ELSE 'Conjunto genérico'
            END
          WHEN 8 THEN 
            CASE j
              WHEN 1 THEN 'Calcetines Tobilleros'
              WHEN 2 THEN 'Calcetines Deportivos'
              WHEN 3 THEN 'Calcetines Largos'
              WHEN 4 THEN 'Medias Pantimedias'
              WHEN 5 THEN 'Medias Transparentes'
              WHEN 6 THEN 'Medias Opacas'
              WHEN 7 THEN 'Medias de Red'
              WHEN 8 THEN 'Leggings Lisos'
              WHEN 9 THEN 'Leggings Estampados'
              ELSE 'Leggings Deportivos'
            END
          WHEN 9 THEN 
            CASE j
              WHEN 1 THEN 'Vestido Largo'
              WHEN 2 THEN 'Vestido Corto'
              WHEN 3 THEN 'Vestido Midi'
              WHEN 4 THEN 'Vestido Ajustado'
              WHEN 5 THEN 'Vestido Suelto'
              WHEN 6 THEN 'Vestido con Vuelo'
              WHEN 7 THEN 'Vestido Camisero'
              WHEN 8 THEN 'Vestido de Fiesta'
              WHEN 9 THEN 'Vestido Casual'
              ELSE 'Vestido Estampado'
            END
          ELSE 
            CASE j
              WHEN 1 THEN 'Bikini'
              WHEN 2 THEN 'Traje de Baño de una Pieza'
              WHEN 3 THEN 'Traje de Baño Deportivo'
              WHEN 4 THEN 'Traje de Baño con Falda'
              WHEN 5 THEN 'Traje de Baño con Short'
              WHEN 6 THEN 'Traje de Baño con Volantes'
              WHEN 7 THEN 'Traje de Baño con Escote Halter'
              WHEN 8 THEN 'Traje de Baño con Escote Bandeau'
              ELSE 'Traje de Baño con Escote en V'
            END
        END,
        basePrice * j, -- Aquí se está asignando un precio basado en el valor de 'j', puedes modificarlo según sea necesario
        CONCAT('', REPLACE(NOMBRE, ' ', '_'), '/bdhs'), -- Aquí se está generando una ruta de imagen ficticia, reemplaza esto según sea necesario
        CONCAT('Este es un/a ', NOMBRE, ' de alta calidad.'), -- Aquí se está generando una descripción de producto básica, reemplaza esto según sea necesario
        default,
        default,
        NULL
      );

      SET j = j + 1;
    END WHILE;
    
    SET i = i + 1;
  END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_limpia_bd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_limpia_bd`(v_password VARCHAR(10))
BEGIN
    IF v_password = "1234567" THEN
    
        -- Reset foreign keys
        UPDATE tbb_personas SET UBICACION_ID = NULL;
        
        -- Delete data and reset auto_increment
        DELETE FROM tbb_reseñas;
        ALTER TABLE tbb_reseñas auto_increment = 1;

        DELETE FROM tbb_pedidos;
        ALTER TABLE tbb_pedidos auto_increment = 1;

        DELETE FROM tbb_inventarios;
        ALTER TABLE tbb_inventarios auto_increment = 1;

        DELETE FROM tbb_sistema_de_apartado;
        ALTER TABLE tbb_sistema_de_apartado auto_increment = 1;

        DELETE FROM tbb_usuarios;
        ALTER TABLE tbb_usuarios auto_increment = 1;

        DELETE FROM tbb_personas;
        ALTER TABLE tbb_personas auto_increment = 1;

        DELETE FROM tbb_ubicaciones;
        ALTER TABLE tbb_ubicaciones auto_increment = 1;

        DELETE FROM tbb_productos;
        ALTER TABLE tbb_productos auto_increment = 1;

		  DELETE FROM tbb_catalogos;
        ALTER TABLE tbb_catalogos auto_increment = 1;
        
        DELETE FROM tbb_categorias;
        ALTER TABLE tbb_categorias auto_increment = 1;

        DELETE FROM tbi_bitacora;
        ALTER TABLE tbi_bitacora auto_increment = 1;

    ELSE 
        SELECT ("La contraseña es incorrecta.") AS ErrorMessage;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_llenarTablaSistemaApartado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_llenarTablaSistemaApartado`(IN cantidadApartados INT)
BEGIN
    DECLARE i INT;
    DECLARE j INT;
    DECLARE contador INT DEFAULT 0;
    DECLARE fechaActual DATE DEFAULT CURDATE();
    DECLARE maxUsuarioID INT;
    DECLARE maxProductoID INT;
    
    SELECT MAX(PERSONA_ID) INTO maxUsuarioID FROM tbb_usuarios;
    SELECT MAX(ID) INTO maxProductoID FROM tbb_productos;
    
    WHILE contador < cantidadApartados DO
        SET i = FLOOR(1 + RAND() * maxUsuarioID);
        SET j = FLOOR(1 + RAND() * maxProductoID);
        IF EXISTS (SELECT * FROM tbb_usuarios WHERE PERSONA_ID = i) AND EXISTS (SELECT * FROM tbb_productos WHERE ID = j) THEN
            INSERT INTO tbb_sistema_de_apartado (USUARIO_ID, PRODUCTO_ID, ESTATUS, FECHA_ENTREGA_MAX, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
            VALUES (i, j, b'1', DATE_ADD(fechaActual, INTERVAL 1 WEEK), default, null);
            SET contador = contador + 1;
        END IF;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_llena_Base` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_llena_Base`()
BEGIN
/*Se insertan personas, usuarios y ubicaciones*/
call sp_inserta_Varios_usuarios(70);

/* Se insertan las categorias de la ropa*/
call sp_InsertCategories();

/* Se insertan los nombres de nuestros catalogos*/
call sp_InsertCatalogs();

/* Se insertan los productos*/
call sp_InsertProducts();
/* Se insertan los inventarios*/
call sp_InsertInventory();

call sp_poblar_resenas();

CALL sp_poblar_pedidos(40);

call sp_llenarTablaSistemaApartado(45);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_poblar_pedidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_pedidos`(IN num_pedidos INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE randNum INT;

    WHILE i <= num_pedidos DO
        SET randNum = fn_numero_aleatorio_rangos(1,5);

        INSERT INTO tbb_pedidos
        (USUARIO_ID, PRODUCTO_ID, OBSERVACIONES, ESTATUS, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION)
        VALUES
        (fn_numero_aleatorio_rangos(1, (SELECT COUNT(*) FROM tbb_usuarios)), 
         fn_numero_aleatorio_rangos(1, (SELECT COUNT(*) FROM tbb_productos)), 
         CASE randNum
            WHEN 1 THEN "Pedido realizado correctamente."
            WHEN 2 THEN "El producto llegó a tiempo y en perfectas condiciones."
            WHEN 3 THEN "Hubo un pequeño problema con el envío, pero se solucionó rápidamente."
            WHEN 4 THEN "Excelente servicio al cliente durante el proceso de pedido."
            WHEN 5 THEN "El pedido se realizó sin problemas y el producto es de alta calidad."
         END,
         fn_numero_aleatorio_rangos(0,1), 
         default, 
         null);
        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_poblar_resenas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_resenas`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE randNum INT;

    WHILE i <= 50 DO
        SET randNum = fn_numero_aleatorio_rangos(1,10);
        
        INSERT INTO tbb_reseñas 
        (USUARIO_ID, PRODUCTO_ID, COMENTARIO, CALIFICACION, FECHA_REGISTRO, FECHA_ULTIMA_ACTUALIZACION) 
        VALUES 
        (fn_numero_aleatorio_rangos(1,50), 
         i, 
         CASE randNum
            WHEN 1 THEN "Estoy absolutamente encantado con este producto. Superó todas mis expectativas en términos de calidad, rendimiento y diseño. Definitivamente lo recomendaría a mis amigos y familia."
            WHEN 2 THEN "Este producto es bastante decente. Cumple su propósito y no tuve problemas importantes, aunque creo que hay algunas áreas en las que se podría mejorar."
            WHEN 3 THEN "No quedé impresionado con este producto. Tuve varios problemas con su rendimiento y las características no eran lo que esperaba. Creo que hay otros productos en el mercado que ofrecen un mejor valor."
            WHEN 4 THEN "Este producto me ha dejado asombrado. No solo por su alta calidad, sino también por su atención al detalle y su diseño impresionante."
            WHEN 5 THEN "La calidad del producto es aceptable, pero no me ha sorprendido. Si buscas algo básico, puede ser una buena opción."
            WHEN 6 THEN "El producto no ha sido lo que esperaba. Los materiales parecen de baja calidad y ha habido varios problemas en su funcionamiento."
            WHEN 7 THEN "Este producto ha sido una excelente adquisición. Me encanta cómo funciona y la calidad es impresionante."
            WHEN 8 THEN "Un producto promedio. Cumple su función pero no me ha sorprendido en ninguno de sus aspectos."
            WHEN 9 THEN "Honestamente, me ha decepcionado este producto. Creo que debería mejorar en varios aspectos para justificar su precio."
            WHEN 10 THEN "El producto me ha dejado muy satisfecho. Es de gran calidad, funciona perfectamente y me encanta su diseño."
         END, 
         CASE
            WHEN randNum IN (1, 4, 7, 10) THEN fn_numero_aleatorio_rangos(4,5)
            WHEN randNum IN (2, 5, 8) THEN fn_numero_aleatorio_rangos(2,3)
            WHEN randNum IN (3, 6, 9) THEN fn_numero_aleatorio_rangos(1,2)
         END, 
         default, 
         null);
        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_detalle_apartados`
--

/*!50001 DROP VIEW IF EXISTS `vista_detalle_apartados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_detalle_apartados` AS select `u`.`PERSONA_ID` AS `USUARIO_ID`,`u`.`NOMBRE_USUARIO` AS `NOMBRE_USUARIO`,`u`.`NUMERO_TELEFONICO` AS `NUMERO_TELEFONICO`,`prod`.`NOMBRE` AS `NOMBRE_PRODUCTO`,`prod`.`PRECIO` AS `PRECIO_PRODUCTO`,`sa`.`FECHA_REGISTRO` AS `FECHA_APARTADO`,`sa`.`FECHA_ENTREGA_MAX` AS `FECHA_MAXIMA_ENTREGA` from (((`tbb_productos` `prod` join `tbb_sistema_de_apartado` `sa` on((`prod`.`ID` = `sa`.`PRODUCTO_ID`))) join `tbb_usuarios` `u` on((`sa`.`USUARIO_ID` = `u`.`PERSONA_ID`))) join `tbb_personas` `p` on((`u`.`PERSONA_ID` = `p`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_detalle_compras`
--

/*!50001 DROP VIEW IF EXISTS `vista_detalle_compras`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_detalle_compras` AS select `pers`.`NOMBRE` AS `NOMBRE`,`pers`.`PRIMER_APELLIDO` AS `PRIMER_APELLIDO`,`pers`.`SEGUNDO_APELLIDO` AS `SEGUNDO_APELLIDO`,`pers`.`GENERO` AS `GENERO`,concat(`ubi`.`DIRECCION`,', ',`ubi`.`CIUDAD`,', ',`ubi`.`ESTADO`) AS `UBICACION`,group_concat(`prod`.`NOMBRE` order by `prod`.`NOMBRE` ASC separator ',') AS `PRODUCTOS_COMPRADOS` from (((`tbb_personas` `pers` join `tbb_pedidos` `ped` on((`pers`.`ID` = `ped`.`USUARIO_ID`))) join `tbb_productos` `prod` on((`ped`.`PRODUCTO_ID` = `prod`.`ID`))) join `tbb_ubicaciones` `ubi` on((`pers`.`UBICACION_ID` = `ubi`.`ID`))) group by `pers`.`ID`,`pers`.`NOMBRE`,`pers`.`PRIMER_APELLIDO`,`pers`.`SEGUNDO_APELLIDO`,`pers`.`GENERO`,`ubi`.`DIRECCION`,`ubi`.`CIUDAD`,`ubi`.`ESTADO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_detalle_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_detalle_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_detalle_pedidos` AS select `u`.`PERSONA_ID` AS `USUARIO_ID`,`u`.`NOMBRE_USUARIO` AS `NOMBRE_USUARIO`,`u`.`EMAIL` AS `EMAIL`,`prod`.`NOMBRE` AS `NOMBRE_PRODUCTO`,`ped`.`OBSERVACIONES` AS `OBSERVACIONES`,`ped`.`ESTATUS` AS `ESTATUS_PEDIDO` from ((`tbb_pedidos` `ped` join `tbb_usuarios` `u` on((`ped`.`USUARIO_ID` = `u`.`PERSONA_ID`))) join `tbb_productos` `prod` on((`ped`.`PRODUCTO_ID` = `prod`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_resenas`
--

/*!50001 DROP VIEW IF EXISTS `vista_resenas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_resenas` AS select `p`.`ID` AS `PERSONA_ID`,`u`.`NOMBRE_USUARIO` AS `NOMBRE_USUARIO`,`u`.`EMAIL` AS `EMAIL`,`prod`.`NOMBRE` AS `NOMBRE_PRODUCTO`,`r`.`COMENTARIO` AS `COMENTARIO`,`r`.`CALIFICACION` AS `CALIFICACION` from (((`tbb_personas` `p` join `tbb_usuarios` `u` on((`p`.`ID` = `u`.`PERSONA_ID`))) join `tbb_reseñas` `r` on((`u`.`PERSONA_ID` = `r`.`USUARIO_ID`))) join `tbb_productos` `prod` on((`r`.`PRODUCTO_ID` = `prod`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_resumen_productos`
--

/*!50001 DROP VIEW IF EXISTS `vista_resumen_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_resumen_productos` AS select `cat`.`NOMBRE` AS `CATEGORIA`,`c`.`NOMBRE` AS `CATALOGO`,`prod`.`NOMBRE` AS `NOMBRE_PRODUCTO`,`i`.`CANTIDAD_DISPONIBLE` AS `CANTIDAD_INVENTARIO`,round(avg(`r`.`CALIFICACION`),0) AS `PROMEDIO_CALIFICACION` from ((((`tbb_categorias` `cat` join `tbb_catalogos` `c` on((`cat`.`ID` = `c`.`CATEGORIA_ID`))) join `tbb_productos` `prod` on((`c`.`CATEGORIA_ID` = `prod`.`CATEGORIA_ID`))) left join `tbb_inventarios` `i` on((`prod`.`ID` = `i`.`PRODUCTO_ID`))) left join `tbb_reseñas` `r` on((`prod`.`ID` = `r`.`PRODUCTO_ID`))) group by `cat`.`NOMBRE`,`c`.`NOMBRE`,`prod`.`NOMBRE`,`i`.`CANTIDAD_DISPONIBLE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-15 12:20:49
