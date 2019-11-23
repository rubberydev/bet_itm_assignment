create or replace trigger Actilizacion_saldo AFTER INSERT OR UPDATE OR DELETE on Deposit for each row
begin 
  IF INSERTING THEN 
      update PERSON 
      SET BALANCE_AVAILABLE = :NEW.VALUE + BALANCE_AVAILABLE 
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