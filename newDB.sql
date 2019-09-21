CREATE DATABASE  IF NOT EXISTS `GameCreationDB` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `GameCreationDB`;
-- MySQL dump 10.13  Distrib 5.6.28, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: GameCreationDB
-- ------------------------------------------------------
-- Server version	5.6.28-0ubuntu0.15.04.1

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
-- Table structure for table `Quize_Game_User_Result`
--

DROP TABLE IF EXISTS `Quize_Game_User_Result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Quize_Game_User_Result` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `correctAnswer` int(11) DEFAULT NULL,
  `incorrectAnswer` int(11) DEFAULT NULL,
  `result` varchar(45) DEFAULT NULL,
  `totalQuestion` int(11) DEFAULT NULL,
  `stepCompletedName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Quize_Game_User_Result`
--

LOCK TABLES `Quize_Game_User_Result` WRITE;
/*!40000 ALTER TABLE `Quize_Game_User_Result` DISABLE KEYS */;
INSERT INTO `Quize_Game_User_Result` VALUES (26,'shiv',4,1,'pass',10,'First_Step_Completed'),(36,'karan',0,1,'Fail',10,NULL);
/*!40000 ALTER TABLE `Quize_Game_User_Result` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puzzle_game`
--

LOCK TABLES `puzzle_game` WRITE;
/*!40000 ALTER TABLE `puzzle_game` DISABLE KEYS */;
INSERT INTO `puzzle_game` VALUES (2,'Mahesh',3,4,13),(3,NULL,0,0,0),(4,NULL,0,0,0),(5,'shiv',0,0,0),(9,'mangesh',0,0,0),(10,'mangesh',3,6,30),(11,'mangesh',4,10,62),(12,'mangesh',5,34,224),(13,'Karan',0,0,0),(14,'Karan',3,7,27),(15,'Karan',4,19,138);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_deatil`
--

LOCK TABLES `question_deatil` WRITE;
/*!40000 ALTER TABLE `question_deatil` DISABLE KEYS */;
INSERT INTO `question_deatil` VALUES (1,'Which part of human ear converts sound vibrations into electrical signals ?','Hammer.','Stirrup .','Tympanic membrane','Cochlea','QD'),(2,'What do dolphins, bats and porpoise use?','Ultrasound.','Infrasound.','Both a and b.','None of them.','QA'),(3,'Our eyes detect light in','RGB form, Red Blue Green form','ROYGBIV, rainbow color form','The simple form of a particular color','none of these ways','QA'),(4,'Speed of sound depends upon','Temperature of the medium.','Pressure of the medium.','Temperature of source producing sound.','Temperature and pressure of medium.','QA'),(5,'Light can travel in ','air only.','It is defined as the bending of waves around the corners of an obstacle or through an aperture into the region of geometrical shadow of the obstacle/apertureReflection is Ligt.',' light passes through some medium and changes it\'s direction because of it','when light travels through a lens light is bent as it goes from air to glass and back to air again.','QC'),(6,'Light year is a unit of','time','distance','light','intensity of light','QB'),(7,'Light Emitting Diodes (LED) is used in fancy electronic devices such as toys emit','X-rays','ultraviolet light','visible light','radio waves','QC'),(8,'Sound waves in air are','transverse','longitudinal','electromagnetic','polarised','QB'),(9,'Intensity of sound has','an object existence','a subject existence','no existence','both subjective and objective existence','QA'),(10,'Sound of frequency below 20 Hz is called','audio sounds','infrasonic','ultrasonic','both subjective asupersonicsnd objective existence','QB'),(11,'Focal length of plane mirror is',' At infinity','Zero','Negative','None of these','QA'),(12,'Which of these travels faster: Sound or Light? ',' Sound',' Light','Both travel at the same speed','None of these','QB'),(13,'Sound waves do not travel through _______. ',' Solids','liquids',' Gases','vacuum','QD'),(14,' Sound and light waves both _________. ','Have similar wavelength ',' Obey the laws of reflection','Travel as longitudinal waves','Travel through vacuum','QB'),(15,' When sound travels through air, the air particles ____. ','Vibrate along the direction of wave propagation','Vibrate but not in any fixed direction ','Vibrate perpendicular to the direction of wave propagation ','Do not vibrate ','QA');
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
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quize_game_user_result`
--

LOCK TABLES `quize_game_user_result` WRITE;
/*!40000 ALTER TABLE `quize_game_user_result` DISABLE KEYS */;
INSERT INTO `quize_game_user_result` VALUES (134,'karan',4,1,'pass',15,'First_Step_Completed','First_Step',80),(137,'karan',5,0,'pass',15,'second_Step_Completed','Second_Step',100),(138,'shiv',4,1,'pass',15,'First_Step_Completed','First_Step',80),(139,'mangesh',2,3,'pass',15,'First_Step_Completed','First_Step',40),(140,'mangesh',0,1,'Fail',15,NULL,NULL,0),(141,'mahesh',1,4,'Fail',15,'First_Step_NOT_Completed','First_Step',20);
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

