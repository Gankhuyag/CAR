-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.2    Database: superman
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bidCount` int(11) NOT NULL,
  `currentBidAmount` double NOT NULL,
  `endDate` datetime NOT NULL,
  `minBidAmount` double NOT NULL,
  `startDate` datetime NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `currentHighestBidder_id` bigint(20) DEFAULT NULL,
  `property_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_p8pvgxvhe8wx19fq10hpm2cwv` (`currentHighestBidder_id`),
  KEY `FK_i4ruddgudh9l49rce4bde68q6` (`property_id`),
  CONSTRAINT `FK_i4ruddgudh9l49rce4bde68q6` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`),
  CONSTRAINT `FK_p8pvgxvhe8wx19fq10hpm2cwv` FOREIGN KEY (`currentHighestBidder_id`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (1,0,1060,'2017-12-04 17:00:00',1060,'2017-11-27 09:00:00','ACTIVE',NULL,1),(2,0,1500,'2017-12-04 17:00:00',1500,'2017-11-27 09:00:00','ACTIVE',NULL,2),(3,0,2000,'2017-12-04 17:00:00',2000,'2017-11-27 09:00:00','ACTIVE',NULL,3);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jppqmhdbr3w1xapwum7yt8612` (`username`),
  CONSTRAINT `FK_jppqmhdbr3w1xapwum7yt8612` FOREIGN KEY (`username`) REFERENCES `credential` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES (1,'ROLE_USER','eshankuthu'),(2,'ROLE_USER','Henok'),(3,'ROLE_USER','Steward');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bidAmount` double NOT NULL,
  `bidDate` datetime DEFAULT NULL,
  `auction_id` bigint(20) DEFAULT NULL,
  `bidder_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_n9g3fww9ionagl5p81dewejna` (`auction_id`),
  KEY `FK_1j3qhc78t1lwlj9jtp0qe7f6n` (`bidder_id`),
  CONSTRAINT `FK_1j3qhc78t1lwlj9jtp0qe7f6n` FOREIGN KEY (`bidder_id`) REFERENCES `user` (`userId`),
  CONSTRAINT `FK_n9g3fww9ionagl5p81dewejna` FOREIGN KEY (`auction_id`) REFERENCES `auction` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (1,1068,'2017-11-20 23:14:57',1,2),(2,1067,'2017-11-20 23:22:52',1,3),(3,1700,'2017-11-20 23:23:20',2,3);
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credential`
--

DROP TABLE IF EXISTS `credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential` (
  `username` varchar(255) NOT NULL,
  `enable` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credential`
--

LOCK TABLES `credential` WRITE;
/*!40000 ALTER TABLE `credential` DISABLE KEYS */;
INSERT INTO `credential` VALUES ('eshankuthu','','$2a$10$I.ZaU4E9KFwaui74Y6et7On/WdqaJbZgePDPxjXOfeQBIjP5BlnP.'),('Henok','','$2a$10$4oklApWP6lKvilDFwBxX7O./Konz8/CQoCYju23IIzZKxJ6LnBj3K'),('Steward','','$2a$10$j.fxfvcD5KyGtwUnVg8NZeGKANuEq.xWYmCPwJsMVXeV4BZukuexm');
/*!40000 ALTER TABLE `credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persistent_logins` (
  `series` varchar(255) NOT NULL,
  `last_used` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_logins`
--

LOCK TABLES `persistent_logins` WRITE;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `prefix` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
INSERT INTO `phone` VALUES (1,7089,999,999),(2,3232,323,323),(3,7089,555,555);
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cylinders` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `expectedPrice` double NOT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  `model` varchar(255) NOT NULL,
  `odometer` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sus0tbhi3ngfj3k4ilbby5n1f` (`owner_id`),
  CONSTRAINT `FK_sus0tbhi3ngfj3k4ilbby5n1f` FOREIGN KEY (`owner_id`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,'6','You may preview the vehicle on Monday and Tuesday.Please call the yard ahead of time to ensure prompt service.',1060,'/CAS/resources/images/0.png','Taurus',62917,'2011 Ford Taurus ',1),(2,'4','Hybrid SUV ,Year 2008',1500,'/CAS/resources/images/0.png','Escape Hybrid',212688,'2008 Ford Escape Hybrid',2),(3,'8','If the winning bidder lives within 50 miles of Times Square, NY, the vehicle must be picked up within 2 business days of payment ',2000,'/CAS/resources/images/0.png','E350',153831,'2006 Ford E350',3);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `userStatus` varchar(255) DEFAULT NULL,
  `phone_id` bigint(20) DEFAULT NULL,
  `user_userId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `FK_mo0rg27y6a2e7r8yh5jnp1m8i` (`phone_id`),
  KEY `FK_4s6r0w81t7yvec8mtltfnq0tf` (`user_userId`),
  CONSTRAINT `FK_4s6r0w81t7yvec8mtltfnq0tf` FOREIGN KEY (`user_userId`) REFERENCES `credential` (`username`),
  CONSTRAINT `FK_mo0rg27y6a2e7r8yh5jnp1m8i` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'kuthu.eshan@gmail.com','eshan ','kuthu','APPROVED',1,'eshankuthu'),(2,'Henok@gmail.com','Henok ','Yared ','APPROVED',2,'Henok'),(3,'Dickson@gmail.com','Steward','Dickson','APPROVED',3,'Steward');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-20 23:33:04
