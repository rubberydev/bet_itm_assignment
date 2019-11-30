CREATE OR REPLACE trigger BET
BEFORE INSERT OR DELETE OR UPDATE ON BET
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ; 
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'Bet',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(to_date(v_date),'Bet',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(to_date(v_date),'Bet',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/

CREATE OR REPLACE trigger BONUS_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON BONUS
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ; 
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'BONUS',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(to_date(v_date),'BONUS',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(to_date(v_date),'BONUS',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/

CREATE OR REPLACE trigger BONUS_PERSON_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON BONUS_PERSON
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'BONUS_PERSON',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(to_date(v_date),'BONUS_PERSON',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(to_date(v_date),'BONUS_PERSON',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/

CREATE OR REPLACE trigger CATEGORY_BET_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON CATEGORY_BET
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'CATEGORY_BET',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(to_date(v_date),'CATEGORY_BET',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(to_date(v_date),'CATEGORY_BET',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/

CREATE OR REPLACE trigger DATA_FINANCIAL_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON DATA_FINANCIAL
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'DATA_FINANCIAL',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(to_date(v_date),'DATA_FINANCIAL',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(to_date(v_date),'DATA_FINANCIAL',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/
CREATE OR REPLACE trigger DEPOSIT_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON DEPOSIT
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'DEPOSIT',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'DEPOSIT',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'DEPOSIT',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;


/

CREATE OR REPLACE trigger DETAIL_BET_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON DETAIL_BET
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'DETAIL_BET',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'DETAIL_BET',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'DETAIL_BET',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/

CREATE OR REPLACE trigger IDENTITY_TYPE_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON IDENTITY_TYPE
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'IDENTITY_TYPE',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'IDENTITY_TYPE',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'IDENTITY_TYPE',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/

CREATE OR REPLACE trigger LENGUAGE_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON LENGUAGE
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'LENGUAGE',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'LENGUAGE',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'LENGUAGE',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/

CREATE OR REPLACE trigger LIMIT_BET_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON LIMIT_BET
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'LIMIT_BET',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'LIMIT_BET',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'LIMIT_BET',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/

CREATE OR REPLACE trigger MASTER_LOCATION_COUNTRY_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON MASTER_LOCATION_COUNTRY
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'MASTER_LOCATION_COUNTRY',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'MASTER_LOCATION_COUNTRY',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'MASTER_LOCATION_COUNTRY',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/

CREATE OR REPLACE trigger MASTER_LOCATION_DEPARTMENT_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON MASTER_LOCATION_DEPARTAMENT
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'MASTER_LOCATION_DEPARTAMENT',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'MASTER_LOCATION_DEPARTAMENT',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'MASTER_LOCATION_DEPARTAMENT',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/



CREATE OR REPLACE trigger MASTER_LOCATION_MUNICIPALITY_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON MASTER_LOCATION_MUNICIPALITY
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'MASTER_LOCATION_MUNICIPALITY',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'MASTER_LOCATION_MUNICIPALITY',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'MASTER_LOCATION_MUNICIPALITY',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/


CREATE OR REPLACE trigger MASTER_ZONE_TIME_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON MASTER_ZONE_TIME
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'MASTER_ZONE_TIME',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'MASTER_ZONE_TIME',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'MASTER_ZONE_TIME',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;


/
	
CREATE OR REPLACE trigger MATCH
BEFORE INSERT OR DELETE OR UPDATE ON MATCH
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'MATCH',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'MATCH',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'MATCH',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/


CREATE OR REPLACE trigger PERSON
BEFORE INSERT OR DELETE OR UPDATE ON PERSON
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'PERSON',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'PERSON',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'PERSON',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/

CREATE OR REPLACE trigger PHONE
BEFORE INSERT OR DELETE OR UPDATE ON PHONE
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'PHONE',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'PHONE',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'PHONE',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;


/

CREATE OR REPLACE trigger PREFERENCE_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON PREFERENCE
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'PREFERENCE',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'PREFERENCE',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'PREFERENCE',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;


/


CREATE OR REPLACE trigger PROOF_VERIFICATION_USER_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON PROOF_VERIFICATION_USER
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'PROOF_VERIFICATION_USER',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'PROOF_VERIFICATION_USER',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'PROOF_VERIFICATION_USER',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;


/

CREATE OR REPLACE trigger QUOTA_BET_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON QUOTA_BET
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'QUOTA_BET',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'QUOTA_BET',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'QUOTA_BET',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/


CREATE OR REPLACE trigger REQUISITE_TO_WITHDRAW_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON REQUISITE_TO_WITHDRAW
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'REQUISITE_TO_WITHDRAW',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'REQUISITE_TO_WITHDRAW',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'REQUISITE_TO_WITHDRAW',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/

CREATE OR REPLACE trigger SESION_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON SESION
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'SESION',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'SESION',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'SESION',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;


/


CREATE OR REPLACE trigger STATUS_DEPOSITE_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON STATUS_DEPOSIT
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'STATUS_DEPOSIT',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'STATUS_DEPOSIT',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'STATUS_DEPOSIT',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/


CREATE OR REPLACE trigger STATUS_MATCH_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON STATUS_MATCH
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'STATUS_MATCH',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'STATUS_MATCH',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'STATUS_MATCH',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;


/

CREATE OR REPLACE trigger STATUS_VERIFICATION_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON STATUS_VERIFICATION
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'STATUS_VERIFICATION',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'STATUS_VERIFICATION',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'STATUS_VERIFICATION',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/


CREATE OR REPLACE trigger TEAM_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON TEAM
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'TEAM',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'TEAM',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'TEAM',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/

CREATE OR REPLACE trigger TYPE_PAY_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON TYPE_PAY
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'TYPE_PAY',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'TYPE_PAY',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'TYPE_PAY',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/


CREATE OR REPLACE trigger WITHDRAW_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON WITHDRAW
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'WITHDRAW',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'WITHDRAW',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'WITHDRAW',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/

CREATE OR REPLACE trigger WITHDRAW_REQUISITE_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON WITHDRAW_REQUISITE
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'WITHDRAW_REQUISITE',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'WITHDRAW_REQUISITE',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'WITHDRAW_REQUISITE',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;

/


CREATE OR REPLACE trigger ZONE_TIME_LOCATION_DEPARTAMEN_AUDIT
BEFORE INSERT OR DELETE OR UPDATE ON ZONE_TIME_LOCATION_DEPARTAMEN
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2 (30);
  v_date timestamp ;
  v_ip varchar2(30);
BEGIN
  SELECT user, current_timestamp,sys_context('USERENV','IP_ADDRESS')  INTO v_user, v_date ,v_ip FROM dual;
  IF INSERTING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'ZONE_TIME_LOCATION_DEPARTAMEN',:NEW.ID,'Insert', v_user, v_ip ,'I');  
  ELSIF DELETING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag)
    VALUES(v_date,'ZONE_TIME_LOCATION_DEPARTAMEN',:OLD.ID,'Delete', v_user, v_ip,'I' );
  ELSIF UPDATING THEN
    INSERT INTO master_audit_db (date_time,table_audit,record_id,action_audit,user_audit,ip,Flag) 
    VALUES(v_date,'ZONE_TIME_LOCATION_DEPARTAMEN',:NEW.ID,'Update', v_user, v_ip,'I');
  END IF;
END;



