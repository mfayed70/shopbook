-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: shopbook
-- ------------------------------------------------------
-- Server version	5.7.35

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
INSERT INTO `brands` VALUES ('B00000','Reserved','n/a','R','2019-07-11 19:53:39',NULL),('B00001','Dell',NULL,'A','2019-07-12 14:08:49',NULL),('B00002','Jack & Jones',NULL,'A','2019-07-12 14:09:23',NULL),('B00003','IKEA',NULL,'A','2019-07-12 14:09:08',NULL),('B00004','Toshiba',NULL,'A','2019-10-05 17:48:44',NULL);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `shopbook` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER shopbook.before_insert_brands_pK
	BEFORE INSERT
	ON shopbook.brands
	FOR EACH ROW
BEGIN
    declare xx varchar(5) default null;
select MIN(c.start) FROM (
SELECT substr(a.BRAND_CODE,2)+1 AS start
    FROM brands AS a, brands AS b
    WHERE substr(a.BRAND_CODE,2) < substr(b.BRAND_CODE,2)
    GROUP BY substr(a.BRAND_CODE,2)
    HAVING start < MIN(substr(b.BRAND_CODE,2)) ) c into xx;
  if xx is null then
select COALESCE(max(substr(brands.BRAND_CODE,2)),0) +1 into xx
FROM brands;
end IF;
select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0000',xx)
  WHEN  LENGTH(xx) = 2 
      then concat('000',xx)
  WHEN  LENGTH(xx) = 3 
      then concat('00',xx)
  WHEN  LENGTH(xx) = 4 
      then concat('0',xx)
  ELSE  xx END
  into xx;              
  SET NEW.BRAND_CODE = CONCAT('B',XX);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `shopbook` CHARACTER SET utf8 COLLATE utf8_general_ci ;

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
INSERT INTO `cat_mnf_brnd_mdl_yers` VALUES ('G0001B00003',NULL,'2021-07-07 23:33:48','B00003','G0001',NULL,NULL,NULL);
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
INSERT INTO `cat_size_classes` VALUES ('G0001Z03','Z03','G0001',NULL);
/*!40000 ALTER TABLE `cat_size_classes` ENABLE KEYS */;
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
INSERT INTO `categories` VALUES ('G0000','Root Category','n/a',NULL,'/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/NoImage.png',NULL),('G0001','Furniture',NULL,'2021-07-07 17:47:18','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/210707_232531.jpeg','.jpeg'),('G0002','Men Fashion',NULL,'2021-07-07 17:49:19','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/210707_175018.jpeg','.jpeg'),('G0003','Laptops',NULL,'2021-07-07 23:25:41','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/210707_232552.jpeg','.jpeg'),('G0004','Household Appliances',NULL,'2021-07-07 23:26:13','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/210707_232623.jpeg','.jpeg');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER before_insert_categories_pK
	BEFORE INSERT
	ON categories
	FOR EACH ROW
BEGIN
  declare xx varchar(4) default null;
  declare yy varchar(100) default NULL;
select MIN(c.start) FROM (
SELECT substr(a.CAT_CODE,2)+1 AS start
    FROM categories AS a, categories AS b
    WHERE substr(a.CAT_CODE,2) < substr(b.CAT_CODE,2)
    GROUP BY substr(a.CAT_CODE,2)
    HAVING start < MIN(substr(b.CAT_CODE,2)) ) c into xx;
  if xx is null then
select COALESCE(max(substr(categories.CAT_CODE,2)),0) +1 into xx
FROM categories;
end IF;
select case 
  WHEN  LENGTH(xx) = 1 
      then concat('000',xx)
  WHEN  LENGTH(xx) = 2 
      then concat('00',xx)
  WHEN  LENGTH(xx) = 3 
      then concat('0',xx)
  ELSE  xx END
  into xx;              
  SET NEW.CAT_CODE = CONCAT('G',XX);
