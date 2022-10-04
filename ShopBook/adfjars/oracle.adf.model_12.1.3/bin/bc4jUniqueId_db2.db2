-- Copyright (c) 2010, Oracle and/or its affiliates. All rights reserved. 
--
-- DESCRIPTION
--    Run the following script to create or update table S_ROW_ID
--    if table new then S_ROW_ID.START_ID and NEXT_ID will be 1e14+1, and MAX_ID will be 1e15-1
--    if NEXT_ID is less then 1e14+1 then NEXT_ID and START_ID will be 1e14+1
--    if MAX_ID is less than 1e15-1 then MAX_ID will be 1e15
--
--    The reason why we use 1e14 is because
--       existing apps are already using ids starting from 1 to probably some number less than 1e14
--       legacy Oracle PL/SQL apps have a max id of 1e15, so we cannot use 1e15+1 or anything larger
--
-- CAUTION
--    Changing the values of vconst_startid and vconst_maxid may break Fusion apps
--    where the id column is NUMBER(15).
--
-- ASSUMPTIONS
--    Table S_ROW_ID does not exists, or exists and has one row in it
--
-- NOTES
--    This script is currently used by RCU to create S_ROW_ID table for ApplCore lite.  There is no
--    commit statement included in the script, since RCU executes SQL statement in autocommitted mode.  
--    If the script is going to be used other than RCU utility, the caller needs to commit the changes 
--    outside of the script.

CREATE PROCEDURE bc4jGenUniqueId()
LANGUAGE SQL
SPECIFIC bc4jGenUniqueId
MODIFIES SQL DATA

BEGIN

  DECLARE vconst_startid  DECIMAL(31);
  DECLARE vconst_maxid    DECIMAL(31);
  DECLARE sql_stmt        VARCHAR(1000);

  DECLARE EXIT HANDLER FOR SQLSTATE '42710'
  BEGIN
    SET sql_stmt = 'UPDATE S_ROW_ID set START_ID=?, NEXT_ID=? WHERE NEXT_ID < ?';
    PREPARE sqlPrep FROM sql_stmt;

    EXECUTE sqlPrep using vconst_startid, vconst_startid, vconst_startid;

    SET sql_stmt = 'UPDATE S_ROW_ID set MAX_ID=? WHERE MAX_ID < ?';
        
    PREPARE sqlPrep FROM sql_stmt;

    EXECUTE sqlPrep using vconst_maxid, vconst_startid; 
  END;

  SET vconst_startid = 1e14+1;
  SET vconst_maxid = 1e15-1;

  SET sql_stmt = 'create table S_ROW_ID (START_ID Decimal(31), NEXT_ID Decimal(31), MAX_ID Decimal(31), AUX_START_ID Decimal(31), AUX_MAX_ID Decimal(31), constraint next_less_than_max check(NEXT_ID<=MAX_ID), constraint start_less_than_next check(START_ID<=NEXT_ID), constraint auxStart_less_than_auxMax check(AUX_START_ID<=AUX_MAX_ID), constraint aux_main_dont_overlap check(START_ID not between AUX_START_ID and AUX_MAX_ID and MAX_ID not between AUX_START_ID and AUX_MAX_ID))';
  EXECUTE IMMEDIATE sql_stmt;

  SET sql_stmt = 'INSERT INTO S_ROW_ID VALUES (' || vconst_startid || ', ' || vconst_startid || ', ' || vconst_maxid || ', 0, 0)';
  EXECUTE IMMEDIATE sql_stmt;  

  RETURN;
END
@

call bc4jGenUniqueId()
@

drop procedure bc4jGenUniqueId()
@


