CREATE OR REPLACE PROCEDURE FINISH_MATCH(id_match Match.id%TYPE) AS
BEGIN
      UPDATE Match 
      SET DATE_RESULT = CURRENT_TIMESTAMP, FK_ID_STATUS_EVENT = 4
      WHERE ID = id_match;
      --EXCEPTION WHEN OTHERS THEN
        --DBMS_OUTPUT.PUT_LINE('Some exception has occurred to change status of match.');  
        
    UPDATE quota_bet
      SET Status = 'Finalizado'
      WHERE fk_id_match = id_match;
      EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Some exception has occurred to change status of match.'); 
END; 

BEGIN
  FINISH_MATCH(1);
END;


/*UPDATE MATCH SET DATE_RESULT = current_timestamp, FK_ID_STATUS_EVENT = 2;
SELECT * FROM MATCH WHERE FK_ID_STATUS_EVENT = 4;
SELECT * FROM STATUS_MATCH where id = 4;
SELECT * FROM QUOTA_BET WHERE fk_id_match = 1;*/
  
CREATE OR REPLACE PROCEDURE CALCULATE_EARNINGS_AND_LOSING_BY_BET(id_match Match.id%TYPE, calculate_earnings in boolean) 
AS
  c1 SYS_REFCURSOR;
BEGIN
 IF calculate_earnings = TRUE THEN
    DBMS_OUTPUT.PUT_LINE('Start process to calculate earnings...');
    OPEN c1 FOR SELECT
        category_bet.name,
        bet.value_bet,
        do_operations(bet.value_bet, quota_bet.quota_1, quota_bet.quota_2, quota_bet.quota_3, quota_bet.quota_earned ) total_earnings,
        quota_bet.quota_1,
        quota_bet.quota_2,
        quota_bet.quota_3,
        quota_bet.quota_earned,
        detail_bet.quota_bookmaker
    FROM bet 
    INNER JOIN detail_bet on bet.id = detail_bet.fk_id_bet
    INNER JOIN quota_bet on quota_bet.id = detail_bet.fk_id_quota_bet
    INNER JOIN category_bet on quota_bet.fk_id_category_bet = category_bet.id
    WHERE detail_bet.quota_bookmaker = quota_bet.quota_earned and quota_bet.fk_id_match = id_match;
    SYS.DBMS_SQL.RETURN_RESULT (c1);
 ELSE 
    DBMS_OUTPUT.PUT_LINE('Start process to calculate losings..');
    OPEN c1 FOR SELECT
        category_bet.name,
        bet.value_bet,
        do_operations(bet.value_bet,0,0,0,0) total_losings,
        quota_bet.quota_1,
        quota_bet.quota_2,
        quota_bet.quota_3,
        quota_bet.quota_earned,
        detail_bet.quota_bookmaker
    FROM bet 
    INNER JOIN detail_bet on bet.id = detail_bet.fk_id_bet
    INNER JOIN quota_bet on quota_bet.id = detail_bet.fk_id_quota_bet
    INNER JOIN category_bet on quota_bet.fk_id_category_bet = category_bet.id
    WHERE detail_bet.quota_bookmaker <> quota_bet.quota_earned and quota_bet.fk_id_match = id_match;
    SYS.DBMS_SQL.RETURN_RESULT (c1);
 END IF;
END;

CREATE OR REPLACE FUNCTION DO_OPERATIONS( value_bet in float, quota_1 in float, quota_2 in float, quota_3 in float, earned_quota in int)
RETURN float AS final_result float;
 total float := value_bet;
BEGIN
  IF earned_quota = 1 THEN
     total := value_bet + value_bet * quota_1;
    ELSIF earned_quota = 2 THEN 
      total := value_bet + value_bet * quota_2;
    ELSIF earned_quota = 3 THEN 
      total := value_bet + value_bet * quota_3; 
    ELSE
      RETURN total; 
  END IF;
  RETURN total;
END;
