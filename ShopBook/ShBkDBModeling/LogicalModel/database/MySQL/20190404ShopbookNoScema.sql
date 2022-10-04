CREATE TABLE  BRANDS 
( 
  BRAND_CODE VARCHAR(6) NOT NULL COMMENT 'UML to Offline Database Transform: Column BRAND_CODE created from UML attribute "brand code" in UML class "brand"' 
, BRAND_NAME VARCHAR(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column BRAND_NAME created from UML attribute "brand name" in UML class "brand"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "brand"' 
, REGISTER_STATUS VARCHAR(1) NOT NULL DEFAULT 'R' COMMENT 'UML to Offline Database Transform: Column REGISTER_STATUS created from UML attribute "register status" in UML class "brand"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP 
, SHOP_CODE VARCHAR(9) NULL 
, CONSTRAINT PRIMARY KEY ( BRAND_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table BRANDS created from UML class "brand"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default';

CREATE TABLE  CATEGORIES 
( 
  CAT_CODE VARCHAR(5) NOT NULL COMMENT 'UML to Offline Database Transform: Column CAT_CODE created from UML attribute "cat code" in UML class "category"' 
, CAT_NAME VARCHAR(200) NOT NULL COMMENT 'UML to Offline Database Transform: Column CAT_NAME created from UML attribute "cat name" in UML class "category"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "category"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP 
, CONSTRAINT PRIMARY KEY ( CAT_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table CATEGORIES created from UML class "category"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default';

CREATE TABLE  CATEGORY_TREES 
( 
  CAT_TREE_CODE VARCHAR(10) NOT NULL COMMENT 'UML to Offline Database Transform: Column CAT_TREE_CODE created from UML attribute "cat tree code" in UML class "category tree"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "category tree"' 
, LEVEL VARCHAR(3) NULL COMMENT 'UML to Offline Database Transform: Column LEVEL created from UML attribute "level" in UML class "category tree"' 
, PARENT_DESCRIMINATOR VARCHAR(2) NULL COMMENT 'UML to Offline Database Transform: Column PARENT_DESCRIMINATOR created from UML attribute "parent descriminator" in UML class "category tree"' 
, CHILD_CATEGORY VARCHAR(5) NULL COMMENT 'UML to Offline Database Transform: Column TREE_CHILD created as default foreign key column for foreign key "TREE_CHILD"' 
, PARENT_CATEGORY VARCHAR(5) NOT NULL COMMENT 'UML to Offline Database Transform: Column TREE_PARENT created as default foreign key column for foreign key "TREE_PARENT"' 
, CONSTRAINT PRIMARY KEY ( CAT_TREE_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table CATEGORY_TREES created from UML class "category tree"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint TREE_CHILD created for UML association "tree child"
UML to Offline Database Transform: Foreign key constraint TREE_PARENT created for UML association "tree parent"';

CREATE TABLE  CAT_MNF_BRND_MDL_YERS 
( 
  CMBMY_CODE VARCHAR(30) NOT NULL COMMENT 'UML to Offline Database Transform: Column CMBMY_CODE created from UML attribute "cmbmy code" in UML class "cat mnf brnd mdl yer"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "cat mnf brnd mdl yer"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "cat mnf brnd mdl yer"' 
, BRAND_CODE VARCHAR(6) NULL COMMENT 'UML to Offline Database Transform: Column BRAND_TO_CAT created as default foreign key column for foreign key "BRAND_TO_CAT"' 
, CAT_CODE VARCHAR(5) NULL COMMENT 'UML to Offline Database Transform: Column CAT_MBMY created as default foreign key column for foreign key "CAT_MBMY"' 
, MNF_CODE VARCHAR(6) NULL COMMENT 'UML to Offline Database Transform: Column MANUFACTURE_TO_CAT created as default foreign key column for foreign key "MANUFACTURE_TO_CAT"' 
, MODEL_CODE VARCHAR(9) NULL COMMENT 'UML to Offline Database Transform: Column MODEL_TO_CAT created as default foreign key column for foreign key "MODEL_TO_CAT"' 
, YEAR INT(4) NULL COMMENT 'UML to Offline Database Transform: Column YEAR_TO_CAT created as default foreign key column for foreign key "YEAR_TO_CAT"' 
, CONSTRAINT PRIMARY KEY ( CMBMY_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table CAT_MNF_BRND_MDL_YERS created from UML class "cat mnf brnd mdl yer"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint BRAND_TO_CAT created for UML association "brand to cat"
UML to Offline Database Transform: Foreign key constraint CAT_MBMY created for UML association "cat mbmy"
UML to Offline Database Transform: Foreign key constraint MANUFACTURE_TO_CAT created for UML association "manufacture to cat"
UML to Offline Database Transform: Foreign key constraint MODEL_TO_CAT created for UML association "model to cat"
UML to Offline Database Transform: Foreign key constraint YEAR_TO_CAT created for UML association "year to cat"';

CREATE TABLE  CAT_SIZE_CLASSES 
( 
  CAT_SZ_CLASS_CODE VARCHAR(8) NOT NULL COMMENT 'UML to Offline Database Transform: Column CAT_SZ_CLASS_CODE created from UML attribute "cat sz class code" in UML class "cat size class"' 
, SZ_CLASS_CODE VARCHAR(3) NULL COMMENT 'UML to Offline Database Transform: Column SIZE_CLS_TO_CAT_SIZE_CLASS created as default foreign key column for foreign key "SIZE_CLS_TO_CAT_SIZE_CLASS"' 
, CAT_CODE VARCHAR(5) NULL COMMENT 'UML to Offline Database Transform: Column CAT_TO_CAT_SIZE_CLASS created as default foreign key column for foreign key "CAT_TO_CAT_SIZE_CLASS"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "cat size class"' 
, CONSTRAINT PRIMARY KEY ( CAT_SZ_CLASS_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table CAT_SIZE_CLASSES created from UML class "cat size class"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint CAT_TO_CAT_SIZE_CLASS created for UML association "cat to cat size class"
UML to Offline Database Transform: Foreign key constraint SIZE_CLS_TO_CAT_SIZE_CLASS created for UML association "size cls to cat size class"';

CREATE TABLE  COUNTRIES 
( 
  CNTRY_CODE2 VARCHAR(2) NOT NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_CODE2 created from UML attribute "cntry code2" in UML class "country"' 
, CNTRY_NAME VARCHAR(150) NOT NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_NAME created from UML attribute "cntry name" in UML class "country"' 
, DIAL_CODE INT(11) NULL COMMENT 'UML to Offline Database Transform: Column DIAL_CODE created from UML attribute "dial code" in UML class "country"' 
, CURR_NAME VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column CURR_NAME created from UML attribute "curr name" in UML class "country"' 
, CURR_SYMBOL VARCHAR(20) NULL COMMENT 'UML to Offline Database Transform: Column CURR_SYMBOL created from UML attribute "curr symbol" in UML class "country"' 
, CURR_CODE VARCHAR(20) NULL COMMENT 'UML to Offline Database Transform: Column CURR_CODE created from UML attribute "curr code" in UML class "country"' 
, CNTRY_CODE3 VARCHAR(3) NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_CODE3 created from UML attribute "cntry code3" in UML class "country"' 
, FLAG BLOB NULL COMMENT 'UML to Offline Database Transform: Column FLAG created from UML attribute "flag" in UML class "country"' 
, ACTIVE VARCHAR(2) NULL COMMENT 'UML to Offline Database Transform: Column FLAG created from UML attribute "active" in UML class "country"' 
, CONSTRAINT PRIMARY KEY ( CNTRY_CODE2 ) ) 
COMMENT = 'UML to Offline Database Transform: Table COUNTRIES created from UML class "country"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default';

CREATE TABLE  CURRENCY_PRICES 
( 
  TRANS_ID DATETIME NOT NULL COMMENT 'UML to Offline Database Transform: Column TRANS_ID created from UML attribute "trans id" in UML class "currency price"' 
, MULTIPLY_BY DECIMAL(9, 2) NULL COMMENT 'UML to Offline Database Transform: Column MULTIPLY_BY created from UML attribute "multiply by" in UML class "currency price"' 
, FROM_CURR VARCHAR(2) NULL COMMENT 'UML to Offline Database Transform: Column FROM_CURR_TO_PRICES created as default foreign key column for foreign key "FROM_CURR_TO_PRICES"' 
, TO_CURR VARCHAR(2) NULL COMMENT 'UML to Offline Database Transform: Column TO_CURR_TO_PRICES created as default foreign key column for foreign key "TO_CURR_TO_PRICES"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "currency price"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "currency price"' 
, CONSTRAINT PRIMARY KEY ( TRANS_ID ) ) 
COMMENT = 'UML to Offline Database Transform: Table CURRENCY_PRICES created from UML class "currency price"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint FROM_CURR_TO_PRICES created for UML association "from curr to prices"
UML to Offline Database Transform: Foreign key constraint TO_CURR_TO_PRICES created for UML association "to curr to prices"';

CREATE TABLE  FAVOURITE_SHOPS 
( 
  USER_ID_FAV_SHOP VARCHAR(110) NOT NULL COMMENT 'UML to Offline Database Transform: Column USER_ID_FAV_SHOP created from UML attribute "USER ID FAV SHOP" in UML class "FAVOURITE SHOP"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "FAVOURITE SHOP"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "FAVOURITE SHOP"' 
, SHOP_CODE VARCHAR(9) NULL 
, USER_ID VARCHAR(100) NULL 
, CONSTRAINT PRIMARY KEY ( USER_ID_FAV_SHOP ) ) 
COMMENT = 'UML to Offline Database Transform: Table FAVOURITE_SHOPS created from UML class "FAVOURITE SHOP"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default';

CREATE TABLE  LANGUAGES 
( 
  LANG_CODE VARCHAR(2) NOT NULL COMMENT 'UML to Offline Database Transform: Column LANG_CODE created from UML attribute "lang code" in UML class "language"' 
, LANG_NAME VARCHAR(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column LANG_NAME created from UML attribute "lang name" in UML class "language"' 
, CONSTRAINT PRIMARY KEY ( LANG_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table LANGUAGES created from UML class "language"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default';

CREATE TABLE  MANUFACTURES 
( 
  MNF_CODE VARCHAR(6) NOT NULL COMMENT 'UML to Offline Database Transform: Column MNF_CODE created from UML attribute "mnf code" in UML class "manufacture"' 
, MNF_NAME VARCHAR(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column MNF_NAME created from UML attribute "mnf name" in UML class "manufacture"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "manufacture"' 
, REGISTER_STATUS VARCHAR(1) NOT NULL DEFAULT 'R' COMMENT 'UML to Offline Database Transform: Column REGISTER_STATUS created from UML attribute "register status" in UML class "manufacture"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP 
, SHOP_CODE VARCHAR(9) NULL 
, CONSTRAINT PRIMARY KEY ( MNF_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table MANUFACTURES created from UML class "manufacture"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default';

CREATE TABLE  MODELS 
( 
  MODEL_CODE VARCHAR(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column MODEL_CODE created from UML attribute "model code" in UML class "model"' 
, MODEL_NAME VARCHAR(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column MODEL_NAME created from UML attribute "model name" in UML class "model"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "model"' 
, REGISTER_STATUS VARCHAR(1) NOT NULL DEFAULT 'R' COMMENT 'UML to Offline Database Transform: Column REGISTER_STATUS created from UML attribute "register status" in UML class "model"' 
, ORIG_MODEL_NO VARCHAR(50) NULL COMMENT 'UML to Offline Database Transform: Column ORIG_MODEL_NO created from UML attribute "orig model no" in UML class "model"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '+' 
, SHOP_CODE VARCHAR(9) NULL 
, CONSTRAINT PRIMARY KEY ( MODEL_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table MODELS created from UML class "model"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default';

CREATE TABLE  OFFERS 
( 
  SHP_CODE_OFFER_ID VARCHAR(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHP_CODE_OFFER_ID created from UML attribute "shp code offer id" in UML class "offer"' 
, OFFER_DT DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column OFFER_DT created from UML attribute "offer dt" in UML class "offer"' 
, OFFER_TITLE VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column OFFER_TITLE created from UML attribute "offer title" in UML class "offer"' 
, VALID_FRM_DATE DATETIME NULL COMMENT 'UML to Offline Database Transform: Column VALID_FRM_DATE created from UML attribute "valid frm date" in UML class "offer"' 
, VALID_TO_DATE DATETIME NULL COMMENT 'UML to Offline Database Transform: Column VALID_TO_DATE created from UML attribute "valid to date" in UML class "offer"' 
, SHOP_CODE VARCHAR(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_OFFERS created as default foreign key column for foreign key "SHOP_OFFERS"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "offer"' 
, CONSTRAINT PRIMARY KEY ( SHP_CODE_OFFER_ID ) ) 
COMMENT = 'UML to Offline Database Transform: Table OFFERS created from UML class "offer"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SHOP_OFFERS created for UML association "shop offers"';

CREATE TABLE  OFFER_DETS 
( 
  OFFER_DET_ID VARCHAR(25) NOT NULL COMMENT 'UML to Offline Database Transform: Column OFFER_DET_ID created from UML attribute "offer det id" in UML class "offer det"' 
, OFFER_ID VARCHAR(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column OFFERS_TO_OFFER_DET created as default foreign key column for foreign key "OFFERS_TO_OFFER_DET"' 
, IMAGE_PATH VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_OFFER_DET created as default foreign key column for foreign key "SKU_TO_OFFER_DET"' 
, OFFER_DET_LINK VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column OFFER_DET_LINK created from UML attribute "offer det link" in UML class "offer det"' 
, OFFER_DET_TEXT VARCHAR(255) NULL COMMENT 'UML to Offline Database Transform: Column OFFER_DET_TEXT created from UML attribute "offer det text" in UML class "offer det"' 
, HIDE VARCHAR(1) NULL DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column HIDE created from UML attribute "hide" in UML class "offer det"' 
, AVAILABLE VARCHAR(1) NULL DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "offer det"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "offer det"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "offer det"' 
, CONSTRAINT PRIMARY KEY ( OFFER_DET_ID ) ) 
COMMENT = 'UML to Offline Database Transform: Table OFFER_DETS created from UML class "offer det"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint OFFERS_TO_OFFER_DET created for UML association "offers to offer det"
UML to Offline Database Transform: Foreign key constraint SKU_TO_OFFER_DET created for UML association "sku to offer det"';

CREATE TABLE  POSTS 
( 
  POST_CODE INT(20) NOT NULL COMMENT 'UML to Offline Database Transform: Column POST_CODE created from UML attribute "post code" in UML class "post"' 
, POST_DATETIME DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column POST_DATETIME created from UML attribute "post datetime" in UML class "post"' 
, POST_TEXT VARCHAR(255) NULL COMMENT 'UML to Offline Database Transform: Column POST_TEXT created from UML attribute "post text" in UML class "post"' 
, PHOTO_NAME VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column PHOTO_NAME created from UML attribute "photo name" in UML class "post"' 
, USER_ID VARCHAR(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column USER_POST created as default foreign key column for foreign key "USER_POST"' 
, RATE_POST_FLAG VARCHAR(1) NULL DEFAULT 'P' COMMENT 'UML to Offline Database Transform: Column RATE_POST_FLAG created from UML attribute "rate post flag" in UML class "post"' 
, RATE INT(5) NULL COMMENT 'UML to Offline Database Transform: Column RATE created from UML attribute "rate" in UML class "post"' 
, PHOTO_FORMAT VARCHAR(20) NULL COMMENT 'UML to Offline Database Transform: Column PHOTO_FORMAT created from UML attribute "photo format" in UML class "post"' 
, PHOTO_FILEPATH VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column PHOTO_FILEPATH created from UML attribute "photo filepath" in UML class "post"' 
, POST_CODE_PRNT INT(20) NULL COMMENT 'UML to Offline Database Transform: Column POSTS_TREE created as default foreign key column for foreign key "POSTS_TREE"' 
, SHOP_CODE VARCHAR(9) NULL COMMENT 'UML to Offline Database Transform: Column SHOP_POST created as default foreign key column for foreign key "SHOP_POST"' 
, SKU_CLR_CODE VARCHAR(28) NULL COMMENT 'UML to Offline Database Transform: Column SKU_COLOR_TO_POST created as default foreign key column for foreign key "SKU_COLOR_TO_POST"' 
, SKU_CODE VARCHAR(23) NULL COMMENT 'UML to Offline Database Transform: Column SKU_POST created as default foreign key column for foreign key "SKU_POST"' 
, SKU_SIZE_CODE VARCHAR(29) NULL COMMENT 'UML to Offline Database Transform: Column SKU_SIZE_TO_POST created as default foreign key column for foreign key "SKU_SIZE_TO_POST"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "post"' 
, CONSTRAINT PRIMARY KEY ( POST_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table POSTS created from UML class "post"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint POSTS_TREE created for UML association "posts tree"
UML to Offline Database Transform: Foreign key constraint SHOP_POST created for UML association "shop post"
UML to Offline Database Transform: Foreign key constraint SKU_COLOR_TO_POST created for UML association "sku color to post"
UML to Offline Database Transform: Foreign key constraint SKU_POST created for UML association "sku post"
UML to Offline Database Transform: Foreign key constraint SKU_SIZE_TO_POST created for UML association "sku size to post"
UML to Offline Database Transform: Foreign key constraint USER_POST created for UML association "user post"';

CREATE TABLE  SHOPS 
( 
  SHOP_CODE VARCHAR(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_CODE created from UML attribute "shop code" in UML class "shop"' 
, SHOP_NAME VARCHAR(1000) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_NAME created from UML attribute "shop name" in UML class "shop"' 
, SHOP_LAT DOUBLE(20, 15) NULL COMMENT 'UML to Offline Database Transform: Column SHOP_LAT created from UML attribute "shop lat" in UML class "shop"' 
, SHOP_LONG DOUBLE(20, 15) NULL COMMENT 'UML to Offline Database Transform: Column SHOP_LONG created from UML attribute "shop long" in UML class "shop"' 
, STREET_ADD1 VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column STREET_ADD1 created from UML attribute "street add1" in UML class "shop"' 
, STREET_ADD2 VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column STREET_ADD2 created from UML attribute "street add2" in UML class "shop"' 
, STREET_ADD3 VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column STREET_ADD3 created from UML attribute "street add3" in UML class "shop"' 
, PROVINCE VARCHAR(150) NULL COMMENT 'UML to Offline Database Transform: Column PROVINCE created from UML attribute "province" in UML class "shop"' 
, COUNTRY VARCHAR(150) NULL COMMENT 'UML to Offline Database Transform: Column COUNTRY created from UML attribute "country" in UML class "shop"' 
, TEL VARCHAR(50) NULL COMMENT 'UML to Offline Database Transform: Column TEL created from UML attribute "tel" in UML class "shop"' 
, WEB_ADDRESS VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column WEB_ADDRESS created from UML attribute "web address" in UML class "shop"' 
, LOGO VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column LOGO created from UML attribute "logo" in UML class "shop"' 
, CITY VARCHAR(50) NULL COMMENT 'UML to Offline Database Transform: Column CITY created from UML attribute "city" in UML class "shop"' 
, ONE_TIME_CODE VARCHAR(200) NULL COMMENT 'UML to Offline Database Transform: Column GEN_CODE created from UML attribute "gen code" in UML class "shop"' 
, SHOP_FILE_PATH VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column SHOP_FILE_PATH created from UML attribute "shop file path" in UML class "shop"' 
, SMTP_HOST VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column SMTP_HOST created from UML attribute "smtp host" in UML class "shop"' 
, SMTP_PORT INT(4) NULL COMMENT 'UML to Offline Database Transform: Column SMTP_PORT created from UML attribute "smtp port" in UML class "shop"' 
, SSL_OR_TSL VARCHAR(1) NULL COMMENT 'UML to Offline Database Transform: Column SSL_OR_TSL created from UML attribute "ssl or tsl" in UML class "shop"' 
, SHOP_USER_NAME VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column SHOP_USER_NAME created from UML attribute "shop user name" in UML class "shop"' 
, SHOP_ADMIN_EMAIL VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column SHOP_ADMIN_EMAIL created from UML attribute "shop admin email" in UML class "shop"' 
, ACTIVE VARCHAR(1) NULL DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column ACTIVE created from UML attribute "active" in UML class "shop"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shop"' 
, RATE INT(5) NULL COMMENT 'UML to Offline Database Transform: Column RATE created from UML attribute "rate" in UML class "shop"' 
, LEVEL INT(1) NULL COMMENT 'UML to Offline Database Transform: Column LEVEL created from UML attribute "level" in UML class "shop"' 
, CNTRY_CODE2 VARCHAR(2) NULL COMMENT 'UML to Offline Database Transform: Column COUNTRY_SHOP created as default foreign key column for foreign key "COUNTRY_SHOP"' 
, PARENT_SHOP_CODE VARCHAR(9) NULL COMMENT 'UML to Offline Database Transform: Column SHOP_BRANCH created as default foreign key column for foreign key "SHOP_BRANCH"' 
, REGISTER_STATUS VARCHAR(1) NULL 
, CONSTRAINT PRIMARY KEY ( SHOP_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHOPS created from UML class "shop"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint COUNTRY_SHOP created for UML association "country shop"
UML to Offline Database Transform: Foreign key constraint SHOP_BRANCH created for UML association "shop branch"';

CREATE TABLE  SHOP_CATEGORIES 
( 
  SHOP_CAT_CODE VARCHAR(14) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_CAT_CODE created from UML attribute "shop cat code" in UML class "shop category"' 
, CAT_IMAGE_NAME VARCHAR(200) NULL COMMENT 'UML to Offline Database Transform: Column CAT_IMAGE_NAME created from UML attribute "cat image name" in UML class "shop category"' 
, CAT_IMAGE_TYPE VARCHAR(9) NULL COMMENT 'UML to Offline Database Transform: Column CAT_IMAGE_TYPE created from UML attribute "cat image type" in UML class "shop category"' 
, CAT_CODE VARCHAR(5) NOT NULL COMMENT 'UML to Offline Database Transform: Column CATEGORY_TO_SHOP created as default foreign key column for foreign key "CATEGORY_TO_SHOP"' 
, SHOP_CODE VARCHAR(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_TO_CATEGORY created as default foreign key column for foreign key "SHOP_TO_CATEGORY"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop category"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP 
, CONSTRAINT PRIMARY KEY ( SHOP_CAT_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHOP_CATEGORIES created from UML class "shop category"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint CATEGORY_TO_SHOP created for UML association "category to shop"
UML to Offline Database Transform: Foreign key constraint SHOP_TO_CATEGORY created for UML association "shop to category"';

CREATE TABLE  SHOP_CATEGORY_ADMINS 
( 
  ADMIN_SHP_CAT_CODE VARCHAR(150) NOT NULL COMMENT 'UML to Offline Database Transform: Column ADMIN_SHP_CAT_CODE created from UML attribute "admin shp cat code" in UML class "shop category admin"' 
, ACTIVE VARCHAR(1) NULL COMMENT 'UML to Offline Database Transform: Column ACTIVE created from UML attribute "active" in UML class "shop category admin"' 
, USER_ID VARCHAR(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column ADMIN_TO_ADMIN_CAT created as default foreign key column for foreign key "ADMIN_TO_ADMIN_CAT"' 
, SHOP_CAT_SUB_CODE VARCHAR(18) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_CATS_TO_ADMIN_CAT created as default foreign key column for foreign key "SHOP_CATS_TO_ADMIN_CAT"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop category admin"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shop category admin"' 
, CONSTRAINT PRIMARY KEY ( ADMIN_SHP_CAT_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHOP_CATEGORY_ADMINS created from UML class "shop category admin"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint ADMIN_TO_ADMIN_CAT created for UML association "admin to admin cat"
UML to Offline Database Transform: Foreign key constraint SHOP_CATS_TO_ADMIN_CAT created for UML association "shop cats to admin cat"';

CREATE TABLE  SHOP_DOCS 
( 
  SHOP_DOC_CODE VARCHAR(15) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_DOC_CODE created from UML attribute "shop doc code" in UML class "shop doc"' 
, SHOP_DOC_NAME VARCHAR(500) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_DOC_NAME created from UML attribute "shop doc name" in UML class "shop doc"' 
, SHOP_DOC_FILE_PATH VARCHAR(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_DOC_FILE_PATH created from UML attribute "shop doc file path" in UML class "shop doc"' 
, SHOP_DOC_FILE_TYPE VARCHAR(20) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_DOC_FILE_TYPE created from UML attribute "shop doc file type" in UML class "shop doc"' 
, SHOP_DOC_FILE_NAME VARCHAR(50) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_DOC_FILE_NAME created from UML attribute "shop doc file name" in UML class "shop doc"' 
, CNTRY_DOC_TYPE VARCHAR(6) NOT NULL COMMENT 'UML to Offline Database Transform: Column DOC_TYPE_TO_PROOF_DOC created as default foreign key column for foreign key "DOC_TYPE_TO_PROOF_DOC"' 
, SHOP_CODE VARCHAR(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_TO_PROOF_DOCS created as default foreign key column for foreign key "SHOP_TO_PROOF_DOCS"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shop doc"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop doc"' 
, CONSTRAINT PRIMARY KEY ( SHOP_DOC_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHOP_DOCS created from UML class "shop doc"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint DOC_TYPE_TO_PROOF_DOC created for UML association "doc type to proof doc"
UML to Offline Database Transform: Foreign key constraint SHOP_TO_PROOF_DOCS created for UML association "shop to proof docs"';

CREATE TABLE  SHOP_FEES_HISTS 
( 
  TRANS_CODE VARCHAR(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column TRANS_CODE created from UML attribute "trans code" in UML class "shop fees hist"' 
, TRNS_DATE DATETIME NULL COMMENT 'UML to Offline Database Transform: Column TRNS_DATE created from UML attribute "trns date" in UML class "shop fees hist"' 
, TRNS_BNK_ID VARCHAR(50) NULL COMMENT 'UML to Offline Database Transform: Column TRNS_BNK_ID created from UML attribute "trns bnk id" in UML class "shop fees hist"' 
, TRNS_VALUE INT(5) NULL COMMENT 'UML to Offline Database Transform: Column TRNS_VALUE created from UML attribute "trns value" in UML class "shop fees hist"' 
, NEXT_TRNS_DATE DATETIME NULL COMMENT 'UML to Offline Database Transform: Column NEXT_TRNS_DATE created from UML attribute "next trns date" in UML class "shop fees hist"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop fees hist"' 
, SHOP_CODE VARCHAR(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_TO_FEES_HIST created as default foreign key column for foreign key "SHOP_TO_FEES_HIST"' 
, CONSTRAINT PRIMARY KEY ( TRANS_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHOP_FEES_HISTS created from UML class "shop fees hist"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SHOP_TO_FEES_HIST created for UML association "shop to fees hist"';

CREATE TABLE  SHOP_IMAGESES 
( 
  SHOP_IMAGE_ID VARCHAR(11) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_IMAGE_ID created from UML attribute "shop image id" in UML class "shop images"' 
, SHOP_CODE VARCHAR(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_TO_SHOP_IMAGE created as default foreign key column for foreign key "SHOP_TO_SHOP_IMAGE"' 
, IMG_NAME VARCHAR(20) NULL COMMENT 'UML to Offline Database Transform: Column IMG_NAME created from UML attribute "img name" in UML class "shop images"' 
, IMG_PATH VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column IMG_PATH created from UML attribute "img path" in UML class "shop images"' 
, IMG_FORMAT VARCHAR(20) NULL COMMENT 'UML to Offline Database Transform: Column IMG_FORMAT created from UML attribute "img format" in UML class "shop images"' 
, HIDE VARCHAR(1) NULL DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column HIDE created from UML attribute "hide" in UML class "shop images"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shop images"' 
, CONSTRAINT PRIMARY KEY ( SHOP_IMAGE_ID ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHOP_IMAGESES created from UML class "shop images"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SHOP_TO_SHOP_IMAGE created for UML association "shop to shop image"';

CREATE TABLE  SHOP_PROOF_DOC_TYPES 
( 
  CNTRY_DOC_TYPE VARCHAR(6) NOT NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_DOC_TYPE created from UML attribute "cntry doc type" in UML class "shop proof doc type"' 
, CNTRY_DOC_TYPE_NAME VARCHAR(200) NOT NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_DOC_TYPE_NAME created from UML attribute "cntry doc type name" in UML class "shop proof doc type"' 
, CNTRY_DOC_TYPE_DESC VARCHAR(255) NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_DOC_TYPE_DESC created from UML attribute "cntry doc type desc" in UML class "shop proof doc type"' 
, CNTRY_DOC_TYPE_IMG VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_DOC_TYPE_IMG created from UML attribute "cntry doc type img" in UML class "shop proof doc type"' 
, CNTRY_DOC_TYPE_FORMAT VARCHAR(20) NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_DOC_TYPE_FORMAT created from UML attribute "cntry doc type format" in UML class "shop proof doc type"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop proof doc type"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shop proof doc type"' 
, CNTRY_CODE2 VARCHAR(2) NULL COMMENT 'UML to Offline Database Transform: Column CNTRY_TO_DOC_TYPE created as default foreign key column for foreign key "CNTRY_TO_DOC_TYPE"' 
, LANG_CODE VARCHAR(2) NULL COMMENT 'UML to Offline Database Transform: Column LANG_TO_SHOP_PROOF_DOC_TYPE created as default foreign key column for foreign key "LANG_TO_SHOP_PROOF_DOC_TYPE"' 
, CONSTRAINT PRIMARY KEY ( CNTRY_DOC_TYPE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHOP_PROOF_DOC_TYPES created from UML class "shop proof doc type"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint CNTRY_TO_DOC_TYPE created for UML association "cntry to doc type"
UML to Offline Database Transform: Foreign key constraint LANG_TO_SHOP_PROOF_DOC_TYPE created for UML association "lang to shop proof doc type"';

CREATE TABLE  SHOP_SKUS 
( 
  SHOP_SKU_CODE VARCHAR(44) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_SKU_CODE created from UML attribute "shop sku code" in UML class "shop sku"' 
, SHOP_CODE VARCHAR(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_BRANCH_TO_SKU created as default foreign key column for foreign key "SHOP_BRANCH_TO_SKU"' 
, SKU_SZ_CLR_CODE VARCHAR(37) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_TO_SKU_SZ_CLR created as default foreign key column for foreign key "SHOP_TO_SKU_SZ_CLR"' 
, QNTY_IN_STOCK INT(4) NULL DEFAULT 0 COMMENT 'UML to Offline Database Transform: Column QNTY_IN_STOCK created from UML attribute "qnty in stock" in UML class "shop sku"' 
, AVAILABLE VARCHAR(1) NULL DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "shop sku"' 
, HIDE VARCHAR(1) NULL DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column HIDE created from UML attribute "hide" in UML class "shop sku"' 
, NOTES VARCHAR(500) NULL 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shop sku"' 
, CONSTRAINT PRIMARY KEY ( SHOP_SKU_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHOP_SKUS created from UML class "shop sku"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SHOP_BRANCH_TO_SKU created for UML association "shop branch to sku"
UML to Offline Database Transform: Foreign key constraint SHOP_TO_SKU_SZ_CLR created for UML association "shop to sku sz clr"';

CREATE TABLE  SHOP_SUB_CATS 
( 
  SHOP_SUB_CAT_CODE VARCHAR(18) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_SUB_CAT_CODE created from UML attribute "shop sub cat code" in UML class "shop sub cat"' 
, SHOP_SUB_CAT_NAME VARCHAR(200) NULL COMMENT 'UML to Offline Database Transform: Column SHOP_SUB_CAT_NAME created from UML attribute "shop sub cat name" in UML class "shop sub cat"' 
, SUB_CAT_IMAGE_NAME VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column SUB_CAT_IMAGE_NAME created from UML attribute "sub cat image name" in UML class "shop sub cat"' 
, SUB_CAT_IMAGE_TYPE VARCHAR(9) NULL COMMENT 'UML to Offline Database Transform: Column SUB_CAT_IMAGE_TYPE created from UML attribute "sub cat image type" in UML class "shop sub cat"' 
, SHOP_CAT_CODE VARCHAR(14) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOP_CAT_TO_SUB_CAT created as default foreign key column for foreign key "SHOP_CAT_TO_SUB_CAT"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop sub cat"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP 
, CONSTRAINT PRIMARY KEY ( SHOP_SUB_CAT_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHOP_SUB_CATS created from UML class "shop sub cat"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SHOP_CAT_TO_SUB_CAT created for UML association "shop cat to sub cat"';

CREATE TABLE  SHOP_SUB_CAT_PROP_CLASSES 
( 
  SHP_SUB_CAT_PRP_CLS_CODE VARCHAR(22) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHP_SUB_CAT_PRP_CLS_CODE created from UML attribute "shp sub cat prp cls code" in UML class "shop sub cat prop class"' 
, SHP_SUB_CAT_PRP_CLS_NAME VARCHAR(200) NULL COMMENT 'UML to Offline Database Transform: Column SHP_SUB_CAT_PRP_CLS_NAME created from UML attribute "shp sub cat prp cls name" in UML class "shop sub cat prop class"' 
, SHOP_SUB_CAT_CODE VARCHAR(18) NULL COMMENT 'UML to Offline Database Transform: Column SHOP_CAT_PROP_CLASS created as default foreign key column for foreign key "SHOP_CAT_PROP_CLASS"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shop sub cat prop class"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop sub cat prop class"' 
, CONSTRAINT PRIMARY KEY ( SHP_SUB_CAT_PRP_CLS_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHOP_SUB_CAT_PROP_CLASSES created from UML class "shop sub cat prop class"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SHOP_CAT_PROP_CLASS created for UML association "shop cat prop class"';

CREATE TABLE  SHOP_SUB_CAT_PROP_CLASS_DETS 
( 
  SHP_SUBCAT_PRP_CLS_DET_CODE VARCHAR(25) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHP_SUBCAT_PRP_CLS_DET_CODE created from UML attribute "shp subcat prp cls det code" in UML class "shop sub cat prop class det"' 
, PROP_CLS_DET_NAME VARCHAR(4000) NULL COMMENT 'UML to Offline Database Transform: Column PROP_CLS_DET_NAME created from UML attribute "prop cls det name" in UML class "shop sub cat prop class det"' 
, PROP_CLASS_CODE VARCHAR(22) NOT NULL COMMENT 'UML to Offline Database Transform: Column PROP_CLSS_TO_DET created as default foreign key column for foreign key "PROP_CLSS_TO_DET"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shop sub cat prop class det"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP 
, CONSTRAINT PRIMARY KEY ( SHP_SUBCAT_PRP_CLS_DET_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHOP_SUB_CAT_PROP_CLASS_DETS created from UML class "shop sub cat prop class det"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint PROP_CLSS_TO_DET created for UML association "prop clss to det"';

CREATE TABLE  SIZE_CLASSES 
( 
  SZ_CLASS_CODE VARCHAR(3) NOT NULL COMMENT 'UML to Offline Database Transform: Column SZ_CLASS_CODE created from UML attribute "sz class code" in UML class "size class"' 
, SZ_CLASS_NAME VARCHAR(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column SZ_CLASS_NAME created from UML attribute "sz class name" in UML class "size class"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "size class"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP 
, CONSTRAINT PRIMARY KEY ( SZ_CLASS_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SIZE_CLASSES created from UML class "size class"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default';

CREATE TABLE  SIZE_CLASS_DETS 
( 
  SZ_DET_CODE VARCHAR(6) NOT NULL COMMENT 'UML to Offline Database Transform: Column SZ_DET_CODE created from UML attribute "sz det code" in UML class "size class det"' 
, SZ_DET_NAME VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column SZ_DET_NAME created from UML attribute "sz det name" in UML class "size class det"' 
, SZ_CLASS_CODE VARCHAR(3) NULL COMMENT 'UML to Offline Database Transform: Column SIZE_TO_SIZE_DET created as default foreign key column for foreign key "SIZE_TO_SIZE_DET"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "size class det"' 
, CONSTRAINT PRIMARY KEY ( SZ_DET_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SIZE_CLASS_DETS created from UML class "size class det"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SIZE_TO_SIZE_DET created for UML association "size to size det"';

CREATE TABLE  SIZE_CLASS_DET_PARAMS 
( 
  SZ_DET_PRM_CODE VARCHAR(6) NOT NULL COMMENT 'UML to Offline Database Transform: Column SZ_DET_PRM_CODE created from UML attribute "sz det prm code" in UML class "size class det param"' 
, SZ_DET_PRM_NAME VARCHAR(200) NULL COMMENT 'UML to Offline Database Transform: Column SZ_DET_PRM_NAME created from UML attribute "sz det prm name" in UML class "size class det param"' 
, SZ_CLASS_CODE VARCHAR(3) NULL COMMENT 'UML to Offline Database Transform: Column SIZE_CLASS_PARAM created as default foreign key column for foreign key "SIZE_CLASS_PARAM"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "size class det param"' 
, CONSTRAINT PRIMARY KEY ( SZ_DET_PRM_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SIZE_CLASS_DET_PARAMS created from UML class "size class det param"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SIZE_CLASS_PARAM created for UML association "size class param"';

CREATE TABLE  SIZ_CLASS_DET_PRM_VALS 
( 
  SZ_DET_PRM_VAL_CODE VARCHAR(11) NOT NULL COMMENT 'UML to Offline Database Transform: Column SZ_DET_PRM_VAL_CODE created from UML attribute "sz det prm val code" in UML class "siz class det prm val"' 
, SZ_DET_PRM_CODE VARCHAR(6) NULL COMMENT 'UML to Offline Database Transform: Column DET_PARAM_VAL created as default foreign key column for foreign key "DET_PARAM_VAL"' 
, SZ_DET_CODE VARCHAR(6) NULL COMMENT 'UML to Offline Database Transform: Column SZ_CLASS_DET_PRM_VAL created as default foreign key column for foreign key "SZ_CLASS_DET_PRM_VAL"' 
, PRM_VAL VARCHAR(50) NULL COMMENT 'UML to Offline Database Transform: Column PRM_VAL created from UML attribute "prm val" in UML class "siz class det prm val"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "siz class det prm val"' 
, CONSTRAINT PRIMARY KEY ( SZ_DET_PRM_VAL_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SIZ_CLASS_DET_PRM_VALS created from UML class "siz class det prm val"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint DET_PARAM_VAL created for UML association "det param val"
UML to Offline Database Transform: Foreign key constraint SZ_CLASS_DET_PRM_VAL created for UML association "sz class det prm val"';

CREATE TABLE  SKUS
( 
  SKU_CODE VARCHAR(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_CODE created from UML attribute "sku code" in UML class "sku"' 
, SKU_NAME VARCHAR(200) NULL COMMENT 'UML to Offline Database Transform: Column SKU_NAME created from UML attribute "sku name" in UML class "sku"' 
, AVAILABLE VARCHAR(1) NULL DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "sku"' 
, HIDE VARCHAR(1) NULL DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column HIDE created from UML attribute "hide" in UML class "sku"' 
, RATE INT(5) NULL COMMENT 'UML to Offline Database Transform: Column RATE created from UML attribute "rate" in UML class "sku"' 
, QNTY_IN_STOCK INT(4) NULL DEFAULT 0 COMMENT 'UML to Offline Database Transform: Column QNTY_IN_STOCK created from UML attribute "qnty in stock" in UML class "sku"' 
, LAST_PRICE DECIMAL(9, 2) NULL COMMENT 'UML to Offline Database Transform: Column LAST_PRICE created from UML attribute "last price" in UML class "sku"' 
, APPEAR_ONLY_IN_ASS VARCHAR(1) NULL DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column APPEAR_ONLY_IN_ASS created from UML attribute "appear only in ass" in UML class "sku"' 
, ASSEMBLY VARCHAR(1) NULL DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column ASSEMBLY created from UML attribute "assembly" in UML class "sku"' 
, OLD_PRICE DECIMAL(9, 2) NULL COMMENT 'UML to Offline Database Transform: Column OLD_PRICE created from UML attribute "old price" in UML class "sku"' 
, SHOP_CAT_SUB_CODE VARCHAR(18) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOPCAT_SKU created as default foreign key column for foreign key "SHOPCAT_SKU"' 
, SHP_PROP_CLS_CODE VARCHAR(22) NULL COMMENT 'UML to Offline Database Transform: Column SHP_CAT_PROP_CLS_TO_SHU created as default foreign key column for foreign key "SHP_CAT_PROP_CLS_TO_SHU"' 
, BRAND_CODE VARCHAR(6) NULL COMMENT 'UML to Offline Database Transform: Column SKU_BRAND created as default foreign key column for foreign key "SKU_BRAND"' 
, MNF_CODE VARCHAR(6) NULL COMMENT 'UML to Offline Database Transform: Column SKU_MANUFACTURER created as default foreign key column for foreign key "SKU_MANUFACTURER"' 
, MODEL_CODE VARCHAR(9) NULL COMMENT 'UML to Offline Database Transform: Column SKU_MODEL created as default foreign key column for foreign key "SKU_MODEL"' 
, YEAR INT(4) NULL COMMENT 'UML to Offline Database Transform: Column SKU_YEAR created as default foreign key column for foreign key "SKU_YEAR"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sku"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "sku"' 
, BASIC_UNIT VARCHAR(4) NULL 
, CONSTRAINT PRIMARY KEY ( SKU_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SKUS created from UML class "sku"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SHOPCAT_SKU created for UML association "shopcat sku"
UML to Offline Database Transform: Foreign key constraint SHP_CAT_PROP_CLS_TO_SHU created for UML association "shp cat prop cls to shu"
UML to Offline Database Transform: Foreign key constraint SKU_BRAND created for UML association "sku brand"
UML to Offline Database Transform: Foreign key constraint SKU_MANUFACTURER created for UML association "sku manufacturer"
UML to Offline Database Transform: Foreign key constraint SKU_MODEL created for UML association "sku model"
UML to Offline Database Transform: Foreign key constraint SKU_YEAR created for UML association "sku year"';

CREATE TABLE  SKU_ASSEMBLIES 
( 
  SKU_ASS_COMP_CODE VARCHAR(47) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_ASS_COMP_CODE created from UML attribute "sku ass comp code" in UML class "sku assembly"' 
, SKU_SEQ INT(3) NULL COMMENT 'UML to Offline Database Transform: Column SKU_SEQ created from UML attribute "sku seq" in UML class "sku assembly"' 
, AVAILABLE VARCHAR(1) NULL COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "sku assembly"' 
, HIDE VARCHAR(1) NULL COMMENT 'UML to Offline Database Transform: Column HIDE created from UML attribute "hide" in UML class "sku assembly"' 
, SKU_ASS_CODE VARCHAR(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column MAIN_SKU_TO_ASSEMBLY created as default foreign key column for foreign key "MAIN_SKU_TO_ASSEMBLY"' 
, SKU_ASS_COMP VARCHAR(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_ASS_COMP created as default foreign key column for foreign key "SKU_TO_ASS_COMP"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sku assembly"' 
, NOTES VARCHAR(500) NULL 
, QTY_IN_ASS INT(3)
, CONSTRAINT PRIMARY KEY ( SKU_ASS_COMP_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SKU_ASSEMBLIES created from UML class "sku assembly"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint MAIN_SKU_TO_ASSEMBLY created for UML association "main sku to assembly"
UML to Offline Database Transform: Foreign key constraint SKU_TO_ASS_COMP created for UML association "sku to ass comp"';

CREATE TABLE  SKU_COLORS 
( 
  SKU_CLR_CODE VARCHAR(28) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_CLR_CODE created from UML attribute "sku clr code" in UML class "sku color"' 
, CLR_CODE VARCHAR(9) NOT NULL COMMENT 'UML to Offline Database Transform: Column CLR_CODE created from UML attribute "clr code" in UML class "sku color"' 
, CLR_NAME VARCHAR(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column CLR_CODE created from UML attribute "clr name" in UML class "sku color"' 
, SKU_CODE VARCHAR(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_COLORS created as default foreign key column for foreign key "SKU_TO_COLORS"' 
, AVAILABLE VARCHAR(1) NULL COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "sku color"' 
, RATE INT(5) NULL COMMENT 'UML to Offline Database Transform: Column RATE created from UML attribute "rate" in UML class "sku color"' 
, QNTY_IN_STOCK INT(4) NULL DEFAULT 0 COMMENT 'UML to Offline Database Transform: Column QNTY_IN_STOCK created from UML attribute "qnty in stock" in UML class "sku color"' 
, LAST_PRICE DECIMAL(9, 2) NULL COMMENT 'UML to Offline Database Transform: Column LAST_PRICE created from UML attribute "last price" in UML class "sku color"' 
, OLP_PRICE DECIMAL(9, 2) NULL COMMENT 'UML to Offline Database Transform: Column OLP_PRICE created from UML attribute "olp price" in UML class "sku color"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "sku color"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sku color"' 
, CONSTRAINT PRIMARY KEY ( SKU_CLR_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SKU_COLORS created from UML class "sku color"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SKU_TO_COLORS created for UML association "sku to colors"';

--CREATE TABLE  SKU_IMAGES 
--( 
--  SKU_IMG_CODE VARCHAR(25) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_IMG_CODE created from UML attribute "sku img code" in UML class "sku image"' 
--, SKU_CODE VARCHAR(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_SKU_IMAGE created as default foreign key column for foreign key "SKU_TO_SKU_IMAGE"' 
--, IMG_CODE VARCHAR(2) NOT NULL COMMENT 'UML to Offline Database Transform: Column IMG_CODE created from UML attribute "img code" in UML class "sku image"' 
--, IMAGE_PATH VARCHAR(100) NULL 
--, IMG_NAME VARCHAR(50) NULL COMMENT 'UML to Offline Database Transform: Column IMG__NAME created from UML attribute "img  name" in UML class "sku image"' 
--, IMG_SEQ INT(1) NULL COMMENT 'UML to Offline Database Transform: Column IMG_SEQ created from UML attribute "img seq" in UML class "sku image"' 
--, IMG_TYPE VARCHAR(20) NULL COMMENT 'UML to Offline Database Transform: Column IMG_TYPE created from UML attribute "img type" in UML class "sku image"' 
--, NOTES VARCHAR(500) NULL 
--, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sku image"' 
--, CONSTRAINT PRIMARY KEY ( SKU_IMG_CODE ) ) 
--COMMENT = 'UML to Offline Database Transform: Table SKU_IMAGES created from UML class "sku image"
--UML to Offline Database Transform: Primary key constraint PRIMARY created by default
--UML to Offline Database Transform: Foreign key constraint SKU_TO_SKU_IMAGE created for UML association "sku to sku image"';

CREATE TABLE  SKU_PROP_DETS 
( 
  SKU_PROP_DET_CODE VARCHAR(26) NOT NULL COMMENT 'Equals to SKU_CODE concatenate SUBSTR(SHP_SUBCAT_PRP_CLS_DET_CODE,-3). increment by 1.' 
, SKU_PROP_DET_NAME VARCHAR(4000) NULL COMMENT 'UML to Offline Database Transform: Column SKU_PROP_DET_NAME created from UML attribute "sku prop det name" in UML class "sku prop det"' 
, SHP_SUBCAT_PRP_CLS_DET_CODE VARCHAR(25) NOT NULL COMMENT 'UML to Offline Database Transform: Column PROP_DET_TO_ITEM_DET created as default foreign key column for foreign key "PROP_DET_TO_ITEM_DET"' 
, SKU_CODE VARCHAR(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_SKU_PROP created as default foreign key column for foreign key "SKU_TO_SKU_PROP"' 
, HIDE VARCHAR(1) NULL DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column HIDE created from UML attribute "hide" in UML class "sku prop det"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "sku prop det"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sku prop det"' 
, CONSTRAINT PRIMARY KEY ( SKU_PROP_DET_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SKU_PROP_DETS created from UML class "sku prop det"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint PROP_DET_TO_ITEM_DET created for UML association "prop det to item det"
UML to Offline Database Transform: Foreign key constraint SKU_TO_SKU_PROP created for UML association "sku to sku prop"';

CREATE TABLE  SKU_SIZES 
( 
  SKU_SIZE_CODE VARCHAR(29) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_SIZE_CODE created from UML attribute "sku size code" in UML class "sku size"' 
, SKU_CODE VARCHAR(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_SKU_SIZES created as default foreign key column for foreign key "SKU_TO_SKU_SIZES"' 
, SIZE_DET_CODE VARCHAR(6) NOT NULL COMMENT 'UML to Offline Database Transform: Column SZ_CLS_DET_TO_SKU_SZS created as default foreign key column for foreign key "SZ_CLS_DET_TO_SKU_SZS"' 
, AVAILABLE VARCHAR(1) NULL DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "sku size"' 
, RATE INT(5) NULL COMMENT 'UML to Offline Database Transform: Column RATE created from UML attribute "rate" in UML class "sku size"' 
, QNTY_IN_STOCK INT(4) NULL DEFAULT 0 COMMENT 'UML to Offline Database Transform: Column QNTY_IN_STOCK created from UML attribute "qnty in stock" in UML class "sku size"' 
, LAST_PRICE DECIMAL(9, 2) NULL COMMENT 'UML to Offline Database Transform: Column LAST_PRICE created from UML attribute "last price" in UML class "sku size"' 
, OLD_PRICE DECIMAL(9, 2) NULL COMMENT 'UML to Offline Database Transform: Column OLD_PRICE created from UML attribute "old price" in UML class "sku size"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "sku size"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sku size"' 
, CONSTRAINT PRIMARY KEY ( SKU_SIZE_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SKU_SIZES created from UML class "sku size"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SKU_TO_SKU_SIZES created for UML association "sku to sku sizes"
UML to Offline Database Transform: Foreign key constraint SZ_CLS_DET_TO_SKU_SZS created for UML association "sz cls det to sku szs"';

CREATE TABLE  SKU_SIZE_COLORS 
( 
  SKU_SZ_CLR_CODE VARCHAR(37) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_SZ_CLR_CODE created from UML attribute "sku sz clr code" in UML class "sku size color"' 
, SKU_SIZE_CODE VARCHAR(29) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_SZ_TO_SKU_SZ_CLR created as default foreign key column for foreign key "SKU_SZ_TO_SKU_SZ_CLR"' 
, SKU_CLR_CODE VARCHAR(28) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_CLR_TO_SKU_SZ_CLR created as default foreign key column for foreign key "SKU_CLR_TO_SKU_SZ_CLR"' 
, AVAILABLE VARCHAR(1) NULL DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "sku size color"' 
, RATE INT(5) NULL COMMENT 'UML to Offline Database Transform: Column RATE created from UML attribute "rate" in UML class "sku size color"' 
, QNTY_IN_STOCK INT(4) NULL DEFAULT 0 COMMENT 'UML to Offline Database Transform: Column QNTY_IN_STOCK created from UML attribute "qnty in stock" in UML class "sku size color"' 
, LAST_PRICE DECIMAL(9, 2) NULL COMMENT 'UML to Offline Database Transform: Column LAST_PRICE created from UML attribute "last price" in UML class "sku size color"' 
, OLD_PRICE DECIMAL(9, 2) NULL COMMENT 'UML to Offline Database Transform: Column OLD_PRICE created from UML attribute "old price" in UML class "sku size color"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "sku size color"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sku size color"' 
, CONSTRAINT PRIMARY KEY ( SKU_SZ_CLR_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SKU_SIZE_COLORS created from UML class "sku size color"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SKU_CLR_TO_SKU_SZ_CLR created for UML association "sku clr to sku sz clr"
UML to Offline Database Transform: Foreign key constraint SKU_SZ_TO_SKU_SZ_CLR created for UML association "sku sz to sku sz clr"';

CREATE TABLE  SKU_CLR_IMAGES 
( 
  SKU_CLR_IMG_CODE VARCHAR(35) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_SZ_CLR_IMG_CODE created from UML attribute "sku sz clr img code" in UML class "sku sz clr image"' 
, IMG_CODE VARCHAR(7) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_IMGS_TO_SZ_CLR_IMGS created as default foreign key column for foreign key "SKU_IMGS_TO_SZ_CLR_IMGS"' 
, IMG_NAME VARCHAR(50)
, IMG_SEQ  INT(2)
, IMG_PATH VARCHAR(100)
, IMG_TYPE VARCHAR(20)
, SKU_SZ_CLR_CODE VARCHAR(28) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_SZ_CLR_TO_SKU_SZ_CLR_IMG created as default foreign key column for foreign key "SKU_SZ_CLR_TO_SKU_SZ_CLR_IMG"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "sku sz clr image"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP 
, CONSTRAINT PRIMARY KEY ( SKU_CLR_IMG_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SKU_CLR_IMAGES created from UML class "sku sz clr image"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SKU_IMGS_TO_SZ_CLR_IMGS created for UML association "sku imgs to sz clr imgs"
UML to Offline Database Transform: Foreign key constraint SKU_SZ_CLR_TO_SKU_SZ_CLR_IMG created for UML association "sku sz clr to sku sz clr img"';

CREATE TABLE  SKU_UNITS 
( 
  SKU_UNIT_CODE VARCHAR(27) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_UNIT_CODE created from UML attribute "sku unit code" in UML class "sku unit"' 
, SKU_CODE VARCHAR(23) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_SKU_UNIT created as default foreign key column for foreign key "SKU_TO_SKU_UNIT"' 
, UNIT_CODE VARCHAR(4) NOT NULL COMMENT 'UML to Offline Database Transform: Column UNIT_TO_SKU_UNIT created as default foreign key column for foreign key "UNIT_TO_SKU_UNIT"' 
, LAST_PRICE DECIMAL(9, 2) NULL COMMENT 'UML to Offline Database Transform: Column LAST_PRICE created from UML attribute "last price" in UML class "sku unit"' 
, OLD_PRICE DECIMAL(9, 2) NULL COMMENT 'UML to Offline Database Transform: Column OLD_PRICE created from UML attribute "old price" in UML class "sku unit"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "sku unit"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sku unit"' 
, CONSTRAINT PRIMARY KEY ( SKU_UNIT_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SKU_UNITS created from UML class "sku unit"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SKU_TO_SKU_UNIT created for UML association "sku to sku unit"
UML to Offline Database Transform: Foreign key constraint UNIT_TO_SKU_UNIT created for UML association "unit to sku unit"';

CREATE TABLE  SYS_PARAMETERS 
( 
  SYS_PARAMETER_ID NUMERIC NOT NULL COMMENT 'UML to Offline Database Transform: Column SYS_PARAMETER_ID created as default primary key column' 
, WEB_SERVER_IP VARCHAR(20) NULL COMMENT 'UML to Offline Database Transform: Column WEB_SERVER_IP created from UML attribute "web server ip" in UML class "sys parameter"' 
, WEB_SERVER_NAME VARCHAR(20) NULL COMMENT 'UML to Offline Database Transform: Column WEB_SERVER_NAME created from UML attribute "web server name" in UML class "sys parameter"' 
, FILE_SERVER_IP VARCHAR(20) NULL COMMENT 'UML to Offline Database Transform: Column FILE_SERVER_IP created from UML attribute "file server ip" in UML class "sys parameter"' 
, FILE_SERVER_NAME VARCHAR(20) NULL COMMENT 'UML to Offline Database Transform: Column FILE_SERVER_NAME created from UML attribute "file server name" in UML class "sys parameter"' 
, SMTP_HOST VARCHAR(50) NULL COMMENT 'UML to Offline Database Transform: Column SMTP_HOST created from UML attribute "smtp host" in UML class "sys parameter"' 
, SMTP_PORT INT(4) NULL COMMENT 'UML to Offline Database Transform: Column SMTP_PORT created from UML attribute "smtp port" in UML class "sys parameter"' 
, SSL_OR_TSL VARCHAR(1) NULL COMMENT 'UML to Offline Database Transform: Column SSL_OR_TSL created from UML attribute "ssl or tsl" in UML class "sys parameter"' 
, SHOP_ADMIN_NAME VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column SHOP_ADMIN_NAME created from UML attribute "shop admin name" in UML class "sys parameter"' 
, SHOP_USER_NAME VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column SHOP_USER_NAME created from UML attribute "shop user name" in UML class "sys parameter"' 
, SHOP_CODE VARCHAR(9) NULL COMMENT 'UML to Offline Database Transform: Column SHOP_TO_SYS_PRM created as default foreign key column for foreign key "SHOP_TO_SYS_PRM"' 
, FILE_SERVER_PATH VARCHAR(200) NULL COMMENT 'UML to Offline Database Transform: Column SHOP_USER_NAME created from UML attribute "file server path" in UML class "sys parameter"' 
, NOIMAGE_PATH VARCHAR(200) NULL COMMENT 'UML to Offline Database Transform: Column NOIMAGE_PATH created from UML attribute "noimage path" in UML class "sys parameter"' 
, CONSTRAINT PRIMARY KEY ( SYS_PARAMETER_ID ) ) 
COMMENT = 'UML to Offline Database Transform: Table SYS_PARAMETERS created from UML class "sys parameter"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SHOP_TO_SYS_PRM created for UML association "shop to sys prm"';

CREATE TABLE SYS_IMAGES 
( 
  SYS_IMAGE_ID VARCHAR(1) NOT NULL COMMENT 'UML to Offline Database Transform: Column SYS_IMAGE_ID created from UML attribute "sys image id" in UML class "sys image"' 
, IMG_NAME VARCHAR(20) NULL COMMENT 'UML to Offline Database Transform: Column IMG_NAME created from UML attribute "img name" in UML class "sys image"' 
, IMG_PATH VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column IMG_PATH created from UML attribute "img path" in UML class "sys image"' 
, IMG_FORMAT VARCHAR(20) NULL COMMENT 'UML to Offline Database Transform: Column IMG_FORMAT created from UML attribute "img format" in UML class "sys image"' 
, HIDE VARCHAR(1) NULL DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column HIDE created from UML attribute "hide" in UML class "sys image"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "sys image"' 
, SYS_PARAMETER_ID NUMERIC NULL 
, CONSTRAINT PRIMARY KEY ( SYS_IMAGE_ID ) ) 
COMMENT = 'UML to Offline Database Transform: Table SYS_IMAGES created from UML class "sys image"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default';

CREATE TABLE  UNITS 
( 
  FROM_UNIT VARCHAR(4) NOT NULL COMMENT 'UML to Offline Database Transform: Column FROM_UNIT created from UML attribute "from unit" in UML class "unit"' 
, UNIT_NAME VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column UNIT_NAME created from UML attribute "unit name" in UML class "unit"' 
, BASIC_UNIT VARCHAR(1) NULL DEFAULT 'N' COMMENT 'UML to Offline Database Transform: Column BASIC_UNIT created from UML attribute "basic unit" in UML class "unit"' 
, MULTIPLY_BY INT(4) NULL COMMENT 'UML to Offline Database Transform: Column MULTIPLY_BY created from UML attribute "multiply by" in UML class "unit"' 
, TO_UNIT VARCHAR(4) NOT NULL COMMENT 'UML to Offline Database Transform: Column UNITS_TREE created as default foreign key column for foreign key "UNITS_TREE"' 
, CONSTRAINT PRIMARY KEY ( FROM_UNIT ) ) 
COMMENT = 'UML to Offline Database Transform: Table UNITS created from UML class "unit"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint UNITS_TREE created for UML association "units tree"';

CREATE TABLE  USERS 
( 
  USER_ID VARCHAR(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column USER_ID created from UML attribute "user id" in UML class "user"' 
, USER_NAME VARCHAR(100) NULL COMMENT 'UML to Offline Database Transform: Column USER_NAME created from UML attribute "user name" in UML class "user"' 
, FIRST_NAME VARCHAR(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column FIRST_NAME created from UML attribute "first name" in UML class "user"' 
, FAMILY_NAME VARCHAR(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column FAMILY_NAME created from UML attribute "family name" in UML class "user"' 
, PASSWRD VARCHAR(128) NULL COMMENT 'UML to Offline Database Transform: Column PASSWRD created from UML attribute "passwrd" in UML class "user"' 
, ONE_TIME_CODE VARCHAR(128) NULL COMMENT 'UML to Offline Database Transform: Column ONE_TIME_CODE created from UML attribute "one time code" in UML class "user"' 
, PHOTO_NAME BLOB NULL COMMENT 'UML to Offline Database Transform: Column PHOTO_NAME created from UML attribute "photo name" in UML class "user"' 
, IS_ADMIN VARCHAR(1) NULL COMMENT 'UML to Offline Database Transform: Column IS_ADMIN created from UML attribute "is admin" in UML class "user"' 
, PHOTO_TYPE VARCHAR(20) NULL COMMENT 'UML to Offline Database Transform: Column PHOTO_TYPE created from UML attribute "photo type" in UML class "user"' 
, SHOP_CODE VARCHAR(9) NULL COMMENT 'UML to Offline Database Transform: Column SHOP_TO_SHOP_ADMIN created as default foreign key column for foreign key "SHOP_TO_SHOP_ADMIN"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "user"' 
, NOTES VARCHAR(500) NULL
, ACTIVE VARCHAR(2) NULL DEFAULT 'Y'
, CONSTRAINT PRIMARY KEY ( USER_ID ) ) 
COMMENT = 'UML to Offline Database Transform: Table USERS created from UML class "user"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SHOP_TO_SHOP_ADMIN created for UML association "shop to shop admin"';

CREATE TABLE shopping_dets
( 
  DET_ID VARCHAR(33) NOT NULL COMMENT 'UML to Offline Database Transform: Column DET_ID created from UML attribute "det id" in UML class "shopping det"' 
, TRANS_ID VARCHAR(30) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOPPING_MAST_DET created as default foreign key column for foreign key "SHOPPING_MAST_DET"' 
, SKU_CODE VARCHAR(23) NULL 
, CLR_CODE VARCHAR(5) NULL COMMENT 'UML to Offline Database Transform: Column CLR_CODE created from UML attribute "clr code" in UML class "shopping det"' 
, SIZE_DET_CODE VARCHAR(6) NULL 
, UNIT_CODE VARCHAR(4) NULL 
, QTY INT(3) NULL DEFAULT 0 COMMENT 'UML to Offline Database Transform: Column QTY created from UML attribute "qty" in UML class "shopping det"' 
, UNIT_PRICE INT(11) NULL DEFAULT 0 COMMENT 'UML to Offline Database Transform: Column UNIT_PRICE created from UML attribute "unit price" in UML class "shopping det"' 
, TOTAL_PRICE INT(11) NULL COMMENT 'UML to Offline Database Transform: Column TOTAL_PRICE created from UML attribute "total price" in UML class "shopping det"' 
, SKU_STATUS VARCHAR(2) NULL COMMENT 'UML to Offline Database Transform: Column SKU_STATUS created from UML attribute "sku status" in UML class "shopping det"' 
, AVAILABLE VARCHAR(1) NULL COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "shopping det"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shopping det"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shopping det"' 
, CONSTRAINT PRIMARY KEY ( DET_ID ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHOPPING_DETS created from UML class "shopping det"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SHOPPING_MAST_DET created for UML association "shopping mast det"';

CREATE TABLE shopping_masters 
( 
  TRANS_ID VARCHAR(30) NOT NULL COMMENT 'UML to Offline Database Transform: Column TRANS_ID created from UML attribute "trans id" in UML class "shopping master"' 
, USER_ID VARCHAR(100) NOT NULL 
, TRANS_DATE_TIME DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column TRANS_DATE_TIME created from UML attribute "trans date time" in UML class "shopping master"' 
, TRANS_VALUE INT(11) NULL COMMENT 'UML to Offline Database Transform: Column TRANS_VALUE created from UML attribute "trans value" in UML class "shopping master"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shopping master"' 
, MOB_NO VARCHAR(15) NULL COMMENT 'UML to Offline Database Transform: Column MOB_NO created from UML attribute "mob no" in UML class "shopping master"' 
, ADDRESS VARCHAR(200) NULL COMMENT 'UML to Offline Database Transform: Column ADDRESS created from UML attribute "address" in UML class "shopping master"' 
, TRANS_STATUS VARCHAR(2) NULL COMMENT 'UML to Offline Database Transform: Column TRANS_STATUS created from UML attribute "trans status" in UML class "shopping master"' 
, PAYMENT_ID VARCHAR(30) NULL COMMENT 'UML to Offline Database Transform: Column PAYMENT_ID created from UML attribute "payment id" in UML class "shopping master"' 
, CONSTRAINT PRIMARY KEY ( TRANS_ID ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHOPPING_MASTERS created from UML class "shopping master"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default';

ALTER TABLE SHOPPING_DETS ADD CONSTRAINT SHOPPING_MAST_DETS FOREIGN KEY ( TRANS_ID )
 REFERENCES SHOPPING_MASTERS ( TRANS_ID );

ALTER TABLE SHOPPING_DETS ADD CONSTRAINT SIZE_TO_SHOPPING_DETS_FK FOREIGN KEY ( SIZE_DET_CODE )
 REFERENCES SIZE_CLASS_DETS ( SZ_DET_CODE );

ALTER TABLE SHOPPING_DETS ADD CONSTRAINT SKU_TO_SHOPPING_DETS_FK FOREIGN KEY ( SKU_CODE )
 REFERENCES SKUS ( SKU_CODE );

ALTER TABLE SHOPPING_DETS ADD CONSTRAINT UNIT_TO_SHOPPING_DETS_FK FOREIGN KEY ( UNIT_CODE )
 REFERENCES UNITS ( FROM_UNIT );

ALTER TABLE SHOPPING_MASTERS ADD CONSTRAINT USER_TO_SHOPPING_MAST_FK FOREIGN KEY ( USER_ID )
 REFERENCES USERS ( USER_ID );

CREATE INDEX SHOPPING_DETS_INDEX ON SHOPPING_DETS ( DET_ID ASC);

CREATE INDEX SIZE_TO_SHOPPING_DETS_INDEX ON SHOPPING_DETS ( SIZE_DET_CODE ASC);

CREATE INDEX SKU_TO_SHOPPING_DETS_INDEX ON SHOPPING_DETS ( SKU_CODE ASC);

CREATE INDEX UNIT_TO_SHOPPING_DETS_INDEX ON SHOPPING_DETS ( UNIT_CODE ASC);

CREATE INDEX SHOPPING_MASTERS_INDEX ON SHOPPING_MASTERS ( TRANS_ID);

CREATE TABLE  USERS_WISH_LISTS 
( 
  USER_ID_SKU_CODE VARCHAR(138) NOT NULL COMMENT 'UML to Offline Database Transform: Column USER_ID_SKU_CODE created from UML attribute "user id sku code" in UML class "users wish list"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "users wish list"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "users wish list"' 
, SKU_SZ_CLR_CODE VARCHAR(37) NULL 
, USER_ID VARCHAR(100) NULL 
, CONSTRAINT PRIMARY KEY ( USER_ID_SKU_CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table USERS_WISH_LISTS created from UML class "users wish list"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default';

CREATE TABLE shopbook.SHIP_RTRN_POLICIES 
( 
  CODE VARCHAR(5) NOT NULL COMMENT 'UML to Offline Database Transform: Column CODE created from UML attribute "code" in UML class "ship rtrn policy"' 
, TYPE VARCHAR(1) NOT NULL COMMENT 'UML to Offline Database Transform: Column TYPE created from UML attribute "type" in UML class "ship rtrn policy"' 
, TXT VARCHAR(500) NOT NULL COMMENT 'UML to Offline Database Transform: Column TXT created from UML attribute "txt" in UML class "ship rtrn policy"' 
, ORDR INT(3) NOT NULL COMMENT 'UML to Offline Database Transform: Column ORDR created from UML attribute "ordr" in UML class "ship rtrn policy"' 
, ACTIVE VARCHAR(1) NOT NULL DEFAULT 'Y' COMMENT 'UML to Offline Database Transform: Column ACTIVE created from UML attribute "active" in UML class "ship rtrn policy"' 
, LAST_MODIFIED DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "ship rtrn policy"' 
, CONSTRAINT PRIMARY KEY ( CODE ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHIP_RTRN_POLICIES created from UML class "ship rtrn policy"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default';

CREATE INDEX shopbook.SHIP_RTRN_POLICIES_INDEX ON shopbook.SHIP_RTRN_POLICIES ( CODE ASC);

CREATE TABLE  YEARS 
( 
  YEAR INT(4) NOT NULL COMMENT 'UML to Offline Database Transform: Column YEAR created from UML attribute "year" in UML class "year"' 
, REGISTER_STATUS VARCHAR(1) NOT NULL DEFAULT 'R' COMMENT 'UML to Offline Database Transform: Column REGISTER_STATUS created from UML attribute "register status" in UML class "year"' 
, CONSTRAINT PRIMARY KEY ( YEAR ) ) 
COMMENT = 'UML to Offline Database Transform: Table YEARS created from UML class "year"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default';

ALTER TABLE  BRANDS ADD CONSTRAINT SHOP_REQ_NEW_BRANDS FOREIGN KEY ( SHOP_CODE )
 REFERENCES  SHOPS ( SHOP_CODE );

ALTER TABLE  CATEGORY_TREES ADD CONSTRAINT TREE_CHILD FOREIGN KEY ( CHILD_CATEGORY )
 REFERENCES  CATEGORIES ( CAT_CODE );

--ALTER TABLE  CATEGORY_TREES ADD CONSTRAINT TREE_PARENT FOREIGN KEY ( PARENT_CATEGORY )
-- REFERENCES  CATEGORIES ( CAT_CODE );

ALTER TABLE  CAT_MNF_BRND_MDL_YERS ADD CONSTRAINT BRAND_TO_CAT FOREIGN KEY ( BRAND_CODE )
 REFERENCES  BRANDS ( BRAND_CODE );

ALTER TABLE  CAT_MNF_BRND_MDL_YERS ADD CONSTRAINT CAT_MBMY FOREIGN KEY ( CAT_CODE )
 REFERENCES  CATEGORIES ( CAT_CODE );

ALTER TABLE  CAT_MNF_BRND_MDL_YERS ADD CONSTRAINT MANUFACTURE_TO_CAT FOREIGN KEY ( MNF_CODE )
 REFERENCES  MANUFACTURES ( MNF_CODE );

ALTER TABLE  CAT_MNF_BRND_MDL_YERS ADD CONSTRAINT MODEL_TO_CAT FOREIGN KEY ( MODEL_CODE )
 REFERENCES  MODELS ( MODEL_CODE );

ALTER TABLE  CAT_MNF_BRND_MDL_YERS ADD CONSTRAINT YEAR_TO_CAT FOREIGN KEY ( YEAR )
 REFERENCES  YEARS ( YEAR );

ALTER TABLE  CAT_SIZE_CLASSES ADD CONSTRAINT CAT_TO_CAT_SIZE_CLASS FOREIGN KEY ( CAT_CODE )
 REFERENCES  CATEGORIES ( CAT_CODE );

ALTER TABLE  CAT_SIZE_CLASSES ADD CONSTRAINT SIZE_CLS_TO_CAT_SIZE_CLASS FOREIGN KEY ( SZ_CLASS_CODE )
 REFERENCES  SIZE_CLASSES ( SZ_CLASS_CODE );

ALTER TABLE  CURRENCY_PRICES ADD CONSTRAINT FROM_CURR_TO_PRICES FOREIGN KEY ( FROM_CURR )
 REFERENCES  COUNTRIES ( CNTRY_CODE2 );

ALTER TABLE  CURRENCY_PRICES ADD CONSTRAINT TO_CURR_TO_PRICES FOREIGN KEY ( TO_CURR )
 REFERENCES  COUNTRIES ( CNTRY_CODE2 );

ALTER TABLE  FAVOURITE_SHOPS ADD CONSTRAINT SHOP_TO_FAVOURITE_SHOP FOREIGN KEY ( SHOP_CODE )
 REFERENCES  SHOPS ( SHOP_CODE );

ALTER TABLE  FAVOURITE_SHOPS ADD CONSTRAINT USER_FAVOURITE_SHOP FOREIGN KEY ( USER_ID )
 REFERENCES  USERS ( USER_ID );

ALTER TABLE  MANUFACTURES ADD CONSTRAINT SHOP_REQ_NEW_MANFS FOREIGN KEY ( SHOP_CODE )
 REFERENCES  SHOPS ( SHOP_CODE );

ALTER TABLE  MODELS ADD CONSTRAINT SHOP_REQ_NEW_MODELS FOREIGN KEY ( SHOP_CODE )
 REFERENCES  SHOPS ( SHOP_CODE );

ALTER TABLE  OFFERS ADD CONSTRAINT SHOP_OFFERS FOREIGN KEY ( SHOP_CODE )
 REFERENCES  SHOPS ( SHOP_CODE );

ALTER TABLE  OFFER_DETS ADD CONSTRAINT OFFERS_TO_OFFER_DET FOREIGN KEY ( OFFER_ID )
 REFERENCES  OFFERS ( SHP_CODE_OFFER_ID );

--ALTER TABLE  OFFER_DETS ADD CONSTRAINT SKU_TO_OFFER_DET FOREIGN KEY ( SKU_CODE )
-- REFERENCES  SKUS ( SKU_CODE );

ALTER TABLE  POSTS ADD CONSTRAINT POSTS_TREE FOREIGN KEY ( POST_CODE_PRNT )
 REFERENCES  POSTS ( POST_CODE );

ALTER TABLE  POSTS ADD CONSTRAINT SHOP_POST FOREIGN KEY ( SHOP_CODE )
 REFERENCES  SHOPS ( SHOP_CODE );

ALTER TABLE  POSTS ADD CONSTRAINT SKU_COLOR_TO_POST FOREIGN KEY ( SKU_CLR_CODE )
 REFERENCES  SKU_COLORS ( SKU_CLR_CODE );

ALTER TABLE  POSTS ADD CONSTRAINT SKU_POST FOREIGN KEY ( SKU_CODE )
 REFERENCES  SKUS ( SKU_CODE );

ALTER TABLE  POSTS ADD CONSTRAINT SKU_SIZE_TO_POST FOREIGN KEY ( SKU_SIZE_CODE )
 REFERENCES  SKU_SIZES ( SKU_SIZE_CODE );

ALTER TABLE  POSTS ADD CONSTRAINT USER_POST FOREIGN KEY ( USER_ID )
 REFERENCES  USERS ( USER_ID );

ALTER TABLE  SHOPS ADD CONSTRAINT COUNTRY_SHOP FOREIGN KEY ( CNTRY_CODE2 )
 REFERENCES  COUNTRIES ( CNTRY_CODE2 );

ALTER TABLE  SHOPS ADD CONSTRAINT SHOP_BRANCH FOREIGN KEY ( PARENT_SHOP_CODE )
 REFERENCES  SHOPS ( SHOP_CODE );

ALTER TABLE  SHOP_CATEGORIES ADD CONSTRAINT CATEGORY_TO_SHOP FOREIGN KEY ( CAT_CODE )
 REFERENCES  CATEGORIES ( CAT_CODE );

ALTER TABLE  SHOP_CATEGORIES ADD CONSTRAINT SHOP_TO_CATEGORY FOREIGN KEY ( SHOP_CODE )
 REFERENCES  SHOPS ( SHOP_CODE );

ALTER TABLE  SHOP_CATEGORY_ADMINS ADD CONSTRAINT ADMIN_TO_ADMIN_CAT FOREIGN KEY ( USER_ID )
 REFERENCES  USERS ( USER_ID );

ALTER TABLE  SHOP_CATEGORY_ADMINS ADD CONSTRAINT SHOP_CATS_TO_ADMIN_CAT FOREIGN KEY ( SHOP_CAT_SUB_CODE )
 REFERENCES  SHOP_SUB_CATS ( SHOP_SUB_CAT_CODE );

ALTER TABLE  SHOP_DOCS ADD CONSTRAINT DOC_TYPE_TO_PROOF_DOC FOREIGN KEY ( CNTRY_DOC_TYPE )
 REFERENCES  SHOP_PROOF_DOC_TYPES ( CNTRY_DOC_TYPE );

ALTER TABLE  SHOP_DOCS ADD CONSTRAINT SHOP_TO_PROOF_DOCS FOREIGN KEY ( SHOP_CODE )
 REFERENCES  SHOPS ( SHOP_CODE );

ALTER TABLE  SHOP_FEES_HISTS ADD CONSTRAINT SHOP_TO_FEES_HIST FOREIGN KEY ( SHOP_CODE )
 REFERENCES  SHOPS ( SHOP_CODE );

ALTER TABLE  SHOP_IMAGESES ADD CONSTRAINT SHOP_TO_SHOP_IMAGES FOREIGN KEY ( SHOP_CODE )
 REFERENCES  SHOPS ( SHOP_CODE );

ALTER TABLE  SHOP_PROOF_DOC_TYPES ADD CONSTRAINT CNTRY_TO_DOC_TYPE FOREIGN KEY ( CNTRY_CODE2 )
 REFERENCES  COUNTRIES ( CNTRY_CODE2 );

ALTER TABLE  SHOP_PROOF_DOC_TYPES ADD CONSTRAINT LANG_TO_SHOP_PROOF_DOC_TYPE FOREIGN KEY ( LANG_CODE )
 REFERENCES  LANGUAGES ( LANG_CODE );

ALTER TABLE  SHOP_SKUS ADD CONSTRAINT SHOP_BRANCH_TO_SKU FOREIGN KEY ( SHOP_CODE )
 REFERENCES  SHOPS ( SHOP_CODE );

ALTER TABLE  SHOP_SKUS ADD CONSTRAINT SHOP_TO_SKU_SZ_CLR FOREIGN KEY ( SKU_SZ_CLR_CODE )
 REFERENCES  SKU_SIZE_COLORS ( SKU_SZ_CLR_CODE );

ALTER TABLE  SHOP_SUB_CATS ADD CONSTRAINT SHOP_CAT_TO_SUB_CAT FOREIGN KEY ( SHOP_CAT_CODE )
 REFERENCES  SHOP_CATEGORIES ( SHOP_CAT_CODE );

ALTER TABLE  SHOP_SUB_CAT_PROP_CLASSES ADD CONSTRAINT SHOP_CAT_PROP_CLASS FOREIGN KEY ( SHOP_SUB_CAT_CODE )
 REFERENCES  SHOP_SUB_CATS ( SHOP_SUB_CAT_CODE );

ALTER TABLE  SHOP_SUB_CAT_PROP_CLASS_DETS ADD CONSTRAINT PROP_CLSS_TO_DET FOREIGN KEY ( PROP_CLASS_CODE )
 REFERENCES  SHOP_SUB_CAT_PROP_CLASSES ( SHP_SUB_CAT_PRP_CLS_CODE );

ALTER TABLE  SIZE_CLASS_DETS ADD CONSTRAINT SIZE_TO_SIZE_DET FOREIGN KEY ( SZ_CLASS_CODE )
 REFERENCES  SIZE_CLASSES ( SZ_CLASS_CODE );

ALTER TABLE  SIZE_CLASS_DET_PARAMS ADD CONSTRAINT SIZE_CLASS_PARAM FOREIGN KEY ( SZ_CLASS_CODE )
 REFERENCES  SIZE_CLASSES ( SZ_CLASS_CODE );

ALTER TABLE  SIZ_CLASS_DET_PRM_VALS ADD CONSTRAINT DET_PARAM_VAL FOREIGN KEY ( SZ_DET_PRM_CODE )
 REFERENCES  SIZE_CLASS_DET_PARAMS ( SZ_DET_PRM_CODE );

ALTER TABLE  SIZ_CLASS_DET_PRM_VALS ADD CONSTRAINT SZ_CLASS_DET_PRM_VAL FOREIGN KEY ( SZ_DET_CODE )
 REFERENCES  SIZE_CLASS_DETS ( SZ_DET_CODE );

ALTER TABLE  SKUS ADD CONSTRAINT SHOPCAT_SKU FOREIGN KEY ( SHOP_CAT_SUB_CODE )
 REFERENCES  SHOP_SUB_CATS ( SHOP_SUB_CAT_CODE );

ALTER TABLE  SKUS ADD CONSTRAINT SHP_CAT_PROP_CLS_TO_SHU FOREIGN KEY ( SHP_PROP_CLS_CODE )
 REFERENCES  SHOP_SUB_CAT_PROP_CLASSES ( SHP_SUB_CAT_PRP_CLS_CODE );

ALTER TABLE  SKUS ADD CONSTRAINT SKU_BRAND FOREIGN KEY ( BRAND_CODE )
 REFERENCES  BRANDS ( BRAND_CODE );

ALTER TABLE  SKUS ADD CONSTRAINT SKU_MANUFACTURER FOREIGN KEY ( MNF_CODE )
 REFERENCES  MANUFACTURES ( MNF_CODE );

ALTER TABLE  SKUS ADD CONSTRAINT SKU_MODEL FOREIGN KEY ( MODEL_CODE )
 REFERENCES  MODELS ( MODEL_CODE );

ALTER TABLE  SKUS ADD CONSTRAINT SKU_YEAR FOREIGN KEY ( YEAR )
 REFERENCES  YEARS ( YEAR );

ALTER TABLE  SKU_ASSEMBLIES ADD CONSTRAINT MAIN_SKU_TO_ASSEMBLY FOREIGN KEY ( SKU_ASS_CODE )
 REFERENCES  SKUS ( SKU_CODE );

ALTER TABLE  SKU_ASSEMBLIES ADD CONSTRAINT SKU_TO_ASS_COMP FOREIGN KEY ( SKU_ASS_COMP )
 REFERENCES  SKUS ( SKU_CODE );

ALTER TABLE  SKU_COLORS ADD CONSTRAINT SKU_TO_COLORS FOREIGN KEY ( SKU_CODE )
 REFERENCES  SKUS ( SKU_CODE );

ALTER TABLE  SKU_IMAGES ADD CONSTRAINT SKU_TO_SKU_IMAGE FOREIGN KEY ( SKU_CODE )
 REFERENCES  SKUS ( SKU_CODE );

ALTER TABLE  SKU_PROP_DETS ADD CONSTRAINT PROP_DET_TO_ITEM_DET FOREIGN KEY ( SHP_SUBCAT_PRP_CLS_DET_CODE )
 REFERENCES  SHOP_SUB_CAT_PROP_CLASS_DETS ( SHP_SUBCAT_PRP_CLS_DET_CODE );

ALTER TABLE  SKU_PROP_DETS ADD CONSTRAINT SKU_TO_SKU_PROP FOREIGN KEY ( SKU_CODE )
 REFERENCES  SKUS ( SKU_CODE );

ALTER TABLE  SKU_SIZES ADD CONSTRAINT SKU_TO_SKU_SIZES FOREIGN KEY ( SKU_CODE )
 REFERENCES  SKUS ( SKU_CODE );

ALTER TABLE  SKU_SIZES ADD CONSTRAINT SZ_CLS_DET_TO_SKU_SZS FOREIGN KEY ( SIZE_DET_CODE )
 REFERENCES  SIZE_CLASS_DETS ( SZ_DET_CODE );

ALTER TABLE  SKU_SIZE_COLORS ADD CONSTRAINT SKU_CLR_TO_SKU_SZ_CLR FOREIGN KEY ( SKU_CLR_CODE )
 REFERENCES  SKU_COLORS ( SKU_CLR_CODE );

ALTER TABLE  SKU_SIZE_COLORS ADD CONSTRAINT SKU_SZ_TO_SKU_SZ_CLR FOREIGN KEY ( SKU_SIZE_CODE )
 REFERENCES  SKU_SIZES ( SKU_SIZE_CODE );

ALTER TABLE  SKUS ADD CONSTRAINT CAT_SIZE_CLASSES_TO_SKUS FOREIGN KEY ( CAT_SZ_CLASS_CODE )
 REFERENCES  CAT_SIZE_CLASSES ( CAT_SZ_CLASS_CODE );
 
ALTER TABLE  SKU_CLR_IMAGES ADD CONSTRAINT SKU_CLR_TO_SKU_CLR_IMG FOREIGN KEY ( SKU_CLR_CODE )
 REFERENCES  SKU_COLORS ( SKU_CLR_CODE );

ALTER TABLE SKUS ADD CONSTRAINT UNITS_SKU_BASIC_UNIT_FK FOREIGN KEY (BASIC_UNIT)
 REFERENCES UNITS ( FROM_UNIT );

ALTER TABLE  SKU_UNITS ADD CONSTRAINT SKU_TO_SKU_UNIT FOREIGN KEY ( SKU_CODE )
 REFERENCES  SKUS ( SKU_CODE );

ALTER TABLE  SKU_UNITS ADD CONSTRAINT UNIT_TO_SKU_UNIT FOREIGN KEY ( UNIT_CODE )
 REFERENCES  UNITS ( FROM_UNIT );

ALTER TABLE  SYS_PARAMETERS ADD CONSTRAINT SHOP_TO_SYS_PRM FOREIGN KEY ( SHOP_CODE )
 REFERENCES  SHOPS ( SHOP_CODE );

ALTER TABLE SYS_IMAGES ADD CONSTRAINT SYS_IMAGES FOREIGN KEY ( SYS_PARAMETER_ID )
 REFERENCES SYS_PARAMETERS ( SYS_PARAMETER_ID );
 
ALTER TABLE  UNITS ADD CONSTRAINT UNITS_TREE FOREIGN KEY ( TO_UNIT )
 REFERENCES  UNITS ( FROM_UNIT );

ALTER TABLE  USERS ADD CONSTRAINT SHOP_TO_SHOP_ADMIN FOREIGN KEY ( SHOP_CODE )
 REFERENCES  SHOPS ( SHOP_CODE );

ALTER TABLE  USERS_WISH_LISTS ADD CONSTRAINT SKU_TO_SZ_CLR_WISH_LISTS FOREIGN KEY ( SKU_SZ_CLR_CODE )
 REFERENCES  SKU_SIZE_COLORS ( SKU_SZ_CLR_CODE );

ALTER TABLE  USERS_WISH_LISTS ADD CONSTRAINT USER_WISH_ITEMS FOREIGN KEY ( USER_ID )
 REFERENCES  USERS ( USER_ID );

CREATE INDEX  BRANDS_INDEX ON  BRANDS ( BRAND_CODE);

CREATE INDEX  CATEGORIES_INDEX ON  CATEGORIES ( CAT_CODE);

CREATE INDEX  CATEGORY_TREES_INDEX ON  CATEGORY_TREES ( CAT_TREE_CODE);

CREATE INDEX  CAT_MNF_BRND_MDL_YERS_INDEX ON  CAT_MNF_BRND_MDL_YERS ( CMBMY_CODE);

CREATE INDEX  CAT_SIZE_CLASSES_INDEX ON  CAT_SIZE_CLASSES ( CAT_SZ_CLASS_CODE);

CREATE INDEX  COUNTRIES_INDEX ON  COUNTRIES ( CNTRY_CODE2);

CREATE INDEX  LANGUAGES_INDEX ON  LANGUAGES ( LANG_CODE);

CREATE INDEX  MANUFACTURES_INDEX ON  MANUFACTURES ( MNF_CODE);

CREATE INDEX  MODELS_INDEX ON  MODELS ( MODEL_CODE);

CREATE INDEX  OFFERS_INDEX ON  OFFERS ( SHP_CODE_OFFER_ID);

CREATE INDEX  OFFER_DETS_INDEX ON  OFFER_DETS ( OFFER_DET_ID);

CREATE INDEX  POSTS_INDEX ON  POSTS ( POST_CODE);

CREATE INDEX  SHOPS_INDEX ON  SHOPS ( SHOP_CODE);

CREATE INDEX  SHOP_CATEGORIES_INDEX ON  SHOP_CATEGORIES ( SHOP_CAT_CODE);

CREATE INDEX  SHOP_CATEGORY_ADMINS_INDEX ON  SHOP_CATEGORY_ADMINS ( ADMIN_SHP_CAT_CODE);

CREATE INDEX  SHOP_DOCS_INDEX ON  SHOP_DOCS ( SHOP_DOC_CODE);

CREATE INDEX  SHOP_FEES_HISTS_INDEX ON  SHOP_FEES_HISTS ( TRANS_CODE);

CREATE INDEX  SHOP_PROOF_DOC_TYPES_INDEX ON  SHOP_PROOF_DOC_TYPES ( CNTRY_DOC_TYPE ASC);

CREATE INDEX  SHOP_SKUS_INDEX ON  SHOP_SKUS ( SHOP_SKU_CODE);

CREATE INDEX  SHOP_SUB_CATS_INDEX ON  SHOP_SUB_CATS ( SHOP_SUB_CAT_CODE);

CREATE INDEX  SHOP_SUB_CAT_PROP_CLASSES_INDEX ON  SHOP_SUB_CAT_PROP_CLASSES ( SHP_SUB_CAT_PRP_CLS_CODE);

CREATE INDEX  SHOP_SUB_CAT_PROP_CLASS_DETS_INDEX ON  SHOP_SUB_CAT_PROP_CLASS_DETS ( SHP_SUBCAT_PRP_CLS_DET_CODE);

CREATE INDEX  SIZE_CLASSES_INDEX ON  SIZE_CLASSES ( SZ_CLASS_CODE ASC);

CREATE INDEX  SIZE_CLASS_DETS_INDEX ON  SIZE_CLASS_DETS ( SZ_DET_CODE);

CREATE INDEX  SIZE_CLASS_DET_PARAMS_INDEX ON  SIZE_CLASS_DET_PARAMS ( SZ_DET_PRM_CODE);

CREATE INDEX  SIZ_CLASS_DET_PRM_VALS_INDEX ON  SIZ_CLASS_DET_PRM_VALS ( SZ_DET_PRM_VAL_CODE);

CREATE INDEX  SKUS_INDEX ON  SKUS ( SKU_CODE);

CREATE INDEX  SKU_COLORS_INDEX ON  SKU_COLORS ( SKU_CLR_CODE);

CREATE INDEX  SKU_IMAGES_INDEX ON  SKU_IMAGES ( SKU_IMG_CODE);

CREATE INDEX  SKU_PROP_DETS_INDEX ON  SKU_PROP_DETS ( SKU_PROP_DET_CODE);

CREATE INDEX  SKU_SIZES_INDEX ON  SKU_SIZES ( SKU_SIZE_CODE);

CREATE INDEX  SKU_SIZE_COLORS_INDEX ON  SKU_SIZE_COLORS ( SKU_SZ_CLR_CODE);

CREATE INDEX  SKU_CLR_IMAGES_INDEX ON  SKU_CLR_IMAGES ( SKU_CLR_IMG_CODE);

CREATE INDEX  SKU_UNITS_INDEX ON  SKU_UNITS ( SKU_UNIT_CODE);

CREATE INDEX  SYS_PARAMETERS_INDEX ON  SYS_PARAMETERS ( SYS_PARAMETER_ID);

CREATE INDEX  UNITS_INDEX ON  UNITS ( FROM_UNIT);

CREATE INDEX  USERS_INDEX ON  USERS ( USER_ID);

CREATE INDEX  YEARS_INDEX ON  YEARS ( YEAR);
