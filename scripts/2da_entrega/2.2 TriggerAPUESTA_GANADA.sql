create or replace trigger APUESTA_GANADA AFTER UPDATE on BET for each row  
begin 
  IF UPDATING THEN
    IF :NEW.status = 'Terminado' then
        update PERSON 
        SET BALANCE_AVAILABLE = :NEW.VALUE_BET + BALANCE_AVAILABLE
        where ID = :NEW.FK_ID_PERSON;      
    END IF;    
  END IF;
  
  IF DELETING THEN 
    IF :NEW.status = 'Error' then
      update PERSON 
      SET BALANCE_AVAILABLE = - :OLD.VALUE + BALANCE_AVAILABLE 
      where ID = :OLD.FK_ID_PERSON; 
    END IF;
  END IF;
end;