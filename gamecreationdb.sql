-- MySQL dump 10.13  Distrib 5.5.24, for Win64 (x86)
--
-- Host: localhost    Database: gamecreationdb
-- ------------------------------------------------------
-- Server version	5.5.24

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
-- Table structure for table `puzzle_game`
--

DROP TABLE IF EXISTS `puzzle_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puzzle_game` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `modeValue` int(11) DEFAULT NULL,
  `steps` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `comment` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puzzle_game`
--

LOCK TABLES `puzzle_game` WRITE;
/*!40000 ALTER TABLE `puzzle_game` DISABLE KEYS */;
INSERT INTO `puzzle_game` VALUES (1,'Karan',5,26,243,''),(2,'Mahesh',3,4,13,''),(3,NULL,0,0,0,''),(4,NULL,0,0,0,''),(5,'shiv',0,0,0,''),(6,'mangesh',0,0,0,'');
/*!40000 ALTER TABLE `puzzle_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_deatil`
--

DROP TABLE IF EXISTS `question_deatil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_deatil` (
  `Qid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quest` varchar(450) DEFAULT NULL,
  `QA` varchar(450) DEFAULT NULL,
  `QB` varchar(450) DEFAULT NULL,
  `QC` varchar(450) DEFAULT NULL,
  `QD` varchar(450) DEFAULT NULL,
  `correctAns` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`Qid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_deatil`
--

LOCK TABLES `question_deatil` WRITE;
/*!40000 ALTER TABLE `question_deatil` DISABLE KEYS */;
INSERT INTO `question_deatil` VALUES (1,'what is sound ?','Sound is magic','sound is music .','Sound is valueme of some object.','sound is nothing.','QC'),(2,'what is Light?','Light is something.','Light is Magic.','Light is electromagnetic radiation within a certain portion of the electromagnetic spectrum.','Ligth is awsome','QC'),(3,'what is Light Reflection?','The reflected ray is always in the plane defined by the incident ray and the normal to the surface.','Reflection is Ligt.','Reflection is Magic','Reflection is something.','QA'),(4,'what is Light refraction?','The reflected ray is always in the plane defined by the incident ray and the normal to the surface.','Reflection is Ligt.',' light passes through some medium and changes it\'s direction because of it','when light travels through a lens light is bent as it goes from air to glass and back to air again.','QD'),(5,'what is Light Defraction?','The reflected ray is always in the plane defined by the incident ray and the normal to the surface.','It is defined as the bending of waves around the corners of an obstacle or through an aperture into the region of geometrical shadow of the obstacle/apertureReflection is Ligt.',' light passes through some medium and changes it\'s direction because of it','when light travels through a lens light is bent as it goes from air to glass and back to air again.','QB'),(6,'Light year is a unit of','time','distance','light','intensity of light','QB'),(7,'Light Emitting Diodes (LED) is used in fancy electronic devices such as toys emit','X-rays','ultraviolet light','visible light','radio waves','QC'),(8,'Sound waves in air are','transverse','longitudinal','electromagnetic','polarised','QB'),(9,'Intensity of sound has','an object existence','a subject existence','no existence','both subjective and objective existence','QA'),(10,'Sound of frequency below 20 Hz is called','audio sounds','infrasonic','ultrasonic','both subjective asupersonicsnd objective existence','QB');
/*!40000 ALTER TABLE `question_deatil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quize_game_user_result`
--

DROP TABLE IF EXISTS `quize_game_user_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quize_game_user_result` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `correctAnswer` int(11) DEFAULT NULL,
  `incorrectAnswer` int(11) DEFAULT NULL,
  `result` varchar(45) DEFAULT NULL,
  `totalQuestion` int(11) DEFAULT NULL,
  `stepCompletedName` varchar(45) DEFAULT NULL,
  `usersteps` varchar(45) DEFAULT NULL,
  `percentage` int(10) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quize_game_user_result`
--

LOCK TABLES `quize_game_user_result` WRITE;
/*!40000 ALTER TABLE `quize_game_user_result` DISABLE KEYS */;
INSERT INTO `quize_game_user_result` VALUES (92,'karan',5,0,'pass',10,'First_Step_Completed','First_Step',100),(93,'karan',2,3,'pass',10,'second_Step_Completed','Second_Step',40),(94,'mahesh',3,2,'pass',10,'First_Step_Completed','First_Step',60),(95,'mangesh',4,1,'pass',10,'First_Step_Completed','First_Step',80);
/*!40000 ALTER TABLE `quize_game_user_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration` (
  `name` varchar(45) NOT NULL DEFAULT '',
  `email` varchar(45) NOT NULL DEFAULT '',
  `mobile` varchar(45) NOT NULL DEFAULT '',
  `dob` varchar(45) NOT NULL DEFAULT '',
  `username` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(45) NOT NULL DEFAULT '',
  `address` varchar(45) NOT NULL DEFAULT '',
  `User` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES ('Karan','bainadekaran@gmail.com','8600944611','12/02/1994','karan','123','pune.','Admin'),('Mahesh','mahy@gmail.com','9874563210','11/12/1999','mahesh','123','pune',NULL),('mangesh','mangesh@gmail.com','9874561230','13/12/1999','mangesh','123','pune',NULL),('shiv','shiv@gmail.com','9874563210','25/10/2015','shiv','123','katraj','Users');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summary`
--

DROP TABLE IF EXISTS `summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(25) DEFAULT NULL,
  `link_threshold` int(10) DEFAULT NULL,
  `no_of_links_svm` int(10) DEFAULT NULL,
  `no_of_links_naive_bayes` int(10) DEFAULT NULL,
  `time_svm` tinyblob,
  `time_naive_bayes` tinyblob,
  `accuracy_svm` double DEFAULT NULL,
  `accuracy_naive_bayes` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summary`
--

LOCK TABLES `summary` WRITE;
/*!40000 ALTER TABLE `summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `summary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-21 23:06:21
