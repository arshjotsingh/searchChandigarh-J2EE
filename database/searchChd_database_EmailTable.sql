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
-- Table structure for table `EmailTable`
--

DROP TABLE IF EXISTS `EmailTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmailTable` (
  `emailID` bigint(20) NOT NULL AUTO_INCREMENT,
  `emailaddress` varchar(45) DEFAULT NULL,
  `addressID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`emailID`),
  KEY `fk_EmailTable_addressid` (`addressID`),
  CONSTRAINT `fk_EmailTable_addressid` FOREIGN KEY (`addressID`) REFERENCES `AddressTable` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmailTable`
--

LOCK TABLES `EmailTable` WRITE;
/*!40000 ALTER TABLE `EmailTable` DISABLE KEYS */;
INSERT INTO `EmailTable` VALUES (4,'apollocare@hsp.com',2),(5,'',2),(6,'',2),(16,'ankhilesh@hdfc.com',7),(17,'ritika@hdfc.com',7),(18,'fortiscare@hsp.com',8),(22,'421@pnb.com',10),(23,'email2@sbi.com',11),(24,'www.sbi.com(update)',11),(25,'email3@sbi.com',11),(26,'email1@sbi.com',11),(28,'email1@sbp.com',12),(29,'email1@sbp.com(update)',12),(30,'email1@sbp.com',12),(31,'email3update@canara.com',13),(32,'email1update@canara.com',13),(33,'email2update@canara.com',13),(34,'www.canarabank.com(update)',13),(35,'email1@ing.com(update)',14),(36,'support1@yesbank.com',15),(37,'ashish@yesbank.com',15),(38,'www.yesbank.com',15),(39,'www.onlinesbp.com',16),(40,'support2@sbp.com',16),(41,'email1@sbp.com',16),(42,'email1@ing.com(update)',17);
/*!40000 ALTER TABLE `EmailTable` ENABLE KEYS */;
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
