CREATE DATABASE  IF NOT EXISTS `tour` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tour`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: tour
-- ------------------------------------------------------
-- Server version	5.6.19

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
-- Table structure for table `about_info`
--

DROP TABLE IF EXISTS `about_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `about_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_info`
--

LOCK TABLES `about_info` WRITE;
/*!40000 ALTER TABLE `about_info` DISABLE KEYS */;
INSERT INTO `about_info` VALUES (1,'介绍一下呗！');
/*!40000 ALTER TABLE `about_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_info`
--

DROP TABLE IF EXISTS `account_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_info` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_info`
--

LOCK TABLES `account_info` WRITE;
/*!40000 ALTER TABLE `account_info` DISABLE KEYS */;
INSERT INTO `account_info` VALUES (15,'zhangsan','123456');
/*!40000 ALTER TABLE `account_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_info`
--

DROP TABLE IF EXISTS `admin_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_info` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_info`
--

LOCK TABLES `admin_info` WRITE;
/*!40000 ALTER TABLE `admin_info` DISABLE KEYS */;
INSERT INTO `admin_info` VALUES (1,'admin','1234');
/*!40000 ALTER TABLE `admin_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_info`
--

DROP TABLE IF EXISTS `city_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_info` (
  `ct_id` int(11) NOT NULL AUTO_INCREMENT,
  `ct_name` varchar(30) NOT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`ct_id`),
  KEY `FK357DCEE28EBB0926` (`province_id`),
  CONSTRAINT `FK357DCEE28EBB0926` FOREIGN KEY (`province_id`) REFERENCES `province_info` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_info`
--

LOCK TABLES `city_info` WRITE;
/*!40000 ALTER TABLE `city_info` DISABLE KEYS */;
INSERT INTO `city_info` VALUES (1,'桂林',1),(2,'奋斗奋斗',6),(3,'南宁',1),(4,'加利福尼亚',4),(5,'广州',5),(6,'珠海',5);
/*!40000 ALTER TABLE `city_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_info`
--

DROP TABLE IF EXISTS `country_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_info` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(30) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_info`
--

LOCK TABLES `country_info` WRITE;
/*!40000 ALTER TABLE `country_info` DISABLE KEYS */;
INSERT INTO `country_info` VALUES (1,'美国'),(2,'中国');
/*!40000 ALTER TABLE `country_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_info`
--

DROP TABLE IF EXISTS `line_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_info` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_name` varchar(100) NOT NULL,
  `price` varchar(30) DEFAULT NULL,
  `imageUrl` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `lineClass_id` int(11) NOT NULL,
  `bgUrl` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`l_id`),
  KEY `FKC5F65F9F9541B2E` (`lineClass_id`),
  CONSTRAINT `FKC5F65F9F9541B2E` FOREIGN KEY (`lineClass_id`) REFERENCES `lineclass_info` (`lc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_info`
--

LOCK TABLES `line_info` WRITE;
/*!40000 ALTER TABLE `line_info` DISABLE KEYS */;
INSERT INTO `line_info` VALUES (1,'<海南三亚-4晚180海景5日游>热卖纯玩','30.0','/tour/resources/images/scenic/6.jpg','chdhghdgfhgdf妇女电话费肯德基风华绝代韩复榘胡椒粉',1,'/tour/resources/images/scenic1/4.jpg'),(4,'<恋上清迈休闲7日游>清迈古城 泰北风味餐 传统舞蹈表演 白庙','60.0','/tour/resources/images/scenic/7.jpg','佛挡杀佛第三方低功耗梵蒂冈',1,'/tour/resources/images/scenic1/3.jpg'),(5,'<新加坡-巴厘岛6日游>看巴厘黄昏 嬉戏巴厘 发呆巴厘','398.0','/tour/resources/images/scenic/8.jpg','<新加坡-巴厘岛6日游>看巴厘黄昏 嬉戏巴厘 发呆巴厘',1,'/tour/resources/images/scenic1/1.jpg'),(6,'<海南三亚-4晚180海景5日游>热卖纯玩','30.0','/tour/resources/images/scenic/12.jpg','多福多寿非官方的会更好',1,'/tour/resources/images/scenic1/2.jpg'),(7,'<迪拜-阿布扎比5日游>广西专属，赠特色餐，观光缆车，全程四星酒店','999.0','/tour/resources/images/scenic/10.jpg','<迪拜-阿布扎比5日游>广西专属，赠特色餐，观光缆车，全程四星酒店',1,'/tour/resources/images/scenic1/1.jpg'),(8,'<南宁直飞 首尔初夏自在5日游>赠送明洞半天自由活动 曹溪寺 仙游岛公园','899.0','/tour/resources/images/scenic/11.jpg','<南宁直飞 首尔初夏自在5日游>赠送明洞半天自由活动 曹溪寺 仙游岛公园',1,'/tour/resources/images/scenic1/2.jpg');
/*!40000 ALTER TABLE `line_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineclass_info`
--

DROP TABLE IF EXISTS `lineclass_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lineclass_info` (
  `lc_id` int(11) NOT NULL AUTO_INCREMENT,
  `lc_name` varchar(30) NOT NULL,
  PRIMARY KEY (`lc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineclass_info`
--

LOCK TABLES `lineclass_info` WRITE;
/*!40000 ALTER TABLE `lineclass_info` DISABLE KEYS */;
INSERT INTO `lineclass_info` VALUES (1,'自驾游'),(2,'团购'),(3,'游轮精选'),(4,'签证特惠'),(5,'国内跟团'),(6,'国外跟团');
/*!40000 ALTER TABLE `lineclass_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_info`
--

DROP TABLE IF EXISTS `order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_info` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `spot` varchar(30) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  KEY `FKA3E2D31F3959A3AE` (`account_id`),
  CONSTRAINT `FKA3E2D31F3959A3AE` FOREIGN KEY (`account_id`) REFERENCES `account_info` (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_info`
--

LOCK TABLES `order_info` WRITE;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
INSERT INTO `order_info` VALUES (1,'6',15,1),(2,'8',15,1),(3,'7',15,1),(4,'6',15,2);
/*!40000 ALTER TABLE `order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province_info`
--

DROP TABLE IF EXISTS `province_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province_info` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(30) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `FKB8B2A03DABDA3F0E` (`country_id`),
  CONSTRAINT `FKB8B2A03DABDA3F0E` FOREIGN KEY (`country_id`) REFERENCES `country_info` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province_info`
--

LOCK TABLES `province_info` WRITE;
/*!40000 ALTER TABLE `province_info` DISABLE KEYS */;
INSERT INTO `province_info` VALUES (1,'广西省',2),(4,'amdsa',1),(5,'广东省',2),(6,'fdwew',1);
/*!40000 ALTER TABLE `province_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenic_info`
--

DROP TABLE IF EXISTS `scenic_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenic_info` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(100) NOT NULL,
  `price` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `imageUrl` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `scenicClass_id` int(11) NOT NULL,
  `bgUrl` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `FK4117F77AD6E46A8E` (`scenicClass_id`),
  KEY `FK4117F77A7CBAB146` (`city_id`),
  CONSTRAINT `FK4117F77A7CBAB146` FOREIGN KEY (`city_id`) REFERENCES `city_info` (`ct_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK4117F77AD6E46A8E` FOREIGN KEY (`scenicClass_id`) REFERENCES `scenicclass_info` (`sc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenic_info`
--

LOCK TABLES `scenic_info` WRITE;
/*!40000 ALTER TABLE `scenic_info` DISABLE KEYS */;
INSERT INTO `scenic_info` VALUES (1,'<塞班岛6晚8日自助游>深圳转机转发，加州旅馆','30.0','电视剧刚看过分公司的风格','/tour/resources/images/scenic/1.jpg','fdjfkdhfjkh你的房间考试地点就是看不出就不大好时光',2,1,'/tour/resources/images/scenic1/1.jpg'),(2,'香港如心海景酒店暨会议中心','1','湖广会馆','/tour/resources/images/scenic/2.jpg','湖广会馆湖广会馆湖广会馆',4,1,'/tour/resources/images/scenic1/2.jpg'),(3,'橡皮山','30.0','第三方酒后驾驶','/tour/resources/images/scenic/3.png','发顺丰多少发顺丰顺丰',3,2,'/tour/resources/images/scenic1/4.jpg'),(4,'三人游','300.0','功夫功夫功夫','/tour/resources/images/scenic/4.jpg','当时的为企业与规范',1,3,'/tour/resources/images/scenic1/3.jpg'),(5,'动物园','230.0','公务附近的环境发的','/tour/resources/images/scenic/5.jpg','公务附近的环境发但是觉得还是结婚结婚的',5,2,'/tour/resources/images/scenic1/4.jpg'),(6,'欢乐谷','380.0','欢乐谷','/tour/resources/images/scenic/3.png','欢乐谷欢乐谷欢乐谷欢乐谷欢乐谷',4,1,'/tour/resources/images/scenic1/5.jpg'),(7,'南宁动物园','20.0','南宁动物园','/tour/resources/images/scenic/4.jpg','南宁动物园',3,1,'/tour/resources/images/scenic1/1.jpg'),(8,'海洋公园','350.0','海洋公园','/tour/resources/images/scenic/7.jpg','海洋公园',4,1,'/tour/resources/images/scenic1/2.jpg'),(9,'迪斯尼乐园','588.0','迪斯尼乐园','/tour/resources/images/scenic/9.jpg','迪斯尼乐园',4,1,'/tour/resources/images/scenic1/4.jpg');
/*!40000 ALTER TABLE `scenic_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenicclass_info`
--

DROP TABLE IF EXISTS `scenicclass_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenicclass_info` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_name` varchar(30) NOT NULL,
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenicclass_info`
--

LOCK TABLES `scenicclass_info` WRITE;
/*!40000 ALTER TABLE `scenicclass_info` DISABLE KEYS */;
INSERT INTO `scenicclass_info` VALUES (1,'游乐园'),(2,'人文景观'),(3,'亲子'),(4,'美食'),(5,'海岛');
/*!40000 ALTER TABLE `scenicclass_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(30) NOT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `account_id` (`account_id`),
  KEY `FK8BA9F8823959A3AE` (`account_id`),
  CONSTRAINT `FK8BA9F8823959A3AE` FOREIGN KEY (`account_id`) REFERENCES `account_info` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (12,'zhangsan',NULL,NULL,NULL,15);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-21 22:35:44
