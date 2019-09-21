/*
SQLyog Community Edition- MySQL GUI v5.20
Host - 5.0.45-community-nt : Database - smartcrawler
*********************************************************************
Server version : 5.0.45-community-nt
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `smartcrawler`;

USE `smartcrawler`;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `username` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  `history` varchar(500) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`username`,`password`,`history`) values ('admin','admin','asif,asif,asif,khan');

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `firstName` varchar(45) default NULL,
  `lastName` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `password` varchar(45) default NULL,
  `phone` varchar(45) default NULL,
  `gender` varchar(45) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

insert  into `registration`(`firstName`,`lastName`,`email`,`password`,`phone`,`gender`) values ('asif','khan','asif@vspace.info','khanasif','8623912565','male'),('asdfasdf','asdfsdf','asdf@asdf.com','asifkhan','7894561230','male'),('Nir','Jad','Nir@gmail.com','Nir@123','9665835000','male');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