-- set yy = concat(NEW.CAT_CODE,SUBSTRING_INDEX(NEW.CAT_IMG_NAME,'\\',-1));
--  set NEW.cat_img_name = concat(substr(NEW.cat_img_name,1,(INSTR(NEW.cat_img_name,SUBSTRING_INDEX(NEW.CAT_IMG_NAME,'\\',-1))-1)),yy);
 -- concat(NEW.CAT_CODE,SUBSTRING_INDEX(NEW.CAT_IMG_NAME,'\\',-1)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`categories_AFTER_INSERT` AFTER INSERT ON `categories` FOR EACH ROW
BEGIN
declare xx varchar(10) default 'EG0000001';
insert into shopbook.shop_categories(shop_cat_code,cat_code,shop_code,
cat_image_name,cat_image_type,notes, last_modified) values 
(concat(xx,NEW.cat_code),NEW.cat_code,xx,NEW.cat_img_name,NEW.cat_img_type,
new.notes, new.last_modified);

insert into shopbook.category_trees(cat_tree_code, parent_category,
child_category,level) values 
(concat('G0000',NEW.cat_code),'G0000',NEW.cat_code,'1');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`categories_AFTER_UPDATE` AFTER UPDATE ON `categories` FOR EACH ROW
BEGIN
update shopbook.shop_categories set
cat_image_name = new.cat_img_name,
cat_image_type = new.cat_img_type,
notes = new.notes,
last_modified = new.last_modified
where cat_code = old.cat_code;
update shopbook.shop_sub_cats set
shop_sub_cat_name = new.cat_name,
sub_cat_image_name = new.cat_img_name ,
sub_cat_image_type = new.cat_img_type ,
notes = new.notes,
last_modified = new.last_modified
where substring(shop_cat_code,10) = old.cat_code;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`categories_BEFORE_DELETE` BEFORE DELETE ON `categories` FOR EACH ROW
BEGIN
declare xx int default 0;
select count(*) into xx from shop_categories where 
shop_categories.cat_code = old.cat_code;
if xx > 0 then 
delete from shop_categories where 
shop_categories.cat_code = old.cat_code;
delete from category_trees where 
category_trees.child_category = old.cat_code;

end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `category_trees` VALUES ('G0000G0001',NULL,'1',NULL,'G0001','G0000'),('G0000G0002',NULL,'1',NULL,'G0002','G0000'),('G0000G0003',NULL,'1',NULL,'G0003','G0000'),('G0000G0004',NULL,'1',NULL,'G0004','G0000');
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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER="shopbook"@"localhost"*/ /*!50003 TRIGGER `shopbook`.`cities_BEFORE_INSERT` BEFORE INSERT ON `cities` FOR EACH ROW
BEGIN
    declare xx varchar(5) default null;
select MIN(c.start) FROM (
SELECT substr(a.city_CODE,2)+1 AS start
    FROM cities AS a, cities AS b
    WHERE substr(a.city_CODE,2) < substr(b.city_CODE,2)
    GROUP BY substr(a.city_CODE,2)
    HAVING start < MIN(substr(b.city_CODE,2)) ) c into xx;
  if xx is null then
select COALESCE(max(substr(cities.city_CODE,2)),0) +1 into xx
FROM cities;
end IF;
select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0000',xx)
  WHEN  LENGTH(xx) = 2 
      then concat('000',xx)
  WHEN  LENGTH(xx) = 3 
      then concat('00',xx)
  WHEN  LENGTH(xx) = 4 
      then concat('0',xx)
  ELSE  xx END
  into xx;              
  SET NEW.city_CODE = CONCAT('C',XX);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `countries` VALUES ('AD','Andorra',376,'Euro','€','EUR','AND',NULL,'N','N'),('AE','United Arab Emirates',971,'United Arab Emirates','د.إ','AED','ARE',NULL,'N','N'),('AF','Afghanistan',93,'Afghan afghani','؋','AFN','AFG',NULL,'N','N'),('AG','Antigua And Barbuda',1268,'East Caribbean dolla','$','XCD','ATG',NULL,'N','N'),('AI','Anguilla',1264,'East Caribbean dolla','$','XCD','AIA',NULL,'N','N'),('AL','Albania',355,'Albanian lek','L','ALL','ALB',NULL,'N','N'),('AM','Armenia',374,'Armenian dram','','AMD','ARM',NULL,'N','N'),('AN','Netherlands Antilles',599,'','','',NULL,NULL,'N','N'),('AO','Angola',244,'Angolan kwanza','Kz','AOA','AGO',NULL,'N','N'),('AQ','Antarctica',0,'','','','ATA',NULL,'N','N'),('AR','Argentina',54,'Argentine peso','$','ARS','ARG',NULL,'N','N'),('AS','American Samoa',1684,'','','','ASM',NULL,'N','N'),('AT','Austria',43,'Euro','€','EUR','AUT',NULL,'N','N'),('AU','Australia',61,'Australian dollar','$','AUD','AUS',NULL,'N','N'),('AW','Aruba',297,'Aruban florin','ƒ','AWG','ABW',NULL,'N','N'),('AZ','Azerbaijan',994,'Azerbaijani manat','','AZN','AZE',NULL,'N','N'),('BA','Bosnia and Herzegovina',387,'Bosnia and Herzegovi','KM or КМ','BAM','BIH',NULL,'N','N'),('BB','Barbados',1246,'Barbadian dollar','$','BBD','BRB',NULL,'N','N'),('BD','Bangladesh',880,'Bangladeshi taka','৳','BDT','BGD',NULL,'N','N'),('BE','Belgium',32,'Euro','€','EUR','BEL',NULL,'N','N'),('BF','Burkina Faso',226,'West African CFA fra','Fr','XOF','BFA',NULL,'N','N'),('BG','Bulgaria',359,'Bulgarian lev','лв','BGN','BGR',NULL,'N','N'),('BH','Bahrain',973,'Bahraini dinar','.د.ب','BHD','BHR',NULL,'N','N'),('BI','Burundi',257,'Burundian franc','Fr','BIF','BDI',NULL,'N','N'),('BJ','Benin',229,'West African CFA fra','Fr','XOF','BEN',NULL,'N','N'),('BM','Bermuda',1441,'Bermudian dollar','$','BMD','BMU',NULL,'N','N'),('BN','Brunei',673,'Brunei dollar','$','BND','BRN',NULL,'N','N'),('BO','Bolivia',591,'Bolivian boliviano','Bs.','BOB','BOL',NULL,'N','N'),('BR','Brazil',55,'Brazilian real','R$','BRL','BRA',NULL,'N','N'),('BS','Bahamas The',1242,'','','','BHS',NULL,'N','N'),('BT','Bhutan',975,'Bhutanese ngultrum','Nu.','BTN','BTN',NULL,'N','N'),('BV','Bouvet Island',0,'','','','BVT',NULL,'N','N'),('BW','Botswana',267,'Botswana pula','P','BWP','BWA',NULL,'N','N'),('BY','Belarus',375,'Belarusian ruble','Br','BYR','BLR',NULL,'N','N'),('BZ','Belize',501,'Belize dollar','$','BZD','BLZ',NULL,'N','N'),('CA','Canada',1,'Canadian dollar','$','CAD','CAN',NULL,'N','N'),('CC','Cocos (Keeling) Islands',672,'Australian dollar','$','AUD','CCK',NULL,'N','N'),('CD','Congo The Democratic Republic Of The',242,'','','','COD',NULL,'N','N'),('CF','Central African Republic',236,'Central African CFA ','Fr','XAF','CAF',NULL,'N','N'),('CG','Congo',242,'','','','COG',NULL,'N','N'),('CH','Switzerland',41,'Swiss franc','Fr','CHF','CHE',NULL,'N','N'),('CI','Cote D\'Ivoire (Ivory Coast)',225,'','','','CIV',NULL,'N','N'),('CK','Cook Islands',682,'New Zealand dollar','$','NZD','COK',NULL,'N','N'),('CL','Chile',56,'Chilean peso','$','CLP','CHL',NULL,'N','N'),('CM','Cameroon',237,'Central African CFA ','Fr','XAF','CMR',NULL,'N','N'),('CN','China',86,'Chinese yuan','¥ or 元','CNY','CHN',NULL,'N','N'),('CO','Colombia',57,'Colombian peso','$','COP','COL',NULL,'N','N'),('CR','Costa Rica',506,'Costa Rican colón','₡','CRC','CRI',NULL,'N','N'),('CU','Cuba',53,'Cuban convertible pe','$','CUC','CUB',NULL,'N','N'),('CV','Cape Verde',238,'Cape Verdean escudo','Esc or $','CVE','CPV',NULL,'N','N'),('CX','Christmas Island',61,'','','','CXR',NULL,'N','N'),('CY','Cyprus',357,'Euro','€','EUR','CYP',NULL,'N','N'),('CZ','Czech Republic',420,'Czech koruna','Kč','CZK','CZE',NULL,'N','N'),('DE','Germany',49,'Euro','€','EUR','DEU',NULL,'N','N'),('DJ','Djibouti',253,'Djiboutian franc','Fr','DJF','DJI',NULL,'N','N'),('DK','Denmark',45,'Danish krone','kr','DKK','DNK',NULL,'N','N'),('DM','Dominica',1767,'East Caribbean dolla','$','XCD','DMA',NULL,'N','N'),('DO','Dominican Republic',1809,'Dominican peso','$','DOP','DOM',NULL,'N','N'),('DZ','Algeria',213,'Algerian dinar','د.ج','DZD','DZA',NULL,'N','N'),('EC','Ecuador',593,'United States dollar','$','USD','ECU',NULL,'N','N'),('EE','Estonia',372,'Euro','€','EUR','EST',NULL,'N','N'),('EG','Egypt',20,'Egyptian pound','£ or ج.م','EGP','EGY',NULL,'Y','Y'),('EH','Western Sahara',212,'','','','ESH',NULL,'N','N'),('ER','Eritrea',291,'Eritrean nakfa','Nfk','ERN','ERI',NULL,'N','N'),('ES','Spain',34,'Euro','€','EUR','ESP',NULL,'N','N'),('ET','Ethiopia',251,'Ethiopian birr','Br','ETB','ETH',NULL,'N','N'),('FI','Finland',358,'Euro','€','EUR','FIN',NULL,'N','N'),('FJ','Fiji Islands',679,'','','','FJI',NULL,'N','N'),('FK','Falkland Islands',500,'Falkland Islands pou','£','FKP','FLK',NULL,'N','N'),('FM','Micronesia',691,'Micronesian dollar','$','','FSM',NULL,'N','N'),('FO','Faroe Islands',298,'Danish krone','kr','DKK','FRO',NULL,'N','N'),('FR','France',33,'Euro','€','EUR','FRA',NULL,'N','N'),('GA','Gabon',241,'Central African CFA ','Fr','XAF','GAB',NULL,'N','N'),('GB','United Kingdom',44,'British pound','£','GBP','GBR',NULL,'N','N'),('GD','Grenada',1473,'East Caribbean dolla','$','XCD','GRD',NULL,'N','N'),('GE','Georgia',995,'Georgian lari','ლ','GEL','GEO',NULL,'N','N'),('GF','French Guiana',594,'','','','GUF',NULL,'N','N'),('GH','Ghana',233,'Ghana cedi','₵','GHS','GHA',NULL,'N','N'),('GI','Gibraltar',350,'Gibraltar pound','£','GIP','GIB',NULL,'N','N'),('GL','Greenland',299,'','','','GRL',NULL,'N','N'),('GM','Gambia The',220,'','','','GMB',NULL,'N','N'),('GN','Guinea',224,'Guinean franc','Fr','GNF','GIN',NULL,'N','N'),('GP','Guadeloupe',590,'','','','GLP',NULL,'N','N'),('GQ','Equatorial Guinea',240,'Central African CFA ','Fr','XAF','GNQ',NULL,'N','N'),('GR','Greece',30,'Euro','€','EUR','GRC',NULL,'N','N'),('GS','South Georgia',0,'','','','SGS',NULL,'N','N'),('GT','Guatemala',502,'Guatemalan quetzal','Q','GTQ','GTM',NULL,'N','N'),('GU','Guam',1671,'','','','GUM',NULL,'N','N'),('GW','Guinea-Bissau',245,'West African CFA fra','Fr','XOF','GNB',NULL,'N','N'),('GY','Guyana',592,'Guyanese dollar','$','GYD','GUY',NULL,'N','N'),('HK','Hong Kong S.A.R.',852,'','','','HKG',NULL,'N','N'),('HM','Heard and McDonald Islands',0,'','','','HMD',NULL,'N','N'),('HN','Honduras',504,'Honduran lempira','L','HNL','HND',NULL,'N','N'),('HR','Croatia (Hrvatska)',385,'','','','HRV',NULL,'N','N'),('HT','Haiti',509,'Haitian gourde','G','HTG','HTI',NULL,'N','N'),('HU','Hungary',36,'Hungarian forint','Ft','HUF','HUN',NULL,'N','N'),('ID','Indonesia',62,'Indonesian rupiah','Rp','IDR','IDN',NULL,'N','N'),('IE','Ireland',353,'Euro','€','EUR','IRL',NULL,'N','N'),('IL','Israel',972,'Israeli new shekel','₪','ILS','ISR',NULL,'N','N'),('IN','India',91,'Indian rupee','₹','INR','IND',NULL,'N','N'),('IO','British Indian Ocean Territory',246,'United States dollar','$','USD','IOT',NULL,'N','N'),('IQ','Iraq',964,'Iraqi dinar','ع.د','IQD','IRQ',NULL,'N','N'),('IR','Iran',98,'Iranian rial','﷼','IRR','IRN',NULL,'N','N'),('IS','Iceland',354,'Icelandic króna','kr','ISK','ISL',NULL,'N','N'),('IT','Italy',39,'Euro','€','EUR','ITA',NULL,'N','N'),('JM','Jamaica',1876,'Jamaican dollar','$','JMD','JAM',NULL,'N','N'),('JO','Jordan',962,'Jordanian dinar','د.ا','JOD','JOR',NULL,'N','N'),('JP','Japan',81,'Japanese yen','¥','JPY','JPN',NULL,'N','N'),('KE','Kenya',254,'Kenyan shilling','Sh','KES','KEN',NULL,'N','N'),('KG','Kyrgyzstan',996,'Kyrgyzstani som','лв','KGS','KGZ',NULL,'N','N'),('KH','Cambodia',855,'Cambodian riel','៛','KHR','KHM',NULL,'N','N'),('KI','Kiribati',686,'Australian dollar','$','AUD','KIR',NULL,'N','N'),('KM','Comoros',269,'Comorian franc','Fr','KMF','COM',NULL,'N','N'),('KN','Saint Kitts And Nevis',1869,'East Caribbean dolla','$','XCD','KNA',NULL,'N','N'),('KP','Korea North',850,'','','','PRK',NULL,'N','N'),('KR','Korea South',82,'','','','KOR',NULL,'N','N'),('KW','Kuwait',965,'Kuwaiti dinar','د.ك','KWD','KWT',NULL,'N','N'),('KY','Cayman Islands',1345,'Cayman Islands dolla','$','KYD','CYM',NULL,'N','N'),('KZ','Kazakhstan',7,'Kazakhstani tenge','','KZT','KAZ',NULL,'N','N'),('LA','Laos',856,'Lao kip','₭','LAK','LAO',NULL,'N','N'),('LB','Lebanon',961,'Lebanese pound','ل.ل','LBP','LBN',NULL,'N','N'),('LC','Saint Lucia',1758,'East Caribbean dolla','$','XCD','LCA',NULL,'N','N'),('LI','Liechtenstein',423,'Swiss franc','Fr','CHF','LIE',NULL,'N','N'),('LK','Sri Lanka',94,'Sri Lankan rupee','Rs or රු','LKR','LKA',NULL,'N','N'),('LR','Liberia',231,'Liberian dollar','$','LRD','LBR',NULL,'N','N'),('LS','Lesotho',266,'Lesotho loti','L','LSL','LSO',NULL,'N','N'),('LT','Lithuania',370,'Euro','€','EUR','LTU',NULL,'N','N'),('LU','Luxembourg',352,'Euro','€','EUR','LUX',NULL,'N','N'),('LV','Latvia',371,'Euro','€','EUR','LVA',NULL,'N','N'),('LY','Libya',218,'Libyan dinar','ل.د','LYD','LBY',NULL,'N','N'),('MA','Morocco',212,'Moroccan dirham','د.م.','MAD','MAR',NULL,'N','N'),('MC','Monaco',377,'Euro','€','EUR','MCO',NULL,'N','N'),('MD','Moldova',373,'Moldovan leu','L','MDL','MDA',NULL,'N','N'),('MG','Madagascar',261,'Malagasy ariary','Ar','MGA','MDG',NULL,'N','N'),('MH','Marshall Islands',692,'United States dollar','$','USD','MHL',NULL,'N','N'),('MK','Macedonia',389,'','','','MKD',NULL,'N','N'),('ML','Mali',223,'West African CFA fra','Fr','XOF','MLI',NULL,'N','N'),('MM','Myanmar',95,'Burmese kyat','Ks','MMK','MMR',NULL,'N','N'),('MN','Mongolia',976,'Mongolian tögrög','₮','MNT','MNG',NULL,'N','N'),('MO','Macau S.A.R.',853,'','','','MAC',NULL,'N','N'),('MP','Northern Mariana Islands',1670,'','','','MNP',NULL,'N','N'),('MQ','Martinique',596,'','','','MTQ',NULL,'N','N'),('MR','Mauritania',222,'Mauritanian ouguiya','UM','MRO','MRT',NULL,'N','N'),('MS','Montserrat',1664,'East Caribbean dolla','$','XCD','MSR',NULL,'N','N'),('MT','Malta',356,'Euro','€','EUR','MLT',NULL,'N','N'),('MU','Mauritius',230,'Mauritian rupee','₨','MUR','MUS',NULL,'N','N'),('MV','Maldives',960,'Maldivian rufiyaa','.ރ','MVR','MDV',NULL,'N','N'),('MW','Malawi',265,'Malawian kwacha','MK','MWK','MWI',NULL,'N','N'),('MX','Mexico',52,'Mexican peso','$','MXN','MEX',NULL,'N','N'),('MY','Malaysia',60,'Malaysian ringgit','RM','MYR','MYS',NULL,'N','N'),('MZ','Mozambique',258,'Mozambican metical','MT','MZN','MOZ',NULL,'N','N'),('NA','Namibia',264,'Namibian dollar','$','NAD','NAM',NULL,'N','N'),('NC','New Caledonia',687,'CFP franc','Fr','XPF','NCL',NULL,'N','N'),('NE','Niger',227,'West African CFA fra','Fr','XOF','NER',NULL,'N','N'),('NF','Norfolk Island',672,'','','','NFK',NULL,'N','N'),('NG','Nigeria',234,'Nigerian naira','₦','NGN','NGA',NULL,'N','N'),('NI','Nicaragua',505,'Nicaraguan córdoba','C$','NIO','NIC',NULL,'N','N'),('NL','Netherlands The',31,'','','','NLD',NULL,'N','N'),('NO','Norway',47,'Norwegian krone','kr','NOK','NOR',NULL,'N','N'),('NP','Nepal',977,'Nepalese rupee','₨','NPR','NPL',NULL,'N','N'),('NR','Nauru',674,'Australian dollar','$','AUD','NRU',NULL,'N','N'),('NU','Niue',683,'New Zealand dollar','$','NZD','NIU',NULL,'N','N'),('NZ','New Zealand',64,'New Zealand dollar','$','NZD','NZL',NULL,'N','N'),('OM','Oman',968,'Omani rial','ر.ع.','OMR','OMN',NULL,'N','N'),('PA','Panama',507,'Panamanian balboa','B/.','PAB','PAN',NULL,'N','N'),('PE','Peru',51,'Peruvian nuevo sol','S/.','PEN','PER',NULL,'N','N'),('PF','French Polynesia',689,'CFP franc','Fr','XPF','PYF',NULL,'N','N'),('PG','Papua new Guinea',675,'Papua New Guinean ki','K','PGK','PNG',NULL,'N','N'),('PH','Philippines',63,'Philippine peso','₱','PHP','PHL',NULL,'N','N'),('PK','Pakistan',92,'Pakistani rupee','₨','PKR','PAK',NULL,'N','N'),('PL','Poland',48,'Polish złoty','zł','PLN','POL',NULL,'N','N'),('PM','Saint Pierre and Miquelon',508,'','','','SPM',NULL,'N','N'),('PN','Pitcairn Island',0,'','','','PCN',NULL,'N','N'),('PR','Puerto Rico',1787,'','','','PRI',NULL,'N','N'),('PS','Palestinian Territory Occupied',970,'','','','PSE',NULL,'N','N'),('PT','Portugal',351,'Euro','€','EUR','PRT',NULL,'N','N'),('PW','Palau',680,'Palauan dollar','$','','PLW',NULL,'N','N'),('PY','Paraguay',595,'Paraguayan guaraní','₲','PYG','PRY',NULL,'N','N'),('QA','Qatar',974,'Qatari riyal','ر.ق','QAR','QAT',NULL,'N','N'),('RE','Reunion',262,'','','','REU',NULL,'N','N'),('RO','Romania',40,'Romanian leu','lei','RON','ROU',NULL,'N','N'),('RS','Serbia',381,'Serbian dinar','дин. or din.','RSD','SRB',NULL,'N','N'),('RU','Russia',70,'Russian ruble','','RUB','RUS',NULL,'N','N'),('RW','Rwanda',250,'Rwandan franc','Fr','RWF','RWA',NULL,'N','N'),('SA','Saudi Arabia',966,'Saudi riyal','ر.س','SAR','SAU',NULL,'N','N'),('SB','Solomon Islands',677,'Solomon Islands doll','$','SBD','SLB',NULL,'N','N'),('SC','Seychelles',248,'Seychellois rupee','₨','SCR','SYC',NULL,'N','N'),('SD','Sudan',249,'Sudanese pound','ج.س.','SDG','SDN',NULL,'N','N'),('SE','Sweden',46,'Swedish krona','kr','SEK','SWE',NULL,'N','N'),('SG','Singapore',65,'Brunei dollar','$','BND','SGP',NULL,'N','N'),('SH','Saint Helena',290,'Saint Helena pound','£','SHP','SHN',NULL,'N','N'),('SI','Slovenia',386,'Euro','€','EUR','SVN',NULL,'N','N'),('SJ','Svalbard And Jan Mayen Islands',47,'','','','SJM',NULL,'N','N'),('SK','Slovakia',421,'Euro','€','EUR','SVK',NULL,'N','N'),('SL','Sierra Leone',232,'Sierra Leonean leone','Le','SLL','SLE',NULL,'N','N'),('SM','San Marino',378,'Euro','€','EUR','SMR',NULL,'N','N'),('SN','Senegal',221,'West African CFA fra','Fr','XOF','SEN',NULL,'N','N'),('SO','Somalia',252,'Somali shilling','Sh','SOS','SOM',NULL,'N','N'),('SR','Suriname',597,'Surinamese dollar','$','SRD','SUR',NULL,'N','N'),('SS','South Sudan',211,'South Sudanese pound','£','SSP','SSD',NULL,'N','N'),('ST','Sao Tome and Principe',239,'São Tomé and Príncip','Db','STD','STP',NULL,'N','N'),('SV','El Salvador',503,'United States dollar','$','USD','SLV',NULL,'N','N'),('SY','Syria',963,'Syrian pound','£ or ل.س','SYP','SYR',NULL,'N','N'),('SZ','Swaziland',268,'Swazi lilangeni','L','SZL','SWZ',NULL,'N','N'),('TC','Turks And Caicos Islands',1649,'United States dollar','$','USD','TCA',NULL,'N','N'),('TD','Chad',235,'Central African CFA ','Fr','XAF','TCD',NULL,'N','N'),('TF','French Southern Territories',0,'','','','ATF',NULL,'N','N'),('TG','Togo',228,'West African CFA fra','Fr','XOF','TGO',NULL,'N','N'),('TH','Thailand',66,'Thai baht','฿','THB','THA',NULL,'N','N'),('TJ','Tajikistan',992,'Tajikistani somoni','ЅМ','TJS','TJK',NULL,'N','N'),('TK','Tokelau',690,'','','','TKL',NULL,'N','N'),('TM','Turkmenistan',7370,'Turkmenistan manat','m','TMT','TKM',NULL,'N','N'),('TN','Tunisia',216,'Tunisian dinar','د.ت','TND','TUN',NULL,'N','N'),('TO','Tonga',676,'Tongan paʻanga','T$','TOP','TON',NULL,'N','N'),('TP','East Timor',670,'United States dollar','$','USD',NULL,NULL,'N','N'),('TR','Turkey',90,'Turkish lira','','TRY','TUR',NULL,'N','N'),('TT','Trinidad And Tobago',1868,'Trinidad and Tobago ','$','TTD','TTO',NULL,'N','N'),('TV','Tuvalu',688,'Australian dollar','$','AUD','TUV',NULL,'N','N'),('TW','Taiwan',886,'New Taiwan dollar','$','TWD','TWN',NULL,'N','N'),('TZ','Tanzania',255,'Tanzanian shilling','Sh','TZS','TZA',NULL,'N','N'),('UA','Ukraine',380,'Ukrainian hryvnia','₴','UAH','UKR',NULL,'N','N'),('UG','Uganda',256,'Ugandan shilling','Sh','UGX','UGA',NULL,'N','N'),('UM','United States Minor Outlying Islands',1,'','','','UMI',NULL,'N','N'),('US','United States',1,'United States dollar','$','USD','USA',NULL,'N','N'),('UY','Uruguay',598,'Uruguayan peso','$','UYU','URY',NULL,'N','N'),('UZ','Uzbekistan',998,'Uzbekistani som','','UZS','UZB',NULL,'N','N'),('VA','Vatican City State (Holy See)',39,'','','','VAT',NULL,'N','N'),('VC','Saint Vincent And The Grenadines',1784,'East Caribbean dolla','$','XCD','VCT',NULL,'N','N'),('VE','Venezuela',58,'Venezuelan bolívar','Bs F','VEF','VEN',NULL,'N','N'),('VG','Virgin Islands (British)',1284,'','','','VGB',NULL,'N','N'),('VI','Virgin Islands (US)',1340,'','','','VIR',NULL,'N','N'),('VN','Vietnam',84,'Vietnamese đồng','₫','VND','VNM',NULL,'N','N'),('VU','Vanuatu',678,'Vanuatu vatu','Vt','VUV','VUT',NULL,'N','N'),('WF','Wallis And Futuna Islands',681,'','','','WLF',NULL,'N','N'),('WS','Samoa',684,'Samoan tālā','T','WST','WSM',NULL,'N','N'),('XA','External Territories of Australia',61,'','','',NULL,NULL,'N','N'),('XG','Smaller Territories of the UK',44,'','','',NULL,NULL,'N','N'),('XJ','Jersey',44,'British pound','£','GBP',NULL,NULL,'N','N'),('XM','Man (Isle of)',44,'','','',NULL,NULL,'N','N'),('XU','Guernsey and Alderney',44,'','','',NULL,NULL,'N','N'),('YE','Yemen',967,'Yemeni rial','﷼','YER','YEM',NULL,'N','N'),('YT','Mayotte',269,'','','','MYT',NULL,'N','N'),('YU','Yugoslavia',38,'','','',NULL,NULL,'N','N'),('ZA','South Africa',27,'South African rand','R','ZAR','ZAF',NULL,'N','N'),('ZM','Zambia',260,'Zambian kwacha','ZK','ZMW','ZMB',NULL,'N','N'),('ZW','Zimbabwe',263,'Botswana pula','P','BWP','ZWE',NULL,'N','N');
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
INSERT INTO `country_lang_curr` VALUES ('EGar','ar','EG','ج.م'),('EGen','en','EG','EGP');
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
INSERT INTO `manufactures` VALUES ('F00000','Reserved','n/a','R','2019-07-11 20:10:04',NULL),('F00001','Manufacturer One',NULL,'A','2019-07-12 14:34:46',NULL),('F00002','Manufacturer Twoooo.',NULL,'I','2019-07-12 14:36:01',NULL),('F00003','Manufacturer Threeeee.',NULL,'I','2019-07-12 14:35:41',NULL),('F00004','Manufacturer Fourrrrrr.',NULL,'I','2019-10-05 17:50:54',NULL),('F00005','Manufacturer Five',NULL,'I','2019-10-05 17:51:14',NULL),('F00006','Manufacturer Sixxxxx.',NULL,'I','2019-10-05 17:51:24',NULL);
/*!40000 ALTER TABLE `manufactures` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `shopbook` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER shopbook.before_insert_manufacture_pK
	BEFORE INSERT
	ON shopbook.manufactures
	FOR EACH ROW
BEGIN
        declare xx varchar(5) default null;
select MIN(c.start) FROM (
SELECT substr(a.MNF_CODE,2)+1 AS start
    FROM manufactures AS a, manufactures AS b
    WHERE substr(a.MNF_CODE,2) < substr(b.MNF_CODE,2)
    GROUP BY substr(a.MNF_CODE,2)
    HAVING start < MIN(substr(b.MNF_CODE,2)) ) c into xx;
  if xx is null then
select COALESCE(max(substr(manufactures.MNF_CODE,2)),0) +1 into xx
FROM manufactures;
end IF;
select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0000',xx)
  WHEN  LENGTH(xx) = 2 
      then concat('000',xx)
  WHEN  LENGTH(xx) = 3 
      then concat('00',xx)
  WHEN  LENGTH(xx) = 4 
      then concat('0',xx)
  ELSE  xx END
  into xx;              
  SET NEW.MNF_CODE = CONCAT('F',XX);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `shopbook` CHARACTER SET utf8 COLLATE utf8_general_ci ;

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
INSERT INTO `models` VALUES ('M0000000','Reserved',NULL,'R','N/A',NULL,NULL),('M00000001','Model One',NULL,'A',NULL,'2019-07-12 14:49:16',NULL),('M00000002','Model Twoooooooooooooo',NULL,'I',NULL,'2019-07-12 14:51:19',NULL),('M00000003','Model Three',NULL,'I',NULL,'2019-07-12 14:50:56',NULL),('M00000004','Model Fourrrrrrr.',NULL,'A',NULL,'2019-10-05 17:51:50',NULL),('M00000005','Model Fiveeeeeeee.',NULL,'A','','2019-10-05 17:52:07',NULL);
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `shopbook` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER shopbook.before_insert_models_pK
	BEFORE INSERT
	ON shopbook.models
	FOR EACH ROW
BEGIN
          declare xx varchar(8) default null;
select MIN(c.start) FROM (
SELECT substr(a.MODEL_CODE,2)+1 AS start
    FROM models AS a, models AS b
    WHERE substr(a.MODEL_CODE,2) < substr(b.MODEL_CODE,2)
    GROUP BY substr(a.MODEL_CODE,2)
    HAVING start < MIN(substr(b.MODEL_CODE,2)) ) c into xx;
  if xx is null then
select COALESCE(max(substr(models.MODEL_CODE,2)),0) +1 into xx
FROM models;
end IF;
select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0000000',xx)
  WHEN  LENGTH(xx) = 2 
      then concat('000000',xx)
  WHEN  LENGTH(xx) = 3 
      then concat('00000',xx)
  WHEN  LENGTH(xx) = 4 
      then concat('0000',xx)
   WHEN  LENGTH(xx) = 5 
      then concat('000',xx)
   WHEN  LENGTH(xx) = 6 
      then concat('00',xx)
   WHEN  LENGTH(xx) = 7 
      then concat('0',xx)
  ELSE  xx END
  into xx;              
  SET NEW.MODEL_CODE = CONCAT('M',XX);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `shopbook` CHARACTER SET utf8 COLLATE utf8_general_ci ;

--
-- Table structure for table `offer_dets`
--

DROP TABLE IF EXISTS `offer_dets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_dets` (
  `OFFER_DET_ID` varchar(25) NOT NULL COMMENT 'UML to Offline Database Transform: Column OFFER_DET_ID created from UML attribute "offer det id" in UML class "offer det"',
  `OFFER_ID` varchar(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column OFFERS_TO_OFFER_DET created as default foreign key column for foreign key "OFFERS_TO_OFFER_DET"',
  `IMAGE_PATH` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_OFFER_DET created as default foreign key column for foreign key "SKU_TO_OFFER_DET"',
  `OFFER_DET_LINK` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column OFFER_DET_LINK created from UML attribute "offer det link" in UML class "offer det"',
  `OFFER_DET_TEXT` varchar(255) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column OFFER_DET_TEXT created from UML attribute "offer det text" in UML class "offer det"',
  `HIDE` varchar(1) DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column HIDE created from UML attribute "hide" in UML class "offer det"',
  `AVAILABLE` varchar(1) DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "offer det"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "offer det"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "offer det"',
  PRIMARY KEY (`OFFER_DET_ID`),
  KEY `OFFERS_TO_OFFER_DET` (`OFFER_ID`),
  KEY `OFFER_DETS_INDEX` (`OFFER_DET_ID`),
  CONSTRAINT `OFFERS_TO_OFFER_DET` FOREIGN KEY (`OFFER_ID`) REFERENCES `offers` (`SHP_CODE_OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table OFFER_DETS created from UML class "offer det"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint OFFERS_TO_OFFER_DET created for UML association "offers to offer det"\r\nUML to Offline Database Transform: Foreign key constraint SKU_TO_OFFER_DET created for UML association "sku to offer det"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_dets`
--

LOCK TABLES `offer_dets` WRITE;
/*!40000 ALTER TABLE `offer_dets` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_dets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `SHP_CODE_OFFER_ID` varchar(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHP_CODE_OFFER_ID created from UML attribute "shp code offer id" in UML class "offer"',
  `OFFER_DT` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column OFFER_DT created from UML attribute "offer dt" in UML class "offer"',
  `OFFER_TITLE` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column OFFER_TITLE created from UML attribute "offer title" in UML class "offer"',
  `VALID_FRM_DATE` datetime DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column VALID_FRM_DATE created from UML attribute "valid frm date" in UML class "offer"',
  `VALID_TO_DATE` datetime DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column VALID_TO_DATE created from UML attribute "valid to date" in UML class "offer"',
  `SHOP_CODE` varchar(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_OFFERS created as default foreign key column for foreign key "SHOP_OFFERS"',
  `NOTES` varchar(500) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "offer"',
  PRIMARY KEY (`SHP_CODE_OFFER_ID`),
  KEY `SHOP_OFFERS` (`SHOP_CODE`),
  KEY `OFFERS_INDEX` (`SHP_CODE_OFFER_ID`),
  CONSTRAINT `SHOP_OFFERS` FOREIGN KEY (`SHOP_CODE`) REFERENCES `shops` (`SHOP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table OFFERS created from UML class "offer"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SHOP_OFFERS created for UML association "shop offers"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
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
INSERT INTO `permissions` VALUES ('EG0000001G0001','Cat One'),('EG0000001G0002','Category Two'),('EG0000001G0003','Cat Threeeeeeeeeeee.'),('EG0000001G0004','Category Fourrrrrrrrrrrrr.'),('EG0000001G0005','Category Five.'),('EG0000001G0006','Category Sixxxxxxxxxxxx.');
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
  `RATE` int(5) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column RATE created from UML attribute "rate" in UML class "post"',
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
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER="shopbook"@"localhost"*/ /*!50003 TRIGGER `shopbook`.`posts_BEFORE_INSERT` BEFORE INSERT ON `posts` FOR EACH ROW
BEGIN
set new.post_code = cast(current_timestamp() as unsigned);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `ID` varchar(5) NOT NULL,
  `ROLE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('A0000','Reserved'),('A0001','SysAdmin'),('C0000','Reserved'),('C0001','CatAdmin'),('C0002','CatAdmin'),('C0003','CatAdmin'),('U','User');
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
INSERT INTO `roles_permissions` VALUES ('C0001','EG0000001G0001'),('C0001','EG0000001G0002'),('C0002','EG0000001G0003'),('C0003','EG0000001G0003'),('C0002','EG0000001G0004');
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
  `TXT` varchar(500) NOT NULL COMMENT 'UML to Offline Database Transform: Column TXT created from UML attribute "txt" in UML class "ship rtrn policy"',
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
INSERT INTO `ship_rtrn_policies` VALUES ('G0000','G','Reserved',0,'N','2020-06-10 15:20:28','V',0.00,NULL,NULL,NULL),('G0001','G','Test First ',NULL,'Y','2020-06-11 10:23:42','V',0.00,NULL,'Term One',NULL),('G0002','G','Test Second-1111',NULL,'Y','2020-06-11 10:25:22','V',0.00,NULL,'Term Two',NULL),('G0003','G','Test Third',NULL,'Y','2020-06-11 10:24:31','V',0.00,NULL,'Term Three',NULL),('G0004','G','Forth General Term Term -11111',NULL,'Y','2020-06-11 14:26:25','N',0.00,NULL,'Term Four',NULL),('R0000','R','Reserved',0,'N','2020-06-10 15:29:51','V',0.00,NULL,NULL,NULL),('R0001','R','First Return Term -11111.........................................................',NULL,'Y','2020-06-11 10:30:07','V',0.00,'C00003','Return Policy one',NULL),('R0002','R','Second Return Term,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,',NULL,'Y','2020-06-11 10:30:44','V',50.00,NULL,'Return Policy Two',NULL),('R0003','R','Third Return Term!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!',NULL,'Y','2020-06-11 10:30:44','P',12.00,'C00004','Return Policy Three.',NULL),('R0004','R','Fourth Return Term -111',NULL,'Y','2020-06-11 14:25:31','V',0.00,NULL,NULL,NULL),('S0000','S','Reserved',0,'N','2020-06-10 15:25:45','V',0.00,NULL,NULL,NULL),('S0001','S','Shipping First Term -00000',1,'Y','2020-06-11 10:36:53','V',5.25,'C00005','Standard Shipping',''),('S0002','S','Shipping Second Term',2,'Y','2020-06-11 10:36:53','N',0.00,'C00003','Next Day Shipping',NULL),('S0003','S','Shipping Third Term.......................................................................................................................................................................................................................................',3,'Y','2020-06-11 10:36:53','V',100.00,'C00004','Same day shipping','Y'),('S0004','S','CCCCCCCCCCCCCCCCCCCDDDDDDDDDDDDDDDDDDDDDFFFFFFFFFFFFFFRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR',4,'N','2020-06-11 14:30:00','V',0.00,'C00004','Pickup from nearest Branch',NULL);
/*!40000 ALTER TABLE `ship_rtrn_policies` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER="shopbook"@"localhost"*/ /*!50003 TRIGGER `shopbook`.`ship_rtrn_policies_BEFORE_INSERT` BEFORE INSERT ON `ship_rtrn_policies` FOR EACH ROW
BEGIN
declare g_xx varchar(5) default null;
declare r_xx varchar(5) default null;
declare s_xx varchar(5) default null;
if (new.type = 'G' ) then
select MIN(c.start) FROM (
SELECT substr(a.CODE,2)+1 AS start
    FROM ship_rtrn_policies AS a, ship_rtrn_policies AS b
    WHERE substr(a.CODE,2) < substr(b.CODE,2) 
    and a.type = b.type
    and a.type = 'G'
    GROUP BY substr(a.CODE,2)
    HAVING start < MIN(substr(b.CODE,2)) ) c into g_xx;
  if g_xx is null then
select COALESCE(max(substr(ship_rtrn_policies.CODE,2)),0) +1 into g_xx
FROM ship_rtrn_policies where type = 'G';
end IF; 
 select case 
  WHEN  LENGTH(g_xx) = 1 
      then concat('000',g_xx)
  WHEN  LENGTH(g_xx) = 2 
      then concat('00',g_xx)
  WHEN  LENGTH(g_xx) = 3 
      then concat('0',g_xx)
  ELSE  g_xx END
  into g_xx;              
  SET NEW.CODE = CONCAT('G',g_XX); 
  
elseif (new.type = 'R' ) then
select MIN(c.start) FROM (
SELECT substr(a.CODE,2)+1 AS start
    FROM ship_rtrn_policies AS a, ship_rtrn_policies AS b
    WHERE substr(a.CODE,2) < substr(b.CODE,2) 
    and a.type = b.type
    and a.type = 'R'
    GROUP BY substr(a.CODE,2)
    HAVING start < MIN(substr(b.CODE,2)) ) c into r_xx;
  if r_xx is null then
select COALESCE(max(substr(ship_rtrn_policies.CODE,2)),0) +1 into r_xx
FROM ship_rtrn_policies where type = 'R';
end IF; 
 select case 
  WHEN  LENGTH(r_xx) = 1 
      then concat('000',r_xx)
  WHEN  LENGTH(r_xx) = 2 
      then concat('00',r_xx)
  WHEN  LENGTH(r_xx) = 3 
      then concat('0',r_xx)
  ELSE  r_xx END
  into r_xx;              
  SET NEW.CODE = CONCAT('R',r_XX);  

elseif (new.type = 'S' ) then
select MIN(c.start) FROM (
SELECT substr(a.CODE,2)+1 AS start
    FROM ship_rtrn_policies AS a, ship_rtrn_policies AS b
    WHERE substr(a.CODE,2) < substr(b.CODE,2) 
    and a.type = b.type
    and a.type = 'S'
    GROUP BY substr(a.CODE,2)
    HAVING start < MIN(substr(b.CODE,2)) ) c into s_xx;
  if s_xx is null then
select COALESCE(max(substr(ship_rtrn_policies.CODE,2)),0) +1 into s_xx
FROM ship_rtrn_policies where type = 'S';
end IF; 
 select case 
  WHEN  LENGTH(s_xx) = 1 
      then concat('000',s_xx)
  WHEN  LENGTH(s_xx) = 2 
      then concat('00',s_xx)
  WHEN  LENGTH(s_xx) = 3 
      then concat('0',s_xx)
  ELSE  s_xx END
  into s_xx;              
  SET NEW.CODE = CONCAT('S',s_XX); 

end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `shop_categories` VALUES ('EG0000001G0001','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/210707_232531.jpeg','.jpeg','G0001','EG0000001',NULL,'2021-07-07 17:47:18'),('EG0000001G0002','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/210707_175018.jpeg','.jpeg','G0002','EG0000001',NULL,'2021-07-07 17:49:19'),('EG0000001G0003','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/210707_232552.jpeg','.jpeg','G0003','EG0000001',NULL,'2021-07-07 23:25:41'),('EG0000001G0004','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/210707_232623.jpeg','.jpeg','G0004','EG0000001',NULL,'2021-07-07 23:26:13');
/*!40000 ALTER TABLE `shop_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`shop_categories_AFTER_INSERT` AFTER INSERT ON `shop_categories` FOR EACH ROW
BEGIN
insert into shop_sub_cats (shop_sub_cat_code, shop_sub_cat_name, 
sub_cat_image_name,sub_cat_image_type, shop_cat_code, notes, last_modified) 
values 
(concat(new.shop_cat_code,substring(new.shop_cat_code,11)),
(select cat_name from categories where cat_code = new.cat_code),
new.cat_image_name, new.cat_image_type,new.shop_cat_code,
new.notes, new.last_modified);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`shop_categories_BEFORE_DELETE` BEFORE DELETE ON `shop_categories` FOR EACH ROW
BEGIN
delete from shop_sub_cats where shop_cat_code = old.shop_cat_code;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
/*!40000 ALTER TABLE `shop_sub_cat_prop_class_dets` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`shop_sub_cat_prop_class_dets_BEFORE_INSERT` BEFORE INSERT ON `shop_sub_cat_prop_class_dets` FOR EACH ROW
BEGIN
declare xx varchar(2) default 0;
declare det_exist int(2) default 0;
select MIN(c.start) FROM (
SELECT substr(a.shp_subcat_prp_cls_det_code,24)+1 AS start
    FROM shop_sub_cat_prop_class_dets AS a, shop_sub_cat_prop_class_dets AS b
    WHERE  a.prop_CLASS_CODE = New.prop_class_code
    and   substr(a.shp_subcat_prp_cls_det_code,24) < substr(b.shp_subcat_prp_cls_det_code,24)
    GROUP BY substr(a.shp_subcat_prp_cls_det_code,24)
    HAVING start < MIN(substr(b.shp_subcat_prp_cls_det_code,24)) ) c into xx;
 select count(*) into det_exist from shop_sub_cat_prop_class_dets 
    where prop_CLASS_CODE = New.prop_CLASS_CODE;
if (xx is null and det_exist > 0) then
select COALESCE(max(substr(shop_sub_cat_prop_class_dets.shp_subcat_prp_cls_det_code,24)),0) +1 into xx
FROM shop_sub_cat_prop_class_dets where prop_CLASS_CODE = NEW.prop_CLASS_CODE;
select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0',xx)
  ELSE  xx END
  into xx; 
  /*set xx = concat('D',xx);*/
  SET NEW.shp_subcat_prp_cls_det_code = concat(NEW.prop_CLASS_CODE,'D',xx);
  elseif (xx is not null and det_exist > 0) then
   select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0',xx)
  ELSE  xx END
  into xx; 
  /*set xx = concat('D',xx);*/
  SET NEW.shp_subcat_prp_cls_det_code = concat(NEW.prop_CLASS_CODE,'D',xx);
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `shop_sub_cat_prop_classes` VALUES ('EG0000001G00010001P000','Reserved','EG0000001G00010001','2021-07-07 17:47:27',''),('EG0000001G00020002P000','Reserved','EG0000001G00020002','2021-07-07 17:50:33',''),('EG0000001G00030003P000','Reserved','EG0000001G00030003','2021-07-07 23:26:07',''),('EG0000001G00040004P000','Reserved','EG0000001G00040004','2021-07-07 23:26:50','');
/*!40000 ALTER TABLE `shop_sub_cat_prop_classes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`shop_sub_cat_prop_classes_BEFORE_INSERT` BEFORE INSERT ON `shop_sub_cat_prop_classes` FOR EACH ROW
BEGIN
declare xx varchar(3) default 0;
declare det_exist varchar(3) default 0;
select count(*) into det_exist from shop_sub_cat_prop_classes
where SHOP_SUB_CAT_CODE = new.SHOP_SUB_CAT_CODE;
if det_exist > 0 then
 select MIN(c.start) FROM (
SELECT substr(a.SHP_SUB_CAT_PRP_CLS_CODE,20)+1 AS start
    FROM shop_sub_cat_prop_classes AS a, shop_sub_cat_prop_classes AS b
    WHERE a.SHOP_SUB_CAT_CODE = new.SHOP_SUB_CAT_CODE
    and a.SHOP_SUB_CAT_CODE = b.SHOP_SUB_CAT_CODE
    and substr(a.SHP_SUB_CAT_PRP_CLS_CODE,20) < substr(b.SHP_SUB_CAT_PRP_CLS_CODE,20)
    GROUP BY substr(a.SHP_SUB_CAT_PRP_CLS_CODE,20)
    HAVING start < MIN(substr(b.SHP_SUB_CAT_PRP_CLS_CODE,20)) ) c into xx;
     if (xx is null) then
select COALESCE(max(substr(shop_sub_cat_prop_classes.SHP_SUB_CAT_PRP_CLS_CODE,20)),0) +1 into xx
FROM shop_sub_cat_prop_classes 
WHERE shop_sub_cat_prop_classes.SHOP_SUB_CAT_CODE = new.SHOP_SUB_CAT_CODE;
end if;
select case 
  WHEN  LENGTH(xx) = 1 
      then concat('00',xx)
  WHEN  LENGTH(xx) = 2
      then concat('0',xx)
  ELSE  xx END
  into xx; 
  SET NEW.SHP_SUB_CAT_PRP_CLS_CODE = concat(new.shop_sub_cat_code,'P',xx);
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`shop_sub_cat_prop_classes_AFTER_INSERT` AFTER INSERT ON `shop_sub_cat_prop_classes` FOR EACH ROW
BEGIN
if (substr(new.shp_sub_cat_prp_cls_code,20) != '000') then
insert into shop_sub_cat_prop_class_dets (shp_subcat_prp_cls_det_code,
prop_cls_det_name, prop_class_code,notes) values 
(concat(new.shp_sub_cat_prp_cls_code,'D00'),'Reserved',
 new.shp_sub_cat_prp_cls_code,'n/a');
 end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`shop_sub_cat_prop_classes_BEFORE_DELETE` BEFORE DELETE ON `shop_sub_cat_prop_classes` FOR EACH ROW
BEGIN
declare det_exist varchar(3) default 0;
select count(*) into det_exist from shop_sub_cat_prop_class_dets
where prop_class_code = old.shp_sub_cat_prp_cls_code;
if det_exist = 1 then 
delete from shop_sub_cat_prop_class_dets
where prop_class_code = old.shp_sub_cat_prp_cls_code;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `shop_sub_cats` VALUES ('EG0000001G00010001','Furniture','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/210707_232531.jpeg','.jpeg','EG0000001G0001',NULL,'2021-07-07 17:47:18'),('EG0000001G00020002','Men Fashion','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/210707_175018.jpeg','.jpeg','EG0000001G0002',NULL,'2021-07-07 17:49:19'),('EG0000001G00030003','Laptops','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/210707_232552.jpeg','.jpeg','EG0000001G0003',NULL,'2021-07-07 23:25:41'),('EG0000001G00040004','Household Appliances','/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/Categories/210707_232623.jpeg','.jpeg','EG0000001G0004',NULL,'2021-07-07 23:26:13');
/*!40000 ALTER TABLE `shop_sub_cats` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER="shopbook"@"localhost"*/ /*!50003 TRIGGER `shopbook`.`shop_sub_cats_AFTER_INSERT` AFTER INSERT ON `shop_sub_cats` FOR EACH ROW
BEGIN
insert into shopbook.shop_sub_cat_prop_classes (shp_sub_cat_prp_cls_code,
shp_sub_cat_prp_cls_name, shop_sub_cat_code, notes) values
( concat(new.shop_sub_cat_code,'P000'), 'Reserved', 
new.shop_sub_cat_code,'');
insert into shopbook.skus (sku_code, sku_name,SHOP_CAT_SUB_CODE) values
( concat(new.shop_sub_cat_code,'S0000'), 'Reserved',new.shop_sub_cat_code);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`shop_sub_cats_BEFORE_DELETE` BEFORE DELETE ON `shop_sub_cats` FOR EACH ROW
BEGIN
declare det_exist varchar(3) default 0;
select count(*) into det_exist from shop_sub_cat_prop_classes
where shop_sub_cat_code = old.shop_sub_cat_code;
if det_exist = 1 then
delete from shop_sub_cat_prop_classes 
where shop_sub_cat_code = old.shop_sub_cat_code;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `QTY` int(3) DEFAULT '0' COMMENT 'UML to Offline Database Transform: Column QTY created from UML attribute "qty" in UML class "shopping det"',
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
/*!40000 ALTER TABLE `shopping_det` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER="shopbook"@"localhost"*/ /*!50003 TRIGGER `shopbook`.`shopping_det_BEFORE_INSERT` BEFORE INSERT ON `shopping_det` FOR EACH ROW
BEGIN
declare pSkuName varchar(100);
declare pClrName varchar(100);
declare pSizeName varchar(100);
declare pUnitName varchar(100);
	select clr_name into pClrName from sku_colors
				where sku_clr_code = new.sku_clr_code;
	select sku_name into pSkuName from skus
				where sku_code = substring(new.sku_clr_code,1,23);
	select sz_det_name into pSizeName from size_class_dets
				where sz_det_code = new.size_code;
	select unit_name into pUnitName from units
				where from_unit = new.unit_code;
set new.clr_name = pClrName;
set new.size_name = pSizeName;
set new.sku_name = pSkuName;
set new.unit_name = pUnitName;                
set new.total_price = new.qty * new.unit_price;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER="shopbook"@"localhost"*/ /*!50003 TRIGGER `shopbook`.`shopping_det_AFTER_INSERT` AFTER INSERT ON `shopping_det` FOR EACH ROW
BEGIN
update shopping_master set
trans_value = (select sum(total_price) from shopping_det 
				where trans_id = new.trans_id)
where trans_id = new.trans_id; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER="shopbook"@"localhost"*/ /*!50003 TRIGGER `shopbook`.`shopping_det_BEFORE_UPDATE` BEFORE UPDATE ON `shopping_det` FOR EACH ROW
BEGIN
if (old.qty != new.qty or old.unit_price != new.unit_price) then
set new.total_price = new.qty * new.unit_price;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER="shopbook"@"localhost"*/ /*!50003 TRIGGER `shopbook`.`shopping_det_AFTER_UPDATE` AFTER UPDATE ON `shopping_det` FOR EACH ROW
BEGIN
update shopping_master set
trans_value = (select sum(total_price) from shopping_det 
				where trans_id = new.trans_id)
where trans_id = new.trans_id;                
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shopping_master`
--

DROP TABLE IF EXISTS `shopping_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_master` (
  `TRANS_ID` varchar(30) NOT NULL COMMENT 'UML to Offline Database Transform: Column TRANS_ID created from UML attribute "trans id" in UML class "shopping master"',
  `TRANS_DATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column TRANS_DATE_TIME created from UML attribute "trans date time" in UML class "shopping master"',
  `TRANS_VALUE` int(11) DEFAULT '0' COMMENT 'UML to Offline Database Transform: Column TRANS_VALUE created from UML attribute "trans value" in UML class "shopping master"',
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
  CONSTRAINT `areas_shopping_mast_fk` FOREIGN KEY (`AREA_CODE`) REFERENCES `cities` (`city_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cities_shopping_mast_fk` FOREIGN KEY (`CITY_CODE`) REFERENCES `cities` (`city_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `country_shopping_mast_fk` FOREIGN KEY (`CNTRY_CODE2`) REFERENCES `countries` (`CNTRY_CODE2`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `shipp_shopping_master_fk` FOREIGN KEY (`SHIPP_CODE`) REFERENCES `ship_rtrn_policies` (`CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `shopping_mast_user` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table SHOPPING_MASTER created from UML class "shopping master"\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\nUML to Offline Database Transform: Foreign key constraint USER_TO_SHOPPING_MAST created for UML association "user to shopping mast"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_master`
--

LOCK TABLES `shopping_master` WRITE;
/*!40000 ALTER TABLE `shopping_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER="shopbook"@"localhost"*/ /*!50003 TRIGGER `shopbook`.`shopping_master_BEFORE_INSERT` BEFORE INSERT ON `shopping_master` FOR EACH ROW
BEGIN
set new.trans_id = cast(current_timestamp() as unsigned);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `shops` VALUES ('EG0000001','Shop Name.',NULL,NULL,NULL,'',NULL,NULL,'Egypt','0000000','/home/mfayed/Desktop/MyShop/shopData/rightImage.jpeg','/home/mfayed/Desktop/MyShop/shopData/logo.jpeg','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N','2019-08-05 22:46:54',5,1,'EG',NULL,NULL),('EG0000003','BBBBBBBBBB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'000000000\n000000000\n000000000',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y','2019-09-01 00:00:00',NULL,NULL,NULL,'EG0000001',NULL),('EG0000004','ABAB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11111111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y','2019-09-18 10:49:21',NULL,NULL,NULL,'EG0000001',NULL);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
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
INSERT INTO `size_class_dets` VALUES ('Z01D00','Reserved','Z01','n/a'),('Z01D01','S','Z01',NULL),('Z01D02','XS','Z01',NULL),('Z01D03','XXL','Z01',NULL),('Z01D04','M','Z01',NULL),('Z01D05','XXXL','Z01',NULL),('Z01D06','4XL','Z01',NULL),('Z02D00','Reserved','Z02','n/a'),('Z02D01','7 1/2 (40)','Z02',NULL),('Z02D02','8 (41)','Z02',NULL),('Z02D03','9 (42)','Z02',NULL),('Z02D04','8 1/2 (41.5)','Z02',NULL),('Z03D00','Reserved','Z03','n/a'),('Z03D01','each','Z03',NULL);
/*!40000 ALTER TABLE `size_class_dets` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `shopbook` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER shopbook.before_insert_sizeClassDet_pK
	BEFORE INSERT
	ON shopbook.size_class_dets
	FOR EACH ROW
begin
declare xx varchar(3) default 0;
declare det_exist int(2) default 0;
 select MIN(c.start) FROM (
SELECT substr(a.SZ_DET_CODE,5)+1 AS start
    FROM size_class_dets AS a, size_class_dets AS b
    WHERE  a.SZ_CLASS_CODE = New.sz_class_code
    and   substr(a.SZ_DET_CODE,5) < substr(b.SZ_DET_CODE,5)
    GROUP BY substr(a.SZ_DET_CODE,5)
    HAVING start < MIN(substr(b.SZ_DET_CODE,5)) ) c into xx;
 select count(*) into det_exist from size_class_dets 
    where SZ_CLASS_CODE = New.SZ_CLASS_CODE;
  if (xx is null and det_exist > 0) then
select COALESCE(max(substr(size_class_dets.sz_det_code,5)),0) +1 into xx
FROM size_class_dets where SZ_CLASS_CODE = NEW.SZ_CLASS_CODE;
  select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0',xx)
  ELSE  xx END
  into xx; 
  set xx = concat('D',xx);
  SET NEW.sz_det_code = concat(NEW.sz_class_code,xx);
  elseif (xx is not null and det_exist > 0) then
   select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0',xx)
  ELSE  xx END
  into xx; 
  set xx = concat('D',xx);
  SET NEW.sz_det_code = concat(NEW.sz_class_code,xx);
  end if;
  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `shopbook` CHARACTER SET utf8 COLLATE utf8_general_ci ;

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
INSERT INTO `size_classes` VALUES ('Z00','Reserved','n/a',NULL),('Z01','men fashion',NULL,'2019-08-17 10:58:12'),('Z02','shoeses',NULL,'2019-08-17 10:59:14'),('Z03','each',NULL,'2019-10-05 17:29:00');
/*!40000 ALTER TABLE `size_classes` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `shopbook` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER shopbook.before_insert_sizeClasses_pK
	BEFORE INSERT
	ON shopbook.size_classes
	FOR EACH ROW
begin
declare xx varchar(3) default 0;
 select MIN(c.start) FROM (
SELECT substr(a.SZ_CLASS_CODE,2)+1 AS start
    FROM size_classes AS a, size_classes AS b
    WHERE substr(a.SZ_CLASS_CODE,2) < substr(b.SZ_CLASS_CODE,2)
    GROUP BY substr(a.SZ_CLASS_CODE,2)
    HAVING start < MIN(substr(b.SZ_CLASS_CODE,2)) ) c into xx;

  if (xx is null) then
select COALESCE(max(substr(size_classes.SZ_CLASS_CODE,2)),0) +1 into xx
FROM size_classes;
  end if;
  select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0',xx)
  ELSE  xx END
  into xx; 
  SET NEW.SZ_CLASS_CODE = concat('Z',xx);
  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `shopbook` CHARACTER SET utf8 COLLATE utf8_general_ci ;
ALTER DATABASE `shopbook` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER shopbook.after_insert_sizeClass_pK
	AFTER INSERT
	ON shopbook.size_classes
	FOR EACH ROW
BEGIN
  DECLARE xx varchar(2) default NULL;
insert INTO size_class_dets (SZ_DET_CODE, SZ_DET_NAME, SZ_CLASS_CODE, NOTES) VALUES
  (concat(NEW.sz_class_code,'D00'), 'Reserved', NEW.sz_class_code, 'n/a');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `shopbook` CHARACTER SET utf8 COLLATE utf8_general_ci ;
ALTER DATABASE `shopbook` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER before_delete_sizeDets
	BEFORE DELETE
	ON size_classes
	FOR EACH ROW
BEGIN
  declare noOfRecords int DEFAULT 0;
  select count(*) into noOfRecords from size_class_dets
    where sz_class_code = OLD.sz_class_code;
  if noOfRecords = 1 then  
   delete FROM size_class_dets where 
  sz_class_code = OLD.sz_class_code;
  end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `shopbook` CHARACTER SET utf8 COLLATE utf8_general_ci ;

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
/*!40000 ALTER TABLE `sku_assemblies` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`sku_assemblies_BEFORE_UPDATE` BEFORE UPDATE ON `sku_assemblies` FOR EACH ROW
BEGIN
if (new.is_created = 'Y') then
set new.is_created = '';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`sku_assemblies_AFTER_DELETE` AFTER DELETE ON `sku_assemblies` FOR EACH ROW
BEGIN
if (old.sku_ass_code = old.sku_ass_comp) then
update skus set assembly ='N' 
where sku_code = old.sku_ass_code;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `LAST_PRICE` decimal(9,2) DEFAULT '0.00' COMMENT 'UML to Offline Database Transform: Column LAST_PRICE created from UML attribute "last price" in UML class "sku color"',
  `OLP_PRICE` decimal(9,2) DEFAULT '1.00' COMMENT 'UML to Offline Database Transform: Column OLP_PRICE created from UML attribute "olp price" in UML class "sku color"',
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
INSERT INTO `sku_colors` VALUES ('EG0000001G00010001S0000CLR00','CLR00','EG0000001G00010001S0000','Y',0,0,0.00,1.00,NULL,'2021-07-07 17:47:27','Default Color'),('EG0000001G00020002S0000CLR00','CLR00','EG0000001G00020002S0000','Y',0,0,0.00,1.00,NULL,'2021-07-07 17:50:33','Default Color'),('EG0000001G00030003S0000CLR00','CLR00','EG0000001G00030003S0000','Y',0,0,0.00,1.00,NULL,'2021-07-07 23:26:07','Default Color'),('EG0000001G00040004S0000CLR00','CLR00','EG0000001G00040004S0000','Y',0,0,0.00,1.00,NULL,'2021-07-07 23:26:50','Default Color');
/*!40000 ALTER TABLE `sku_colors` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`sku_colors_BEFORE_INSERT` BEFORE INSERT ON `sku_colors` FOR EACH ROW
BEGIN
declare xx varchar(2) default null;
declare def_color varchar(1) default null;
select count(*) into def_color from sku_colors where
sku_code = new.sku_code;
select MIN(c.start) FROM (
SELECT substr(a.clr_CODE,4,5)+1 AS start
    FROM sku_colors AS a, sku_colors AS b
    WHERE a.sku_CODE = new.sku_CODE
    and substr(a.clr_CODE,4,5) < substr(b.clr_CODE,4,5)
    GROUP BY substr(a.clr_CODE,4,5)
    HAVING start < MIN(substr(b.clr_CODE,4,5)) ) c into xx;
    if (def_color > 0 ) then
    if (xx is null )
    then 
    select COALESCE(max(substr(sku_colors.sku_clr_CODE,27)),0) +1 
    into xx FROM sku_colors WHERE SKU_CODE = new.sku_code;
    end if;
    select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0',xx)
  ELSE xx END
  into xx;  
    set NEW.clr_code = concat('CLR',xx);
     set new.sku_clr_code = concat(new.sku_code,'CLR',xx);
     end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`sku_colors_AFTER_INSERT` AFTER INSERT ON `sku_colors` FOR EACH ROW
BEGIN
insert into sku_size_colors (SKU_CLR_CODE,sku_size_code,sku_sz_clr_code)
select new.sku_clr_code, sku_size_code,
concat(sku_size_code,substr(new.sku_clr_code,-5)) from sku_sizes 
where sku_code = new.sku_code;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `sku_prop_dets` VALUES ('EG0000001G00010001S0000PD00000','Reserved Property',NULL,'EG0000001G00010001S0000','N',NULL,'2021-07-07 17:47:27'),('EG0000001G00020002S0000PD00000','Reserved Property',NULL,'EG0000001G00020002S0000','N',NULL,'2021-07-07 17:50:33'),('EG0000001G00030003S0000PD00000','Reserved Property',NULL,'EG0000001G00030003S0000','N',NULL,'2021-07-07 23:26:07'),('EG0000001G00040004S0000PD00000','Reserved Property',NULL,'EG0000001G00040004S0000','N',NULL,'2021-07-07 23:26:50');
/*!40000 ALTER TABLE `sku_prop_dets` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`sku_prop_dets_BEFORE_INSERT` BEFORE INSERT ON `sku_prop_dets` FOR EACH ROW
BEGIN
    declare xx varchar(5) default null;
    declare det_exist int(5) default 0;
select MIN(c.start) FROM (
SELECT substr(a.sku_prop_det_code,-5)+1 AS start
    FROM sku_prop_dets AS a, sku_prop_dets AS b
    WHERE substr(a.sku_prop_det_code,-5) < substr(b.sku_prop_det_code,-5)
    GROUP BY substr(a.sku_prop_det_code,-5)
    HAVING start < MIN(substr(b.sku_prop_det_code,-5)) ) c into xx;
select count(*) into det_exist from sku_prop_dets
where sku_code = new.sku_code;
if (xx is null and det_exist > 0) then
select COALESCE(max(substr(sku_prop_dets.sku_prop_det_code,-5)),0) +1 into xx
FROM sku_prop_dets where sku_code = new.sku_code;
select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0000',xx)
  WHEN  LENGTH(xx) = 2 
      then concat('000',xx)
  WHEN  LENGTH(xx) = 3 
      then concat('00',xx)
  WHEN  LENGTH(xx) = 4 
      then concat('0',xx)
  ELSE  xx END
  into xx; 
  SET NEW.sku_prop_det_code = CONCAT(NEW.sku_code,'PD',XX);
  elseif xx is not null then 
  select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0000',xx)
  WHEN  LENGTH(xx) = 2 
      then concat('000',xx)
  WHEN  LENGTH(xx) = 3 
      then concat('00',xx)
  WHEN  LENGTH(xx) = 4 
      then concat('0',xx)
  ELSE  xx END
  into xx;
  SET NEW.sku_prop_det_code = CONCAT(NEW.sku_code,'PD',XX);
  end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `QNTY_IN_STOCK` int(4) DEFAULT '0' COMMENT 'UML to Offline Database Transform: Column QNTY_IN_STOCK created from UML attribute "qnty in stock" in UML class "sku size color"',
  `LAST_PRICE` decimal(9,2) DEFAULT '0.00' COMMENT 'UML to Offline Database Transform: Column LAST_PRICE created from UML attribute "last price" in UML class "sku size color"',
  `OLD_PRICE` decimal(9,2) DEFAULT '0.00' COMMENT 'UML to Offline Database Transform: Column OLD_PRICE created from UML attribute "old price" in UML class "sku size color"',
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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER="shopbook"@"localhost"*/ /*!50003 TRIGGER `shopbook`.`sku_units_BEFORE_INSERT` BEFORE INSERT ON `sku_units` FOR EACH ROW
BEGIN
set New.SKU_UNIT_CODE = concat(new.SKU_CODE,NEW.UNIT_CODE);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `skus` VALUES ('EG0000001G00010001S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00010001',NULL,NULL,NULL,NULL,NULL,'2021-07-07 17:47:27',NULL,'Y',NULL,NULL,NULL,NULL,NULL),('EG0000001G00020002S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00020002',NULL,NULL,NULL,NULL,NULL,'2021-07-07 17:50:33',NULL,'Y',NULL,NULL,NULL,NULL,NULL),('EG0000001G00030003S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00030003',NULL,NULL,NULL,NULL,NULL,'2021-07-07 23:26:07',NULL,'Y',NULL,NULL,NULL,NULL,NULL),('EG0000001G00040004S0000','Reserved','Y','N',NULL,0,0.00,'N','Y',1.00,'EG0000001G00040004',NULL,NULL,NULL,NULL,NULL,'2021-07-07 23:26:50',NULL,'Y',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `skus` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER="shopbook"@"localhost"*/ /*!50003 TRIGGER `shopbook`.`skus_BEFORE_INSERT` BEFORE INSERT ON `skus` FOR EACH ROW
BEGIN
declare xx varchar(5) default null;
declare det_exist int(5) default 0;
select MIN(c.start) FROM (
SELECT substr(a.sku_CODE,20)+1 AS start
    FROM skus AS a, skus AS b
    WHERE a.SHOP_CAT_SUB_CODE = new.SHOP_CAT_SUB_CODE
    and substr(a.sku_CODE,20) < substr(b.sku_CODE,20)
    GROUP BY substr(a.sku_CODE,20)
    HAVING start < MIN(substr(b.sku_CODE,20)) ) c into xx;
select count(*) into det_exist from skus 
    where SHOP_CAT_SUB_CODE = New.SHOP_CAT_SUB_CODE;
    if (xx is null and det_exist > 0) then
select COALESCE(max(substr(skus.sku_CODE,20)),0) +1 into xx
FROM skus WHERE SHOP_CAT_SUB_CODE = new.SHOP_CAT_SUB_CODE;
select case 
  WHEN  LENGTH(xx) = 1 
      then concat('000',xx)
  WHEN  LENGTH(xx) = 2 
      then concat('00',xx)
  WHEN  LENGTH(xx) = 3 
      then concat('0',xx)
  ELSE xx END
  into xx;  
      
      SET NEW.sku_CODE = concat(NEW.SHOP_CAT_SUB_CODE,'S',XX);

  elseif (xx is not null /*and det_exist > 0*/ ) then
  select case 
  WHEN  LENGTH(xx) = 1 
      then concat('000',xx)
  WHEN  LENGTH(xx) = 2 
      then concat('00',xx)
  WHEN  LENGTH(xx) = 3 
      then concat('0',xx)
  ELSE xx END
  into xx;  
  
        SET NEW.sku_CODE = concat(NEW.SHOP_CAT_SUB_CODE,'S',XX);

