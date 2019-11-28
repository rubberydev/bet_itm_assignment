CREATE OR REPLACE PROCEDURE FINISH_MATCH(id_match Match.id%TYPE) AS
BEGIN
      UPDATE Match 
      SET DATE_RESULT = CURRENT_TIMESTAMP, FK_ID_STATUS_EVENT = 4
      WHERE ID = id_match;
      EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Some exception has occurred to change status of match.');  
END; 

BEGIN
  FINISH_MATCH(1);
END;
  
CREATE OR REPLACE PROCEDURE CALCULATE_EARNINGS_AND_LOSING_BY_BET(id_match Match.id%TYPE, calculate_earnings in boolean) 
AS
  c1 SYS_REFCURSOR;
BEGIN
 IF calculate_earnings = TRUE THEN
    DBMS_OUTPUT.PUT_LINE('Start process to calculate earnings...');
    DBMS_OUTPUT.PUT_LINE(id_match);
    OPEN c1 FOR SELECT
        bet.fk_id_person,
        bet.status status_bet, 
        quota_bet.status quota_status, 
        bet.value_bet,
        quota_bet.quota_1,
        quota_bet.quota_2,
        quota_bet.quota_3,
        category_bet.name,
        match.id match_id,
        match.goal_local,
        match.goal_visit,
        quota_bet.quota_earned,
        detail_bet.quota_bookmaker,
        detail_bet.id detail_bet_id,
        quota_bet.id quota_bet_id
    FROM bet 
    INNER JOIN detail_bet on bet.id = detail_bet.fk_id_bet
    INNER JOIN quota_bet on quota_bet.id = detail_bet.fk_id_quota_bet
    INNER JOIN category_bet on quota_bet.fk_id_category_bet = category_bet.id
    INNER JOIN match on match.id = quota_bet.fk_id_match
    WHERE MATCH.ID = id_match AND detail_bet.quota_bookmaker = quota_bet.quota_earned;
    SYS.DBMS_SQL.RETURN_RESULT (c1);
 ELSE 
    DBMS_OUTPUT.PUT_LINE('Start process to calculate losings..');
    DBMS_OUTPUT.PUT_LINE(id_match);
 END IF;
END;

