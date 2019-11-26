CREATE OR REPLACE TRIGGER UPDATE_INFO_RELATED_TO_FINISHED_MATCH
AFTER UPDATE ON MATCH
FOR EACH ROW
BEGIN
                                       --Mirar sin es necesario comprobar que el estado anterior no sea finalizado
    IF :NEW.FK_ID_STATUS_EVENT = 4 AND :OLD.FK_ID_STATUS_EVENT <> 4 THEN
        --Execute all process to finish earning and losings by wagerer
        DBMS_OUTPUT.PUT_LINE('Start process');
    END IF;
END;

--UPDATE Match SET FK_ID_STATUS_EVENT = 4 WHERE ID = 4;