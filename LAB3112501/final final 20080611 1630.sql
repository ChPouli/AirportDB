-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.51a-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema test
--

CREATE DATABASE IF NOT EXISTS test;
USE test;

--
-- Definition of table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
CREATE TABLE `aircraft` (
  `code` int(10) unsigned NOT NULL auto_increment,
  `type_id` int(10) unsigned NOT NULL,
  `total_hours` int(10) unsigned NOT NULL,
  `a_status` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`code`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `type_id` FOREIGN KEY (`type_id`) REFERENCES `aircraft_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aircraft`
--

/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` (`code`,`type_id`,`total_hours`,`a_status`) VALUES 
 (1,4,15,0x01),
 (2,1,10,0x01),
 (3,2,13,0x01),
 (4,4,14,0x01),
 (5,4,44,0x01),
 (6,1,10,0x01),
 (7,1,10,0x01);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;


--
-- Definition of table `aircraft_type`
--

DROP TABLE IF EXISTS `aircraft_type`;
CREATE TABLE `aircraft_type` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `a_type` varchar(45) NOT NULL,
  `num_seats` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aircraft_type`
--

/*!40000 ALTER TABLE `aircraft_type` DISABLE KEYS */;
INSERT INTO `aircraft_type` (`id`,`a_type`,`num_seats`) VALUES 
 (1,'Airbus300',10),
 (2,'Boeing737',10),
 (4,'Boeing747',10);
/*!40000 ALTER TABLE `aircraft_type` ENABLE KEYS */;


--
-- Definition of table `airport`
--

DROP TABLE IF EXISTS `airport`;
CREATE TABLE `airport` (
  `code` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `country` varchar(2) NOT NULL,
  PRIMARY KEY  (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `airport`
--

/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` (`code`,`name`,`city`,`country`) VALUES 
 (1,'Macedonia','Salonika','el'),
 (2,'El. Benizelos','Athens','el'),
 (3,'Kazantzakis','Hrakleio','el'),
 (4,'Benizelos','Chania','el'),
 (5,'De Gaulle','Paris','fr'),
 (6,'Heathrow','London','uk');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;


--
-- Definition of table `authoritytests`
--

DROP TABLE IF EXISTS `authoritytests`;
CREATE TABLE `authoritytests` (
  `authorityname` varchar(10) NOT NULL,
  `pass_rank` int(10) unsigned NOT NULL,
  `testcode` int(10) unsigned NOT NULL auto_increment,
  `description` mediumtext NOT NULL,
  PRIMARY KEY  (`testcode`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authoritytests`
--

/*!40000 ALTER TABLE `authoritytests` DISABLE KEYS */;
INSERT INTO `authoritytests` (`authorityname`,`pass_rank`,`testcode`,`description`) VALUES 
 ('Arxh1',10,1,'elegxos fterwn aeroskafous'),
 ('Arxh2',10,2,'elegxos dexiou pterygiou aeroskafous'),
 ('Arxh3',10,3,'elegxos aristerou pterygiou aeroskafous'),
 ('Arxh4',8,4,'elegxos tourmpinwn aeroskafous');
/*!40000 ALTER TABLE `authoritytests` ENABLE KEYS */;


--
-- Definition of table `cashier`
--

DROP TABLE IF EXISTS `cashier`;
CREATE TABLE `cashier` (
  `tid` int(10) unsigned NOT NULL auto_increment,
  `amount` float NOT NULL,
  PRIMARY KEY  (`tid`),
  CONSTRAINT `tid` FOREIGN KEY (`tid`) REFERENCES `transactions` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cashier`
--

/*!40000 ALTER TABLE `cashier` DISABLE KEYS */;
INSERT INTO `cashier` (`tid`,`amount`) VALUES 
 (1,6.4),
 (2,6.4),
 (3,6.4),
 (129,6.3232),
 (130,6.3232),
 (131,6.3232),
 (132,6.3232),
 (133,6.3232),
 (134,79.04),
 (135,79.04),
 (136,79.04),
 (137,118.56),
 (138,118.56),
 (139,118.56),
 (140,118.56),
 (141,118.56),
 (142,118.56),
 (143,118.56),
 (144,118.56),
 (145,79.04),
 (146,79.04),
 (147,72.7168),
 (154,79.04),
 (156,79.04);
/*!40000 ALTER TABLE `cashier` ENABLE KEYS */;


--
-- Definition of table `companyincome`
--

DROP TABLE IF EXISTS `companyincome`;
CREATE TABLE `companyincome` (
  `code` int(10) unsigned NOT NULL auto_increment,
  `fcode` int(10) unsigned NOT NULL,
  `fdate` datetime NOT NULL,
  `income` float NOT NULL,
  `tagent` float NOT NULL,
  `profit_from_agent` float NOT NULL,
  PRIMARY KEY  (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companyincome`
--

/*!40000 ALTER TABLE `companyincome` DISABLE KEYS */;
INSERT INTO `companyincome` (`code`,`fcode`,`fdate`,`income`,`tagent`,`profit_from_agent`) VALUES 
 (1,1,'2008-05-05 00:00:00',3000,1000,12);
/*!40000 ALTER TABLE `companyincome` ENABLE KEYS */;


--
-- Definition of table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `age` int(10) unsigned NOT NULL,
  `sex` bit(1) NOT NULL,
  `phone` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `f_lname_Index_2` USING HASH (`fname`,`lname`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`id`,`fname`,`lname`,`age`,`sex`,`phone`) VALUES 
 (1,'Aderfi','Giakou',20,0x00,'666666666'),
 (2,'Giannis','Aggelakas',49,0x00,'494949494949'),
 (3,'Maria','Kiouri',141,0x01,'111011010001011'),
 (4,'Ria','Poulh',21,0x01,'6945781235'),
 (5,'Iris','Kyranou',20,0x01,'698741365'),
 (6,'Xristina','Poulh',21,0x01,'6951235784'),
 (8,'Aria','Droub',21,0x01,'6985471236'),
 (13,'h','h',4,0x01,'4'),
 (14,'d','d',5,0x01,'5');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


--
-- Definition of table `expertise`
--

DROP TABLE IF EXISTS `expertise`;
CREATE TABLE `expertise` (
  `aircraft_type` int(10) unsigned NOT NULL auto_increment,
  `emp_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`aircraft_type`,`emp_id`),
  KEY `FK_expertise_1` (`emp_id`),
  CONSTRAINT `FK_expertise_1` FOREIGN KEY (`emp_id`) REFERENCES `fspilots` (`emp_id`),
  CONSTRAINT `FK_expertise_2` FOREIGN KEY (`aircraft_type`) REFERENCES `aircraft_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `expertise`
--

/*!40000 ALTER TABLE `expertise` DISABLE KEYS */;
INSERT INTO `expertise` (`aircraft_type`,`emp_id`) VALUES 
 (4,12348),
 (2,12349),
 (2,12350),
 (1,12355),
 (1,12357),
 (1,12358),
 (2,12362),
 (2,12363),
 (2,12364),
 (4,12365),
 (4,12366),
 (4,12367);
/*!40000 ALTER TABLE `expertise` ENABLE KEYS */;


--
-- Definition of table `flight`
--

DROP TABLE IF EXISTS `flight`;
CREATE TABLE `flight` (
  `fcode` int(10) unsigned NOT NULL,
  `departure` int(10) unsigned NOT NULL,
  `destination` int(10) unsigned NOT NULL,
  `dep_time` time NOT NULL,
  `arr_time` time NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY  (`fcode`),
  KEY `FK_flight_1` (`departure`),
  KEY `FK_flight_2` (`destination`),
  CONSTRAINT `FK_flight_1` FOREIGN KEY (`departure`) REFERENCES `airport` (`code`),
  CONSTRAINT `FK_flight_2` FOREIGN KEY (`destination`) REFERENCES `airport` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flight`
--

/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` (`fcode`,`departure`,`destination`,`dep_time`,`arr_time`,`price`) VALUES 
 (1,2,1,'07:00:00','08:00:00',80),
 (2,2,1,'13:00:00','14:00:00',80),
 (3,2,1,'19:00:00','20:00:00',80),
 (4,2,3,'07:00:00','07:50:00',80),
 (5,2,3,'18:00:00','18:50:00',80),
 (6,2,4,'08:15:00','08:55:00',80),
 (7,2,4,'15:00:00','15:40:00',80),
 (8,2,6,'10:30:00','13:00:00',120),
 (9,2,6,'20:30:00','23:00:00',120),
 (10,2,5,'10:30:00','13:30:00',120),
 (11,1,2,'08:30:00','09:30:00',80),
 (12,1,2,'14:30:00','15:30:00',80),
 (13,1,2,'20:30:00','21:30:00',80),
 (14,3,2,'08:20:00','09:10:00',80),
 (15,3,2,'19:20:00','20:10:00',80),
 (16,4,2,'09:25:00','10:05:00',80),
 (17,4,2,'16:10:00','16:50:00',80),
 (18,6,2,'13:30:00','16:00:00',120),
 (19,6,2,'23:30:00','02:00:00',120),
 (20,5,2,'14:00:00','17:00:00',120);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;


--
-- Definition of table `flight_days`
--

DROP TABLE IF EXISTS `flight_days`;
CREATE TABLE `flight_days` (
  `fcode` int(10) unsigned NOT NULL auto_increment,
  `day` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`fcode`,`day`),
  CONSTRAINT `FK_flight_days_1` FOREIGN KEY (`fcode`) REFERENCES `flight` (`fcode`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flight_days`
--

/*!40000 ALTER TABLE `flight_days` DISABLE KEYS */;
INSERT INTO `flight_days` (`fcode`,`day`) VALUES 
 (1,1),
 (1,3),
 (2,2),
 (2,4),
 (2,6),
 (3,7),
 (4,7),
 (5,1),
 (5,5);
/*!40000 ALTER TABLE `flight_days` ENABLE KEYS */;


--
-- Definition of table `flightdone`
--

DROP TABLE IF EXISTS `flightdone`;
CREATE TABLE `flightdone` (
  `fschedule_id` int(10) unsigned NOT NULL auto_increment,
  `duration` time NOT NULL,
  PRIMARY KEY  (`fschedule_id`),
  CONSTRAINT `FK_flightdone_1` FOREIGN KEY (`fschedule_id`) REFERENCES `flightschedule` (`fschedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flightdone`
--

/*!40000 ALTER TABLE `flightdone` DISABLE KEYS */;
INSERT INTO `flightdone` (`fschedule_id`,`duration`) VALUES 
 (6,'01:00:00'),
 (7,'02:30:00'),
 (8,'02:30:00'),
 (13,'03:00:00'),
 (54,'01:00:00'),
 (55,'01:00:00'),
 (56,'01:00:00'),
 (57,'02:30:00'),
 (58,'01:00:00'),
 (59,'03:00:00'),
 (60,'00:50:00'),
 (61,'00:50:00'),
 (62,'00:40:00'),
 (63,'00:40:00'),
 (64,'02:30:00'),
 (65,'01:00:00'),
 (66,'01:00:00'),
 (67,'00:50:00'),
 (68,'00:50:00'),
 (69,'00:40:00'),
 (70,'00:40:00'),
 (71,'02:30:00'),
 (72,'-21:30:00'),
 (73,'03:00:00'),
 (74,'01:00:00'),
 (75,'01:00:00'),
 (76,'01:00:00'),
 (77,'02:30:00'),
 (78,'01:00:00'),
 (79,'03:00:00'),
 (80,'00:50:00'),
 (81,'00:50:00'),
 (82,'00:40:00'),
 (83,'00:40:00'),
 (84,'02:30:00'),
 (85,'01:00:00'),
 (86,'01:00:00'),
 (87,'00:50:00'),
 (88,'00:50:00'),
 (89,'00:40:00'),
 (90,'00:40:00'),
 (91,'02:30:00'),
 (92,'-21:30:00'),
 (93,'03:00:00');
/*!40000 ALTER TABLE `flightdone` ENABLE KEYS */;


--
-- Definition of table `flightschedule`
--

DROP TABLE IF EXISTS `flightschedule`;
CREATE TABLE `flightschedule` (
  `fschedule_id` int(10) unsigned NOT NULL auto_increment,
  `aircraft_code` int(10) unsigned NOT NULL,
  `fdate` date NOT NULL,
  `fprogram_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`fschedule_id`),
  KEY `FK_flightschedule_1` (`aircraft_code`),
  KEY `FK_flightschedule_2` (`fprogram_id`),
  KEY `fdate_Index_4` USING BTREE (`fdate`),
  CONSTRAINT `FK_flightschedule_1` FOREIGN KEY (`aircraft_code`) REFERENCES `aircraft` (`code`),
  CONSTRAINT `FK_flightschedule_2` FOREIGN KEY (`fprogram_id`) REFERENCES `flightsprogramm` (`programm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flightschedule`
--

/*!40000 ALTER TABLE `flightschedule` DISABLE KEYS */;
INSERT INTO `flightschedule` (`fschedule_id`,`aircraft_code`,`fdate`,`fprogram_id`) VALUES 
 (1,4,'2008-05-06',1),
 (2,2,'2008-03-05',2),
 (3,1,'2008-05-06',3),
 (4,1,'2008-03-04',4),
 (5,4,'2008-03-04',5),
 (6,1,'2008-05-03',1),
 (7,1,'2008-05-04',4),
 (8,1,'2008-05-05',4),
 (9,1,'2008-05-06',4),
 (10,1,'2008-05-07',4),
 (11,1,'2008-05-08',4),
 (12,1,'2008-05-09',4),
 (13,2,'2008-05-05',6),
 (54,4,'2008-05-05',1),
 (55,3,'2008-05-05',2),
 (56,2,'2008-05-05',3),
 (57,2,'2008-05-05',4),
 (58,4,'2008-05-05',5),
 (59,4,'2008-05-05',6),
 (60,3,'2008-05-05',7),
 (61,2,'2008-05-05',8),
 (62,2,'2008-05-05',9),
 (63,3,'2008-05-05',10),
 (64,2,'2008-05-05',11),
 (65,3,'2008-05-05',12),
 (66,2,'2008-05-05',13),
 (67,3,'2008-05-05',14),
 (68,2,'2008-05-05',15),
 (69,2,'2008-05-05',16),
 (70,3,'2008-05-05',17),
 (71,2,'2008-05-05',18),
 (72,2,'2008-05-05',19),
 (73,4,'2008-05-05',20),
 (74,4,'2008-05-05',1),
 (75,3,'2008-05-05',2),
 (76,2,'2008-05-05',3),
 (77,2,'2008-05-05',4),
 (78,4,'2008-05-05',5),
 (79,4,'2008-05-05',6),
 (80,3,'2008-05-05',7),
 (81,2,'2008-05-05',8),
 (82,2,'2008-05-05',9),
 (83,3,'2008-05-05',10),
 (84,2,'2008-05-05',11),
 (85,3,'2008-05-05',12),
 (86,2,'2008-05-05',13),
 (87,3,'2008-05-05',14),
 (88,2,'2008-05-05',15),
 (89,2,'2008-05-05',16),
 (90,3,'2008-05-05',17),
 (91,2,'2008-05-05',18),
 (92,2,'2008-05-05',19),
 (93,4,'2008-05-05',20),
 (94,4,'2008-05-06',1),
 (95,3,'2008-05-06',2),
 (96,2,'2008-05-06',3),
 (97,2,'2008-05-06',4),
 (98,4,'2008-05-06',5),
 (99,4,'2008-05-06',6),
 (100,3,'2008-05-06',7),
 (101,2,'2008-05-06',8),
 (102,2,'2008-05-06',9),
 (103,3,'2008-05-06',10),
 (104,2,'2008-05-06',11),
 (105,3,'2008-05-06',12),
 (106,2,'2008-05-06',13),
 (107,3,'2008-05-06',14),
 (108,2,'2008-05-06',15),
 (109,2,'2008-05-06',16),
 (110,3,'2008-05-06',17),
 (111,2,'2008-05-06',18),
 (112,2,'2008-05-06',19),
 (113,4,'2008-05-06',20),
 (114,4,'2008-05-07',1),
 (115,3,'2008-05-07',2),
 (116,2,'2008-05-07',3),
 (117,2,'2008-05-07',4),
 (118,4,'2008-05-07',5),
 (119,4,'2008-05-07',6),
 (120,3,'2008-05-07',7),
 (121,2,'2008-05-07',8),
 (122,2,'2008-05-07',9),
 (123,3,'2008-05-07',10),
 (124,2,'2008-05-07',11),
 (125,3,'2008-05-07',12),
 (126,2,'2008-05-07',13),
 (127,3,'2008-05-07',14),
 (128,2,'2008-05-07',15),
 (129,2,'2008-05-07',16),
 (130,3,'2008-05-07',17),
 (131,2,'2008-05-07',18),
 (132,2,'2008-05-07',19),
 (133,4,'2008-05-07',20),
 (134,4,'2008-05-08',1),
 (135,3,'2008-05-08',2),
 (136,2,'2008-05-08',3),
 (137,2,'2008-05-08',4),
 (138,4,'2008-05-08',5),
 (139,4,'2008-05-08',6),
 (140,3,'2008-05-08',7),
 (141,2,'2008-05-08',8),
 (142,2,'2008-05-08',9),
 (143,3,'2008-05-08',10),
 (144,2,'2008-05-08',11),
 (145,3,'2008-05-08',12),
 (146,2,'2008-05-08',13),
 (147,3,'2008-05-08',14),
 (148,2,'2008-05-08',15),
 (149,2,'2008-05-08',16),
 (150,3,'2008-05-08',17),
 (151,2,'2008-05-08',18),
 (152,2,'2008-05-08',19),
 (153,4,'2008-05-08',20),
 (154,4,'2008-05-09',1),
 (155,3,'2008-05-09',2),
 (156,2,'2008-05-09',3),
 (157,2,'2008-05-09',4),
 (158,4,'2008-05-09',5),
 (159,4,'2008-05-09',6),
 (160,3,'2008-05-09',7),
 (161,2,'2008-05-09',8),
 (162,2,'2008-05-09',9),
 (163,3,'2008-05-09',10),
 (164,2,'2008-05-09',11),
 (165,3,'2008-05-09',12),
 (166,2,'2008-05-09',13),
 (167,3,'2008-05-09',14),
 (168,2,'2008-05-09',15),
 (169,2,'2008-05-09',16),
 (170,3,'2008-05-09',17),
 (171,2,'2008-05-09',18),
 (172,2,'2008-05-09',19),
 (173,4,'2008-05-09',20),
 (174,4,'2008-05-10',1),
 (175,4,'2008-05-10',10),
 (176,2,'2008-05-10',4),
 (177,2,'2008-05-10',14),
 (178,1,'2008-05-10',6),
 (179,1,'2008-05-10',16),
 (180,1,'2008-05-10',8),
 (181,1,'2008-05-10',18),
 (182,4,'2008-05-10',10),
 (183,4,'2008-05-10',20),
 (184,4,'2008-05-11',1),
 (185,4,'2008-05-11',10),
 (186,2,'2008-05-11',4),
 (187,2,'2008-05-11',14),
 (188,1,'2008-05-11',6),
 (189,1,'2008-05-11',16),
 (190,1,'2008-05-11',8),
 (191,1,'2008-05-11',18),
 (192,4,'2008-05-11',10),
 (193,4,'2008-05-11',20),
 (194,3,'2008-06-23',8),
 (195,4,'2008-06-23',3),
 (196,1,'2008-06-22',11);
/*!40000 ALTER TABLE `flightschedule` ENABLE KEYS */;


--
-- Definition of table `flightsprogramm`
--

DROP TABLE IF EXISTS `flightsprogramm`;
CREATE TABLE `flightsprogramm` (
  `aircraft_type` int(10) unsigned NOT NULL,
  `flight_code` int(10) unsigned NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `programm_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`programm_id`),
  KEY `FK_flightsprogramm_1` (`aircraft_type`),
  KEY `FK_flightsprogramm_2` (`flight_code`),
  CONSTRAINT `FK_flightsprogramm_1` FOREIGN KEY (`aircraft_type`) REFERENCES `aircraft_type` (`id`),
  CONSTRAINT `FK_flightsprogramm_2` FOREIGN KEY (`flight_code`) REFERENCES `flight` (`fcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flightsprogramm`
--

/*!40000 ALTER TABLE `flightsprogramm` DISABLE KEYS */;
INSERT INTO `flightsprogramm` (`aircraft_type`,`flight_code`,`start_date`,`end_date`,`programm_id`) VALUES 
 (4,1,'2008-01-01 00:00:00','2008-06-01 00:00:00',1),
 (2,2,'2008-01-01 00:00:00','2008-06-01 00:00:00',2),
 (1,3,'2008-01-01 00:00:00','2008-06-01 00:00:00',3),
 (1,8,'2008-01-01 00:00:00','2008-06-01 00:00:00',4),
 (4,11,'2008-01-01 00:00:00','2008-06-01 00:00:00',5),
 (4,10,'2008-01-01 00:00:00','2008-06-01 00:00:00',6),
 (2,4,'2008-01-01 00:00:00','2008-06-01 00:00:00',7),
 (1,5,'2008-01-01 00:00:00','2008-06-01 00:00:00',8),
 (1,6,'2008-01-01 00:00:00','2008-06-01 00:00:00',9),
 (2,7,'2008-01-01 00:00:00','2008-06-01 00:00:00',10),
 (1,9,'2008-01-01 00:00:00','2008-06-01 00:00:00',11),
 (2,12,'2008-01-01 00:00:00','2008-06-01 00:00:00',12),
 (1,13,'2008-01-01 00:00:00','2008-06-01 00:00:00',13),
 (2,14,'2008-01-01 00:00:00','2008-06-01 00:00:00',14),
 (1,15,'2008-01-01 00:00:00','2008-06-01 00:00:00',15),
 (1,16,'2008-01-01 00:00:00','2008-06-01 00:00:00',16),
 (2,17,'2008-01-01 00:00:00','2008-06-01 00:00:00',17),
 (1,18,'2008-01-01 00:00:00','2008-06-01 00:00:00',18),
 (1,19,'2008-01-01 00:00:00','2008-06-01 00:00:00',19),
 (4,20,'2008-01-01 00:00:00','2008-06-01 00:00:00',20);
/*!40000 ALTER TABLE `flightsprogramm` ENABLE KEYS */;


--
-- Definition of table `fsattendant`
--

DROP TABLE IF EXISTS `fsattendant`;
CREATE TABLE `fsattendant` (
  `emp_id` int(10) unsigned NOT NULL auto_increment,
  `native_lang` varchar(2) default NULL,
  PRIMARY KEY  (`emp_id`),
  CONSTRAINT `FK_fsattendant_1` FOREIGN KEY (`emp_id`) REFERENCES `fstaff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12371 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fsattendant`
--

/*!40000 ALTER TABLE `fsattendant` DISABLE KEYS */;
INSERT INTO `fsattendant` (`emp_id`,`native_lang`) VALUES 
 (12352,'uk'),
 (12353,'uk'),
 (12354,'uk'),
 (12356,'uk'),
 (12359,'uk'),
 (12360,'uk'),
 (12361,'it'),
 (12368,'el'),
 (12369,'el'),
 (12370,'el');
/*!40000 ALTER TABLE `fsattendant` ENABLE KEYS */;


--
-- Definition of table `fsmonthlysalary`
--

DROP TABLE IF EXISTS `fsmonthlysalary`;
CREATE TABLE `fsmonthlysalary` (
  `fs_id` int(10) unsigned NOT NULL auto_increment,
  `dom_hours` int(10) unsigned NOT NULL,
  `int_hours` int(10) unsigned NOT NULL,
  `total` float default NULL,
  `fmonth` int(10) unsigned default NULL,
  `year` int(10) unsigned default NULL,
  PRIMARY KEY  (`fs_id`),
  CONSTRAINT `FK_fsmonthlysalary_1` FOREIGN KEY (`fs_id`) REFERENCES `fstaff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12349 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fsmonthlysalary`
--

/*!40000 ALTER TABLE `fsmonthlysalary` DISABLE KEYS */;
INSERT INTO `fsmonthlysalary` (`fs_id`,`dom_hours`,`int_hours`,`total`,`fmonth`,`year`) VALUES 
 (12348,2,3,5,4,2008);
/*!40000 ALTER TABLE `fsmonthlysalary` ENABLE KEYS */;


--
-- Definition of table `fspilots`
--

DROP TABLE IF EXISTS `fspilots`;
CREATE TABLE `fspilots` (
  `emp_id` int(10) unsigned NOT NULL auto_increment,
  `degree` varchar(45) default NULL,
  PRIMARY KEY  (`emp_id`),
  CONSTRAINT `FK_fspilots_1` FOREIGN KEY (`emp_id`) REFERENCES `fstaff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12368 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fspilots`
--

/*!40000 ALTER TABLE `fspilots` DISABLE KEYS */;
INSERT INTO `fspilots` (`emp_id`,`degree`) VALUES 
 (12348,'first pilot'),
 (12349,'first pilot'),
 (12350,'first pilot'),
 (12355,'first pilot'),
 (12357,'first pilot'),
 (12358,'first pilot'),
 (12362,'first pilot'),
 (12363,'first pilot'),
 (12364,'first pilot'),
 (12365,'first pilot'),
 (12366,'first pilot'),
 (12367,'first pilot');
/*!40000 ALTER TABLE `fspilots` ENABLE KEYS */;


--
-- Definition of table `fstaff`
--

DROP TABLE IF EXISTS `fstaff`;
CREATE TABLE `fstaff` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `job` varchar(45) NOT NULL,
  `birthdate` datetime NOT NULL,
  `phone` varchar(25) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `f_lname_Index_2` USING BTREE (`fname`,`lname`)
) ENGINE=InnoDB AUTO_INCREMENT=12371 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fstaff`
--

/*!40000 ALTER TABLE `fstaff` DISABLE KEYS */;
INSERT INTO `fstaff` (`id`,`fname`,`lname`,`job`,`birthdate`,`phone`,`address`) VALUES 
 (12348,'giorgos','georgiou','pilot','1980-04-05 00:00:00','1234567890','sweitzer 36'),
 (12349,'mailo','atalantis','pilot','1977-06-05 00:00:00','23423423432','hawaii 5-0'),
 (12350,'panos','mouzourakis','pilot','1977-06-05 00:00:00','23423423432','zyrich'),
 (12352,'kamila','parker','attendant','1987-06-05 00:00:00','42534235','backingham palace third floor'),
 (12353,'Sarah','Foset','attendant','1987-06-05 00:00:00','42534235','Xontromixalh 16'),
 (12354,'Nikos','X\"panagiwtou','attendant','1988-02-15 00:00:00','42534235','Xontromixalh 16'),
 (12355,'Spyros','Panouklas','pilot','1988-02-22 00:00:00','445679566435','Sougias 16'),
 (12356,'Themistoklhs','Choleras','attendant','1988-02-22 00:00:00','445679566435','Sougias 16'),
 (12357,'Mixalhs','Choleras','pilot','1988-02-22 00:00:00','445679566435','Sougias 16'),
 (12358,'mitsos','mitsou','pilot','1980-07-03 00:00:00','1234567890','acdc 15'),
 (12359,'Spyros','Choleras','attendant','1988-02-22 00:00:00','445679566435','Sougias 16'),
 (12360,'Kostas','Choleras','attendant','1988-02-22 00:00:00','445679566435','Sougias 16'),
 (12361,'Mania','Katadioxeos','attendant','1988-02-22 00:00:00','69456324685','Psychiatriou 116'),
 (12362,'Labros','Xaros','pilot','1988-02-15 00:00:00','6666966966','Satana 66'),
 (12363,'Andreas','Andreou','pilot','1767-05-23 00:00:00','6936251465','Wherever 33'),
 (12364,'Manos','Papadopoulos','pilot','1767-02-12 00:00:00','6987453652','Everywhere 33'),
 (12365,'Kostas','Petoumenos','pilot','1765-02-12 00:00:00','6932145687','Somewhere 4'),
 (12366,'Stratos','Enaerios','pilot','1777-02-24 00:00:00','6902301258','Farfaraway 4'),
 (12367,'Ey8ymios','Panwmeriths','pilot','1981-02-24 00:00:00','6903254698','Neverland 4'),
 (12368,'Anna','Mpela','attendant','1977-04-02 00:00:00','6987413250','Kounia 33'),
 (12369,'Ria','Poulh','attendant','1987-06-05 00:00:00','6936258565','Anastasews 33'),
 (12370,'Ria','Poulh','attendant','1987-06-05 00:00:00','6936258565','Anastasews 33');
/*!40000 ALTER TABLE `fstaff` ENABLE KEYS */;


--
-- Definition of table `gstaff`
--

DROP TABLE IF EXISTS `gstaff`;
CREATE TABLE `gstaff` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `job` varchar(45) NOT NULL,
  `birthdate` date NOT NULL,
  `phone` varchar(25) NOT NULL,
  `address` varchar(45) NOT NULL,
  `salary` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gstaff`
--

/*!40000 ALTER TABLE `gstaff` DISABLE KEYS */;
INSERT INTO `gstaff` (`id`,`fname`,`lname`,`job`,`birthdate`,`phone`,`address`,`salary`) VALUES 
 (1,'maria','edafous-edafous','mechanic','1988-01-11','6958471425','Edafous 44',2000),
 (2,'Stratos','Stratou','mechanic','1986-11-03','6936020145','Gwnias 33',2000),
 (11,'Stratos','Pappas','mechanic','1986-11-03','6936020145','Gwnias 33',2000),
 (12,'Giannis','Fonias','ground attendant','1966-11-03','6903254102','Kydwnias 12',1200),
 (16,'Egv','Emou','ground attendant','1987-05-06','6987123654','Ekei 44',1200);
/*!40000 ALTER TABLE `gstaff` ENABLE KEYS */;


--
-- Definition of trigger `gstaffPayment`
--

DROP TRIGGER /*!50030 IF EXISTS */ `gstaffPayment`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `gstaffPayment` BEFORE INSERT ON `gstaff` FOR EACH ROW BEGIN
  if new.job='mechanic' then
    set new.salary ='2000';
  elseif new.job = 'ground attendant' then
    set new.salary='1200';
  end if;
END $$

DELIMITER ;

--
-- Definition of table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `lang_code` varchar(2) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY  (`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` (`lang_code`,`name`) VALUES 
 ('de','German'),
 ('el','Greek'),
 ('it','Italian'),
 ('se','Swedish'),
 ('sp','Spanish'),
 ('uk','English');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;


--
-- Definition of table `madetransaction`
--

DROP TABLE IF EXISTS `madetransaction`;
CREATE TABLE `madetransaction` (
  `id` int(10) unsigned NOT NULL,
  `t_id` int(10) unsigned NOT NULL auto_increment,
  `t_type` enum('gstaff','tagent') NOT NULL,
  PRIMARY KEY  (`t_id`),
  CONSTRAINT `FK_madetransaction_1` FOREIGN KEY (`t_id`) REFERENCES `transactions` (`t_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `madetransaction`
--

/*!40000 ALTER TABLE `madetransaction` DISABLE KEYS */;
INSERT INTO `madetransaction` (`id`,`t_id`,`t_type`) VALUES 
 (1,1,'tagent'),
 (2,2,'tagent'),
 (1,3,'tagent'),
 (12,7,'gstaff'),
 (12,8,'gstaff'),
 (12,55,'gstaff'),
 (12,64,'gstaff'),
 (1,67,'tagent'),
 (2,114,'tagent'),
 (1,124,'tagent'),
 (1,125,'tagent'),
 (1,126,'tagent'),
 (1,127,'tagent'),
 (1,128,'tagent'),
 (1,129,'tagent'),
 (2,130,'tagent'),
 (2,131,'tagent'),
 (2,132,'tagent'),
 (2,133,'tagent'),
 (2,134,'tagent'),
 (2,135,'tagent'),
 (2,136,'tagent'),
 (2,137,'tagent'),
 (2,138,'tagent'),
 (2,139,'tagent'),
 (2,140,'tagent'),
 (2,141,'tagent'),
 (2,142,'tagent'),
 (2,143,'tagent'),
 (2,144,'tagent'),
 (2,145,'tagent'),
 (2,146,'tagent'),
 (2,147,'tagent'),
 (1,154,'tagent'),
 (1,156,'tagent');
/*!40000 ALTER TABLE `madetransaction` ENABLE KEYS */;


--
-- Definition of table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `tid` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`tid`),
  CONSTRAINT `FK_reservation_1` FOREIGN KEY (`tid`) REFERENCES `transactions` (`t_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` (`tid`) VALUES 
 (5),
 (6),
 (9),
 (10),
 (11),
 (12),
 (13),
 (14),
 (15),
 (16),
 (55),
 (62),
 (88),
 (89),
 (90),
 (91),
 (92),
 (93),
 (94),
 (95),
 (96),
 (97),
 (98),
 (99),
 (100),
 (101),
 (102),
 (103),
 (104),
 (105),
 (107),
 (108),
 (122),
 (123),
 (148),
 (150),
 (152),
 (153),
 (155);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;


--
-- Definition of table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `emp_id` int(10) unsigned NOT NULL,
  `aircraft_id` int(10) unsigned NOT NULL,
  `service_date` datetime NOT NULL,
  `rank` int(10) unsigned NOT NULL,
  `test_id` int(10) unsigned NOT NULL,
  `s_status` bit(1) NOT NULL,
  PRIMARY KEY  (`emp_id`,`service_date`,`aircraft_id`),
  KEY `aircraft_id` (`aircraft_id`),
  KEY `test_id` (`test_id`),
  CONSTRAINT `aircraft_id` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`code`),
  CONSTRAINT `emp_id` FOREIGN KEY (`emp_id`) REFERENCES `gstaff` (`id`),
  CONSTRAINT `test_id` FOREIGN KEY (`test_id`) REFERENCES `authoritytests` (`testcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` (`emp_id`,`aircraft_id`,`service_date`,`rank`,`test_id`,`s_status`) VALUES 
 (1,1,'2008-01-02 00:00:00',8,1,0x00),
 (2,1,'2008-05-05 00:00:00',10,2,0x00),
 (11,2,'2008-05-05 00:00:00',10,2,0x00);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;


--
-- Definition of table `spoken_langs`
--

DROP TABLE IF EXISTS `spoken_langs`;
CREATE TABLE `spoken_langs` (
  `emp_id` int(10) unsigned NOT NULL auto_increment,
  `lang_code` varchar(2) NOT NULL,
  PRIMARY KEY  (`emp_id`,`lang_code`),
  KEY `FK_spoken_langs_2` (`lang_code`),
  CONSTRAINT `FK_spoken_langs_1` FOREIGN KEY (`emp_id`) REFERENCES `fstaff` (`id`),
  CONSTRAINT `FK_spoken_langs_2` FOREIGN KEY (`lang_code`) REFERENCES `language` (`lang_code`)
) ENGINE=InnoDB AUTO_INCREMENT=12371 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `spoken_langs`
--

/*!40000 ALTER TABLE `spoken_langs` DISABLE KEYS */;
INSERT INTO `spoken_langs` (`emp_id`,`lang_code`) VALUES 
 (12368,'de'),
 (12369,'de'),
 (12370,'de'),
 (12368,'el'),
 (12361,'it'),
 (12352,'uk'),
 (12353,'uk'),
 (12354,'uk'),
 (12356,'uk'),
 (12359,'uk'),
 (12360,'uk');
/*!40000 ALTER TABLE `spoken_langs` ENABLE KEYS */;


--
-- Definition of table `staffschedule`
--

DROP TABLE IF EXISTS `staffschedule`;
CREATE TABLE `staffschedule` (
  `emp_id` int(10) unsigned NOT NULL,
  `fdate` datetime NOT NULL,
  `fschedule_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`emp_id`,`fschedule_id`),
  KEY `FK_staffschedule_2` (`fschedule_id`),
  CONSTRAINT `FK_staffschedule_1` FOREIGN KEY (`emp_id`) REFERENCES `fstaff` (`id`),
  CONSTRAINT `FK_staffschedule_2` FOREIGN KEY (`fschedule_id`) REFERENCES `flightschedule` (`fschedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staffschedule`
--

/*!40000 ALTER TABLE `staffschedule` DISABLE KEYS */;
INSERT INTO `staffschedule` (`emp_id`,`fdate`,`fschedule_id`) VALUES 
 (12348,'2008-05-06 00:00:00',1),
 (12348,'2008-05-06 00:00:00',3),
 (12348,'2008-03-04 00:00:00',4),
 (12348,'2008-03-04 00:00:00',5),
 (12348,'2008-05-03 00:00:00',6),
 (12348,'2008-05-04 00:00:00',7),
 (12348,'2008-05-05 00:00:00',8),
 (12348,'2008-05-06 00:00:00',9),
 (12348,'2008-05-07 00:00:00',10),
 (12348,'2008-05-08 00:00:00',11),
 (12348,'2008-05-09 00:00:00',12),
 (12348,'2008-05-05 00:00:00',54),
 (12348,'2008-05-05 00:00:00',58),
 (12348,'2008-05-05 00:00:00',59),
 (12348,'2008-05-05 00:00:00',73),
 (12348,'2008-05-05 00:00:00',74),
 (12348,'2008-05-05 00:00:00',78),
 (12348,'2008-05-05 00:00:00',79),
 (12348,'2008-05-05 00:00:00',93),
 (12348,'2008-05-06 00:00:00',94),
 (12348,'2008-05-06 00:00:00',98),
 (12348,'2008-05-06 00:00:00',99),
 (12348,'2008-05-06 00:00:00',113),
 (12348,'2008-05-07 00:00:00',114),
 (12348,'2008-05-07 00:00:00',118),
 (12348,'2008-05-07 00:00:00',119),
 (12348,'2008-05-07 00:00:00',133),
 (12348,'2008-05-08 00:00:00',134),
 (12348,'2008-05-08 00:00:00',138),
 (12348,'2008-05-08 00:00:00',139),
 (12348,'2008-05-08 00:00:00',153),
 (12348,'2008-05-09 00:00:00',154),
 (12348,'2008-05-09 00:00:00',158),
 (12348,'2008-05-09 00:00:00',159),
 (12348,'2008-05-09 00:00:00',173),
 (12348,'2008-05-10 00:00:00',174),
 (12348,'2008-05-10 00:00:00',175),
 (12348,'2008-05-10 00:00:00',178),
 (12348,'2008-05-10 00:00:00',179),
 (12348,'2008-05-10 00:00:00',180),
 (12348,'2008-05-10 00:00:00',181),
 (12348,'2008-05-10 00:00:00',182),
 (12348,'2008-05-10 00:00:00',183),
 (12348,'2008-05-11 00:00:00',184),
 (12348,'2008-05-11 00:00:00',185),
 (12348,'2008-05-11 00:00:00',188),
 (12348,'2008-05-11 00:00:00',189),
 (12348,'2008-05-11 00:00:00',190),
 (12348,'2008-05-11 00:00:00',191),
 (12348,'2008-05-11 00:00:00',192),
 (12348,'2008-05-11 00:00:00',193),
 (12349,'2008-05-05 00:00:00',55),
 (12349,'2008-05-05 00:00:00',60),
 (12349,'2008-05-05 00:00:00',63),
 (12349,'2008-05-05 00:00:00',65),
 (12349,'2008-05-05 00:00:00',67),
 (12349,'2008-05-05 00:00:00',70),
 (12349,'2008-05-05 00:00:00',75),
 (12349,'2008-05-05 00:00:00',80),
 (12349,'2008-05-05 00:00:00',83),
 (12349,'2008-05-05 00:00:00',85),
 (12349,'2008-05-05 00:00:00',87),
 (12349,'2008-05-05 00:00:00',90),
 (12349,'2008-05-06 00:00:00',95),
 (12349,'2008-05-06 00:00:00',100),
 (12349,'2008-05-06 00:00:00',103),
 (12349,'2008-05-06 00:00:00',105),
 (12349,'2008-05-06 00:00:00',107),
 (12349,'2008-05-06 00:00:00',110),
 (12349,'2008-05-07 00:00:00',115),
 (12349,'2008-05-07 00:00:00',120),
 (12349,'2008-05-07 00:00:00',123),
 (12349,'2008-05-07 00:00:00',125),
 (12349,'2008-05-07 00:00:00',127),
 (12349,'2008-05-07 00:00:00',130),
 (12349,'2008-05-08 00:00:00',135),
 (12349,'2008-05-08 00:00:00',140),
 (12349,'2008-05-08 00:00:00',143),
 (12349,'2008-05-08 00:00:00',145),
 (12349,'2008-05-08 00:00:00',147),
 (12349,'2008-05-08 00:00:00',150),
 (12349,'2008-05-09 00:00:00',155),
 (12349,'2008-05-09 00:00:00',160),
 (12349,'2008-05-09 00:00:00',163),
 (12349,'2008-05-09 00:00:00',165),
 (12349,'2008-05-09 00:00:00',167),
 (12349,'2008-05-09 00:00:00',170),
 (12355,'2008-03-05 00:00:00',2),
 (12355,'2008-05-05 00:00:00',13),
 (12355,'2008-05-05 00:00:00',56),
 (12355,'2008-05-05 00:00:00',57),
 (12355,'2008-05-05 00:00:00',61),
 (12355,'2008-05-05 00:00:00',62),
 (12355,'2008-05-05 00:00:00',64),
 (12355,'2008-05-05 00:00:00',66),
 (12355,'2008-05-05 00:00:00',68),
 (12355,'2008-05-05 00:00:00',69),
 (12355,'2008-05-05 00:00:00',71),
 (12355,'2008-05-05 00:00:00',72),
 (12355,'2008-05-05 00:00:00',76),
 (12355,'2008-05-05 00:00:00',77),
 (12355,'2008-05-05 00:00:00',81),
 (12355,'2008-05-05 00:00:00',82),
 (12355,'2008-05-05 00:00:00',84),
 (12355,'2008-05-05 00:00:00',86),
 (12355,'2008-05-05 00:00:00',88),
 (12355,'2008-05-05 00:00:00',89),
 (12355,'2008-05-05 00:00:00',91),
 (12355,'2008-05-05 00:00:00',92),
 (12355,'2008-05-06 00:00:00',96),
 (12355,'2008-05-06 00:00:00',97),
 (12355,'2008-05-06 00:00:00',101),
 (12355,'2008-05-06 00:00:00',102),
 (12355,'2008-05-06 00:00:00',104),
 (12355,'2008-05-06 00:00:00',106),
 (12355,'2008-05-06 00:00:00',108),
 (12355,'2008-05-06 00:00:00',109),
 (12355,'2008-05-06 00:00:00',111),
 (12355,'2008-05-06 00:00:00',112),
 (12355,'2008-05-07 00:00:00',116),
 (12355,'2008-05-07 00:00:00',117),
 (12355,'2008-05-07 00:00:00',121),
 (12355,'2008-05-07 00:00:00',122),
 (12355,'2008-05-07 00:00:00',124),
 (12355,'2008-05-07 00:00:00',126),
 (12355,'2008-05-07 00:00:00',128),
 (12355,'2008-05-07 00:00:00',129),
 (12355,'2008-05-07 00:00:00',131),
 (12355,'2008-05-07 00:00:00',132),
 (12355,'2008-05-08 00:00:00',136),
 (12355,'2008-05-08 00:00:00',137),
 (12355,'2008-05-08 00:00:00',141),
 (12355,'2008-05-08 00:00:00',142),
 (12355,'2008-05-08 00:00:00',144),
 (12355,'2008-05-08 00:00:00',146),
 (12355,'2008-05-08 00:00:00',148),
 (12355,'2008-05-08 00:00:00',149),
 (12355,'2008-05-08 00:00:00',151),
 (12355,'2008-05-08 00:00:00',152),
 (12355,'2008-05-09 00:00:00',156),
 (12355,'2008-05-09 00:00:00',157),
 (12355,'2008-05-09 00:00:00',161),
 (12355,'2008-05-09 00:00:00',162),
 (12355,'2008-05-09 00:00:00',164),
 (12355,'2008-05-09 00:00:00',166),
 (12355,'2008-05-09 00:00:00',168),
 (12355,'2008-05-09 00:00:00',169),
 (12355,'2008-05-09 00:00:00',171),
 (12355,'2008-05-09 00:00:00',172),
 (12355,'2008-05-10 00:00:00',176),
 (12355,'2008-05-10 00:00:00',177),
 (12355,'2008-05-11 00:00:00',186),
 (12355,'2008-05-11 00:00:00',187);
/*!40000 ALTER TABLE `staffschedule` ENABLE KEYS */;


--
-- Definition of table `table3`
--

DROP TABLE IF EXISTS `table3`;
CREATE TABLE `table3` (
  `ddate` date default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table3`
--

/*!40000 ALTER TABLE `table3` DISABLE KEYS */;
/*!40000 ALTER TABLE `table3` ENABLE KEYS */;


--
-- Definition of table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `t_id` int(10) unsigned NOT NULL auto_increment,
  `fschedule_id` int(10) unsigned NOT NULL,
  `t_date` datetime default NULL,
  `t_action` enum('bye','reserve','cancel') NOT NULL,
  `c_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`t_id`),
  KEY `FK_transactions_1` (`fschedule_id`),
  KEY `FK_transactions_2` (`c_id`),
  CONSTRAINT `FK_transactions_1` FOREIGN KEY (`fschedule_id`) REFERENCES `flightschedule` (`fschedule_id`),
  CONSTRAINT `FK_transactions_2` FOREIGN KEY (`c_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` (`t_id`,`fschedule_id`,`t_date`,`t_action`,`c_id`) VALUES 
 (1,1,'2008-03-04 00:00:00','bye',1),
 (2,2,'2008-03-05 00:00:00','bye',2),
 (3,2,'2008-03-05 00:00:00','bye',2),
 (5,4,'2008-03-04 00:00:00','reserve',3),
 (6,5,'2008-03-04 00:00:00','reserve',3),
 (7,8,'2008-05-05 00:00:00','bye',2),
 (8,13,'2008-05-05 00:00:00','bye',4),
 (9,8,'2008-05-05 00:00:00','reserve',1),
 (10,8,'2008-05-05 00:00:00','reserve',2),
 (11,8,'2008-05-05 00:00:00','reserve',2),
 (12,8,'2008-05-05 00:00:00','reserve',3),
 (13,8,'2008-05-05 00:00:00','reserve',3),
 (14,8,'2008-05-05 00:00:00','reserve',4),
 (15,8,'2008-05-05 00:00:00','reserve',4),
 (16,3,'2008-05-05 00:00:00','reserve',4),
 (55,3,'2008-03-04 00:00:00','reserve',1),
 (56,8,'2008-05-05 00:00:00','bye',3),
 (57,8,'2008-05-05 00:00:00','reserve',3),
 (62,8,'2008-05-05 00:00:00','reserve',3),
 (64,8,'2008-05-05 00:00:00','bye',3),
 (66,3,'2008-05-06 00:00:00','bye',4),
 (67,3,'2008-05-06 00:00:00','bye',4),
 (78,3,'2008-05-06 23:42:32','reserve',4),
 (79,3,'2008-05-06 23:42:32','reserve',4),
 (80,3,'2008-05-06 23:42:33','reserve',4),
 (81,3,'2008-05-06 23:47:48','reserve',4),
 (82,3,'2008-05-06 23:47:49','reserve',4),
 (84,3,'2008-05-06 23:47:50','reserve',4),
 (85,3,'2008-05-07 00:00:28','reserve',4),
 (86,3,'2008-05-07 00:00:28','reserve',4),
 (87,3,'2008-05-07 00:00:29','reserve',4),
 (88,3,'2008-05-07 00:00:29','reserve',4),
 (89,3,'2008-05-07 00:00:29','reserve',4),
 (90,3,'2008-05-07 00:00:29','reserve',4),
 (91,3,'2008-05-07 00:00:29','reserve',4),
 (92,3,'2008-05-07 00:00:29','reserve',4),
 (93,3,'2008-05-07 00:00:29','reserve',4),
 (94,3,'2008-05-07 00:00:30','reserve',4),
 (95,3,'2008-05-07 00:00:30','reserve',4),
 (96,3,'2008-05-07 00:00:30','reserve',4),
 (97,3,'2008-05-07 00:00:30','reserve',4),
 (98,3,'2008-05-07 00:00:30','reserve',4),
 (99,3,'2008-05-07 00:00:30','reserve',4),
 (100,3,'2008-05-07 00:00:31','reserve',4),
 (101,3,'2008-05-07 00:00:31','reserve',4),
 (102,3,'2008-05-07 00:00:31','reserve',4),
 (103,3,'2008-05-07 00:00:31','reserve',4),
 (104,3,'2008-05-07 00:00:31','reserve',4),
 (105,3,'2008-05-07 00:00:32','reserve',4),
 (106,3,'2008-05-07 00:01:45','reserve',4),
 (107,3,'2008-05-07 00:02:04','reserve',4),
 (108,3,'2008-05-07 00:02:32','reserve',4),
 (109,3,'2008-05-07 00:05:19','reserve',4),
 (110,3,'2008-05-07 00:05:54','reserve',4),
 (111,3,'2008-05-07 00:06:09','reserve',4),
 (112,5,'2008-05-07 10:11:30','bye',3),
 (113,5,'2008-05-07 10:12:49','bye',3),
 (114,6,'2008-05-07 10:23:07','bye',4),
 (115,5,'2008-05-07 10:34:29','bye',3),
 (116,5,'2008-05-07 10:36:25','reserve',3),
 (117,5,'2008-05-07 10:37:57','reserve',3),
 (118,5,'2008-05-07 10:38:54','reserve',3),
 (119,5,'2008-05-07 10:40:18','reserve',3),
 (120,5,'2008-05-07 10:40:45','reserve',3),
 (121,5,'2008-05-07 10:43:22','reserve',3),
 (122,5,'2008-05-07 10:43:46','reserve',3),
 (123,5,'2008-05-07 10:48:08','reserve',3),
 (124,5,'2008-05-07 10:48:17','bye',3),
 (125,5,'2008-05-07 10:48:27','bye',3),
 (126,5,'2008-05-07 10:48:54','bye',3),
 (127,5,'2008-05-07 10:49:12','bye',3),
 (128,5,'2008-05-07 10:49:41','bye',3),
 (129,5,'2008-05-07 10:49:53','bye',3),
 (130,58,'2008-05-07 11:03:27','bye',3),
 (131,58,'2008-05-07 11:03:56','bye',3),
 (132,58,'2008-05-07 11:05:24','bye',3),
 (133,58,'2008-05-07 11:06:28','bye',3),
 (134,58,'2008-05-07 11:09:05','bye',3),
 (135,58,'2008-05-07 11:09:52','bye',3),
 (136,108,'2008-05-07 11:10:51','bye',3),
 (137,164,'2008-05-07 11:14:44','bye',3),
 (138,164,'2008-05-07 11:19:36','bye',3),
 (139,164,'2008-05-07 11:25:39','bye',3),
 (140,164,'2008-05-07 11:29:03','bye',3),
 (141,164,'2008-05-07 11:30:13','bye',3),
 (142,164,'2008-05-07 11:30:50','bye',3),
 (143,164,'2008-05-07 11:32:36','bye',3),
 (144,164,'2008-05-07 11:34:53','bye',3),
 (145,174,'2008-05-07 11:37:10','bye',3),
 (146,174,'2008-05-07 11:37:35','bye',3),
 (147,174,'2008-05-07 11:38:41','bye',3),
 (148,195,'2008-06-10 19:13:33','reserve',3),
 (150,195,'2008-06-10 21:28:59','reserve',3),
 (152,195,'2008-06-10 21:51:34','reserve',13),
 (153,195,'2008-06-10 22:06:05','reserve',14),
 (154,195,'2008-06-10 22:23:36','bye',1),
 (155,195,'2008-06-10 23:08:43','reserve',1),
 (156,195,'2008-06-10 23:10:29','bye',1);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;


--
-- Definition of table `travelagency`
--

DROP TABLE IF EXISTS `travelagency`;
CREATE TABLE `travelagency` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `travelagency`
--

/*!40000 ALTER TABLE `travelagency` DISABLE KEYS */;
INSERT INTO `travelagency` (`id`,`name`,`phone`,`address`) VALUES 
 (1,'Edw','698745621322','Xania edw 11'),
 (2,'Ekei','69812345622','Hrakleio ekei 11'),
 (3,'Panw','69812345622','Thessaloniki panw 18'),
 (4,'Mesh','698123478664','Athina mesh 22'),
 (5,'Paraperz','6987412565','Kerkyra parapera 44');
/*!40000 ALTER TABLE `travelagency` ENABLE KEYS */;


--
-- Definition of table `waitinglist`
--

DROP TABLE IF EXISTS `waitinglist`;
CREATE TABLE `waitinglist` (
  `tid` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`tid`),
  CONSTRAINT `FK_waitinglist_1` FOREIGN KEY (`tid`) REFERENCES `transactions` (`t_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `waitinglist`
--

/*!40000 ALTER TABLE `waitinglist` DISABLE KEYS */;
INSERT INTO `waitinglist` (`tid`) VALUES 
 (1),
 (2),
 (3),
 (110),
 (111),
 (112),
 (113),
 (115),
 (116),
 (117),
 (118),
 (119),
 (120),
 (121);
/*!40000 ALTER TABLE `waitinglist` ENABLE KEYS */;


--
-- Definition of table `weekendflights`
--

DROP TABLE IF EXISTS `weekendflights`;
CREATE TABLE `weekendflights` (
  `fcode` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`fcode`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `weekendflights`
--

/*!40000 ALTER TABLE `weekendflights` DISABLE KEYS */;
INSERT INTO `weekendflights` (`fcode`) VALUES 
 (1),
 (4),
 (6),
 (8),
 (10),
 (11),
 (14),
 (16),
 (18),
 (20);
/*!40000 ALTER TABLE `weekendflights` ENABLE KEYS */;


--
-- Definition of procedure `calc_clear_profit`
--

DROP PROCEDURE IF EXISTS `calc_clear_profit`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `calc_clear_profit`()
BEGIN
declare sumIncome, sumsalary, profit float default 0;
declare counter integer default 0;

call calc_monthly_income();
call get_employer_salary();

create temporary table tempppp (month integer, profit float);

while counter < 12 do
set counter = counter +1;

select amount into sumIncome
from ypol4
where curmonth = counter;

select sum(salary) into sumsalary
from salary;

set profit = sumIncome-sumsalary;
insert into tempppp values(counter, profit);
if counter = 3 then
select sumIncome, sumsalary;
end if;


end while;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `calc_flying_hours`
--

DROP PROCEDURE IF EXISTS `calc_flying_hours`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `calc_flying_hours`(
in id integer)
BEGIN
declare total_hours time;
declare fname, lname varchar(45);

select cast(sum(fd.duration)as time)  into total_hours
from fstaff f, staffschedule ss, flightschedule fs, flightdone fd
where f.id = id and
      f.id = ss.emp_id and
      ss.fschedule_id = fs.fschedule_id and
      fs.fschedule_id = fd.fschedule_id and
      month(curdate()) = month(fs.fdate);

select f.fname, f.lname
from fstaff f
where f.id = id into fname, lname;

select fname, lname, total_hours;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `calc_flying_hours_per_week`
--

DROP PROCEDURE IF EXISTS `calc_flying_hours_per_week`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `calc_flying_hours_per_week`(in id integer, in fdate date, out total integer)
BEGIN

declare total_hours integer default 0;
declare fname, lname varchar(45);
declare counter integer default 0;
declare cudate date;

while counter < 7 do
set cudate = date_sub(fdate, interval counter day);

select hour(cast(sum(fd.duration) as time)) into total_hours
from fstaff f, staffschedule ss, flightschedule fs, flightdone fd
where f.id = id and
      f.id = ss.emp_id and
      ss.fschedule_id = fs.fschedule_id and
      fs.fschedule_id = fd.fschedule_id and
      cudate = fs.fdate;


if total_hours is not null then
set total = total+total_hours;
end if;

set counter = counter+1;
end while;

select f.fname, f.lname
from fstaff f
where f.id = id into fname, lname;





END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `calc_fstaff_salary`
--

DROP PROCEDURE IF EXISTS `calc_fstaff_salary`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `calc_fstaff_salary`()
BEGIN
declare done bool default false;
declare jobb, fnamee, lnamee varchar(45);
declare fid, counter, grammes integer default 0;
declare dom, intt, total float default 0;

declare curssalary
        cursor for
        select id, fname, lname, job
        from test.fstaff;

set grammes = (select count(*) from fstaff);

drop temporary table if exists salary;
create temporary table salary (sid integer, slname varchar(45), sfname varchar(45), ssalary float);
open curssalary;


REPEAT
    fetch curssalary into fid,fnamee, lnamee,  jobb;
set counter = counter +1;
    set total = 0;
  set dom=0;
  set intt =0;


    IF NOT done THEN
       if jobb = 'pilot' then

    select fs.dom_hours*30 , fs.int_hours*60 into dom, intt
    from fsmonthlysalary fs
    where fid =fs.fs_id and
          month(curdate())-1 = fs.fmonth ;
    set total = dom+intt;

    insert into salary values(fid, lnamee, fnamee, total);
  elseif jobb = 'attendant' then

    select fs.dom_hours*15 , fs.int_hours*30
    from fsmonthlysalary fs
    where fid =fs.fs_id and
          month(curdate())-1 = fs.fmonth into dom, intt;
    set total = dom+intt;

    insert into salary values(fid, lnamee, fnamee, total);
  end if;
    END IF;
  UNTIL counter = grammes END REPEAT;

  close curssalary;




END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `calc_monthly_income`
--

DROP PROCEDURE IF EXISTS `calc_monthly_income`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `calc_monthly_income`()
BEGIN
declare counter integer default 0;
declare total float default 0;

call get_Income_by_flight();

create temporary table ypol4 ( curmonth integer, amount float);


while counter<12 do
set counter=counter + 1;
select sum(amount) into total
from ypol1
where year(curdate()) = year(fdate) and
      month(fdate) = counter;

insert into ypol4 values(counter, total);
end while;



END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `calc_TAgent_weekly_profit`
--

DROP PROCEDURE IF EXISTS `calc_TAgent_weekly_profit`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `calc_TAgent_weekly_profit`(in tagent_id integer)
BEGIN
declare katiti, temp integer default 0;
declare cuDate date;
declare ftime time;
declare total, dfinal float default 0.0;

create temporary table freeSeats(fdate date, code integer, fseats integer);


label1 : while katiti<8 do


set cuDate = date_sub(curdate(), interval katiti day);
set katiti = katiti+1;


select  sum(c.amount) into dfinal
        from flight f, flightsprogramm fp, flightschedule fs,travelagency ta, transactions t, madetransaction mt, cashier c
        where f.fcode = fp.flight_code and
              fp.programm_id = fs.fprogram_id and
              t.fschedule_id = fs.fschedule_id and
              t.t_id = mt.t_id and
              mt.t_type = 'tagent' and
              mt.id = ta.id and
              ta.id = tagent_id and
              fs.fdate = cuDate and
              c.tid = t.t_id
       order by ta.id;

if dfinal is null then
    iterate label1;
end if;
set total = total + dfinal;

end while;
select total;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `call_calc_monthly_income`
--

DROP PROCEDURE IF EXISTS `call_calc_monthly_income`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `call_calc_monthly_income`()
BEGIN

call calc_monthly_income();
select *
from ypol4;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `call_employer_salary`
--

DROP PROCEDURE IF EXISTS `call_employer_salary`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `call_employer_salary`()
BEGIN

call get_employer_salary();
select *
from ssalary
order by slname;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `call_find_free_seats`
--

DROP PROCEDURE IF EXISTS `call_find_free_seats`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `call_find_free_seats`(
in departure integer, in destination integer, in ffdate date, in dep_time time)
BEGIN
declare code, free_seats integer default 0;
declare ddate date;


select f.fcode, fs.fdate into code, ddate
from flight f, flightschedule fs, flightsprogramm fp
where f.destination = destination and
      f.departure = departure and
      f.dep_time = dep_time and
      f.fcode = fp.flight_code and
      fp.programm_id = fs.fprogram_id and
       fs.fdate = ffdate;

call findFreeSeats(code, ddate, free_seats);
select code, free_seats;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `call_fstaff_salary`
--

DROP PROCEDURE IF EXISTS `call_fstaff_salary`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `call_fstaff_salary`()
BEGIN

call calc_fstaff_salary();
select * from salary;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `call_get_Income_by_flight`
--

DROP PROCEDURE IF EXISTS `call_get_Income_by_flight`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `call_get_Income_by_flight`()
BEGIN

call get_Income_by_flight();
select *
from ypol1;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `cancel_reservation`
--

DROP PROCEDURE IF EXISTS `cancel_reservation`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancel_reservation`(
in fname varchar(45), in lname varchar(45), in destination integer, in departure integer, in fdate date, in ftime time)
BEGIN
declare code, wtid integer default 0;

select r.tid into code
from flight f, flightsprogramm fp, flightschedule fs, customer c, transactions t, reservation r
where f.destination = destination and
      f.departure = departure and
      f.dep_time = ftime and
      fp.flight_code = f.fcode and
      fp.programm_id = fs.fprogram_id and
      fs.fdate = fdate and
      fs.fschedule_id  = t.fschedule_id and
      t.t_id = r.tid and
      c.id = t.c_id and
      c.fname = fname and
      c.lname = lname
limit 1;

delete from reservation where tid = code;

select w.tid into wtid
from flight f, waitinglist w, transactions t1,transactions t2, flightschedule fs, flightsprogramm fp
where code = t1.t_id and
      t1.fschedule_id = fs.fschedule_id and
      fs.fprogram_id = fp.programm_id and
      f.fcode = fp.flight_code and
      t2.t_id = w.tid and
      t2.fschedule_id = fs.fschedule_id and
      t1.t_id <> t2.t_id
 limit 1;

delete from waitinglist where tid = wtid;


insert into reservation values(wtid);




END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `confirm_reservation_by_client_name`
--

DROP PROCEDURE IF EXISTS `confirm_reservation_by_client_name`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `confirm_reservation_by_client_name`(
in fname varchar(45), in lname varchar(45), in destination integer, in departure integer, in fdate date, in ftime time)
BEGIN

select distinct f.fcode,c.id, c.fname, c.lname, c.phone, f.destination, f.departure, fs.fdate, f.dep_time
from customer c, flight f, flightschedule fs, flightsprogramm fp, reservation r, transactions t
where f.destination = destination and
      f.departure=departure and
      f.dep_time = ftime and
      fp.flight_code= f.fcode and
      fp.programm_id = fs.fprogram_id and
      t.fschedule_id = fs.fschedule_id and
      fs.fdate = fdate and
      t.t_id = r.tid and
      t.c_id = c.id and
      c.fname = fname and
      c.lname = lname;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `delete_old_flights`
--

DROP PROCEDURE IF EXISTS `delete_old_flights`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_old_flights`()
BEGIN
create temporary table deleteTransactions(tid integer);
insert into deleteTransactions
select t.t_id
from flightdone fd, madetransaction mt, transactions t, flightschedule fs, flightsprogramm fp, flight f
where mt.t_id = t.t_id and
      t.fschedule_id = fs.fschedule_id and
      fp.programm_id = fs.fprogram_id and
      fp.flight_code = f.fcode and
      fd.fschedule_id = fs.fschedule_id and
      date_add(str_to_date(concat( fs.fdate, ' ',f.dep_time), '%Y-%m-%d %H:%i:%s'), interval 12 hour) < now();

delete deleteTransactions d, transactions t
from deleteTransactions d, transactions t
where t.t_id = d.tid;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `delete_reservations_12Hours_before`
--

DROP PROCEDURE IF EXISTS `delete_reservations_12Hours_before`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_reservations_12Hours_before`()
BEGIN
create temporary table deletee (tid integer);
insert into deletee
select t.t_id
from reservation r, transactions t, flightschedule fs, flightsprogramm fp, flight f
where r.tid = t.t_id and
      t.fschedule_id = fs.fschedule_id and
      fp.programm_id = fs.fprogram_id and
      fp.flight_code = f.fcode and
      date_sub(str_to_date(concat( fs.fdate, ' ',f.dep_time), '%Y-%m-%d %H:%i:%s'), interval 12 hour) < now();

delete deletee d, transactions t
from deletee d, transactions t
where t.t_id = d.tid;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `emergency_flights`
--

DROP PROCEDURE IF EXISTS `emergency_flights`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `emergency_flights`(in f1 date,in f2 date)
BEGIN

declare done ,bang bool default false;
declare fcode,temp1,fco1,f integer default 0;
declare datef,temp2,dada date;
declare wid,temp3,wi,vardep,d1,d2 integer default 0;
declare foo date default f1;
declare ti,ti2 time;
declare c integer default 0;
declare p float default 0.0;
declare var23 integer default 0;
declare depa time;
declare arri1,arri2 time;
declare tt,ttt time;
declare ac integer default 0;
declare fi date;
declare pil integer default 0;
declare deplim,arrlim, tempo time;
declare tempor time;
declare code1, code2 integer default 0;
declare da1,da2 date;
declare pid integer default 0;
declare fid integer default 0;
declare tyy,repid,refid integer default 0;
declare l,r integer default 0;
declare e date;
declare depare,arre time;
declare airtype integer default 0;
declare theseis integer default 0;

 declare kinhsh
        cursor for
        select *
        from olesoikrathseis;

 declare toutrans
        cursor for
        select *
        from teliko order by posothta desc;



declare continue handler
            for not found
            set done = true;




drop table if exists olesoikrathseis;
create temporary table olesoikrathseis(cod integer,dd date,waitid integer);



/*START TRANSACTION;*/



while date(f2)>date(foo) do

    set foo=date_add(f1, interval c day);

    set c=c +1;


     insert into olesoikrathseis (SELECT f.fcode as cod,fs.fdate as dd,w.tid as waitid
        from flightsprogramm fp,flightschedule fs,flight f,waitinglist w,transactions tr
            where fs.fdate=foo and fp.programm_id=fs.fprogram_id and fp.flight_code=f.fcode and
                f.departure='2' and tr.fschedule_id=fs.fschedule_id and tr.t_id=w.tid)order by cod;

/*insert into dates values(foo);*/


end while;



create temporary table teliko(fco integer,d date,posothta integer);
create temporary table dok(f integer,d1 integer,d2 integer,tt time,ttt time,p float);
create temporary table dokii(fi integer);
create temporary table delid(wwid integer);
create temporary table staff(l integer,e date,r integer);

open kinhsh;
loop1: loop
  fetch kinhsh into fcode, datef,wid;


      if done then
        insert into teliko values(temp1, temp2, temp3);
        leave loop1;
        end if;

if temp1=0 then
    set temp1=fcode;
    set temp2=datef;
    set temp3=0;
end if;

if temp1=fcode and temp2=datef then

      set temp3=temp3 +1;

else
    insert into teliko values(temp1, temp2, temp3);
    set temp1=fcode;
    set temp2=datef;
    set temp3=1;
end if;



end loop;
close kinhsh;
             /*select * from  olesoikrathseis;*/
/*select * from teliko;*/




set done=false;

START TRANSACTION;

set autocommit=0;


open toutrans;
repeat
  fetch toutrans into fco1, dada,wi;

savepoint s;

 if not done then


/*select dada;*/


select fl.destination into var23
from flight fl
where fl.fcode=fco1;
/*
select var23;
*/

select max(fl.dep_time),max(fl.arr_time) into ti,ti2
from flight fl,flightschedule fls,flightsprogramm fp
where fls.fdate=dada and fls.fprogram_id=fp.programm_id and fl.fcode=fp.flight_code and fl.destination=var23;
/*select ti;
select ti2;*/

set depa=time(addtime(ti,'01:00:00'));
set arri1=time(subtime(ti2,ti));
set arri2=time(addtime(depa,arri1));


set depare=time(addtime(arri2,'00:30:00'));
set arre=time(addtime(depare,arri1));

set deplim=subtime(depa,'01:00:00');
set tempor = addtime(arri1, arri1);
set tempo =addtime(tempor,'02:30:00');
set arrlim=addtime(deplim,tempo);



/*
if fco1='8' or fco1='9' or fco1='10' then

SELECT a.code into ac
FROM aircraft a,aircraft_type ty,flightschedule fs,flightsprogramm fp,flight fl
where
a.a_status='1' and ty.id<>'2' and ty.id=a.type_id
 and a.type_id=fp.aircraft_type and fs.fprogram_id=fp.programm_id
and fp.flight_code=fl.fcode and (fl.dep_time<=deplim and fl.arr_time>=arrlim)
limit 1;
insert into dokii values(ac);

else

SELECT a.code into ac
FROM aircraft a,aircraft_type ty,flightschedule fs,flightsprogramm fp,flight fl
where
a.a_status='1'  and ty.id=a.type_id
 and a.type_id=fp.aircraft_type and fs.fprogram_id=fp.programm_id
and fp.flight_code=fl.fcode and (fl.dep_time<=deplim and fl.arr_time>=arrlim)
limit 1;
*/






if fco1='8' or fco1='9' or fco1='10' then

select code into ac  from aircraft,aircraft_type
where aircraft_type.id=aircraft.TYPE_ID and aircraft.code not in(
select flightschedule.aircraft_code
from flight, flightsprogramm,flightschedule,aircraft_type,aircraft
where  aircraft.a_status=0 and aircraft.type_id=2 and flightschedule.fdate=dada and flightschedule.fprogram_id=flightsprogramm.programm_id and aircraft_type.id=flightsprogramm.aircraft_type
      and aircraft.code=flightschedule.aircraft_code and aircraft_type.id=aircraft.type_id and flightsprogramm.flight_code=flight.fcode
      and ((flight.dep_time>=deplim and flight.arr_time<=arrlim)
          or( flight.arr_time>=deplim)
          or(flight.dep_time<=arrlim)))

 limit 1;

else

select code into ac  from aircraft,aircraft_type
where aircraft_type.id=aircraft.TYPE_ID and aircraft.code not in(
select flightschedule.aircraft_code
from flight, flightsprogramm,flightschedule,aircraft_type,aircraft
where  aircraft.a_status=0 and flightschedule.fdate=dada and flightschedule.fprogram_id=flightsprogramm.programm_id and aircraft_type.id=flightsprogramm.aircraft_type
      and aircraft.code=flightschedule.aircraft_code and flightsprogramm.flight_code=flight.fcode
      and ((flight.dep_time>=deplim and flight.arr_time<=arrlim)
               or( flight.arr_time>=deplim)
          or(flight.dep_time<=arrlim)))

order by rand() limit 1 ;
end if;


select type_id into airtype from aircraft where code=ac;



select fstaff.id into pil
from fstaff,expertise
where fstaff.job='pilot' and  expertise.emp_id=fstaff.id and expertise.aircraft_type=airtype and fstaff.id not in (
select sc.emp_id
    from  fstaff st,staffschedule sc,flightschedule fs,flightsprogramm fp,flight fl
    where  st.id =sc.emp_id and sc.fdate=dada and sc.fschedule_id=fs.fschedule_id

    and fs.fprogram_id=fp.programm_id and fp.flight_code=fl.fcode
 and ((fl.dep_time>=deplim and fl.arr_time<=arrlim)
               or( fl.arr_time>=deplim)
          or(fl.dep_time<=arrlim)))

   order by rand() limit 1;
#insert into dokii values(pil);

select fstaff.id into code1
from fstaff
where fstaff.job='attendant' and fstaff.id not in (
select sc.emp_id
    from  fstaff st,staffschedule sc,flightschedule fs,flightsprogramm fp,flight fl
    where  st.id =sc.emp_id and sc.fdate=dada and sc.fschedule_id=fs.fschedule_id
    and fs.fprogram_id=fp.programm_id and fp.flight_code=fl.fcode
 and ((fl.dep_time>=deplim and fl.arr_time<=arrlim)
               or( fl.arr_time>=deplim)
          or(fl.dep_time<=arrlim)))
    order by rand() limit 1;

#insert into dokii values(code1);

select fstaff.id into code2
from fstaff
where fstaff.job='attendant' and fstaff.id<>code1 and fstaff.id not in (
select sc.emp_id
    from  fstaff st,staffschedule sc,flightschedule fs,flightsprogramm fp,flight fl
    where  st.id =sc.emp_id and sc.fdate=dada and sc.fschedule_id=fs.fschedule_id
    and fs.fprogram_id=fp.programm_id and fp.flight_code=fl.fcode

 and ((fl.dep_time>=deplim and fl.arr_time<=arrlim)
               or( fl.arr_time>=deplim)
          or(fl.dep_time<=arrlim)))
    order by rand() limit 1;




/*
insert into dokii values(wi);
select num_seats into theseis from aircraft_type where a_type=airtype;*/

if (ac<>0 and pil<>0 and code1<>0 and code2<>0 and wi>=(5)) then

select type_id into tyy
from aircraft
where code=ac;

select start_date,end_date into da1,da2
from flightsprogramm
where flight_code=fco1;

select max(programm_id)+1 into pid
from flightsprogramm;

select max(fschedule_id)+1 into fid
from flightschedule;

if (concat('96' , fco1) or concat('96' , fco1)) not in(select fcode from flight) then

if fco1='8' or fco1='9' or fco1='10' then

insert into flight values(concat('96' , fco1),'2',var23,depa,arri2,'120');
insert into flight values(concat('69' , fco1),var23,'2',depare,arre,'120');

else
      insert into flight values(concat('96' , fco1),'2',var23,depa,arri2,'80');
        insert into flight values(concat('69' , fco1),var23,'2',depare,arre,'80');
end if;
end if;

commit;



insert into flightsprogramm values(tyy,concat('96' , fco1),da1,da2, pid);
insert into flightschedule values( fid,ac,dada,pid );


set repid=pid +1;
set refid=fid+1;



insert into flightsprogramm values(tyy,concat('69' , fco1),da1,da2, repid);
insert into flightschedule values( refid,ac,dada,repid );








/*
insert into dokii values(code2);
insert into staff values(pil,dada,fid);
insert into staff values(code1,dada,fid);
insert into staff values(code2,dada,fid);
*/


insert into staffschedule values(pil,dada,fid);
insert into staffschedule values(pil,dada,refid);
insert into staffschedule values(code1,dada,fid);
insert into staffschedule values(code1,dada,refid);
insert into staffschedule values(code2,dada,fid);
insert into staffschedule values(code2,dada,refid);



insert into reservation(select waitid
from olesoikrathseis
where cod=fco1 and dd=dada);



insert into delid (select waitid
from olesoikrathseis
where cod=fco1 and dd=dada);

delete  waitinglist,delid  from waitinglist,delid where waitinglist.tid=delid.wwid;

else
rollback to savepoint s;


end if;





/*
if ac=Null then

select a.code into ac
 from aircraft a,aircraft_type ty,flightschedule fs
   where
 (a.a_status='1' and ty.id<>'2' and ty.id=a.type_id and fs.fdate<>dada)
limit 1;
end if;

*//*
end if;



*/






select wi;




set ac=0;
set pil=0;
set code1=0;
set code2=0;

/*
insert into delid (select waitid
from olesoikrathseis
where cod=fco1 and dd=dada);

update transactions,delid set transactions.t_action='reserve' where transactions.t_id=delid.wwid;
*/
 end if;
until done end repeat;
close toutrans;

#select * from dokii;

COMMIT;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `findClient-duration_NoImmediate`
--

DROP PROCEDURE IF EXISTS `findClient-duration_NoImmediate`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `findClient-duration_NoImmediate`()
BEGIN
declare duration, dur1, dur2, dur3 time;

create temporary table result6 (customer_code integer, fname varchar(45), lname varchar(45), phone varchar(45),code1 integer, code2 integer, duration time, waiting_time time);
insert into result6(customer_code, fname, lname, phone, code1, code2)
(select c1.id as customer_code, c1.fname as fname, c1.lname as lname, c1.phone as phone, f1.fcode as code1, f2.fcode as code2
from flight f1, flight f2, flightschedule fs1, flightschedule fs2, flightsprogramm fp1, flightprogramm fp2,
      transactions t1, transactions t2, customer c1, customer c2
where f1.destination = f2.departure and
      f1.departure <> f2.destination and
      f1.fcode = fp1.flight_code and f2.fcode = fp2.flight_code and
      fp1.programm_id = fs1.fprogram_id and fp2.programm_id = fs2.fprogram_id and
      t1.fschedule_id = fs1.fschedule_id and t2.fschedule_id = fs2.fschedule_id and
      c1.id = t1.c_id and c2.id = t2.c_id and
      c1.id = c2.id and
      timediff(f2.dep_time, f1.arr_time) < '06:00:00');

set dur1 = (select timediff(f.arr_time, f.dep_time)
              from flight f
              where f.fcode = code1);

set dur2 = (select timediff(f.arr_time, f.dep_time)
              from flight f
              where f.fcode = code2);

set dur3 = (select timediff(f1.arr_time, f2.dep_time)
              from flight f1, flight f2
              where f1.fcode = code1 and f2.fcode = code2);

set duration = dur1+dur2;
insert into result6(duration, waiting_time) values(duration, dur3);
select * from result6;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `findClient_duration_NoImmediate`
--

DROP PROCEDURE IF EXISTS `findClient_duration_NoImmediate`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `findClient_duration_NoImmediate`()
BEGIN
declare cust_code, grammes, counter  integer default 0;


create temporary table result6b (ccode integer, fname varchar(45), lname varchar(45), phone varchar(45), f1code integer, f2code integer);

insert into result6b
(select distinct c1.id as ccode, c1.fname as fname, c1.lname as lname, c1.phone as phone, f1.fcode as f1code, f2.fcode as f2code
from flight f1, flight f2, flightschedule fs1, flightschedule fs2, flightsprogramm fp1, flightsprogramm fp2,
      transactions t1, transactions t2, customer c1, customer c2
where f1.destination = f2.departure and
      f1.departure <> f2.destination and
      f1.fcode = fp1.flight_code and f2.fcode = fp2.flight_code and
      fp1.programm_id = fs1.fprogram_id and fp2.programm_id = fs2.fprogram_id and
      t1.fschedule_id = fs1.fschedule_id and t2.fschedule_id = fs2.fschedule_id and
      c1.id = t1.c_id and c2.id = t2.c_id and
      c1.id = c2.id and
      timediff(f2.dep_time, f1.arr_time) < '06:00:00' and
      timediff(f2.dep_time, f1.arr_time) > '00:00:00'
      );

call findClient_duration_NoImmediate_cursor();


END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `findClient_duration_NoImmediate_cursor`
--

DROP PROCEDURE IF EXISTS `findClient_duration_NoImmediate_cursor`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `findClient_duration_NoImmediate_cursor`()
BEGIN

declare done bool default false;
declare cust_code, grammes, counter  integer default 0;


declare duration,dur1, dur2, dur3,first_name, last_name, phone varchar(45);
declare code1, code2 integer;

declare NoImFlightCursor
         cursor for
         select *
          from result6b;

declare continue handler
for not found
set done = true;


create temporary table result6 (customer_code integer, fname varchar(45), lname varchar(45), phone varchar(45), duration time, waiting_time time);

set grammes = (select count(*) from result6b);

open NoImFlightCursor;

REPEAT

    fetch NoImFlightCursor into cust_code,first_name, last_name,  phone, code1, code2;
    set counter = counter+1;

    set duration =0;
    set dur1 = 0;
  set dur2=0;
  set dur3 =0;

    IF NOT done THEN





set dur1 = (select timediff(f.arr_time, f.dep_time)
              from flight f
              where f.fcode = code1);

set dur2 = (select timediff(f.arr_time, f.dep_time)
              from flight f
              where f.fcode = code2);

set dur3 = (select timediff(f2.dep_time, f1.arr_time)
              from flight f1, flight f2
              where f1.fcode = code1 and f2.fcode = code2);

set duration = addtime(dur1,dur2);
insert into result6 values(cust_code, first_name, last_name, phone, duration, dur3);



    END IF;
  UNTIL counter = grammes END REPEAT;

  close NoImFlightCursor;



select * from result6;


END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `findFreeSeats`
--

DROP PROCEDURE IF EXISTS `findFreeSeats`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `findFreeSeats`(
in fcode integer, in fdate date, out free_seats integer)
BEGIN


declare buy_seats integer;
declare res_seats integer;
declare total_seats integer;

set buy_seats = (select count(*)
                  from madetransaction mt, transactions t, flightschedule fs, flightsprogramm fp
                  where fp.flight_code=fcode and
                        fp.programm_id = fs.fprogram_id and
                        fs.fschedule_id = t.fschedule_id and
                        fs.fdate = fdate and
                        t.t_id = mt.t_id);

set res_seats =(select count(*)
                  from reservation rt, transactions t, flightschedule fs, flightsprogramm fp
                  where fp.flight_code=fcode and
                        fp.programm_id = fs.fprogram_id and
                        fs.fschedule_id = t.fschedule_id and
                        fs.fdate = fdate and
                        t.t_id = rt.tid);

set total_seats = (select distinct at.num_seats
                    from aircraft_type at, flightschedule fs, flightsprogramm fp
                    where fp.flight_code=fcode and
                        fp.programm_id = fs.fprogram_id and
                        fs.aircraft_code = at.id);

set free_seats = (total_seats - buy_seats - res_seats);

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `find_client`
--

DROP PROCEDURE IF EXISTS `find_client`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_client`(
in c_fname varchar(45), in c_lname varchar(45), in c_age integer, in c_phone varchar(45))
BEGIN

select id as cid
from customer
where fname = c_fname and lname = c_lname and
      age = c_age and phone = c_phone;



END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `first5Clients_from_waitinglist`
--

DROP PROCEDURE IF EXISTS `first5Clients_from_waitinglist`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `first5Clients_from_waitinglist`(
in destination integer, in departure integer, in fdate date, in ftime time)
BEGIN

select c.fname, c.lname, c.phone
from flight f, waitinglist w, customer c, transactions t, flightschedule fs, flightsprogramm fp
where f.destination = destination and
      f.departure = departure and
      f.dep_time = ftime and
      f.fcode = fp.flight_code and
      fp.programm_id = fs.fprogram_id and
      fs.fdate = fdate and
      t.fschedule_id = fs.fschedule_id and
      t.t_id = w.tid and
      t.c_id = c.id
limit 5;


END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `free_seats_in_external_flights`
--

DROP PROCEDURE IF EXISTS `free_seats_in_external_flights`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `free_seats_in_external_flights`()
BEGIN
declare katiti, free_seats, temp integer default 0;
declare cuDate date;
declare done bool default false;
declare ftime time;

declare curs7
        cursor for
        select *
        from result7;


declare continue handler
            for not found
            set done = true;





create temporary table freeSeats(fdate date, code integer, fseats integer);


while katiti<8 do
set done = false;
set cuDate = date_add(curdate(), interval katiti day);
set katiti = katiti+1;
drop temporary table if exists result7;
create temporary table result7 (fcode integer);
insert into result7 (
select f.fcode
from flightschedule fs, flight f, flightsprogramm fp
where fs.fdate=cuDate and
      fs.fprogram_id = fp.programm_id and
      fp.flight_code = f.fcode and
      (f.destination = '5' or f.destination = '6'));




open curs7;
loop1: loop
  fetch curs7 into temp;

  if done then
    close curs7;
    leave loop1;
  end if;


call findFreeSeats(temp, cuDate,free_seats);
insert into freeSeats values(cuDate, temp, free_seats);

end loop;


end while;
select * from freeSeats;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `getClosest_Least5FreeSeats_Dest_Time`
--

DROP PROCEDURE IF EXISTS `getClosest_Least5FreeSeats_Dest_Time`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClosest_Least5FreeSeats_Dest_Time`(
in destination integer, in dep_time time)
BEGIN

declare mindate, code, fseats1 integer default 0;
declare  closestDate date;
declare done bool default false;

declare curs3
        cursor for
        select *
        from temp3;


declare continue handler
            for not found
            set done = true;


create temporary table temp3 (ddate date, fss integer);
insert into temp3 select fs.fdate as ddate, f.fcode as fss
from flight f, flightschedule fs, flightsprogramm fp
where f.destination = destination and
      f.dep_time = dep_time and
      fp.flight_code  = f.fcode and
      fp.programm_id = fs.fprogram_id and fs.fdate>date_add(curdate(), interval -1 day);



drop table if exists table3;
create table table3(
ddate date);


open curs3;
loop1: loop
  fetch curs3 into closestDate, code;

  if done then
    leave loop1;
  end if;

call findFreeSeats(code, closestDate, fseats1);

if fseats1 > 5 then
  insert into table3 select temp3.ddate
  from temp3
  where datediff(temp3.ddate,  curdate())=
  (select min(datediff(fs1.fdate, curdate() )) into mindate
    from flight f1,  flightschedule fs1, flightsprogramm fp1
    where f1.destination = destination and
          f1.dep_time = dep_time and
          fp1.flight_code  = f1.fcode and
          fp1.programm_id = fs1.fprogram_id );

leave loop1;
end if;


end loop;
close curs3;

select closestDate, fseats1 as free_seats;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `getFlightByDep_Dest_date`
--

DROP PROCEDURE IF EXISTS `getFlightByDep_Dest_date`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFlightByDep_Dest_date`(
in departure integer, in destination integer, in dep_date datetime)
BEGIN

declare fcode integer default 0;
declare free_seats integer;
declare tamount integer default 0;

create temporary table temp (amount integer, ffcode integer);
insert into temp select  distinct f.price as amount , f.fcode as ffcode
from `flight` f, `flightschedule` fs, `flightsprogramm` fp
where fs.fdate = date(dep_date) and
    
    
    fs.fprogram_id = fp.programm_id and
    fp.flight_code = f.fcode and
    f.destination = destination and
    f.departure = departure and
     f.dep_time = time(dep_date);

set fcode = (select ffcode from temp);
set tamount = (select amount from temp);



call findFreeSeats(fcode, dep_date, free_seats);

select fcode, tamount, free_seats;




END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `getFlightsBydep_dest_NoImmediate`
--

DROP PROCEDURE IF EXISTS `getFlightsBydep_dest_NoImmediate`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFlightsBydep_dest_NoImmediate`(
in departure varchar(2), in destination varchar(2))
BEGIN
declare duration varchar(45);
declare startDateTime datetime;
declare done bool default false;
declare endDateTime datetime;
declare date1, date2 date;
declare time1, time2 time;
declare free_seats, fseats1, fseats2, fcode1, fcode2 integer default 0;
declare pric1, pric2, total float default 0;


declare curs1
        cursor for
        select *
        from temp2;


declare continue handler
            for not found
            set done = true;

declare exit handler
for sqlexception
close curs1;


create temporary table temp2 (depDate date, arrDate date, depTime time, arrTime time, price1 float, price2 float, code1 integer, code2 integer);
insert into temp2 select fs1.fdate as depDate, fs2.fdate as arrDate, f1.dep_time as depTime, f2.arr_time as arrTime, f1.price as price1, f2.price as price2, f1.fcode as code1, f2.fcode as code2
from flight f1, flight f2, flightschedule fs1, flightschedule fs2, flightsprogramm fp1, flightsprogramm fp2
where f1.departure = departure and f1.destination <> destination and
      f2.departure <> departure and f2.destination = destination and
      f1.destination = f2.departure and f1.fcode <> f2.fcode and
      f1.fcode = fp1.flight_code and f2.fcode = fp2.flight_code and
      fp1.programm_id = fs1.fprogram_id and fp2.programm_id = fs2.fprogram_id;



create temporary table table2 (
depdate date,
deptime time,
arrtime time,
duration time,
price float,
free_seats1 integer,
free_seats2 integer);

open curs1;
loop1: loop
  fetch curs1 into date1, date2, time1, time2, pric1, pric2, fcode1, fcode2;

  if done then
    close curs1;
    leave loop1;
  end if;

  set startDateTime = str_to_date(concat(date1, ' ', time1), '%Y-%m-%d %H:%i:%s');
  set endDateTime = str_to_date(concat(date2, ' ', time2), '%Y-%m-%d %H:%i:%s');
  set duration = timediff(startDateTime, endDateTime);
  set total = pric1+pric2;
call findFreeSeats(fcode1,str_to_date(date1, '%Y-%m-%d %H:%i:%s'), fseats1);
call findFreeSeats(fcode2, str_to_date(date2, '%Y-%m-%d %H:%i:%s'), fseats2);
  insert into table2 values(date1, time1, time2, duration, total, fseats1, fseats2);


end loop;

select * from table2;


END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `get_aircrafts_services`
--

DROP PROCEDURE IF EXISTS `get_aircrafts_services`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_aircrafts_services`()
BEGIN

select a.code, s.emp_id
from aircraft a left join services s
on a.code = s.aircraft_id;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `get_employer_salary`
--

DROP PROCEDURE IF EXISTS `get_employer_salary`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employer_salary`()
BEGIN

create temporary table ssalary(sid integer, slname varchar(45), sfname varchar(45), ssalary float);
call calc_fstaff_salary();

insert into ssalary select g.sid, g.slname, g.sfname, g.ssalary
      from salary g;


insert into ssalary select g.id, g.lname, g.fname, g.salary
      from gstaff g;





END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `get_flight_bigger_weekly_profit`
--

DROP PROCEDURE IF EXISTS `get_flight_bigger_weekly_profit`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_flight_bigger_weekly_profit`()
BEGIN

declare counter,dr, code, free_seats,fc, temp, flcode integer default 0;
declare fdate, cudate date;
declare pr,exoda,esoda float default 0.0;
declare dur time;
 create temporary table dok(exoda float,esoda float, fdate date);
create temporary table aaaa(fc integer,pr float,dur time);



while counter < 7 do
set counter = counter +1;

insert into aaaa
select  f.fcode ,f.price ,fd.duration
from flightdone fd, flightsprogramm fp, flightschedule fs, flight f
where fd.fschedule_id = fs.fschedule_id and
      fs.fprogram_id = fp.programm_id and
      f.fcode = fp.flight_code and
      fs.fdate = date_sub(curdate(), interval counter day);



set dr = (select  hour(cast(dur as time))) ;
select dr;
if pr='80' and dur is not null then
    set  exoda=dr*60;

elseif pr='120' and dur is not null then
      set exoda=dr*210;

end if;


select sum(c.amount) into esoda
from flightdone fd, flightsprogramm fp,flight f,flightschedule fs,transactions tr,madetransaction mt,cashier c
where fd.fschedule_id = fs.fschedule_id and
      fs.fprogram_id = fp.programm_id and
      f.fcode = fp.flight_code and
      fs.fdate = date_sub(curdate(), interval counter day)and
       tr.fschedule_id=fs.fschedule_id and
             mt.t_id=tr.t_id and
         tr.t_id=c.tid;

insert into dok values(exoda,esoda, date_sub(curdate(), interval counter day));

end while;

select *
from dok;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `get_flight_by_dest_date_time`
--

DROP PROCEDURE IF EXISTS `get_flight_by_dest_date_time`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_flight_by_dest_date_time`(
in destination integer, in dep_date varchar(45))
BEGIN


declare fcode integer default 0;
declare free_seats integer;
declare tamount integer default 0;


select distinct f.price , f.fcode into tamount, fcode
from `flight` f, `flightschedule` fs, `flightsprogramm` fp
where fs.fdate = date(dep_date) and
    fs.fprogram_id = fp.programm_id and
    fp.flight_code = f.fcode and
    f.destination = destination and
     f.dep_time = time(dep_date);

call findFreeSeats(fcode, date(dep_date), free_seats);

select fcode, tamount, free_seats;




END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `get_flight_from_athens_last_month`
--

DROP PROCEDURE IF EXISTS `get_flight_from_athens_last_month`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_flight_from_athens_last_month`()
BEGIN

select a.code, a.type_id, f.destination
from aircraft a, flightschedule fs, flightsprogramm fp, flight f
where month(curdate())-1 = month(fs.fdate) and
      f.departure = 2 and
      f.fcode = fp.flight_code and
      fp.programm_id = fs.fprogram_id and
      fs.aircraft_code = a.code;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `get_Income_by_flight`
--

DROP PROCEDURE IF EXISTS `get_Income_by_flight`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_Income_by_flight`()
BEGIN

declare done bool default false;
declare flight_code, temp1 integer default 0;
declare total_amount, temp2 float default 0;
declare ffdate, temp3 date;

declare cursy1
        cursor for
        select f.fcode, c.amount, fs.fdate
        from flight f,flightdone fd, flightsprogramm fp, flightschedule fs, transactions t, madetransaction mt, cashier c
        where f.fcode = fp.flight_code and
              fp.programm_id = fs.fprogram_id and
              t.fschedule_id = fs.fschedule_id and
              fd.fschedule_id = fs.fschedule_id and
              t.t_id = mt.t_id and
                c.tid = t.t_id
       order by f.fcode;


declare continue handler
            for not found
            set done = true;


create temporary table ypol1 (fcode integer, amount float, fdate date);

open cursy1;
loop1: loop
  fetch cursy1 into flight_code, total_amount, ffdate;

  if done then
    insert into ypol1 values(temp1, temp2, temp3);
    leave loop1;
  end if;
if temp1=0 then
  set temp1 = flight_code;
  set temp3 = ffdate;
end if;
if flight_code = temp1 and ffdate = temp3 then
  set temp2 = temp2+total_amount;
else
  insert into ypol1 values(temp1, temp2, temp3);
  set temp1 = flight_code;
  set temp2 = total_amount;
  set temp3 = ffdate;

end if;


end loop;
close cursy1;



END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `get_most_favourite_flight`
--

DROP PROCEDURE IF EXISTS `get_most_favourite_flight`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_most_favourite_flight`()
BEGIN
declare counter, code, free_seats, temp, flcode integer default 0;
declare fdate, cudate date;
 set temp = 10;
while counter < 7 do
set counter = counter +1;

select f.fcode, fs.fdate into code, fdate
from flightdone fd, flightsprogramm fp, flightschedule fs, flight f
where fd.fschedule_id = fs.fschedule_id and
      fs.fprogram_id = fp.programm_id and
      f.fcode = fp.flight_code and
      fs.fdate = date_sub(curdate(), interval counter day);

call findFreeSeats(code, fdate, free_seats);



if free_seats <= temp and free_seats is not null then
  set temp = free_seats;
  set cudate = fdate;
  set flcode = code;
end if;

end while;

select temp, cudate, flcode;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `get_staffschedule_by_date`
--

DROP PROCEDURE IF EXISTS `get_staffschedule_by_date`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_staffschedule_by_date`(
in fdate date)
BEGIN

select ss.emp_id, ss.fdate, ss.fschedule_id
from staffSchedule ss, flightschedule fs
where fs.fdate = fdate and
      fs.fschedule_id = ss.fschedule_id;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `get_staff_flightProgram`
--

DROP PROCEDURE IF EXISTS `get_staff_flightProgram`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_staff_flightProgram`(
in fname varchar(45), in lname varchar(45))
BEGIN

select fs.lname, fs.fname, ss.fdate, ss.fschedule_id, ss.emp_id
from fstaff fs, staffschedule ss
where fs.fname = fname and
        fs.lname = lname and
        fs.id = ss.emp_id;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `get_TravelAgencyIncome`
--

DROP PROCEDURE IF EXISTS `get_TravelAgencyIncome`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_TravelAgencyIncome`()
BEGIN
declare done bool default false;
declare t_code, temp1 integer default 0;
declare total_amount, temp2, temp3 float default 0;
declare cursy2
        cursor for
        select ta.id, c.amount
        from flight f, flightsprogramm fp, flightschedule fs,travelagency ta, transactions t, madetransaction mt, cashier c
        where f.fcode = fp.flight_code and
              fp.programm_id = fs.fprogram_id and
              t.fschedule_id = fs.fschedule_id and
              t.t_id = mt.t_id and
              mt.t_type = 'tagent' and
              mt.id = ta.id and
                c.tid = t.t_id
       order by ta.id;


declare continue handler
            for not found
            set done = true;


create temporary table ypol2 (id integer, amount float, hold float);

open cursy2;
loop1: loop
  fetch cursy2 into t_code, total_amount;

  if done then
set temp3 = temp2*(3/247);
    insert into ypol2 values(temp1, temp2, temp3);
    leave loop1;
  end if;
if temp1=0 then
  set temp1 = t_code;
end if;
if t_code = temp1 then
  set temp2 = temp2+total_amount;
else
  set temp3 = temp2*(3/247);
  insert into ypol2 values(temp1, temp2, temp3);
  set temp1 = t_code;
  set temp2 = total_amount;

end if;


end loop;
close cursy2;

select *
from ypol2;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insairtype`
--

DROP PROCEDURE IF EXISTS `insairtype`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insairtype`(IN par1 INTEGER, IN par2 INTEGER, IN par3 INTEGER)
BEGIN
insert into aircraft_type values(id,type, numseats);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertAircraft`
--

DROP PROCEDURE IF EXISTS `insertAircraft`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAircraft`(
in type_id integer, total_hours integer)
BEGIN
insert into `aircraft`(type_id, total_hours)
values(type_id, total_hours);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertAirport`
--

DROP PROCEDURE IF EXISTS `insertAirport`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAirport`(
in name varchar(45), in city varchar(45), in country varchar(2))
BEGIN
  insert into airport(name, city, country)
   values(name, city, country);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertAirType`
--

DROP PROCEDURE IF EXISTS `insertAirType`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAirType`(
IN a_type VARCHAR(45), IN numseats INTEGER)
BEGIN
  insert into aircraft_type(a_type, numseats) values(a_type, numseats);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertAuthorityTests`
--

DROP PROCEDURE IF EXISTS `insertAuthorityTests`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAuthorityTests`(
in authorityname varchar(10), in pass_rank integer, in description mediumtext)
BEGIN
insert into authoritytests(authorityname, pass_rank, description)
values(authorityname, pass_rank, description);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertExpertise`
--

DROP PROCEDURE IF EXISTS `insertExpertise`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertExpertise`(
in emp_id integer, in aircraft_type integer)
BEGIN
insert into expertise values(emp_id, aircaft_type);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertFlightDays`
--

DROP PROCEDURE IF EXISTS `insertFlightDays`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertFlightDays`(in fcode integer, in f_day integer)
BEGIN
insert into flight_days values(fcode, f_day);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertFlights`
--

DROP PROCEDURE IF EXISTS `insertFlights`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertFlights`(
in departure integer, in destination integer, in dep_time time,
 in arr_time time, in price float)
BEGIN
insert into flight(departure, destination, dep_time, arr_time, price)
values(departure, destination, dep_time, arr_time, price);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertFlightSchadule`
--

DROP PROCEDURE IF EXISTS `insertFlightSchadule`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertFlightSchadule`(in fdate date)
BEGIN
declare counter, fpcode, acode,arcode, countfd, totalHours, deprt integer default 0;
declare cudate, fddate date;
declare atype varchar(45);
declare passRank, rank, tempcode, exist, done integer default 0;





declare cursfs
        cursor for
        select *
        from weekendflights;




  

while countfd < 7 do
set countfd = countfd +1;
set fddate = date_sub(fdate, interval countfd day);


select cast(sum(fd.duration)as unsigned) into totalHours
from flightschedule fs, flightdone fd, aircraft a
where fs.fdate = fddate and
      fd.fschedule_id = fs.fschedule_id and
      fs.aircraft_code = a.code;

set arcode = (select a.code
from flightschedule fs, flightdone fd, aircraft a
where fs.fdate = fddate and
      fd.fschedule_id = fs.fschedule_id and
      fs.aircraft_code = a.code);

if totalHours >= 150 then
  update aircraft set a_status = 0, total_hours = 0 where code = arcode;
end if;

select at.pass_rank, s.rank into passRank, rank
from aircraft a, services s, authoritytests at
where a.code = arcode and
      a.code = s.aircraft_id and
      at.testcode = s.test_id ;

if passRank > rank then
  update aircraft set a_status = 0 where code = arcode;
  update services set s_status = 0 where aircraft_id = arcode;
else update aircraft set a_status = 1 where code = arcode;
update services set s_status = 1 where aircraft_id = arcode;
end if;

end while;




while counter < 7 do



set cudate = date_add(fdate, interval counter day);





drop temporary table if exists tempo;
create temporary table tempo(aircode integer);


if weekday(cudate) = 5 or weekday(cudate) =6 then

open cursfs;


while done < 10 do
  fetch cursfs into tempcode;
set atype = 0;
set acode =0;






set atype = (select aircraft_type
            from flightsprogramm
            where flight_code =tempcode);


set acode = (select a.code
            from aircraft a
            where a.type_id = atype and
                  a.a_status = 1
            limit 1);


select count(*)
from tempo
where aircode = acode into exist;


if exist>0 then

select a.code into acode
            from aircraft a, services s
            where a.type_id = atype and
                  a.a_status = 1 and a.code <> acode
            limit 1;

select count(*) into exist
from tempo
where aircode = acode;

end if;


insert into tempo values(acode);
insert into flightschedule( aircraft_code , fdate , fprogram_id )
values(acode,cudate, tempcode);
set done = done + 1;
 end while;
close cursfs;




else

while fpcode < 20 do
set fpcode = fpcode +1;

set atype =0;
set acode =0;

set atype = (select aircraft_type
            from flightsprogramm
            where programm_id = fpcode);


set acode = (select a.code
            from aircraft a, services s
            where a.type_id = atype and
                  a.a_status = 1
            limit 1);

while exist>0 do

select a.code into acode
            from aircraft a, services s
            where a.type_id = atype and
                  a.a_status = 1 and a.code <> acode
            limit 1;

select count(*) into exist
from tempo
where aircode = acode;

end while;


insert into tempo values(acode);
insert into flightschedule( aircraft_code , fdate , fprogram_id )
values(acode,cudate, fpcode);


end while;
set fpcode = 0;
end if;




set counter = counter +1;
end while;


call update_staff_schedule(fdate);
call update_flight_done(fdate);

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertFsAttendant`
--

DROP PROCEDURE IF EXISTS `insertFsAttendant`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertFsAttendant`(
 in fname varchar(45), in lname varchar(45), in birthdate datetime,
 in phone varchar(25), in address varchar(45), in lang_code varchar(2))
BEGIN
call insertFstaff(fname, lname, 'attendant', birthdate, phone, address);
insert into fsattendant(native_lang) values(lang_code);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertFstaff`
--

DROP PROCEDURE IF EXISTS `insertFstaff`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertFstaff`(
in fname varchar(45), in lname varchar(45), in job varchar(45),
in birthdate datetime, in phone varchar(25), in address varchar(45))
BEGIN
  insert into `fstaff`(fname, lname, job, birthdate, phone, address)
  values(fname, lname, job, birthdate, phone, address);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertGstaff`
--

DROP PROCEDURE IF EXISTS `insertGstaff`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGstaff`(
in fname varchar(45), in lname varchar(45), in job varchar(45),
in birthdate date, in phone varchar(20), in address varchar(45))
BEGIN

insert into gstaff(fname, lname, job, birthdate, phone, address)
values(fname, lname, job, birthdate, phone, address);

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertLanguage`
--

DROP PROCEDURE IF EXISTS `insertLanguage`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLanguage`(
in lang_code varchar(2), in name varchar(45))
BEGIN
insert into `language` values(lang_code, name);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertPilots`
--

DROP PROCEDURE IF EXISTS `insertPilots`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPilots`(
in fname varchar(45), in lname varchar(45),in birthdate datetime,
in phone varchar(25), in address varchar(45), in degree varchar(45))
BEGIN
call insertFstaff(fname, lname, 'pilot', birthdate, phone, address);
insert into fspilots values(LAST_INSERT_ID(), degree);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertReservation`
--

DROP PROCEDURE IF EXISTS `insertReservation`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertReservation`(
in tid integer)
BEGIN

insert into reservation values(tid);

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertService`
--

DROP PROCEDURE IF EXISTS `insertService`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertService`(
in emp_id integer, in aircraft_id integer, in service_date datetime,
in rank integer, in test_id integer)
BEGIN
insert into services(emp_id, aircraft_id, service_date, rank, test_id)
values(emp_id, aircraft_id, service_date, rank, test_id);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertTAgent`
--

DROP PROCEDURE IF EXISTS `insertTAgent`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertTAgent`(
in name varchar(20), in phone varchar(45), in address varchar(45))
BEGIN
insert into travelagency(name, phone, address) values(name, phone, address);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertTransaction`
--

DROP PROCEDURE IF EXISTS `insertTransaction`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertTransaction`(
in fschedule_id integer,
in t_action ENUM('bye', 'reserve', 'cancel'), in c_id integer,
in id integer, in typee varchar(45))
BEGIN

declare takenseatsmt, takenseatsr, dep, dest, ttid, lastid integer default 0;
declare total integer default 0;

declare trans_price float default 0;
declare tag_price float default 0;



 insert into transactions(fschedule_id, t_date, t_action, c_id)
   values(fschedule_id, now(), t_action, c_id);


set lastid = last_insert_id();

set takenseatsmt = (select count(*)
from madetransaction mt, transactions t, flightschedule fs
where mt.t_id = t.t_id and fschedule_id = fs.fschedule_id and
      t.fschedule_id = fs.fschedule_id
      );


set takenseatsr = (select count(*)
from reservation r, transactions t, flightschedule fs
where r.tid = t.t_id and fschedule_id = fs.fschedule_id and
      t.fschedule_id = fs.fschedule_id
      );


select takenseatsmt,takenseatsr;
set total = (select at.num_seats as total
from aircraft a, flightschedule f, aircraft_type at
where fschedule_id = f.fschedule_id and
      f.aircraft_code = a.code and
      a.type_id = at.id);


if takenseatsmt+takenseatsr >= total then
insert into waitinglist(tid) values(last_insert_id());
else
  if t_action = 'reserve' then
    insert into reservation values(last_insert_id());
  elseif t_action='bye' then
    insert into madetransaction values(id, last_insert_id(), typee);



set trans_price = (select f.price
from flight f, transactions t, flightschedule fs, flightsprogramm fp
                    where lastid = t.t_id and
                          t.fschedule_id = fs.fschedule_id and
                          fs.fprogram_id = fp.programm_id and
                          fp.flight_code = f.fcode);
if typee = 'gstaff' then
  insert into cashier values(lastid, trans_price);
elseif typee = 'tagent' then
  set tag_price = trans_price*0.988;
  insert into cashier values(lastid, tag_price);
end if;







    select f1.departure, f1.destination, t1.t_id into dep, dest, ttid
    from madetransaction mt, transactions t1,transactions t2, customer c1,customer c2,
        flightschedule fs1,flightschedule fs2, flightsprogramm fp1,flightsprogramm fp2,
         flight f1, flight f2
    where  t1.t_id = lastid and
          t1.fschedule_id = fs1.fschedule_id and
          fs1.fprogram_id = fp1.programm_id and
          fp1.flight_code = f1.fcode and
          t2.t_id = mt.t_id and
          t2.fschedule_id = fs2.fschedule_id and
          fs2.fprogram_id = fp2.programm_id and
          fp2.flight_code = f2.fcode and
          f2.departure = f1.destination and
          f2.destination = f1.departure and
          date(t1.t_date) = date(t2.t_date) and
          c1.id = t1.c_id and c2.id = t2.c_id
           and c1.id = c2.id
         limit 1;
if ttid is not null or ttid >0 then
    if dep=5 or dep =6 or dest = 5 or dest = 6 then
select 'here';
select amount
from cashier
where tid = ttid;
          update cashier set amount=(amount-amount*(0.15)) where tid = ttid;
    else
select 'there';
select amount
from cashier
where tid = ttid;
              update cashier set amount=(amount - amount*(0.08)) where tid = ttid;
    end if;

  end if;
end if;
end if;




END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insert_customer`
--

DROP PROCEDURE IF EXISTS `insert_customer`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_customer`(
in fname varchar(45), in lname varchar(45), in age integer,
in sex bit,in phone varchar(45))
BEGIN
insert into `customer`(fname, lname, age, sex, phone)
 values (fname, lname, age, sex, phone);
select last_insert_id() as cid;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insert_Spoken_language_to _attendant`
--

DROP PROCEDURE IF EXISTS `insert_Spoken_language_to _attendant`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_Spoken_language_to _attendant`(
in fname varchar(45), in lname varchar(45), in lang_code varchar(2))
BEGIN
declare code integer default 0;

select emp_id into code
from fsattendant
where fname =fname and lname = lname;

insert into spoken_lang values(code, lang_code);

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insert_Spoken_language_to_attendant`
--

DROP PROCEDURE IF EXISTS `insert_Spoken_language_to_attendant`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_Spoken_language_to_attendant`(
in fname varchar(45), in lname varchar(45), in lang_code varchar(2))
BEGIN
declare code integer default 0;

select fs.emp_id into code
from fsattendant fs, fstaff f
where f.fname =fname and f.lname = lname
        and fs.emp_id = f.id;

insert into spoken_langs values(code, lang_code);

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insert_weekend_flights`
--

DROP PROCEDURE IF EXISTS `insert_weekend_flights`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_weekend_flights`()
BEGIN

insert into weekendflights values('1'), ('11'), ('4'), ('14'), ('6'), ('16'), ('8'), ('18'),('10'), ('20');


END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `nnnnn`
--

DROP PROCEDURE IF EXISTS `nnnnn`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nnnnn`(
IN par1 INTEGER, IN par2 INTEGER, IN par3 INTEGER)
BEGIN
  insert into `aircraft_type` values(par1, par2, par3);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `reservations_by_dest_dep_date_time`
--

DROP PROCEDURE IF EXISTS `reservations_by_dest_dep_date_time`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `reservations_by_dest_dep_date_time`(
in destination integer, in departure integer, in fdate date, in dtime time)
BEGIN

select r.tid, t.c_id,c.fname, c.lname, c.phone
from flight f, flightschedule fs, flightsprogramm fp, transactions t, reservation r, customer c
where f.destination = destination and
      f.departure = departure and
      f.fcode = fp.flight_code and
      fs.fprogram_id = fp.programm_id and
      fs.fdate = fdate and
      f.dep_time = dtime and
      t.fschedule_id = fs.fschedule_id and
      t.t_id = r.tid and
       t.c_id = c.id;


END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `test`
--

DROP PROCEDURE IF EXISTS `test`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `test`()
BEGIN

call findFreeSeats('1', free_seats);
select free_seats;


END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `update_flight_done`
--

DROP PROCEDURE IF EXISTS `update_flight_done`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_flight_done`(in fdate date)
BEGIN

declare counter integer default 0;
declare cudate date;

while counter < 7 do
set cudate =date_sub(fdate, interval counter day);

insert into flightdone(
select fs.fschedule_id, timediff(f.arr_time, f.dep_time)
from flightschedule fs, flightsprogramm fp, flight f
where fs.fdate = cudate and
      fs.fprogram_id = fp.programm_id and
      f.fcode = fp.flight_code);


set counter = counter+1;
end while;



END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `update_staff_schedule`
--

DROP PROCEDURE IF EXISTS `update_staff_schedule`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_staff_schedule`(in fdate date)
BEGIN
declare counter, rep,countrep,pilot, attendant, attendant2,exist,  id ,aircraft_code, fprogram_id, totalHours integer default 0;
declare cudate, ffdate, bladate, bladdate date;

declare cursss
        cursor for
        select *
        from tempor;


drop temporary table if exists tempor;
create temporary table tempor(id integer,  aircraft_code integer, fdate  date, fprogram_id integer);


while counter < 7 do

set cudate = date_add(fdate, interval counter day);



insert into tempor select *
      from flightschedule
      where fdate = cudate;


set counter = counter+1;
end while;



set counter = 0;
select count(*) into rep
from tempor;



drop temporary table if exists temppilots;
create temporary table temppilots (id integer);



set bladate = fdate;
set bladdate = fdate;
open cursss;
while countrep < rep do
fetch cursss into id ,aircraft_code, ffdate, fprogram_id;






select f.emp_id into pilot
from aircraft a, fspilots f, expertise e
where a.code = aircraft_code and
      e.emp_id = f.emp_id and
      e.aircraft_type = a.type_id
 limit 1;

call calc_flying_hours_per_week(pilot, fdate, totalHours);

while totalHours >= 25 do
select f.emp_id into pilot
from aircraft a, fspilots f, expertise e
where a.code = aircraft_code and
      e.emp_id = f.emp_id and
      e.aircraft_type = a.type_id and
      f.emp_id <> pilot
 limit 1;

call calc_flying_hours_per_week(pilot, fdate, totalHours);


end while;



if bladate = ffdate then
select count(*) into exist
from temppilots
where id=pilot;

while exist > 0 do



select f.emp_id into pilot
from aircraft a, fspilots f, expertise e
where a.code = aircraft_code and
      e.emp_id = f.emp_id and
      e.aircraft_type = a.type_id and
        f.emp_id <> pilot
 limit 1;

call calc_flying_hours_per_week(pilot, fdate, totalHours);

while totalHours >= 25 do
select f.emp_id into pilot
from aircraft a, fspilots f, expertise e
where a.code = aircraft_code and
      e.emp_id = f.emp_id and
      e.aircraft_type = a.type_id and
      f.emp_id <> pilot
 limit 1;

call calc_flying_hours_per_week(pilot, fdate, totalHours);



end while;

select count(*) into exist
from temppilots
where id=pilot;

end while;

else
set bladate = ffdate;
drop temporary table if exists temppilots;
create temporary table temppilots (id integer);

end if;




insert into temppilots values(pilot);
insert into staffschedule values(pilot, ffdate, id);





select emp_id into attendant
from fsattendant
limit 1;

call calc_flying_hours_per_week(attendant, fdate, totalHours);

while totalHours >= 25 do


select emp_id into attendant
from fsattendant
where emp_id <> attendant
limit 1;

call calc_flying_hours_per_week(attendant, fdate, totalHours);


end while;










set countrep = countrep+1;
end while;
close cursss;



select *
from staffschedule;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