end IF;        
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`skus_AFTER_INSERT` AFTER INSERT ON `skus` FOR EACH ROW
BEGIN
/* insert Reserved into sku_property calss det */
insert into sku_prop_dets (sku_prop_det_code,sku_prop_det_name,sku_code) 
select concat(New.sku_code,'PD00000'),'Reserved Property', new.sku_code;
/* insert into sku_property calss det */
if (new.shp_prop_cls_code is not null) then
insert into sku_prop_dets (shp_subcat_prp_cls_det_code,
 sku_prop_det_name,sku_code) 
select shp_subcat_prp_cls_det_code,
PROP_CLS_DET_NAME, new.sku_code
from shop_sub_cat_prop_class_dets
where prop_class_code = new.shp_prop_cls_code
and substr(shp_subcat_prp_cls_det_code,-3) != 'D00';
end if;
if (new.cat_sz_class_code is not null) then
insert into sku_sizes (size_det_code,sku_size_code,sku_code) 
select sz_det_code,concat(new.sku_code,sz_det_code), new.sku_code
from size_class_dets
where sz_class_code = substr(new.cat_sz_class_code,-3)
and substr(sz_det_code,-3) != 'D00';
end if;
/* insert into sku color sizes */
insert into sku_colors (sku_code, clr_code, sku_clr_code, clr_name)
values (new.sku_code, 'CLR00', concat(new.sku_code, 'CLR00'),'Default Color');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER `shopbook`.`skus_AFTER_UPDATE` AFTER UPDATE ON `skus` FOR EACH ROW
BEGIN
if (old.CAT_SZ_CLASS_CODE != new.CAT_SZ_CLASS_CODE) then
delete from sku_size_colors 
where substr(sku_size_colors.sku_size_code,1,23) = old.sku_code;
delete from sku_sizes where sku_sizes.sku_code = old.sku_code;
insert into sku_sizes (size_det_code,sku_size_code,sku_code) 
select sz_det_code,concat(new.sku_code,sz_det_code), new.sku_code
from size_class_dets
where sz_class_code = substr(new.cat_sz_class_code,-3)
and substr(sz_det_code,-3) != 'D00';
insert into sku_size_colors (sku_size_code, sku_clr_code,sku_sz_clr_code)
select sz.sku_size_code, sc.sku_clr_code,
concat(sz.sku_size_code,substr(sc.sku_clr_code,-5))
from sku_sizes sz, sku_colors sc
where sz.sku_code = sc.sku_code
and sz.sku_code = old.sku_code
and sc.sku_code = old.sku_code;
end if;
if (old.SHP_PROP_CLS_CODE != new.SHP_PROP_CLS_CODE) then
delete from sku_prop_dets 
where sku_code = old.sku_code
and shp_subcat_prp_cls_det_code is not null;
insert into sku_prop_dets 
(sku_prop_det_name, shp_subcat_prp_cls_det_code,sku_code)
select prop_cls_det_name,SHP_SUBCAT_PRP_CLS_DET_CODE, old.sku_code 
from shop_sub_cat_prop_class_dets
where prop_class_code = new.SHP_PROP_CLS_CODE;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sys_images`
--

DROP TABLE IF EXISTS `sys_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_images` (
  `SYS_IMAGE_ID` varchar(1) NOT NULL COMMENT 'UML to Offline Database Transform: Column SYS_IMAGE_ID created from UML attribute "sys image id" in UML class "sys image"',
  `IMG_NAME` varchar(20) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column IMG_NAME created from UML attribute "img name" in UML class "sys image"',
  `IMG_PATH` varchar(100) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column IMG_PATH created from UML attribute "img path" in UML class "sys image"',
  `IMG_FORMAT` varchar(20) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column IMG_FORMAT created from UML attribute "img format" in UML class "sys image"',
  `HIDE` varchar(1) DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column HIDE created from UML attribute "hide" in UML class "sys image"',
  `LAST_MODIFIED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sys image"',
  `SYS_PARAMETER_ID` decimal(10,0) DEFAULT NULL,
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
INSERT INTO `sys_images` VALUES ('1','Desert','c://sample//','.JPG','N','2019-04-08 20:09:54',NULL),('2','Hydrangeas','c://sample//','.JPG','N','2019-04-08 20:10:47',NULL),('3','Jellyfish','c://sample//','.JPG','N','2019-04-08 20:11:23',NULL),('4','Koala','c://sample//','.JPG','N','2019-04-08 20:12:22',NULL),('5','Lighthouse','c://sample//','.JPG','N','2019-04-08 20:12:59',NULL),('6','Chrysanthemum','c://sample//','.JPG','N','2019-04-08 20:13:25',NULL);
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
  `WEB_SERVER_NAME` varchar(20) DEFAULT NULL COMMENT 'UML to Offline Database Transform: Column WEB_SERVER_NAME created from UML attribute "web server name" in UML class "sys parameter"',
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
INSERT INTO `sys_parameters` VALUES (1,NULL,NULL,NULL,'localhost','smtp.gmail.com',587,NULL,'mohamed.fayed@gmail.com','mohamed.fayed',NULL,'/home/mfayed/Documents/shopbook/ShopBook/ShopdemoData/','NoImage.png','focus2008','en');
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
INSERT INTO `units` VALUES ('U000','Reserved','Y',0.00,NULL,NULL,NULL,NULL),('U001','Each','Y',1.00,NULL,1.00,11.00,2.00),('U002','jllkjlkjk','Y',1.00,NULL,1.00,6.00,0.33),('U003','set hkjhkj','N',1.25,'U001',1.00,10.00,1.00);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `shopbook` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`shopbook`@`localhost`*/ /*!50003 TRIGGER shopbook.before_insert_units_pk
	BEFORE INSERT
	ON shopbook.units
	FOR EACH ROW
begin
declare xx varchar(3) default null;
 select MIN(c.start) FROM (
SELECT substr(a.FROM_UNIT,2)+1 AS start
    FROM units AS a, units AS b
    WHERE substr(a.FROM_UNIT,2) < substr(b.FROM_UNIT,2)
    GROUP BY substr(a.FROM_UNIT,2)
    HAVING start < MIN(substr(b.FROM_UNIT,2)) ) c into xx;
  if xx is null then
select COALESCE(max(substr(units.FROM_UNIT,2)),0) +1 into xx
FROM units;
end IF;
select case 
  WHEN  LENGTH(xx) = 1 
      then concat('00',xx)
  when LENGTH(xx) = 2
      then concat('0',xx)
  ELSE  xx END
  into xx;              

  SET NEW.FROM_UNIT = CONCAT('U',XX);
  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `shopbook` CHARACTER SET utf8 COLLATE utf8_general_ci ;

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
  PRIMARY KEY (`USER_ID`),
  KEY `SHOP_TO_SHOP_ADMIN` (`SHOP_CODE`),
  KEY `USERS_INDEX` (`USER_ID`),
  CONSTRAINT `SHOP_TO_SHOP_ADMIN` FOREIGN KEY (`SHOP_CODE`) REFERENCES `shops` (`SHOP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UML to Offline Database Transform: Table USERS created from UML class "user"\r\nUML to Offline Database Transform: Primary key constraint PRIMARY created by default\r\nUML to Offline Database Transform: Foreign key constraint SHOP_TO_SHOP_ADMIN created for UML association "shop to shop admin"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('f.mohamed.fayed@egabi.com','Fayed Egabi','mohamed','fayed','123456',NULL,NULL,'G',NULL,'EG0000001','2020-03-25 17:36:35',NULL,'Y'),('mohamed.fayed@gmail.com','mohamed gmail','fayed','M F','123456','',NULL,'G',NULL,'EG0000001','2020-03-25 17:44:57',NULL,'Y'),('mohd_fayed@live.com','mohd live','fayed','live','147852',NULL,NULL,'U',NULL,'EG0000001','2020-03-25 22:49:57',NULL,'Y'),('mohd_fayed@yahoo.com','mohd yahoo','fayed','yahoo','789456','',NULL,'A',NULL,'EG0000001','2020-03-25 18:00:43',NULL,'Y');
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
  KEY `roles_to_users_roles_fk_idx` (`ROLE_ID`),
  CONSTRAINT `roles_to_users_roles_fk` FOREIGN KEY (`ROLE_ID`) REFERENCES `roles` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `users_to_users_roles_fk` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES ('mohamed.fayed@gmail.com','A0001'),('mohd_fayed@yahoo.com','A0001'),('mohd_fayed@live.com','C0001'),('mohamed.fayed@gmail.com','C0002'),('f.mohamed.fayed@egabi.com','U'),('mohamed.fayed@gmail.com','U');
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
  KEY `USER_WISH_ITEMS` (`USER_ID`),
  CONSTRAINT `SKU_TO_SZ_CLR_WISH_LISTS` FOREIGN KEY (`SKU_SZ_CLR_CODE`) REFERENCES `sku_size_colors` (`SKU_SZ_CLR_CODE`),
  CONSTRAINT `USER_WISH_ITEMS` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`)
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
INSERT INTO `years` VALUES (1930,'R'),(1950,'R'),(1960,'R'),(1970,'R'),(1980,'R'),(1990,'R'),(2000,'R');
/*!40000 ALTER TABLE `years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'shopbook'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_to_bag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS' */ ;
DELIMITER ;;
CREATE DEFINER="shopbook"@"localhost" PROCEDURE "add_to_bag"(pUserId varchar(100),
pSkuClrCode varchar(28), pSizeCode varchar(6),pUnitCode varchar(4),pQty int(3),
pUnitPrice int(11))
BEGIN
declare open_master_rcrd_exist int(1);
declare open_master_rcrd varchar(42);
declare gen_det_id varchar(42);
	select count(1) into open_master_rcrd_exist from shopping_master 
	where user_id = pUserId and trans_status='O';
