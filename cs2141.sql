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
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `banker` VALUES (1,'James','Anderson',45000.00,'1964-04-21',1),(2,'Mark','Walker',42000.00,'1967-02-12',1),(3,'Mike','Mitchell',42000.00,'1969-01-04',1),(4,'Christopher','Allen',40000.00,'1972-10-07',1),(5,'Jeff','Carter',39000.00,'1970-09-29',1),(6,'Sarah','Hall',47000.00,'1961-12-24',2),(7,'Daniel','Hall',45000.00,'1963-08-17',2),(8,'John','Phillips',45000.00,'1965-04-14',2),(9,'Andre','Turcotte',48000.00,'1965-03-17',2),(10,'Joseph','Allen',42000.00,'1965-03-23',2),(11,'Marie','Sartre',42000.00,'1974-07-30',3),(12,'Donald','King',50000.00,'1969-10-02',3),(13,'Elizabeth','Collins',48000.00,'1972-01-09',3),(14,'Ricardo','Hernandez',46000.00,'1972-05-04',3),(15,'James','Green',43000.00,'1977-04-15',3);
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
  `card_number` int(11) NOT NULL,
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
  KEY `fk_banker_id` (`banker`),
  CONSTRAINT `fk_banker_id` FOREIGN KEY (`banker`) REFERENCES `banker` (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-22 14:17:10
