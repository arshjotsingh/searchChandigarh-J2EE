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
-- Table structure for table `FeedbackTable`
--

DROP TABLE IF EXISTS `FeedbackTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedbackTable` (
  `feedbackID` bigint(20) NOT NULL AUTO_INCREMENT,
  `feedbackSubject` varchar(100) DEFAULT NULL,
  `feedbackUsername` varchar(45) DEFAULT NULL,
  `feedbackText` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`feedbackID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FeedbackTable`
--

LOCK TABLES `FeedbackTable` WRITE;
/*!40000 ALTER TABLE `FeedbackTable` DISABLE KEYS */;
INSERT INTO `FeedbackTable` VALUES (1,'Gud Performance','Tanya','This is my first Feedback'),(2,'Gud Performance','Tanya','This is my first Feedback'),(3,'VERY Gud Performance','Neha','This is my 2nd Feedback'),(4,'VERY Gud Performance','Neha',''),(5,'VERY Gud Performance','Neha',''),(6,'VERY Gud Performance','Neha',''),(7,'VERY Gud Performance','Neha',''),(8,NULL,NULL,NULL),(9,NULL,NULL,NULL),(10,NULL,NULL,NULL),(11,'asd','ad','sad'),(12,NULL,NULL,NULL),(13,NULL,NULL,NULL),(14,NULL,NULL,NULL),(15,NULL,NULL,NULL),(16,NULL,NULL,NULL),(17,NULL,NULL,NULL),(18,NULL,NULL,NULL),(19,NULL,NULL,NULL),(20,'subject','arsh','my feedback sadsad'),(21,'subject','arsh','my feedback sadsad'),(22,'subject','kamal','my feedback sadsad'),(23,'subject','kamal','my feedback sadsad'),(24,'subject','kamal','my feedback sadsad'),(25,'subject','kamal','my feedback sadsad'),(26,'subject','kamal','my feedback sadsad'),(27,'subject','kamla','my feedback sadsad'),(28,'asd','asd','asd'),(29,'das','asd','fasfa'),(30,'fasfsaf','sad','asfsafa');
/*!40000 ALTER TABLE `FeedbackTable` ENABLE KEYS */;
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
