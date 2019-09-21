/*
SQLyog Enterprise - MySQL GUI v8.14 
MySQL - 5.0.45-community-nt : Database - gamecreationdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gamecreationdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `gamecreationdb`;

/*Table structure for table `idlesessionlogoutdetail` */

DROP TABLE IF EXISTS `idlesessionlogoutdetail`;

CREATE TABLE `idlesessionlogoutdetail` (
  `id` int(100) NOT NULL auto_increment,
  `userName` varchar(100) default NULL,
  `pageNameWhereSessionInActivate` varchar(100) default NULL,
  `timeWhenSessionInActivate` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

/*Data for the table `idlesessionlogoutdetail` */

insert  into `idlesessionlogoutdetail`(`id`,`userName`,`pageNameWhereSessionInActivate`,`timeWhenSessionInActivate`) values (1,'shiv','homepage','6/27/2019, 5:51:37 PM'),(2,'shiv','searchQuery PAGE','6/27/2019, 5:52:16 PM'),(3,'shiv','pdfViewer PAGE','6/27/2019, 5:52:42 PM'),(4,'shiv','game PAGE','6/27/2019, 5:53:19 PM'),(5,'shiv','puzzle_game PAGE','6/27/2019, 5:53:43 PM'),(6,'shiv','quiz PAGE','6/27/2019, 5:54:04 PM'),(7,'shiv','survey PAGE','6/27/2019, 5:54:24 PM'),(8,'shiv','homepage','6/27/2019, 6:01:54 PM'),(9,'karan','searchQuery PAGE','6/27/2019, 6:05:43 PM'),(10,'shiv','game PAGE','7/21/2019, 9:27:22 AM'),(11,'shiv','game PAGE','7/21/2019, 9:28:50 AM'),(12,'shiv','game PAGE','7/21/2019, 9:32:15 AM'),(13,'adheerap','homepage','7/31/2019, 4:29:44 PM'),(14,'dhruvg','homepage','8/5/2019, 12:21:20 PM'),(15,'nehad','puzzle_game PAGE','8/5/2019, 12:38:22 PM'),(16,'nileshp','puzzle_game PAGE','8/5/2019, 2:30:36 PM'),(17,'premg','homepage','8/7/2019, 2:31:59 PM'),(18,'rajdeepp','puzzle_game PAGE','8/7/2019, 2:40:38 PM'),(19,'rajdeepp','puzzle_game PAGE','8/7/2019, 2:56:40 PM'),(20,'ranjeetp','puzzle_game PAGE','8/8/2019, 11:16:10 AM'),(21,'ruturajp','searchQuery PAGE','8/8/2019, 11:54:19 AM'),(22,'sachinp','puzzle_game PAGE','8/8/2019, 12:24:58 PM'),(23,'sachinp','puzzle_game PAGE','8/8/2019, 12:27:40 PM'),(24,'sachinp','puzzle_game PAGE','8/8/2019, 12:28:55 PM'),(25,'sanketd','puzzle_game PAGE','8/8/2019, 6:39:40 PM'),(26,'sanketd','puzzle_game PAGE','8/8/2019, 6:42:12 PM'),(27,'aadhyap','puzzle_game PAGE','8/10/2019, 12:55:04 PM'),(28,'aadhyap','puzzle_game PAGE','?8?/?12?/?2019? ?2?:?08?:?15? ?PM'),(29,'aishwaryap','puzzle_game PAGE','?8?/?12?/?2019? ?2?:?10?:?48? ?PM'),(30,'karan','puzzle_game PAGE','?8?/?12?/?2019? ?2?:?22?:?02? ?PM'),(31,'karan','puzzle_game PAGE','?8?/?12?/?2019? ?2?:?28?:?30? ?PM'),(32,'karan','puzzle_game PAGE','?8?/?12?/?2019? ?2?:?29?:?08? ?PM'),(33,'karan','puzzle_game PAGE','?8?/?12?/?2019? ?2?:?29?:?08? ?PM'),(34,'karan','puzzle_game PAGE','?8?/?12?/?2019? ?2?:?30?:?13? ?PM'),(35,'karan','homepage','?8?/?12?/?2019? ?2?:?38?:?57? ?PM'),(36,'aadhyap','puzzle_game PAGE','8/12/2019, 2:42:43 PM'),(37,'aadhyap','puzzle_game PAGE','8/12/2019, 2:50:57 PM'),(38,'aadhyap','puzzle_game PAGE','8/12/2019, 2:52:17 PM'),(39,'aadhyap','puzzle_game PAGE','8/12/2019, 3:01:26 PM'),(40,'aadhyap','homepage','8/12/2019, 3:04:57 PM'),(41,'aadhyap','homepage','8/12/2019, 3:08:52 PM'),(42,'aadhyap','homepage','8/12/2019, 3:10:14 PM'),(43,'aadhyap','game PAGE','8/12/2019, 3:15:46 PM'),(44,'aadhyap','homepage','8/12/2019, 3:22:52 PM'),(45,'aishwaryap','puzzle_game PAGE','8/12/2019, 3:36:25 PM'),(46,'aishwaryap','puzzle_game PAGE','8/12/2019, 3:39:02 PM'),(47,'aishwaryap','puzzle_game PAGE','8/12/2019, 3:39:53 PM'),(48,'dhruvg','homepage','8/12/2019, 4:17:36 PM'),(49,'dhruvg','puzzle_game PAGE','8/12/2019, 4:20:09 PM'),(50,'gurunaths','homepage','8/12/2019, 4:43:55 PM'),(51,'rajeshs','puzzle_game PAGE','8/19/2019, 2:06:16 PM'),(52,'rajeshs','homepage','8/19/2019, 2:06:55 PM'),(53,'rajeshs','puzzle_game PAGE','8/19/2019, 2:14:45 PM'),(54,'ranjeetp','puzzle_game PAGE','8/19/2019, 5:20:26 PM'),(55,'ranjeetp','puzzle_game PAGE','8/19/2019, 5:25:06 PM'),(56,'ruturajp','puzzle_game PAGE','8/19/2019, 6:02:40 PM'),(57,'ruturajp','puzzle_game PAGE','8/19/2019, 6:03:48 PM'),(58,'ruturajp','puzzle_game PAGE','8/19/2019, 6:06:11 PM'),(59,'sanketd','puzzle_game PAGE','8/19/2019, 6:54:16 PM'),(60,'sanketd','puzzle_game PAGE','8/19/2019, 6:55:36 PM'),(61,'sanketd','puzzle_game PAGE','8/19/2019, 6:56:42 PM'),(62,'tanishkap','puzzle_game PAGE','8/20/2019, 5:33:37 PM'),(63,'adheerap','puzzle_game PAGE','8/21/2019, 11:40:26 AM'),(64,'rajeshs','puzzle_game PAGE','8/21/2019, 12:00:31 PM'),(65,'rajeshs','puzzle_game PAGE','8/21/2019, 12:01:11 PM');

/*Table structure for table `onlinelearninganalysis` */

DROP TABLE IF EXISTS `onlinelearninganalysis`;

CREATE TABLE `onlinelearninganalysis` (
  `userID` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `howManyTimeLearned` int(11) default NULL,
  `timeSpendedToLearn` varchar(45) default NULL,
  PRIMARY KEY  (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

/*Data for the table `onlinelearninganalysis` */

insert  into `onlinelearninganalysis`(`userID`,`userName`,`howManyTimeLearned`,`timeSpendedToLearn`) values (1,'aadhyap',1,'0:0:33'),(2,'aishwaryap',1,'0:0:48'),(3,'adheerap',1,'0:0:54'),(4,'adheerap',2,'0:0:20'),(5,'dhanarajP',1,'0:0:38'),(6,'dhanarajP',2,'0:1:20'),(7,'dhruvg',1,'0:1:16'),(8,'nehad',1,'0:0:54'),(9,'nehad',2,'0:0:42'),(10,'nileshp',1,'0:0:37'),(11,'nileshp',2,'0:0:35'),(12,'ompawar',1,'0:0:9'),(13,'premg',1,'0:0:26'),(14,'rajdeepp',1,'0:0:16'),(15,'rajdeepp',2,'0:0:33'),(16,'rajdeepp',3,'0:0:26'),(17,'rajeshs',1,'0:1:31'),(18,'ranjeetp',1,'0:0:26'),(19,'ranjeetp',2,'0:0:23'),(20,'rohitmhatre',1,'0:0:18'),(21,'rushikeshl',1,'0:0:23'),(22,'ruturajp',1,'0:1:23'),(23,'sachinp',1,'0:0:29'),(24,'sachinp',2,'0:0:19'),(25,'sachinp',3,'0:0:10'),(26,'sachinp',4,'0:0:16'),(27,'sainap',1,'0:0:40'),(28,'sanketd',1,'0:0:10'),(29,'sanketd',2,'0:0:6'),(30,'sanketd',3,'0:0:54'),(31,'shubhamc',1,'0:0:42'),(32,'tanishkap',1,'0:0:25'),(33,'tanmayp',1,'0:0:35'),(34,'aadhyap',2,'0:0:23'),(35,'aadhyap',3,'0:0:9'),(36,'aadhyap',4,'0:1:43'),(37,'aadhyap',5,'0:0:20'),(38,'aadhyap',6,'0:0:12'),(39,'aadhyap',7,'0:0:26'),(40,'aadhyap',8,'0:0:36'),(41,'aadhyap',9,'0:0:12'),(42,'aishwaryap',2,'0:0:13'),(43,'karan',1,'0:0:31'),(44,'aadhyap',10,'0:0:18'),(45,'aishwaryap',3,'0:0:20'),(46,'aishwaryap',4,'0:0:35'),(47,'aishwaryap',5,'0:0:13'),(48,'nehad',3,'0:0:23'),(49,'premg',2,'0:0:26'),(50,'premg',3,'0:0:34'),(51,'rajdeepp',4,'0:0:19'),(52,'rajdeepp',5,'0:0:6'),(53,'rajeshs',2,'0:0:12'),(54,'rajeshs',3,'0:0:13'),(55,'rajeshs',4,'0:0:11'),(56,'ranjeetp',3,'0:0:16'),(57,'ranjeetp',4,'0:0:4'),(58,'ranjeetp',5,'0:0:31'),(59,'ranjeetp',6,'0:0:16'),(60,'rohitmhatre',2,'0:0:14'),(61,'rohitmhatre',3,'0:0:3'),(62,'rushikeshl',2,'0:0:33'),(63,'rushikeshl',3,'0:0:6'),(64,'ruturajp',2,'0:0:7'),(65,'ruturajp',3,'0:0:4'),(66,'ruturajp',4,'0:0:18'),(67,'sachinp',5,'0:0:8'),(68,'sachinp',6,'0:0:2'),(69,'sainap',2,'0:0:15'),(70,'sainap',3,'0:0:7'),(71,'sanketd',4,'0:0:5'),(72,'sanketd',5,'0:0:2'),(73,'sanketd',6,'0:0:6'),(74,'sanketd',7,'0:0:8'),(75,'sanketd',8,'0:0:21'),(76,'shubhamc',2,'0:0:16'),(77,'shubhamc',3,'0:0:12'),(78,'tanishkap',2,'0:0:24'),(79,'tanishkap',3,'0:0:31'),(80,'tanishkap',4,'0:0:10'),(81,'tanmayp',2,'0:0:15'),(82,'tanmayp',3,'0:0:8'),(83,'adheerap',3,'0:0:7'),(84,'adheerap',4,'0:0:9'),(85,'rajeshs',5,'0:0:5');

/*Table structure for table `puzzle_game` */

DROP TABLE IF EXISTS `puzzle_game`;

CREATE TABLE `puzzle_game` (
  `userId` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `modeValue` int(11) default NULL,
  `steps` int(11) default NULL,
  `time` int(11) default NULL,
  PRIMARY KEY  (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

/*Data for the table `puzzle_game` */

insert  into `puzzle_game`(`userId`,`userName`,`modeValue`,`steps`,`time`) values (1,'aadhyap',0,0,0),(2,'aadhyap',3,10,66),(3,'aishwaryap',0,0,0),(4,'aishwaryap',3,4,72),(5,'adheerap',0,0,0),(6,'adheerap',3,9,110),(7,'dhanarajP',0,0,0),(8,'dhanarajP',3,3,32),(9,'dhruvg',0,0,0),(10,'dhruvg',3,2,11),(11,'nehad',0,0,0),(12,'nehad',3,5,27),(13,'nileshp',0,0,0),(14,'nileshp',3,6,47),(15,'ompawar',0,0,0),(16,'ompawar',3,6,36),(17,'premg',0,0,0),(18,'premg',3,4,30),(19,'rajdeepp',0,0,0),(20,'rajdeepp',3,7,30),(21,'rajeshs',0,0,0),(22,'rajeshs',3,6,33),(23,'ranjeetp',0,0,0),(24,'ranjeetp',3,14,97),(25,'rohitmhatre',0,0,0),(26,'rohitmhatre',3,4,24),(27,'rushikeshl',0,0,0),(28,'rushikeshl',3,3,22),(29,'ruturajp',0,0,0),(30,'ruturajp',3,5,37),(31,'sachinp',0,0,0),(32,'sachinp',3,9,60),(33,'sainap',0,0,0),(34,'sainap',3,5,33),(35,'sanketd',0,0,0),(36,'sanketd',3,12,62),(37,'shubhamc',0,0,0),(38,'shubhamc',3,10,58),(39,'tanishkap',0,0,0),(40,'tanishkap',3,5,38),(41,'tanmayp',0,0,0),(42,'tanmayp',3,5,51),(43,'aadhyap',4,21,202),(44,'karan',0,0,0),(45,'karan',3,8,59),(46,'aadhyap',5,64,324),(47,'adheerap',4,23,250),(48,'aishwaryap',4,26,151),(49,'aishwaryap',5,24,322),(50,'dhanarajP',4,11,110),(51,'dhanarajP',5,24,241),(52,'dhruvg',4,12,80),(53,'dhruvg',5,22,218),(54,'gurunaths',0,0,0),(55,'gurunaths',3,5,34),(56,'gurunaths',4,17,112),(57,'gurunaths',5,24,197),(58,'nileshp',4,14,118),(59,'nileshp',5,35,288),(60,'ompawar',4,12,168),(61,'ompawar',5,24,421),(62,'nehad',4,18,192),(63,'nehad',5,20,176),(64,'premg',4,10,88),(65,'premg',5,19,164),(66,'rajdeepp',4,20,148),(67,'rajdeepp',5,27,251),(68,'rajeshs',4,16,104),(69,'ranjeetp',4,12,74),(70,'ranjeetp',5,23,172),(71,'rohitmhatre',4,6,47),(72,'rohitmhatre',5,24,126),(73,'rushikeshl',4,14,77),(74,'rushikeshl',5,24,137),(75,'ruturajp',4,12,52),(76,'ruturajp',5,22,85),(77,'sachinp',4,14,47),(78,'sachinp',5,25,104),(79,'sainap',4,14,50),(80,'sainap',5,25,104),(81,'sanketd',4,9,32),(82,'sanketd',5,21,90),(83,'shubhamc',4,11,32),(84,'shubhamc',5,24,118),(85,'tanishkap',4,14,37),(86,'tanishkap',5,20,74),(87,'tanmayp',4,12,37),(88,'tanmayp',5,22,113),(89,'adheerap',5,19,79),(90,'rajeshs',5,23,68);

/*Table structure for table `puzzle_game_user_list_to_take_less_time_complete_easy_step` */

DROP TABLE IF EXISTS `puzzle_game_user_list_to_take_less_time_complete_easy_step`;

CREATE TABLE `puzzle_game_user_list_to_take_less_time_complete_easy_step` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `timeTaken` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `puzzle_game_user_list_to_take_less_time_complete_easy_step` */

insert  into `puzzle_game_user_list_to_take_less_time_complete_easy_step`(`id`,`userName`,`timeTaken`) values (1,'dhruvg','0:0:11'),(2,'nehad','0:0:27'),(3,'rohitmhatre','0:0:24'),(4,'rushikeshl','0:0:22');

/*Table structure for table `puzzle_game_user_list_to_take_less_time_complete_hard_step` */

DROP TABLE IF EXISTS `puzzle_game_user_list_to_take_less_time_complete_hard_step`;

CREATE TABLE `puzzle_game_user_list_to_take_less_time_complete_hard_step` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `timeTaken` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `puzzle_game_user_list_to_take_less_time_complete_hard_step` */

insert  into `puzzle_game_user_list_to_take_less_time_complete_hard_step`(`id`,`userName`,`timeTaken`) values (1,'gurunaths','0:3:17'),(2,'nehad','0:2:56'),(3,'premg','0:2:44'),(4,'ranjeetp','0:2:52'),(5,'rohitmhatre','0:2:6'),(6,'rushikeshl','0:2:17'),(7,'ruturajp','0:1:25'),(8,'sachinp','0:1:44'),(9,'sainap','0:1:44'),(10,'sanketd','0:1:30'),(11,'shubhamc','0:1:58'),(12,'tanishkap','0:1:14'),(13,'tanmayp','0:1:53'),(14,'adheerap','0:1:19'),(15,'rajeshs','0:1:8');

/*Table structure for table `puzzle_game_user_list_to_take_less_time_complete_medium_step` */

DROP TABLE IF EXISTS `puzzle_game_user_list_to_take_less_time_complete_medium_step`;

CREATE TABLE `puzzle_game_user_list_to_take_less_time_complete_medium_step` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `timeTaken` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `puzzle_game_user_list_to_take_less_time_complete_medium_step` */

insert  into `puzzle_game_user_list_to_take_less_time_complete_medium_step`(`id`,`userName`,`timeTaken`) values (1,'dhruvg','0:1:20'),(2,'premg','0:1:28'),(3,'ranjeetp','0:1:14'),(4,'rohitmhatre','0:0:47'),(5,'rushikeshl','0:1:17'),(6,'ruturajp','0:0:52'),(7,'sachinp','0:0:47'),(8,'sainap','0:0:50'),(9,'sanketd','0:0:32'),(10,'shubhamc','0:0:32'),(11,'tanishkap','0:0:37'),(12,'tanmayp','0:0:37');

/*Table structure for table `puzzle_game_user_list_to_take_more_time_complete_easy_step` */

DROP TABLE IF EXISTS `puzzle_game_user_list_to_take_more_time_complete_easy_step`;

CREATE TABLE `puzzle_game_user_list_to_take_more_time_complete_easy_step` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `timeTaken` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `puzzle_game_user_list_to_take_more_time_complete_easy_step` */

insert  into `puzzle_game_user_list_to_take_more_time_complete_easy_step`(`id`,`userName`,`timeTaken`) values (1,'aadhyap','0:1:6'),(2,'aishwaryap','0:1:12'),(3,'adheerap','0:1:50'),(4,'dhanarajP','0:0:32'),(5,'nileshp','0:0:47'),(6,'ompawar','0:0:36'),(7,'premg','0:0:30'),(8,'rajdeepp','0:0:30'),(9,'rajeshs','0:0:33'),(10,'ranjeetp','0:1:37'),(11,'ruturajp','0:0:37'),(12,'sachinp','0:1:0'),(13,'sainap','0:0:33'),(14,'sanketd','0:1:2'),(15,'shubhamc','0:0:58'),(16,'tanishkap','0:0:38'),(17,'tanmayp','0:0:51'),(18,'karan','0:0:59'),(19,'gurunaths','0:0:34');

/*Table structure for table `puzzle_game_user_list_to_take_more_time_complete_hard_step` */

DROP TABLE IF EXISTS `puzzle_game_user_list_to_take_more_time_complete_hard_step`;

CREATE TABLE `puzzle_game_user_list_to_take_more_time_complete_hard_step` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `timeTaken` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `puzzle_game_user_list_to_take_more_time_complete_hard_step` */

insert  into `puzzle_game_user_list_to_take_more_time_complete_hard_step`(`id`,`userName`,`timeTaken`) values (1,'aadhyap','0:5:24'),(2,'aishwaryap','0:5:22'),(3,'dhanarajP','0:4:1'),(4,'dhruvg','0:3:38'),(5,'nileshp','0:4:48'),(6,'ompawar','0:7:1'),(7,'rajdeepp','0:4:11');

/*Table structure for table `puzzle_game_user_list_to_take_more_time_complete_medium_step` */

DROP TABLE IF EXISTS `puzzle_game_user_list_to_take_more_time_complete_medium_step`;

CREATE TABLE `puzzle_game_user_list_to_take_more_time_complete_medium_step` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `timeTaken` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `puzzle_game_user_list_to_take_more_time_complete_medium_step` */

insert  into `puzzle_game_user_list_to_take_more_time_complete_medium_step`(`id`,`userName`,`timeTaken`) values (1,'aadhyap','0:3:22'),(2,'adheerap','0:4:10'),(3,'aishwaryap','0:2:31'),(4,'dhanarajP','0:1:50'),(5,'gurunaths','0:1:52'),(6,'nileshp','0:1:58'),(7,'ompawar','0:2:48'),(8,'nehad','0:3:12'),(9,'rajdeepp','0:2:28'),(10,'rajeshs','0:1:44');

/*Table structure for table `question_deatil` */

DROP TABLE IF EXISTS `question_deatil`;

CREATE TABLE `question_deatil` (
  `Qid` int(10) unsigned NOT NULL auto_increment,
  `quest` varchar(450) default NULL,
  `QA` varchar(450) default NULL,
  `QB` varchar(450) default NULL,
  `QC` varchar(450) default NULL,
  `QD` varchar(450) default NULL,
  `correctAns` varchar(450) default NULL,
  PRIMARY KEY  (`Qid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `question_deatil` */

insert  into `question_deatil`(`Qid`,`quest`,`QA`,`QB`,`QC`,`QD`,`correctAns`) values (1,'Which part of human ear converts sound vibrations into electrical signals ?','Hammer.','Stirrup .','Tympanic membrane','Cochlea','QD'),(2,'What do dolphins, bats and porpoise use?','Ultrasound.','Infrasound.','Both a and b.','None of them.','QA'),(3,'Our eyes detect light in','RGB form, Red Blue Green form','ROYGBIV, rainbow color form','The simple form of a particular color','none of these ways','QA'),(4,'Speed of sound depends upon','Temperature of the medium.','Pressure of the medium.','Temperature of source producing sound.','Temperature and pressure of medium.','QA'),(5,'Light can travel in ','air only.','It is defined as the bending of waves around the corners of an obstacle or through an aperture into the region of geometrical shadow of the obstacle/apertureReflection is Ligt.',' light passes through some medium and changes it\'s direction because of it','when light travels through a lens light is bent as it goes from air to glass and back to air again.','QC'),(6,'Light year is a unit of','time','distance','light','intensity of light','QB'),(7,'Light Emitting Diodes (LED) is used in fancy electronic devices such as toys emit','X-rays','ultraviolet light','visible light','radio waves','QC'),(8,'Sound waves in air are','transverse','longitudinal','electromagnetic','polarised','QB'),(9,'Intensity of sound has','an object existence','a subject existence','no existence','both subjective and objective existence','QA'),(10,'Sound of frequency below 20 Hz is called','audio sounds','infrasonic','ultrasonic','both subjective asupersonicsnd objective existence','QB'),(11,'Focal length of plane mirror is',' At infinity','Zero','Negative','None of these','QA'),(12,'Which of these travels faster: Sound or Light? ',' Sound',' Light','Both travel at the same speed','None of these','QB'),(13,'Sound waves do not travel through _______. ',' Solids','liquids',' Gases','vacuum','QD'),(14,' Sound and light waves both _________. ','Have similar wavelength ',' Obey the laws of reflection','Travel as longitudinal waves','Travel through vacuum','QB'),(15,' When sound travels through air, the air particles ____. ','Vibrate along the direction of wave propagation','Vibrate but not in any fixed direction ','Vibrate perpendicular to the direction of wave propagation ','Do not vibrate ','QA');

/*Table structure for table `quiz_game_user_list_to_take_less_time_complete_easy_step` */

DROP TABLE IF EXISTS `quiz_game_user_list_to_take_less_time_complete_easy_step`;

CREATE TABLE `quiz_game_user_list_to_take_less_time_complete_easy_step` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `timeTaken` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quiz_game_user_list_to_take_less_time_complete_easy_step` */

/*Table structure for table `quiz_game_user_list_to_take_less_time_complete_hard_step` */

DROP TABLE IF EXISTS `quiz_game_user_list_to_take_less_time_complete_hard_step`;

CREATE TABLE `quiz_game_user_list_to_take_less_time_complete_hard_step` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `timeTaken` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `quiz_game_user_list_to_take_less_time_complete_hard_step` */

insert  into `quiz_game_user_list_to_take_less_time_complete_hard_step`(`id`,`userName`,`timeTaken`) values (1,'shiv','0:0:15'),(2,'karan','0:0:9'),(3,'aadhyap','0:0:21'),(4,'aishwaryap','0:0:21'),(5,'dhanarajp','0:0:18'),(6,'dhruvg','0:0:30'),(7,'gurunaths','0:0:24'),(8,'premg','0:0:29'),(9,'ranjeetp','0:0:29'),(10,'ruturajp','0:0:33'),(11,'sainap','0:0:20'),(12,'sanketd','0:0:18'),(13,'shubhamc','0:0:24'),(14,'tanishkap','0:0:19'),(15,'tanmayp','0:0:25'),(16,'rajeshs','0:0:17');

/*Table structure for table `quiz_game_user_list_to_take_less_time_complete_medium_step` */

DROP TABLE IF EXISTS `quiz_game_user_list_to_take_less_time_complete_medium_step`;

CREATE TABLE `quiz_game_user_list_to_take_less_time_complete_medium_step` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `timeTaken` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `quiz_game_user_list_to_take_less_time_complete_medium_step` */

insert  into `quiz_game_user_list_to_take_less_time_complete_medium_step`(`id`,`userName`,`timeTaken`) values (1,'shiv','0:0:17'),(2,'aishwaryap','0:0:26'),(3,'dhruvg','0:0:22'),(4,'nehad','0:0:24'),(5,'ompawar','0:0:25'),(6,'rajdeepp','0:0:28'),(7,'rohitmhatre','0:0:27'),(8,'rushikeshl','0:0:23'),(9,'sachinp','0:0:25'),(10,'adheerap','0:0:23'),(11,'rajeshs','0:0:16');

/*Table structure for table `quiz_game_user_list_to_take_more_time_complete_easy_step` */

DROP TABLE IF EXISTS `quiz_game_user_list_to_take_more_time_complete_easy_step`;

CREATE TABLE `quiz_game_user_list_to_take_more_time_complete_easy_step` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `timeTaken` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table `quiz_game_user_list_to_take_more_time_complete_easy_step` */

insert  into `quiz_game_user_list_to_take_more_time_complete_easy_step`(`id`,`userName`,`timeTaken`) values (1,'mahesh','0:0:27'),(2,'shiv','0:0:33'),(3,'karan','0:1:32'),(4,'dhanarajp','1:59:7'),(5,'dhruvg','0:1:32'),(6,'nehad','0:0:40'),(7,'nileshp','0:1:26'),(8,'nileshp','0:1:26'),(9,'nileshp','0:1:3'),(10,'ompawar','0:0:34'),(11,'ompawar','0:1:0'),(12,'premg','0:1:21'),(13,'premg','0:1:14'),(14,'rajdeepp','0:0:43'),(15,'rajeshs','0:0:43'),(16,'rajeshs','0:0:43'),(17,'ranjeetp','0:0:31'),(18,'rohitmhatre','0:0:20'),(19,'rushikeshl','0:0:23'),(20,'ruturajp','0:1:22'),(21,'sachinp','0:0:24'),(22,'sainap','0:0:27'),(23,'sanketd','0:0:20'),(24,'shubhamc','0:0:26'),(25,'tanishkap','0:1:40'),(26,'tanmayp','0:0:24'),(27,'aadhyap','0:0:24'),(28,'aishwaryap','0:0:31'),(29,'gurunaths','0:0:22'),(30,'adheerap','0:1:28');

/*Table structure for table `quiz_game_user_list_to_take_more_time_complete_hard_step` */

DROP TABLE IF EXISTS `quiz_game_user_list_to_take_more_time_complete_hard_step`;

CREATE TABLE `quiz_game_user_list_to_take_more_time_complete_hard_step` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `timeTaken` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `quiz_game_user_list_to_take_more_time_complete_hard_step` */

insert  into `quiz_game_user_list_to_take_more_time_complete_hard_step`(`id`,`userName`,`timeTaken`) values (1,'karan','0:1:50'),(2,'aishwaryap','0:1:39'),(3,'nehad','0:1:37'),(4,'nileshp','1:59:24'),(5,'ompawar','0:1:28'),(6,'rajdeepp','0:1:38'),(7,'rohitmhatre','0:1:32'),(8,'rushikeshl','0:1:35'),(9,'sachinp','0:1:40'),(10,'adheerap','0:1:37');

/*Table structure for table `quiz_game_user_list_to_take_more_time_complete_medium_step` */

DROP TABLE IF EXISTS `quiz_game_user_list_to_take_more_time_complete_medium_step`;

CREATE TABLE `quiz_game_user_list_to_take_more_time_complete_medium_step` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `timeTaken` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `quiz_game_user_list_to_take_more_time_complete_medium_step` */

insert  into `quiz_game_user_list_to_take_more_time_complete_medium_step`(`id`,`userName`,`timeTaken`) values (1,'karan','0:1:13'),(2,'karan','0:1:13'),(3,'mahesh','0:2:3'),(4,'karan','0:1:50'),(5,'aadhyap','0:0:40'),(6,'dhanarajp','0:1:36'),(7,'gurunaths','0:1:35'),(8,'nileshp','0:0:31'),(9,'premg','0:1:12'),(10,'ranjeetp','0:1:28'),(11,'ruturajp','0:1:41'),(12,'sainap','0:1:30'),(13,'sanketd','0:1:45'),(14,'shubhamc','0:1:43'),(15,'tanishkap','0:1:45'),(16,'tanmayp','0:1:28');

/*Table structure for table `quize_game_user_result` */

DROP TABLE IF EXISTS `quize_game_user_result`;

CREATE TABLE `quize_game_user_result` (
  `userid` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `correctAnswer` int(11) default NULL,
  `incorrectAnswer` int(11) default NULL,
  `result` varchar(45) default NULL,
  `totalQuestion` int(11) default NULL,
  `stepCompletedName` varchar(45) default NULL,
  `usersteps` varchar(45) default NULL,
  `stepWisePercentage` int(10) default NULL,
  `totalObtainedMarks` int(10) default NULL,
  `totalObtainedPercentage` varchar(45) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;

/*Data for the table `quize_game_user_result` */

insert  into `quize_game_user_result`(`userid`,`userName`,`correctAnswer`,`incorrectAnswer`,`result`,`totalQuestion`,`stepCompletedName`,`usersteps`,`stepWisePercentage`,`totalObtainedMarks`,`totalObtainedPercentage`) values (14,'mangesh',3,2,'pass',15,'First_Step_Completed','First_Step',60,3,'60.0%'),(15,'mangesh',2,3,'pass',15,'second_Step_Completed','Second_Step',40,5,'50.00%'),(23,'mangesh',1,4,'Fail',15,'second_Step_Completed','Third_Step',20,0,NULL),(25,'suyesh',0,1,'Fail',15,NULL,NULL,0,0,NULL),(30,'suyesh',4,1,'pass',15,'First_Step_Completed','First_Step',80,4,'80.0%'),(31,'suyesh',5,0,'pass',15,'second_Step_Completed','Second_Step',100,9,'90.00%'),(35,'mahesh',4,1,'pass',15,'First_Step_Completed','First_Step',80,4,'80.0%'),(36,'mahesh',4,1,'pass',15,'second_Step_Completed','Second_Step',80,8,'80.00%'),(37,'shiv',4,1,'pass',15,'First_Step_Completed','First_Step',80,4,'80.0%'),(38,'shiv',4,1,'pass',15,'second_Step_Completed','Second_Step',80,8,'80.00%'),(39,'shiv',5,0,'pass',15,'Third_Step_Completed','Third_Step',100,13,'86.67%'),(41,'karan',4,1,'pass',15,'First_Step_Completed','First_Step',80,4,'80.0%'),(42,'karan',5,0,'pass',15,'second_Step_Completed','Second_Step',100,9,'90.00%'),(43,'karan',4,1,'pass',15,'Third_Step_Completed','Third_Step',80,13,'86.67%'),(44,'dhanarajp',3,2,'pass',15,'First_Step_Completed','First_Step',60,3,'60.0%'),(45,'dhruvg',2,3,'pass',15,'First_Step_Completed','First_Step',40,2,'40.0%'),(46,'nehad',3,2,'pass',15,'First_Step_Completed','First_Step',60,3,'60.0%'),(49,'nileshp',2,3,'pass',15,'First_Step_Completed','First_Step',40,2,'40.0%'),(51,'ompawar',2,3,'pass',15,'First_Step_Completed','First_Step',40,2,'40.0%'),(53,'premg',2,3,'pass',15,'First_Step_Completed','First_Step',40,2,'40.0%'),(54,'rajdeepp',5,0,'pass',15,'First_Step_Completed','First_Step',100,5,'100.0%'),(55,'rajeshs',4,1,'pass',15,'First_Step_Completed','First_Step',80,4,'80.0%'),(56,'rajeshs',4,1,'pass',15,'First_Step_Completed','First_Step',80,4,'80.0%'),(57,'ranjeetp',5,0,'pass',15,'First_Step_Completed','First_Step',100,5,'100.0%'),(58,'rohitmhatre',5,0,'pass',15,'First_Step_Completed','First_Step',100,5,'100.0%'),(59,'rushikeshl',5,0,'pass',15,'First_Step_Completed','First_Step',100,5,'100.0%'),(60,'ruturajp',5,0,'pass',15,'First_Step_Completed','First_Step',100,5,'100.0%'),(61,'sachinp',5,0,'pass',15,'First_Step_Completed','First_Step',100,5,'100.0%'),(62,'sainap',5,0,'pass',15,'First_Step_Completed','First_Step',100,5,'100.0%'),(63,'sanketd',5,0,'pass',15,'First_Step_Completed','First_Step',100,5,'100.0%'),(64,'shubhamc',5,0,'pass',15,'First_Step_Completed','First_Step',100,5,'100.0%'),(65,'tanishkap',5,0,'pass',15,'First_Step_Completed','First_Step',100,5,'100.0%'),(66,'tanmayp',5,0,'pass',15,'First_Step_Completed','First_Step',100,5,'100.0%'),(67,'aadhyap',4,0,'pass',15,'First_Step_Completed','First_Step',100,4,'100.0%'),(68,'aadhyap',4,1,'pass',15,'second_Step_Completed','Second_Step',80,8,'80.00%'),(69,'aadhyap',5,0,'pass',15,'Third_Step_Completed','Third_Step',100,13,'86.67%'),(70,'aishwaryap',5,0,'pass',15,'First_Step_Completed','First_Step',100,5,'100.0%'),(71,'aishwaryap',5,0,'pass',15,'second_Step_Completed','Second_Step',100,10,'100.00%'),(73,'aishwaryap',5,0,'pass',15,'Third_Step_Completed','Third_Step',100,15,'100.00%'),(74,'dhanarajp',5,0,'pass',15,'second_Step_Completed','Second_Step',100,8,'80.00%'),(75,'dhanarajp',5,0,'pass',15,'Third_Step_Completed','Third_Step',100,13,'86.67%'),(76,'dhruvg',4,0,'pass',15,'second_Step_Completed','Second_Step',100,6,'60.00%'),(77,'dhruvg',5,0,'pass',15,'Third_Step_Completed','Third_Step',100,11,'73.33%'),(78,'gurunaths',5,0,'pass',15,'First_Step_Completed','First_Step',100,5,'100.0%'),(79,'gurunaths',5,0,'pass',15,'second_Step_Completed','Second_Step',100,10,'100.00%'),(80,'gurunaths',5,0,'pass',15,'Third_Step_Completed','Third_Step',100,15,'100.00%'),(81,'nehad',5,0,'pass',15,'second_Step_Completed','Second_Step',100,8,'80.00%'),(82,'nehad',4,1,'pass',15,'Third_Step_Completed','Third_Step',80,12,'80.00%'),(83,'nileshp',5,0,'pass',15,'second_Step_Completed','Second_Step',100,7,'70.00%'),(84,'nileshp',5,0,'pass',15,'Third_Step_Completed','Third_Step',100,12,'80.00%'),(85,'ompawar',5,0,'pass',15,'second_Step_Completed','Second_Step',100,7,'70.00%'),(86,'ompawar',4,1,'pass',15,'Third_Step_Completed','Third_Step',80,11,'73.33%'),(87,'premg',5,0,'pass',15,'second_Step_Completed','Second_Step',100,7,'70.00%'),(88,'premg',4,1,'pass',15,'Third_Step_Completed','Third_Step',80,11,'73.33%'),(89,'rajdeepp',5,0,'pass',15,'second_Step_Completed','Second_Step',100,10,'100.00%'),(90,'rajdeepp',5,0,'pass',15,'Third_Step_Completed','Third_Step',100,15,'100.00%'),(91,'ranjeetp',4,1,'pass',15,'second_Step_Completed','Second_Step',80,9,'90.00%'),(92,'ranjeetp',3,2,'pass',15,'Third_Step_Completed','Third_Step',60,12,'80.00%'),(93,'rohitmhatre',5,0,'pass',15,'second_Step_Completed','Second_Step',100,10,'100.00%'),(94,'rohitmhatre',3,2,'pass',15,'Third_Step_Completed','Third_Step',60,13,'86.67%'),(95,'rushikeshl',5,0,'pass',15,'second_Step_Completed','Second_Step',100,10,'100.00%'),(96,'rushikeshl',4,1,'pass',15,'Third_Step_Completed','Third_Step',80,14,'93.33%'),(97,'ruturajp',4,1,'pass',15,'second_Step_Completed','Second_Step',80,9,'90.00%'),(98,'ruturajp',4,1,'pass',15,'Third_Step_Completed','Third_Step',80,13,'86.67%'),(99,'sachinp',4,1,'pass',15,'second_Step_Completed','Second_Step',80,9,'90.00%'),(100,'sachinp',3,2,'pass',15,'Third_Step_Completed','Third_Step',60,12,'80.00%'),(101,'sainap',5,0,'pass',15,'second_Step_Completed','Second_Step',100,10,'100.00%'),(102,'sainap',4,1,'pass',15,'Third_Step_Completed','Third_Step',80,14,'93.33%'),(103,'sanketd',5,0,'pass',15,'second_Step_Completed','Second_Step',100,10,'100.00%'),(104,'sanketd',4,1,'pass',15,'Third_Step_Completed','Third_Step',80,14,'93.33%'),(105,'shubhamc',5,0,'pass',15,'second_Step_Completed','Second_Step',100,10,'100.00%'),(106,'shubhamc',4,1,'pass',15,'Third_Step_Completed','Third_Step',80,14,'93.33%'),(107,'tanishkap',5,0,'pass',15,'second_Step_Completed','Second_Step',100,10,'100.00%'),(108,'tanishkap',4,1,'pass',15,'Third_Step_Completed','Third_Step',80,14,'93.33%'),(109,'tanmayp',5,0,'pass',15,'second_Step_Completed','Second_Step',100,10,'100.00%'),(110,'tanmayp',4,1,'pass',15,'Third_Step_Completed','Third_Step',80,14,'93.33%'),(111,'adheerap',4,1,'pass',15,'First_Step_Completed','First_Step',80,4,'80.0%'),(112,'adheerap',5,0,'pass',15,'second_Step_Completed','Second_Step',100,9,'90.00%'),(113,'adheerap',4,1,'pass',15,'Third_Step_Completed','Third_Step',80,13,'86.67%'),(114,'rajeshs',5,0,'pass',15,'second_Step_Completed','Second_Step',100,9,'90.00%'),(115,'rajeshs',4,1,'pass',15,'Third_Step_Completed','Third_Step',80,13,'86.67%');

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `name` varchar(45) NOT NULL default '',
  `email` varchar(45) NOT NULL default '',
  `mobile` varchar(45) NOT NULL default '',
  `dob` varchar(45) NOT NULL default '',
  `username` varchar(45) NOT NULL default '',
  `password` varchar(45) NOT NULL default '',
  `address` varchar(45) NOT NULL default '',
  `User` varchar(45) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

insert  into `registration`(`name`,`email`,`mobile`,`dob`,`username`,`password`,`address`,`User`) values ('Aadhya Patil','aadhyapatil1@gmail.com','8899664478','20/03/2006','aadhyap','123','Thane',NULL),('Adheera Patil','adheerapatil@gnail.com','7741236589','14/02/2007','adheerap','123','Pune',NULL),('Aishwaqrya Pol','aishwaryapol@gmail.com','7700986542','20/03/2006','aishwaryap','123','Pune',NULL),('Dhnaraj Patil','dhanarajpatil4512@gmail.com','8874651230','06/12/2007','dhanarajP','123','Pune',NULL),('Dhruv Ghadge','dhruvghadge4640@gmail.com','9967993492','19/03/2007','dhruvg','123','Pune',NULL),('Gurunath Subhedar','gurunathsubhedar@gmail.com','8457963215','29/10/2007','gurunaths','123','Pune',NULL),('Karan','bainadekaran@gmail.com','8600944611','12/02/1994','karan','123','pune.','Admin'),('Mahesh','mahy@gmail.com','9874563210','11/12/1999','mahesh','123','pune',NULL),('mangesh','mangesh@gmail.com','9874561230','13/12/1999','mangesh','123','pune',NULL),('Neha Doke','nehadoke@gmail.com','9892348732','15/05/2006','nehad','123','Pune',NULL),('Nilesh Pawar','nileshpawar@gmail.com','7478965123','21/05/2006','nileshp','123','Pune',NULL),('Om Pawar','ompawar1010@gmail.com','9922701456','21/11/2007','ompawar','123','Pune',NULL),('Prem Gajare','prem.gajare@gmail.com','7784513269','23/10/2006','premg','123','Pune',NULL),('Punam Ghadage','punamghadage@gmail.com','8796451230','26/07/2006','punamg','123','Pune',NULL),('Rajdeep Pawar','rajpawar@gmail.com','7846445568','14/12/2007','rajdeepp','123','Pune',NULL),('Rajesh Sathe','rajeshsathe@gmail.com','7784556129','14/03/2006','rajeshs','123','Pune',NULL),('Ranjeet Patil','ranjeetpatil@gmail.com','8698745123','10/11/2006','ranjeetp','123','Pune',NULL),('Rohit Mhatre','rohit.mhatre@gmail.com','8964321087','21/05/2006','rohitmhatre','123','Pune',NULL),('Rushikesh Lad','rushikeshlad@gmail.com','9687412350','14/04/2006','rushikeshl','123','Pune',NULL),('Ruturaj Patil','rutrajpatil99@gmail.com','7845963210','10/10/2006','ruturajp','123','Pune',NULL),('Sachin Pawar','sachinpawar@gmail.com','8475961253','23/11/2007','sachinp','123','Pune',NULL),('Saina Patil','sainapatil@gmail.com','989358792','16/12/2006','sainap','123','Pune',NULL),('Sanket Doke','sanketdoke@gmail.com','9420607085','07/08/2006','sanketd','123','Pune',NULL),('shiv','shiv@gmail.com','9874563210','25/10/2015','shiv','123','katraj','Users'),('Shubham Chingunde','shubhamchingunde@gmail.com','8554043333','14/02/2007','shubhamc','123','Pune',NULL),('suyesh','su@gmail.com','789654123','12/02/1994','suyesh','123','pune',NULL),('Tanishka Patil','tanishkapatil@gmail.com','7700986542','15/05/2006','tanishkap','123','Pune',NULL),('Tanmay Pawar','tanmaypawar@gmail.com','7984561235','19/03/2006','tanmayp','123','Pune',NULL);

/*Table structure for table `summary` */

DROP TABLE IF EXISTS `summary`;

CREATE TABLE `summary` (
  `id` int(11) NOT NULL auto_increment,
  `keyword` varchar(25) default NULL,
  `link_threshold` int(10) default NULL,
  `no_of_links_svm` int(10) default NULL,
  `no_of_links_naive_bayes` int(10) default NULL,
  `time_svm` tinyblob,
  `time_naive_bayes` tinyblob,
  `accuracy_svm` double default NULL,
  `accuracy_naive_bayes` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `summary` */

/*Table structure for table `survey_form` */

DROP TABLE IF EXISTS `survey_form`;

CREATE TABLE `survey_form` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `age` int(11) default NULL,
  `desg` varchar(45) default NULL,
  `recommendFriend` varchar(45) default NULL,
  `improvement` varchar(100) default NULL,
  `comment` varchar(450) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Data for the table `survey_form` */

insert  into `survey_form`(`id`,`userName`,`email`,`age`,`desg`,`recommendFriend`,`improvement`,`comment`) values (1,'Karan','bainadekaran@gmail.com',23,'learner','maybe','puzzle Game,Quiz Game,query','It is Good.'),(2,'Karan','bainadekaran@gmail.com',23,'learner','maybe','puzzle Game,Quiz Game,query','It is Good.'),(3,'mangesh','mangesh@gmail.com',24,'student','maybe','puzzle Game,query','IT is good..!'),(4,'mangesh','mangesh@gmail.com',24,'student','maybe','puzzle Game,Quiz Game','irurt'),(5,'mangesh','mangesh@gmail.com',24,'student','maybe','puzzle Game,Quiz Game','irurt'),(6,'mangesh','mangesh@gmail.com',23,'job','maybe','Quiz Game,query','aarerre'),(7,'Mahesh','mahy@gmail.com',24,'other','maybe','puzzle Game,query','wrere'),(8,'karan','ba@gmail.com',23,'job','maybe','puzzle Game,Quiz Game','2134edf'),(9,'karan','ba@gmail.com',23,'job','notSure','Quiz Game','afa'),(10,'Aadhya Patil','aadhyapatil@gmail.com',13,'student','definitely','pdf','Very good application'),(11,'Adheera Patil','adheerapatil@gmail.com',14,'student','definitely','Quiz Game','No comments'),(12,'Aishwarya Pol','aishwaryapol@gmail.com',14,'student','definitely','pdf','No comments'),(13,'Dhanaraj Patil','dhanarajpatil4512@gmail.com',14,'student','definitely','Quiz Game','Good'),(14,'Dhruv Ghadge','dhruvghadge4640@gmail.com',14,'student','definitely','puzzle Game','Very Good'),(15,'Gurunath Subhedar','gurunathsubhedar@gmail.com',14,'student','maybe','puzzle Game','No comments'),(16,'Neha Doke','nehadoke@gmail.com',14,'student','definitely','puzzle Game','Very Good application'),(17,'Nilesh Pawar','nileshpawar@gmail.com',14,'student','definitely','pdf','No comments'),(18,'Om Pawar','ompawar1010@gmail.com',14,'student','definitely','Quiz Game','Improvement in quiz game'),(19,'Prem Gajare','prem.gajare@gmail.com',14,'student','definitely','puzzle Game','Improvement needed in puzzle game'),(20,'Rajdeep Pawar','rajpawar@gmail.com',14,'student','definitely','pdf','No comments'),(21,'Rajesh Sathe','rajeshsathe@gmail.com',14,'student','definitely','pdf','No commenets'),(22,'Ranjeet Patil','ranjeetpatil@gmail.com',14,'student','definitely','Quiz Game','No comments'),(23,'Rohit Mhatre','rohit.mhatre@gmail.com',14,'student','definitely','pdf','No comments'),(24,'Rushikesh Lad','rushikeshlad@gmail.com',14,'student','definitely','puzzle Game','No comments'),(25,'Ruturaj Patil','ruturajpatil99@gmail.com',14,'student','maybe','puzzle Game','No comments'),(26,'Sachin Pawar','sachinpawar@gmail.com',14,'student','maybe','puzzle Game','No comments'),(27,'Saina Patil','saianapatil@gmail.com',14,'student','notSure','pdf','No comments'),(28,'Sanket Doke','sanketdoke@gmail.com',14,'student','maybe','pdf','No comments'),(29,'Shubham Chingunde','shubhamchingunde@gmail.com',14,'student','maybe','Quiz Game','Improve in quiz game'),(30,'Tanishka Patil','tanishkapatil@gmail.com',14,'student','definitely','Quiz Game',''),(31,'Tanmay Pawar','tanmaypawar@gmail.com',14,'student','maybe','pdf','');

/*Table structure for table `user_session_track` */

DROP TABLE IF EXISTS `user_session_track`;

CREATE TABLE `user_session_track` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(45) default NULL,
  `loginTime` varchar(45) default NULL,
  `logoutTime` varchar(45) default NULL,
  `totalSession` varchar(45) default NULL,
  `gamePlayed` varchar(45) default NULL,
  `onlineLearned` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

/*Data for the table `user_session_track` */

insert  into `user_session_track`(`id`,`userName`,`loginTime`,`logoutTime`,`totalSession`,`gamePlayed`,`onlineLearned`) values (1,'aadhyap','2019/07/31 16:05:28','2019/07/31 16:09:24','0:4:4','Yes','Yes'),(2,'aishwaryap','2019/07/31 16:11:43','2019/07/31 16:15:15','0:4:28','Yes','Yes'),(3,'adheerap','2019/07/31 16:22:15','2019/07/31 16:25:40','0:3:25','No','Yes'),(4,'dhanarajP','2019/08/05 11:52:38','2019/08/05 12:00:54','1:52:16','Yes','Yes'),(5,'gurunaths','2019/08/05 12:26:40','2019/08/05 12:27:00','0:1:40','No','Yes'),(6,'nehad','2019/08/05 12:30:29','2019/08/05 12:30:37','0:0:8','No','no'),(7,'nehad','2019/08/05 12:39:01','2019/08/05 12:39:07','0:0:6','No','Yes'),(8,'nehad','2019/08/05 12:59:13','2019/08/05 13:03:09','1:56:4','Yes','Yes'),(9,'nileshp','2019/08/07 14:20:15','2019/08/07 14:25:11','0:5:4','Yes','Yes'),(10,'ompawar','2019/08/07 14:25:39','2019/08/07 14:28:37','0:3:2','Yes','Yes'),(11,'punamg','2019/08/07 14:39:09','2019/08/07 14:39:16','0:0:7','No','Yes'),(12,'rajdeepp','2019/08/07 15:08:14','2019/08/07 15:11:11','0:3:3','Yes','Yes'),(13,'rajeshs','2019/08/08 11:06:49','2019/08/08 11:14:14','0:8:35','Yes','Yes'),(14,'ranjeetp','2019/08/08 11:16:53','2019/08/08 11:21:51','0:5:2','Yes','Yes'),(15,'rohitmhatre','2019/08/08 11:22:47','2019/08/08 11:25:09','0:3:38','Yes','Yes'),(16,'rushikeshl','2019/08/08 11:35:11','2019/08/08 11:39:05','0:4:6','Yes','Yes'),(17,'ruturajp','2019/08/08 11:55:19','2019/08/08 12:04:35','1:51:16','Yes','Yes'),(18,'sachinp','2019/08/08 17:31:24','2019/08/08 17:35:28','0:4:4','Yes','Yes'),(19,'sainap','2019/08/08 17:35:34','2019/08/08 17:39:47','0:4:13','Yes','Yes'),(20,'sainap','2019/08/08 18:37:58','2019/08/08 18:38:02','0:1:56','Yes','no'),(21,'sainap','2019/08/09 11:56:08','2019/08/09 11:56:24','0:0:16','Yes','no'),(22,'sanketd','2019/08/09 11:56:40','2019/08/09 12:01:52','1:55:12','Yes','Yes'),(23,'shubhamc','2019/08/09 12:02:40','2019/08/09 12:07:37','0:5:3','Yes','Yes'),(24,'tanishkap','2019/08/09 12:09:41','2019/08/09 12:14:13','0:5:28','Yes','Yes'),(25,'tanmayp','2019/08/09 12:20:32','2019/08/09 12:24:52','0:4:20','Yes','Yes'),(26,'aadhyap','2019/08/10 12:55:44','2019/08/10 13:01:36','1:54:8','Yes','Yes'),(27,'aadhyap','2019/08/11 11:52:08','2019/08/11 12:03:57','1:49:49','Yes','Yes'),(28,'aadhyap','2019/08/11 12:06:13','2019/08/11 12:12:01','0:6:12','Yes','Yes'),(29,'aadhyap','2019/08/12 11:57:46','2019/08/12 11:57:56','0:0:10','Yes','no'),(30,'aadhyap','2019/08/12 12:13:20','2019/08/12 12:15:54','0:2:34','Yes','Yes'),(31,'aadhyap','2019/08/12 12:39:15','2019/08/12 12:42:53','0:3:38','Yes','Yes'),(32,'aadhyap','2019/08/12 13:03:09','2019/08/12 13:06:07','0:3:2','Yes','Yes'),(33,'adheerap','2019/08/12 14:09:20','2019/08/12 14:09:40','0:0:20','Yes','Yes'),(34,'karan','2019/08/12 14:34:31','2019/08/12 14:38:41','0:4:10','Yes','no'),(35,'adheerap','2019/08/12 15:26:21','2019/08/12 15:31:30','0:5:9','Yes','Yes'),(36,'aishwaryap','2019/08/12 15:46:36','2019/08/12 15:54:24','0:8:12','Yes','Yes'),(37,'aishwaryap','2019/08/12 15:56:13','2019/08/12 16:02:55','1:54:42','Yes','Yes'),(38,'aishwaryap','2019/08/12 16:03:24','2019/08/12 16:05:51','0:2:27','Yes','no'),(39,'dhanarajP','2019/08/12 16:06:26','2019/08/12 16:10:15','0:4:11','Yes','no'),(40,'dhanarajP','2019/08/12 16:10:33','2019/08/12 16:15:03','0:5:30','Yes','no'),(41,'dhruvg','2019/08/12 16:20:47','2019/08/12 16:24:48','0:4:1','Yes','no'),(42,'gurunaths','2019/08/12 16:33:43','2019/08/12 16:34:55','0:1:12','No','Yes'),(43,'nehad','2019/08/12 16:45:10','2019/08/12 16:46:56','0:1:46','Yes','no'),(44,'nileshp','2019/08/12 16:47:10','2019/08/12 16:48:17','0:1:7','Yes','no'),(45,'nileshp','2019/08/12 16:51:27','2019/08/12 17:00:43','1:51:16','Yes','no'),(46,'ompawar','2019/08/12 17:16:22','2019/08/12 17:19:46','0:3:24','Yes','no'),(47,'ompawar','2019/08/12 17:21:43','2019/08/12 17:29:17','0:8:26','Yes','no'),(48,'nehad','2019/08/19 12:20:38','2019/08/19 12:29:54','0:9:16','Yes','Yes'),(49,'nileshp','2019/08/19 12:30:03','2019/08/19 12:30:09','0:0:6','Yes','no'),(50,'ompawar','2019/08/19 12:30:30','2019/08/19 12:32:24','0:2:6','Yes','no'),(51,'premg','2019/08/19 12:32:41','2019/08/19 12:36:35','0:4:6','Yes','Yes'),(52,'premg','2019/08/19 12:49:30','2019/08/19 12:55:21','0:6:9','Yes','Yes'),(53,'premg','2019/08/19 13:50:54','2019/08/19 13:52:14','0:2:40','Yes','no'),(54,'punamg','2019/08/19 13:52:30','2019/08/19 13:52:38','0:0:8','No','no'),(55,'rajdeepp','2019/08/19 13:52:48','2019/08/19 14:04:22','1:48:26','Yes','Yes'),(56,'ranjeetp','2019/08/19 17:25:53','2019/08/19 17:29:59','0:4:6','Yes','Yes'),(57,'rohitmhatre','2019/08/19 17:31:30','2019/08/19 17:31:35','0:0:5','Yes','no'),(58,'rohitmhatre','2019/08/19 17:32:55','2019/08/19 17:39:15','0:7:40','Yes','Yes'),(59,'rushikeshl','2019/08/19 17:53:04','2019/08/19 18:00:24','1:53:20','Yes','Yes'),(60,'ruturajp','2019/08/19 18:06:57','2019/08/19 18:09:32','0:3:25','Yes','Yes'),(61,'sachinp','2019/08/19 18:10:01','2019/08/19 18:15:32','0:5:31','Yes','Yes'),(62,'sainap','2019/08/19 18:46:14','2019/08/19 18:52:37','0:6:23','Yes','Yes'),(63,'sanketd','2019/08/20 17:14:29','2019/08/20 17:20:04','0:6:25','Yes','Yes'),(64,'shubhamc','2019/08/20 17:20:37','2019/08/20 17:27:35','0:7:2','Yes','Yes'),(65,'tanishkap','2019/08/20 17:34:19','2019/08/20 17:36:44','0:2:25','Yes','Yes'),(66,'tanmayp','2019/08/20 17:58:21','2019/08/20 18:05:28','1:53:7','Yes','Yes'),(67,'aadhyap','2019/08/21 11:33:26','2019/08/21 11:35:18','0:2:8','Yes','no'),(68,'adheerap','2019/08/21 11:41:04','2019/08/21 11:44:17','0:3:13','Yes','Yes'),(69,'aishwaryap','2019/08/21 11:47:07','2019/08/21 11:47:44','0:0:37','Yes','no'),(70,'dhanarajP','2019/08/21 11:48:02','2019/08/21 11:48:50','0:0:48','Yes','no'),(71,'dhruvg','2019/08/21 11:48:58','2019/08/21 11:50:15','0:2:43','Yes','no'),(72,'gurunaths','2019/08/21 11:50:24','2019/08/21 11:51:15','0:1:9','Yes','no'),(73,'nehad','2019/08/21 11:51:25','2019/08/21 11:52:17','0:1:8','Yes','no'),(74,'nileshp','2019/08/21 11:53:43','2019/08/21 11:54:31','0:1:12','Yes','no'),(75,'ompawar','2019/08/21 11:54:40','2019/08/21 11:55:39','0:1:1','Yes','no'),(76,'premg','2019/08/21 11:55:47','2019/08/21 11:56:50','0:1:3','Yes','no'),(77,'rajdeepp','2019/08/21 11:57:05','2019/08/21 11:57:44','0:0:39','Yes','no'),(78,'rajeshs','2019/08/21 12:01:47','2019/08/21 12:03:58','0:2:11','Yes','Yes'),(79,'ranjeetp','2019/08/21 12:04:12','2019/08/21 12:05:09','0:1:3','Yes','no'),(80,'rohitmhatre','2019/08/21 12:05:21','2019/08/21 12:06:06','0:1:15','Yes','no'),(81,'rushikeshl','2019/08/21 12:06:24','2019/08/21 12:07:09','0:1:15','Yes','no'),(82,'ruturajp','2019/08/21 12:07:19','2019/08/21 12:08:08','0:1:11','Yes','no'),(83,'sachinp','2019/08/21 12:08:23','2019/08/21 12:09:15','0:1:8','Yes','no'),(84,'sachinp','2019/08/21 12:09:24','2019/08/21 12:10:09','0:1:15','Yes','no'),(85,'sanketd','2019/08/21 12:10:57','2019/08/21 12:11:34','0:1:23','Yes','no'),(86,'shubhamc','2019/08/21 12:11:45','2019/08/21 12:12:39','0:1:6','Yes','no'),(87,'tanishkap','2019/08/21 12:12:52','2019/08/21 12:13:34','0:1:18','Yes','no'),(88,'tanmayp','2019/08/21 12:13:45','2019/08/21 12:14:15','0:1:30','Yes','no');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
