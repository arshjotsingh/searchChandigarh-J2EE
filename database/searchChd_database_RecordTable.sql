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
-- Table structure for table `RecordTable`
--

DROP TABLE IF EXISTS `RecordTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RecordTable` (
  `recordID` bigint(20) NOT NULL AUTO_INCREMENT,
  `recordName` varchar(45) DEFAULT NULL,
  `categoryID` bigint(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `tags` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`recordID`),
  UNIQUE KEY `recordName_UNIQUE` (`recordName`),
  KEY `fk_RecordTable_catid` (`categoryID`),
  CONSTRAINT `fk_RecordTable_catid` FOREIGN KEY (`categoryID`) REFERENCES `CategoryTable` (`categoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecordTable`
--

LOCK TABLES `RecordTable` WRITE;
/*!40000 ALTER TABLE `RecordTable` DISABLE KEYS */;
INSERT INTO `RecordTable` VALUES (1,'Fortis Heart',1,'asd','ads'),(3,'Apollo Hospital',1,'Heart Speciality','24hours heartsurgery'),(4,'HDFC',3,'Leading Private International Bank.','bank loan cash money payments'),(5,'SBI',3,'state bank of india','govt bank'),(6,'ICICI',3,'private bank provides loan insurances and business accounts','private bank'),(7,'Axis Bank',3,'private bank reputed','atms bank'),(8,'Corporation Bank',3,'Corporation Bank','Corporation Bank'),(9,'Canara Bank',3,'Canara Bank','Canara Bank'),(10,'Punjab National Bank',3,'Punjab National Bank','Punjab National Bank'),(11,'State Bank of Patiala',3,'State bank of patiala description for testing 4','State Bank of Patiala tags'),(12,'Dena Bank',3,'Dena Bank','Dena Bank'),(13,'Citi Bank',3,'Citi Bank','Citi Bank'),(14,'Standard Chartered Bank',3,'Standard Chartered Bank','Standard Chartered Bank'),(15,'Yes Bank',3,'Yes Bank','Yes Bank'),(16,'Oriental Bank of Commerce',3,'Oriental Bank of Commerce','Oriental Bank of Commerce'),(17,'Bank of India',3,'Bank of India','Bank of India'),(18,'Kotak Mahindra Bank',3,'Kotak Mahindra Bank','Kotak Mahindra Bank'),(19,'ING Vysya Bank',3,'ING Vysya Bank','ING Vysya Bank'),(20,'Bank of Baroda',3,'Bank of Baroda','Bank of Baroda'),(21,'Union Bank of India',3,'Union Bank of India','Union Bank of India'),(22,'UCO Bank',3,'UCO Bank','UCO Bank'),(23,'Indusind Bank',3,'Indusind Bank','Indusind Bank'),(24,'IDBI Bank',3,'IDBI Bank','IDBI Bank'),(25,'Indian Overseas Bank',3,'Indian Overseas Bank','Indian Overseas Bank'),(26,'Indian Bank',3,'Indian Bank','Indian Bank'),(27,'Allahabad Bank',3,'Allahabad Bank','Allahabad Bank'),(28,'Syndicate Bank',3,'Syndicate Bank','Syndicate Bank'),(29,'State Bank of Bikaner',3,'State Bank of Bikaner','State Bank of Bikaner'),(30,'Jammu & Kashmir Bank',3,'Jammu & Kashmir Bank','Jammu & Kashmir Bank'),(31,'Haryana Gramin Bank',3,'Haryana Gramin Bank','Haryana Gramin Bank'),(32,'Central Bank of India',3,'Central Bank of India','Central Bank of India'),(33,'United Bank of India',3,'United Bank of India','United Bank of India'),(34,'Bank of Maharastra',3,'Bank of Maharastra','Bank of Maharastra'),(35,'Max Super Speciality Hospital',1,'Max Super Speciality Hospital','Max Super Speciality Hospital'),(36,'Government Medical College',1,'Government Medical College','Government Medical College'),(37,'PGIMER Hospital',1,'PGIMER Hospital','PGIMER Hospital'),(38,'Government Multispeciality Hospital',1,'Government Multispeciality Hospital','Government Multispeciality Hospital'),(39,'Composite Hospital',1,'Composite Hospital','Composite Hospital'),(44,'Delhi Public School',6,'dps','dps'),(45,'Mcm College',5,'Mcm College','Mcm College');
/*!40000 ALTER TABLE `RecordTable` ENABLE KEYS */;
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
