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
