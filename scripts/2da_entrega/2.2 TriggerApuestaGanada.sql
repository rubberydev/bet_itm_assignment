create or replace trigger APUESTA_GANADA AFTER UPDATE OR DELETE on BET for each row  
begin 
  IF UPDATING THEN
    IF :NEW.status = 'Terminado' then
        update PERSON 
        SET BALANCE_AVAILABLE = :NEW.TOTAL_EARNED + BALANCE_AVAILABLE
        where ID = :NEW.FK_ID_PERSON;      
    END IF;    
  END IF;
    
  IF :NEW.status = 'Error' then
      update PERSON 
      SET BALANCE_AVAILABLE = - :OLD.TOTAL_EARNED + BALANCE_AVAILABLE 
      where ID = :OLD.FK_ID_PERSON; 
  END IF;  
end;