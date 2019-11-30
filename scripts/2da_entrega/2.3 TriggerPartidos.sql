CREATE OR REPLACE TRIGGER UPDATE_INFO_RELATED_TO_FINISHED_MATCH
BEFORE UPDATE ON MATCH
FOR EACH ROW
DECLARE
  earned_quota quota_bet.quota_1%TYPE;
BEGIN
DBMS_OUTPUT.PUT_LINE('Start trigger when a match switch to finished status.');
    IF :NEW.FK_ID_STATUS_EVENT = 4 THEN
        --Execute all process to finish earning and losings by wagerer
        DBMS_OUTPUT.PUT_LINE('Start after to finish match');
        CALCULATE_EARNINGS_AND_LOSING_BY_BET(:NEW.id, true);
        CALCULATE_EARNINGS_AND_LOSING_BY_BET(:NEW.id, false);
        
    END IF;
END;
--UPDATE Match SET FK_ID_STATUS_EVENT = 4 WHERE ID = 4;

