CREATE OR REPLACE PROCEDURE Deposit_ (id_person NUMBER, ValueDeposite NUMBER,PaymentMethod number,Date_Depo timestamp ) AS
begin
    Insert into Deposit(VALUE,FK_ID_PERSON,DATE_DEPOSIT,FK_ID_STATUS_DEPOSIT,FK_ID_MODE_PAY,LIMIT_DEPOSIT,FLAG) values (ValueDeposite,id_person,Date_Depo,1,PaymentMethod,1000,'I');
    If PaymentMethod=1 then 
        if ValueDeposite >=20000 and ValueDeposite <=36000000 then 
            update DEPOSIT
            set FK_ID_STATUS_DEPOSIT=4
            where FK_ID_PERSON=id_person and date_deposit=Date_Depo;
        else 
            DBMS_OUTPUT.PUT_LINE('No cumplio con los requisitos '); 
            Insert into DEPOSITE_REJECTED(fk_id_deposite,date_rejected,FLAG) select D.id,D.date_deposit,'I' from deposit D where d.fk_id_person=id_person and D.value=ValueDeposite;
        end if;
    ELSIF PaymentMethod=2 then 
        if ValueDeposite >=18000 and ValueDeposite <=100000000 then 
            update DEPOSIT
            set FK_ID_STATUS_DEPOSIT=4
            where FK_ID_PERSON=id_person and date_deposit=Date_Depo;
        else 
            DBMS_OUTPUT.PUT_LINE('No cumplio con los requisitos '); 
            Insert into DEPOSITE_REJECTED(fk_id_deposite,date_rejected,FLAG) select D.id,D.date_deposit,'I' from deposit D where d.fk_id_person=id_person and D.value=ValueDeposite;
        end if;
    ELSIF PaymentMethod=3 then 
        if ValueDeposite >=18000 then 
            update DEPOSIT
            set FK_ID_STATUS_DEPOSIT=4
            where FK_ID_PERSON=id_person and date_deposit=Date_Depo;
        else 
            DBMS_OUTPUT.PUT_LINE('No cumplio con los requisitos '); 
            Insert into DEPOSITE_REJECTED(fk_id_deposite,date_rejected,FLAG) select D.id,D.date_deposit,'I' from deposit D where d.fk_id_person=id_person and D.value=ValueDeposite;
        end if;
    ELSIF PaymentMethod=4 then 
        if ValueDeposite >=1000 and ValueDeposite <=1000000 then 
            update DEPOSIT
            set FK_ID_STATUS_DEPOSIT=4
            where FK_ID_PERSON=id_person and date_deposit=Date_Depo;
        else 
             DBMS_OUTPUT.PUT_LINE('No cumplio con los requisitos '); 
             Insert into DEPOSITE_REJECTED(fk_id_deposite,date_rejected,FLAG) select D.id,D.date_deposit,'I' from deposit D where d.fk_id_person=id_person and D.value=ValueDeposite;

        end if;
    
    ELSIF PaymentMethod=5 then 
        if ValueDeposite >=5000 and ValueDeposite <=100000000 then 
            update DEPOSIT
            set FK_ID_STATUS_DEPOSIT=4
            where FK_ID_PERSON=id_person and date_deposit=Date_Depo;
        else
            Insert into DEPOSITE_REJECTED(fk_id_deposite,date_rejected,FLAG) select D.id,D.date_deposit,'I' from deposit D where d.fk_id_person=id_person and D.value=ValueDeposite;
        end if;
    ELSIF PaymentMethod=6 then 
        if ValueDeposite >=5000 and ValueDeposite <=3000000 then 
            update DEPOSIT
            set FK_ID_STATUS_DEPOSIT=4
            where FK_ID_PERSON=id_person and date_deposit=Date_Depo;
        else 
            DBMS_OUTPUT.PUT_LINE('No cumplio con los requisitos '); 
            Insert into DEPOSITE_REJECTED(fk_id_deposite,date_rejected,FLAG) select D.id,D.date_deposit,'I' from deposit D where d.fk_id_person=id_person and D.value=ValueDeposite;
        end if;
    End IF;
    EXCEPTION 
        WHEN no_data_found THEN 
        dbms_output.put_line('No such User!'); 
        WHEN others THEN 
        dbms_output.put_line('Error!'); 
END;

DECLARE
  ID_PERSON NUMBER;
  VALUEDEPOSITE NUMBER;
  PAYMENTMETHOD NUMBER;
  DATE_DEPO TIMESTAMP;
BEGIN
  ID_PERSON := 2;
  VALUEDEPOSITE := 980;
  PAYMENTMETHOD := 2;
  DATE_DEPO := current_timestamp;

  DEPOSIT_(
    ID_PERSON => ID_PERSON,
    VALUEDEPOSITE => VALUEDEPOSITE,
    PAYMENTMETHOD => PAYMENTMETHOD,
    DATE_DEPO => DATE_DEPO
  );
--rollback; 
END;

SELECT * FROM DEPOSITE_REJECTED;
SELECT * FROM DEPOSIT ORDER BY ID DESC;
