CREATE DATABASE  IF NOT EXISTS `boxsa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `boxsa`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: boxsa
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `articulo_id` int NOT NULL AUTO_INCREMENT,
  `idArt` varchar(50) NOT NULL,
  `ArtDet` varchar(200) NOT NULL,
  `idTipo` int DEFAULT NULL,
  `idClase` int DEFAULT NULL,
  `UM` varchar(10) DEFAULT NULL,
  `Estado` char(1) DEFAULT NULL,
  `tipo_articulo_id` int DEFAULT NULL,
  `Stock` decimal(12,2) DEFAULT '0.00',
  `StockMin` decimal(12,2) DEFAULT NULL,
  `FecAlta` date DEFAULT NULL,
  `Valor` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`articulo_id`),
  UNIQUE KEY `uk_articulos_idArt` (`idArt`),
  KEY `tipo_articulo_id` (`tipo_articulo_id`),
  KEY `articulos_fk_tipo` (`idTipo`),
  KEY `articulos_fk_clase` (`idClase`),
  KEY `articulos_fk_unidad` (`UM`),
  CONSTRAINT `articulos_fk_clase` FOREIGN KEY (`idClase`) REFERENCES `clase_articulo` (`idClase`),
  CONSTRAINT `articulos_fk_tipo` FOREIGN KEY (`idTipo`) REFERENCES `tipo_producto` (`idTipo`),
  CONSTRAINT `articulos_fk_unidad` FOREIGN KEY (`UM`) REFERENCES `unidades` (`idUnidad`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'BC10038-25','Base Cerejeira 100x38x2,5',4,2,'CU','A',NULL,100.00,50.00,'2016-03-10',100.00),(2,'BC15038-25','Base Cerejeira 150x38x2,5',4,2,'CU','A',NULL,50.00,25.00,'2016-03-10',150.00),(3,'BC20038-25','Base Cerejeira 200x38x2,5',4,2,'CU','A',NULL,35.00,20.00,'2016-03-10',200.00),(4,'BP10038-25','Base Paraíso 100x38x2,5',4,2,'CU','A',NULL,100.00,50.00,'2016-03-10',200.00),(5,'BP15038-25','Base Paraíso 150x38x2,5',4,2,'CU','A',NULL,50.00,25.00,'2016-03-10',250.00),(6,'BP20038-25','Base Paraíso 200x38x2,5',4,2,'CU','A',NULL,25.00,10.00,'2016-03-10',300.00),(7,'C1025','Clavo 1x2,5',5,7,'CU','A',NULL,500.00,250.00,'2016-03-10',30.00),(8,'C1030','Clavo 1x3,0',5,7,'CU','A',NULL,450.00,200.00,'2016-03-10',35.00),(9,'C2025','Clavo 2x2,5',5,7,'CU','A',NULL,400.00,200.00,'2016-03-10',40.00),(10,'C2030','Clavo 2x3,0',5,7,'CU','A',NULL,350.00,150.00,'2016-03-10',45.00),(11,'TP15028-25','Tapa Paraíso 150x28x2,5',4,1,'CU','A',NULL,15.00,10.00,'2016-03-10',150.00),(12,'TP20028-25','Tapa Paraíso 200x28x2,5',4,1,'CU','A',NULL,10.00,5.00,'2016-03-10',200.00),(13,'TP10028-25','Tapa Paraíso 100x28x2,5',4,1,'CU','A',NULL,20.00,10.00,'2016-03-10',100.00),(14,'MDF618-15','MDF 6x18 1.5mm',4,2,'M2','A',NULL,0.00,0.00,'2016-03-10',100.00),(15,'BICAZ1','Birome BIC AZUL GRUESO',5,5,'CU','A',NULL,35.00,5.00,'2007-01-01',25.00),(16,'BICNG1','Birome BIC NEGRO GRUESO',5,5,'CU','A',NULL,21.00,5.00,'2007-01-01',25.00),(17,'BICRO1','Birome BIC ROJO GRUESO',5,5,'CU','A',NULL,18.00,5.00,'2007-01-01',25.00),(18,'BOGLOGO','Logo Bogner',4,20,'CU','A',NULL,30.00,15.00,'2018-08-02',0.00),(19,'BP11038-25','Base Pino 110x38x2,5',4,2,'CU','A',NULL,30.00,5.00,'2010-02-08',120.00),(20,'BP12038-25','Base Pino 120x38x2,5',4,2,'CU','A',NULL,20.00,5.00,'2010-04-20',220.00),(21,'CHAPF-P1000','Chapa Apoyo Sup. Fender P1000',4,21,'CU','A',NULL,40.00,5.00,'2010-04-10',380.00),(22,'CHAPFDER-HR','Chapa Apoyo Sup. Fender HR',4,21,'CU','A',NULL,100.00,20.00,'2019-04-10',280.00),(23,'CHAPMBHN','Chapa Apoyo Sup. MB Head - Negro',4,21,'CU','A',NULL,33.00,5.00,'2010-04-10',400.00),(24,'COLA_MADERA','Cola Madera ',4,3,'CM3','A',NULL,16000.00,4000.00,'2013-02-08',90.00),(25,'CUAD-ESPIRAL-CUA-80','CUADERNO Espiralado 80h Cuadriculado',5,5,'CU','A',NULL,10.00,10.00,'2018-08-08',80.00),(26,'CUAD-ESPIRAL-RAY-80','CUADERNO Espiralado 80h Rayado',5,5,'CU','A',NULL,12.00,10.00,'2018-08-08',85.00),(27,'CUEFDER-BK','Cuerina Fender Negro',4,16,'M2','A',NULL,180.00,10.00,'2010-11-03',150.00),(28,'CUEMBC','Cuerina MB Caoba',4,16,'M2','A',NULL,38.50,10.00,'2010-03-08',320.00),(29,'CUEMBCREAM','Cuerina MB Cream',4,16,'M2','A',NULL,45.00,10.00,'2010-10-02',350.00),(30,'CUEMBN','Cuerina MB Negro',4,16,'M2','A',NULL,180.00,10.00,'2010-11-03',150.00),(31,'CUEVIB SLO','Cuerina Vibora Soldano Custom 1',4,16,'M2','A',NULL,80.00,20.00,'2020-01-01',600.00),(32,'ESQUIFDERA-BK','Esquinas Fender Acetato - Negro',4,2,'CU','A',NULL,100.00,20.00,'2018-08-04',60.00),(33,'ESQUIMBAHN','Esquinas MB Acetato Head - Negro',4,2,'CU','A',NULL,100.00,20.00,'2018-08-04',600.00),(34,'FC9520-25','Fondo Cerejerira 95x20x2,5',4,2,'CU','A',NULL,100.00,50.00,'2016-03-10',100.00),(35,'FDERLOGO1','Logo Fender 1',4,20,'CU','A',NULL,130.00,40.00,'2018-08-02',0.00),(36,'FDERLOGO2','Logo Fender 2',4,20,'CU','A',NULL,50.00,10.00,'2018-08-02',0.00),(37,'FP10535-25','Fondo Pino 105x30x2,5',4,2,'CU','A',NULL,14.00,5.00,'2018-08-04',100.00),(38,'FP11525-25','Fondo Pino 115x25x2,5',4,2,'CU','A',NULL,13.00,5.00,'2018-08-08',100.00),(39,'FP1557225','Frente Pino 1x12 W 155x72x2,5',4,2,'CU','A',NULL,16.00,5.00,'2010-08-08',200.00),(40,'FP9520-25','Fondo Pino 95x20x2,5',4,2,'CU','A',NULL,13.00,5.00,'2012-08-08',400.00),(41,'FREZ1506N','Frezado 1,5x0,6 - Negro',4,1,'CU','A',NULL,98.00,150.00,'2012-08-08',0.30),(42,'FREZ1506P','Frezado 1,5x0,6 - Plata',4,1,'CU','A',NULL,480.00,150.00,'2012-08-08',0.40),(43,'FREZ206P','Frezado 2x0,6 - Plata',4,1,'CU','A',NULL,500.00,100.00,'2012-08-08',0.35),(44,'FTEC9520-25','Frente Cerejerira 95x20x2,5',4,2,'CU','A',NULL,100.00,50.00,'2016-03-10',100.00),(45,'FTEP1210545-25','Frente Pino 1x12 105x45x2,5',4,1,'CU','A',NULL,11.00,5.00,'2012-08-08',100.00),(46,'FTEP1211550-25','Frente Pino 1x12 115x50x2,5',4,2,'CU','A',NULL,12.00,5.00,'2018-06-08',220.00),(47,'FTEP9520-25','Frente Pino 95x20x2,5',4,2,'CU','A',NULL,19.00,5.00,'2010-07-08',130.00),(48,'HP12A ','TONER 12A HP',5,17,'CU','A',NULL,5.00,5.00,'2018-08-08',3000.00),(49,'HP78A ','TONER 78A HP',5,17,'CU','A',NULL,5.00,1.00,'2021-10-08',3000.00),(50,'LACA-MR-BR','Laca Marina Brillante',4,14,'CM3','A',NULL,1920.00,4000.00,'2019-08-05',205.00),(51,'LACA-MR-SM','Laca Marina Semi-Mate',4,14,'CM3','A',NULL,8000.00,4000.00,'2019-03-01',134.00),(52,'LCD3840-25','Lateral Der Cerejeira Forma 38x40x2,5',4,2,'CU','A',NULL,100.00,50.00,'2016-03-10',100.00),(53,'LCI3840-25','Lateral Izq Cerejerira Forma 38x40x2,5',4,2,'CU','A',NULL,100.00,50.00,'2016-03-10',100.00),(54,'LPD3840-25','Lateral Der Pino Forma 38x40x2,5',4,2,'CU','A',NULL,20.00,5.00,'2010-08-08',370.00),(55,'LPD3855-25','Lateral Der Pino Forma 38x55x2,5',4,2,'CU','A',NULL,19.00,5.00,'2010-09-08',300.00),(56,'LPI3840-25','Lateral Izq Pino Forma 38x40x2,5',4,2,'CU','A',NULL,18.00,5.00,'2012-08-08',120.00),(57,'LPI3855-25','Lateral Izq Pino Forma 38x55x2,5',4,2,'CU','A',NULL,22.00,5.00,'2012-08-08',140.00),(58,'MANITFDER-BK','Manija Transp. Fender - Negro',4,8,'CU','A',NULL,60.00,20.00,'2018-08-08',140.00),(59,'MANITMBCN','Manija Transp. Heavy MB - Negro',4,8,'CU','A',NULL,35.00,15.00,'2012-08-08',450.00),(60,'MANITMBN','Manija Transp. MB - Negro',4,8,'CU','A',NULL,30.00,15.00,'2018-08-08',340.00),(61,'MARLOGO','Logo Marshall',4,20,'CU','A',NULL,200.00,50.00,'2017-08-03',0.00),(62,'MBLOGO1','Logo Boogie',4,20,'CU','A',NULL,20.00,20.00,'2018-02-06',0.00),(63,'MBLOGO2','Logo Boogie Cream',4,20,'CU','A',NULL,150.00,30.00,'2013-02-08',0.00),(64,'PARK205N','Parker 2x0,5 - Negro',4,1,'CU','A',NULL,220.00,100.00,'2013-08-08',400.00),(65,'PARK2505N','Parker 2,5x0,5 - Negro',4,1,'CU','A',NULL,250.00,120.00,'2018-08-06',350.00),(66,'PEGA-CTO','Pegamento de Contacto ',4,3,'CM3','A',NULL,12000.00,2000.00,'2020-08-12',295.00),(67,'PEGA-CTO_TR','Pegamento de Contacto Tranparente',4,3,'CM3','A',NULL,20000.00,2000.00,'2020-10-03',290.00),(68,'PLASTICOLA 200GRS','Plasticola 200 gramos blanca',5,5,'CU','A',NULL,12.00,10.00,'2019-08-08',145.00),(69,'REGAFDERSTD-BKN','Regaton Fender STD - Negro',4,9,'CU','A',NULL,180.00,50.00,'2018-08-06',22.00),(70,'REGAMBHN','Regaton MB Head - Negro',4,9,'CU','A',NULL,97.00,50.00,'2018-08-06',122.00),(71,'REGUNV35','Regaton UNIV 35mm- Negro',4,9,'CU','A',NULL,650.00,100.00,'2018-08-06',75.00),(72,'REGUNV40','Regaton UNIV 40mm- Negro',4,9,'CU','A',NULL,450.00,100.00,'2018-08-06',80.00),(73,'RESMA-A4-75GR','Resma A4 500 x 75grs',5,5,'CU','A',NULL,25.00,20.00,'2020-08-08',455.00),(74,'RESMA-CARTA-80GR','Resma CARTA 500 x 80grs',5,5,'CU','A',NULL,15.00,15.00,'2020-08-08',498.00),(75,'RIVLOGO','Logo Rivera',4,20,'CU','A',NULL,100.00,30.00,'2020-10-03',0.00),(76,'RUED 45-AZUL','Ruedas 45mm diam Azul',4,18,'CU','A',NULL,80.00,20.00,'2017-08-10',230.00),(77,'RUED 60-BK','Ruedas 60mm diam Negra',4,18,'CU','A',NULL,120.00,20.00,'2017-08-10',268.00),(78,'SLOLOGO','Logo Soldano',4,20,'CU','A',NULL,78.00,20.00,'2019-03-14',0.00),(79,'TARM1020','Tarugos Mad. 10x20',4,19,'CU','A',NULL,405.00,150.00,'2014-02-05',8.00),(80,'TARM1030','Tarugos Mad. 10x30',4,19,'CU','A',NULL,605.00,150.00,'2014-08-04',8.00),(81,'TC10028-25','Tapa Cerejeira 100x28x2,5',4,2,'CU','A',NULL,100.00,50.00,'2016-03-10',100.00),(82,'TELAFDER-BD','Tela Blues Deville Fender',4,13,'M2','A',NULL,100.00,40.00,'2019-08-02',125.80),(83,'TOPFONC20-25x25','Tope Fondo Cerejerira 20x2,5x2,5',4,2,'CU','A',NULL,100.00,50.00,'2016-03-10',100.00),(84,'TOPFONP20-25x25','Tope Fondo Pino 20x2,5x2,5',4,2,'CU','A',NULL,12.00,10.00,'2014-08-08',270.00),(85,'TOPFONP25-25x25','Tope Fondo Pino 25x2,5x2,5',4,2,'CU','A',NULL,14.00,10.00,'2014-02-08',290.00),(86,'TOPFONP30-25x25','Tope Fondo Pino 30x2,5x2,5',4,2,'CU','A',NULL,16.00,10.00,'2014-08-10',400.00),(87,'TOPFREC20-25x25','Tope Frente Cerejerira 20x2,5x2,5',4,2,'CU','A',NULL,100.00,50.00,'2016-03-10',100.00),(88,'TOPFREP20-25x25','Tope Frente Pino 20x2,5x2,5',4,2,'CU','A',NULL,12.00,10.00,'2014-08-10',300.00),(89,'TOPFREP38-25x25','Tope Frente Pino 38x2,5x2,5',4,2,'CU','A',NULL,14.00,10.00,'2017-08-18',210.00),(90,'TOPFREP50-25x25','Tope Frente Pino 50x2,5x2,5',4,2,'CU','A',NULL,16.00,15.00,'2017-08-10',125.00),(91,'TP11028-25','Tapa Pino 110x28x2,5',4,2,'CU','A',NULL,23.00,15.00,'2017-08-03',167.00),(92,'TP12038-25','Tapa Pino 120x38x2,5',4,2,'CU','A',NULL,22.00,15.00,'2017-08-03',380.00),(93,'VINIL','Peg. Vinilico Contacto',4,12,'CM3','A',NULL,1350.80,1500.00,'2018-08-02',124.00),(94,'VINIL-ESP','Peg. Vinilico Contacto Especial',4,12,'CM3','A',NULL,2500.30,5000.00,'2019-08-02',450.00),(95,'VINIL-NG','Peg. Vinilico Contacto Negro',4,12,'CM3','A',NULL,4560.00,5000.00,'2019-08-01',100.00),(96,'FDERLOGO3','Logo Fender 3',4,20,'CU','A',NULL,1000.00,200.00,'2018-08-02',0.00),(97,'RESMAA480G','Resma A4 80grs',5,5,'CU','A',NULL,25.00,15.00,'2021-10-10',90.00),(98,'RESMALT80G','Resma LT 80grs',5,5,'CU','A',NULL,15.00,10.00,'2021-10-10',95.00),(99,'BICTGAZUL','Bic trazo grueso Azul ',5,5,'CU','A',NULL,8.00,15.00,'2021-10-10',15.00),(100,'BICTGNEGRA','Bic trazo grueso Negra',5,5,'CU','A',NULL,30.00,15.00,'2021-11-10',15.00),(101,'BICTGROJO','Bic trazo grueso Rojo',5,5,'CU','A',NULL,55.00,15.00,'2021-10-10',15.00),(102,'BROCHES10','Broches 10',5,5,'CU','A',NULL,5.00,5.00,'2021-11-10',11.00),(103,'BROCHES15','Broches 15',5,5,'CU','A',NULL,16.00,5.00,'2021-10-20',11.80),(104,'MECHAMAD4','Mecha madera 4mm',5,4,'CU','A',NULL,12.00,5.00,'2018-08-03',35.00),(105,'MECHAMAD5','Mecha madera 5mm',5,4,'CU','A',NULL,8.00,5.00,'2018-01-12',35.00),(106,'MECHAMAD6','Mecha madera 6mm',5,4,'CU','A',NULL,14.00,5.00,'2018-08-03',35.00),(107,'MECHAMAD10','Mecha madera 10mm',5,4,'CU','A',NULL,3.00,5.00,'2018-01-10',45.00),(108,'ENERGIA','Energía Electrica',6,24,'KWH','A',NULL,0.00,0.00,'2007-01-01',1200.00),(109,'GAS','Gas',6,25,'CM3','A',NULL,0.00,0.00,'2007-01-01',900.00),(110,'AGUA','Agua',6,25,'LTS','A',NULL,0.00,0.00,'2007-01-01',100.00),(111,'SEGURIDAD','Servicio de Seguridad',6,25,'CU','A',NULL,0.00,0.00,'2007-01-01',1050.00),(112,'SEGUROS','Seguros',6,25,'CU','A',NULL,0.00,0.00,'2007-01-01',3000.00);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `articulos_AFTER_INSERT` AFTER INSERT ON `articulos` FOR EACH ROW BEGIN
CALL sp_audit_log('articulos', 1, CONCAT('ALTA idArt=', NEW.idArt, ' id=', NEW.articulo_id));
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `articulos_AFTER_UPDATE` AFTER UPDATE ON `articulos` FOR EACH ROW BEGIN
CALL sp_audit_log('articulos', 3, CONCAT('MOD idArt=', COALESCE(NEW.idArt,OLD.idArt),' id=', COALESCE(NEW.articulo_id,OLD.articulo_id)));
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `articulos_AFTER_DELETE` AFTER DELETE ON `articulos` FOR EACH ROW BEGIN
CALL sp_audit_log('articulos', 2, CONCAT('BAJA idArt=', OLD.idArt, ' id=', OLD.articulo_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit` (
  `idEvent` int NOT NULL AUTO_INCREMENT,
  `idMov` int NOT NULL,
  `DetMov` varchar(80) NOT NULL,
  `Fecha` date NOT NULL,
  `Time` time NOT NULL,
  `idUsr` int DEFAULT NULL,
  `Table` varchar(45) NOT NULL,
  PRIMARY KEY (`idEvent`),
  KEY `idxIdMov` (`idMov`),
  CONSTRAINT `fk_audit_audmov` FOREIGN KEY (`idMov`) REFERENCES `audmov` (`idMov`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audmov`
--

DROP TABLE IF EXISTS `audmov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audmov` (
  `idMov` int NOT NULL,
  `Movimiento` varchar(15) NOT NULL,
  PRIMARY KEY (`idMov`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audmov`
--

LOCK TABLES `audmov` WRITE;
/*!40000 ALTER TABLE `audmov` DISABLE KEYS */;
INSERT INTO `audmov` VALUES (1,'ALTA'),(2,'BAJA'),(3,'MODIFICACION');
/*!40000 ALTER TABLE `audmov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clase_articulo`
--

DROP TABLE IF EXISTS `clase_articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase_articulo` (
  `idClase` int NOT NULL,
  `ClaseDet` varchar(100) NOT NULL,
  PRIMARY KEY (`idClase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase_articulo`
--

LOCK TABLES `clase_articulo` WRITE;
/*!40000 ALTER TABLE `clase_articulo` DISABLE KEYS */;
INSERT INTO `clase_articulo` VALUES (1,'TORNILLOS'),(2,'MADERAS'),(3,'PEGAMENTOS'),(4,'HERRAMIENTAS'),(5,'LIBRERIA'),(6,'MAQUINAS ELECT.'),(7,'CLAVOS'),(8,'MANIJAS'),(9,'REGATONES'),(10,'ESQUINEROS'),(11,'CUERINA'),(12,'VINILICOS'),(13,'TELAS'),(14,'LACAS'),(15,'PINTURAS'),(16,'CUEROS'),(17,'TONERS'),(18,'RUEDAS'),(19,'TARUGOS'),(20,'LOGOS'),(21,'CHAPA APOYO'),(22,'CURTIEMBRE'),(23,'MADERA ESPECIAL'),(24,'ELECTRICIDAD'),(25,'VARIOS');
/*!40000 ALTER TABLE `clase_articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(100) NOT NULL,
  `Marca` varchar(100) DEFAULT NULL,
  `FecIng` date DEFAULT NULL,
  `Calle` varchar(200) DEFAULT NULL,
  `CalleNro` int DEFAULT NULL,
  `CodPos` varchar(20) DEFAULT NULL,
  `Localidad` varchar(100) DEFAULT NULL,
  `IdPcia` int DEFAULT NULL,
  `Tel_1` varchar(50) DEFAULT NULL,
  `Tel_2` varchar(50) DEFAULT NULL,
  `Tel_3` varchar(50) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `UltTrx` date DEFAULT NULL,
  `idUsr` int DEFAULT NULL,
  `Estado` char(1) DEFAULT NULL,
  `cuit` varchar(20) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tipo_pago_id` int DEFAULT NULL,
  `tipo_entrega_id` int DEFAULT NULL,
  PRIMARY KEY (`cliente_id`),
  KEY `tipo_pago_id` (`tipo_pago_id`),
  KEY `tipo_entrega_id` (`tipo_entrega_id`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`tipo_pago_id`) REFERENCES `tipo_pago` (`tipo_pago_id`),
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`tipo_entrega_id`) REFERENCES `tipo_entrega` (`tipo_entrega_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Fender LLC','Fender','2015-01-01','Fleming',1234,'1234','Florida',1,'1111-2222','1111-2223','1111-2224','fenderllc@fender.com',NULL,4,'A',NULL,NULL,NULL,NULL,NULL),(2,'Marshall Inc','Marshall','2014-02-10','Corrientes',2233,'1400','CABA',1,'2222-1111','2222-1112','2222-1113','Marshall@marshall.com',NULL,5,'A',NULL,NULL,NULL,NULL,NULL),(3,'Mesa LLC','Mesa Boogie','2014-01-08','Larrea',2211,'1405','CABA',1,'3333-2211','3333-2222',NULL,'mesa@mesa.com',NULL,4,'A',NULL,NULL,NULL,NULL,NULL),(4,'Soldano','Soldano','2019-10-10','Mitre',4550,'2020','San Isidro',1,'1111-2254','1111-8989',NULL,'soldano@soldano.com',NULL,5,'A',NULL,NULL,NULL,NULL,NULL),(5,'Bogner Amp Inc','Bogner','2018-09-10','Cordoba',6080,'1300','CABA',1,'2223-5454',NULL,NULL,'bogneramp@bogneramp.com',NULL,4,'A',NULL,NULL,NULL,NULL,NULL),(6,'Rivera Music LLC','Rivera','2017-10-01','Pasteur',1200,'1344','CABA',1,'2233-4455','2233-5544',NULL,'riverainfo@rivera.com',NULL,5,'A',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones` (
  `direccion_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `calle` varchar(200) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL,
  `pais` varchar(100) NOT NULL,
  PRIMARY KEY (`direccion_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_oc`
--

DROP TABLE IF EXISTS `estado_oc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_oc` (
  `estado_oc_id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`estado_oc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_oc`
--

LOCK TABLES `estado_oc` WRITE;
/*!40000 ALTER TABLE `estado_oc` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_oc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_cabecera`
--

DROP TABLE IF EXISTS `factura_cabecera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_cabecera` (
  `factura_id` int NOT NULL AUTO_INCREMENT,
  `numero_factura` varchar(50) NOT NULL,
  `fecha_emision` date NOT NULL,
  `remito_id` int NOT NULL,
  `cae` varchar(50) DEFAULT NULL,
  `vencimiento_cae` date DEFAULT NULL,
  PRIMARY KEY (`factura_id`),
  UNIQUE KEY `numero_factura` (`numero_factura`),
  KEY `remito_id` (`remito_id`),
  CONSTRAINT `factura_cabecera_ibfk_1` FOREIGN KEY (`remito_id`) REFERENCES `remito_cabecera` (`remito_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_cabecera`
--

LOCK TABLES `factura_cabecera` WRITE;
/*!40000 ALTER TABLE `factura_cabecera` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_cabecera` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `factura_cabecera_AFTER_INSERT` AFTER INSERT ON `factura_cabecera` FOR EACH ROW BEGIN
  CALL sp_audit_log('factura_cabecera', 1,
    CONCAT('ALTA nro=', NEW.numero_factura, ' id=', NEW.factura_id));
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `factura_cabecera_AFTER_UPDATE` AFTER UPDATE ON `factura_cabecera` FOR EACH ROW BEGIN
  CALL sp_audit_log('factura_cabecera', 3,
    CONCAT('MOD nro=', COALESCE(NEW.numero_factura,OLD.numero_factura),
           ' id=', COALESCE(NEW.factura_id,OLD.factura_id)));
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `factura_cabecera_AFTER_DELETE` AFTER DELETE ON `factura_cabecera` FOR EACH ROW BEGIN
  CALL sp_audit_log('factura_cabecera', 2,
    CONCAT('BAJA nro=', OLD.numero_factura, ' id=', OLD.factura_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `factura_detalle`
--

DROP TABLE IF EXISTS `factura_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_detalle` (
  `detalle_id` int NOT NULL AUTO_INCREMENT,
  `factura_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  `iva_porcentaje` decimal(5,2) DEFAULT '21.00',
  PRIMARY KEY (`detalle_id`),
  KEY `factura_id` (`factura_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `factura_detalle_ibfk_1` FOREIGN KEY (`factura_id`) REFERENCES `factura_cabecera` (`factura_id`),
  CONSTRAINT `factura_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_detalle`
--

LOCK TABLES `factura_detalle` WRITE;
/*!40000 ALTER TABLE `factura_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoja_ruta`
--

DROP TABLE IF EXISTS `hoja_ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoja_ruta` (
  `hoja_id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `etapa` varchar(100) NOT NULL,
  `orden_etapa` int NOT NULL,
  PRIMARY KEY (`hoja_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `hoja_ruta_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoja_ruta`
--

LOCK TABLES `hoja_ruta` WRITE;
/*!40000 ALTER TABLE `hoja_ruta` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoja_ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_compra_cabecera`
--

DROP TABLE IF EXISTS `orden_compra_cabecera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_compra_cabecera` (
  `oc_id` int NOT NULL AUTO_INCREMENT,
  `numero_oc` varchar(50) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `proveedor` varchar(100) NOT NULL,
  `direccion_proveedor` varchar(200) DEFAULT NULL,
  `telefono_proveedor` varchar(50) DEFAULT NULL,
  `persona_contacto` varchar(100) DEFAULT NULL,
  `condicion_pago_id` int DEFAULT NULL,
  `referencia_pedido` varchar(50) DEFAULT NULL,
  `estado_oc_id` int DEFAULT NULL,
  PRIMARY KEY (`oc_id`),
  UNIQUE KEY `numero_oc` (`numero_oc`),
  KEY `condicion_pago_id` (`condicion_pago_id`),
  KEY `estado_oc_id` (`estado_oc_id`),
  CONSTRAINT `orden_compra_cabecera_ibfk_1` FOREIGN KEY (`condicion_pago_id`) REFERENCES `tipo_pago` (`tipo_pago_id`),
  CONSTRAINT `orden_compra_cabecera_ibfk_2` FOREIGN KEY (`estado_oc_id`) REFERENCES `estado_oc` (`estado_oc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_compra_cabecera`
--

LOCK TABLES `orden_compra_cabecera` WRITE;
/*!40000 ALTER TABLE `orden_compra_cabecera` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_compra_cabecera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_compra_detalle`
--

DROP TABLE IF EXISTS `orden_compra_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_compra_detalle` (
  `detalle_id` int NOT NULL AUTO_INCREMENT,
  `oc_id` int NOT NULL,
  `articulo_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  `iva_porcentaje` decimal(5,2) DEFAULT '21.00',
  PRIMARY KEY (`detalle_id`),
  KEY `oc_id` (`oc_id`),
  KEY `articulo_id` (`articulo_id`),
  CONSTRAINT `orden_compra_detalle_ibfk_1` FOREIGN KEY (`oc_id`) REFERENCES `orden_compra_cabecera` (`oc_id`),
  CONSTRAINT `orden_compra_detalle_ibfk_2` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`articulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_compra_detalle`
--

LOCK TABLES `orden_compra_detalle` WRITE;
/*!40000 ALTER TABLE `orden_compra_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_compra_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_fabricacion_cabecera`
--

DROP TABLE IF EXISTS `orden_fabricacion_cabecera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_fabricacion_cabecera` (
  `of_id` int NOT NULL AUTO_INCREMENT,
  `numero_of` varchar(50) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `orden_venta_id` int NOT NULL,
  PRIMARY KEY (`of_id`),
  UNIQUE KEY `numero_of` (`numero_of`),
  KEY `orden_venta_id` (`orden_venta_id`),
  CONSTRAINT `orden_fabricacion_cabecera_ibfk_1` FOREIGN KEY (`orden_venta_id`) REFERENCES `orden_venta_cabecera` (`orden_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_fabricacion_cabecera`
--

LOCK TABLES `orden_fabricacion_cabecera` WRITE;
/*!40000 ALTER TABLE `orden_fabricacion_cabecera` DISABLE KEYS */;
INSERT INTO `orden_fabricacion_cabecera` VALUES (2,'OF-0002','2025-09-19','2025-10-04',1);
/*!40000 ALTER TABLE `orden_fabricacion_cabecera` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orden_fabricacion_cabecera_AFTER_INSERT` AFTER INSERT ON `orden_fabricacion_cabecera` FOR EACH ROW BEGIN
  CALL sp_audit_log('orden_fabricacion_cabecera', 1,
    CONCAT('ALTA numero_of=', NEW.numero_of, ' id=', NEW.of_id));
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orden_fabricacion_cabecera_AFTER_UPDATE` AFTER UPDATE ON `orden_fabricacion_cabecera` FOR EACH ROW BEGIN
  CALL sp_audit_log('orden_fabricacion_cabecera', 3,
    CONCAT('MOD numero_of=', COALESCE(NEW.numero_of,OLD.numero_of),
           ' id=', COALESCE(NEW.of_id,OLD.of_id)));
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orden_fabricacion_cabecera_AFTER_DELETE` AFTER DELETE ON `orden_fabricacion_cabecera` FOR EACH ROW BEGIN
  CALL sp_audit_log('orden_fabricacion_cabecera', 2,
    CONCAT('BAJA numero_of=', OLD.numero_of, ' id=', OLD.of_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orden_fabricacion_detalle`
--

DROP TABLE IF EXISTS `orden_fabricacion_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_fabricacion_detalle` (
  `detalle_id` int NOT NULL AUTO_INCREMENT,
  `of_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `of_item` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL DEFAULT '0.00',
  `importe` decimal(14,2) GENERATED ALWAYS AS ((`cantidad` * `precio_unitario`)) STORED,
  `estado` varchar(10) DEFAULT 'OFP',
  PRIMARY KEY (`detalle_id`),
  UNIQUE KEY `uk_of_item` (`of_id`,`of_item`),
  KEY `of_id` (`of_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `orden_fabricacion_detalle_ibfk_1` FOREIGN KEY (`of_id`) REFERENCES `orden_fabricacion_cabecera` (`of_id`),
  CONSTRAINT `orden_fabricacion_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_fabricacion_detalle`
--

LOCK TABLES `orden_fabricacion_detalle` WRITE;
/*!40000 ALTER TABLE `orden_fabricacion_detalle` DISABLE KEYS */;
INSERT INTO `orden_fabricacion_detalle` (`detalle_id`, `of_id`, `producto_id`, `of_item`, `cantidad`, `precio_unitario`, `estado`) VALUES (1,2,25,1,10,7600.00,'OFP'),(2,2,11,2,5,20400.00,'OFP');
/*!40000 ALTER TABLE `orden_fabricacion_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_pedido_cabecera`
--

DROP TABLE IF EXISTS `orden_pedido_cabecera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_pedido_cabecera` (
  `pedido_id` int NOT NULL AUTO_INCREMENT,
  `numero_pedido` varchar(50) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `solicitante` varchar(100) DEFAULT NULL,
  `sector_solicitante` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pedido_id`),
  UNIQUE KEY `numero_pedido` (`numero_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_pedido_cabecera`
--

LOCK TABLES `orden_pedido_cabecera` WRITE;
/*!40000 ALTER TABLE `orden_pedido_cabecera` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_pedido_cabecera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_pedido_detalle`
--

DROP TABLE IF EXISTS `orden_pedido_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_pedido_detalle` (
  `detalle_id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int NOT NULL,
  `articulo_id` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`detalle_id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `articulo_id` (`articulo_id`),
  CONSTRAINT `orden_pedido_detalle_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `orden_pedido_cabecera` (`pedido_id`),
  CONSTRAINT `orden_pedido_detalle_ibfk_2` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`articulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_pedido_detalle`
--

LOCK TABLES `orden_pedido_detalle` WRITE;
/*!40000 ALTER TABLE `orden_pedido_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_pedido_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_venta_cabecera`
--

DROP TABLE IF EXISTS `orden_venta_cabecera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_venta_cabecera` (
  `orden_id` int NOT NULL AUTO_INCREMENT,
  `numero_orden` varchar(50) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `cliente_id` int NOT NULL,
  `vendedor_id` int NOT NULL,
  `tipo_pago_id` int DEFAULT NULL,
  `tipo_entrega_id` int DEFAULT NULL,
  PRIMARY KEY (`orden_id`),
  UNIQUE KEY `numero_orden` (`numero_orden`),
  KEY `cliente_id` (`cliente_id`),
  KEY `vendedor_id` (`vendedor_id`),
  KEY `tipo_pago_id` (`tipo_pago_id`),
  KEY `tipo_entrega_id` (`tipo_entrega_id`),
  CONSTRAINT `orden_venta_cabecera_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `orden_venta_cabecera_ibfk_2` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores` (`vendedor_id`),
  CONSTRAINT `orden_venta_cabecera_ibfk_3` FOREIGN KEY (`tipo_pago_id`) REFERENCES `tipo_pago` (`tipo_pago_id`),
  CONSTRAINT `orden_venta_cabecera_ibfk_4` FOREIGN KEY (`tipo_entrega_id`) REFERENCES `tipo_entrega` (`tipo_entrega_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_venta_cabecera`
--

LOCK TABLES `orden_venta_cabecera` WRITE;
/*!40000 ALTER TABLE `orden_venta_cabecera` DISABLE KEYS */;
INSERT INTO `orden_venta_cabecera` VALUES (1,'OV-0001','2025-09-19','2025-10-04',3,1,NULL,NULL);
/*!40000 ALTER TABLE `orden_venta_cabecera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_venta_detalle`
--

DROP TABLE IF EXISTS `orden_venta_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_venta_detalle` (
  `detalle_id` int NOT NULL AUTO_INCREMENT,
  `orden_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  `descuento_porcentaje` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`detalle_id`),
  KEY `orden_id` (`orden_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `orden_venta_detalle_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `orden_venta_cabecera` (`orden_id`),
  CONSTRAINT `orden_venta_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_venta_detalle`
--

LOCK TABLES `orden_venta_detalle` WRITE;
/*!40000 ALTER TABLE `orden_venta_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_venta_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procesos`
--

DROP TABLE IF EXISTS `procesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procesos` (
  `IdCt` varchar(10) NOT NULL,
  `Proceso` varchar(100) NOT NULL,
  `TimeProc` time DEFAULT NULL,
  PRIMARY KEY (`IdCt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procesos`
--

LOCK TABLES `procesos` WRITE;
/*!40000 ALTER TABLE `procesos` DISABLE KEYS */;
INSERT INTO `procesos` VALUES ('AC1','ACOPIO 1','35:00:00'),('AC2','ACOPIO 2','28:00:00'),('CON','CONTROL DE CALIDAD','05:00:00'),('EMP','EMPAQUETADO','12:00:00'),('EN1','ENSAMBLADO 1','60:00:00'),('EN2','ENSAMBLADO 2','40:00:00'),('PIN','PINTURA','72:00:00'),('TAP','TAPIZADO','80:00:00');
/*!40000 ALTER TABLE `procesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `idProducto` varchar(50) NOT NULL,
  `idCliente` int DEFAULT NULL,
  `ProdDetalle` varchar(200) NOT NULL,
  `idTipo` int DEFAULT NULL,
  `Margen` decimal(5,2) DEFAULT NULL,
  `Costo` decimal(12,2) DEFAULT NULL,
  `PUnitario` decimal(12,2) DEFAULT NULL,
  `Estado` char(1) DEFAULT NULL,
  `FecAlta` date DEFAULT NULL,
  PRIMARY KEY (`producto_id`),
  UNIQUE KEY `uk_productos_idProducto` (`idProducto`),
  KEY `tipo_producto_id` (`idTipo`),
  KEY `productos_fk_cliente` (`idCliente`),
  CONSTRAINT `productos_fk_cliente` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `productos_fk_tipo` FOREIGN KEY (`idTipo`) REFERENCES `tipo_producto` (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'BLUED4X10',1,'Blues Deville 4x10 Reissue',1,38.00,100726.34,139002.35,'A','2008-10-10'),(2,'F65DSP',1,'Frontman 65R DSP',1,38.00,NULL,NULL,'A','2008-10-10'),(3,'BCPAINA',2,'BCP BASS AMP',2,35.00,NULL,NULL,'A','2010-03-01'),(4,'AS50D',2,'Marshall AS50D',1,35.00,NULL,NULL,'A','2010-03-01'),(5,'CD30',3,'Caliber 30',1,38.00,NULL,NULL,'A','2010-02-14'),(6,'MESA50CAL',3,'Mesa Boogie 50 Caliber',1,38.00,NULL,NULL,'A','2010-02-14'),(7,'M212Cab',3,'Mesa 2x12 Cabinet',3,35.00,NULL,NULL,'A','2010-02-14'),(8,'SLO100',4,'Super Lead Overdrive 100W Head',2,50.00,NULL,NULL,'A','2019-10-10'),(9,'EXT212SLO',4,'2x12 Extension Cabinet',3,50.00,NULL,NULL,'A','2019-10-10'),(10,'XTC',5,'Ecstasy 101B Head',2,45.00,NULL,NULL,'A','2018-09-10'),(11,'MVCAB1+',6,'Rivera M100 4x12 Cabinet',3,35.00,NULL,NULL,'A','2017-10-01'),(23,'CT1X12WIDE23',3,'California Tweed1X12 CALIFORNIA TWEED 23',3,35.00,NULL,NULL,'A','2010-02-14'),(24,'FHOTRODDX3',1,'Hot Rod Deluxe III',1,37.00,NULL,NULL,'A','2018-12-08'),(25,'MVCBO1',3,'MARK V - Combo 1x12',1,30.00,NULL,NULL,'A','2012-04-03'),(26,'PERF1000',1,'Performer 1000 - Black',1,40.00,NULL,NULL,'A','2009-08-14');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `productos_AFTER_INSERT` AFTER INSERT ON `productos` FOR EACH ROW BEGIN
  CALL sp_audit_log('productos', 1,
    CONCAT('ALTA idProducto=', NEW.idProducto, ' id=', NEW.producto_id));
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `productos_AFTER_UPDATE` AFTER UPDATE ON `productos` FOR EACH ROW BEGIN
  CALL sp_audit_log('productos', 3,
    CONCAT('MOD idProducto=', COALESCE(NEW.idProducto,OLD.idProducto),
           ' id=', COALESCE(NEW.producto_id,OLD.producto_id)));
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `productos_AFTER_DELETE` AFTER DELETE ON `productos` FOR EACH ROW BEGIN
  CALL sp_audit_log('productos', 2,
    CONCAT('BAJA idProducto=', OLD.idProducto, ' id=', OLD.producto_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rec_materiales`
--

DROP TABLE IF EXISTS `rec_materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rec_materiales` (
  `idRecMaterial` int NOT NULL,
  `IdProducto` varchar(50) NOT NULL,
  `IdArt` varchar(50) NOT NULL,
  `Qty` decimal(12,2) NOT NULL,
  `UMComp` varchar(10) NOT NULL,
  `Seq` int NOT NULL,
  PRIMARY KEY (`idRecMaterial`),
  KEY `IdProducto_idx` (`IdProducto`),
  KEY `IdArt_idx` (`IdArt`),
  KEY `UMComp_idx` (`UMComp`),
  CONSTRAINT `rec_materiales_ibfk_1` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `rec_materiales_ibfk_2` FOREIGN KEY (`IdArt`) REFERENCES `articulos` (`idArt`),
  CONSTRAINT `rec_materiales_ibfk_3` FOREIGN KEY (`UMComp`) REFERENCES `unidades` (`idUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rec_materiales`
--

LOCK TABLES `rec_materiales` WRITE;
/*!40000 ALTER TABLE `rec_materiales` DISABLE KEYS */;
INSERT INTO `rec_materiales` VALUES (1,'MVCAB1+','TP10028-25',1.00,'CU',1),(2,'MVCAB1+','TP15028-25',1.00,'CU',1),(3,'MVCAB1+','BC15038-25',2.00,'CU',2),(4,'MVCAB1+','TP15028-25',1.00,'CU',3),(5,'MVCAB1+','BP15038-25',1.00,'CU',4),(6,'MVCAB1+','TP20028-25',1.00,'CU',4),(7,'MVCAB1+','BP20038-25',1.00,'CU',5),(8,'MVCAB1+','TP15028-25',1.00,'CU',6),(9,'MVCAB1+','BP15038-25',1.00,'CU',7),(10,'MVCAB1+','BP20038-25',1.00,'CU',8),(11,'MVCAB1+','MANITMBN',1.00,'CU',2),(12,'MVCAB1+','TARM1020',8.00,'CU',2),(13,'MVCAB1+','PARK205N',4.00,'CU',2),(14,'MVCAB1+','PARK2505N',4.00,'CU',2),(15,'MVCAB1+','FREZ206P',2.00,'CU',2),(16,'MVCAB1+','CHAPMBHN',2.00,'CU',1),(17,'MVCAB1+','FREZ1506P',4.00,'CU',1),(18,'MVCAB1+','CUEMBN',2.80,'M2',1),(19,'MVCAB1+','VINIL',550.00,'CM3',1),(20,'MVCAB1+','FREZ1506N',8.00,'CU',1),(21,'MVCAB1+','MBLOGO1',1.00,'CU',1),(22,'MVCBO1','TP11028-25',1.00,'CU',1),(23,'MVCBO1','BP11038-25',1.00,'CU',1),(24,'MVCBO1','LPD3855-25',1.00,'CU',1),(25,'MVCBO1','LPI3855-25',1.00,'CU',1),(26,'MVCBO1','FP10535-25',1.00,'CU',2),(27,'MVCBO1','TOPFONP30-25x25',2.00,'CU',2),(28,'MVCBO1','FTEP1210545-25',1.00,'CU',2),(29,'MVCBO1','TOPFREP38-25x25',2.00,'CU',2),(30,'MVCBO1','REGAMBHN',4.00,'CU',1),(31,'MVCBO1','ESQUIMBAHN',5.00,'CU',1),(32,'MVCBO1','MANITMBN',1.00,'CU',2),(33,'MVCBO1','TARM1020',8.00,'CU',2),(34,'MVCBO1','PARK205N',4.00,'CU',2),(35,'MVCBO1','PARK2505N',4.00,'CU',2),(36,'MVCBO1','FREZ206P',2.00,'CU',2),(37,'MVCBO1','CHAPMBHN',2.00,'CU',1),(38,'MVCBO1','FREZ1506P',4.00,'CU',1),(39,'MVCBO1','CUEMBN',4.70,'M2',1),(40,'MVCBO1','VINIL',880.00,'CM3',1),(41,'MVCBO1','FREZ1506N',8.00,'CU',1),(42,'MVCBO1','MBLOGO1',1.00,'CU',1),(43,'CT1X12WIDE23','TP12038-25',1.00,'CU',1),(44,'CT1X12WIDE23','BP12038-25',1.00,'CU',1),(45,'CT1X12WIDE23','LPD3855-25',1.00,'CU',1),(46,'CT1X12WIDE23','LPI3855-25',1.00,'CU',1),(47,'CT1X12WIDE23','FP11525-25',1.00,'CU',2),(48,'CT1X12WIDE23','TOPFONP25-25x25',2.00,'CU',2),(49,'CT1X12WIDE23','TOPFREP50-25x25',2.00,'CU',2),(50,'CT1X12WIDE23','FTEP1211550-25',1.00,'CU',2),(51,'CT1X12WIDE23','REGAMBHN',4.00,'CU',1),(52,'CT1X12WIDE23','ESQUIMBAHN',6.00,'CU',1),(53,'CT1X12WIDE23','MANITMBCN',1.00,'CU',2),(54,'CT1X12WIDE23','TARM1020',8.00,'CU',2),(55,'CT1X12WIDE23','PARK205N',8.00,'CU',2),(56,'CT1X12WIDE23','PARK2505N',4.00,'CU',2),(57,'CT1X12WIDE23','FREZ206P',2.00,'CU',2),(58,'CT1X12WIDE23','CHAPMBHN',2.00,'CU',2),(59,'CT1X12WIDE23','FREZ1506P',4.00,'CU',1),(60,'CT1X12WIDE23','CUEMBCREAM',3.60,'M2',1),(61,'CT1X12WIDE23','VINIL',780.00,'CM3',1),(62,'CT1X12WIDE23','FREZ1506N',8.00,'CU',1),(63,'CT1X12WIDE23','FP1557225',1.00,'CU',1),(64,'CT1X12WIDE23','MBLOGO2',1.00,'CU',1),(65,'BLUED4X10','TP10028-25',1.00,'CU',1),(66,'BLUED4X10','BP10038-25',1.00,'CU',1),(67,'BLUED4X10','LPD3840-25',1.00,'CU',1),(68,'BLUED4X10','LPI3840-25',1.00,'CU',1),(69,'BLUED4X10','FP9520-25',1.00,'CU',2),(70,'BLUED4X10','FTEP9520-25',1.00,'CU',2),(71,'BLUED4X10','TOPFREP20-25x25',2.00,'CU',2),(72,'BLUED4X10','TOPFONP20-25x25',2.00,'CU',2),(73,'BLUED4X10','REGAFDERSTD-BKN',4.00,'CU',1),(74,'BLUED4X10','MANITFDER-BK',1.00,'CU',2),(75,'BLUED4X10','TARM1020',8.00,'CU',2),(76,'BLUED4X10','PARK205N',4.00,'CU',2),(77,'BLUED4X10','PARK2505N',4.00,'CU',2),(78,'BLUED4X10','FREZ206P',2.00,'CU',2),(79,'BLUED4X10','FREZ1506P',4.00,'CU',1),(80,'BLUED4X10','TELAFDER-BD',5.80,'M2',1),(81,'BLUED4X10','VINIL',760.00,'CM3',1),(82,'BLUED4X10','FREZ1506N',8.00,'CU',1),(83,'BLUED4X10','FDERLOGO1',1.00,'CU',1),(105,'FHOTRODDX3','TC10028-25',1.00,'CU',1),(106,'FHOTRODDX3','BC10038-25',1.00,'CU',1),(107,'FHOTRODDX3','LCD3840-25',1.00,'CU',1),(108,'FHOTRODDX3','LCI3840-25',1.00,'CU',1),(109,'FHOTRODDX3','FC9520-25',1.00,'CU',1),(110,'FHOTRODDX3','FTEC9520-25',1.00,'CU',1),(111,'FHOTRODDX3','TOPFREC20-25x25',2.00,'CU',1),(112,'FHOTRODDX3','TOPFONC20-25x25',2.00,'CU',1),(113,'FHOTRODDX3','REGAFDERSTD-BKN',4.00,'CU',2),(114,'FHOTRODDX3','ESQUIFDERA-BK',6.00,'CU',2),(115,'FHOTRODDX3','MANITFDER-BK',1.00,'CU',2),(116,'FHOTRODDX3','TARM1020',8.00,'CU',2),(117,'FHOTRODDX3','PARK205N',4.00,'CU',2),(118,'FHOTRODDX3','PARK2505N',4.00,'CU',2),(119,'FHOTRODDX3','FREZ206P',2.00,'CU',2),(120,'FHOTRODDX3','CHAPFDER-HR',2.00,'CU',2),(121,'FHOTRODDX3','FREZ1506P',4.00,'CU',1),(122,'MVCBO1','BP20038-25',1.00,'CU',7),(123,'MVCBO1','MDF618-15',0.50,'M2',8),(124,'FHOTRODDX3','FREZ1506N',8.00,'CU',1),(125,'FHOTRODDX3','FDERLOGO2',1.00,'CU',2),(126,'PERF1000','TP10028-25',1.00,'CU',1),(127,'PERF1000','BP10038-25',1.00,'CU',1),(128,'PERF1000','LPD3840-25',1.00,'CU',1),(129,'PERF1000','LPI3840-25',1.00,'CU',1),(130,'PERF1000','FP9520-25',1.00,'CU',1),(131,'PERF1000','FTEP9520-25',1.00,'CU',1),(132,'PERF1000','TOPFREP20-25x25',2.00,'CU',1),(133,'PERF1000','TOPFONP20-25x25',2.00,'CU',1),(134,'PERF1000','REGAFDERSTD-BKN',4.00,'CU',2),(135,'PERF1000','MANITFDER-BK',1.00,'CU',2),(136,'PERF1000','TARM1020',8.00,'CU',1),(137,'PERF1000','PARK205N',4.00,'CU',2),(138,'PERF1000','PARK2505N',4.00,'CU',2),(139,'PERF1000','FREZ206P',2.00,'CU',2),(140,'PERF1000','FREZ1506P',4.00,'CU',2),(141,'PERF1000','CUEFDER-BK',5.10,'M2',2),(142,'PERF1000','VINIL',820.00,'CM3',2),(143,'PERF1000','FREZ1506N',8.00,'CU',2),(144,'PERF1000','FDERLOGO3',1.00,'CU',2);
/*!40000 ALTER TABLE `rec_materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rec_procesos`
--

DROP TABLE IF EXISTS `rec_procesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rec_procesos` (
  `idProducto` varchar(50) NOT NULL,
  `idCt` varchar(10) NOT NULL,
  `Seq` int NOT NULL,
  `duracion` time DEFAULT NULL,
  PRIMARY KEY (`idProducto`,`idCt`),
  KEY `idCt_idx` (`idCt`),
  CONSTRAINT `rec_procesos_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `rec_procesos_ibfk_2` FOREIGN KEY (`idCt`) REFERENCES `procesos` (`IdCt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rec_procesos`
--

LOCK TABLES `rec_procesos` WRITE;
/*!40000 ALTER TABLE `rec_procesos` DISABLE KEYS */;
INSERT INTO `rec_procesos` VALUES ('AS50D','AC2',1,'30:00:00'),('AS50D','TAP',2,'68:00:00'),('BCPAINA','AC2',1,'30:00:00'),('BCPAINA','TAP',2,'68:00:00'),('BLUED4X10','AC1',1,'35:00:00'),('BLUED4X10','EN1',2,'45:00:00'),('CD30','EN1',1,'35:00:00'),('CD30','TAP',2,'56:00:00'),('EXT212SLO','EN1',1,'35:00:00'),('EXT212SLO','TAP',2,'56:00:00'),('F65DSP','AC1',1,'35:00:00'),('F65DSP','EN1',2,'45:00:00'),('M212Cab','EN1',1,'35:00:00'),('M212Cab','TAP',2,'56:00:00'),('MESA50CAL','EN1',1,'35:00:00'),('MESA50CAL','TAP',2,'56:00:00'),('MVCAB1+','AC1',1,'35:00:00'),('MVCAB1+','EN1',2,'40:00:00'),('MVCAB1+','EN2',4,'25:00:00'),('MVCAB1+','TAP',3,'68:00:00'),('MVCBO1','AC1',1,'35:00:00'),('MVCBO1','AC2',3,'28:00:00'),('MVCBO1','EN1',2,'45:00:00'),('MVCBO1','EN2',5,'25:00:00'),('MVCBO1','TAP',4,'78:00:00'),('SLO100','EN1',1,'35:00:00'),('SLO100','TAP',2,'56:00:00'),('XTC','EN1',1,'45:00:00'),('XTC','TAP',2,'78:00:00');
/*!40000 ALTER TABLE `rec_procesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recibo_pago`
--

DROP TABLE IF EXISTS `recibo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recibo_pago` (
  `recibo_id` int NOT NULL AUTO_INCREMENT,
  `numero_recibo` varchar(50) NOT NULL,
  `fecha_emision` date NOT NULL,
  `factura_id` int NOT NULL,
  `importe_total` decimal(12,2) NOT NULL,
  `medio_pago_id` int DEFAULT NULL,
  PRIMARY KEY (`recibo_id`),
  UNIQUE KEY `numero_recibo` (`numero_recibo`),
  KEY `factura_id` (`factura_id`),
  KEY `medio_pago_id` (`medio_pago_id`),
  CONSTRAINT `recibo_pago_ibfk_1` FOREIGN KEY (`factura_id`) REFERENCES `factura_cabecera` (`factura_id`),
  CONSTRAINT `recibo_pago_ibfk_2` FOREIGN KEY (`medio_pago_id`) REFERENCES `tipo_pago` (`tipo_pago_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibo_pago`
--

LOCK TABLES `recibo_pago` WRITE;
/*!40000 ALTER TABLE `recibo_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remito_cabecera`
--

DROP TABLE IF EXISTS `remito_cabecera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remito_cabecera` (
  `remito_id` int NOT NULL AUTO_INCREMENT,
  `numero_remito` varchar(50) NOT NULL,
  `fecha_emision` date NOT NULL,
  `orden_venta_id` int NOT NULL,
  `bultos` int DEFAULT NULL,
  `peso_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`remito_id`),
  UNIQUE KEY `numero_remito` (`numero_remito`),
  KEY `orden_venta_id` (`orden_venta_id`),
  CONSTRAINT `remito_cabecera_ibfk_1` FOREIGN KEY (`orden_venta_id`) REFERENCES `orden_venta_cabecera` (`orden_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remito_cabecera`
--

LOCK TABLES `remito_cabecera` WRITE;
/*!40000 ALTER TABLE `remito_cabecera` DISABLE KEYS */;
/*!40000 ALTER TABLE `remito_cabecera` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `remito_cabecera_AFTER_INSERT` AFTER INSERT ON `remito_cabecera` FOR EACH ROW BEGIN
  CALL sp_audit_log('remito_cabecera', 1,
    CONCAT('ALTA nro=', NEW.numero_remito, ' id=', NEW.remito_id));
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `remito_cabecera_AFTER_UPDATE` AFTER UPDATE ON `remito_cabecera` FOR EACH ROW BEGIN
  CALL sp_audit_log('remito_cabecera', 3,
    CONCAT('MOD nro=', COALESCE(NEW.numero_remito,OLD.numero_remito),
           ' id=', COALESCE(NEW.remito_id,OLD.remito_id)));
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `remito_cabecera_AFTER_DELETE` AFTER DELETE ON `remito_cabecera` FOR EACH ROW BEGIN
  CALL sp_audit_log('remito_cabecera', 2,
    CONCAT('BAJA nro=', OLD.numero_remito, ' id=', OLD.remito_id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `remito_detalle`
--

DROP TABLE IF EXISTS `remito_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remito_detalle` (
  `detalle_id` int NOT NULL AUTO_INCREMENT,
  `remito_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `peso_kg` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`detalle_id`),
  KEY `remito_id` (`remito_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `remito_detalle_ibfk_1` FOREIGN KEY (`remito_id`) REFERENCES `remito_cabecera` (`remito_id`),
  CONSTRAINT `remito_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remito_detalle`
--

LOCK TABLES `remito_detalle` WRITE;
/*!40000 ALTER TABLE `remito_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `remito_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secuencias`
--

DROP TABLE IF EXISTS `secuencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secuencias` (
  `secuencia_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `valor_actual` bigint NOT NULL,
  PRIMARY KEY (`secuencia_id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secuencias`
--

LOCK TABLES `secuencias` WRITE;
/*!40000 ALTER TABLE `secuencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `secuencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguimiento_cabecera`
--

DROP TABLE IF EXISTS `seguimiento_cabecera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguimiento_cabecera` (
  `seguimiento_id` int NOT NULL AUTO_INCREMENT,
  `of_id` int NOT NULL,
  `fecha` date NOT NULL,
  `jefe_planta` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`seguimiento_id`),
  KEY `of_id` (`of_id`),
  CONSTRAINT `seguimiento_cabecera_ibfk_1` FOREIGN KEY (`of_id`) REFERENCES `orden_fabricacion_cabecera` (`of_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimiento_cabecera`
--

LOCK TABLES `seguimiento_cabecera` WRITE;
/*!40000 ALTER TABLE `seguimiento_cabecera` DISABLE KEYS */;
INSERT INTO `seguimiento_cabecera` VALUES (1,2,'2021-04-11','Turno A','En Proceso');
/*!40000 ALTER TABLE `seguimiento_cabecera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguimiento_detalle`
--

DROP TABLE IF EXISTS `seguimiento_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguimiento_detalle` (
  `detalle_id` int NOT NULL AUTO_INCREMENT,
  `seguimiento_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `idCt` varchar(10) DEFAULT NULL,
  `etapa` varchar(100) NOT NULL,
  `cantidad` int NOT NULL,
  `fecha_proceso` date NOT NULL DEFAULT (curdate()),
  `hora_proceso` time NOT NULL DEFAULT (curtime()),
  `operario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`detalle_id`),
  KEY `seguimiento_id` (`seguimiento_id`),
  KEY `producto_id` (`producto_id`),
  KEY `idx_seg_det_ct` (`idCt`),
  KEY `idx_seg_det_fh` (`fecha_proceso`,`hora_proceso`),
  CONSTRAINT `seg_det_fk_ct` FOREIGN KEY (`idCt`) REFERENCES `procesos` (`IdCt`),
  CONSTRAINT `seguimiento_detalle_ibfk_1` FOREIGN KEY (`seguimiento_id`) REFERENCES `seguimiento_cabecera` (`seguimiento_id`),
  CONSTRAINT `seguimiento_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimiento_detalle`
--

LOCK TABLES `seguimiento_detalle` WRITE;
/*!40000 ALTER TABLE `seguimiento_detalle` DISABLE KEYS */;
INSERT INTO `seguimiento_detalle` VALUES (1,1,25,'AC1','ACOPIO 1',4,'2021-04-11','08:05:00','3'),(2,1,25,'AC1','ACOPIO 1',3,'2021-04-12','10:10:00','3'),(3,1,25,'AC1','ACOPIO 1',3,'2021-04-13','17:23:00','7'),(4,1,25,'EN1','ENSAMBLADO 1',5,'2021-04-25','09:56:00','11');
/*!40000 ALTER TABLE `seguimiento_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_tapiceria`
--

DROP TABLE IF EXISTS `stock_tapiceria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_tapiceria` (
  `stock_tapiceria_id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`stock_tapiceria_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `stock_tapiceria_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_tapiceria`
--

LOCK TABLES `stock_tapiceria` WRITE;
/*!40000 ALTER TABLE `stock_tapiceria` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_tapiceria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_entrega`
--

DROP TABLE IF EXISTS `tipo_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_entrega` (
  `tipo_entrega_id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`tipo_entrega_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_entrega`
--

LOCK TABLES `tipo_entrega` WRITE;
/*!40000 ALTER TABLE `tipo_entrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pago`
--

DROP TABLE IF EXISTS `tipo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_pago` (
  `tipo_pago_id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`tipo_pago_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pago`
--

LOCK TABLES `tipo_pago` WRITE;
/*!40000 ALTER TABLE `tipo_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_producto` (
  `idTipo` int NOT NULL AUTO_INCREMENT,
  `TipoDetalle` varchar(100) NOT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (1,'COMBO'),(2,'CABEZAL'),(3,'CAJA'),(4,'COMPONENTE'),(5,'INSUMO'),(6,'SERVICIOS');
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades` (
  `idUnidad` varchar(10) NOT NULL,
  `IdDetalle` varchar(100) NOT NULL,
  PRIMARY KEY (`idUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES ('CM3','CENTIMETROS CUBICOS'),('CU','CADA UNO'),('KG','KILOGRAMO'),('KWH','KILOWATS HORA'),('LTS','LITROS'),('M2','METROS CUADRADOS'),('ML','METROS LINEALES'),('MM','MILIMETROS');
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `vendedor_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `codigo_interno` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`vendedor_id`),
  UNIQUE KEY `codigo_interno` (`codigo_interno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'Sistema','SIST-001');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'boxsa'
--

--
-- Dumping routines for database 'boxsa'
--
/*!50003 DROP FUNCTION IF EXISTS `OF_FINALIZADA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `OF_FINALIZADA`(p_of_id INT) RETURNS char(1) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE resultado CHAR(1);

    IF EXISTS (
        SELECT 1
        FROM orden_fabricacion_detalle d
        WHERE d.of_id = p_of_id
          AND d.estado = 'OFP'
    ) THEN
        SET resultado = 'P'; 
    ELSE
        SET resultado = 'F'; 
    END IF;

    RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Positivo_Negativo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Positivo_Negativo`(p_valor INT) RETURNS varchar(10) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE resultado VARCHAR(10);

    IF p_valor > 0 THEN
        SET resultado = 'Positivo';
    ELSE
        -- si es 0 o menor a 0, lo tratamos como negativo
        SET resultado = 'Negativo';
    END IF;

    RETURN resultado;
RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Check_Stock_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Check_Stock_Producto`(IN p_idProducto VARCHAR(50), IN p_cantidad DECIMAL(12,2))
BEGIN
SELECT
rm.IdArt                                                AS `Componente`,
SUM(rm.Qty) * p_cantidad                                AS `Qty Necesaria`,
COALESCE(a.Stock, 0)                                    AS `Stock`,
COALESCE(a.Stock, 0) - (SUM(rm.Qty) * p_cantidad)       AS `Diferencia`,
CASE 
WHEN COALESCE(a.Stock,0) - (SUM(rm.Qty) * p_cantidad) >= 0 
	 THEN 'Stock OK'
ELSE 'Sin Stock'
END                                                     AS `Estado`
FROM rec_materiales rm
JOIN articulos a ON a.idArt = rm.IdArt
WHERE rm.IdProducto = p_idProducto
GROUP BY rm.IdArt, a.Stock
ORDER BY (COALESCE(a.Stock,0) - (SUM(rm.Qty) * p_cantidad)) ASC,
 rm.IdArt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Check_Stock_Producto_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Check_Stock_Producto_2`(IN p_idProducto VARCHAR(50), IN p_cantidad DECIMAL(12,2))
BEGIN
DECLARE v_procesable CHAR(1) DEFAULT 'S';


IF EXISTS (
SELECT 1
FROM rec_materiales rm
JOIN articulos a ON a.idArt = rm.IdArt
WHERE rm.IdProducto = p_idProducto
  AND (rm.Qty * p_cantidad) > COALESCE(a.Stock, 0) )

THEN
SET v_procesable = 'N';
END IF;

SELECT p_idProducto AS Producto,
   v_procesable AS Procesable;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Estado_OF_Item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Estado_OF_Item`(IN p_numero_of VARCHAR(50), IN p_of_item INT )
BEGIN
DECLARE v_of_id INT;
IF p_numero_of IS NULL OR p_numero_of = '' THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Debe informar el Nro de OF (numero_of o id numérico).';
END IF;
IF p_of_item IS NULL THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Debe informar el Item.';
END IF;

SELECT of_id INTO v_of_id
FROM boxsa.orden_fabricacion_cabecera
WHERE numero_of = p_numero_of
LIMIT 1;

IF v_of_id IS NULL THEN
SELECT of_id INTO v_of_id
FROM boxsa.orden_fabricacion_cabecera
WHERE of_id = CAST(p_numero_of AS UNSIGNED)
LIMIT 1;
END IF;

IF v_of_id IS NULL THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Orden de Fabricación no encontrada.';
END IF;

SELECT
ofc.of_id            AS `Orden`,
ofd.of_item          AS `Item`,
pr.idProducto        AS `Producto`,
ofd.cantidad         AS `Qty Ordenada`,
ofd.estado           AS `Estado`,
sd.idCt              AS `Centro`,
sd.cantidad          AS `Qty Procesada`,
sd.fecha_proceso     AS `Fecha`,
sd.hora_proceso      AS `Hora`,
sd.operario          AS `Operario`
FROM boxsa.seguimiento_cabecera sc
JOIN boxsa.seguimiento_detalle  sd
ON sd.seguimiento_id = sc.seguimiento_id
JOIN boxsa.orden_fabricacion_cabecera ofc
ON ofc.of_id = sc.of_id
JOIN boxsa.orden_fabricacion_detalle  ofd
ON ofd.of_id = ofc.of_id
AND ofd.producto_id = sd.producto_id
JOIN boxsa.productos pr
ON pr.producto_id = sd.producto_id
WHERE ofc.of_id = v_of_id
AND ofd.of_item = p_of_item
ORDER BY sd.fecha_proceso, sd.hora_proceso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Estado_OF_Item_CT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Estado_OF_Item_CT`(IN p_numero_of VARCHAR(50))
BEGIN
DECLARE v_of_id INT;

IF p_numero_of IS NULL OR p_numero_of = '' THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Debe informar el Nro de OF (numero_of o id numérico).';
END IF;

SELECT of_id INTO v_of_id
  FROM boxsa.orden_fabricacion_cabecera
 WHERE numero_of = p_numero_of
 LIMIT 1;

IF v_of_id IS NULL THEN
	SELECT of_id INTO v_of_id
	  FROM boxsa.orden_fabricacion_cabecera
	 WHERE of_id = CAST(p_numero_of AS UNSIGNED)
	 LIMIT 1;
END IF;

IF v_of_id IS NULL THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Orden de Fabricación no encontrada.';
END IF;

SELECT
	ofc.of_id                            AS `Orden`,
	ofd.of_item                          AS `Item`,
	pr.idProducto                        AS `Producto`,
	ofd.cantidad                         AS `Qty Ordenada`,
	sd.idCt                              AS `Centro`,
	SUM(sd.cantidad)                     AS `QtyProcesada`,
	GREATEST(ofd.cantidad - SUM(sd.cantidad), 0) AS `Pendiente`
FROM boxsa.seguimiento_cabecera sc
JOIN boxsa.seguimiento_detalle  sd
  ON sd.seguimiento_id = sc.seguimiento_id
JOIN boxsa.orden_fabricacion_cabecera ofc
  ON ofc.of_id = sc.of_id
JOIN boxsa.orden_fabricacion_detalle  ofd
  ON ofd.of_id = ofc.of_id
 AND ofd.producto_id = sd.producto_id
JOIN boxsa.productos pr
  ON pr.producto_id = ofd.producto_id
WHERE ofc.of_id = v_of_id
GROUP BY ofc.of_id, ofd.of_item, pr.idProducto, ofd.cantidad, sd.idCt
ORDER BY ofd.of_item, sd.idCt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FACTURA_REMITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FACTURA_REMITO`(
    IN p_numero_remito VARCHAR(50),
    IN p_usuario INT
)
BEGIN
    DECLARE v_remito_id INT;
    DECLARE v_factura_id INT;

    SELECT remito_id
    INTO v_remito_id
    FROM remito_cabecera
    WHERE numero_remito = p_numero_remito;

    IF v_remito_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El remito no existe';
    END IF;

    IF EXISTS (SELECT 1 FROM factura_cabecera WHERE remito_id = v_remito_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El remito ya fue facturado';
    END IF;

    INSERT INTO factura_cabecera (
        numero_factura,
        fecha_emision,
        remito_id,
        cae,
        vencimiento_cae
    )
    VALUES (
        CONCAT('FAC-', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s')), 
        CURRENT_DATE,
        v_remito_id,
        NULL,  
        NULL  
    );

    SET v_factura_id = LAST_INSERT_ID();

    INSERT INTO factura_detalle (
        factura_id,
        producto_id,
        cantidad,
        precio_unitario,
        iva_porcentaje
    )
    SELECT v_factura_id, producto_id, cantidad, precio_unitario, iva_porcentaje
    FROM remito_detalle
    WHERE remito_id = v_remito_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Costo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Costo`(IN p_idProducto VARCHAR(50))
BEGIN
DECLARE v_costo DECIMAL(12,2);

SELECT SUM(rm.Qty * a.Valor)
INTO v_costo
FROM rec_materiales rm
INNER JOIN articulos a 
ON a.idArt = rm.IdArt
WHERE rm.IdProducto = p_idProducto;

SELECT 
p_idProducto AS 'Costo Producto',
v_costo AS 'Costo Total';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Put_Costo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Put_Costo`(IN p_idProducto VARCHAR(50))
BEGIN
DECLARE v_costo  DECIMAL(18,2) DEFAULT 0.00;
DECLARE v_margen DECIMAL(7,2)  DEFAULT 0.00;
DECLARE v_pu     DECIMAL(18,2) DEFAULT 0.00;

SELECT ROUND(COALESCE(SUM(rm.Qty * a.Valor), 0), 2)
INTO v_costo
FROM rec_materiales rm
JOIN articulos a ON a.idArt = rm.IdArt
WHERE rm.IdProducto = p_idProducto;

SELECT COALESCE(Margen, 0)
INTO v_margen
FROM productos
WHERE idProducto = p_idProducto;

SET v_pu = ROUND(v_costo * (1 + (v_margen / 100)), 2);

UPDATE productos
SET Costo     = v_costo,
PUnitario = v_pu
WHERE idProducto = p_idProducto;

SELECT p_idProducto AS idProducto,
v_costo      AS Costo,
v_pu         AS PUnitario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Receta_Mat_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Receta_Mat_Producto`(IN p_idProducto VARCHAR(50))
BEGIN
SELECT
a.idArt AS Articulo,
rm.Qty AS Cantidad,
a.Valor AS Valor,
a.Stock AS Stock
FROM rec_materiales rm
JOIN articulos a ON a.idArt = rm.IdArt
WHERE rm.IdProducto = p_idProducto
ORDER BY rm.Seq, a.idArt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REMITO_OF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REMITO_OF`(
    IN p_numero_of VARCHAR(50),
    IN p_usuario INT
)
BEGIN
    DECLARE v_of_id INT;
    DECLARE v_estado CHAR(1);
    DECLARE v_remito_id INT;

    -- Buscar la OF
    SELECT of_id
    INTO v_of_id
    FROM orden_fabricacion_cabecera
    WHERE numero_of = p_numero_of;

    IF v_of_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Orden de fabricación no encontrada';
    END IF;

    SET v_estado = OF_FINALIZADA(v_of_id);

    IF v_estado = 'P' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La orden de fabricación aún tiene procesos pendientes';
    END IF;

    -- Validar que no tenga remito previo
    IF EXISTS (SELECT 1 FROM remito_cabecera WHERE of_id = v_of_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La orden de fabricación ya fue remitida';
    END IF;

    INSERT INTO remito_cabecera (fecha_emision, usuario_id, of_id)
    VALUES (CURRENT_DATE, p_usuario, v_of_id);

    SET v_remito_id = LAST_INSERT_ID();

    INSERT INTO remito_detalle (remito_id, producto_id, cantidad)
    SELECT v_remito_id, producto_id, cantidad
    FROM orden_fabricacion_detalle
    WHERE of_id = v_of_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_audit_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_audit_log`(IN p_tabla  VARCHAR(45), IN p_idmov  INT, IN p_detmov VARCHAR(255))
BEGIN
INSERT INTO audit (idMov, DetMov, Fecha, `Time`, idUsr, `Table`)
  VALUES (p_idmov, LEFT(p_detmov,80), CURDATE(), CURTIME(), NULL, p_tabla);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-26 21:55:48
