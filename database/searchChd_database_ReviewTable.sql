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
-- Table structure for table `ReviewTable`
--

DROP TABLE IF EXISTS `ReviewTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReviewTable` (
  `reviewID` bigint(20) NOT NULL AUTO_INCREMENT,
  `reviewtext` varchar(1000) DEFAULT NULL,
  `userID` bigint(20) DEFAULT NULL,
  `recordID` bigint(20) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reviewID`),
  KEY `fk_new_table_1` (`userID`),
  KEY `fk_new_table_2` (`recordID`),
  CONSTRAINT `fk_new_table_1` FOREIGN KEY (`userID`) REFERENCES `UserTable` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_new_table_2` FOREIGN KEY (`recordID`) REFERENCES `RecordTable` (`recordID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewTable`
--

LOCK TABLES `ReviewTable` WRITE;
/*!40000 ALTER TABLE `ReviewTable` DISABLE KEYS */;
INSERT INTO `ReviewTable` VALUES (2,'this is my 2nd review',1,7,'2014-11-13 12:31:33','\0','arsh'),(3,'niceeeeeeeeeeee bank!!!!!!!!!!!!!!!!!!!!!',2,7,'2014-11-13 12:33:55','\0','karan'),(4,'Burrrrrrrrrrrrrnnnnnnnnnnnnnnnnnnnnnnnnnn!!!!!!!!!!!!!!!!!!!!!',2,7,'2014-11-13 12:34:47','\0','karan'),(5,'axis bank is the best',2,7,'2014-11-13 12:44:12','\0','karan'),(6,'5 stars to axis bank',3,7,'2014-11-13 13:27:05','\0','simer'),(7,'A trusted bank',3,5,'2014-11-13 13:28:51','\0','simer'),(8,'my bank canara bank',1,9,'2014-11-13 14:00:09','\0','arsh');
/*!40000 ALTER TABLE `ReviewTable` ENABLE KEYS */;
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
