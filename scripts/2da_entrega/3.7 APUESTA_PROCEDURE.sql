create or replace procedure APUESTAS_PROCEDURE (FK_ID_MATCH int,FK_PERSON int, VALU_BET int,
FK_CATEGORY_BET int, quota_bookmaker int, QUOTA_1 float,QUOTA_2 float,QUOTA_3 float) AS


CURSOR ID_Bet IS SELECT B.ID FROM BET B WHERE ROWNUM = 1 ORDER BY B.ID DESC;
   FK_BET_ID bet.id%type;
CURSOR ID_Quota_Bet IS SELECT Q.ID FROM QUOTA_BET Q WHERE ROWNUM = 1 ORDER BY Q.ID DESC;
   FK_QUOTA_BET_ID QUOTA_BET.id%type;
 
begin
OPEN ID_Bet;
OPEN ID_Quota_Bet;

FETCH ID_Bet INTO FK_BET_ID;
FETCH ID_Quota_Bet INTO FK_QUOTA_BET_ID;

  INSERT INTO BET (FK_ID_PERSON, VALUE_BET, DATE_BET, STATUS, TOTAL_EARNED, FLAG)
    VALUES (FK_PERSON, VALU_BET, to_timestamp('2019-11-28 04:00:34.121', 'YYYY-MM-DD HH24:MI:SS.FF'),'PENDIENTE',0,'I');  
      
  INSERT INTO quota_bet (FK_ID_MATCH,FK_ID_CATEGORY_BET,QUOTA_1,QUOTA_2,QUOTA_3,QUOTA_EARNED,STATUS,FLAG)
    VALUES (FK_ID_MATCH,FK_CATEGORY_BET,QUOTA_1,QUOTA_2,QUOTA_3,0,'Pendiente','I');
    
   -- Select * from QUOTA_BET;
    -- select * from DETAIL_BET;
    
--    dbms_output.put_line('Se ha actualizado las tablas BET y QUOTA_BET con los siguientes datos de usuario: '||FK_PERSON);
  INSERT INTO DETAIL_BET (FK_ID_BET, FK_ID_QUOTA_BET,FLAG, quota_bookmaker)
  VALUES (FK_BET_ID,FK_QUOTA_BET_ID,'I',quota_bookmaker);
  
  EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such User!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!'); 
end;

exec APUESTAS_PROCEDURE(3,5,10000,8,1,0,2.47,1.45);
