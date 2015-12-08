-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: onlinebanking
-- ------------------------------------------------------
-- Server version	5.5.44-0+deb7u1

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
-- Current Database: `onlinebanking`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `onlinebanking` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `onlinebanking`;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `a_num` int(11) NOT NULL,
  `type` char(8) NOT NULL,
  `ballance` decimal(16,2) NOT NULL,
  `holds` decimal(8,2) DEFAULT NULL,
  `b_id` int(11) NOT NULL,
  PRIMARY KEY (`a_num`),
  KEY `fk_branch_id` (`b_id`),
  CONSTRAINT `fk_branch_id` FOREIGN KEY (`b_id`) REFERENCES `branch` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'checking',14020.12,0.00,1),(2,'checking',3258.43,0.00,1),(3,'checking',352.01,0.00,1),(4,'checking',0.00,20.00,1),(5,'checking',1029.10,0.00,1),(6,'checking',1048.49,0.00,1),(7,'checking',11748.49,0.00,1),(8,'checking',9183.81,0.00,1),(9,'checking',383.74,0.00,1),(10,'checking',49.05,0.00,1),(11,'checking',4023.05,0.00,1),(12,'checking',429.55,0.00,1),(13,'checking',632.13,0.00,1),(14,'checking',732.41,0.00,1),(15,'checking',29.43,0.00,1),(16,'checking',0.00,20.00,1),(17,'checking',23.01,0.00,1),(18,'checking',2.11,0.00,1),(19,'checking',222.86,0.00,1),(20,'checking',921.93,0.00,1),(21,'savings',11230.00,0.00,2),(22,'checking',872.00,0.00,2),(23,'checking',122.18,0.00,2),(24,'savings',71000.00,0.00,2),(25,'checking',7123.29,0.00,2),(26,'checking',824.08,0.00,2),(27,'checking',980.92,0.00,2),(28,'checking',41.40,0.00,2),(29,'checking',410.80,0.00,2),(30,'savings',23000.00,0.00,2),(31,'savings',2214.00,0.00,2),(32,'checking',1243.00,0.00,2),(33,'checking',431.34,0.00,2),(34,'checking',135.01,0.00,2),(35,'checking',1304.30,0.00,2),(36,'checking',43.30,0.00,2),(37,'checking',934.90,0.00,2),(38,'checking',0.00,20.00,2),(39,'checking',124.99,0.00,2),(40,'checking',999.99,0.00,3),(41,'checking',9343.33,0.00,3),(42,'checking',99.24,0.00,3),(43,'savings',41000.24,0.00,3),(44,'checking',3904.95,0.00,3),(45,'checking',2943.24,0.00,3),(46,'checking',7102.40,0.00,3),(47,'checking',431.03,0.00,3),(48,'checking',9373.34,0.00,3),(49,'checking',5343.24,0.00,3),(50,'savings',235.00,0.00,3),(51,'savings',59412.00,0.00,3),(52,'checking',42523.00,0.00,3),(53,'checking',424.14,0.00,3),(54,'checking',862.35,0.00,3),(55,'checking',932.23,0.00,3),(56,'savings',99999999999999.99,0.00,3);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `account_info`
--

