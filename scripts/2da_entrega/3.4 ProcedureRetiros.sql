CREATE OR REPLACE PROCEDURE Retiro_Saldo (id_person NUMBER, ValueWithdraw NUMBER) AS
CURSOR Saldo IS select sum(value)-ValueWithdraw from deposit where fk_id_person=id_person and fk_id_status_deposit=4;
    Sald number;
    CURSOR Verification IS select count(*) from proof_verification_user where fk_id_status_verification=2 and fk_id_person=id_person;
    Verificati number;
    CURSOR Bank_data IS select count(*) from data_financial where fk_id_person=1;
    Bank number;
begin
    Insert into WITHDRAW(VALUE,FK_ID_PERSON,DATE_WITHDRAW,APPROVE_REQUISITE,FLAG) values (ValueWithdraw,id_person,current_timestamp,'PENDIENTE','I');
    OPEN Saldo;
    OPEN Verification;
    OPEN Bank_data;
    FETCH Saldo INTO Sald;
    FETCH Verification INTO Verificati;
    FETCH Bank_data INTO Bank;
    
    IF Sald > 0 and Verificati =0 and Bank>=1 THEN
        update WITHDRAW
        set APPROVE_REQUISITE='APROBADO'
        where FK_ID_PERSON=id_person;
    ELSE
        DBMS_OUTPUT.PUT_LINE('No cumplio con los requisitos = ' || 
        Sald || Verificati); 
        Insert into WITHDRAW_REJECTED(fk_id_withdraw,date_rejected,FLAG) select W.id,W.date_withdraw,'I' from withdraw W where W.fk_id_person=id_person and W.value=ValueWithdraw;
        CLOSE Saldo;
        CLOSE Verification;
    END IF;
    EXCEPTION 
    WHEN no_data_found THEN 
    dbms_output.put_line('No such User!'); 
    WHEN others THEN 
    dbms_output.put_line('Error!'); 
END;

DECLARE
    ID_PERSON NUMBER;
    VALUEWITHDRAW NUMBER;
BEGIN
    ID_PERSON := 2;
    VALUEWITHDRAW := 7005;
    
    RETIRO_SALDO(
    ID_PERSON => ID_PERSON,
    VALUEWITHDRAW => VALUEWITHDRAW
    );
--rollback; 
END;

select * from withdraw_rejected order by id desc;