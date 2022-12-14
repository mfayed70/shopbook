CREATE DATABASE  IF NOT EXISTS "shopbook" /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shopbook`;
-- MySQL dump 10.13  Distrib 5.7.38, for Linux (x86_64)
--
-- Host: localhost    Database: shopbook
-- ------------------------------------------------------
-- Server version	5.7.38

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
-- Temporary table structure for view `Search_V`
--

DROP TABLE IF EXISTS `Search_V`;
/*!50001 DROP VIEW IF EXISTS `Search_V`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Search_V` AS SELECT 
 1 AS `LAST_MODIFIED`,
 1 AS `NOTES`,
 1 AS `SHOP_CAT_CODE`,
 1 AS `SHOP_SUB_CAT_CODE`,
 1 AS `cats_search`,
 1 AS `SUB_CAT_IMAGE_NAME`,
 1 AS `SUB_CAT_IMAGE_TYPE`,
 1 AS `APPEAR_ONLY_IN_ASS`,
 1 AS `ASSEMBLY`,
 1 AS `AVAILABLE`,
 1 AS `BRAND_CODE`,
 1 AS `CAT_SZ_CLASS_CODE`,
 1 AS `HIDE`,
 1 AS `Sku_Last_Modified`,
 1 AS `LAST_PRICE`,
 1 AS `MNF_CODE`,
 1 AS `MODEL_CODE`,
 1 AS `NEW_FLAG`,
 1 AS `Sku_Notes`,
 1 AS `OLD_PRICE`,
 1 AS `QNTY_IN_STOCK`,
 1 AS `RATE`,
 1 AS `SHOP_CAT_SUB_CODE`,
 1 AS `SHP_PROP_CLS_CODE`,
 1 AS `SKU_CODE`,
 1 AS `sku_search`,
 1 AS `YEAR`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `BRAND_CODE` varchar(6) NOT NULL COMMENT 'UML to Offline Database Transform: Column BRAND_CODE created from UML attribute "brand code" in UML class "brand"',
  `BRAND_NAME` varchar(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column BRAND_NAME created from UML attribute "brand name" in UML class "brand"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "brand"',
  `REGISTER_STATUS` varchar(1) NOT NULL DEFAULT 'R' COMMENT 'UML to Offline Database Transform: Column REGISTER_STATUS created from UML attribute "register status" in UML class "brand"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP,
  `SHOP_CODE` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`BRAND_CODE`),
  KEY `SHOP_REQ_NEW_BRANDS` (`SHOP_CODE`),
  KEY `BRANDS_INDEX` (`BRAND_CODE`),
  CONSTRAINT `SHOP_REQ_NEW_BRANDS` FOREIGN KEY (`SHOP_CODE`) REFERENCES `shops` (`SHOP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table BRANDS created from UML class "brand"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES ('B00000','','n/a','R','2019-07-11 19:53:39',NULL),('B00001','Dell',NULL,'A','2019-07-12 14:08:49',NULL),('B00002','Jack & Jones',NULL,'A','2019-07-12 14:09:23',NULL),('B00003','IKEA',NULL,'A','2019-07-12 14:09:08',NULL),('B00004','Toshiba',NULL,'A','2019-10-05 17:48:44',NULL),('B00005','Clarks',NULL,'A','2021-09-21 06:48:56',NULL),('B00006','Carina',NULL,'A','2022-08-29 17:06:05',NULL);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_mnf_brnd_mdl_yers`
--

DROP TABLE IF EXISTS `cat_mnf_brnd_mdl_yers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_mnf_brnd_mdl_yers` (
  `CMBMY_CODE` varchar(30) NOT NULL COMMENT 'UML to Offline Database Transform: Column CMBMY_CODE created from UML attribute "cmbmy code" in UML class "cat mnf brnd mdl yer"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "cat mnf brnd mdl yer"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "cat mnf brnd mdl yer"',
  `BRAND_CODE` varchar(6) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column BRAND_TO_CAT created as default foreign key column for foreign key "BRAND_TO_CAT"',
  `CAT_CODE` varchar(5) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column CAT_MBMY created as default foreign key column for foreign key "CAT_MBMY"',
  `MNF_CODE` varchar(6) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column MANUFACTURE_TO_CAT created as default foreign key column for foreign key "MANUFACTURE_TO_CAT"',
  `MODEL_CODE` varchar(9) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column MODEL_TO_CAT created as default foreign key column for foreign key "MODEL_TO_CAT"',
  `YEAR` int(4) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column YEAR_TO_CAT created as default foreign key column for foreign key "YEAR_TO_CAT"',
  PRIMARY KEY (`CMBMY_CODE`),
  KEY `BRAND_TO_CAT` (`BRAND_CODE`),
  KEY `CAT_MBMY` (`CAT_CODE`),
  KEY `MANUFACTURE_TO_CAT` (`MNF_CODE`),
  KEY `MODEL_TO_CAT` (`MODEL_CODE`),
  KEY `YEAR_TO_CAT` (`YEAR`),
  KEY `CAT_MNF_BRND_MDL_YERS_INDEX` (`CMBMY_CODE`),
  CONSTRAINT `BRAND_TO_CAT` FOREIGN KEY (`BRAND_CODE`) REFERENCES `brands` (`BRAND_CODE`),
  CONSTRAINT `CAT_MBMY` FOREIGN KEY (`CAT_CODE`) REFERENCES `categories` (`CAT_CODE`),
  CONSTRAINT `MANUFACTURE_TO_CAT` FOREIGN KEY (`MNF_CODE`) REFERENCES `manufactures` (`MNF_CODE`),
  CONSTRAINT `MODEL_TO_CAT` FOREIGN KEY (`MODEL_CODE`) REFERENCES `models` (`MODEL_CODE`),
  CONSTRAINT `YEAR_TO_CAT` FOREIGN KEY (`YEAR`) REFERENCES `years` (`YEAR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table CAT_MNF_BRND_MDL_YERS created from UML class "cat mnf brnd mdl yer"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint BRAND_TO_CAT created for UML association "brand to cat"\r\nUML to Offline Database Transform: Foreign key constraint CAT_MBMY created for UML association "cat mbmy"\r\nUML to Offline Database Transform: Foreign key constraint MANUFACTURE_TO_CAT created for UML association "manufacture to cat"\r\nUML to Offline Database Transform: Foreign key constraint MODEL_TO_CAT created for UML association "model to cat"\r\nUML to Offline Database Transform: Foreign key constraint YEAR_TO_CAT created for UML association "year to cat"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_mnf_brnd_mdl_yers`
--

LOCK TABLES `cat_mnf_brnd_mdl_yers` WRITE;
/*!40000 ALTER TABLE `cat_mnf_brnd_mdl_yers` DISABLE KEYS */;
INSERT INTO `cat_mnf_brnd_mdl_yers` VALUES ('G0001B00003F00004M000000011970',NULL,'2021-12-20 08:01:16','B00003','G0001','F00004','M00000001',1970),('G0002B00002F00003M000000011960',NULL,'2021-12-20 08:02:19','B00002','G0002','F00003','M00000001',1960),('G0003B00005F00006M000000011950',NULL,'2021-12-20 08:03:53','B00005','G0003','F00006','M00000001',1950),('G0006B00006F00007M000000021970',NULL,'2022-08-29 17:08:28','B00006','G0006','F00007','M00000002',1970);
/*!40000 ALTER TABLE `cat_mnf_brnd_mdl_yers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_size_classes`
--

DROP TABLE IF EXISTS `cat_size_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_size_classes` (
  `CAT_SZ_CLASS_CODE` varchar(8) NOT NULL COMMENT 'UML to Offline Database Transform: Column CAT_SZ_CLASS_CODE created from UML attribute "cat sz class code" in UML class "cat size class"',
  `SZ_CLASS_CODE` varchar(3) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SIZE_CLS_TO_CAT_SIZE_CLASS created as default foreign key column for foreign key "SIZE_CLS_TO_CAT_SIZE_CLASS"',
  `CAT_CODE` varchar(5) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column CAT_TO_CAT_SIZE_CLASS created as default foreign key column for foreign key "CAT_TO_CAT_SIZE_CLASS"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "cat size class"',
  PRIMARY KEY (`CAT_SZ_CLASS_CODE`),
  KEY `CAT_TO_CAT_SIZE_CLASS` (`CAT_CODE`),
  KEY `SIZE_CLS_TO_CAT_SIZE_CLASS` (`SZ_CLASS_CODE`),
  KEY `CAT_SIZE_CLASSES_INDEX` (`CAT_SZ_CLASS_CODE`),
  CONSTRAINT `CAT_TO_CAT_SIZE_CLASS` FOREIGN KEY (`CAT_CODE`) REFERENCES `categories` (`CAT_CODE`),
  CONSTRAINT `SIZE_CLS_TO_CAT_SIZE_CLASS` FOREIGN KEY (`SZ_CLASS_CODE`) REFERENCES `size_classes` (`SZ_CLASS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table CAT_SIZE_CLASSES created from UML class "cat size class"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint CAT_TO_CAT_SIZE_CLASS created for UML association "cat to cat size class"\r\nUML to Offline Database Transform: Foreign key constraint SIZE_CLS_TO_CAT_SIZE_CLASS created for UML association "size cls to cat size class"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_size_classes`
--

LOCK TABLES `cat_size_classes` WRITE;
/*!40000 ALTER TABLE `cat_size_classes` DISABLE KEYS */;
INSERT INTO `cat_size_classes` VALUES ('G0001Z03','Z03','G0001',NULL),('G0002Z01','Z01','G0002',NULL),('G0003Z01','Z01','G0003',NULL),('G0006Z01','Z01','G0006',NULL);
/*!40000 ALTER TABLE `cat_size_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_tree_temp`
--

DROP TABLE IF EXISTS `cat_tree_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_tree_temp` (
  `cat_sub_code` varchar(18) NOT NULL,
  `child_cat` varchar(7) NOT NULL,
  `parent_cat` varchar(7) NOT NULL,
  PRIMARY KEY (`cat_sub_code`,`child_cat`,`parent_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_tree_temp`
--

LOCK TABLES `cat_tree_temp` WRITE;
/*!40000 ALTER TABLE `cat_tree_temp` DISABLE KEYS */;
INSERT INTO `cat_tree_temp` VALUES ('EG0000001G00060006','G0005','G0006');
/*!40000 ALTER TABLE `cat_tree_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `CAT_CODE` varchar(5) NOT NULL COMMENT 'UML to Offline Database Transform: Column CAT_CODE created from UML attribute "cat code" in UML class "category"',
  `CAT_NAME` varchar(200) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column CAT_NAME created from UML attribute "cat name" in UML class "category"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "category"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP,
  `CAT_IMG_NAME` varchar(200) DEFAULT NULL,
  `CAT_IMG_TYPE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CAT_CODE`),
  KEY `CATEGORIES_INDEX` (`CAT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table CATEGORIES created from UML class "category"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('G0000','Home','n/a',NULL,'/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/NoImage.png',NULL),('G0001','Furniture Collage',NULL,'2021-12-20 07:57:58','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/211220_075837.jpeg','.jpeg'),('G0002','Women Clothes',NULL,'2021-12-20 07:59:10','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/211220_075926.jpeg','.jpeg'),('G0003','Fashion Men',NULL,'2021-12-20 07:59:57','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/211220_080004.jpeg','.jpeg'),('G0004','Dinning Tables',NULL,'2022-08-22 16:57:33','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220822_180121.jpeg','.jpeg'),('G0005','Skirts',NULL,'2022-08-25 02:36:57','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_023705.jpeg','.jpeg'),('G0006','Formal Skirt',NULL,'2022-08-25 02:37:27','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_023735.jpeg','.jpeg'),('G0007','Dancing Skirt',NULL,'2022-08-25 02:37:55','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_023824.jpeg','.jpeg'),('G0008','Afetrnoon Skirt',NULL,'2022-08-25 02:39:17','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_023926.jpeg','.jpeg'),('G0009','Shopping Skirt',NULL,'2022-08-25 02:40:07','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_024016.jpeg','.jpeg'),('G0010','Collection Shirts',NULL,'2022-08-25 02:42:42','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_024302.jpeg','.jpeg'),('G0011','Red Shirt',NULL,'2022-08-25 02:44:33','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_024435.jpeg','.jpeg'),('G0012','Black white Shirt',NULL,'2022-08-25 02:44:55','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_024457.jpeg','.jpeg');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_trees`
--

DROP TABLE IF EXISTS `category_trees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_trees` (
  `CAT_TREE_CODE` varchar(10) NOT NULL COMMENT 'UML to Offline Database Transform: Column CAT_TREE_CODE created from UML attribute "cat tree code" in UML class "category tree"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "category tree"',
  `LEVEL` varchar(3) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column LEVEL created from UML attribute "level" in UML class "category tree"',
  `PARENT_DESCRIMINATOR` varchar(2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column PARENT_DESCRIMINATOR created from UML attribute "parent descriminator" in UML class "category tree"',
  `CHILD_CATEGORY` varchar(5) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column TREE_CHILD created as default foreign key column for foreign key "TREE_CHILD"',
  `PARENT_CATEGORY` varchar(5) NOT NULL COMMENT 'UML to Offline Database Transform: Column TREE_PARENT created as default foreign key column for foreign key "TREE_PARENT"',
  PRIMARY KEY (`CAT_TREE_CODE`),
  KEY `TREE_CHILD` (`CHILD_CATEGORY`),
  KEY `CATEGORY_TREES_INDEX` (`CAT_TREE_CODE`),
  CONSTRAINT `TREE_CHILD` FOREIGN KEY (`CHILD_CATEGORY`) REFERENCES `categories` (`CAT_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table CATEGORY_TREES created from UML class "category tree"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint TREE_CHILD created for UML association "tree child"\r\nUML to Offline Database Transform: Foreign key constraint TREE_PARENT created for UML association "tree parent"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_trees`
--

LOCK TABLES `category_trees` WRITE;
/*!40000 ALTER TABLE `category_trees` DISABLE KEYS */;
INSERT INTO `category_trees` VALUES ('G0000G0000',NULL,NULL,NULL,'G0000',''),('G0000G0001',NULL,'1',NULL,'G0001','G0000'),('G0000G0002',NULL,'1',NULL,'G0002','G0000'),('G0000G0003',NULL,'1',NULL,'G0003','G0000'),('G0001G0004',NULL,'1',NULL,'G0004','G0001'),('G0002G0005',NULL,'1',NULL,'G0005','G0002'),('G0003G0010',NULL,'1',NULL,'G0010','G0003'),('G0005G0006',NULL,'1',NULL,'G0006','G0005'),('G0005G0007',NULL,'1',NULL,'G0007','G0005'),('G0005G0008',NULL,'1',NULL,'G0008','G0005'),('G0005G0009',NULL,'1',NULL,'G0009','G0005'),('G0010G0011',NULL,'1',NULL,'G0011','G0010'),('G0010G0012',NULL,'1',NULL,'G0012','G0010');
/*!40000 ALTER TABLE `category_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `city_code` varchar(6) NOT NULL,
  `cntry_code2` varchar(2) NOT NULL,
  `city_name` varchar(45) NOT NULL,
  `prnt_city_code` varchar(6) DEFAULT NULL,
  `available` varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`city_code`),
  KEY `countries_cities_fk_idx` (`cntry_code2`),
  KEY `city_tree_fk_idx` (`prnt_city_code`),
  CONSTRAINT `city_tree_fk` FOREIGN KEY (`prnt_city_code`) REFERENCES `cities` (`city_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `countries_cities_fk` FOREIGN KEY (`cntry_code2`) REFERENCES `countries` (`CNTRY_CODE2`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('C00000','EG','Reserved',NULL,'N'),('C00001','EG','Cairo',NULL,'Y'),('C00002','EG','Alexandria',NULL,'Y'),('C00003','EG','Doki','C00001','Y'),('C00004','EG','Kafr Abdou','C00002','Y'),('C00005','EG','Moharam Beih','C00002','Y');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `CNTRY_CODE2` varchar(2) NOT NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_CODE2 created from UML attribute "cntry code2" in UML class "country"',
  `CNTRY_NAME` varchar(150) NOT NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_NAME created from UML attribute "cntry name" in UML class "country"',
  `DIAL_CODE` int(11) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column DIAL_CODE created from UML attribute "dial code" in UML class "country"',
  `CURR_NAME` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column CURR_NAME created from UML attribute "curr name" in UML class "country"',
  `CURR_SYMBOL` varchar(20) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column CURR_SYMBOL created from UML attribute "curr symbol" in UML class "country"',
  `CURR_CODE` varchar(20) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column CURR_CODE created from UML attribute "curr code" in UML class "country"',
  `CNTRY_CODE3` varchar(3) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_CODE3 created from UML attribute "cntry code3" in UML class "country"',
  `FLAG` blob COMMENT 'UML to Offline Database Transform: Column FLAG created from UML attribute "flag" in UML class "country"',
  `ACTIVE` varchar(2) DEFAULT NULL,
  `DEFAULT_CNTRY` varchar(1) DEFAULT 'Y',
  PRIMARY KEY (`CNTRY_CODE2`),
  KEY `COUNTRIES_INDEX` (`CNTRY_CODE2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table COUNTRIES created from UML class "country"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('AD','Andorra',376,'Euro','???','EUR','AND',NULL,'N','N'),('AE','United Arab Emirates',971,'United Arab Emirates','??.??','AED','ARE',NULL,'N','N'),('AF','Afghanistan',93,'Afghan afghani','??','AFN','AFG',NULL,'N','N'),('AG','Antigua And Barbuda',1268,'East Caribbean dolla','$','XCD','ATG',NULL,'N','N'),('AI','Anguilla',1264,'East Caribbean dolla','$','XCD','AIA',NULL,'N','N'),('AL','Albania',355,'Albanian lek','L','ALL','ALB',NULL,'N','N'),('AM','Armenia',374,'Armenian dram','','AMD','ARM',NULL,'N','N'),('AN','Netherlands Antilles',599,'','','',NULL,NULL,'N','N'),('AO','Angola',244,'Angolan kwanza','Kz','AOA','AGO',NULL,'N','N'),('AQ','Antarctica',0,'','','','ATA',NULL,'N','N'),('AR','Argentina',54,'Argentine peso','$','ARS','ARG',NULL,'N','N'),('AS','American Samoa',1684,'','','','ASM',NULL,'N','N'),('AT','Austria',43,'Euro','???','EUR','AUT',NULL,'N','N'),('AU','Australia',61,'Australian dollar','$','AUD','AUS',NULL,'N','N'),('AW','Aruba',297,'Aruban florin','??','AWG','ABW',NULL,'N','N'),('AZ','Azerbaijan',994,'Azerbaijani manat','','AZN','AZE',NULL,'N','N'),('BA','Bosnia and Herzegovina',387,'Bosnia and Herzegovi','KM or ????','BAM','BIH',NULL,'N','N'),('BB','Barbados',1246,'Barbadian dollar','$','BBD','BRB',NULL,'N','N'),('BD','Bangladesh',880,'Bangladeshi taka','???','BDT','BGD',NULL,'N','N'),('BE','Belgium',32,'Euro','???','EUR','BEL',NULL,'N','N'),('BF','Burkina Faso',226,'West African CFA fra','Fr','XOF','BFA',NULL,'N','N'),('BG','Bulgaria',359,'Bulgarian lev','????','BGN','BGR',NULL,'N','N'),('BH','Bahrain',973,'Bahraini dinar','.??.??','BHD','BHR',NULL,'N','N'),('BI','Burundi',257,'Burundian franc','Fr','BIF','BDI',NULL,'N','N'),('BJ','Benin',229,'West African CFA fra','Fr','XOF','BEN',NULL,'N','N'),('BM','Bermuda',1441,'Bermudian dollar','$','BMD','BMU',NULL,'N','N'),('BN','Brunei',673,'Brunei dollar','$','BND','BRN',NULL,'N','N'),('BO','Bolivia',591,'Bolivian boliviano','Bs.','BOB','BOL',NULL,'N','N'),('BR','Brazil',55,'Brazilian real','R$','BRL','BRA',NULL,'N','N'),('BS','Bahamas The',1242,'','','','BHS',NULL,'N','N'),('BT','Bhutan',975,'Bhutanese ngultrum','Nu.','BTN','BTN',NULL,'N','N'),('BV','Bouvet Island',0,'','','','BVT',NULL,'N','N'),('BW','Botswana',267,'Botswana pula','P','BWP','BWA',NULL,'N','N'),('BY','Belarus',375,'Belarusian ruble','Br','BYR','BLR',NULL,'N','N'),('BZ','Belize',501,'Belize dollar','$','BZD','BLZ',NULL,'N','N'),('CA','Canada',1,'Canadian dollar','$','CAD','CAN',NULL,'N','N'),('CC','Cocos (Keeling) Islands',672,'Australian dollar','$','AUD','CCK',NULL,'N','N'),('CD','Congo The Democratic Republic Of The',242,'','','','COD',NULL,'N','N'),('CF','Central African Republic',236,'Central African CFA ','Fr','XAF','CAF',NULL,'N','N'),('CG','Congo',242,'','','','COG',NULL,'N','N'),('CH','Switzerland',41,'Swiss franc','Fr','CHF','CHE',NULL,'N','N'),('CI','Cote D\'Ivoire (Ivory Coast)',225,'','','','CIV',NULL,'N','N'),('CK','Cook Islands',682,'New Zealand dollar','$','NZD','COK',NULL,'N','N'),('CL','Chile',56,'Chilean peso','$','CLP','CHL',NULL,'N','N'),('CM','Cameroon',237,'Central African CFA ','Fr','XAF','CMR',NULL,'N','N'),('CN','China',86,'Chinese yuan','?? or ???','CNY','CHN',NULL,'N','N'),('CO','Colombia',57,'Colombian peso','$','COP','COL',NULL,'N','N'),('CR','Costa Rica',506,'Costa Rican col??n','???','CRC','CRI',NULL,'N','N'),('CU','Cuba',53,'Cuban convertible pe','$','CUC','CUB',NULL,'N','N'),('CV','Cape Verde',238,'Cape Verdean escudo','Esc or $','CVE','CPV',NULL,'N','N'),('CX','Christmas Island',61,'','','','CXR',NULL,'N','N'),('CY','Cyprus',357,'Euro','???','EUR','CYP',NULL,'N','N'),('CZ','Czech Republic',420,'Czech koruna','K??','CZK','CZE',NULL,'N','N'),('DE','Germany',49,'Euro','???','EUR','DEU',NULL,'N','N'),('DJ','Djibouti',253,'Djiboutian franc','Fr','DJF','DJI',NULL,'N','N'),('DK','Denmark',45,'Danish krone','kr','DKK','DNK',NULL,'N','N'),('DM','Dominica',1767,'East Caribbean dolla','$','XCD','DMA',NULL,'N','N'),('DO','Dominican Republic',1809,'Dominican peso','$','DOP','DOM',NULL,'N','N'),('DZ','Algeria',213,'Algerian dinar','??.??','DZD','DZA',NULL,'N','N'),('EC','Ecuador',593,'United States dollar','$','USD','ECU',NULL,'N','N'),('EE','Estonia',372,'Euro','???','EUR','EST',NULL,'N','N'),('EG','Egypt',20,'Egyptian pound','?? or ??.??','EGP','EGY',NULL,'Y','Y'),('EH','Western Sahara',212,'','','','ESH',NULL,'N','N'),('ER','Eritrea',291,'Eritrean nakfa','Nfk','ERN','ERI',NULL,'N','N'),('ES','Spain',34,'Euro','???','EUR','ESP',NULL,'N','N'),('ET','Ethiopia',251,'Ethiopian birr','Br','ETB','ETH',NULL,'N','N'),('FI','Finland',358,'Euro','???','EUR','FIN',NULL,'N','N'),('FJ','Fiji Islands',679,'','','','FJI',NULL,'N','N'),('FK','Falkland Islands',500,'Falkland Islands pou','??','FKP','FLK',NULL,'N','N'),('FM','Micronesia',691,'Micronesian dollar','$','','FSM',NULL,'N','N'),('FO','Faroe Islands',298,'Danish krone','kr','DKK','FRO',NULL,'N','N'),('FR','France',33,'Euro','???','EUR','FRA',NULL,'N','N'),('GA','Gabon',241,'Central African CFA ','Fr','XAF','GAB',NULL,'N','N'),('GB','United Kingdom',44,'British pound','??','GBP','GBR',NULL,'N','N'),('GD','Grenada',1473,'East Caribbean dolla','$','XCD','GRD',NULL,'N','N'),('GE','Georgia',995,'Georgian lari','???','GEL','GEO',NULL,'N','N'),('GF','French Guiana',594,'','','','GUF',NULL,'N','N'),('GH','Ghana',233,'Ghana cedi','???','GHS','GHA',NULL,'N','N'),('GI','Gibraltar',350,'Gibraltar pound','??','GIP','GIB',NULL,'N','N'),('GL','Greenland',299,'','','','GRL',NULL,'N','N'),('GM','Gambia The',220,'','','','GMB',NULL,'N','N'),('GN','Guinea',224,'Guinean franc','Fr','GNF','GIN',NULL,'N','N'),('GP','Guadeloupe',590,'','','','GLP',NULL,'N','N'),('GQ','Equatorial Guinea',240,'Central African CFA ','Fr','XAF','GNQ',NULL,'N','N'),('GR','Greece',30,'Euro','???','EUR','GRC',NULL,'N','N'),('GS','South Georgia',0,'','','','SGS',NULL,'N','N'),('GT','Guatemala',502,'Guatemalan quetzal','Q','GTQ','GTM',NULL,'N','N'),('GU','Guam',1671,'','','','GUM',NULL,'N','N'),('GW','Guinea-Bissau',245,'West African CFA fra','Fr','XOF','GNB',NULL,'N','N'),('GY','Guyana',592,'Guyanese dollar','$','GYD','GUY',NULL,'N','N'),('HK','Hong Kong S.A.R.',852,'','','','HKG',NULL,'N','N'),('HM','Heard and McDonald Islands',0,'','','','HMD',NULL,'N','N'),('HN','Honduras',504,'Honduran lempira','L','HNL','HND',NULL,'N','N'),('HR','Croatia (Hrvatska)',385,'','','','HRV',NULL,'N','N'),('HT','Haiti',509,'Haitian gourde','G','HTG','HTI',NULL,'N','N'),('HU','Hungary',36,'Hungarian forint','Ft','HUF','HUN',NULL,'N','N'),('ID','Indonesia',62,'Indonesian rupiah','Rp','IDR','IDN',NULL,'N','N'),('IE','Ireland',353,'Euro','???','EUR','IRL',NULL,'N','N'),('IL','Israel',972,'Israeli new shekel','???','ILS','ISR',NULL,'N','N'),('IN','India',91,'Indian rupee','???','INR','IND',NULL,'N','N'),('IO','British Indian Ocean Territory',246,'United States dollar','$','USD','IOT',NULL,'N','N'),('IQ','Iraq',964,'Iraqi dinar','??.??','IQD','IRQ',NULL,'N','N'),('IR','Iran',98,'Iranian rial','???','IRR','IRN',NULL,'N','N'),('IS','Iceland',354,'Icelandic kr??na','kr','ISK','ISL',NULL,'N','N'),('IT','Italy',39,'Euro','???','EUR','ITA',NULL,'N','N'),('JM','Jamaica',1876,'Jamaican dollar','$','JMD','JAM',NULL,'N','N'),('JO','Jordan',962,'Jordanian dinar','??.??','JOD','JOR',NULL,'N','N'),('JP','Japan',81,'Japanese yen','??','JPY','JPN',NULL,'N','N'),('KE','Kenya',254,'Kenyan shilling','Sh','KES','KEN',NULL,'N','N'),('KG','Kyrgyzstan',996,'Kyrgyzstani som','????','KGS','KGZ',NULL,'N','N'),('KH','Cambodia',855,'Cambodian riel','???','KHR','KHM',NULL,'N','N'),('KI','Kiribati',686,'Australian dollar','$','AUD','KIR',NULL,'N','N'),('KM','Comoros',269,'Comorian franc','Fr','KMF','COM',NULL,'N','N'),('KN','Saint Kitts And Nevis',1869,'East Caribbean dolla','$','XCD','KNA',NULL,'N','N'),('KP','Korea North',850,'','','','PRK',NULL,'N','N'),('KR','Korea South',82,'','','','KOR',NULL,'N','N'),('KW','Kuwait',965,'Kuwaiti dinar','??.??','KWD','KWT',NULL,'N','N'),('KY','Cayman Islands',1345,'Cayman Islands dolla','$','KYD','CYM',NULL,'N','N'),('KZ','Kazakhstan',7,'Kazakhstani tenge','','KZT','KAZ',NULL,'N','N'),('LA','Laos',856,'Lao kip','???','LAK','LAO',NULL,'N','N'),('LB','Lebanon',961,'Lebanese pound','??.??','LBP','LBN',NULL,'N','N'),('LC','Saint Lucia',1758,'East Caribbean dolla','$','XCD','LCA',NULL,'N','N'),('LI','Liechtenstein',423,'Swiss franc','Fr','CHF','LIE',NULL,'N','N'),('LK','Sri Lanka',94,'Sri Lankan rupee','Rs or ??????','LKR','LKA',NULL,'N','N'),('LR','Liberia',231,'Liberian dollar','$','LRD','LBR',NULL,'N','N'),('LS','Lesotho',266,'Lesotho loti','L','LSL','LSO',NULL,'N','N'),('LT','Lithuania',370,'Euro','???','EUR','LTU',NULL,'N','N'),('LU','Luxembourg',352,'Euro','???','EUR','LUX',NULL,'N','N'),('LV','Latvia',371,'Euro','???','EUR','LVA',NULL,'N','N'),('LY','Libya',218,'Libyan dinar','??.??','LYD','LBY',NULL,'N','N'),('MA','Morocco',212,'Moroccan dirham','??.??.','MAD','MAR',NULL,'N','N'),('MC','Monaco',377,'Euro','???','EUR','MCO',NULL,'N','N'),('MD','Moldova',373,'Moldovan leu','L','MDL','MDA',NULL,'N','N'),('MG','Madagascar',261,'Malagasy ariary','Ar','MGA','MDG',NULL,'N','N'),('MH','Marshall Islands',692,'United States dollar','$','USD','MHL',NULL,'N','N'),('MK','Macedonia',389,'','','','MKD',NULL,'N','N'),('ML','Mali',223,'West African CFA fra','Fr','XOF','MLI',NULL,'N','N'),('MM','Myanmar',95,'Burmese kyat','Ks','MMK','MMR',NULL,'N','N'),('MN','Mongolia',976,'Mongolian t??gr??g','???','MNT','MNG',NULL,'N','N'),('MO','Macau S.A.R.',853,'','','','MAC',NULL,'N','N'),('MP','Northern Mariana Islands',1670,'','','','MNP',NULL,'N','N'),('MQ','Martinique',596,'','','','MTQ',NULL,'N','N'),('MR','Mauritania',222,'Mauritanian ouguiya','UM','MRO','MRT',NULL,'N','N'),('MS','Montserrat',1664,'East Caribbean dolla','$','XCD','MSR',NULL,'N','N'),('MT','Malta',356,'Euro','???','EUR','MLT',NULL,'N','N'),('MU','Mauritius',230,'Mauritian rupee','???','MUR','MUS',NULL,'N','N'),('MV','Maldives',960,'Maldivian rufiyaa','.??','MVR','MDV',NULL,'N','N'),('MW','Malawi',265,'Malawian kwacha','MK','MWK','MWI',NULL,'N','N'),('MX','Mexico',52,'Mexican peso','$','MXN','MEX',NULL,'N','N'),('MY','Malaysia',60,'Malaysian ringgit','RM','MYR','MYS',NULL,'N','N'),('MZ','Mozambique',258,'Mozambican metical','MT','MZN','MOZ',NULL,'N','N'),('NA','Namibia',264,'Namibian dollar','$','NAD','NAM',NULL,'N','N'),('NC','New Caledonia',687,'CFP franc','Fr','XPF','NCL',NULL,'N','N'),('NE','Niger',227,'West African CFA fra','Fr','XOF','NER',NULL,'N','N'),('NF','Norfolk Island',672,'','','','NFK',NULL,'N','N'),('NG','Nigeria',234,'Nigerian naira','???','NGN','NGA',NULL,'N','N'),('NI','Nicaragua',505,'Nicaraguan c??rdoba','C$','NIO','NIC',NULL,'N','N'),('NL','Netherlands The',31,'','','','NLD',NULL,'N','N'),('NO','Norway',47,'Norwegian krone','kr','NOK','NOR',NULL,'N','N'),('NP','Nepal',977,'Nepalese rupee','???','NPR','NPL',NULL,'N','N'),('NR','Nauru',674,'Australian dollar','$','AUD','NRU',NULL,'N','N'),('NU','Niue',683,'New Zealand dollar','$','NZD','NIU',NULL,'N','N'),('NZ','New Zealand',64,'New Zealand dollar','$','NZD','NZL',NULL,'N','N'),('OM','Oman',968,'Omani rial','??.??.','OMR','OMN',NULL,'N','N'),('PA','Panama',507,'Panamanian balboa','B/.','PAB','PAN',NULL,'N','N'),('PE','Peru',51,'Peruvian nuevo sol','S/.','PEN','PER',NULL,'N','N'),('PF','French Polynesia',689,'CFP franc','Fr','XPF','PYF',NULL,'N','N'),('PG','Papua new Guinea',675,'Papua New Guinean ki','K','PGK','PNG',NULL,'N','N'),('PH','Philippines',63,'Philippine peso','???','PHP','PHL',NULL,'N','N'),('PK','Pakistan',92,'Pakistani rupee','???','PKR','PAK',NULL,'N','N'),('PL','Poland',48,'Polish z??oty','z??','PLN','POL',NULL,'N','N'),('PM','Saint Pierre and Miquelon',508,'','','','SPM',NULL,'N','N'),('PN','Pitcairn Island',0,'','','','PCN',NULL,'N','N'),('PR','Puerto Rico',1787,'','','','PRI',NULL,'N','N'),('PS','Palestinian Territory Occupied',970,'','','','PSE',NULL,'N','N'),('PT','Portugal',351,'Euro','???','EUR','PRT',NULL,'N','N'),('PW','Palau',680,'Palauan dollar','$','','PLW',NULL,'N','N'),('PY','Paraguay',595,'Paraguayan guaran??','???','PYG','PRY',NULL,'N','N'),('QA','Qatar',974,'Qatari riyal','??.??','QAR','QAT',NULL,'N','N'),('RE','Reunion',262,'','','','REU',NULL,'N','N'),('RO','Romania',40,'Romanian leu','lei','RON','ROU',NULL,'N','N'),('RS','Serbia',381,'Serbian dinar','??????. or din.','RSD','SRB',NULL,'N','N'),('RU','Russia',70,'Russian ruble','','RUB','RUS',NULL,'N','N'),('RW','Rwanda',250,'Rwandan franc','Fr','RWF','RWA',NULL,'N','N'),('SA','Saudi Arabia',966,'Saudi riyal','??.??','SAR','SAU',NULL,'N','N'),('SB','Solomon Islands',677,'Solomon Islands doll','$','SBD','SLB',NULL,'N','N'),('SC','Seychelles',248,'Seychellois rupee','???','SCR','SYC',NULL,'N','N'),('SD','Sudan',249,'Sudanese pound','??.??.','SDG','SDN',NULL,'N','N'),('SE','Sweden',46,'Swedish krona','kr','SEK','SWE',NULL,'N','N'),('SG','Singapore',65,'Brunei dollar','$','BND','SGP',NULL,'N','N'),('SH','Saint Helena',290,'Saint Helena pound','??','SHP','SHN',NULL,'N','N'),('SI','Slovenia',386,'Euro','???','EUR','SVN',NULL,'N','N'),('SJ','Svalbard And Jan Mayen Islands',47,'','','','SJM',NULL,'N','N'),('SK','Slovakia',421,'Euro','???','EUR','SVK',NULL,'N','N'),('SL','Sierra Leone',232,'Sierra Leonean leone','Le','SLL','SLE',NULL,'N','N'),('SM','San Marino',378,'Euro','???','EUR','SMR',NULL,'N','N'),('SN','Senegal',221,'West African CFA fra','Fr','XOF','SEN',NULL,'N','N'),('SO','Somalia',252,'Somali shilling','Sh','SOS','SOM',NULL,'N','N'),('SR','Suriname',597,'Surinamese dollar','$','SRD','SUR',NULL,'N','N'),('SS','South Sudan',211,'South Sudanese pound','??','SSP','SSD',NULL,'N','N'),('ST','Sao Tome and Principe',239,'S??o Tom?? and Pr??ncip','Db','STD','STP',NULL,'N','N'),('SV','El Salvador',503,'United States dollar','$','USD','SLV',NULL,'N','N'),('SY','Syria',963,'Syrian pound','?? or ??.??','SYP','SYR',NULL,'N','N'),('SZ','Swaziland',268,'Swazi lilangeni','L','SZL','SWZ',NULL,'N','N'),('TC','Turks And Caicos Islands',1649,'United States dollar','$','USD','TCA',NULL,'N','N'),('TD','Chad',235,'Central African CFA ','Fr','XAF','TCD',NULL,'N','N'),('TF','French Southern Territories',0,'','','','ATF',NULL,'N','N'),('TG','Togo',228,'West African CFA fra','Fr','XOF','TGO',NULL,'N','N'),('TH','Thailand',66,'Thai baht','???','THB','THA',NULL,'N','N'),('TJ','Tajikistan',992,'Tajikistani somoni','????','TJS','TJK',NULL,'N','N'),('TK','Tokelau',690,'','','','TKL',NULL,'N','N'),('TM','Turkmenistan',7370,'Turkmenistan manat','m','TMT','TKM',NULL,'N','N'),('TN','Tunisia',216,'Tunisian dinar','??.??','TND','TUN',NULL,'N','N'),('TO','Tonga',676,'Tongan pa??anga','T$','TOP','TON',NULL,'N','N'),('TP','East Timor',670,'United States dollar','$','USD',NULL,NULL,'N','N'),('TR','Turkey',90,'Turkish lira','','TRY','TUR',NULL,'N','N'),('TT','Trinidad And Tobago',1868,'Trinidad and Tobago ','$','TTD','TTO',NULL,'N','N'),('TV','Tuvalu',688,'Australian dollar','$','AUD','TUV',NULL,'N','N'),('TW','Taiwan',886,'New Taiwan dollar','$','TWD','TWN',NULL,'N','N'),('TZ','Tanzania',255,'Tanzanian shilling','Sh','TZS','TZA',NULL,'N','N'),('UA','Ukraine',380,'Ukrainian hryvnia','???','UAH','UKR',NULL,'N','N'),('UG','Uganda',256,'Ugandan shilling','Sh','UGX','UGA',NULL,'N','N'),('UM','United States Minor Outlying Islands',1,'','','','UMI',NULL,'N','N'),('US','United States',1,'United States dollar','$','USD','USA',NULL,'N','N'),('UY','Uruguay',598,'Uruguayan peso','$','UYU','URY',NULL,'N','N'),('UZ','Uzbekistan',998,'Uzbekistani som','','UZS','UZB',NULL,'N','N'),('VA','Vatican City State (Holy See)',39,'','','','VAT',NULL,'N','N'),('VC','Saint Vincent And The Grenadines',1784,'East Caribbean dolla','$','XCD','VCT',NULL,'N','N'),('VE','Venezuela',58,'Venezuelan bol??var','Bs F','VEF','VEN',NULL,'N','N'),('VG','Virgin Islands (British)',1284,'','','','VGB',NULL,'N','N'),('VI','Virgin Islands (US)',1340,'','','','VIR',NULL,'N','N'),('VN','Vietnam',84,'Vietnamese ?????ng','???','VND','VNM',NULL,'N','N'),('VU','Vanuatu',678,'Vanuatu vatu','Vt','VUV','VUT',NULL,'N','N'),('WF','Wallis And Futuna Islands',681,'','','','WLF',NULL,'N','N'),('WS','Samoa',684,'Samoan t??l??','T','WST','WSM',NULL,'N','N'),('XA','External Territories of Australia',61,'','','',NULL,NULL,'N','N'),('XG','Smaller Territories of the UK',44,'','','',NULL,NULL,'N','N'),('XJ','Jersey',44,'British pound','??','GBP',NULL,NULL,'N','N'),('XM','Man (Isle of)',44,'','','',NULL,NULL,'N','N'),('XU','Guernsey and Alderney',44,'','','',NULL,NULL,'N','N'),('YE','Yemen',967,'Yemeni rial','???','YER','YEM',NULL,'N','N'),('YT','Mayotte',269,'','','','MYT',NULL,'N','N'),('YU','Yugoslavia',38,'','','',NULL,NULL,'N','N'),('ZA','South Africa',27,'South African rand','R','ZAR','ZAF',NULL,'N','N'),('ZM','Zambia',260,'Zambian kwacha','ZK','ZMW','ZMB',NULL,'N','N'),('ZW','Zimbabwe',263,'Botswana pula','P','BWP','ZWE',NULL,'N','N');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_lang_curr`
--

DROP TABLE IF EXISTS `country_lang_curr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_lang_curr` (
  `ID_CODE` varchar(6) NOT NULL,
  `LANG_CODE` varchar(2) NOT NULL,
  `CNTRY_CODE2` varchar(2) NOT NULL,
  `CURR_SYMBOL` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_CODE`),
  KEY `cntry_cntry_lang_curr_fk_idx` (`CNTRY_CODE2`),
  KEY `lang_cntry_lang_curr_fk_idx` (`LANG_CODE`),
  CONSTRAINT `cntry_cntry_lang_curr_fk` FOREIGN KEY (`CNTRY_CODE2`) REFERENCES `countries` (`CNTRY_CODE2`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lang_cntry_lang_curr_fk` FOREIGN KEY (`LANG_CODE`) REFERENCES `languages` (`LANG_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_lang_curr`
--

LOCK TABLES `country_lang_curr` WRITE;
/*!40000 ALTER TABLE `country_lang_curr` DISABLE KEYS */;
INSERT INTO `country_lang_curr` VALUES ('EGar','ar','EG','??.??'),('EGen','en','EG','EGP');
/*!40000 ALTER TABLE `country_lang_curr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_prices`
--

DROP TABLE IF EXISTS `currency_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_prices` (
  `TRANS_ID` datetime NOT NULL COMMENT 'UML to Offline Database Transform: Column TRANS_ID created from UML attribute "trans id" in UML class "currency price"',
  `MULTIPLY_BY` decimal(9,2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column MULTIPLY_BY created from UML attribute "multiply by" in UML class "currency price"',
  `FROM_CURR` varchar(2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column FROM_CURR_TO_PRICES created as default foreign key column for foreign key "FROM_CURR_TO_PRICES"',
  `TO_CURR` varchar(2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column TO_CURR_TO_PRICES created as default foreign key column for foreign key "TO_CURR_TO_PRICES"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "currency price"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "currency price"',
  PRIMARY KEY (`TRANS_ID`),
  KEY `FROM_CURR_TO_PRICES` (`FROM_CURR`),
  KEY `TO_CURR_TO_PRICES` (`TO_CURR`),
  CONSTRAINT `FROM_CURR_TO_PRICES` FOREIGN KEY (`FROM_CURR`) REFERENCES `countries` (`CNTRY_CODE2`),
  CONSTRAINT `TO_CURR_TO_PRICES` FOREIGN KEY (`TO_CURR`) REFERENCES `countries` (`CNTRY_CODE2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table CURRENCY_PRICES created from UML class "currency price"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint FROM_CURR_TO_PRICES created for UML association "from curr to prices"\r\nUML to Offline Database Transform: Foreign key constraint TO_CURR_TO_PRICES created for UML association "to curr to prices"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_prices`
--

LOCK TABLES `currency_prices` WRITE;
/*!40000 ALTER TABLE `currency_prices` DISABLE KEYS */;
INSERT INTO `currency_prices` VALUES ('2019-01-15 00:00:00',0.20,'EG','DE','2019-06-15 11:50:42',NULL),('2019-02-15 00:00:00',0.30,'EG','DE','2019-06-15 11:51:30',NULL),('2019-03-15 00:00:00',0.10,'EG','AE','2019-06-15 13:37:49',NULL),('2019-05-27 00:00:00',123.00,'EG','AE','2019-06-19 16:20:37',NULL),('2019-06-20 00:32:26',1234567.00,'EG','AO','2019-06-20 00:32:26',NULL),('2019-06-20 01:21:33',0.03,'EG','AD','2019-06-20 01:21:33',NULL),('2019-06-20 01:26:04',1.20,'EG','AL','2019-06-20 01:26:04',NULL),('2019-06-20 01:29:08',22.30,'EG','AW','2019-06-20 01:29:08','none.....................'),('2019-07-06 19:51:29',22.25,'EG','AD','2019-07-06 19:51:29',NULL),('2019-07-07 12:00:55',3.35,'EG','AG','2019-07-07 12:00:55',NULL);
/*!40000 ALTER TABLE `currency_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite_shops`
--

DROP TABLE IF EXISTS `favourite_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favourite_shops` (
  `USER_ID_FAV_SHOP` varchar(110) NOT NULL COMMENT 'UML to Offline Database Transform: Column USER_ID_FAV_SHOP created from UML attribute "USER ID FAV SHOP" in UML class "FAVOURITE SHOP"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "FAVOURITE SHOP"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "FAVOURITE SHOP"',
  `SHOP_CODE` varchar(9) DEFAULT NULL,
  `USER_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`USER_ID_FAV_SHOP`),
  KEY `SHOP_TO_FAVOURITE_SHOP` (`SHOP_CODE`),
  KEY `USER_FAVOURITE_SHOP` (`USER_ID`),
  CONSTRAINT `SHOP_TO_FAVOURITE_SHOP` FOREIGN KEY (`SHOP_CODE`) REFERENCES `shops` (`SHOP_CODE`),
  CONSTRAINT `USER_FAVOURITE_SHOP` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table FAVOURITE_SHOPS created from UML class "FAVOURITE SHOP"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite_shops`
--

LOCK TABLES `favourite_shops` WRITE;
/*!40000 ALTER TABLE `favourite_shops` DISABLE KEYS */;
/*!40000 ALTER TABLE `favourite_shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `LANG_CODE` varchar(2) NOT NULL COMMENT 'UML to Offline Database Transform: Column LANG_CODE created from UML attribute "lang code" in UML class "language"',
  `LANG_NAME` varchar(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column LANG_NAME created from UML attribute "lang name" in UML class "language"',
  PRIMARY KEY (`LANG_CODE`),
  KEY `LANGUAGES_INDEX` (`LANG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table LANGUAGES created from UML class "language"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES ('ar','Arabic'),('en','English');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_table`
--

DROP TABLE IF EXISTS `log_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_table` (
  `seq` int(25) NOT NULL,
  `col1` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_table`
--

LOCK TABLES `log_table` WRITE;
/*!40000 ALTER TABLE `log_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactures`
--

DROP TABLE IF EXISTS `manufactures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufactures` (
  `MNF_CODE` varchar(6) NOT NULL COMMENT 'UML to Offline Database Transform: Column MNF_CODE created from UML attribute "mnf code" in UML class "manufacture"',
  `MNF_NAME` varchar(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column MNF_NAME created from UML attribute "mnf name" in UML class "manufacture"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "manufacture"',
  `REGISTER_STATUS` varchar(1) NOT NULL DEFAULT 'R' COMMENT 'UML to Offline Database Transform: Column REGISTER_STATUS created from UML attribute "register status" in UML class "manufacture"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP,
  `SHOP_CODE` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`MNF_CODE`),
  KEY `SHOP_REQ_NEW_MANFS` (`SHOP_CODE`),
  KEY `MANUFACTURES_INDEX` (`MNF_CODE`),
  CONSTRAINT `SHOP_REQ_NEW_MANFS` FOREIGN KEY (`SHOP_CODE`) REFERENCES `shops` (`SHOP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table MANUFACTURES created from UML class "manufacture"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactures`
--

LOCK TABLES `manufactures` WRITE;
/*!40000 ALTER TABLE `manufactures` DISABLE KEYS */;
INSERT INTO `manufactures` VALUES ('F00000','','n/a','R','2019-07-11 20:10:04',NULL),('F00001','Dell & HP group',NULL,'A','2019-07-12 14:34:46',NULL),('F00002','Apple Corp.',NULL,'A','2019-07-12 14:36:01',NULL),('F00003','Jack & Jones',NULL,'A','2019-07-12 14:35:41',NULL),('F00004','IKEA-Corp.',NULL,'A','2019-10-05 17:50:54',NULL),('F00005','TOSHIBA EL ARABY',NULL,'I','2019-10-05 17:51:14',NULL),('F00006','CLARKS Copr.',NULL,'A','2021-09-21 06:48:34',NULL),('F00007','Carina Egypt',NULL,'A','2022-08-29 17:06:27',NULL);
/*!40000 ALTER TABLE `manufactures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `models` (
  `MODEL_CODE` varchar(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column MODEL_CODE created from UML attribute "model code" in UML class "model"',
  `MODEL_NAME` varchar(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column MODEL_NAME created from UML attribute "model name" in UML class "model"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "model"',
  `REGISTER_STATUS` varchar(1) NOT NULL DEFAULT 'R' COMMENT 'UML to Offline Database Transform: Column REGISTER_STATUS created from UML attribute "register status" in UML class "model"',
  `ORIG_MODEL_NO` varchar(50) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column ORIG_MODEL_NO created from UML attribute "orig model no" in UML class "model"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '+',
  `SHOP_CODE` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`MODEL_CODE`),
  KEY `SHOP_REQ_NEW_MODELS` (`SHOP_CODE`),
  KEY `MODELS_INDEX` (`MODEL_CODE`),
  CONSTRAINT `SHOP_REQ_NEW_MODELS` FOREIGN KEY (`SHOP_CODE`) REFERENCES `shops` (`SHOP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table MODELS created from UML class "model"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES ('M0000000','',NULL,'R','N/A',NULL,NULL),('M00000001','Model One',NULL,'A',NULL,'2021-09-24 11:14:15',NULL),('M00000002','Formal Skirt',NULL,'A',NULL,'2022-08-29 17:06:46',NULL);
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_dets`
--

DROP TABLE IF EXISTS `offer_dets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_dets` (
  `OFFER_DET_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'UML to Offline Database Transform: Column OFFER_DET_ID created from UML attribute "offer det id" in UML class "offer det"',
  `OFFER_ID` int(11) NOT NULL COMMENT 'UML to Offline Database Transform: Column OFFERS_TO_OFFER_DET created as default foreign key column for foreign key "OFFERS_TO_OFFER_DET"',
  `OFFER_NAME` varchar(200) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_OFFER_DET created as default foreign key column for foreign key "SKU_TO_OFFER_DET"',
  `OFFER_TYPE` varchar(2) DEFAULT NULL COMMENT '''C'' means campaign, or ''S'' means SKU price reductions/ ''R'' means SKU Color price reduction/ ''Z'' means SKU Size Color price reduction/\n ''OS'' means buy X get Y free of same SKU/ ''OM'' means buy X get Y free of other SKUs',
  `TRX_DT_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "offer det"',
  `SKU_CODE` varchar(23) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column HIDE created from UML attribute "hide" in UML class "offer det"',
  `SKU_CLR_CODE` varchar(28) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "offer det"',
  `SKU_SZ_CLR_CODE` varchar(37) DEFAULT NULL,
  `OLD_PRICE` decimal(9,2) DEFAULT NULL,
  `LAST_PRICE` decimal(9,2) DEFAULT NULL,
  `BASE_QTY` decimal(7,2) DEFAULT NULL COMMENT 'Qty when customer buy get the offer on this SKU.',
  `EXTRA_QTY` decimal(7,2) DEFAULT NULL COMMENT 'Qty customer get free when buy BASE_QTY of this SKU',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "offer det"',
  `SKU_TYPE` varchar(1) DEFAULT NULL,
  `SKU_CLR_CODE_LNK` varchar(200) DEFAULT NULL,
  `CLR_NAME` varchar(200) DEFAULT NULL,
  `SELECTED` enum('true','false') DEFAULT 'false',
  `IMG_PATH` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`OFFER_DET_ID`),
  KEY `OFFERS_TO_OFFER_DET` (`OFFER_ID`),
  KEY `OFFER_DETS_INDEX` (`OFFER_DET_ID`),
  KEY `fk_offer_dets_sku_idx` (`SKU_CODE`),
  KEY `fk_offer_dets_sku_clr_idx` (`SKU_CLR_CODE`),
  KEY `fk_offer_dets_sku_sz_clr_idx` (`SKU_SZ_CLR_CODE`),
  CONSTRAINT `OFFERS_TO_OFFER_DET` FOREIGN KEY (`OFFER_ID`) REFERENCES `offers` (`OFFER_MAST_ID`),
  CONSTRAINT `fk_offer_dets_offers` FOREIGN KEY (`OFFER_ID`) REFERENCES `offers` (`OFFER_MAST_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_dets_sku` FOREIGN KEY (`SKU_CODE`) REFERENCES `skus` (`SKU_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_dets_sku_clr` FOREIGN KEY (`SKU_CLR_CODE`) REFERENCES `sku_colors` (`SKU_CLR_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_dets_sku_clrs` FOREIGN KEY (`SKU_CLR_CODE`) REFERENCES `sku_colors` (`SKU_CLR_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_dets_sku_sz_clr` FOREIGN KEY (`SKU_SZ_CLR_CODE`) REFERENCES `sku_size_colors` (`SKU_SZ_CLR_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_dets_sku_szs` FOREIGN KEY (`SKU_SZ_CLR_CODE`) REFERENCES `sku_size_colors` (`SKU_SZ_CLR_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_dets_skus` FOREIGN KEY (`SKU_CODE`) REFERENCES `skus` (`SKU_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1660486358 DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table OFFER_DETS created from UML class "offer det"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint OFFERS_TO_OFFER_DET created for UML association "offers to offer det"\r\nUML to Offline Database Transform: Foreign key constraint SKU_TO_OFFER_DET created for UML association "sku to offer det"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_dets`
--

LOCK TABLES `offer_dets` WRITE;
/*!40000 ALTER TABLE `offer_dets` DISABLE KEYS */;
INSERT INTO `offer_dets` VALUES (1660485917,1660485883,'Table Chair-Black',NULL,'2022-08-14 17:05:18','EG0000001G00010001S0001','EG0000001G00010001S0001CLR01',NULL,168.00,143.64,NULL,NULL,NULL,'C','EG0000001G00010001S0001CLR01','Black','false',NULL),(1660485925,1660485883,'Leggy Trouser-Default Color',NULL,'2022-08-14 17:05:26','EG0000001G00020002S0001','EG0000001G00020002S0001CLR00',NULL,198.00,169.29,NULL,NULL,NULL,'C','EG0000001G00020002S0001CLR00','Default Color','false',NULL),(1660485935,1660485883,'Carina V-Shirt-Red',NULL,'2022-08-14 17:05:36','EG0000001G00020002S0002','EG0000001G00020002S0002CLR01',NULL,150.00,128.25,NULL,NULL,NULL,'C','EG0000001G00020002S0002CLR01','Red','false',NULL),(1660485945,1660485883,'Table Chair-Black-One Size',NULL,'2022-08-14 17:05:45','EG0000001G00010001S0001',NULL,'EG0000001G00010001S0001Z03D01CLR01',175.00,149.63,NULL,NULL,NULL,'Z','EG0000001G00010001S0001CLR01','Black','false',NULL),(1660485956,1660485883,'Leggy Trouser-Default Color-S',NULL,'2022-08-14 17:05:57','EG0000001G00020002S0001',NULL,'EG0000001G00020002S0001Z01D01CLR00',225.00,192.38,NULL,NULL,NULL,'Z','EG0000001G00020002S0001CLR00','Default Color','false',NULL),(1660485962,1660485883,'Leggy Trouser-Default Color-XXXL',NULL,'2022-08-14 17:06:03','EG0000001G00020002S0001',NULL,'EG0000001G00020002S0001Z01D05CLR00',178.20,152.36,NULL,NULL,NULL,'Z','EG0000001G00020002S0001CLR00','Default Color','false',NULL),(1660485968,1660485883,'Table Chair-White Painted',NULL,'2022-08-14 17:06:09','EG0000001G00010001S0001','EG0000001G00010001S0001CLR02',NULL,12.00,10.26,NULL,NULL,NULL,'C','EG0000001G00010001S0001CLR02','White Painted','false',NULL),(1660486133,1660486085,'Table Chair',NULL,'2022-08-14 17:08:53','EG0000001G00010001S0001',NULL,NULL,133.20,117.22,NULL,NULL,NULL,'S','EG0000001G00010001S0001CLR00','Default Color','true','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00010001S0001CLR00/EG0000001G00010001S0001CLR00I001347.png'),(1660486139,1660486085,'Leggy Trouser',NULL,'2022-08-14 17:09:00','EG0000001G00020002S0001',NULL,NULL,225.00,225.00,NULL,NULL,NULL,'S','EG0000001G00020002S0001CLR00','Default Color','true','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/NoImage.png'),(1660486147,1660486085,'Carina V-Shirt',NULL,'2022-08-14 17:09:08','EG0000001G00020002S0002',NULL,NULL,4.00,11.00,NULL,NULL,NULL,'S','EG0000001G00020002S0002CLR00','Default Color','true','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00020002S0002CLR00/EG0000001G00020002S0002CLR00I092210.png'),(1660486232,1660486085,'Table Chair-Default Color',NULL,'2022-08-14 17:10:32','EG0000001G00010001S0001','EG0000001G00010001S0001CLR00',NULL,175.00,175.00,NULL,NULL,NULL,'C','EG0000001G00010001S0001CLR00','Default Color','true','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/NoImage.png'),(1660486238,1660486085,'Table Chair-Navy',NULL,'2022-08-14 17:10:38','EG0000001G00010001S0001','EG0000001G00010001S0001CLR04',NULL,165.00,148.00,NULL,NULL,NULL,'C','EG0000001G00010001S0001CLR04','Navy','true','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/NoImage.png'),(1660486248,1660486085,'Leggy Trouser-Default Color-XS',NULL,'2022-08-14 17:10:48','EG0000001G00020002S0001',NULL,'EG0000001G00020002S0001Z01D02CLR00',225.00,225.00,NULL,NULL,NULL,'Z','EG0000001G00020002S0001CLR00','Default Color','true','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/NoImage.png'),(1660486256,1660486085,'Table Chair-White Painted-One Size',NULL,'2022-08-14 17:10:56','EG0000001G00010001S0001',NULL,'EG0000001G00010001S0001Z03D01CLR02',162.00,160.00,NULL,NULL,NULL,'Z','EG0000001G00010001S0001CLR02','White Painted','true','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/NoImage.png'),(1660486357,1660486085,'Leggy Trouser-Default Color-M',NULL,'2022-08-14 17:12:38','EG0000001G00020002S0001',NULL,'EG0000001G00020002S0001Z01D04CLR00',225.00,240.30,NULL,NULL,NULL,'Z','EG0000001G00020002S0001CLR00','Default Color','true','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/NoImage.png');
/*!40000 ALTER TABLE `offer_dets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_dets_dets`
--

DROP TABLE IF EXISTS `offer_dets_dets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_dets_dets` (
  `TRX_ID` varchar(15) NOT NULL,
  `SKU_CODE` varchar(23) DEFAULT NULL,
  `SKU_CLR_CODE` varchar(28) DEFAULT NULL,
  `SKU_SZ_CLR_CODE` varchar(37) DEFAULT NULL,
  `DISCOUNT` int(11) DEFAULT NULL,
  `QTY` decimal(7,2) DEFAULT NULL,
  `OFFER_DET_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TRX_ID`),
  KEY `fk_offer_dets_dets_sku_idx` (`SKU_CODE`),
  KEY `fk_offer_dets_dets_sku_clr_idx` (`SKU_CLR_CODE`),
  KEY `fk_offer_dets_dets_sku_sz_clr_idx` (`SKU_SZ_CLR_CODE`),
  KEY `fk_offer_dets_dets_to_dets_idx` (`OFFER_DET_ID`),
  CONSTRAINT `fk_offer_dets_dets_sku` FOREIGN KEY (`SKU_CODE`) REFERENCES `skus` (`SKU_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_dets_dets_sku_clr` FOREIGN KEY (`SKU_CLR_CODE`) REFERENCES `sku_colors` (`SKU_CLR_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_dets_dets_sku_sz_clr` FOREIGN KEY (`SKU_SZ_CLR_CODE`) REFERENCES `sku_size_colors` (`SKU_SZ_CLR_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_dets_dets_to_dets` FOREIGN KEY (`OFFER_DET_ID`) REFERENCES `offer_dets` (`OFFER_DET_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_dets_dets`
--

LOCK TABLES `offer_dets_dets` WRITE;
/*!40000 ALTER TABLE `offer_dets_dets` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_dets_dets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `OFFER_MAST_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'UML to Offline Database Transform: Column SHP_CODE_OFFER_ID created from UML attribute "shp code offer id" in UML class "offer"',
  `OFFER_DT` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column OFFER_DT created from UML attribute "offer dt" in UML class "offer"',
  `OFFER_TITLE` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column OFFER_TITLE created from UML attribute "offer title" in UML class "offer"',
  `VALID_FRM_DATE` datetime DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column VALID_FRM_DATE created from UML attribute "valid frm date" in UML class "offer"',
  `VALID_TO_DATE` datetime DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column VALID_TO_DATE created from UML attribute "valid to date" in UML class "offer"',
  `SEND_ADS_EMAIL` varchar(1) DEFAULT 'N',
  `SEND_EMAIL_DT` datetime DEFAULT NULL,
  `OFFER_TYPE` varchar(2) DEFAULT NULL,
  `PERCENTAGE` decimal(4,2) DEFAULT NULL,
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "offer"',
  `EMAIL_BODY` varchar(20000) DEFAULT NULL,
  `ALREADY_SEND` enum('true','false') DEFAULT 'false',
  `ALREADY_APPLIED` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`OFFER_MAST_ID`),
  UNIQUE KEY `VALID_FRM_DATE_UNIQUE` (`VALID_FRM_DATE`),
  KEY `OFFERS_INDEX` (`OFFER_MAST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1660486086 DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table OFFERS created from UML class "offer"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SHOP_OFFERS created for UML association "shop offers"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (1660485883,'2022-08-14 14:06:46','BBBBB','2022-08-16 17:00:00',NULL,'N',NULL,'D',14.50,'BBBBB',NULL,'false','false'),(1660486085,'2022-08-14 14:13:32','CCCCC','2022-08-14 17:00:00',NULL,'Y','2022-08-15 17:00:00','E',NULL,'CCCCC','<html><style>p.small {line-height: 0.7;}</style><h1><span style=\"background-color: #999999; color: #ffffff;\">CCCCC</span></h1><p></p><p><strong>Dear valued customer,</strong></p>\n<p><h2>Catch our limited time offer for valued items, ready to serve you.</h2></p><style>table, th, td {padding:0 10px 0 10px;}table {border-spacing: 10px;}</style><table ><tr><td style=\"padding:0 10px 0 10px;\" align=\"center\" valign=\"center\"><a href=http://127.0.0.1:7101/shopbookHome/shop/ProductPage?p1=EG0000001G00010001S0001&p2=EG0000001G00010001S0001CLR02&p3=White Painted&p4=No><img height=\"250\" width=\"250\" src=\"cid:1660486256\"/></a><br/><p class=\"small\"><span style=\"color: #000080;\"><strong>Table Chair-White Painted-One Size</strong></span><br><strong><span style=\"color: #808080;\"><span style=\"text-decoration: line-through;\">162.00 EGP</span>  160.00 EGP</strong></span></p><br></td><td style=\"padding:0 10px 0 10px;\" align=\"center\" valign=\"center\"><a href=http://127.0.0.1:7101/shopbookHome/shop/ProductPage?p1=EG0000001G00020002S0001&p2=EG0000001G00020002S0001CLR00&p3=Default Color&p4=No><img height=\"250\" width=\"250\" src=\"cid:1660486248\"/></a><br/><p class=\"small\"><span style=\"color: #000080;\"><strong>Leggy Trouser-Default Color-XS</strong></span><br><strong><span style=\"color: #808080;\"><span style=\"text-decoration: line-through;\">225.00 EGP</span>  225.00 EGP</strong></span></p><br></td><td style=\"padding:0 10px 0 10px;\" align=\"center\" valign=\"center\"><a href=http://127.0.0.1:7101/shopbookHome/shop/ProductPage?p1=EG0000001G00010001S0001&p2=EG0000001G00010001S0001CLR04&p3=Navy&p4=No><img height=\"250\" width=\"250\" src=\"cid:1660486238\"/></a><br/><p class=\"small\"><span style=\"color: #000080;\"><strong>Table Chair-Navy</strong></span><br><strong><span style=\"color: #808080;\"><span style=\"text-decoration: line-through;\">165.00 EGP</span>  148.00 EGP</strong></span></p><br></td></tr><tr><td style=\"padding:0 10px 0 10px;\" align=\"center\" valign=\"center\"><a href=http://127.0.0.1:7101/shopbookHome/shop/ProductPage?p1=EG0000001G00010001S0001&p2=EG0000001G00010001S0001CLR00&p3=Default Color&p4=No><img height=\"250\" width=\"250\" src=\"cid:1660486232\"/></a><br/><p class=\"small\"><span style=\"color: #000080;\"><strong>Table Chair-Default Color</strong></span><br><strong><span style=\"color: #808080;\"><span style=\"text-decoration: line-through;\">175.00 EGP</span>  175.00 EGP</strong></span></p><br></td><td style=\"padding:0 10px 0 10px;\" align=\"center\" valign=\"center\"><a href=http://127.0.0.1:7101/shopbookHome/shop/ProductPage?p1=EG0000001G00020002S0002&p2=EG0000001G00020002S0002CLR00&p3=Default Color&p4=No><img height=\"250\" width=\"250\" src=\"cid:1660486147\"/></a><br/><p class=\"small\"><span style=\"color: #000080;\"><strong>Carina V-Shirt</strong></span><br><strong><span style=\"color: #808080;\"><span style=\"text-decoration: line-through;\">4.00 EGP</span>  11.00 EGP</strong></span></p><br></td><td style=\"padding:0 10px 0 10px;\" align=\"center\" valign=\"center\"><a href=http://127.0.0.1:7101/shopbookHome/shop/ProductPage?p1=EG0000001G00020002S0001&p2=EG0000001G00020002S0001CLR00&p3=Default Color&p4=No><img height=\"250\" width=\"250\" src=\"cid:1660486139\"/></a><br/><p class=\"small\"><span style=\"color: #000080;\"><strong>Leggy Trouser</strong></span><br><strong><span style=\"color: #808080;\"><span style=\"text-decoration: line-through;\">225.00 EGP</span>  225.00 EGP</strong></span></p><br></td></tr><tr><td style=\"padding:0 10px 0 10px;\" align=\"center\" valign=\"center\"><a href=http://127.0.0.1:7101/shopbookHome/shop/ProductPage?p1=EG0000001G00020002S0001&p2=EG0000001G00020002S0001CLR00&p3=Default Color&p4=No><img height=\"250\" width=\"250\" src=\"cid:1660486357\"/></a><br/><p class=\"small\"><span style=\"color: #000080;\"><strong>Leggy Trouser-Default Color-M</strong></span><br><strong><span style=\"color: #808080;\"><span style=\"text-decoration: line-through;\">225.00 EGP</span>  240.30 EGP</strong></span></p><br></td><td style=\"padding:0 10px 0 10px;\" align=\"center\" valign=\"center\"><a href=http://127.0.0.1:7101/shopbookHome/shop/ProductPage?p1=EG0000001G00010001S0001&p2=EG0000001G00010001S0001CLR00&p3=Default Color&p4=No><img height=\"250\" width=\"250\" src=\"cid:1660486133\"/></a><br/><p class=\"small\"><span style=\"color: #000080;\"><strong>Table Chair</strong></span><br><strong><span style=\"color: #808080;\"><span style=\"text-decoration: line-through;\">133.20 EGP</span>  117.22 EGP</strong></span></p><br></td></table><p>Thank you for being one of our customers.</p><p></p><p><strong>My Shop</strong></p>address : <strong>DokiGiza8th St. Mohy eldin Abo elezz,</strong><p></p>Tel. : <strong>0000000, 0000000, 0000001\n</strong><p></p>website : <strong>www.shopbook.com</strong><p></p><p></p>&nbsp;&nbsp;&nbsp;</html>','false','false');
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `ID` varchar(14) NOT NULL,
  `permission` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES ('EG0000001G0001','Furniture Collage'),('EG0000001G0002','Women Clothes'),('EG0000001G0003','Fashion Men'),('EG0000001G0004','xxxxx'),('EG0000001G0005','Skirts'),('EG0000001G0006','Formal Skirt'),('EG0000001G0007','Dancing Skirt'),('EG0000001G0008','Afetrnoon Skirt'),('EG0000001G0009','Shopping Skirt'),('EG0000001G0010','Collection Shirts'),('EG0000001G0011','Red Shirt'),('EG0000001G0012','Black white Shirt');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `POST_CODE` bigint(20) NOT NULL COMMENT 'UML to Offline Database Transform: Column POST_CODE created from UML attribute "post code" in UML class "post"',
  `POST_DATETIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column POST_DATETIME created from UML attribute "post datetime" in UML class "post"',
  `POST_TEXT` varchar(2000) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column POST_TEXT created from UML attribute "post text" in UML class "post"',
  `PHOTO_NAME` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column PHOTO_NAME created from UML attribute "photo name" in UML class "post"',
  `USER_ID` varchar(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column USER_POST created as default foreign key column for foreign key "USER_POST"',
  `RATE_POST_FLAG` varchar(1) DEFAULT 'P' COMMENT 'UML to Offline Database Transform: Column RATE_POST_FLAG created from UML attribute "rate post flag" in UML class "post"',
  `RATE` int(5) DEFAULT '0' COMMENT 'UML to Offline Database Transform: Column RATE created from UML attribute "rate" in UML class "post"',
  `PHOTO_FORMAT` varchar(20) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column PHOTO_FORMAT created from UML attribute "photo format" in UML class "post"',
  `PHOTO_FILEPATH` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column PHOTO_FILEPATH created from UML attribute "photo filepath" in UML class "post"',
  `POST_CODE_PRNT` bigint(20) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column POSTS_TREE created as default foreign key column for foreign key "POSTS_TREE"',
  `SHOP_CODE` varchar(9) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_POST created as default foreign key column for foreign key "SHOP_POST"',
  `SKU_CLR_CODE` varchar(28) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SKU_COLOR_TO_POST created as default foreign key column for foreign key "SKU_COLOR_TO_POST"',
  `SKU_CODE` varchar(23) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SKU_POST created as default foreign key column for foreign key "SKU_POST"',
  `SKU_SIZE_CODE` varchar(29) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SKU_SIZE_TO_POST created as default foreign key column for foreign key "SKU_SIZE_TO_POST"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "post"',
  PRIMARY KEY (`POST_CODE`),
  KEY `POSTS_TREE` (`POST_CODE_PRNT`),
  KEY `SHOP_POST` (`SHOP_CODE`),
  KEY `SKU_POST` (`SKU_CODE`),
  KEY `SKU_SIZE_TO_POST` (`SKU_SIZE_CODE`),
  KEY `USER_POST` (`USER_ID`),
  KEY `POSTS_INDEX` (`POST_CODE`),
  KEY `SKU_COLOR_TO_POST_idx` (`SKU_CLR_CODE`),
  CONSTRAINT `POSTS_TREE` FOREIGN KEY (`POST_CODE_PRNT`) REFERENCES `posts` (`POST_CODE`),
  CONSTRAINT `SHOP_POST` FOREIGN KEY (`SHOP_CODE`) REFERENCES `shops` (`SHOP_CODE`),
  CONSTRAINT `SKU_COLOR_TO_POST` FOREIGN KEY (`SKU_CLR_CODE`) REFERENCES `sku_colors` (`SKU_CLR_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SKU_POST` FOREIGN KEY (`SKU_CODE`) REFERENCES `skus` (`SKU_CODE`),
  CONSTRAINT `SKU_SIZE_TO_POST` FOREIGN KEY (`SKU_SIZE_CODE`) REFERENCES `sku_sizes` (`SKU_SIZE_CODE`),
  CONSTRAINT `USER_POST` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table POSTS created from UML class "post"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint POSTS_TREE created for UML association "posts tree"\r\nUML to Offline Database Transform: Foreign key constraint SHOP_POST created for UML association "shop post"\r\nUML to Offline Database Transform: Foreign key constraint SKU_COLOR_TO_POST created for UML association "sku color to post"\r\nUML to Offline Database Transform: Foreign key constraint SKU_POST created for UML association "sku post"\r\nUML to Offline Database Transform: Foreign key constraint SKU_SIZE_TO_POST created for UML association "sku size to post"\r\nUML to Offline Database Transform: Foreign key constraint USER_POST created for UML association "user post"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (20220926131242,'2022-09-26 14:12:42','AAAAAAAAAAAAAAAAAAAAAAAAAAA',NULL,'mohamed.fayed@gmail.com','P',4,NULL,NULL,NULL,NULL,NULL,'EG0000001G00010001S0001',NULL,'2022-09-26 13:12:42'),(20220928140130,'2022-09-28 15:01:31','SSSSSSSSSSSSSSSSSS',NULL,'user2@yopmail.com','P',4,NULL,NULL,NULL,NULL,NULL,'EG0000001G00010001S0001',NULL,'2022-09-28 14:01:30');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `references_names`
--

DROP TABLE IF EXISTS `references_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `references_names` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BR_PLURAL` varchar(50) DEFAULT NULL,
  `BR_SINGLE` varchar(45) DEFAULT NULL,
  `MD_PLURAL` varchar(45) DEFAULT NULL,
  `MD_SINGLE` varchar(45) DEFAULT NULL,
  `MN_PLURAN` varchar(45) DEFAULT NULL,
  `MN_SINGLE` varchar(45) DEFAULT NULL,
  `LANG` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_references_names_langs_idx` (`LANG`),
  CONSTRAINT `fk_references_names_langs` FOREIGN KEY (`LANG`) REFERENCES `languages` (`LANG_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `references_names`
--

LOCK TABLES `references_names` WRITE;
/*!40000 ALTER TABLE `references_names` DISABLE KEYS */;
INSERT INTO `references_names` VALUES (1,'XXXXX','Brand','Models','Model','CCCCC','Manufacturer','en'),(2,'??????','??????????','????????????????','?????? ??????????????','????????????','?????? ????????????','ar');
/*!40000 ALTER TABLE `references_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `ID` varchar(5) NOT NULL,
  `ROLE` varchar(30) DEFAULT NULL,
  `TYPE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('C0000','GroupAdmin','C'),('C0001','CatAdmin','C'),('O0000','OrderMgmnt','O'),('S0000','SysAdmin','S'),('U0000','User','U');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_permissions`
--

DROP TABLE IF EXISTS `roles_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_permissions` (
  `ID` varchar(5) NOT NULL,
  `ROLE` varchar(14) NOT NULL,
  PRIMARY KEY (`ID`,`ROLE`),
  KEY `permission_to_role_permissions_fk_idx` (`ROLE`),
  CONSTRAINT `permission_to_role_permissions_fk` FOREIGN KEY (`ROLE`) REFERENCES `permissions` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `roles_to_role_permissions_fk` FOREIGN KEY (`ID`) REFERENCES `roles` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_permissions`
--

LOCK TABLES `roles_permissions` WRITE;
/*!40000 ALTER TABLE `roles_permissions` DISABLE KEYS */;
INSERT INTO `roles_permissions` VALUES ('C0001','EG0000001G0001'),('C0001','EG0000001G0002');
/*!40000 ALTER TABLE `roles_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship_rtrn_policies`
--

DROP TABLE IF EXISTS `ship_rtrn_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ship_rtrn_policies` (
  `CODE` varchar(5) NOT NULL COMMENT 'UML to Offline Database Transform: Column CODE created from UML attribute "code" in UML class "ship rtrn policy"',
  `TYPE` varchar(1) NOT NULL DEFAULT 'G' COMMENT 'UML to Offline Database Transform: Column TYPE created from UML attribute "type" in UML class "ship rtrn policy"',
  `TXT` varchar(2000) NOT NULL COMMENT 'UML to Offline Database Transform: Column TXT created from UML attribute "txt" in UML class "ship rtrn policy"',
  `ORDR` int(3) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column ORDR created from UML attribute "ordr" in UML class "ship rtrn policy"',
  `ACTIVE` varchar(1) DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column ACTIVE created from UML attribute "active" in UML class "ship rtrn policy"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "ship rtrn policy"',
  `PERC_OR_VAL` varchar(2) DEFAULT 'V',
  `VALUE` decimal(13,2) DEFAULT '0.00',
  `city_code` varchar(6) DEFAULT NULL,
  `SHORT_TXT` varchar(45) DEFAULT NULL,
  `DEFAULT` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`CODE`),
  KEY `city_ship_policy_fk_idx` (`city_code`),
  CONSTRAINT `city_ship_policy_fk` FOREIGN KEY (`city_code`) REFERENCES `cities` (`city_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SHIP_RTRN_POLICIES created from UML class "ship rtrn policy"\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship_rtrn_policies`
--

LOCK TABLES `ship_rtrn_policies` WRITE;
/*!40000 ALTER TABLE `ship_rtrn_policies` DISABLE KEYS */;
INSERT INTO `ship_rtrn_policies` VALUES ('G0000','G','Reserved',0,'N','2020-06-10 15:20:28','V',0.00,NULL,NULL,NULL),('G0001','G','Test First Test First  Test First Test First Test First Test First Test First Test First Test First Test First Test First Test First Test First Test First Test First Test First Test First Test First Test First Test First Test First ',NULL,'Y','2020-06-11 10:23:42','V',0.00,NULL,'Term One',NULL),('G0002','G','Test Second-1111',NULL,'Y','2020-06-11 10:25:22','V',0.00,NULL,'Term Two',NULL),('G0003','G','Test Third',NULL,'Y','2020-06-11 10:24:31','V',0.00,NULL,'Term Three',NULL),('G0004','G','Forth General Term Term -11111',NULL,'Y','2020-06-11 14:26:25','N',0.00,NULL,'Term Four',NULL),('R0000','R','Reserved',0,'N','2020-06-10 15:29:51','V',0.00,NULL,NULL,NULL),('R0001','R','First Return Term -11111.........................................................',NULL,'Y','2020-06-11 10:30:07','V',0.00,'C00001','Return Policy one',NULL),('R0002','R','Second Return Term,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,',NULL,'Y','2020-06-11 10:30:44','V',50.00,NULL,'Return Policy Two',NULL),('R0003','R','Third Return Term!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\nTerm!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!',NULL,'Y','2020-06-11 10:30:44','P',12.00,'C00004','Return Policy Three.',NULL),('R0004','R','Fourth Return Term -111',NULL,'Y','2020-06-11 14:25:31','V',0.00,NULL,NULL,NULL),('S0000','S','Reserved',0,'N','2020-06-10 15:25:45','V',0.00,NULL,NULL,NULL),('S0001','S','Shipping to within Alexandria will be in 3 days and will cost 15.00 EGP.',NULL,'Y','2021-09-21 08:57:15','V',10.00,'C00002','Alexandria Delivery',NULL),('S0002','S','Shipping to within Cairo will be in 3 days and will cost 25.00 EGP.',NULL,'Y','2021-09-21 09:11:29','V',25.00,'C00001','Cairo Shipping ',NULL),('S0003','S','Delivery will be in 2 days and will cost 50.00 EGP',NULL,'Y','2022-02-11 20:46:47','V',50.00,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ship_rtrn_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_categories`
--

DROP TABLE IF EXISTS `shop_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_categories` (
  `SHOP_CAT_CODE` varchar(14) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_CAT_CODE created from UML attribute "shop cat code" in UML class "shop category"',
  `CAT_IMAGE_NAME` varchar(200) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column CAT_IMAGE_NAME created from UML attribute "cat image name" in UML class "shop category"',
  `CAT_IMAGE_TYPE` varchar(9) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column CAT_IMAGE_TYPE created from UML attribute "cat image type" in UML class "shop category"',
  `CAT_CODE` varchar(5) NOT NULL COMMENT 'UML to Offline Database Transform: Column CATEGORY_TO_SHOP created as default foreign key column for foreign key "CATEGORY_TO_SHOP"',
  `SHOP_CODE` varchar(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_TO_CATEGORY created as default foreign key column for foreign key "SHOP_TO_CATEGORY"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop category"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SHOP_CAT_CODE`),
  KEY `CATEGORY_TO_SHOP` (`CAT_CODE`),
  KEY `SHOP_TO_CATEGORY` (`SHOP_CODE`),
  KEY `SHOP_CATEGORIES_INDEX` (`SHOP_CAT_CODE`),
  CONSTRAINT `CATEGORY_TO_SHOP` FOREIGN KEY (`CAT_CODE`) REFERENCES `categories` (`CAT_CODE`),
  CONSTRAINT `SHOP_TO_CATEGORY` FOREIGN KEY (`SHOP_CODE`) REFERENCES `shops` (`SHOP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SHOP_CATEGORIES created from UML class "shop category"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint CATEGORY_TO_SHOP created for UML association "category to shop"\r\nUML to Offline Database Transform: Foreign key constraint SHOP_TO_CATEGORY created for UML association "shop to category"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_categories`
--

LOCK TABLES `shop_categories` WRITE;
/*!40000 ALTER TABLE `shop_categories` DISABLE KEYS */;
INSERT INTO `shop_categories` VALUES ('EG0000001G0001','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/211220_075837.jpeg','.jpeg','G0001','EG0000001',NULL,'2021-12-20 07:57:58'),('EG0000001G0002','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/211220_075926.jpeg','.jpeg','G0002','EG0000001',NULL,'2021-12-20 07:59:10'),('EG0000001G0003','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/211220_080004.jpeg','.jpeg','G0003','EG0000001',NULL,'2021-12-20 07:59:57'),('EG0000001G0004','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220822_180121.jpeg','.jpeg','G0004','EG0000001',NULL,'2022-08-22 16:57:33'),('EG0000001G0005','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_023705.jpeg','.jpeg','G0005','EG0000001',NULL,'2022-08-25 02:36:57'),('EG0000001G0006','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_023735.jpeg','.jpeg','G0006','EG0000001',NULL,'2022-08-25 02:37:27'),('EG0000001G0007','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_023824.jpeg','.jpeg','G0007','EG0000001',NULL,'2022-08-25 02:37:55'),('EG0000001G0008','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_023926.jpeg','.jpeg','G0008','EG0000001',NULL,'2022-08-25 02:39:17'),('EG0000001G0009','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_024016.jpeg','.jpeg','G0009','EG0000001',NULL,'2022-08-25 02:40:07'),('EG0000001G0010','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_024302.jpeg','.jpeg','G0010','EG0000001',NULL,'2022-08-25 02:42:42'),('EG0000001G0011','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_024435.jpeg','.jpeg','G0011','EG0000001',NULL,'2022-08-25 02:44:33'),('EG0000001G0012','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_024457.jpeg','.jpeg','G0012','EG0000001',NULL,'2022-08-25 02:44:55');
/*!40000 ALTER TABLE `shop_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category_admins`
--

DROP TABLE IF EXISTS `shop_category_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_category_admins` (
  `ADMIN_SHP_CAT_CODE` varchar(150) NOT NULL COMMENT 'UML to Offline Database Transform: Column ADMIN_SHP_CAT_CODE created from UML attribute "admin shp cat code" in UML class "shop category admin"',
  `ACTIVE` varchar(1) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column ACTIVE created from UML attribute "active" in UML class "shop category admin"',
  `USER_ID` varchar(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column ADMIN_TO_ADMIN_CAT created as default foreign key column for foreign key "ADMIN_TO_ADMIN_CAT"',
  `SHOP_CAT_SUB_CODE` varchar(18) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_CATS_TO_ADMIN_CAT created as default foreign key column for foreign key "SHOP_CATS_TO_ADMIN_CAT"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop category admin"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shop category admin"',
  PRIMARY KEY (`ADMIN_SHP_CAT_CODE`),
  KEY `ADMIN_TO_ADMIN_CAT` (`USER_ID`),
  KEY `SHOP_CATS_TO_ADMIN_CAT` (`SHOP_CAT_SUB_CODE`),
  KEY `SHOP_CATEGORY_ADMINS_INDEX` (`ADMIN_SHP_CAT_CODE`),
  CONSTRAINT `ADMIN_TO_ADMIN_CAT` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  CONSTRAINT `SHOP_CATS_TO_ADMIN_CAT` FOREIGN KEY (`SHOP_CAT_SUB_CODE`) REFERENCES `shop_sub_cats` (`SHOP_SUB_CAT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SHOP_CATEGORY_ADMINS created from UML class "shop category admin"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint ADMIN_TO_ADMIN_CAT created for UML association "admin to admin cat"\r\nUML to Offline Database Transform: Foreign key constraint SHOP_CATS_TO_ADMIN_CAT created for UML association "shop cats to admin cat"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category_admins`
--

LOCK TABLES `shop_category_admins` WRITE;
/*!40000 ALTER TABLE `shop_category_admins` DISABLE KEYS */;
INSERT INTO `shop_category_admins` VALUES ('p1@yopmail.comEG0000001G00010001','Y','p1@yopmail.com','EG0000001G00010001',NULL,'2022-02-17 15:05:42'),('p1@yopmail.comEG0000001G00020002','Y','p1@yopmail.com','EG0000001G00020002',NULL,'2022-02-18 00:11:10');
/*!40000 ALTER TABLE `shop_category_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_docs`
--

DROP TABLE IF EXISTS `shop_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_docs` (
  `SHOP_DOC_CODE` varchar(15) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_DOC_CODE created from UML attribute "shop doc code" in UML class "shop doc"',
  `SHOP_DOC_NAME` varchar(500) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_DOC_NAME created from UML attribute "shop doc name" in UML class "shop doc"',
  `SHOP_DOC_FILE_PATH` varchar(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_DOC_FILE_PATH created from UML attribute "shop doc file path" in UML class "shop doc"',
  `SHOP_DOC_FILE_TYPE` varchar(20) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_DOC_FILE_TYPE created from UML attribute "shop doc file type" in UML class "shop doc"',
  `SHOP_DOC_FILE_NAME` varchar(50) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_DOC_FILE_NAME created from UML attribute "shop doc file name" in UML class "shop doc"',
  `CNTRY_DOC_TYPE` varchar(6) NOT NULL COMMENT 'UML to Offline Database Transform: Column DOC_TYPE_TO_PROOF_DOC created as default foreign key column for foreign key "DOC_TYPE_TO_PROOF_DOC"',
  `SHOP_CODE` varchar(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_TO_PROOF_DOCS created as default foreign key column for foreign key "SHOP_TO_PROOF_DOCS"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shop doc"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop doc"',
  PRIMARY KEY (`SHOP_DOC_CODE`),
  KEY `DOC_TYPE_TO_PROOF_DOC` (`CNTRY_DOC_TYPE`),
  KEY `SHOP_TO_PROOF_DOCS` (`SHOP_CODE`),
  KEY `SHOP_DOCS_INDEX` (`SHOP_DOC_CODE`),
  CONSTRAINT `DOC_TYPE_TO_PROOF_DOC` FOREIGN KEY (`CNTRY_DOC_TYPE`) REFERENCES `shop_proof_doc_types` (`CNTRY_DOC_TYPE`),
  CONSTRAINT `SHOP_TO_PROOF_DOCS` FOREIGN KEY (`SHOP_CODE`) REFERENCES `shops` (`SHOP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SHOP_DOCS created from UML class "shop doc"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint DOC_TYPE_TO_PROOF_DOC created for UML association "doc type to proof doc"\r\nUML to Offline Database Transform: Foreign key constraint SHOP_TO_PROOF_DOCS created for UML association "shop to proof docs"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_docs`
--

LOCK TABLES `shop_docs` WRITE;
/*!40000 ALTER TABLE `shop_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_fees_hists`
--

DROP TABLE IF EXISTS `shop_fees_hists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_fees_hists` (
  `TRANS_CODE` varchar(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column TRANS_CODE created from UML attribute "trans code" in UML class "shop fees hist"',
  `TRNS_DATE` datetime DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column TRNS_DATE created from UML attribute "trns date" in UML class "shop fees hist"',
  `TRNS_BNK_ID` varchar(50) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column TRNS_BNK_ID created from UML attribute "trns bnk id" in UML class "shop fees hist"',
  `TRNS_VALUE` int(5) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column TRNS_VALUE created from UML attribute "trns value" in UML class "shop fees hist"',
  `NEXT_TRNS_DATE` datetime DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NEXT_TRNS_DATE created from UML attribute "next trns date" in UML class "shop fees hist"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop fees hist"',
  `SHOP_CODE` varchar(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_TO_FEES_HIST created as default foreign key column for foreign key "SHOP_TO_FEES_HIST"',
  PRIMARY KEY (`TRANS_CODE`),
  KEY `SHOP_TO_FEES_HIST` (`SHOP_CODE`),
  KEY `SHOP_FEES_HISTS_INDEX` (`TRANS_CODE`),
  CONSTRAINT `SHOP_TO_FEES_HIST` FOREIGN KEY (`SHOP_CODE`) REFERENCES `shops` (`SHOP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SHOP_FEES_HISTS created from UML class "shop fees hist"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SHOP_TO_FEES_HIST created for UML association "shop to fees hist"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_fees_hists`
--

LOCK TABLES `shop_fees_hists` WRITE;
/*!40000 ALTER TABLE `shop_fees_hists` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_fees_hists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_imageses`
--

DROP TABLE IF EXISTS `shop_imageses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_imageses` (
  `SHOP_IMAGE_ID` varchar(11) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_IMAGE_ID created from UML attribute "shop image id" in UML class "shop images"',
  `SHOP_CODE` varchar(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_TO_SHOP_IMAGE created as default foreign key column for foreign key "SHOP_TO_SHOP_IMAGE"',
  `IMG_NAME` varchar(20) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column IMG_NAME created from UML attribute "img name" in UML class "shop images"',
  `IMG_PATH` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column IMG_PATH created from UML attribute "img path" in UML class "shop images"',
  `IMG_FORMAT` varchar(20) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column IMG_FORMAT created from UML attribute "img format" in UML class "shop images"',
  `HIDE` varchar(1) DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column HIDE created from UML attribute "hide" in UML class "shop images"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shop images"',
  PRIMARY KEY (`SHOP_IMAGE_ID`),
  KEY `SHOP_TO_SHOP_IMAGES` (`SHOP_CODE`),
  CONSTRAINT `SHOP_TO_SHOP_IMAGES` FOREIGN KEY (`SHOP_CODE`) REFERENCES `shops` (`SHOP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SHOP_IMAGESES created from UML class "shop images"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SHOP_TO_SHOP_IMAGE created for UML association "shop to shop image"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_imageses`
--

LOCK TABLES `shop_imageses` WRITE;
/*!40000 ALTER TABLE `shop_imageses` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_imageses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_proof_doc_types`
--

DROP TABLE IF EXISTS `shop_proof_doc_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_proof_doc_types` (
  `CNTRY_DOC_TYPE` varchar(6) NOT NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_DOC_TYPE created from UML attribute "cntry doc type" in UML class "shop proof doc type"',
  `CNTRY_DOC_TYPE_NAME` varchar(200) NOT NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_DOC_TYPE_NAME created from UML attribute "cntry doc type name" in UML class "shop proof doc type"',
  `CNTRY_DOC_TYPE_DESC` varchar(255) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_DOC_TYPE_DESC created from UML attribute "cntry doc type desc" in UML class "shop proof doc type"',
  `CNTRY_DOC_TYPE_IMG` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_DOC_TYPE_IMG created from UML attribute "cntry doc type img" in UML class "shop proof doc type"',
  `CNTRY_DOC_TYPE_FORMAT` varchar(20) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_DOC_TYPE_FORMAT created from UML attribute "cntry doc type format" in UML class "shop proof doc type"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop proof doc type"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shop proof doc type"',
  `CNTRY_CODE2` varchar(2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_TO_DOC_TYPE created as default foreign key column for foreign key "CNTRY_TO_DOC_TYPE"',
  `LANG_CODE` varchar(2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column LANG_TO_SHOP_PROOF_DOC_TYPE created as default foreign key column for foreign key "LANG_TO_SHOP_PROOF_DOC_TYPE"',
  PRIMARY KEY (`CNTRY_DOC_TYPE`),
  KEY `CNTRY_TO_DOC_TYPE` (`CNTRY_CODE2`),
  KEY `LANG_TO_SHOP_PROOF_DOC_TYPE` (`LANG_CODE`),
  KEY `SHOP_PROOF_DOC_TYPES_INDEX` (`CNTRY_DOC_TYPE`),
  CONSTRAINT `CNTRY_TO_DOC_TYPE` FOREIGN KEY (`CNTRY_CODE2`) REFERENCES `countries` (`CNTRY_CODE2`),
  CONSTRAINT `LANG_TO_SHOP_PROOF_DOC_TYPE` FOREIGN KEY (`LANG_CODE`) REFERENCES `languages` (`LANG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SHOP_PROOF_DOC_TYPES created from UML class "shop proof doc type"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint CNTRY_TO_DOC_TYPE created for UML association "cntry to doc type"\r\nUML to Offline Database Transform: Foreign key constraint LANG_TO_SHOP_PROOF_DOC_TYPE created for UML association "lang to shop proof doc type"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_proof_doc_types`
--

LOCK TABLES `shop_proof_doc_types` WRITE;
/*!40000 ALTER TABLE `shop_proof_doc_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_proof_doc_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_skus`
--

DROP TABLE IF EXISTS `shop_skus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_skus` (
  `SHOP_SKU_CODE` varchar(44) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_SKU_CODE created from UML attribute "shop sku code" in UML class "shop sku"',
  `SHOP_CODE` varchar(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_BRANCH_TO_SKU created as default foreign key column for foreign key "SHOP_BRANCH_TO_SKU"',
  `SKU_SZ_CLR_CODE` varchar(37) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_TO_SKU_SZ_CLR created as default foreign key column for foreign key "SHOP_TO_SKU_SZ_CLR"',
  `QNTY_IN_STOCK` int(4) DEFAULT '0' COMMENT 'UML to Offline Database Transform: Column QNTY_IN_STOCK created from UML attribute "qnty in stock" in UML class "shop sku"',
  `AVAILABLE` varchar(1) DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "shop sku"',
  `HIDE` varchar(1) DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column HIDE created from UML attribute "hide" in UML class "shop sku"',
  `NOTES` varchar(500) DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shop sku"',
  PRIMARY KEY (`SHOP_SKU_CODE`),
  KEY `SHOP_BRANCH_TO_SKU` (`SHOP_CODE`),
  KEY `SHOP_TO_SKU_SZ_CLR` (`SKU_SZ_CLR_CODE`),
  KEY `SHOP_SKUS_INDEX` (`SHOP_SKU_CODE`),
  CONSTRAINT `SHOP_BRANCH_TO_SKU` FOREIGN KEY (`SHOP_CODE`) REFERENCES `shops` (`SHOP_CODE`),
  CONSTRAINT `SHOP_TO_SKU_SZ_CLR` FOREIGN KEY (`SKU_SZ_CLR_CODE`) REFERENCES `sku_size_colors` (`SKU_SZ_CLR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SHOP_SKUS created from UML class "shop sku"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SHOP_BRANCH_TO_SKU created for UML association "shop branch to sku"\r\nUML to Offline Database Transform: Foreign key constraint SHOP_TO_SKU_SZ_CLR created for UML association "shop to sku sz clr"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_skus`
--

LOCK TABLES `shop_skus` WRITE;
/*!40000 ALTER TABLE `shop_skus` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_skus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_sub_cat_prop_class_dets`
--

DROP TABLE IF EXISTS `shop_sub_cat_prop_class_dets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_sub_cat_prop_class_dets` (
  `SHP_SUBCAT_PRP_CLS_DET_CODE` varchar(25) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHP_SUBCAT_PRP_CLS_DET_CODE created from UML attribute "shp subcat prp cls det code" in UML class "shop sub cat prop class det"',
  `PROP_CLS_DET_NAME` varchar(4000) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column PROP_CLS_DET_NAME created from UML attribute "prop cls det name" in UML class "shop sub cat prop class det"',
  `PROP_CLASS_CODE` varchar(22) NOT NULL COMMENT 'UML to Offline Database Transform: Column PROP_CLSS_TO_DET created as default foreign key column for foreign key "PROP_CLSS_TO_DET"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop sub cat prop class det"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SHP_SUBCAT_PRP_CLS_DET_CODE`),
  KEY `PROP_CLSS_TO_DET` (`PROP_CLASS_CODE`),
  KEY `SHOP_SUB_CAT_PROP_CLASS_DETS_INDEX` (`SHP_SUBCAT_PRP_CLS_DET_CODE`),
  CONSTRAINT `PROP_CLSS_TO_DET` FOREIGN KEY (`PROP_CLASS_CODE`) REFERENCES `shop_sub_cat_prop_classes` (`SHP_SUB_CAT_PRP_CLS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SHOP_SUB_CAT_PROP_CLASS_DETS created from UML class "shop sub cat prop class det"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint PROP_CLSS_TO_DET created for UML association "prop clss to det"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_sub_cat_prop_class_dets`
--

LOCK TABLES `shop_sub_cat_prop_class_dets` WRITE;
/*!40000 ALTER TABLE `shop_sub_cat_prop_class_dets` DISABLE KEYS */;
INSERT INTO `shop_sub_cat_prop_class_dets` VALUES ('EG0000001G00010001P001D00','Reserved','EG0000001G00010001P001','n/a','2021-12-20 08:05:53'),('EG0000001G00010001P001D01','Zan Wood AAAAAAAAAA BBBBB CCCCCCCCCCC','EG0000001G00010001P001',NULL,'2021-12-20 08:06:47'),('EG0000001G00010001P001D02','Water Proof  AAAAAAAAAA BBBBB CCCCCCCCCCC','EG0000001G00010001P001',NULL,'2021-12-20 08:06:47'),('EG0000001G00010001P001D03','Sheilded and isolated  AAAAAAAAAA BBBBB CCCCCCCCCCC','EG0000001G00010001P001',NULL,'2021-12-20 08:06:47'),('EG0000001G00010001P001D04',' AAAAAAAAAA BBBBB CCCCCCCCCCC DDDDDDDDDDDDDD\nVVVVVVVVVVVVVVVVVVVV','EG0000001G00010001P001',NULL,'2022-09-30 05:52:26'),('EG0000001G00010001P001D05','SSSSSSSSSSSS XXXX DDD EEEEEEEEEEEEEE RRRRRRRRRRRR FFFFFFFFFFFFF','EG0000001G00010001P001',NULL,'2022-09-30 05:54:15'),('EG0000001G00010001P001D06',' AAAAAAAAAA BBBBB CCCCCCCCCCC DDDDDDDDDDDDDD\nTTTTTTTTTTTTTTTTTT','EG0000001G00010001P001',NULL,'2022-09-30 05:55:09'),('EG0000001G00020002P001D00','Reserved','EG0000001G00020002P001','n/a','2021-12-20 08:10:40'),('EG0000001G00020002P001D01','* - Cotton 100%','EG0000001G00020002P001',NULL,'2021-12-20 08:14:11'),('EG0000001G00020002P001D02','*- Poliyster 35%','EG0000001G00020002P001',NULL,'2021-12-20 08:14:11'),('EG0000001G00020002P001D03','*- Can be washed in Automatic machines','EG0000001G00020002P001',NULL,'2021-12-20 08:14:11'),('EG0000001G00030003P001D00','Reserved','EG0000001G00030003P001','n/a','2021-12-20 08:14:31'),('EG0000001G00030003P001D01','- Water proof Leather.','EG0000001G00030003P001',NULL,'2021-12-20 08:15:27'),('EG0000001G00030003P001D02','- Anti dust leather.','EG0000001G00030003P001',NULL,'2021-12-20 08:15:27'),('EG0000001G00030003P001D03','- Natural 100% leather.','EG0000001G00030003P001',NULL,'2021-12-20 08:15:27'),('EG0000001G00060006P001D00','Reserved','EG0000001G00060006P001','n/a','2022-08-29 16:29:55'),('EG0000001G00060006P001D01','The skirt is 90% polyester, 10% viscous. ','EG0000001G00060006P001',NULL,'2022-08-29 16:34:59');
/*!40000 ALTER TABLE `shop_sub_cat_prop_class_dets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_sub_cat_prop_classes`
--

DROP TABLE IF EXISTS `shop_sub_cat_prop_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_sub_cat_prop_classes` (
  `SHP_SUB_CAT_PRP_CLS_CODE` varchar(22) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHP_SUB_CAT_PRP_CLS_CODE created from UML attribute "shp sub cat prp cls code" in UML class "shop sub cat prop class"',
  `SHP_SUB_CAT_PRP_CLS_NAME` varchar(200) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SHP_SUB_CAT_PRP_CLS_NAME created from UML attribute "shp sub cat prp cls name" in UML class "shop sub cat prop class"',
  `SHOP_SUB_CAT_CODE` varchar(18) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_CAT_PROP_CLASS created as default foreign key column for foreign key "SHOP_CAT_PROP_CLASS"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shop sub cat prop class"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop sub cat prop class"',
  PRIMARY KEY (`SHP_SUB_CAT_PRP_CLS_CODE`),
  KEY `SHOP_CAT_PROP_CLASS` (`SHOP_SUB_CAT_CODE`),
  KEY `SHOP_SUB_CAT_PROP_CLASSES_INDEX` (`SHP_SUB_CAT_PRP_CLS_CODE`),
  CONSTRAINT `SHOP_CAT_PROP_CLASS` FOREIGN KEY (`SHOP_SUB_CAT_CODE`) REFERENCES `shop_sub_cats` (`SHOP_SUB_CAT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SHOP_SUB_CAT_PROP_CLASSES created from UML class "shop sub cat prop class"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SHOP_CAT_PROP_CLASS created for UML association "shop cat prop class"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_sub_cat_prop_classes`
--

LOCK TABLES `shop_sub_cat_prop_classes` WRITE;
/*!40000 ALTER TABLE `shop_sub_cat_prop_classes` DISABLE KEYS */;
INSERT INTO `shop_sub_cat_prop_classes` VALUES ('EG0000001G00010001P000','Reserved','EG0000001G00010001','2021-12-20 07:59:01',''),('EG0000001G00010001P001','Wood ','EG0000001G00010001','2021-12-20 08:05:53',NULL),('EG0000001G00020002P000','Reserved','EG0000001G00020002','2021-12-20 07:59:43',''),('EG0000001G00020002P001','Women','EG0000001G00020002','2021-12-20 08:10:40',NULL),('EG0000001G00030003P000','Reserved','EG0000001G00030003','2021-12-20 08:00:16',''),('EG0000001G00030003P001','Leather Shoes','EG0000001G00030003','2021-12-20 08:14:31',NULL),('EG0000001G00040004P000','Reserved','EG0000001G00040004','2022-08-22 16:57:33',''),('EG0000001G00050005P000','Reserved','EG0000001G00050005','2022-08-25 01:37:22',''),('EG0000001G00060006P000','Reserved','EG0000001G00060006','2022-08-25 01:37:47',''),('EG0000001G00060006P001','Skirts Properties','EG0000001G00060006','2022-08-29 16:29:55',NULL),('EG0000001G00070007P000','Reserved','EG0000001G00070007','2022-08-25 01:39:04',''),('EG0000001G00080008P000','Reserved','EG0000001G00080008','2022-08-25 01:39:45',''),('EG0000001G00090009P000','Reserved','EG0000001G00090009','2022-08-25 01:40:29',''),('EG0000001G00100010P000','Reserved','EG0000001G00100010','2022-08-25 01:44:29',''),('EG0000001G00110011P000','Reserved','EG0000001G00110011','2022-08-25 01:44:45',''),('EG0000001G00120012P000','Reserved','EG0000001G00120012','2022-08-25 01:45:14','');
/*!40000 ALTER TABLE `shop_sub_cat_prop_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_sub_cats`
--

DROP TABLE IF EXISTS `shop_sub_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_sub_cats` (
  `SHOP_SUB_CAT_CODE` varchar(18) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_SUB_CAT_CODE created from UML attribute "shop sub cat code" in UML class "shop sub cat"',
  `SHOP_SUB_CAT_NAME` varchar(200) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_SUB_CAT_NAME created from UML attribute "shop sub cat name" in UML class "shop sub cat"',
  `SUB_CAT_IMAGE_NAME` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SUB_CAT_IMAGE_NAME created from UML attribute "sub cat image name" in UML class "shop sub cat"',
  `SUB_CAT_IMAGE_TYPE` varchar(9) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SUB_CAT_IMAGE_TYPE created from UML attribute "sub cat image type" in UML class "shop sub cat"',
  `SHOP_CAT_CODE` varchar(14) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_CAT_TO_SUB_CAT created as default foreign key column for foreign key "SHOP_CAT_TO_SUB_CAT"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop sub cat"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SHOP_SUB_CAT_CODE`),
  KEY `SHOP_CAT_TO_SUB_CAT` (`SHOP_CAT_CODE`),
  KEY `SHOP_SUB_CATS_INDEX` (`SHOP_SUB_CAT_CODE`),
  CONSTRAINT `SHOP_CAT_TO_SUB_CAT` FOREIGN KEY (`SHOP_CAT_CODE`) REFERENCES `shop_categories` (`SHOP_CAT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SHOP_SUB_CATS created from UML class "shop sub cat"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SHOP_CAT_TO_SUB_CAT created for UML association "shop cat to sub cat"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_sub_cats`
--

LOCK TABLES `shop_sub_cats` WRITE;
/*!40000 ALTER TABLE `shop_sub_cats` DISABLE KEYS */;
INSERT INTO `shop_sub_cats` VALUES ('EG0000001G00010001','Furniture Collage','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/211220_075837.jpeg','.jpeg','EG0000001G0001',NULL,'2021-12-20 07:57:58'),('EG0000001G00020002','Women Clothes','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/211220_075926.jpeg','.jpeg','EG0000001G0002',NULL,'2021-12-20 07:59:10'),('EG0000001G00030003','Fashion Men','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/211220_080004.jpeg','.jpeg','EG0000001G0003',NULL,'2021-12-20 07:59:57'),('EG0000001G00040004','Dinning Tables','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220822_180121.jpeg','.jpeg','EG0000001G0004',NULL,'2022-08-22 16:57:33'),('EG0000001G00050005','Skirts','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_023705.jpeg','.jpeg','EG0000001G0005',NULL,'2022-08-25 02:36:57'),('EG0000001G00060006','Formal Skirt','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_023735.jpeg','.jpeg','EG0000001G0006',NULL,'2022-08-25 02:37:27'),('EG0000001G00070007','Dancing Skirt','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_023824.jpeg','.jpeg','EG0000001G0007',NULL,'2022-08-25 02:37:55'),('EG0000001G00080008','Afetrnoon Skirt','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_023926.jpeg','.jpeg','EG0000001G0008',NULL,'2022-08-25 02:39:17'),('EG0000001G00090009','Shopping Skirt','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_024016.jpeg','.jpeg','EG0000001G0009',NULL,'2022-08-25 02:40:07'),('EG0000001G00100010','Collection Shirts','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_024302.jpeg','.jpeg','EG0000001G0010',NULL,'2022-08-25 02:42:42'),('EG0000001G00110011','Red Shirt','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_024435.jpeg','.jpeg','EG0000001G0011',NULL,'2022-08-25 02:44:33'),('EG0000001G00120012','Black white Shirt','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/220825_024457.jpeg','.jpeg','EG0000001G0012',NULL,'2022-08-25 02:44:55');
/*!40000 ALTER TABLE `shop_sub_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_det`
--

DROP TABLE IF EXISTS `shopping_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_det` (
  `DET_ID` varchar(42) NOT NULL COMMENT 'UML to Offline Database Transform: Column DET_ID created from UML attribute "det id" in UML class "shopping det"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shopping det"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shopping det"',
  `QTY` decimal(7,2) DEFAULT '0.00' COMMENT 'UML to Offline Database Transform: Column QTY created from UML attribute "qty" in UML class "shopping det"',
  `UNIT_PRICE` decimal(13,2) DEFAULT '0.00' COMMENT 'UML to Offline Database Transform: Column UNIT_PRICE created from UML attribute "unit price" in UML class "shopping det"',
  `TOTAL_PRICE` decimal(13,2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column TOTAL_PRICE created from UML attribute "total price" in UML class "shopping det"',
  `SKU_STATUS` varchar(2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SKU_STATUS created from UML attribute "sku status" in UML class "shopping det"',
  `AVAILABLE` varchar(1) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "shopping det"',
  `ADDED_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column ADDED_DATE created from UML attribute "added date" in UML class "shopping det"',
  `TRANS_ID` varchar(30) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOPPING_MAST_DET created as default foreign key column for foreign key "SHOPPING_MAST_DET"',
  `SIZE_CODE` varchar(6) NOT NULL COMMENT 'UML to Offline Database Transform: Column SIZE_TO_SHOPPING_DET created as default foreign key column for foreign key "SIZE_TO_SHOPPING_DET"',
  `SKU_CLR_CODE` varchar(29) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_SHOPPING_DET created as default foreign key column for foreign key "SKU_TO_SHOPPING_DET"',
  `UNIT_CODE` varchar(4) NOT NULL COMMENT 'UML to Offline Database Transform: Column UNIT_TO_SHOPPING_DET created as default foreign key column for foreign key "UNIT_TO_SHOPPING_DET"',
  `SKU_NAME` varchar(200) DEFAULT NULL,
  `CLR_NAME` varchar(100) DEFAULT NULL,
  `SIZE_NAME` varchar(100) DEFAULT NULL,
  `UNIT_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DET_ID`),
  KEY `SHOPPING_MAST_DET` (`TRANS_ID`),
  KEY `shoppimg_mast_sku_clr_fk_idx` (`SKU_CLR_CODE`),
  KEY `shopping_mast_size_det_fk_idx` (`SIZE_CODE`),
  KEY `shopping_det_unit_fk_idx` (`UNIT_CODE`),
  CONSTRAINT `SHOPPING_MAST_DET` FOREIGN KEY (`TRANS_ID`) REFERENCES `shopping_master` (`TRANS_ID`),
  CONSTRAINT `shoppimg_det_sku_clr_fk` FOREIGN KEY (`SKU_CLR_CODE`) REFERENCES `sku_colors` (`SKU_CLR_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `shopping_det_size_det_fk` FOREIGN KEY (`SIZE_CODE`) REFERENCES `size_class_dets` (`SZ_DET_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `shopping_det_unit_fk` FOREIGN KEY (`UNIT_CODE`) REFERENCES `units` (`FROM_UNIT`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SHOPPING_DET created from UML class "shopping det"\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\nUML to Offline Database Transform: Foreign key constraint SHOPPING_MAST_DET created for UML association "shopping mast det"\nUML to Offline Database Transform: Foreign key constraint SIZE_TO_SHOPPING_DET created for UML association "size to shopping det"\nUML to Offline Database Transform: Foreign key constraint SKU_TO_SHOPPING_DET created for UML association "sku to shopping det"\nUML to Offline Database Transform: Foreign key constraint UNIT_TO_SHOPPING_DET created for UML association "unit to shopping det"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_det`
--

LOCK TABLES `shopping_det` WRITE;
/*!40000 ALTER TABLE `shopping_det` DISABLE KEYS */;
INSERT INTO `shopping_det` VALUES ('20220220174939EG0000001G00020002S0001CLR00','2022-02-20 17:49:39','I am testing to write note, and show how it would dispalyed.',3.00,225.00,675.00,'P',NULL,'2022-02-20 17:49:39','20220220174922','Z01D03','EG0000001G00020002S0001CLR00','U001','Leggy Trouser','Default Color','XXL','Each'),('20220220175154EG0000001G00010001S0001CLR01','2022-02-20 17:51:54','I am testing to write note, and show how it would dispalyed.',1.00,175.00,175.00,'P',NULL,'2022-02-20 17:51:54','20220220174922','Z03D01','EG0000001G00010001S0001CLR01','U001','Table Chair','Black','One Size','Each'),('20220301182925EG0000001G00010001S0001CLR02','2022-03-01 18:29:25','I am testing to write note, and show how it would dispalyed.',1.00,175.00,175.00,'P',NULL,'2022-03-01 18:29:25','20220301182925','Z03D01','EG0000001G00010001S0001CLR02','U001','Table Chair','White Painted','One Size','Each'),('20220301182949EG0000001G00010001S0001CLR00','2022-03-01 18:29:49','I am testing to write note, and show how it would dispalyed.',3.00,175.00,525.00,'P',NULL,'2022-03-01 18:29:49','20220301182925','Z03D01','EG0000001G00010001S0001CLR00','U001','Table Chair','Default Color','One Size','Each'),('20220309165432EG0000001G00010001S0001CLR00','2022-03-09 16:54:32','I am testing to write note, and show how it would dispalyed.',1.00,175.00,175.00,'P',NULL,'2022-03-09 16:54:32','20220309165432','Z03D01','EG0000001G00010001S0001CLR00','U001','Table Chair','Default Color','One Size','Each'),('20220309204821EG0000001G00020002S0001CLR00','2022-03-09 20:48:21','I am testing to write note, and show how it would dispalyed.',3.00,225.00,675.00,'P',NULL,'2022-03-09 20:48:21','20220309165432','Z01D03','EG0000001G00020002S0001CLR00','U001','Leggy Trouser','Default Color','XXL','Each'),('20220313170324EG0000001G00010001S0001CLR01','2022-03-13 17:03:24',NULL,2.00,175.00,350.00,'R',NULL,'2022-03-13 17:03:24','20220313170324','Z03D01','EG0000001G00010001S0001CLR01','U001','Table Chair','Black','One Size','Each'),('20220316091907EG0000001G00010001S0001CLR00','2022-03-16 09:19:07',NULL,2.00,175.00,350.00,'R',NULL,'2022-03-16 09:19:07','20220313170324','Z03D01','EG0000001G00010001S0001CLR00','U001','Table Chair','Default Color','One Size','Each'),('20220519113922EG0000001G00010001S0001CLR00','2022-05-19 11:39:22',NULL,1.00,148.00,148.00,NULL,NULL,'2022-05-19 11:39:22','20220519113922','Z03D01','EG0000001G00010001S0001CLR00','U001','Table Chair','Default Color','One Size','Each'),('20220519113941EG0000001G00020002S0002CLR00','2022-05-19 11:39:41',NULL,1.00,150.00,150.00,NULL,NULL,'2022-05-19 11:39:41','20220519113922','Z01D01','EG0000001G00020002S0002CLR00','U001','Carina V-Shirt','Default Color','S','Each');
/*!40000 ALTER TABLE `shopping_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_master`
--

DROP TABLE IF EXISTS `shopping_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_master` (
  `TRANS_ID` varchar(30) NOT NULL COMMENT 'UML to Offline Database Transform: Column TRANS_ID created from UML attribute "trans id" in UML class "shopping master"',
  `TRANS_DATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column TRANS_DATE_TIME created from UML attribute "trans date time" in UML class "shopping master"',
  `TRANS_VALUE` decimal(13,2) DEFAULT '0.00' COMMENT 'UML to Offline Database Transform: Column TRANS_VALUE created from UML attribute "trans value" in UML class "shopping master"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shopping master"',
  `MOB_NO` varchar(15) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column MOB_NO created from UML attribute "mob no" in UML class "shopping master"',
  `ADDRESS` varchar(200) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column ADDRESS created from UML attribute "address" in UML class "shopping master"',
  `TRANS_STATUS` varchar(2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column TRANS_STATUS created from UML attribute "trans status" in UML class "shopping master"',
  `PAYMENT_ID` varchar(30) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column PAYMENT_ID created from UML attribute "payment id" in UML class "shopping master"',
  `USER_ID` varchar(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column USER_TO_SHOPPING_MAST created as default foreign key column for foreign key "USER_TO_SHOPPING_MAST"',
  `FIRST_NAME` varchar(100) DEFAULT NULL,
  `LAST_NAME` varchar(100) DEFAULT NULL,
  `ADDRESS_1` varchar(100) DEFAULT NULL,
  `POSTAL_ZIP_CODE` varchar(10) DEFAULT NULL,
  `PAYMENT_METHOD` varchar(2) NOT NULL DEFAULT 'CD',
  `SHIPP_CODE` varchar(5) DEFAULT NULL,
  `CNTRY_CODE2` varchar(2) DEFAULT NULL,
  `CITY_CODE` varchar(6) DEFAULT NULL,
  `AREA_CODE` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`TRANS_ID`),
  KEY `shopping_mast_user_idx` (`USER_ID`),
  KEY `shipp_shopping_master_fk_idx` (`SHIPP_CODE`),
  KEY `country_shopping_mast_fk_idx` (`CNTRY_CODE2`),
  KEY `cities_shopping_mast_fk_idx` (`CITY_CODE`),
  KEY `areas_shopping_mast_fk_idx` (`AREA_CODE`),
  KEY `fk_shopping_master_1_idx` (`TRANS_STATUS`),
  CONSTRAINT `areas_shopping_mast_fk` FOREIGN KEY (`AREA_CODE`) REFERENCES `cities` (`city_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cities_shopping_mast_fk` FOREIGN KEY (`CITY_CODE`) REFERENCES `cities` (`city_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `country_shopping_mast_fk` FOREIGN KEY (`CNTRY_CODE2`) REFERENCES `countries` (`CNTRY_CODE2`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `shipp_shopping_master_fk` FOREIGN KEY (`SHIPP_CODE`) REFERENCES `ship_rtrn_policies` (`CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `shop_master_trans_status_fk` FOREIGN KEY (`TRANS_STATUS`) REFERENCES `shp_bag_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `shopping_mast_user` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SHOPPING_MASTER created from UML class "shopping master"\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\nUML to Offline Database Transform: Foreign key constraint USER_TO_SHOPPING_MAST created for UML association "user to shopping mast"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_master`
--

LOCK TABLES `shopping_master` WRITE;
/*!40000 ALTER TABLE `shopping_master` DISABLE KEYS */;
INSERT INTO `shopping_master` VALUES ('20220220174922','2022-02-20 17:49:22',850.00,'Please leave the staff at my neihbourhood,as I am won\'t be present when you come, Please leave the staff at my neihbourhood,as I am won\'t be present when you come','01002406007','address111111111111111, address111111111111111, address111111111111111','P',NULL,'p2@yopmail.com','admin','two','address222222222222222',NULL,'CD','S0003','EG','C00001',NULL),('20220301182925','2022-03-01 18:29:25',700.00,'Please leave the staff at my neihbourhood, as I am won\'t be present when you come','01002406007','AAA','P',NULL,'p2@yopmail.com','admin','two','AAA',NULL,'CD','S0001','EG','C00002',NULL),('20220309165432','2022-03-09 16:54:32',850.00,NULL,'0000','bbb','P',NULL,'user2@yopmail.com','User','Two','aaaa',NULL,'CD','S0003','EG','C00001','C00003'),('20220313170324','2022-03-13 17:03:24',700.00,NULL,'01001312348',',,,,,,','R',NULL,'user2@yopmail.com','User','Two',',,,,,,,',NULL,'CD','S0003','EG','C00001','C00003'),('20220519113922','2022-05-19 11:39:22',298.00,NULL,NULL,NULL,'O',NULL,'p1@yopmail.com','Admin','set by user himself',NULL,NULL,'CD',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `shopping_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shops` (
  `SHOP_CODE` varchar(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_CODE created from UML attribute "shop code" in UML class "shop"',
  `SHOP_NAME` varchar(1000) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_NAME created from UML attribute "shop name" in UML class "shop"',
  `SHOP_LAT` double(20,15) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_LAT created from UML attribute "shop lat" in UML class "shop"',
  `SHOP_LONG` double(20,15) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_LONG created from UML attribute "shop long" in UML class "shop"',
  `STREET_ADD1` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column STREET_ADD1 created from UML attribute "street add1" in UML class "shop"',
  `STREET_ADD2` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column STREET_ADD2 created from UML attribute "street add2" in UML class "shop"',
  `STREET_ADD3` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column STREET_ADD3 created from UML attribute "street add3" in UML class "shop"',
  `PROVINCE` varchar(150) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column PROVINCE created from UML attribute "province" in UML class "shop"',
  `COUNTRY` varchar(150) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column COUNTRY created from UML attribute "country" in UML class "shop"',
  `TEL` varchar(50) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column TEL created from UML attribute "tel" in UML class "shop"',
  `WEB_ADDRESS` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column WEB_ADDRESS created from UML attribute "web address" in UML class "shop"',
  `LOGO` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column LOGO created from UML attribute "logo" in UML class "shop"',
  `CITY` varchar(50) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column CITY created from UML attribute "city" in UML class "shop"',
  `ONE_TIME_CODE` varchar(200) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column GEN_CODE created from UML attribute "gen code" in UML class "shop"',
  `SHOP_FILE_PATH` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_FILE_PATH created from UML attribute "shop file path" in UML class "shop"',
  `SMTP_HOST` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SMTP_HOST created from UML attribute "smtp host" in UML class "shop"',
  `SMTP_PORT` int(4) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SMTP_PORT created from UML attribute "smtp port" in UML class "shop"',
  `SSL_OR_TSL` varchar(1) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SSL_OR_TSL created from UML attribute "ssl or tsl" in UML class "shop"',
  `SHOP_USER_NAME` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_USER_NAME created from UML attribute "shop user name" in UML class "shop"',
  `SHOP_ADMIN_EMAIL` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_ADMIN_EMAIL created from UML attribute "shop admin email" in UML class "shop"',
  `ACTIVE` varchar(1) DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column ACTIVE created from UML attribute "active" in UML class "shop"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shop"',
  `RATE` int(5) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column RATE created from UML attribute "rate" in UML class "shop"',
  `LEVEL` int(1) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column LEVEL created from UML attribute "level" in UML class "shop"',
  `CNTRY_CODE2` varchar(2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column COUNTRY_SHOP created as default foreign key column for foreign key "COUNTRY_SHOP"',
  `PARENT_SHOP_CODE` varchar(9) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_BRANCH created as default foreign key column for foreign key "SHOP_BRANCH"',
  `REGISTER_STATUS` varchar(1) DEFAULT NULL,
  `DOMAIN_NAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`SHOP_CODE`),
  KEY `COUNTRY_SHOP` (`CNTRY_CODE2`),
  KEY `SHOP_BRANCH` (`PARENT_SHOP_CODE`),
  KEY `SHOPS_INDEX` (`SHOP_CODE`),
  CONSTRAINT `COUNTRY_SHOP` FOREIGN KEY (`CNTRY_CODE2`) REFERENCES `countries` (`CNTRY_CODE2`),
  CONSTRAINT `SHOP_BRANCH` FOREIGN KEY (`PARENT_SHOP_CODE`) REFERENCES `shops` (`SHOP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SHOPS created from UML class "shop"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint COUNTRY_SHOP created for UML association "country shop"\r\nUML to Offline Database Transform: Foreign key constraint SHOP_BRANCH created for UML association "shop branch"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES ('EG0000001','Head Quarter',NULL,NULL,'Doki','Giza','8th St. Mohy eldin Abo elezz,',NULL,'Egypt','0000000, 0000000, 0000001\n','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/shopData/rightImage.jpeg','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/shopData/logo.png','Giza',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N','2019-08-05 22:46:54',5,0,'EG',NULL,NULL,'www.shopbook.com'),('EG0000002','Alexandria Branch',NULL,NULL,'Danial St.','Building 25','Victoria Square,',NULL,'Egypt','03-55147845, 03-55132145',NULL,NULL,'Alexandria',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y','2021-11-23 13:43:55',NULL,NULL,NULL,'EG0000001',NULL,NULL),('EG0000003','Mohandsein Branch',NULL,NULL,'25 Gameat Eldowal St.,','above Farghali ',NULL,NULL,'Egypt','11111111,11111111, 11111111\n',NULL,'','Moahandseen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y','2019-09-01 00:00:00',NULL,NULL,NULL,'EG0000001',NULL,NULL),('EG0000004','Heliopolis Branch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2222222, 2222222, 2222222',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y','2019-09-18 10:49:21',NULL,NULL,NULL,'EG0000001',NULL,NULL);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shp_bag_status`
--

DROP TABLE IF EXISTS `shp_bag_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shp_bag_status` (
  `id` varchar(2) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shp_bag_status`
--

LOCK TABLES `shp_bag_status` WRITE;
/*!40000 ALTER TABLE `shp_bag_status` DISABLE KEYS */;
INSERT INTO `shp_bag_status` VALUES ('C','Collected'),('D','Delivered'),('O','Opened'),('P','Packed'),('R','Received'),('S','Shipped');
/*!40000 ALTER TABLE `shp_bag_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siz_class_det_prm_vals`
--

DROP TABLE IF EXISTS `siz_class_det_prm_vals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siz_class_det_prm_vals` (
  `SZ_DET_PRM_VAL_CODE` varchar(11) NOT NULL COMMENT 'UML to Offline Database Transform: Column SZ_DET_PRM_VAL_CODE created from UML attribute "sz det prm val code" in UML class "siz class det prm val"',
  `SZ_DET_PRM_CODE` varchar(6) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column DET_PARAM_VAL created as default foreign key column for foreign key "DET_PARAM_VAL"',
  `SZ_DET_CODE` varchar(6) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SZ_CLASS_DET_PRM_VAL created as default foreign key column for foreign key "SZ_CLASS_DET_PRM_VAL"',
  `PRM_VAL` varchar(50) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column PRM_VAL created from UML attribute "prm val" in UML class "siz class det prm val"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "siz class det prm val"',
  PRIMARY KEY (`SZ_DET_PRM_VAL_CODE`),
  KEY `DET_PARAM_VAL` (`SZ_DET_PRM_CODE`),
  KEY `SZ_CLASS_DET_PRM_VAL` (`SZ_DET_CODE`),
  KEY `SIZ_CLASS_DET_PRM_VALS_INDEX` (`SZ_DET_PRM_VAL_CODE`),
  CONSTRAINT `DET_PARAM_VAL` FOREIGN KEY (`SZ_DET_PRM_CODE`) REFERENCES `size_class_det_params` (`SZ_DET_PRM_CODE`),
  CONSTRAINT `SZ_CLASS_DET_PRM_VAL` FOREIGN KEY (`SZ_DET_CODE`) REFERENCES `size_class_dets` (`SZ_DET_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SIZ_CLASS_DET_PRM_VALS created from UML class "siz class det prm val"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint DET_PARAM_VAL created for UML association "det param val"\r\nUML to Offline Database Transform: Foreign key constraint SZ_CLASS_DET_PRM_VAL created for UML association "sz class det prm val"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siz_class_det_prm_vals`
--

LOCK TABLES `siz_class_det_prm_vals` WRITE;
/*!40000 ALTER TABLE `siz_class_det_prm_vals` DISABLE KEYS */;
/*!40000 ALTER TABLE `siz_class_det_prm_vals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size_class_det_params`
--

DROP TABLE IF EXISTS `size_class_det_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `size_class_det_params` (
  `SZ_DET_PRM_CODE` varchar(6) NOT NULL COMMENT 'UML to Offline Database Transform: Column SZ_DET_PRM_CODE created from UML attribute "sz det prm code" in UML class "size class det param"',
  `SZ_DET_PRM_NAME` varchar(200) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SZ_DET_PRM_NAME created from UML attribute "sz det prm name" in UML class "size class det param"',
  `SZ_CLASS_CODE` varchar(3) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SIZE_CLASS_PARAM created as default foreign key column for foreign key "SIZE_CLASS_PARAM"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "size class det param"',
  PRIMARY KEY (`SZ_DET_PRM_CODE`),
  KEY `SIZE_CLASS_PARAM` (`SZ_CLASS_CODE`),
  KEY `SIZE_CLASS_DET_PARAMS_INDEX` (`SZ_DET_PRM_CODE`),
  CONSTRAINT `SIZE_CLASS_PARAM` FOREIGN KEY (`SZ_CLASS_CODE`) REFERENCES `size_classes` (`SZ_CLASS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SIZE_CLASS_DET_PARAMS created from UML class "size class det param"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SIZE_CLASS_PARAM created for UML association "size class param"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size_class_det_params`
--

LOCK TABLES `size_class_det_params` WRITE;
/*!40000 ALTER TABLE `size_class_det_params` DISABLE KEYS */;
/*!40000 ALTER TABLE `size_class_det_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size_class_dets`
--

DROP TABLE IF EXISTS `size_class_dets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `size_class_dets` (
  `SZ_DET_CODE` varchar(6) NOT NULL DEFAULT '0' COMMENT 'UML to Offline Database Transform: Column SZ_DET_CODE created from UML attribute "sz det code" in UML class "size class det"',
  `SZ_DET_NAME` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SZ_DET_NAME created from UML attribute "sz det name" in UML class "size class det"',
  `SZ_CLASS_CODE` varchar(3) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SIZE_TO_SIZE_DET created as default foreign key column for foreign key "SIZE_TO_SIZE_DET"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "size class det"',
  PRIMARY KEY (`SZ_DET_CODE`),
  KEY `SIZE_TO_SIZE_DET` (`SZ_CLASS_CODE`),
  KEY `SIZE_CLASS_DETS_INDEX` (`SZ_DET_CODE`),
  CONSTRAINT `SIZE_TO_SIZE_DET` FOREIGN KEY (`SZ_CLASS_CODE`) REFERENCES `size_classes` (`SZ_CLASS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SIZE_CLASS_DETS created from UML class "size class det"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SIZE_TO_SIZE_DET created for UML association "size to size det"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size_class_dets`
--

LOCK TABLES `size_class_dets` WRITE;
/*!40000 ALTER TABLE `size_class_dets` DISABLE KEYS */;
INSERT INTO `size_class_dets` VALUES ('Z01D00','Reserved','Z01','n/a'),('Z01D01','S','Z01',NULL),('Z01D02','XS','Z01',NULL),('Z01D03','XXL','Z01',NULL),('Z01D04','M','Z01',NULL),('Z01D05','XXXL','Z01',NULL),('Z01D06','4XL','Z01',NULL),('Z02D00','Reserved','Z02','n/a'),('Z02D01','7 1/2 (40)','Z02',NULL),('Z02D02','8 (41)','Z02',NULL),('Z02D03','9 (42)','Z02',NULL),('Z02D04','8 1/2 (41.5)','Z02',NULL),('Z03D00','Reserved','Z03','n/a'),('Z03D01','One Size','Z03',NULL);
/*!40000 ALTER TABLE `size_class_dets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size_classes`
--

DROP TABLE IF EXISTS `size_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `size_classes` (
  `SZ_CLASS_CODE` varchar(3) NOT NULL COMMENT 'UML to Offline Database Transform: Column SZ_CLASS_CODE created from UML attribute "sz class code" in UML class "size class"',
  `SZ_CLASS_NAME` varchar(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column SZ_CLASS_NAME created from UML attribute "sz class name" in UML class "size class"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "size class"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SZ_CLASS_CODE`),
  KEY `SIZE_CLASSES_INDEX` (`SZ_CLASS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SIZE_CLASSES created from UML class "size class"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size_classes`
--

LOCK TABLES `size_classes` WRITE;
/*!40000 ALTER TABLE `size_classes` DISABLE KEYS */;
INSERT INTO `size_classes` VALUES ('Z00','Reserved','n/a',NULL),('Z01','fashion',NULL,'2019-08-17 10:58:12'),('Z02','shoeses',NULL,'2019-08-17 10:59:14'),('Z03','One Size',NULL,'2019-10-05 17:29:00');
/*!40000 ALTER TABLE `size_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sku_assemblies`
--

DROP TABLE IF EXISTS `sku_assemblies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sku_assemblies` (
  `SKU_ASS_COMP_CODE` varchar(47) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_ASS_COMP_CODE created from UML attribute "sku ass comp code" in UML class "sku assembly"',
  `SKU_SEQ` int(3) DEFAULT '0' COMMENT 'UML to Offline Database Transform: Column SKU_SEQ created from UML attribute "sku seq" in UML class "sku assembly"',
  `AVAILABLE` varchar(1) DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "sku assembly"',
  `HIDE` varchar(1) DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column HIDE created from UML attribute "hide" in UML class "sku assembly"',
  `SKU_ASS_CODE` varchar(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column MAIN_SKU_TO_ASSEMBLY created as default foreign key column for foreign key "MAIN_SKU_TO_ASSEMBLY"',
  `SKU_ASS_COMP` varchar(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_ASS_COMP created as default foreign key column for foreign key "SKU_TO_ASS_COMP"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sku assembly"',
  `NOTES` varchar(500) DEFAULT NULL,
  `QTY_IN_ASS` int(3) DEFAULT '1',
  `IS_CREATED` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SKU_ASS_COMP_CODE`),
  KEY `MAIN_SKU_TO_ASSEMBLY` (`SKU_ASS_CODE`),
  KEY `SKU_TO_ASS_COMP` (`SKU_ASS_COMP`),
  CONSTRAINT `MAIN_SKU_TO_ASSEMBLY` FOREIGN KEY (`SKU_ASS_CODE`) REFERENCES `skus` (`SKU_CODE`),
  CONSTRAINT `SKU_TO_ASS_COMP` FOREIGN KEY (`SKU_ASS_COMP`) REFERENCES `skus` (`SKU_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SKU_ASSEMBLIES created from UML class "sku assembly"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint MAIN_SKU_TO_ASSEMBLY created for UML association "main sku to assembly"\r\nUML to Offline Database Transform: Foreign key constraint SKU_TO_ASS_COMP created for UML association "sku to ass comp"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku_assemblies`
--

LOCK TABLES `sku_assemblies` WRITE;
/*!40000 ALTER TABLE `sku_assemblies` DISABLE KEYS */;
INSERT INTO `sku_assemblies` VALUES ('EG0000001G00020002S0003EG0000001G00020002S0001',0,'Y','N','EG0000001G00020002S0003','EG0000001G00020002S0001','2022-09-24 18:07:40',NULL,1,'Y'),('EG0000001G00020002S0003EG0000001G00020002S0002',0,'Y','N','EG0000001G00020002S0003','EG0000001G00020002S0002','2022-09-24 18:08:03',NULL,1,'Y'),('EG0000001G00020002S0003EG0000001G00020002S0003',0,'Y','N','EG0000001G00020002S0003','EG0000001G00020002S0003','2022-09-24 18:05:43',NULL,1,NULL);
/*!40000 ALTER TABLE `sku_assemblies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sku_clr_images`
--

DROP TABLE IF EXISTS `sku_clr_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sku_clr_images` (
  `SKU_CLR_IMG_CODE` varchar(35) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_SZ_CLR_IMG_CODE created from UML attribute "sku sz clr img code" in UML class "sku sz clr image"',
  `SKU_CLR_CODE` varchar(28) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_SZ_CLR_TO_SKU_SZ_CLR_IMG created as default foreign key column for foreign key "SKU_SZ_CLR_TO_SKU_SZ_CLR_IMG"',
  `IMG_CODE` varchar(7) NOT NULL COMMENT 'UML to Offline Database Transform: Column IMG CODE created from UML attribute "notes" in UML class "sku clr image"',
  `IMG_PATH` varchar(100) DEFAULT NULL,
  `IMG_SEQ` varchar(1) DEFAULT NULL,
  `IMG_NAME` varchar(50) DEFAULT NULL,
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "sku clr image"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP,
  `IMG_TYPE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SKU_CLR_IMG_CODE`),
  KEY `SKU_CLR_TO_SKU_CLR_IMG_idx` (`SKU_CLR_CODE`),
  KEY `SKU_CLR_IMAGES_INDEX` (`SKU_CLR_IMG_CODE`),
  CONSTRAINT `SKU_CLR_TO_SKU_CLR_IMG` FOREIGN KEY (`SKU_CLR_CODE`) REFERENCES `sku_colors` (`SKU_CLR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SKU_SZ_CLR_IMAGES created from UML class "sku sz clr image"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SKU_IMGS_TO_SZ_CLR_IMGS created for UML association "sku imgs to sz clr imgs"\r\nUML to Offline Database Transform: Foreign key constraint SKU_SZ_CLR_TO_SKU_SZ_CLR_IMG created for UML association "sku sz clr to sku sz clr img"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku_clr_images`
--

LOCK TABLES `sku_clr_images` WRITE;
/*!40000 ALTER TABLE `sku_clr_images` DISABLE KEYS */;
INSERT INTO `sku_clr_images` VALUES ('EG0000001G00010001S0001CLR00I001347','EG0000001G00010001S0001CLR00','I001347','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00010001S0001CLR00/','1','No specific name',NULL,'2022-01-02 00:13:47','.png'),('EG0000001G00010001S0001CLR00I001356','EG0000001G00010001S0001CLR00','I001356','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00010001S0001CLR00/','2','No specific name',NULL,'2022-01-02 00:13:56','.jpeg'),('EG0000001G00010001S0001CLR00I082318','EG0000001G00010001S0001CLR00','I082318','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00010001S0001CLR00/','3','No specific name',NULL,'2021-12-20 08:23:18','.jpeg'),('EG0000001G00010001S0001CLR00I082331','EG0000001G00010001S0001CLR00','I082331','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00010001S0001CLR00/','4','No specific name',NULL,'2021-12-20 08:23:31','.jpeg'),('EG0000001G00010001S0001CLR00I082340','EG0000001G00010001S0001CLR00','I082340','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00010001S0001CLR00/','5','No specific name',NULL,'2021-12-20 08:23:40','.jpeg'),('EG0000001G00010001S0001CLR00I082345','EG0000001G00010001S0001CLR00','I082345','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00010001S0001CLR00/','6','No specific name',NULL,'2021-12-20 08:23:45','.jpeg'),('EG0000001G00010001S0001CLR01I221534','EG0000001G00010001S0001CLR01','I221534','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00010001S0001CLR01/','1','No specific name',NULL,'2022-01-23 22:15:34','.jpeg'),('EG0000001G00010001S0001CLR02I163244','EG0000001G00010001S0001CLR02','I163244','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00010001S0001CLR02/',NULL,'No specific name',NULL,'2022-03-16 16:32:44','.gif'),('EG0000001G00010001S0001CLR04I111432','EG0000001G00010001S0001CLR04','I111432','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00010001S0001CLR04/',NULL,'No specific name',NULL,'2022-03-17 11:14:32','.png'),('EG0000001G00010001S0001CLR05I002023','EG0000001G00010001S0001CLR05','I002023','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00010001S0001CLR05/',NULL,'No specific name',NULL,'2022-08-27 23:20:23','.jpeg'),('EG0000001G00020002S0001CLR00I002240','EG0000001G00020002S0001CLR00','I002240','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00020002S0001CLR00/',NULL,'No specific name',NULL,'2022-08-27 23:22:40','.png'),('EG0000001G00020002S0002CLR00I092210','EG0000001G00020002S0002CLR00','I092210','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00020002S0002CLR00/',NULL,'No specific name',NULL,'2022-03-17 09:22:10','.png'),('EG0000001G00020002S0002CLR01I092544','EG0000001G00020002S0002CLR01','I092544','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00020002S0002CLR01/',NULL,'No specific name',NULL,'2022-03-17 09:25:44','.png'),('EG0000001G00020002S0002CLR02I112351','EG0000001G00020002S0002CLR02','I112351','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00020002S0002CLR02/',NULL,'No specific name',NULL,'2022-03-17 11:23:51','.png'),('EG0000001G00020002S0003CLR00I190522','EG0000001G00020002S0003CLR00','I190522','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00020002S0003CLR00/',NULL,'No specific name',NULL,'2022-09-24 18:05:22','.jpeg'),('EG0000001G00060006S0001CLR00I173824','EG0000001G00060006S0001CLR00','I173824','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/SKUs/EG0000001G00060006S0001CLR00/',NULL,'No specific name',NULL,'2022-08-29 16:38:24','.jpeg');
/*!40000 ALTER TABLE `sku_clr_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sku_colors`
--

DROP TABLE IF EXISTS `sku_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sku_colors` (
  `SKU_CLR_CODE` varchar(28) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_CLR_CODE created from UML attribute "sku clr code" in UML class "sku color"',
  `CLR_CODE` varchar(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column CLR_CODE created from UML attribute "clr code" in UML class "sku color"',
  `SKU_CODE` varchar(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_COLORS created as default foreign key column for foreign key "SKU_TO_COLORS"',
  `AVAILABLE` varchar(1) DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "sku color"',
  `RATE` int(5) DEFAULT '0' COMMENT 'UML to Offline Database Transform: Column RATE created from UML attribute "rate" in UML class "sku color"',
  `QNTY_IN_STOCK` int(4) DEFAULT '0' COMMENT 'UML to Offline Database Transform: Column QNTY_IN_STOCK created from UML attribute "qnty in stock" in UML class "sku color"',
  `LAST_PRICE` decimal(9,2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column LAST_PRICE created from UML attribute "last price" in UML class "sku color"',
  `OLP_PRICE` decimal(9,2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column OLP_PRICE created from UML attribute "olp price" in UML class "sku color"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "sku color"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sku color"',
  `CLR_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SKU_CLR_CODE`),
  KEY `SKU_TO_COLORS` (`SKU_CODE`),
  KEY `SKU_COLORS_INDEX` (`SKU_CLR_CODE`),
  CONSTRAINT `SKU_TO_COLORS` FOREIGN KEY (`SKU_CODE`) REFERENCES `skus` (`SKU_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SKU_COLORS created from UML class "sku color"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SKU_TO_COLORS created for UML association "sku to colors"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku_colors`
--

LOCK TABLES `sku_colors` WRITE;
/*!40000 ALTER TABLE `sku_colors` DISABLE KEYS */;
INSERT INTO `sku_colors` VALUES ('EG0000001G00010001S0000CLR00','CLR00','EG0000001G00010001S0000','N',0,0,0.00,1.00,NULL,'2021-12-20 07:59:01','RESERVED'),('EG0000001G00010001S0001CLR00','CLR00','EG0000001G00010001S0001','Y',0,10,175.00,175.00,NULL,'2021-12-20 08:20:04','Default Color'),('EG0000001G00010001S0001CLR01','CLR01','EG0000001G00010001S0001','Y',0,20,168.00,175.00,NULL,'2021-12-20 08:52:28','Black'),('EG0000001G00010001S0001CLR02','CLR02','EG0000001G00010001S0001','Y',0,15,12.00,5.00,NULL,'2021-12-20 08:54:46','White Painted'),('EG0000001G00010001S0001CLR04','CLR04','EG0000001G00010001S0001','Y',0,20,148.00,165.00,NULL,'2022-03-17 11:14:23','Navy'),('EG0000001G00010001S0001CLR05','CLR05','EG0000001G00010001S0001','Y',0,20,148.00,165.00,NULL,'2022-03-17 11:15:16','Orange'),('EG0000001G00020002S0000CLR00','CLR00','EG0000001G00020002S0000','N',0,0,0.00,1.00,'','2021-12-20 07:59:43','RESERVED'),('EG0000001G00020002S0001CLR00','CLR00','EG0000001G00020002S0001','Y',0,0,198.00,225.00,NULL,'2021-12-20 09:15:07','Default Color'),('EG0000001G00020002S0002CLR00','CLR00','EG0000001G00020002S0002','Y',0,0,135.00,150.00,NULL,'2022-03-17 09:16:07','Default Color'),('EG0000001G00020002S0002CLR01','CLR01','EG0000001G00020002S0002','Y',0,0,150.00,150.00,NULL,'2022-03-17 09:25:31','Red'),('EG0000001G00020002S0002CLR02','CLR02','EG0000001G00020002S0002','Y',0,0,150.00,150.00,NULL,'2022-03-17 11:23:42','Cashy'),('EG0000001G00020002S0003CLR00','CLR00','EG0000001G00020002S0003','Y',0,10,500.00,500.00,NULL,'2022-09-24 18:02:22','Blue'),('EG0000001G00030003S0000CLR00','CLR00','EG0000001G00030003S0000','N',0,0,0.00,1.00,NULL,'2021-12-20 08:00:16','RESERVED'),('EG0000001G00040004S0000CLR00','CLR00','EG0000001G00040004S0000','N',0,0,0.00,1.00,NULL,'2022-08-22 16:57:33','RESERVED'),('EG0000001G00050005S0000CLR00','CLR00','EG0000001G00050005S0000','N',0,0,0.00,1.00,NULL,'2022-08-25 01:37:22','RESERVED'),('EG0000001G00060006S0000CLR00','CLR00','EG0000001G00060006S0000','N',0,0,0.00,1.00,NULL,'2022-08-25 01:37:47','RESERVED'),('EG0000001G00060006S0001CLR00','CLR00','EG0000001G00060006S0001','N',0,0,0.00,1.00,NULL,'2022-08-29 16:35:30','Default Color'),('EG0000001G00070007S0000CLR00','CLR00','EG0000001G00070007S0000','N',0,0,0.00,1.00,NULL,'2022-08-25 01:39:04','RESERVED'),('EG0000001G00080008S0000CLR00','CLR00','EG0000001G00080008S0000','N',0,0,0.00,1.00,NULL,'2022-08-25 01:39:45','RESERVED'),('EG0000001G00090009S0000CLR00','CLR00','EG0000001G00090009S0000','N',0,0,0.00,1.00,NULL,'2022-08-25 01:40:29','RESERVED'),('EG0000001G00100010S0000CLR00','CLR00','EG0000001G00100010S0000','N',0,0,0.00,1.00,NULL,'2022-08-25 01:44:29','RESERVED'),('EG0000001G00110011S0000CLR00','CLR00','EG0000001G00110011S0000','N',0,0,0.00,1.00,NULL,'2022-08-25 01:44:45','RESERVED'),('EG0000001G00120012S0000CLR00','CLR00','EG0000001G00120012S0000','N',0,0,0.00,1.00,NULL,'2022-08-25 01:45:14','RESERVED');
/*!40000 ALTER TABLE `sku_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sku_prop_dets`
--

DROP TABLE IF EXISTS `sku_prop_dets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sku_prop_dets` (
  `SKU_PROP_DET_CODE` varchar(30) NOT NULL COMMENT 'Equals to SKU_CODE concatenate SUBSTR(SHP_SUBCAT_PRP_CLS_DET_CODE,-3). increment by 1.',
  `SKU_PROP_DET_NAME` varchar(4000) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SKU_PROP_DET_NAME created from UML attribute "sku prop det name" in UML class "sku prop det"',
  `SHP_SUBCAT_PRP_CLS_DET_CODE` varchar(25) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column PROP_DET_TO_ITEM_DET created as default foreign key column for foreign key "PROP_DET_TO_ITEM_DET"',
  `SKU_CODE` varchar(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_SKU_PROP created as default foreign key column for foreign key "SKU_TO_SKU_PROP"',
  `HIDE` varchar(1) DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column HIDE created from UML attribute "hide" in UML class "sku prop det"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "sku prop det"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sku prop det"',
  PRIMARY KEY (`SKU_PROP_DET_CODE`),
  KEY `SKU_TO_SKU_PROP` (`SKU_CODE`),
  KEY `SKU_PROP_DETS_INDEX` (`SKU_PROP_DET_CODE`),
  CONSTRAINT `SKU_TO_SKU_PROP` FOREIGN KEY (`SKU_CODE`) REFERENCES `skus` (`SKU_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SKU_PROP_DETS created from UML class "sku prop det"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint PROP_DET_TO_ITEM_DET created for UML association "prop det to item det"\r\nUML to Offline Database Transform: Foreign key constraint SKU_TO_SKU_PROP created for UML association "sku to sku prop"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku_prop_dets`
--

LOCK TABLES `sku_prop_dets` WRITE;
/*!40000 ALTER TABLE `sku_prop_dets` DISABLE KEYS */;
INSERT INTO `sku_prop_dets` VALUES ('EG0000001G00010001S0000PD00000','Reserved Property',NULL,'EG0000001G00010001S0000','N',NULL,'2021-12-20 07:59:01'),('EG0000001G00010001S0001PD00000','Reserved Property',NULL,'EG0000001G00010001S0001','N',NULL,'2021-12-20 08:20:04'),('EG0000001G00010001S0001PD00001','Zan Wood','EG0000001G00010001P001D01','EG0000001G00010001S0001','N',NULL,'2021-12-20 08:20:04'),('EG0000001G00010001S0001PD00002','Water Proof ','EG0000001G00010001P001D02','EG0000001G00010001S0001','N',NULL,'2021-12-20 08:20:04'),('EG0000001G00010001S0001PD00003','Sheilded and isolated','EG0000001G00010001P001D03','EG0000001G00010001S0001','N',NULL,'2021-12-20 08:20:04'),('EG0000001G00020002S0000PD00000','Reserved Property',NULL,'EG0000001G00020002S0000','N',NULL,'2021-12-20 07:59:43'),('EG0000001G00020002S0001PD00000','Reserved Property',NULL,'EG0000001G00020002S0001','N',NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0001PD00001','* - Cotton 100%','EG0000001G00020002P001D01','EG0000001G00020002S0001','N',NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0001PD00002','*- Poliyster 35%','EG0000001G00020002P001D02','EG0000001G00020002S0001','N',NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0001PD00003','*- Can be washed in Automatic machines','EG0000001G00020002P001D03','EG0000001G00020002S0001','N',NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0002PD00000','Reserved Property',NULL,'EG0000001G00020002S0002','N',NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0002PD00001','* - Cotton 100%','EG0000001G00020002P001D01','EG0000001G00020002S0002','N',NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0002PD00002','*- Poliyster 35%','EG0000001G00020002P001D02','EG0000001G00020002S0002','N',NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0002PD00003','*- Can be washed in Automatic machines','EG0000001G00020002P001D03','EG0000001G00020002S0002','N',NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0003PD00000','Reserved Property',NULL,'EG0000001G00020002S0003','N',NULL,'2022-09-24 18:02:22'),('EG0000001G00020002S0003PD00001','* - Cotton 100%','EG0000001G00020002P001D01','EG0000001G00020002S0003','N',NULL,'2022-09-24 18:02:22'),('EG0000001G00020002S0003PD00002','*- Poliyster 35%','EG0000001G00020002P001D02','EG0000001G00020002S0003','N',NULL,'2022-09-24 18:02:22'),('EG0000001G00020002S0003PD00003','*- Can be washed in Automatic machines','EG0000001G00020002P001D03','EG0000001G00020002S0003','N',NULL,'2022-09-24 18:02:22'),('EG0000001G00030003S0000PD00000','Reserved Property',NULL,'EG0000001G00030003S0000','N',NULL,'2021-12-20 08:00:16'),('EG0000001G00040004S0000PD00000','Reserved Property',NULL,'EG0000001G00040004S0000','N',NULL,'2022-08-22 16:57:33'),('EG0000001G00050005S0000PD00000','Reserved Property',NULL,'EG0000001G00050005S0000','N',NULL,'2022-08-25 01:37:22'),('EG0000001G00060006S0000PD00000','Reserved Property',NULL,'EG0000001G00060006S0000','N',NULL,'2022-08-25 01:37:47'),('EG0000001G00060006S0001PD00000','Reserved Property',NULL,'EG0000001G00060006S0001','N',NULL,'2022-08-29 16:35:30'),('EG0000001G00060006S0001PD00001','The skirt is 90% polyester, 10% viscous. ','EG0000001G00060006P001D01','EG0000001G00060006S0001','N',NULL,'2022-08-29 16:35:30'),('EG0000001G00070007S0000PD00000','Reserved Property',NULL,'EG0000001G00070007S0000','N',NULL,'2022-08-25 01:39:04'),('EG0000001G00080008S0000PD00000','Reserved Property',NULL,'EG0000001G00080008S0000','N',NULL,'2022-08-25 01:39:45'),('EG0000001G00090009S0000PD00000','Reserved Property',NULL,'EG0000001G00090009S0000','N',NULL,'2022-08-25 01:40:29'),('EG0000001G00100010S0000PD00000','Reserved Property',NULL,'EG0000001G00100010S0000','N',NULL,'2022-08-25 01:44:29'),('EG0000001G00110011S0000PD00000','Reserved Property',NULL,'EG0000001G00110011S0000','N',NULL,'2022-08-25 01:44:45'),('EG0000001G00120012S0000PD00000','Reserved Property',NULL,'EG0000001G00120012S0000','N',NULL,'2022-08-25 01:45:14');
/*!40000 ALTER TABLE `sku_prop_dets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sku_size_colors`
--

DROP TABLE IF EXISTS `sku_size_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sku_size_colors` (
  `SKU_SZ_CLR_CODE` varchar(37) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_SZ_CLR_CODE created from UML attribute "sku sz clr code" in UML class "sku size color"',
  `SKU_SIZE_CODE` varchar(29) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_SZ_TO_SKU_SZ_CLR created as default foreign key column for foreign key "SKU_SZ_TO_SKU_SZ_CLR"',
  `SKU_CLR_CODE` varchar(28) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_CLR_TO_SKU_SZ_CLR created as default foreign key column for foreign key "SKU_CLR_TO_SKU_SZ_CLR"',
  `AVAILABLE` varchar(1) DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "sku size color"',
  `RATE` int(5) DEFAULT '0' COMMENT 'UML to Offline Database Transform: Column RATE created from UML attribute "rate" in UML class "sku size color"',
  `QNTY_IN_STOCK` int(4) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column QNTY_IN_STOCK created from UML attribute "qnty in stock" in UML class "sku size color"',
  `LAST_PRICE` decimal(9,2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column LAST_PRICE created from UML attribute "last price" in UML class "sku size color"',
  `OLD_PRICE` decimal(9,2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column OLD_PRICE created from UML attribute "old price" in UML class "sku size color"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "sku size color"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sku size color"',
  PRIMARY KEY (`SKU_SZ_CLR_CODE`),
  KEY `SKU_SZ_TO_SKU_SZ_CLR` (`SKU_SIZE_CODE`),
  KEY `SKU_SIZE_COLORS_INDEX` (`SKU_SZ_CLR_CODE`),
  KEY `SKU_CLR_TO_SKU_SZ_CLR_idx` (`SKU_CLR_CODE`),
  CONSTRAINT `SKU_CLR_TO_SKU_SZ_CLR` FOREIGN KEY (`SKU_CLR_CODE`) REFERENCES `sku_colors` (`SKU_CLR_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SKU_SZ_TO_SKU_SZ_CLR` FOREIGN KEY (`SKU_SIZE_CODE`) REFERENCES `sku_sizes` (`SKU_SIZE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SKU_SIZE_COLORS created from UML class "sku size color"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SKU_CLR_TO_SKU_SZ_CLR created for UML association "sku clr to sku sz clr"\r\nUML to Offline Database Transform: Foreign key constraint SKU_SZ_TO_SKU_SZ_CLR created for UML association "sku sz to sku sz clr"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku_size_colors`
--

LOCK TABLES `sku_size_colors` WRITE;
/*!40000 ALTER TABLE `sku_size_colors` DISABLE KEYS */;
INSERT INTO `sku_size_colors` VALUES ('EG0000001G00010001S0001Z03D01CLR00','EG0000001G00010001S0001Z03D01','EG0000001G00010001S0001CLR00','Y',0,0,175.00,175.00,NULL,'2021-12-20 08:20:04'),('EG0000001G00010001S0001Z03D01CLR01','EG0000001G00010001S0001Z03D01','EG0000001G00010001S0001CLR01','Y',0,20,175.00,175.00,NULL,'2021-12-20 08:52:28'),('EG0000001G00010001S0001Z03D01CLR02','EG0000001G00010001S0001Z03D01','EG0000001G00010001S0001CLR02','Y',0,15,160.00,162.00,NULL,'2021-12-20 08:54:46'),('EG0000001G00010001S0001Z03D01CLR04','EG0000001G00010001S0001Z03D01','EG0000001G00010001S0001CLR04','Y',0,20,148.00,165.00,NULL,'2022-03-17 11:14:23'),('EG0000001G00010001S0001Z03D01CLR05','EG0000001G00010001S0001Z03D01','EG0000001G00010001S0001CLR05','Y',0,20,148.00,165.00,NULL,'2022-03-17 11:15:16'),('EG0000001G00020002S0001Z01D01CLR00','EG0000001G00020002S0001Z01D01','EG0000001G00020002S0001CLR00','Y',0,0,225.00,225.00,NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0001Z01D02CLR00','EG0000001G00020002S0001Z01D02','EG0000001G00020002S0001CLR00','Y',0,0,225.00,225.00,NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0001Z01D03CLR00','EG0000001G00020002S0001Z01D03','EG0000001G00020002S0001CLR00','Y',0,0,66.00,5.00,NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0001Z01D04CLR00','EG0000001G00020002S0001Z01D04','EG0000001G00020002S0001CLR00','Y',0,0,240.30,225.00,NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0001Z01D05CLR00','EG0000001G00020002S0001Z01D05','EG0000001G00020002S0001CLR00','Y',0,0,178.20,202.50,NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0001Z01D06CLR00','EG0000001G00020002S0001Z01D06','EG0000001G00020002S0001CLR00','Y',0,0,225.00,225.00,NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0002Z01D01CLR00','EG0000001G00020002S0002Z01D01','EG0000001G00020002S0002CLR00','Y',0,0,150.00,150.00,NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0002Z01D01CLR01','EG0000001G00020002S0002Z01D01','EG0000001G00020002S0002CLR01','Y',0,0,150.00,150.00,NULL,'2022-03-17 09:25:31'),('EG0000001G00020002S0002Z01D01CLR02','EG0000001G00020002S0002Z01D01','EG0000001G00020002S0002CLR02','Y',0,0,150.00,150.00,NULL,'2022-03-17 11:23:42'),('EG0000001G00020002S0002Z01D02CLR00','EG0000001G00020002S0002Z01D02','EG0000001G00020002S0002CLR00','Y',0,0,150.00,150.00,NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0002Z01D02CLR01','EG0000001G00020002S0002Z01D02','EG0000001G00020002S0002CLR01','Y',0,0,150.00,150.00,NULL,'2022-03-17 09:25:31'),('EG0000001G00020002S0002Z01D02CLR02','EG0000001G00020002S0002Z01D02','EG0000001G00020002S0002CLR02','Y',0,0,150.00,150.00,NULL,'2022-03-17 11:23:42'),('EG0000001G00020002S0002Z01D03CLR00','EG0000001G00020002S0002Z01D03','EG0000001G00020002S0002CLR00','Y',0,0,150.00,150.00,NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0002Z01D03CLR01','EG0000001G00020002S0002Z01D03','EG0000001G00020002S0002CLR01','Y',0,0,150.00,150.00,NULL,'2022-03-17 09:25:31'),('EG0000001G00020002S0002Z01D03CLR02','EG0000001G00020002S0002Z01D03','EG0000001G00020002S0002CLR02','Y',0,0,150.00,150.00,NULL,'2022-03-17 11:23:42'),('EG0000001G00020002S0002Z01D04CLR00','EG0000001G00020002S0002Z01D04','EG0000001G00020002S0002CLR00','Y',0,0,150.00,150.00,NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0002Z01D04CLR01','EG0000001G00020002S0002Z01D04','EG0000001G00020002S0002CLR01','Y',0,0,150.00,150.00,NULL,'2022-03-17 09:25:31'),('EG0000001G00020002S0002Z01D04CLR02','EG0000001G00020002S0002Z01D04','EG0000001G00020002S0002CLR02','Y',0,0,150.00,150.00,NULL,'2022-03-17 11:23:42'),('EG0000001G00020002S0002Z01D05CLR00','EG0000001G00020002S0002Z01D05','EG0000001G00020002S0002CLR00','Y',0,0,150.00,150.00,NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0002Z01D05CLR01','EG0000001G00020002S0002Z01D05','EG0000001G00020002S0002CLR01','Y',0,0,150.00,150.00,NULL,'2022-03-17 09:25:31'),('EG0000001G00020002S0002Z01D05CLR02','EG0000001G00020002S0002Z01D05','EG0000001G00020002S0002CLR02','Y',0,0,150.00,150.00,NULL,'2022-03-17 11:23:42'),('EG0000001G00020002S0002Z01D06CLR00','EG0000001G00020002S0002Z01D06','EG0000001G00020002S0002CLR00','Y',0,0,150.00,150.00,NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0002Z01D06CLR01','EG0000001G00020002S0002Z01D06','EG0000001G00020002S0002CLR01','Y',0,0,150.00,150.00,NULL,'2022-03-17 09:25:31'),('EG0000001G00020002S0002Z01D06CLR02','EG0000001G00020002S0002Z01D06','EG0000001G00020002S0002CLR02','Y',0,0,150.00,150.00,NULL,'2022-03-17 11:23:42'),('EG0000001G00020002S0003Z01D01CLR00','EG0000001G00020002S0003Z01D01','EG0000001G00020002S0003CLR00','Y',0,0,500.00,500.00,NULL,'2022-09-24 18:02:22'),('EG0000001G00020002S0003Z01D02CLR00','EG0000001G00020002S0003Z01D02','EG0000001G00020002S0003CLR00','Y',0,0,500.00,500.00,NULL,'2022-09-24 18:02:22'),('EG0000001G00020002S0003Z01D03CLR00','EG0000001G00020002S0003Z01D03','EG0000001G00020002S0003CLR00','Y',0,0,500.00,500.00,NULL,'2022-09-24 18:02:22'),('EG0000001G00020002S0003Z01D04CLR00','EG0000001G00020002S0003Z01D04','EG0000001G00020002S0003CLR00','Y',0,0,500.00,500.00,NULL,'2022-09-24 18:02:22'),('EG0000001G00020002S0003Z01D05CLR00','EG0000001G00020002S0003Z01D05','EG0000001G00020002S0003CLR00','Y',0,0,500.00,500.00,NULL,'2022-09-24 18:02:22'),('EG0000001G00020002S0003Z01D06CLR00','EG0000001G00020002S0003Z01D06','EG0000001G00020002S0003CLR00','Y',0,0,500.00,500.00,NULL,'2022-09-24 18:02:22'),('EG0000001G00060006S0001Z01D01CLR00','EG0000001G00060006S0001Z01D01','EG0000001G00060006S0001CLR00','Y',0,0,0.00,1.00,NULL,'2022-08-29 16:35:30'),('EG0000001G00060006S0001Z01D02CLR00','EG0000001G00060006S0001Z01D02','EG0000001G00060006S0001CLR00','Y',0,0,0.00,1.00,NULL,'2022-08-29 16:35:30'),('EG0000001G00060006S0001Z01D03CLR00','EG0000001G00060006S0001Z01D03','EG0000001G00060006S0001CLR00','Y',0,0,0.00,1.00,NULL,'2022-08-29 16:35:30'),('EG0000001G00060006S0001Z01D04CLR00','EG0000001G00060006S0001Z01D04','EG0000001G00060006S0001CLR00','Y',0,0,0.00,1.00,NULL,'2022-08-29 16:35:30'),('EG0000001G00060006S0001Z01D05CLR00','EG0000001G00060006S0001Z01D05','EG0000001G00060006S0001CLR00','Y',0,0,0.00,1.00,NULL,'2022-08-29 16:35:30'),('EG0000001G00060006S0001Z01D06CLR00','EG0000001G00060006S0001Z01D06','EG0000001G00060006S0001CLR00','Y',0,0,0.00,1.00,NULL,'2022-08-29 16:35:30');
/*!40000 ALTER TABLE `sku_size_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sku_sizes`
--

DROP TABLE IF EXISTS `sku_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sku_sizes` (
  `SKU_SIZE_CODE` varchar(29) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_SIZE_CODE created from UML attribute "sku size code" in UML class "sku size"',
  `SKU_CODE` varchar(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_SKU_SIZES created as default foreign key column for foreign key "SKU_TO_SKU_SIZES"',
  `SIZE_DET_CODE` varchar(6) NOT NULL COMMENT 'UML to Offline Database Transform: Column SZ_CLS_DET_TO_SKU_SZS created as default foreign key column for foreign key "SZ_CLS_DET_TO_SKU_SZS"',
  `AVAILABLE` varchar(1) DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "sku size"',
  `RATE` int(5) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column RATE created from UML attribute "rate" in UML class "sku size"',
  `QNTY_IN_STOCK` int(4) DEFAULT '0' COMMENT 'UML to Offline Database Transform: Column QNTY_IN_STOCK created from UML attribute "qnty in stock" in UML class "sku size"',
  `LAST_PRICE` decimal(9,2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column LAST_PRICE created from UML attribute "last price" in UML class "sku size"',
  `OLD_PRICE` decimal(9,2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column OLD_PRICE created from UML attribute "old price" in UML class "sku size"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "sku size"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sku size"',
  PRIMARY KEY (`SKU_SIZE_CODE`),
  KEY `SKU_TO_SKU_SIZES` (`SKU_CODE`),
  KEY `SZ_CLS_DET_TO_SKU_SZS` (`SIZE_DET_CODE`),
  KEY `SKU_SIZES_INDEX` (`SKU_SIZE_CODE`),
  CONSTRAINT `SKU_TO_SKU_SIZES` FOREIGN KEY (`SKU_CODE`) REFERENCES `skus` (`SKU_CODE`),
  CONSTRAINT `SZ_CLS_DET_TO_SKU_SZS` FOREIGN KEY (`SIZE_DET_CODE`) REFERENCES `size_class_dets` (`SZ_DET_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SKU_SIZES created from UML class "sku size"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SKU_TO_SKU_SIZES created for UML association "sku to sku sizes"\r\nUML to Offline Database Transform: Foreign key constraint SZ_CLS_DET_TO_SKU_SZS created for UML association "sz cls det to sku szs"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku_sizes`
--

LOCK TABLES `sku_sizes` WRITE;
/*!40000 ALTER TABLE `sku_sizes` DISABLE KEYS */;
INSERT INTO `sku_sizes` VALUES ('EG0000001G00010001S0001Z03D01','EG0000001G00010001S0001','Z03D01','Y',NULL,0,NULL,NULL,NULL,'2021-12-20 08:20:04'),('EG0000001G00020002S0001Z01D01','EG0000001G00020002S0001','Z01D01','Y',NULL,0,NULL,NULL,NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0001Z01D02','EG0000001G00020002S0001','Z01D02','Y',NULL,0,NULL,NULL,NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0001Z01D03','EG0000001G00020002S0001','Z01D03','Y',NULL,0,NULL,NULL,NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0001Z01D04','EG0000001G00020002S0001','Z01D04','Y',NULL,0,NULL,NULL,NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0001Z01D05','EG0000001G00020002S0001','Z01D05','Y',NULL,0,NULL,NULL,NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0001Z01D06','EG0000001G00020002S0001','Z01D06','Y',NULL,0,NULL,NULL,NULL,'2021-12-20 09:15:07'),('EG0000001G00020002S0002Z01D01','EG0000001G00020002S0002','Z01D01','Y',NULL,0,NULL,NULL,NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0002Z01D02','EG0000001G00020002S0002','Z01D02','Y',NULL,0,NULL,NULL,NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0002Z01D03','EG0000001G00020002S0002','Z01D03','Y',NULL,0,NULL,NULL,NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0002Z01D04','EG0000001G00020002S0002','Z01D04','Y',NULL,0,NULL,NULL,NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0002Z01D05','EG0000001G00020002S0002','Z01D05','Y',NULL,0,NULL,NULL,NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0002Z01D06','EG0000001G00020002S0002','Z01D06','Y',NULL,0,NULL,NULL,NULL,'2022-03-17 09:16:07'),('EG0000001G00020002S0003Z01D01','EG0000001G00020002S0003','Z01D01','Y',NULL,0,NULL,NULL,NULL,'2022-09-24 18:02:22'),('EG0000001G00020002S0003Z01D02','EG0000001G00020002S0003','Z01D02','Y',NULL,0,NULL,NULL,NULL,'2022-09-24 18:02:22'),('EG0000001G00020002S0003Z01D03','EG0000001G00020002S0003','Z01D03','Y',NULL,0,NULL,NULL,NULL,'2022-09-24 18:02:22'),('EG0000001G00020002S0003Z01D04','EG0000001G00020002S0003','Z01D04','Y',NULL,0,NULL,NULL,NULL,'2022-09-24 18:02:22'),('EG0000001G00020002S0003Z01D05','EG0000001G00020002S0003','Z01D05','Y',NULL,0,NULL,NULL,NULL,'2022-09-24 18:02:22'),('EG0000001G00020002S0003Z01D06','EG0000001G00020002S0003','Z01D06','Y',NULL,0,NULL,NULL,NULL,'2022-09-24 18:02:22'),('EG0000001G00060006S0001Z01D01','EG0000001G00060006S0001','Z01D01','Y',NULL,0,NULL,NULL,NULL,'2022-08-29 16:35:30'),('EG0000001G00060006S0001Z01D02','EG0000001G00060006S0001','Z01D02','Y',NULL,0,NULL,NULL,NULL,'2022-08-29 16:35:30'),('EG0000001G00060006S0001Z01D03','EG0000001G00060006S0001','Z01D03','Y',NULL,0,NULL,NULL,NULL,'2022-08-29 16:35:30'),('EG0000001G00060006S0001Z01D04','EG0000001G00060006S0001','Z01D04','Y',NULL,0,NULL,NULL,NULL,'2022-08-29 16:35:30'),('EG0000001G00060006S0001Z01D05','EG0000001G00060006S0001','Z01D05','Y',NULL,0,NULL,NULL,NULL,'2022-08-29 16:35:30'),('EG0000001G00060006S0001Z01D06','EG0000001G00060006S0001','Z01D06','Y',NULL,0,NULL,NULL,NULL,'2022-08-29 16:35:30');
/*!40000 ALTER TABLE `sku_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sku_units`
--

DROP TABLE IF EXISTS `sku_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sku_units` (
  `SKU_UNIT_CODE` varchar(27) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_UNIT_CODE created from UML attribute "sku unit code" in UML class "sku unit"',
  `SKU_CODE` varchar(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_SKU_UNIT created as default foreign key column for foreign key "SKU_TO_SKU_UNIT"',
  `UNIT_CODE` varchar(4) NOT NULL COMMENT 'UML to Offline Database Transform: Column UNIT_TO_SKU_UNIT created as default foreign key column for foreign key "UNIT_TO_SKU_UNIT"',
  `LAST_PRICE` decimal(9,2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column LAST_PRICE created from UML attribute "last price" in UML class "sku unit"',
  `OLD_PRICE` decimal(9,2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column OLD_PRICE created from UML attribute "old price" in UML class "sku unit"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "sku unit"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sku unit"',
  PRIMARY KEY (`SKU_UNIT_CODE`),
  KEY `SKU_TO_SKU_UNIT` (`SKU_CODE`),
  KEY `UNIT_TO_SKU_UNIT` (`UNIT_CODE`),
  KEY `SKU_UNITS_INDEX` (`SKU_UNIT_CODE`),
  CONSTRAINT `SKU_TO_SKU_UNIT` FOREIGN KEY (`SKU_CODE`) REFERENCES `skus` (`SKU_CODE`),
  CONSTRAINT `UNIT_TO_SKU_UNIT` FOREIGN KEY (`UNIT_CODE`) REFERENCES `units` (`FROM_UNIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SKU_UNITS created from UML class "sku unit"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SKU_TO_SKU_UNIT created for UML association "sku to sku unit"\r\nUML to Offline Database Transform: Foreign key constraint UNIT_TO_SKU_UNIT created for UML association "unit to sku unit"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku_units`
--

LOCK TABLES `sku_units` WRITE;
/*!40000 ALTER TABLE `sku_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `sku_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skus`
--

DROP TABLE IF EXISTS `skus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skus` (
  `SKU_CODE` varchar(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_CODE created from UML attribute "sku code" in UML class "sku"',
  `SKU_NAME` varchar(200) DEFAULT 'No Name' COMMENT 'UML to Offline Database Transform: Column SKU_NAME created from UML attribute "sku name" in UML class "sku"',
  `AVAILABLE` varchar(1) DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "sku"',
  `HIDE` varchar(1) DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column HIDE created from UML attribute "hide" in UML class "sku"',
  `RATE` int(5) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column RATE created from UML attribute "rate" in UML class "sku"',
  `QNTY_IN_STOCK` int(4) DEFAULT '0' COMMENT 'UML to Offline Database Transform: Column QNTY_IN_STOCK created from UML attribute "qnty in stock" in UML class "sku"',
  `LAST_PRICE` decimal(9,2) DEFAULT '0.00' COMMENT 'UML to Offline Database Transform: Column LAST_PRICE created from UML attribute "last price" in UML class "sku"',
  `APPEAR_ONLY_IN_ASS` varchar(1) DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column APPEAR_ONLY_IN_ASS created from UML attribute "appear only in ass" in UML class "sku"',
  `ASSEMBLY` varchar(1) DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column ASSEMBLY created from UML attribute "assembly" in UML class "sku"',
  `OLD_PRICE` decimal(9,2) DEFAULT '1.00' COMMENT 'UML to Offline Database Transform: Column OLD_PRICE created from UML attribute "old price" in UML class "sku"',
  `SHOP_CAT_SUB_CODE` varchar(18) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOPCAT_SKU created as default foreign key column for foreign key "SHOPCAT_SKU"',
  `SHP_PROP_CLS_CODE` varchar(22) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SHP_CAT_PROP_CLS_TO_SHU created as default foreign key column for foreign key "SHP_CAT_PROP_CLS_TO_SHU"',
  `BRAND_CODE` varchar(6) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SKU_BRAND created as default foreign key column for foreign key "SKU_BRAND"',
  `MNF_CODE` varchar(6) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SKU_MANUFACTURER created as default foreign key column for foreign key "SKU_MANUFACTURER"',
  `MODEL_CODE` varchar(9) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SKU_MODEL created as default foreign key column for foreign key "SKU_MODEL"',
  `YEAR` int(4) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SKU_YEAR created as default foreign key column for foreign key "SKU_YEAR"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sku"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "sku"',
  `NEW_FLAG` varchar(2) DEFAULT 'Y',
  `CAT_SZ_CLASS_CODE` varchar(8) DEFAULT NULL,
  `BASIC_UNIT` varchar(4) DEFAULT NULL,
  `MIN_QTY` double(7,2) DEFAULT NULL,
  `MAX_QTY` double(7,2) DEFAULT NULL,
  `STEP_QTY` double(7,2) DEFAULT NULL,
  PRIMARY KEY (`SKU_CODE`),
  KEY `SHOPCAT_SKU` (`SHOP_CAT_SUB_CODE`),
  KEY `SHP_CAT_PROP_CLS_TO_SHU` (`SHP_PROP_CLS_CODE`),
  KEY `SKU_BRAND` (`BRAND_CODE`),
  KEY `SKU_MANUFACTURER` (`MNF_CODE`),
  KEY `SKU_MODEL` (`MODEL_CODE`),
  KEY `SKU_YEAR` (`YEAR`),
  KEY `SKUS_INDEX` (`SKU_CODE`),
  KEY `CAT_SIZE_CLASSES_TO_SKUS_idx` (`CAT_SZ_CLASS_CODE`),
  KEY `UNITS_SKU_BASIC_UNIT_FK` (`BASIC_UNIT`),
  CONSTRAINT `CAT_SIZE_CLASSES_TO_SKUS` FOREIGN KEY (`CAT_SZ_CLASS_CODE`) REFERENCES `cat_size_classes` (`CAT_SZ_CLASS_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SHOPCAT_SKU` FOREIGN KEY (`SHOP_CAT_SUB_CODE`) REFERENCES `shop_sub_cats` (`SHOP_SUB_CAT_CODE`),
  CONSTRAINT `SHP_CAT_PROP_CLS_TO_SHU` FOREIGN KEY (`SHP_PROP_CLS_CODE`) REFERENCES `shop_sub_cat_prop_classes` (`SHP_SUB_CAT_PRP_CLS_CODE`) ON UPDATE SET NULL,
  CONSTRAINT `SKU_BRAND` FOREIGN KEY (`BRAND_CODE`) REFERENCES `brands` (`BRAND_CODE`),
  CONSTRAINT `SKU_MANUFACTURER` FOREIGN KEY (`MNF_CODE`) REFERENCES `manufactures` (`MNF_CODE`),
  CONSTRAINT `SKU_MODEL` FOREIGN KEY (`MODEL_CODE`) REFERENCES `models` (`MODEL_CODE`),
  CONSTRAINT `SKU_YEAR` FOREIGN KEY (`YEAR`) REFERENCES `years` (`YEAR`),
  CONSTRAINT `UNITS_SKU_BASIC_UNIT_FK` FOREIGN KEY (`BASIC_UNIT`) REFERENCES `units` (`FROM_UNIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SKUS created from UML class "sku"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SHOPCAT_SKU created for UML association "shopcat sku"\r\nUML to Offline Database Transform: Foreign key constraint SHP_CAT_PROP_CLS_TO_SHU created for UML association "shp cat prop cls to shu"\r\nUML to Offline Database Transform: Foreign key constraint SKU_BRAND created for UML association "sku brand"\r\nUML to Offline Database Transform: Foreign key constraint SKU_MANUFACTURER created for UML association "sku manufacturer"\r\nUML to Offline Database Transform: Foreign key constraint SKU_MODEL created for UML association "sku model"\r\nUML to Offline Database Transform: Foreign key constraint SKU_YEAR created for UML association "sku year"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skus`
--

LOCK TABLES `skus` WRITE;
/*!40000 ALTER TABLE `skus` DISABLE KEYS */;
INSERT INTO `skus` VALUES ('EG0000001G00010001S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00010001',NULL,NULL,NULL,NULL,NULL,'2021-12-20 07:59:01',NULL,'Y',NULL,NULL,NULL,NULL,NULL),('EG0000001G00010001S0001','Table Chair','Y','N',NULL,20,117.22,'N','N',133.20,'EG0000001G00010001','EG0000001G00010001P001','B00003','F00004','M00000001',1970,'2021-12-20 08:19:26',NULL,'Y','G0001Z03','U001',1.00,10.00,1.00),('EG0000001G00020002S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00020002',NULL,NULL,NULL,NULL,NULL,'2021-12-20 07:59:43',NULL,'Y',NULL,NULL,NULL,NULL,NULL),('EG0000001G00020002S0001','Leggy Trouser','Y','N',NULL,50,225.00,'N','N',225.00,'EG0000001G00020002','EG0000001G00020002P001','B00002','F00003','M00000001',1960,'2021-12-20 09:14:18',NULL,'Y','G0002Z01','U001',1.00,10.00,1.00),('EG0000001G00020002S0002','Carina V-Shirt','Y','N',NULL,0,11.00,'N','N',4.00,'EG0000001G00020002','EG0000001G00020002P001','B00002','F00003','M00000001',1960,'2022-03-17 09:14:57',NULL,'Y','G0002Z01','U001',1.00,10.00,1.00),('EG0000001G00020002S0003','Morning Suit','Y','N',NULL,10,500.00,'N','Y',500.00,'EG0000001G00020002','EG0000001G00020002P001','B00002','F00003','M00000001',1960,'2022-09-24 19:01:29',NULL,'Y','G0002Z01','U001',1.00,10.00,1.00),('EG0000001G00030003S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00030003',NULL,NULL,NULL,NULL,NULL,'2021-12-20 08:00:16',NULL,'Y',NULL,NULL,NULL,NULL,NULL),('EG0000001G00040004S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00040004',NULL,NULL,NULL,NULL,NULL,'2022-08-22 16:57:33',NULL,'Y',NULL,NULL,NULL,NULL,NULL),('EG0000001G00050005S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00050005',NULL,NULL,NULL,NULL,NULL,'2022-08-25 01:37:22',NULL,'Y',NULL,NULL,NULL,NULL,NULL),('EG0000001G00060006S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00060006',NULL,NULL,NULL,NULL,NULL,'2022-08-25 01:37:47',NULL,'Y',NULL,NULL,NULL,NULL,NULL),('EG0000001G00060006S0001','Formal Morning Skirt','Y','N',NULL,0,100.00,'N','N',0.00,'EG0000001G00060006','EG0000001G00060006P001','B00006','F00007','M00000002',1970,'2022-08-29 17:35:12',NULL,'Y','G0006Z01','U001',1.00,10.00,1.00),('EG0000001G00070007S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00070007',NULL,NULL,NULL,NULL,NULL,'2022-08-25 01:39:04',NULL,'Y',NULL,NULL,NULL,NULL,NULL),('EG0000001G00080008S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00080008',NULL,NULL,NULL,NULL,NULL,'2022-08-25 01:39:45',NULL,'Y',NULL,NULL,NULL,NULL,NULL),('EG0000001G00090009S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00090009',NULL,NULL,NULL,NULL,NULL,'2022-08-25 01:40:29',NULL,'Y',NULL,NULL,NULL,NULL,NULL),('EG0000001G00100010S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00100010',NULL,NULL,NULL,NULL,NULL,'2022-08-25 01:44:29',NULL,'Y',NULL,NULL,NULL,NULL,NULL),('EG0000001G00110011S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00110011',NULL,NULL,NULL,NULL,NULL,'2022-08-25 01:44:45',NULL,'Y',NULL,NULL,NULL,NULL,NULL),('EG0000001G00120012S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00120012',NULL,NULL,NULL,NULL,NULL,'2022-08-25 01:45:14',NULL,'Y',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `skus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_images`
--

DROP TABLE IF EXISTS `sys_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_images` (
  `SYS_IMAGE_ID` varchar(1) NOT NULL COMMENT 'UML to Offline Database Transform: Column SYS_IMAGE_ID created from UML attribute "sys image id" in UML class "sys image"',
  `SYS_PARAMETER_ID` decimal(10,0) DEFAULT NULL,
  `IMAGE_SLIDE_1` varchar(200) DEFAULT NULL,
  `IMAGE_SLIDE_2` varchar(200) DEFAULT NULL,
  `IMAGE_SLIDE_3` varchar(200) DEFAULT NULL,
  `IMAGE_SLIDE_4` varchar(200) DEFAULT NULL,
  `IMAGE_SLIDE_5` varchar(200) DEFAULT NULL,
  `IMAGE_SLIDE_1CAP` varchar(200) DEFAULT NULL,
  `IMAGE_SLIDE_2CAP` varchar(200) DEFAULT NULL,
  `IMAGE_SLIDE_3CAP` varchar(200) DEFAULT NULL,
  `IMAGE_SLIDE_4CAP` varchar(200) DEFAULT NULL,
  `IMAGE_SLIDE_5CAP` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`SYS_IMAGE_ID`),
  KEY `SYS_IMAGES` (`SYS_PARAMETER_ID`),
  CONSTRAINT `SYS_IMAGES` FOREIGN KEY (`SYS_PARAMETER_ID`) REFERENCES `sys_parameters` (`SYS_PARAMETER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SYS_IMAGES created from UML class "sys image"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_images`
--

LOCK TABLES `sys_images` WRITE;
/*!40000 ALTER TABLE `sys_images` DISABLE KEYS */;
INSERT INTO `sys_images` VALUES ('1',1,'slides/ImageSlide1.jpeg','slides/ImageSlide2.jpeg','slides/ImageSlide3.jpeg','slides/slide4.jpg','slides/ImageSlide5.jpeg','Image One Caption','Image Two Caption','Image Three Caption','Image Four Caption','Image Five Caption');
/*!40000 ALTER TABLE `sys_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_parameters`
--

DROP TABLE IF EXISTS `sys_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_parameters` (
  `SYS_PARAMETER_ID` decimal(10,0) NOT NULL COMMENT 'UML to Offline Database Transform: Column SYS_PARAMETER_ID created as default primary key column',
  `WEB_SERVER_IP` varchar(20) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column WEB_SERVER_IP created from UML attribute "web server ip" in UML class "sys parameter"',
  `WEB_SERVER_NAME` varchar(200) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column WEB_SERVER_NAME created from UML attribute "web server name" in UML class "sys parameter"',
  `FILE_SERVER_IP` varchar(20) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column FILE_SERVER_IP created from UML attribute "file server ip" in UML class "sys parameter"',
  `FILE_SERVER_NAME` varchar(20) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column FILE_SERVER_NAME created from UML attribute "file server name" in UML class "sys parameter"',
  `SMTP_HOST` varchar(50) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SMTP_HOST created from UML attribute "smtp host" in UML class "sys parameter"',
  `SMTP_PORT` int(4) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SMTP_PORT created from UML attribute "smtp port" in UML class "sys parameter"',
  `SSL_OR_TSL` varchar(1) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SSL_OR_TSL created from UML attribute "ssl or tsl" in UML class "sys parameter"',
  `SHOP_ADMIN_EMAIL` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_ADMIN_NAME created from UML attribute "shop admin name" in UML class "sys parameter"',
  `SHOP_USER_NAME` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_USER_NAME created from UML attribute "shop user name" in UML class "sys parameter"',
  `SHOP_CODE` varchar(9) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_TO_SYS_PRM created as default foreign key column for foreign key "SHOP_TO_SYS_PRM"',
  `FILE_SERVER_PATH` varchar(200) DEFAULT NULL,
  `NOIMAGE_PATH` varchar(200) DEFAULT NULL,
  `SHOP_ADMIN_PASSWRD` varchar(128) DEFAULT NULL,
  `LANG_CODE` varchar(2) DEFAULT NULL,
  `verify_email_url` varchar(500) DEFAULT NULL,
  `SHOP_NAME_IN_EMAILS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SYS_PARAMETER_ID`),
  KEY `SHOP_TO_SYS_PRM` (`SHOP_CODE`),
  KEY `SYS_PARAMETERS_INDEX` (`SYS_PARAMETER_ID`),
  CONSTRAINT `SHOP_TO_SYS_PRM` FOREIGN KEY (`SHOP_CODE`) REFERENCES `shops` (`SHOP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SYS_PARAMETERS created from UML class "sys parameter"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SHOP_TO_SYS_PRM created for UML association "shop to sys prm"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_parameters`
--

LOCK TABLES `sys_parameters` WRITE;
/*!40000 ALTER TABLE `sys_parameters` DISABLE KEYS */;
INSERT INTO `sys_parameters` VALUES (1,NULL,'http://127.0.0.1:7101/shopbookHome/shop/',NULL,'localhost','mail.mymr.health',465,NULL,'registeration@mymr.health','registeration',NULL,'/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/','NoImage.png','bIY,i_]jRAAK','en','http://127.0.0.1:7101/shopbookHome/shop/adf.task-flow?adf.tfDoc=%2FWEB-INF%2Freset-pwd-tf.xml&adf.tfId=reset-pwd-tf&pOneTimeCode=','My Shop');
/*!40000 ALTER TABLE `sys_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `FROM_UNIT` varchar(4) NOT NULL COMMENT 'UML to Offline Database Transform: Column FROM_UNIT created from UML attribute "from unit" in UML class "unit"',
  `UNIT_NAME` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column UNIT_NAME created from UML attribute "unit name" in UML class "unit"',
  `BASIC_UNIT` varchar(1) DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column BASIC_UNIT created from UML attribute "basic unit" in UML class "unit"',
  `MULTIPLY_BY` double(7,2) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column MULTIPLY_BY created from UML attribute "multiply by" in UML class "unit"',
  `TO_UNIT` varchar(4) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column UNITS_TREE created as default foreign key column for foreign key "UNITS_TREE"',
  `MIN_QTY` double(7,2) DEFAULT NULL,
  `MAX_QTY` double(7,2) DEFAULT NULL,
  `STEP_QTY` double(7,2) DEFAULT NULL,
  PRIMARY KEY (`FROM_UNIT`),
  KEY `UNITS_INDEX` (`FROM_UNIT`),
  KEY `UNITS_TREE` (`TO_UNIT`),
  CONSTRAINT `UNITS_TREE` FOREIGN KEY (`TO_UNIT`) REFERENCES `units` (`FROM_UNIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table UNITS created from UML class "unit"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint UNITS_TREE created for UML association "units tree"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES ('U000','Reserved','Y',0.00,NULL,NULL,NULL,NULL),('U001','Each','Y',1.00,NULL,1.00,10.00,1.00),('U002','Pack of 6','N',6.00,'U001',1.00,6.00,1.00),('U003','Pack of two','N',2.00,'U001',1.00,5.00,1.00);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `USER_ID` varchar(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column USER_ID created from UML attribute "user id" in UML class "user"',
  `USER_NAME` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column USER_NAME created from UML attribute "user name" in UML class "user"',
  `FIRST_NAME` varchar(100) NOT NULL DEFAULT 'null' COMMENT 'UML to Offline Database Transform: Column FIRST_NAME created from UML attribute "first name" in UML class "user"',
  `FAMILY_NAME` varchar(100) NOT NULL DEFAULT 'null' COMMENT 'UML to Offline Database Transform: Column FAMILY_NAME created from UML attribute "family name" in UML class "user"',
  `PASSWRD` varchar(128) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column PASSWRD created from UML attribute "passwrd" in UML class "user"',
  `ONE_TIME_CODE` varchar(128) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column ONE_TIME_CODE created from UML attribute "one time code" in UML class "user"',
  `PHOTO_NAME` blob COMMENT 'UML to Offline Database Transform: Column PHOTO_NAME created from UML attribute "photo name" in UML class "user"',
  `IS_ADMIN` varchar(1) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column IS_ADMIN created from UML attribute "is admin" in UML class "user"',
  `PHOTO_TYPE` varchar(20) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column PHOTO_TYPE created from UML attribute "photo type" in UML class "user"',
  `SHOP_CODE` varchar(9) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_TO_SHOP_ADMIN created as default foreign key column for foreign key "SHOP_TO_SHOP_ADMIN"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "user"',
  `NOTES` varchar(500) DEFAULT NULL,
  `ACTIVE` varchar(2) DEFAULT 'Y',
  `mobile_no` int(20) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `ADDRESS_1` varchar(200) DEFAULT NULL,
  `POSTAL_ZIP_CODE` varchar(10) DEFAULT NULL,
  `CNTRY_CODE2` varchar(2) DEFAULT NULL,
  `CITY_CODE` varchar(6) DEFAULT NULL,
  `AREA_CODE` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `SHOP_TO_SHOP_ADMIN` (`SHOP_CODE`),
  KEY `USERS_INDEX` (`USER_ID`),
  KEY `fk_users_1_idx` (`CNTRY_CODE2`),
  KEY `fk_users_cities_idx` (`CITY_CODE`),
  KEY `fk_users_areas_idx` (`AREA_CODE`),
  CONSTRAINT `SHOP_TO_SHOP_ADMIN` FOREIGN KEY (`SHOP_CODE`) REFERENCES `shops` (`SHOP_CODE`),
  CONSTRAINT `fk_users_areas` FOREIGN KEY (`AREA_CODE`) REFERENCES `cities` (`city_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_cities` FOREIGN KEY (`CITY_CODE`) REFERENCES `cities` (`city_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_countries` FOREIGN KEY (`CNTRY_CODE2`) REFERENCES `countries` (`CNTRY_CODE2`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table USERS created from UML class "user"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SHOP_TO_SHOP_ADMIN created for UML association "shop to shop admin"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('mohamed.fayed@gmail.com','mohamed gmail HHHHHH','fayed','M F','123456',NULL,NULL,'S',NULL,'EG0000001','2020-03-25 17:44:57',NULL,'Y',1002406007,'xxxxxxxxxxxxx','yyyyyyyyyyyyyyyyyyyyyyyyyyy',NULL,'EG','C00002','C00004'),('p1@yopmail.com','admin','Admin','set by user himself','123456',NULL,NULL,'C',NULL,'EG0000001','2022-02-17 14:05:43',NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('p2@yopmail.com','User One','admin','two','123456',NULL,NULL,'U',NULL,NULL,'2022-02-18 15:10:44',NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('p3@yopmail.com','Order Manager','set by user himself','set by user himself','123456',NULL,NULL,'O',NULL,'EG0000001','2022-02-20 07:31:43',NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('user2@yopmail.com','User Two','User','Two','123456',NULL,NULL,'U',NULL,NULL,'2022-03-09 15:09:07',NULL,'Y',NULL,NULL,NULL,NULL,'EG','C00001','C00003');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `USER_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(5) NOT NULL,
  PRIMARY KEY (`USER_ID`,`ROLE_ID`),
  KEY `roles_to_users_roles_fk_idx` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES ('mohamed.fayed@gmail.com','C0000'),('p1@yopmail.com','C0000'),('p1@yopmail.com','C0001'),('p3@yopmail.com','O0000'),('mohamed.fayed@gmail.com','S0000'),('p2@yopmail.com','U0000'),('user2@yopmail.com','U0000');
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_wish_lists`
--

DROP TABLE IF EXISTS `users_wish_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_wish_lists` (
  `USER_ID_SKU_CODE` varchar(138) NOT NULL COMMENT 'UML to Offline Database Transform: Column USER_ID_SKU_CODE created from UML attribute "user id sku code" in UML class "users wish list"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "users wish list"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "users wish list"',
  `SKU_SZ_CLR_CODE` varchar(37) DEFAULT NULL,
  `USER_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`USER_ID_SKU_CODE`),
  KEY `SKU_TO_SZ_CLR_WISH_LISTS` (`SKU_SZ_CLR_CODE`),
  KEY `USER_WISH_ITEMS` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table USERS_WISH_LISTS created from UML class "users wish list"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_wish_lists`
--

LOCK TABLES `users_wish_lists` WRITE;
/*!40000 ALTER TABLE `users_wish_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_wish_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `years`
--

DROP TABLE IF EXISTS `years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `years` (
  `YEAR` int(4) NOT NULL COMMENT 'UML to Offline Database Transform: Column YEAR created from UML attribute "year" in UML class "year"',
  `REGISTER_STATUS` varchar(1) NOT NULL DEFAULT 'R' COMMENT 'UML to Offline Database Transform: Column REGISTER_STATUS created from UML attribute "register status" in UML class "year"',
  PRIMARY KEY (`YEAR`),
  KEY `YEARS_INDEX` (`YEAR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table YEARS created from UML class "year"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `years`
--

LOCK TABLES `years` WRITE;
/*!40000 ALTER TABLE `years` DISABLE KEYS */;
INSERT INTO `years` VALUES (0,'R'),(1930,'R'),(1950,'R'),(1960,'R'),(1970,'R'),(1980,'R'),(1990,'R'),(2000,'R');
/*!40000 ALTER TABLE `years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'shopbook'
--
/*!50003 DROP FUNCTION IF EXISTS `get_cat_tree` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="root"@"localhost" FUNCTION "get_cat_tree"(_prntCat varchar(5)) RETURNS varchar(4000) CHARSET utf8
BEGIN
declare catTree varchar(4000);
-- delete from cat_tree_temp;
-- insert into cat_tree_temp
 select group_concat(SHOP_SUB_CAT_CODE separator ',' )  into catTree from (
SELECT  `SHOP_SUB_CAT_CODE`,  PARENT_CATEGORY, CHILD_CATEGORY
	FROM shop_sub_cats ,  shop_categories, category_trees  
	WHERE substr(SHOP_SUB_CAT_CODE,1,14) = concat(SHOP_CODE,CAT_CODE)
	and CAT_CODE = CHILD_CATEGORY and CHILD_CATEGORY = _prntCat
union 
SELECT  `SHOP_SUB_CAT_CODE`,  PARENT_CATEGORY, CHILD_CATEGORY
FROM (
	SELECT  `SHOP_SUB_CAT_CODE`,  PARENT_CATEGORY, CHILD_CATEGORY
	FROM shop_sub_cats ,  shop_categories, category_trees  
	WHERE substr(SHOP_SUB_CAT_CODE,1,14) = concat(SHOP_CODE,CAT_CODE)
	and CAT_CODE = CHILD_CATEGORY order by parent_category, child_category ) products_sorted,
     (select @pv := _prntCat) initialisation
     where find_in_set(parent_category, @pv)
	 and length(@pv := concat(@pv, ',', child_category))) as myTempTable;
--    select group_concat(cat_sub_code separator ', ') as myList
--   into catTree from cat_tree_temp;
RETURN catTree;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `srchSkuClrs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`shopbook`@`%` FUNCTION `srchSkuClrs`(pClrs varchar(500), pSku varchar(30)) RETURNS varchar(2) CHARSET utf8
BEGIN
declare x1 int(2);
 if (pClrs = '%' or pClrs is null or pClrs='') then return 'Y';
else  
select count(*) into x1 from sku_colors
where SKU_CODE = pSku and instr(pClrs,clr_code) > 0;
if x1 > 0 then RETURN 'Y';
ELSE return 'N';
end if;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `srchSkuSizes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`shopbook`@`%` FUNCTION `srchSkuSizes`(pSizes varchar(500), pSku varchar(30)) RETURNS varchar(2) CHARSET utf8
BEGIN
declare x1 int(2);
 if (pSizes = '%' or pSizes is null or pSizes='') then return 'Y';
else  
select count(*) into x1 from sku_size_colors
where substr(SKU_SIZE_CODE,1,23) = pSku 
and instr(pSizes,substr(SKU_SIZE_CODE,-6)) > 0;
if x1 > 0 then RETURN 'Y';
ELSE return 'N';
end if;
 END IF;
RETURN 'Y';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `xyz` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`shopbook`@`%` FUNCTION `xyz`(p1 varchar(500),p2 varchar(500)) RETURNS varchar(20) CHARSET utf8
BEGIN
DECLARE X VARCHAR(2) DEFAULT 'Y';
if (p2 = '%' or p2 is null or p2='') then return 'Y';
elseif(instr(p2,p1) > 0 or instr(p1,p2) > 0 ) then return 'Y';
else return 'N';
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_to_bag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`shopbook`@`localhost` PROCEDURE `add_to_bag`(pUserId varchar(100),
pSkuClrCode varchar(28), pSizeCode varchar(6),pUnitCode varchar(4),pQty Decimal(6,3),
pUnitPrice DECIMAL(13,2))
BEGIN
declare open_master_rcrd_exist int(1);
declare open_master_rcrd varchar(42);
declare gen_det_id varchar(42);
	select count(1) into open_master_rcrd_exist from shopping_master 
	where user_id = pUserId and trans_status='O';
if (open_master_rcrd_exist = 0) then
select 'bf4 insert';
	insert into shopping_master (user_id,first_name, last_name, 
    ADDRESS, ADDRESS_1,POSTAL_ZIP_CODE, CNTRY_CODE2, CITY_CODE, AREA_CODE,MOB_NO, trans_status) 
  select user_id, first_name, family_name,ADDRESS, ADDRESS_1,POSTAL_ZIP_CODE, CNTRY_CODE2, 
		CITY_CODE, AREA_CODE,mobile_no, 'O' from users
  where user_id = pUserId;
--    values(pUserId,'O');
select 'after insert';
commit;
end if;
select trans_id into open_master_rcrd from shopping_master 
where user_id = pUserId and trans_status='O';
select open_master_rcrd;
if (pSkuClrCode is not null and pSizeCode is not null and pUnitCode is not null 
	and pQty is not null and pUnitPrice is not null) then
select 'done';
select cast(current_timestamp() as unsigned) into gen_det_id;
	insert into shopping_det(trans_id,det_id,sku_clr_code, size_code, unit_code, qty, unit_price)
	values (open_master_rcrd,concat(gen_det_id,pSkuClrCode), pSkuClrCode,
    pSizeCode, pUnitCode, pQty,pUnitPrice);
    commit;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `campaigns_apply_action` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="root"@"localhost" PROCEDURE "campaigns_apply_action"()
BEGIN
declare _offerMastId int(11) default 0;
declare _skuCode varchar(23);
declare _skuClrCode varchar(28);
declare _skuClrSzCode varchar(37);
declare _skuType varchar(1);
declare _lastPrice Decimal(9,2);
declare _oldPrice Decimal(9,2);
DECLARE _lastSku boolean DEFAULT false;
declare _offerDets cursor for
select SKU_TYPE, SKU_CODE, SKU_CLR_CODE, SKU_SZ_CLR_CODE, LAST_PRICE, OLD_PRICE
from offer_dets where OFFER_ID = (select OFFER_MAST_ID  from shopbook.offers
 where VALID_FRM_DATE = date_format(current_timestamp(),'%Y-%m-%d %H%:00:00')
 and ALREADY_APPLIED = 'false');
-- _xx;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET _lastSku = TRUE;

-- select OFFER_MAST_ID into _offerMastId from shopbook.offers
-- where VALID_FRM_DATE = date_format(current_timestamp(),'%Y-%m-%d %H%:00:00')
-- and ALREADY_APPLIED = 'false';
-- IF _offerMastId > 0 then
open _offerDets;
	offerDets_loop : LOOP
    fetch _offerDets into _skuType, _skuCode,_skuClrCode, _skuClrSzCode, _lastPrice, _oldPrice ;
		   if _lastSku then
		   leave offerDets_loop;
		   end if;
    if _skuType = 'Z' then
		update sku_size_colors set OLD_PRICE = LAST_PRICE , LAST_PRICE = _lastPrice
		where SKU_SZ_CLR_CODE = _skuClrSzCode;
	elseif _skuType = 'C' then
		update sku_colors set OLP_PRICE = LAST_PRICE, LAST_PRICE = _lastPrice
		where SKU_CLR_CODE = _skuClrCode;
    elseif _skuType = 'S' then
		update skus set OLD_PRICE = LAST_PRICE, LAST_PRICE = _lastPrice
		where SKU_CODE = _skuCode;
	end if;
   end LOOP;
   close _offerDets;
update shopbook.offers set ALREADY_APPLIED = 'true';
-- end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_sku_color` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`shopbook`@`%` PROCEDURE `del_sku_color`(vSkuClrCode varchar(28), vSkuCode varchar(23))
BEGIN
delete from sku_size_colors where SKU_CLR_CODE = vSkuClrCode;
delete from sku_clr_images where SKU_CLR_CODE = vSkuClrCode;
delete from sku_colors where SKU_CLR_CODE = vSkuClrCode;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_cat_tree` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER="root"@"localhost" PROCEDURE "get_cat_tree"(IN _prntCat varchar(5),OUT catTree varchar(1000))
BEGIN
truncate table cat_tree_temp;
insert into cat_tree_temp 
SELECT  `SHOP_SUB_CAT_CODE`,  PARENT_CATEGORY, CHILD_CATEGORY
	FROM shop_sub_cats ,  shop_categories, category_trees  
	WHERE substr(SHOP_SUB_CAT_CODE,1,14) = concat(SHOP_CODE,CAT_CODE)
	and CAT_CODE = CHILD_CATEGORY and CHILD_CATEGORY = _prntCat
union 
SELECT  `SHOP_SUB_CAT_CODE`,  PARENT_CATEGORY, CHILD_CATEGORY
FROM (
	SELECT  `SHOP_SUB_CAT_CODE`,  PARENT_CATEGORY, CHILD_CATEGORY
	FROM shop_sub_cats ,  shop_categories, category_trees  
	WHERE substr(SHOP_SUB_CAT_CODE,1,14) = concat(SHOP_CODE,CAT_CODE)
	and CAT_CODE = CHILD_CATEGORY order by parent_category, child_category ) products_sorted,
     (select @pv := _prntCat) initialisation
     where find_in_set(parent_category, @pv)
	 and length(@pv := concat(@pv, ',', child_category));
     select group_concat(cat_sub_code separator ', ') as myList
     into catTree from cat_tree_temp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertMissedSkuSizes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`shopbook`@`localhost` PROCEDURE `insertMissedSkuSizes`(vSkuClrCode varchar(28),
vQntyInStock int(4), vLastPrice decimal(9,2), vOldPrice decimal(9,2))
BEGIN
insert into shopbook.sku_size_colors (SKU_SZ_CLR_CODE,SKU_SIZE_CODE,SKU_CLR_CODE,
LAST_PRICE,OLD_PRICE,QNTY_IN_STOCK) 
select concat(sku_size_code,substr(vSkuClrCode,-5)), SKU_SIZE_CODE, vSkuClrCode
,'','',''
-- ,vLastPrice, vOldPrice, vQntyInStock
from shopbook.sku_sizes 
where SKU_SIZE_CODE not in (select SKU_SIZE_CODE from shopbook.sku_size_colors 
			where SKU_CLR_CODE = vSkuClrCode )
and SKU_CODE = substr(vSkuClrCode,1,23) 
and substr(sku_size_code,-3) != 'D00';
 commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `Search_V`
--

/*!50001 DROP VIEW IF EXISTS `Search_V`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Search_V` AS select 1 AS `LAST_MODIFIED`,1 AS `NOTES`,1 AS `SHOP_CAT_CODE`,1 AS `SHOP_SUB_CAT_CODE`,1 AS `cats_search`,1 AS `SUB_CAT_IMAGE_NAME`,1 AS `SUB_CAT_IMAGE_TYPE`,1 AS `APPEAR_ONLY_IN_ASS`,1 AS `ASSEMBLY`,1 AS `AVAILABLE`,1 AS `BRAND_CODE`,1 AS `CAT_SZ_CLASS_CODE`,1 AS `HIDE`,1 AS `Sku_Last_Modified`,1 AS `LAST_PRICE`,1 AS `MNF_CODE`,1 AS `MODEL_CODE`,1 AS `NEW_FLAG`,1 AS `Sku_Notes`,1 AS `OLD_PRICE`,1 AS `QNTY_IN_STOCK`,1 AS `RATE`,1 AS `SHOP_CAT_SUB_CODE`,1 AS `SHP_PROP_CLS_CODE`,1 AS `SKU_CODE`,1 AS `sku_search`,1 AS `YEAR` */;
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

-- Dump completed on 2022-10-03 18:50:51