DROP TABLE IF EXISTS `account_info`;
/*!50001 DROP VIEW IF EXISTS `account_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `account_info` (
  `a_num` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `ballance` tinyint NOT NULL,
  `holds` tinyint NOT NULL,
  `c_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `banker`
--

DROP TABLE IF EXISTS `banker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banker` (
  `e_id` int(11) NOT NULL,
  `first_name` char(50) NOT NULL,
  `last_name` char(75) NOT NULL,
  `salary` decimal(12,2) DEFAULT NULL,
  `dob` date NOT NULL,
  `b_id` int(11) NOT NULL,
  `card_number` decimal(16,0) NOT NULL,
  PRIMARY KEY (`e_id`),
  KEY `fk_work_id` (`b_id`),
  CONSTRAINT `fk_work_id` FOREIGN KEY (`b_id`) REFERENCES `branch` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banker`
--

LOCK TABLES `banker` WRITE;
/*!40000 ALTER TABLE `banker` DISABLE KEYS */;
INSERT INTO `banker` VALUES (1,'James','Anderson',45000.00,'1964-04-21',1,4521124353940201),(2,'Mark','Walker',42000.00,'1967-02-12',1,4521124353940202),(3,'Mike','Mitchell',42000.00,'1969-01-04',1,4521124353940203),(4,'Christopher','Allen',40000.00,'1972-10-07',1,4521124353940204),(5,'Jeff','Carter',39000.00,'1970-09-29',1,4521124353940205),(6,'Sarah','Hall',47000.00,'1961-12-24',2,4521124353940206),(7,'Daniel','Hall',45000.00,'1963-08-17',2,4521124353940207),(8,'John','Phillips',45000.00,'1965-04-14',2,4521124353940208),(9,'Andre','Turcotte',48000.00,'1965-03-17',2,4521124353940209),(10,'Joseph','Allen',42000.00,'1965-03-23',2,4521124353940210),(11,'Marie','Sartre',42000.00,'1974-07-30',3,4521124353940211),(12,'Donald','King',50000.00,'1969-10-02',3,4521124353940212),(13,'Elizabeth','Collins',48000.00,'1972-01-09',3,4521124353940213),(14,'Ricardo','Hernandez',46000.00,'1972-05-04',3,4521124353940214),(15,'James','Green',43000.00,'1977-04-15',3,4521124353940215);
/*!40000 ALTER TABLE `banker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower`
--

DROP TABLE IF EXISTS `borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower` (
  `c_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  KEY `c_id` (`c_id`),
  KEY `loan_id` (`loan_id`),
  CONSTRAINT `borrower_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `customer` (`c_id`) ON DELETE CASCADE,
  CONSTRAINT `borrower_ibfk_2` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower`
--

LOCK TABLES `borrower` WRITE;
/*!40000 ALTER TABLE `borrower` DISABLE KEYS */;
INSERT INTO `borrower` VALUES (1,1),(2,3),(2,2),(4,4),(9,5),(11,6),(14,7),(16,8),(18,9),(21,10),(22,11),(25,12),(25,13),(28,14),(39,15),(31,16),(32,17),(34,18),(41,19),(45,20),(44,21),(10,22),(46,23),(37,24),(42,25);
/*!40000 ALTER TABLE `borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `b_id` int(11) NOT NULL,
  `branch_address` char(64) NOT NULL,
  `branch_region` char(32) NOT NULL,
  `branch_country` char(2) NOT NULL,
  `branch_city` char(32) NOT NULL,
  `branch_postal` char(12) NOT NULL,
  `branch_phone` int(11) NOT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'1871 Hollis St-Suite 100','NS','CA','Halifax','B3J 0C3',2147483647),(2,'700 Place d\'Youville','QC','CA','Quebec City','G1R 3P2',2147483647),(3,'200 Bay St','ON','CA','Toronto','M5J 2J5',2147483647);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `c_id` int(11) NOT NULL,
  `card_number` decimal(16,0) DEFAULT NULL,
  `passwd` char(32) NOT NULL,
  `first_name` char(50) DEFAULT NULL,
  `last_name` char(75) NOT NULL,
  `address` char(64) DEFAULT NULL,
  `city` char(32) DEFAULT NULL,
  `country` char(2) DEFAULT NULL,
  `postal_code` char(16) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `banker` int(11) NOT NULL,
  PRIMARY KEY (`c_id`),
  UNIQUE KEY `unique_card` (`card_number`),
  KEY `fk_banker_id` (`banker`),
  CONSTRAINT `fk_banker_id` FOREIGN KEY (`banker`) REFERENCES `banker` (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,4540025121478301,'123456','Carol','Parker','22 robinson dr.','Halifax','CA','B7L 1K3','1982-03-20',1),(2,4540025121478302,'58b4e38f66bcdb546380845d6af27187','Syndrom','Parkinson','10 brunswick dr.','Halifax','CA','B7L 1K1','1982-04-11',1),(3,4540025121478303,'e9fbf92f363e00e495b75aea68a20395','Lisa','Garcia','37 brunswick dr.','Halifax','CA','B3L 1K1','1984-05-08',1),(4,4540025121478304,'58b4e38f66bcdb546380845d6af27187','Jeff','Evans','71 brunswick dr.','Halifax','CA','B3L 1K4','1983-07-11',2),(5,4540025121478305,'f73d7a272eaae495900df632965c5265','Chicken','Cambpell','11 Robie dr.','Halifax','CA','B3L 1J8','1983-11-09',2),(6,4540025121478306,'07631128992a7461d6226b02724a7a47','Summer','Camp','11 Sackville dr.','Halifax','CA','B3K 1J2','1967-01-07',2),(7,4540025121478307,'ed44beb2b63aaebfc5061ff49c413995','Herald','Jenkins','11 Sackville dr.','Halifax','CA','B3I 1J9','1923-01-08',3),(8,4540025121478308,'d114cdfe5aaa6925112d87b4878ae06d','Marie','Baker','92 Crow cr.','Halifax','CA','B3T 1K9','1935-02-04',3),(9,4540025121478309,'6bcac4aeff5cd16ca48da2d9be231ebe','Frank','Bastard','41 Springfield dr.','Halifax','CA','B3T 1H2','1941-04-11',4),(10,4404330022180209,'f4ef214abe2f7ef7aa5a20255e93cbf4','Alexander','Robinson','41 Sackville dr.','Halifax','CA','B3T 1L2','1943-03-12',4),(11,4404330022180210,'d0c6f41c48021a0e8335accf867188f4','Kenneth','Robinson','41 Sackville dr.','Halifax','CA','B3T 1L1','1951-12-17',4),(12,4404330022180211,'a6d70b0b180dae9ac94e90d5fa39aba5','Max','Martin','19 Queen dr.','Halifax','CA','B3T 1T1','1999-11-11',5),(13,4404330022180212,'a6d70b0b180dae9ac94e90d5fa39aba5','Thomas','Martin','19 Queen dr.','Halifax','CA','B3T 1T1','1963-02-01',5),(14,4404330022180213,'a6d70b0b180dae9ac94e90d5fa39aba5','Jennifer','Martin','19 Queen dr.','Halifax','CA','B3T 1T1','1963-04-12',5),(15,4404330022180214,'2b867b11b2d488d36d5c8981fed12ff1','Kenneth','White','1900 Watter st.','Halifax','CA','B3T 1X1','1988-02-22',5),(16,4404330022180215,'9f906341c724e96c30450e73578ac487','Anne','Ste-Piere','8231 Ste-Foy','Quebec City','CA','G1T 1X1','1982-02-20',6),(17,4404330022180216,'e9c122f3bf5fb113a9a15dc07578de50','David','Lapierre','24 Commercial rue.','Quebec City','CA','G5L 1X3','1986-07-21',6),(18,4404330022180217,'62fd7eef6738b488e68e5c556bb995c3','Rick','Pedro','42 Commercial rue.','Quebec City','CA','G2L 1X4','1993-02-03',6),(19,4404330022180218,'b641b6638b0f61092bbaa45c99aa72c3','Simmon','Veilleux','Saint-Jean rue','Quebec City','CA','G2L 1D4','1990-05-05',7),(20,4404330022180219,'b0e7224319b3c8569be631881474abcf','Peedee','Puffin','Charest ave','Quebec City','CA','G2P 1K4','1984-05-18',7),(21,4404330022180220,'5f4dcc3b5aa765d61d8327deb882cf99','Sarge','Schau','1244 Saint-Jean ch.','Quebec City','CA','D2P 1R4','1977-09-22',8),(22,4404330022180221,'bdc87b9c894da5168059e00ebffb9077','Jean-Paul','Trudeau','142 St Joseph','Quebec City','CA','G2P 1T4','1979-11-16',8),(23,4404330022180222,'59f5719b74522b6d8fbf52f090a77eca','Simone','Trudeau','142 St Joseph','Quebec City','CA','G2P 1T4','1979-11-16',8),(24,4404330022180223,'5f4dcc3b5aa765d61d8327deb882cf99','Raymond','Robertson','213 Drack rue','Quebec City','CA','G4T 3R2','1966-02-06',9),(25,4404330022180224,'bdc87b9c894da5168059e00ebffb9077','Christopher','Robertson','213 Drack rue','Quebec City','CA','G4T 3R2','1974-12-14',9),(26,4404330022180225,'277d3ebc1fc0a21d50db031c9849f868','Ray','Robertson','213 Drack rue','Quebec City','CA','G4T 3R2','2003-02-11',9),(27,4404330022180226,'402fd6af80d80e346b96c89d37aae805','David','Rousseau','24 Saunier rue','Quebec City','CA','G4T 8T2','1992-09-19',10),(28,4404330022180227,'61fd809f2d7cfdd91cddc057f3ab65f1','Sean','Richards','73 Sommait rue','Quebec City','CA','G5T 5C2','1993-11-19',10),(29,4404330022180228,'a9975bb2c410306f9c90560657da79a2','Odessa','Rice','3 Cartier rue','Quebec City','CA','G5T 1C4','1956-05-29',10),(30,4404330022180229,'5f4dcc3b5aa765d61d8327deb882cf99','Kevin','Rice','3 Cartier rue','Quebec City','CA','G5T 1C4','2009-11-21',10),(31,4404330022180230,'dec891ce8418e5bc69177f5ae2388a32','Kim','Redds','41 Tongue st.','Toronto','CA','M4L 2C1','1991-03-21',11),(32,4404330022180231,'84fe120fae9b787b3da40b70cae25cac','Mike','Black','41 Tongue st.','Toronto','CA','M4L 2C1','1998-08-11',11),(33,4404330022180232,'7f51272ceab12ff751d93522da8edf2f','Jay','Dumbard','491 Stewart st.','Toronto','CA','M0J 1J1','1983-10-10',11),(34,4404330022180233,'e8dca7cbed3f959b3ecb0b135b4b1707','Karrie','Garret','92 Garner st.','Toronto','CA','M4J 3D1','1943-02-22',11),(35,4404330022180234,'0db9caf79e1c79f239411a52fc06b405','Santa','Drew','71 Garner st.','Toronto','CA','M4J 3D1','1945-12-31',11),(36,4404330022180235,'451ebf12064b826f3c773f737808c254','Jack','Seymour','71 Hurt st.','Toronto','CA','M4J 30','1976-11-19',12),(37,4404330022180236,'499ca86077111653321e583ef73dae7d','Lee','Kei','718 Tabbet st.','Toronto','CA','M4K 3D0','1979-03-19',12),(38,4404330022180237,'0cbdf75e6c838aa0542d8c45c179b5fe','Lara','Kirk','882 Trevor st.','Toronto','CA','M3L 3D0','1990-04-29',13),(39,4404330022180238,'31e80aacf74f7171e536a1287ee13603','Sandra','Fraser','8 Travis st.','Toronto','CA','M3L 0R3','1973-10-20',13),(40,4404330022180239,'5d9a31605bf532bc3bd6e4250c77d5e2','Melissa','Power','9231 Turtle st.','Toronto','CA','M3L 2O0','1974-10-11',13),(41,4404330022180240,'eb6d55628f5d2365000a0947f095998e','Sarah','Martin','9231 Turks st.','Toronto','CA','M4L 2R0','1987-06-14',13),(42,4404330022180241,'9e732d703776f6a241f86029ca5a516f','Ronald','MacDonald','9231 Turks st.','Toronto','CA','M4L 2R0','1987-06-14',13),(43,4404330022180242,'aa2d672f8cced0becb0f05f28bd64a91','Hannah','Cocks','914 Rock st.','Toronto','CA','M3L 2T0','1989-10-10',14),(44,4404330022180243,'533e529b0b6b76985834dcf129ff1666','Drake','Cocks','914 Rock st.','Toronto','CA','M3L 2T0','1989-10-10',14),(45,4404330022180244,'1510e7104e3918824dca89a13fcb9e34','Mike','Hawk','462 Rockalnd st.','Toronto','CA','M3T 5T4','1984-10-24',15),(46,4404330022180245,'39d96ef52f8457e09897dbf36d2643e8','Mike','Littoris','462 Rockalnd st.','Toronto','CA','M3T 5T4','1982-08-01',15),(47,4404330022180246,'bfac43cf998743cf28ab2df433f405ae','Carol','Leak','462 Duvet st.','Toronto','CA','M3T 5R5','1990-10-12',15),(48,4404330022180247,'0655205d2c277ecc9de8ce9ddc6893bd','Rick','Leak','462 Duvet st.','Toronto','CA','M3T 5R5','1994-08-10',15);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `customer_info`
--

DROP TABLE IF EXISTS `customer_info`;
/*!50001 DROP VIEW IF EXISTS `customer_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customer_info` (
  `c_id` tinyint NOT NULL,
  `first_name` tinyint NOT NULL,
  `last_name` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `country` tinyint NOT NULL,
  `postal_code` tinyint NOT NULL,
  `dob` tinyint NOT NULL,
  `banker_id` tinyint NOT NULL,
  `banker_fname` tinyint NOT NULL,
  `banker_lname` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `depositor`
--

DROP TABLE IF EXISTS `depositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depositor` (
  `c_id` int(11) NOT NULL,
  `a_num` int(11) NOT NULL,
  KEY `c_id` (`c_id`),
  KEY `a_num` (`a_num`),
  CONSTRAINT `depositor_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `customer` (`c_id`) ON DELETE CASCADE,
  CONSTRAINT `depositor_ibfk_2` FOREIGN KEY (`a_num`) REFERENCES `account` (`a_num`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositor`
--

LOCK TABLES `depositor` WRITE;
/*!40000 ALTER TABLE `depositor` DISABLE KEYS */;
INSERT INTO `depositor` VALUES (1,3),(2,4),(3,15),(4,14),(5,1),(6,2),(7,2),(6,7),(7,13),(8,5),(9,8),(10,12),(11,9),(12,19),(13,20),(14,16),(15,17),(9,18),(9,6),(15,10),(3,11),(16,39),(17,37),(18,21),(18,22),(19,22),(19,23),(20,31),(20,34),(21,38),(22,33),(23,24),(24,26),(25,25),(26,36),(26,35),(27,30),(28,27),(29,28),(30,29),(18,32),(40,40),(31,56),(32,56),(33,41),(34,42),(35,43),(36,44),(39,45),(37,46),(38,47),(38,48),(41,49),(42,50),(43,50),(44,51),(45,52),(46,53),(47,54),(47,55),(48,56);
/*!40000 ALTER TABLE `depositor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan` (
  `loan_id` int(11) NOT NULL,
  `interest_rate` decimal(8,2) NOT NULL,
  `ballance` decimal(16,2) NOT NULL,
  `b_id` int(11) NOT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `fk_bank_id` (`b_id`),
  CONSTRAINT `fk_bank_id` FOREIGN KEY (`b_id`) REFERENCES `branch` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,2.50,2500.00,1),(2,2.50,700.00,1),(3,2.50,691.21,1),(4,2.50,24000.00,1),(5,5.00,390000.00,1),(6,5.00,494300.00,1),(7,2.50,4300.00,1),(8,2.50,443300.00,2),(9,2.50,853243.00,2),(10,5.00,3414.00,2),(11,5.00,593.00,2),(12,5.00,835.00,2),(13,5.00,14534.00,2),(14,1.00,1453404.00,2),(15,5.00,3553.00,2),(16,10.00,34532.00,3),(17,10.00,23452.00,3),(18,7.50,93243.00,3),(19,7.50,23524.00,3),(20,7.50,543.00,3),(21,7.50,4333.00,3),(22,7.50,345.00,3),(23,10.00,345000.00,3),(24,10.00,345342.00,3),(25,7.50,5343.00,3);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `loan_info`
--

DROP TABLE IF EXISTS `loan_info`;
/*!50001 DROP VIEW IF EXISTS `loan_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `loan_info` (
  `loan_id` tinyint NOT NULL,
  `interest_rate` tinyint NOT NULL,
  `ballance` tinyint NOT NULL,
  `c_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'onlinebanking'
--
/*!50003 DROP PROCEDURE IF EXISTS `getAccountInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAccountInfo`(IN ty CHAR(11), id INT)
BEGIN
  SELECT ballance, holds FROM account_info WHERE type=ty AND c_id=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loanPayment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `loanPayment`(IN acc INT, amnt DECIMAL(16,2), loan INT)
BEGIN
  UPDATE account
  SET ballance = ballance-amnt WHERE a_num=acc;
  UPDATE loan
  SET ballance = ballance-amnt WHERE loan_id=loan;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `setPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setPassword`(IN pass CHAR(32), id INT)
BEGIN
  UPDATE customer SET passwd=pass WHERE c_id=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `transferToAcc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `transferToAcc`(IN acc1 INT, amnt DECIMAL(16,2), acc2 INT)
BEGIN
  UPDATE account
  SET ballance = ballance-amnt WHERE a_num=acc1;
  UPDATE account
  SET ballance = ballance+amnt WHERE a_num=acc2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `onlinebanking`
--

USE `onlinebanking`;

--
-- Final view structure for view `account_info`
--

/*!50001 DROP TABLE IF EXISTS `account_info`*/;
/*!50001 DROP VIEW IF EXISTS `account_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `account_info` AS select `a`.`a_num` AS `a_num`,`a`.`type` AS `type`,`a`.`ballance` AS `ballance`,`a`.`holds` AS `holds`,`d`.`c_id` AS `c_id` from (`account` `a` join `depositor` `d`) where (`a`.`a_num` = `d`.`a_num`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_info`
--

/*!50001 DROP TABLE IF EXISTS `customer_info`*/;
/*!50001 DROP VIEW IF EXISTS `customer_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_info` AS select `c`.`c_id` AS `c_id`,`c`.`first_name` AS `first_name`,`c`.`last_name` AS `last_name`,`c`.`address` AS `address`,`c`.`city` AS `city`,`c`.`country` AS `country`,`c`.`postal_code` AS `postal_code`,`c`.`dob` AS `dob`,`b`.`e_id` AS `banker_id`,`b`.`first_name` AS `banker_fname`,`b`.`last_name` AS `banker_lname` from (`customer` `c` join `banker` `b`) where (`c`.`banker` = `b`.`e_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `loan_info`
--

/*!50001 DROP TABLE IF EXISTS `loan_info`*/;
/*!50001 DROP VIEW IF EXISTS `loan_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `loan_info` AS select `l`.`loan_id` AS `loan_id`,`l`.`interest_rate` AS `interest_rate`,`l`.`ballance` AS `ballance`,`c`.`c_id` AS `c_id` from (`loan` `l` join `borrower` `c`) where (`l`.`loan_id` = `c`.`loan_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-08 16:06:12