if (open_master_rcrd_exist = 0) then
select 'bf4 insert';
	insert into shopping_master (user_id,first_name, last_name, trans_status) 
  select user_id, first_name, family_name, 'O' from users
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
/*!50003 DROP PROCEDURE IF EXISTS `insertMissedSkuSizes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS' */ ;
DELIMITER ;;
CREATE DEFINER="shopbook"@"localhost" PROCEDURE "insertMissedSkuSizes"(vSkuClrCode varchar(28))
BEGIN
insert into shopbook.sku_size_colors (SKU_SZ_CLR_CODE,SKU_SIZE_CODE,SKU_CLR_CODE) 
select concat(sku_size_code,substr(vSkuClrCode,-5)), SKU_SIZE_CODE, vSkuClrCode
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
/*!50013 DEFINER=`shopbook`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Search_V` AS select `ShopSubCats`.`LAST_MODIFIED` AS `LAST_MODIFIED`,`ShopSubCats`.`NOTES` AS `NOTES`,`ShopSubCats`.`SHOP_CAT_CODE` AS `SHOP_CAT_CODE`,`ShopSubCats`.`SHOP_SUB_CAT_CODE` AS `SHOP_SUB_CAT_CODE`,`ShopSubCats`.`SHOP_SUB_CAT_NAME` AS `cats_search`,`ShopSubCats`.`SUB_CAT_IMAGE_NAME` AS `SUB_CAT_IMAGE_NAME`,`ShopSubCats`.`SUB_CAT_IMAGE_TYPE` AS `SUB_CAT_IMAGE_TYPE`,`Skus`.`APPEAR_ONLY_IN_ASS` AS `APPEAR_ONLY_IN_ASS`,`Skus`.`ASSEMBLY` AS `ASSEMBLY`,`Skus`.`AVAILABLE` AS `AVAILABLE`,`Skus`.`BRAND_CODE` AS `BRAND_CODE`,`Skus`.`CAT_SZ_CLASS_CODE` AS `CAT_SZ_CLASS_CODE`,`Skus`.`HIDE` AS `HIDE`,`Skus`.`LAST_MODIFIED` AS `Sku_Last_Modified`,`Skus`.`LAST_PRICE` AS `LAST_PRICE`,`Skus`.`MNF_CODE` AS `MNF_CODE`,`Skus`.`MODEL_CODE` AS `MODEL_CODE`,`Skus`.`NEW_FLAG` AS `NEW_FLAG`,`Skus`.`NOTES` AS `Sku_Notes`,`Skus`.`OLD_PRICE` AS `OLD_PRICE`,`Skus`.`QNTY_IN_STOCK` AS `QNTY_IN_STOCK`,`Skus`.`RATE` AS `RATE`,`Skus`.`SHOP_CAT_SUB_CODE` AS `SHOP_CAT_SUB_CODE`,`Skus`.`SHP_PROP_CLS_CODE` AS `SHP_PROP_CLS_CODE`,`Skus`.`SKU_CODE` AS `SKU_CODE`,`Skus`.`SKU_NAME` AS `sku_search`,`Skus`.`YEAR` AS `YEAR` from (`skus` `Skus` left join `shop_sub_cats` `ShopSubCats` on((`Skus`.`SHOP_CAT_SUB_CODE` = `ShopSubCats`.`SHOP_SUB_CAT_CODE`))) where (substr(`Skus`.`SKU_CODE`,-(4)) <> '0000') */;
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

-- Dump completed on 2021-08-13  0:06:07
