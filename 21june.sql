-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: GameCreationDB
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `OnlineLearningAnalysis`
--

DROP TABLE IF EXISTS `OnlineLearningAnalysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OnlineLearningAnalysis` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `howManyTimeLearned` int(11) DEFAULT NULL,
  `timeSpendedToLearn` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OnlineLearningAnalysis`
--

LOCK TABLES `OnlineLearningAnalysis` WRITE;
/*!40000 ALTER TABLE `OnlineLearningAnalysis` DISABLE KEYS */;
INSERT INTO `OnlineLearningAnalysis` VALUES (1,'Karan',1,'0:3:17'),(2,'Karan',2,'0:3:34'),(3,'Karan',3,'0:0:8'),(4,'shiv',1,'0:1:34'),(5,'Mahesh',1,'0:1:15');
/*!40000 ALTER TABLE `OnlineLearningAnalysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP`
--

DROP TABLE IF EXISTS `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `timeTaken` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP`
--

LOCK TABLES `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP` WRITE;
/*!40000 ALTER TABLE `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP` DISABLE KEYS */;
INSERT INTO `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP` VALUES (1,'suyesh','11'),(2,'Mahesh','16'),(3,'Mahesh','10'),(4,'Mahesh','0:0:13');
/*!40000 ALTER TABLE `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP`
--

DROP TABLE IF EXISTS `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `timeTaken` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP`
--

LOCK TABLES `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP` WRITE;
/*!40000 ALTER TABLE `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP` DISABLE KEYS */;
/*!40000 ALTER TABLE `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP`
--

DROP TABLE IF EXISTS `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `timeTaken` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP`
--

LOCK TABLES `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP` WRITE;
/*!40000 ALTER TABLE `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP` DISABLE KEYS */;
/*!40000 ALTER TABLE `PUZZLE_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP`
--

DROP TABLE IF EXISTS `PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `timeTaken` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP`
--

LOCK TABLES `PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP` WRITE;
/*!40000 ALTER TABLE `PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP` DISABLE KEYS */;
/*!40000 ALTER TABLE `PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_HARD_STEP`
--

DROP TABLE IF EXISTS `PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_HARD_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_HARD_STEP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `timeTaken` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_HARD_STEP`
--

LOCK TABLES `PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_HARD_STEP` WRITE;
/*!40000 ALTER TABLE `PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_HARD_STEP` DISABLE KEYS */;
/*!40000 ALTER TABLE `PUZZLE_GAME_User_List_TO_Take_More_Time_Complete_HARD_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUZZLE_GAME_User_List_TO_take_More_Time_complete_MEDIUM_STEP`
--

DROP TABLE IF EXISTS `PUZZLE_GAME_User_List_TO_take_More_Time_complete_MEDIUM_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PUZZLE_GAME_User_List_TO_take_More_Time_complete_MEDIUM_STEP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `timeTaken` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUZZLE_GAME_User_List_TO_take_More_Time_complete_MEDIUM_STEP`
--

LOCK TABLES `PUZZLE_GAME_User_List_TO_take_More_Time_complete_MEDIUM_STEP` WRITE;
/*!40000 ALTER TABLE `PUZZLE_GAME_User_List_TO_take_More_Time_complete_MEDIUM_STEP` DISABLE KEYS */;
/*!40000 ALTER TABLE `PUZZLE_GAME_User_List_TO_take_More_Time_complete_MEDIUM_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP`
--

DROP TABLE IF EXISTS `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `timeTaken` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP`
--

LOCK TABLES `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP` WRITE;
/*!40000 ALTER TABLE `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP` DISABLE KEYS */;
/*!40000 ALTER TABLE `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_EASY_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP`
--

DROP TABLE IF EXISTS `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `timeTaken` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP`
--

LOCK TABLES `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP` WRITE;
/*!40000 ALTER TABLE `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP` DISABLE KEYS */;
INSERT INTO `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP` VALUES (1,'shiv','0:0:15');
/*!40000 ALTER TABLE `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_HARD_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP`
--

DROP TABLE IF EXISTS `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `timeTaken` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP`
--

LOCK TABLES `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP` WRITE;
/*!40000 ALTER TABLE `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP` DISABLE KEYS */;
INSERT INTO `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP` VALUES (1,'shiv','0:0:17');
/*!40000 ALTER TABLE `QUIZ_GAME_User_List_TO_Take_Less_Time_Complete_MEDIUM_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP`
--

DROP TABLE IF EXISTS `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `timeTaken` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP`
--

LOCK TABLES `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP` WRITE;
/*!40000 ALTER TABLE `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP` DISABLE KEYS */;
INSERT INTO `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP` VALUES (1,'mahesh','0:0:27'),(2,'shiv','0:0:33');
/*!40000 ALTER TABLE `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_EASY_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_HARD_STEP`
--

DROP TABLE IF EXISTS `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_HARD_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_HARD_STEP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `timeTaken` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_HARD_STEP`
--

LOCK TABLES `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_HARD_STEP` WRITE;
/*!40000 ALTER TABLE `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_HARD_STEP` DISABLE KEYS */;
/*!40000 ALTER TABLE `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_HARD_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_MEDIUM_STEP`
--

DROP TABLE IF EXISTS `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_MEDIUM_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_MEDIUM_STEP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `timeTaken` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_MEDIUM_STEP`
--

LOCK TABLES `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_MEDIUM_STEP` WRITE;
/*!40000 ALTER TABLE `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_MEDIUM_STEP` DISABLE KEYS */;
INSERT INTO `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_MEDIUM_STEP` VALUES (1,'karan','0:1:13'),(2,'karan','0:1:13'),(3,'mahesh','0:2:3');
/*!40000 ALTER TABLE `QUIZ_GAME_User_List_TO_Take_More_Time_Complete_MEDIUM_STEP` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puzzle_game`
--