--
-- Table structure for table `survey_FORM`
--

DROP TABLE IF EXISTS `survey_FORM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_FORM` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `desg` varchar(45) DEFAULT NULL,
  `recommendFriend` varchar(45) DEFAULT NULL,
  `improvement` varchar(100) DEFAULT NULL,
  `comment` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_FORM`
--

LOCK TABLES `survey_FORM` WRITE;
/*!40000 ALTER TABLE `survey_FORM` DISABLE KEYS */;
INSERT INTO `survey_FORM` VALUES (1,'Karan','bainadekaran@gmail.com',23,'learner','maybe','puzzle Game,Quiz Game,query','It is Good.'),(2,'Karan','bainadekaran@gmail.com',23,'learner','maybe','puzzle Game,Quiz Game,query','It is Good.'),(3,'mangesh','mangesh@gmail.com',24,'student','maybe','puzzle Game,query','IT is good..!'),(4,'mangesh','mangesh@gmail.com',24,'student','maybe','puzzle Game,Quiz Game','irurt'),(5,'mangesh','mangesh@gmail.com',24,'student','maybe','puzzle Game,Quiz Game','irurt'),(6,'mangesh','mangesh@gmail.com',23,'job','maybe','Quiz Game,query','aarerre'),(7,'Mahesh','mahy@gmail.com',24,'other','maybe','puzzle Game,query','wrere');
/*!40000 ALTER TABLE `survey_FORM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_session_track`
--

DROP TABLE IF EXISTS `user_session_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_session_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `loginTime` varchar(45) DEFAULT NULL,
  `logoutTime` varchar(45) DEFAULT NULL,
  `totalSession` varchar(45) DEFAULT NULL,
  `gamePlayed` varchar(45) DEFAULT NULL,
  `onlineLearned` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session_track`
--

LOCK TABLES `user_session_track` WRITE;
/*!40000 ALTER TABLE `user_session_track` DISABLE KEYS */;
INSERT INTO `user_session_track` VALUES (1,'Karan','2019/05/31 17:53:23','2019/05/31 17:55:25','2','Yes','Yes'),(2,'Karan','2019/05/31 18:07:47','2019/05/31 18:07:49','0 minutes','Yes',NULL),(3,'Karan','2019/05/31 18:08:15','2019/05/31 18:10:06','1 minutes','Yes','Yes'),(4,'shiv','2019/05/31 18:11:42','2019/05/31 18:11:51','0 minutes','Yes','no'),(5,'Karan','2019/05/31 18:27:00','2019/05/31 18:27:09','0 minutes','Yes','no'),(6,'Karan','2019/05/31 18:30:52','2019/05/31 18:32:29','1 minutes','Yes','no'),(7,'Karan','2019/05/31 18:32:37','2019/05/31 18:55:50','23 minutes','Yes','no'),(8,'Karan','2019/05/31 18:55:52','2019/05/31 18:58:09','2 minutes','Yes','no'),(9,'Karan','2019/05/31 18:58:20','2019/05/31 19:01:23','3 minutes','Yes','no'),(10,'Karan','2019/05/31 19:01:25','2019/05/31 19:06:01','4 minutes','Yes','no'),(11,'Mahesh','2019/05/31 19:06:06','2019/05/31 19:06:57','0 minutes','Yes','no'),(12,'Karan','2019/05/31 19:07:22','2019/05/31 19:10:05','2 minutes','Yes','Yes'),(13,'shiv','2019/05/31 19:10:12','2019/05/31 19:13:30','3 minutes','Yes','Yes'),(14,'Karan','2019/05/31 19:13:31','2019/05/31 19:13:50','0 minutes','Yes','no'),(15,'Karan','2019/05/31 19:15:24','2019/05/31 19:31:36','16 minutes','Yes','no'),(16,'Karan','2019/06/01 10:44:50','2019/06/01 10:45:08','0 minutes','Yes','no'),(17,'shiv','2019/06/01 10:45:13','2019/06/01 10:45:23','0 minutes','Yes','no'),(18,'Karan','2019/06/01 11:52:38','2019/06/01 11:52:59','0 minutes','Yes','no'),(19,NULL,'2019/05/31 16:06:12','2019/05/31 16:36:14','30 minutes','No',NULL),(20,NULL,'2019/05/31 16:06:12','2019/05/31 16:36:14','30 minutes','No',NULL),(21,NULL,'2019/05/31 16:06:12','2019/05/31 16:36:14','30 minutes','No',NULL),(22,NULL,'2019/05/31 16:06:12','2019/05/31 17:36:14','90 minutes','No',NULL),(23,'shiv','2019/06/01 12:06:01','2019/06/01 12:06:57','0:0:56','Yes','Yes');
/*!40000 ALTER TABLE `user_session_track` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-01 12:11:53
