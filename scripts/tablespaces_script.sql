-------------------------------- 2. -------------------------------------------------------------
--Create smallfile tablespace with 1Gb of data splited in 2 datafile. 
--The name of the tablespace should be "BET_ITM".
CREATE TABLESPACE BET_ITM DATAFILE 
       'bet1.dbf' SIZE 512M,
       'bet2.dbf' SIZE 512M;
       
--Create bigfile tablespace with 2Gb of data. The name of the tablespace should be "BET_AUDITING"     
CREATE BIGFILE TABLESPACE BET_AUDITING DATAFILE
  '/u02/app/oracle/oradata/ORCL/bigtbsbet01.dbf' SIZE 2G;
  
--Create Undo tablespace with 500Mb and 1 datafile 
CREATE UNDO TABLESPACE UNDOTBSBET DATAFILE 
  '/u02/app/oracle/oradata/ORCL/undotbsbet_01.dbf' SIZE 500M;
  
--Set undo tablespace created before this, to be used in the system
ALTER SYSTEM SET UNDO_TABLESPACE = UNDOTBSBET;