LOCK TABLES `puzzle_game` WRITE;
/*!40000 ALTER TABLE `puzzle_game` DISABLE KEYS */;
INSERT INTO `puzzle_game` VALUES (2,'Mahesh',3,5,13),(3,NULL,0,0,0),(4,NULL,0,0,0),(5,'shiv',0,0,0),(9,'mangesh',0,0,0),(10,'mangesh',3,6,30),(11,'mangesh',4,10,62),(12,'mangesh',5,34,224),(13,'Karan',0,0,0),(14,'Karan',3,7,27),(15,'Karan',4,19,138),(16,'shiv',3,11,37),(17,'suyesh',0,0,0),(18,'suyesh',3,5,11),(19,NULL,0,0,0);
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
  `stepWisePercentage` int(10) DEFAULT NULL,
  `totalObtainedMarks` int(10) DEFAULT NULL,
  `totalObtainedPercentage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quize_game_user_result`
--

LOCK TABLES `quize_game_user_result` WRITE;
/*!40000 ALTER TABLE `quize_game_user_result` DISABLE KEYS */;
INSERT INTO `quize_game_user_result` VALUES (14,'mangesh',3,2,'pass',15,'First_Step_Completed','First_Step',60,3,'60.0%'),(15,'mangesh',2,3,'pass',15,'second_Step_Completed','Second_Step',40,5,'50.00%'),(23,'mangesh',1,4,'Fail',15,'second_Step_Completed','Third_Step',20,0,NULL),(25,'suyesh',0,1,'Fail',15,NULL,NULL,0,0,NULL),(30,'suyesh',4,1,'pass',15,'First_Step_Completed','First_Step',80,4,'80.0%'),(31,'suyesh',5,0,'pass',15,'second_Step_Completed','Second_Step',100,9,'90.00%'),(33,'karan',4,1,'pass',15,'First_Step_Completed','First_Step',80,4,'80.0%'),(34,'karan',5,0,'pass',15,'second_Step_Completed','Second_Step',100,9,'90.00%'),(35,'mahesh',4,1,'pass',15,'First_Step_Completed','First_Step',80,4,'80.0%'),(36,'mahesh',4,1,'pass',15,'second_Step_Completed','Second_Step',80,8,'80.00%'),(37,'shiv',4,1,'pass',15,'First_Step_Completed','First_Step',80,4,'80.0%'),(38,'shiv',4,1,'pass',15,'second_Step_Completed','Second_Step',80,8,'80.00%'),(39,'shiv',5,0,'pass',15,'Third_Step_Completed','Third_Step',100,13,'86.67%');
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
INSERT INTO `registration` VALUES ('Karan','bainadekaran@gmail.com','8600944611','12/02/1994','karan','123','pune.','Admin'),('Mahesh','mahy@gmail.com','9874563210','11/12/1999','mahesh','123','pune',NULL),('mangesh','mangesh@gmail.com','9874561230','13/12/1999','mangesh','123','pune',NULL),('shiv','shiv@gmail.com','9874563210','25/10/2015','shiv','123','katraj','Users'),('suyesh','su@gmail.com','789654123','12/02/1994','suyesh','123','pune',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_FORM`
--

LOCK TABLES `survey_FORM` WRITE;
/*!40000 ALTER TABLE `survey_FORM` DISABLE KEYS */;
INSERT INTO `survey_FORM` VALUES (1,'Karan','bainadekaran@gmail.com',23,'learner','maybe','puzzle Game,Quiz Game,query','It is Good.'),(2,'Karan','bainadekaran@gmail.com',23,'learner','maybe','puzzle Game,Quiz Game,query','It is Good.'),(3,'mangesh','mangesh@gmail.com',24,'student','maybe','puzzle Game,query','IT is good..!'),(4,'mangesh','mangesh@gmail.com',24,'student','maybe','puzzle Game,Quiz Game','irurt'),(5,'mangesh','mangesh@gmail.com',24,'student','maybe','puzzle Game,Quiz Game','irurt'),(6,'mangesh','mangesh@gmail.com',23,'job','maybe','Quiz Game,query','aarerre'),(7,'Mahesh','mahy@gmail.com',24,'other','maybe','puzzle Game,query','wrere'),(8,'karan','ba@gmail.com',23,'job','maybe','puzzle Game,Quiz Game','2134edf'),(9,'karan','ba@gmail.com',23,'job','notSure','Quiz Game','afa');
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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session_track`
--

LOCK TABLES `user_session_track` WRITE;
/*!40000 ALTER TABLE `user_session_track` DISABLE KEYS */;
INSERT INTO `user_session_track` VALUES (1,'Karan','2019/05/31 17:53:23','2019/05/31 17:55:25','2','Yes','Yes'),(2,'Karan','2019/05/31 18:07:47','2019/05/31 18:07:49','0 minutes','Yes',NULL),(3,'Karan','2019/05/31 18:08:15','2019/05/31 18:10:06','1 minutes','Yes','Yes'),(4,'shiv','2019/05/31 18:11:42','2019/05/31 18:11:51','0 minutes','Yes','no'),(5,'Karan','2019/05/31 18:27:00','2019/05/31 18:27:09','0 minutes','Yes','no'),(6,'Karan','2019/05/31 18:30:52','2019/05/31 18:32:29','1 minutes','Yes','no'),(7,'Karan','2019/05/31 18:32:37','2019/05/31 18:55:50','23 minutes','Yes','no'),(8,'Karan','2019/05/31 18:55:52','2019/05/31 18:58:09','2 minutes','Yes','no'),(9,'Karan','2019/05/31 18:58:20','2019/05/31 19:01:23','3 minutes','Yes','no'),(10,'Karan','2019/05/31 19:01:25','2019/05/31 19:06:01','4 minutes','Yes','no'),(11,'Mahesh','2019/05/31 19:06:06','2019/05/31 19:06:57','0 minutes','Yes','no'),(12,'Karan','2019/05/31 19:07:22','2019/05/31 19:10:05','2 minutes','Yes','Yes'),(13,'shiv','2019/05/31 19:10:12','2019/05/31 19:13:30','3 minutes','Yes','Yes'),(14,'Karan','2019/05/31 19:13:31','2019/05/31 19:13:50','0 minutes','Yes','no'),(15,'Karan','2019/05/31 19:15:24','2019/05/31 19:31:36','16 minutes','Yes','no'),(16,'Karan','2019/06/01 10:44:50','2019/06/01 10:45:08','0 minutes','Yes','no'),(17,'shiv','2019/06/01 10:45:13','2019/06/01 10:45:23','0 minutes','Yes','no'),(18,'Karan','2019/06/01 11:52:38','2019/06/01 11:52:59','0 minutes','Yes','no'),(19,NULL,'2019/05/31 16:06:12','2019/05/31 16:36:14','30 minutes','No',NULL),(20,NULL,'2019/05/31 16:06:12','2019/05/31 16:36:14','30 minutes','No',NULL),(21,NULL,'2019/05/31 16:06:12','2019/05/31 16:36:14','30 minutes','No',NULL),(22,NULL,'2019/05/31 16:06:12','2019/05/31 17:36:14','90 minutes','No',NULL),(23,'shiv','2019/06/01 12:06:01','2019/06/01 12:06:57','0:0:56','Yes','Yes'),(24,'Karan','2019/06/04 12:18:52','2019/06/04 12:19:49','0:1:-3','Yes','no'),(25,'Karan','2019/06/04 12:25:52','2019/06/04 12:25:58','0:0:6','Yes','no'),(26,'Mahesh','2019/06/04 12:26:05','2019/06/04 12:27:26','0:1:21','Yes','no'),(27,'Karan','2019/06/04 12:27:38','2019/06/04 12:29:37','0:2:-1','Yes','no'),(28,'Karan','2019/06/04 12:29:42','2019/06/04 12:32:12','0:3:-30','Yes','no'),(29,'Karan','2019/06/04 12:32:25','2019/06/04 12:33:48','0:1:23','Yes','no'),(30,'Karan','2019/06/04 12:33:56','2019/06/04 12:34:23','0:1:-33','Yes','no'),(31,'Karan','2019/06/04 12:34:38','2019/06/04 12:41:01','0:7:-37','Yes','no'),(32,'Karan','2019/06/04 12:41:10','2019/06/04 12:43:15','0:2:5','Yes','no'),(33,'Karan','2019/06/04 12:44:04','2019/06/04 12:45:28','0:1:24','Yes','no'),(34,'shiv','2019/06/04 12:45:33','2019/06/04 12:47:18','0:2:-15','Yes','no'),(35,'Mahesh','2019/06/04 12:47:22','2019/06/04 12:47:51','0:0:29','Yes','no'),(36,'Karan','2019/06/04 12:47:56','2019/06/04 12:52:13','0:5:-43','Yes','no'),(37,'Karan','2019/06/04 12:52:26','2019/06/04 12:52:32','0:0:6','Yes','no'),(38,'mangesh','2019/06/04 12:53:01','2019/06/04 12:53:06','0:0:5','Yes','no'),(39,'Mahesh','2019/06/04 12:53:10','2019/06/04 12:53:16','0:0:6','Yes','no'),(40,'shiv','2019/06/04 12:53:20','2019/06/04 13:00:58','1:-53:38','Yes','no'),(41,'Karan','2019/06/04 13:01:36','2019/06/04 13:01:54','0:0:18','Yes','no'),(42,'Mahesh','2019/06/04 13:02:02','2019/06/04 13:02:06','0:0:4','Yes','no'),(43,'shiv','2019/06/04 13:02:10','2019/06/04 13:04:32','0:2:22','Yes','no'),(44,'shiv','2019/06/04 13:04:49','2019/06/04 13:05:12','0:1:-37','Yes','no'),(45,'Karan','2019/06/04 13:05:22','2019/06/04 13:07:03','0:2:-19','Yes','no'),(46,'shiv','2019/06/04 13:07:08','2019/06/04 13:36:23','0:29:15','Yes','no'),(47,'Karan','2019/06/04 14:16:00','2019/06/04 14:17:16','0:1:16','Yes','no'),(48,'Karan','2019/06/04 14:17:34','2019/06/04 14:19:56','0:2:22','Yes','no'),(49,'Karan','2019/06/04 14:24:57','2019/06/04 14:25:07','0:1:-50','Yes','no'),(50,'shiv','2019/06/04 14:25:12','2019/06/04 14:38:13','0:13:1','No','no'),(51,'Karan','2019/06/04 14:38:25','2019/06/04 14:41:12','0:3:-13','Yes','no'),(52,'Karan','2019/06/04 14:41:21','2019/06/04 14:42:59','0:1:38','Yes','no'),(53,'Mahesh','2019/06/04 14:43:05','2019/06/04 14:43:36','0:0:31','Yes','no'),(54,'shiv','2019/06/04 14:43:40','2019/06/04 14:45:09','0:2:-31','Yes','no'),(55,'Karan','2019/06/04 14:46:00','2019/06/04 14:46:07','0:0:7','Yes','no'),(56,'shiv','2019/06/04 14:46:11','2019/06/04 14:46:20','0:0:9','Yes','no'),(57,'Mahesh','2019/06/04 14:46:24','2019/06/04 14:47:30','0:1:6','Yes','no'),(58,'Karan','2019/06/04 14:47:37','2019/06/04 14:47:51','0:0:14','Yes','no'),(59,'Karan','2019/06/04 15:03:30','2019/06/04 15:03:39','0:0:9','Yes','no'),(60,'shiv','2019/06/04 15:04:57','2019/06/04 15:05:03','0:1:-54','Yes','no'),(61,NULL,'2019/06/04 15:04:57','2019/06/04 15:05:03','0:1:54','No',NULL),(62,'Karan','2019/06/04 15:05:07','2019/06/04 15:21:22','0:16:15','Yes','Yes'),(63,'Mahesh','2019/06/04 15:21:26','2019/06/04 15:21:43','0:0:17','Yes','no'),(64,'Karan','2019/06/04 15:21:49','2019/06/04 15:23:38','0:2:11','Yes','no'),(65,'shiv','2019/06/04 15:23:42','2019/06/04 15:23:57','0:0:15','Yes','no'),(66,'Mahesh','2019/06/04 15:24:00','2019/06/04 15:24:05','0:0:5','Yes','no'),(67,'Karan','2019/06/04 15:24:09','2019/06/04 15:56:25','0:32:16','Yes','no'),(68,'Karan','2019/06/04 16:03:07','2019/06/04 16:03:24','0:0:17','Yes','no'),(69,'Mahesh','2019/06/04 16:03:28','2019/06/04 16:03:33','0:0:5','Yes','no'),(70,'shiv','2019/06/04 16:03:38','2019/06/04 16:06:27','0:3:11','Yes','no'),(71,'Mahesh','2019/06/04 16:06:34','2019/06/04 16:06:44','0:0:10','Yes','no'),(72,'suyesh','2019/06/04 16:09:23','2019/06/04 16:17:30','0:8:7','Yes','Yes'),(73,'suyesh','2019/06/04 16:09:23','2019/06/04 16:17:30','0:8:7','Yes','Yes'),(74,'suyesh','2019/06/04 16:18:11','2019/06/04 16:33:18','0:15:7','Yes','no'),(75,'Karan','2019/06/04 20:05:04','2019/06/04 20:05:10','0:0:6','Yes','no'),(76,'Karan','2019/06/04 20:13:23','2019/06/04 20:13:35','0:0:12','Yes','no'),(77,'mangesh','2019/06/04 20:13:40','2019/06/04 20:13:55','0:0:15','Yes','no'),(78,'shiv','2019/06/04 20:13:59','2019/06/04 20:14:11','0:1:48','Yes','no'),(79,'Mahesh','2019/06/04 20:14:16','2019/06/04 20:14:21','0:0:5','Yes','no'),(80,'Karan','2019/06/05 11:34:30','2019/06/05 11:36:30','0:2:0','Yes','no'),(81,'shiv','2019/06/05 11:43:19','2019/06/05 11:43:39','0:0:20','Yes','no'),(82,'Karan','2019/06/05 11:49:09','2019/06/05 11:50:39','0:1:30','Yes','no'),(83,'mangesh','2019/06/05 11:51:19','2019/06/05 12:06:18','1:45:1','Yes','no'),(84,'Karan','2019/06/05 12:06:26','2019/06/05 12:10:39','0:4:13','Yes','no'),(85,'Karan','2019/06/05 12:11:01','2019/06/05 12:12:46','0:1:45','Yes','no'),(86,'Karan','2019/06/05 12:12:59','2019/06/05 12:23:29','0:11:30','Yes','no'),(87,'Karan','2019/06/05 13:02:49','2019/06/05 13:21:54','0:19:5','Yes','Yes'),(88,'Karan','2019/06/05 14:38:17','2019/06/05 14:39:15','0:1:2','Yes','no'),(89,'mangesh','2019/06/05 14:39:20','2019/06/05 15:27:24','1:12:4','Yes','Yes'),(90,'suyesh','2019/06/20 18:15:53','2019/06/20 18:22:03','0:7:50','Yes','no'),(91,'suyesh','2019/06/20 18:24:48','2019/06/20 18:45:42','0:21:6','Yes','no'),(92,'suyesh','2019/06/20 18:45:54','2019/06/20 19:04:57','1:41:3','Yes','no'),(93,'Karan','2019/06/20 19:05:04','2019/06/20 19:35:52','0:30:48','Yes','no'),(94,'suyesh','2019/06/20 19:36:02','2019/06/20 19:48:47','0:12:45','Yes','no'),(95,'shiv','2019/06/21 11:25:57','2019/06/21 11:26:02','0:1:55','Yes','no'),(96,'Karan','2019/06/21 11:27:17','2019/06/21 11:47:15','0:20:2','Yes','no'),(97,'Karan','2019/06/21 11:47:26','2019/06/21 12:12:55','1:35:29','Yes','no'),(98,'Mahesh','2019/06/21 12:13:18','2019/06/21 12:19:20','0:6:2','Yes','no'),(99,'Mahesh','2019/06/21 12:19:28','2019/06/21 12:23:22','0:4:6','Yes','no'),(100,'Mahesh','2019/06/21 12:23:41','2019/06/21 12:26:28','0:3:13','Yes','no'),(101,'Karan','2019/06/21 12:26:34','2019/06/21 12:26:52','0:0:18','Yes','no'),(102,'mangesh','2019/06/21 12:27:00','2019/06/21 12:27:05','0:0:5','Yes','no'),(103,'shiv','2019/06/21 12:27:14','2019/06/21 12:32:14','0:5:0','Yes','no'),(104,'Mahesh','2019/06/21 12:32:22','2019/06/21 12:43:44','0:11:22','Yes','Yes');
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

-- Dump completed on 2019-06-21 18:05:43
