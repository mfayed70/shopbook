CREATE TABLE shopbook.shopping_det
( 
  DET_ID VARCHAR(35) NOT NULL COMMENT 'UML to Offline Database Transform: Column DET_ID created from UML attribute "det id" in UML class "shopping det"' 
, LAST_MODIFIED DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column LAST_MODIFIED created from UML attribute "last modified" in UML class "shopping det"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shopping det"' 
, QTY INT(3) NULL DEFAULT 0 COMMENT 'UML to Offline Database Transform: Column QTY created from UML attribute "qty" in UML class "shopping det"' 
, UNIT_PRICE INT(11) NULL DEFAULT 0 COMMENT 'UML to Offline Database Transform: Column UNIT_PRICE created from UML attribute "unit price" in UML class "shopping det"' 
, TOTAL_PRICE INT(11) NULL COMMENT 'UML to Offline Database Transform: Column TOTAL_PRICE created from UML attribute "total price" in UML class "shopping det"' 
, SKU_STATUS VARCHAR(2) NULL COMMENT 'UML to Offline Database Transform: Column SKU_STATUS created from UML attribute "sku status" in UML class "shopping det"' 
, AVAILABLE VARCHAR(1) NULL COMMENT 'UML to Offline Database Transform: Column AVAILABLE created from UML attribute "available" in UML class "shopping det"' 
, ADDED_DATE DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column ADDED_DATE created from UML attribute "added date" in UML class "shopping det"' 
, TRANS_ID VARCHAR(30) NOT NULL COMMENT 'UML to Offline Database Transform: Column SHOPPING_MAST_DET created as default foreign key column for foreign key "SHOPPING_MAST_DET"' 
, SIZE_CODE VARCHAR(6) NOT NULL COMMENT 'UML to Offline Database Transform: Column SIZE_TO_SHOPPING_DET created as default foreign key column for foreign key "SIZE_TO_SHOPPING_DET"' 
, SKU_CLR_CODE VARCHAR(29) NOT NULL COMMENT 'UML to Offline Database Transform: Column SKU_TO_SHOPPING_DET created as default foreign key column for foreign key "SKU_TO_SHOPPING_DET"' 
, UNIT_CODE VARCHAR(4) NOT NULL COMMENT 'UML to Offline Database Transform: Column UNIT_TO_SHOPPING_DET created as default foreign key column for foreign key "UNIT_TO_SHOPPING_DET"' 
, CONSTRAINT PRIMARY KEY ( DET_ID ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHOPPING_DET created from UML class "shopping det"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint SHOPPING_MAST_DET created for UML association "shopping mast det"
UML to Offline Database Transform: Foreign key constraint SIZE_TO_SHOPPING_DET created for UML association "size to shopping det"
UML to Offline Database Transform: Foreign key constraint SKU_TO_SHOPPING_DET created for UML association "sku to shopping det"
UML to Offline Database Transform: Foreign key constraint UNIT_TO_SHOPPING_DET created for UML association "unit to shopping det"';

CREATE TABLE shopbook.shopping_master
( 
  TRANS_ID VARCHAR(30) NOT NULL COMMENT 'UML to Offline Database Transform: Column TRANS_ID created from UML attribute "trans id" in UML class "shopping master"' 
, TRANS_DATE_TIME DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'UML to Offline Database Transform: Column TRANS_DATE_TIME created from UML attribute "trans date time" in UML class "shopping master"' 
, TRANS_VALUE INT(11) NULL DEFAULT 0 COMMENT 'UML to Offline Database Transform: Column TRANS_VALUE created from UML attribute "trans value" in UML class "shopping master"' 
, NOTES VARCHAR(500) NULL COMMENT 'UML to Offline Database Transform: Column NOTES created from UML attribute "notes" in UML class "shopping master"' 
, MOB_NO VARCHAR(15) NULL COMMENT 'UML to Offline Database Transform: Column MOB_NO created from UML attribute "mob no" in UML class "shopping master"' 
, ADDRESS VARCHAR(200) NULL COMMENT 'UML to Offline Database Transform: Column ADDRESS created from UML attribute "address" in UML class "shopping master"' 
, TRANS_STATUS VARCHAR(2) NULL COMMENT 'UML to Offline Database Transform: Column TRANS_STATUS created from UML attribute "trans status" in UML class "shopping master"' 
, PAYMENT_ID VARCHAR(30) NULL COMMENT 'UML to Offline Database Transform: Column PAYMENT_ID created from UML attribute "payment id" in UML class "shopping master"' 
, USER_ID VARCHAR(100) NOT NULL COMMENT 'UML to Offline Database Transform: Column USER_TO_SHOPPING_MAST created as default foreign key column for foreign key "USER_TO_SHOPPING_MAST"' 
, CONSTRAINT PRIMARY KEY ( TRANS_ID ) ) 
COMMENT = 'UML to Offline Database Transform: Table SHOPPING_MASTER created from UML class "shopping master"
UML to Offline Database Transform: Primary key constraint PRIMARY created by default
UML to Offline Database Transform: Foreign key constraint USER_TO_SHOPPING_MAST created for UML association "user to shopping mast"';

ALTER TABLE shopbook.shopping_det ADD CONSTRAINT SHOPPING_MAST_DET FOREIGN KEY ( TRANS_ID )
 REFERENCES shopbook.shopping_master ( TRANS_ID );

CREATE INDEX SHOPPING_DET_INDEX ON shopbook.shopping_det ( DET_ID);

-- CREATE INDEX SHOPPING_MASTER_INDEX ON shopbook.shopping_master ( TRANS_ID);