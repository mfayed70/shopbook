DROP TABLE ADF_USER_DATA_MAP;

CREATE TABLE ADF_USER_DATA_MAP
(	
   "ITEM_CREATION" DATE NOT NULL, 
   "USER_NAME" VARCHAR2(2000) NOT NULL, 
	"ITEM_KEY" VARCHAR2(2000) NOT NULL, 
	"ITEM_DATA" VARCHAR2(4000), 
   CONSTRAINT ADF_USER_DATA_MAP_PK PRIMARY KEY 
  (
    USER_NAME,
    ITEM_KEY 
  )
);

commit;