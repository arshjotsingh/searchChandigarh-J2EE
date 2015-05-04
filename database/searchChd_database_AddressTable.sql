CREATE DATABASE  IF NOT EXISTS `searchChd_database` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `searchChd_database`;
-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: searchChd_database
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AddressTable`
--

DROP TABLE IF EXISTS `AddressTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AddressTable` (
  `addressID` bigint(20) NOT NULL AUTO_INCREMENT,
  `recordID` bigint(20) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `landmark` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `fone1` varchar(45) DEFAULT NULL,
  `fone2` varchar(45) DEFAULT NULL,
  `fone3` varchar(45) DEFAULT NULL,
  `imagepath` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`addressID`),
  KEY `fk_AddressTable_recid` (`recordID`),
  CONSTRAINT `fk_AddressTable_recid` FOREIGN KEY (`recordID`) REFERENCES `RecordTable` (`recordID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressTable`
--

LOCK TABLES `AddressTable` WRITE;
/*!40000 ALTER TABLE `AddressTable` DISABLE KEYS */;
INSERT INTO `AddressTable` VALUES (2,3,'456','Sector 16','near le jardin','Chandigarh','Punjab','India','456988',NULL,NULL,NULL,NULL),(7,4,'SCO 13','Sector 64','Phase 10 market','Chandigarh','Punjab','India','144123',NULL,NULL,NULL,NULL),(8,44,'SCO 13','Sector 32-D','near sd college','Ludhiana','Punjab','India','123','987456325',NULL,NULL,NULL),(10,10,'51','Sector 20','','Chandigarh','Punjab','India','16354','1233','513241','569874123',NULL),(11,5,'0','Sector 64','','Chandigarh','Punjab','India','16354','123456987','325698741','null','/home/aa/NetBeansProjects/searchChd/web/RecordPhotos/img_5.jpg'),(12,11,'100','Sector 8','near PCA stadium','Chandigarh','Punjab','India','161118','369','325698741','','/home/aa/NetBeansProjects/searchChd/web/RecordPhotos/img_11.jpg'),(13,9,'1456','Sector 45','near le jardin','Chandigarh','Punjab','India','12345','12312313','325698741','236541789',NULL),(14,19,'1456','Sector 6','','Chandigarh','Punjab','India','1132','123456987','null','null',NULL),(15,15,'SCO 121','Sector 9','','Chandigarh','Punjab','India','160145','987456987','985964785',NULL,NULL),(16,11,'SCO 13','Sector 9','','Chandigarh','Punjab','India','167721','987456987','894566712','236541789','/home/aa/NetBeansProjects/searchChd/web/RecordPhotos/img_11.jpg'),(17,7,'BRS nagar','phase 10','','Chandigarh','Punjab','India','16354','987456987',NULL,NULL,'/home/aa/NetBeansProjects/searchChd/web/RecordPhotos/img_7.jpg');
/*!40000 ALTER TABLE `AddressTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-15 15:05:30
