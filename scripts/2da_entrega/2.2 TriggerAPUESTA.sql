create or replace trigger APUESTA AFTER INSERT OR UPDATE OR DELETE on WITHDRAW for each row  
begin 
   
  IF INSERTING THEN
     update PERSON 
     SET BALANCE_AVAILABLE = BALANCE_AVAILABLE - :NEW.VALUE   
     where ID = :NEW.FK_ID_PERSON;     
  END IF;
  
  IF UPDATING THEN   
    
    IF :NEW.VALUE > :OLD.VALUE THEN
      update PERSON 
      SET BALANCE_AVAILABLE = :NEW.VALUE - :OLD.VALUE + BALANCE_AVAILABLE
      where ID = :NEW.FK_ID_PERSON;     
    END IF;
    
    IF :NEW.VALUE < :OLD.VALUE THEN
      update PERSON
      SET BALANCE_AVAILABLE = :NEW.VALUE - :OLD.VALUE + BALANCE_AVAILABLE
      where ID = :NEW.FK_ID_PERSON;      
    END IF;
  END IF;
  
  IF DELETING THEN 
      update PERSON 
      SET BALANCE_AVAILABLE = - :OLD.VALUE + BALANCE_AVAILABLE 
      where ID = :OLD.FK_ID_PERSON; 
   END IF;
end;


--------------------------------------------------------------------------------------------

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