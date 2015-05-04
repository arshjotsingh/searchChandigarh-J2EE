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
-- Table structure for table `ClassifiedTable`
--

DROP TABLE IF EXISTS `ClassifiedTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClassifiedTable` (
  `classifiedID` bigint(20) NOT NULL,
  `classifiedtitle` varchar(100) DEFAULT NULL,
  `classifieddesc` varchar(800) DEFAULT NULL,
  `categoryID` bigint(20) DEFAULT NULL,
  `image1` varchar(80) DEFAULT NULL,
  `image2` varchar(80) DEFAULT NULL,
  `image3` varchar(80) DEFAULT NULL,
  `image4` varchar(80) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `postdate` datetime DEFAULT NULL,
  `paid` bit(1) DEFAULT NULL,
  PRIMARY KEY (`classifiedID`),
  KEY `fk_ClassifiedTable_1` (`categoryID`),
  KEY `fk_ClassifiedTable_2` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClassifiedTable`
--

LOCK TABLES `ClassifiedTable` WRITE;
/*!40000 ALTER TABLE `ClassifiedTable` DISABLE KEYS */;
INSERT INTO `ClassifiedTable` VALUES (103,'This is my first classified','Testing',4,'',NULL,NULL,NULL,3,'2014-11-01 11:49:07',''),(105,'This is my updated Classified 2','this is my updated description ADD',4,'/home/aa/NetBeansProjects/searchChd/web/ClassifiedPhotos/simer105_1.jpg','/home/aa/NetBeansProjects/searchChd/web/ClassifiedPhotos/simer105_2.jpg','/home/aa/NetBeansProjects/searchChd/web/ClassifiedPhotos/simer105_3.jpg',NULL,3,'2014-11-01 12:02:18','\0'),(106,'This is my 3rd Classified','TESTING updates',6,'/home/aa/NetBeansProjects/searchChd/web/ClassifiedPhotos/simer106_1.jpg','/home/aa/NetBeansProjects/searchChd/web/ClassifiedPhotos/simer106_2.jpg',NULL,NULL,3,'2014-11-03 11:31:12',''),(107,'An Excellent Choice for your kids to nurture with our helping hands','We also offer self-contained Pre-Investment and Pre-Feasibility Studies, Market Surveys and Studies, Preparation of Techno-Economic Feasibility Reports, Identification and Selection of Plant and Machinery, Manufacturing Process and or Equipment required, General Guidance, Technical and Commercial Counseling for setting up new industrial projects on the following topics.\r\n\r\nContact - Sandeep Saklani 9854712547\r\n',6,'/home/aa/NetBeansProjects/searchChd/web/ClassifiedPhotos/simer107_1.jpg',NULL,NULL,NULL,3,'2014-11-15 12:35:42','\0'),(108,'This is my 5th classified','asdsa',5,NULL,NULL,NULL,NULL,3,'2014-11-15 13:33:18','\0');
/*!40000 ALTER TABLE `ClassifiedTable` ENABLE KEYS */;
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
