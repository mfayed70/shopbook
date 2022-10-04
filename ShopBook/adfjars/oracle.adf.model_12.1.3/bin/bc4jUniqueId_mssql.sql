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
SET QUOTED_IDENTIFIER ON

-- BEGIN TRAN;

DECLARE @vconst_startid  NUMERIC(38);
DECLARE @vconst_maxid    NUMERIC(38);
DECLARE @sql_stmt        NVARCHAR(1000);

SET @vconst_startid  = 1e14+1;
SET @vconst_maxid    = 1e15-1;

IF (object_id(N'S_ROW_ID', N'U') IS NULL)
BEGIN
    SET @sql_stmt = N'create table S_ROW_ID (START_ID Numeric(38), NEXT_ID Numeric(38), MAX_ID Numeric(38), AUX_START_ID Numeric(38), AUX_MAX_ID Numeric(38), constraint next_less_than_max check(NEXT_ID<=MAX_ID), constraint start_less_than_next check(START_ID<=NEXT_ID), constraint auxStart_less_than_auxMax check(AUX_START_ID<=AUX_MAX_ID), constraint aux_main_dont_overlap check(START_ID not between AUX_START_ID and AUX_MAX_ID and MAX_ID not between AUX_START_ID and AUX_MAX_ID))';

    EXEC (@sql_stmt);

    PRINT N'CreateUniqueId: table S_ROW_ID created';

    SET @sql_stmt = N'INSERT INTO S_ROW_ID VALUES (' + 
                    CAST(@vconst_startid AS NVARCHAR(38)) + N', ' + 
                    CAST(@vconst_startid AS NVARCHAR(38)) + N', ' + 
                    CAST(@vconst_maxid AS VARCHAR(38)) + N', 0, 0)';

    EXEC (@sql_stmt);

    PRINT N'CreateUniqueId: ' + @sql_stmt;
END
ELSE
BEGIN
    DECLARE @v_id        NUMERIC(38);
    DECLARE @parmDef     NVARCHAR(500);

    PRINT N'CreateUniqueId: table S_ROW_ID already exists';

    SET @sql_stmt = 'SELECT * FROM S_ROW_ID WITH(READCOMMITTEDLOCK, UPDLOCK, ROWLOCK)';
    EXEC (@sql_stmt);

    PRINT N'CreateUniqueId: ' + @sql_stmt;

    SET @sql_stmt = 'SELECT @nextidOUT = NEXT_ID FROM S_ROW_ID';
    SET @parmDef = N'@nextidOUT NUMERIC(38) OUTPUT';

    EXEC sp_executesql @sql_stmt, @parmDef, @nextidOUT=@v_id OUTPUT;
    
    IF (@v_id < @vconst_startid) 
    BEGIN  
        SET @sql_stmt = N'UPDATE S_ROW_ID set START_ID = ' + CAST(@vconst_startid AS NVARCHAR(38)) + ', NEXT_ID = ' + CAST(@vconst_startid AS NVARCHAR(38));
        EXEC (@sql_stmt);

        PRINT 'CreateUniqueId: ' + @sql_stmt;
    END;

    SET @sql_stmt = N'SELECT @maxid_OUT=MAX_ID from S_ROW_ID';
    SET @parmDef = N'@maxid_OUT NUMERIC(38) OUTPUT';

    EXEC sp_executesql @sql_stmt, @parmDef, @maxid_OUT=@v_id OUTPUT;

    IF (@v_id < @vconst_startid)
    BEGIN
        SET @sql_stmt = N'UPDATE S_ROW_ID set MAX_ID = ' + CAST(@vconst_maxid AS NVARCHAR(38));
        EXEC (@sql_stmt);

        PRINT 'CreateUniqueId: ' + @sql_stmt;
    END
END
go

-- COMMIT TRAN;

PRINT N'CreateUniqueId: completed';
go
