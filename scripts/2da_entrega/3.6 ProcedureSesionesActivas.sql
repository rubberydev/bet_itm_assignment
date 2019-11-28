CREATE OR REPLACE PROCEDURE CLOSE_SESSION_USER AS
BEGIN
  UPDATE sesion 
  SET Time_out = (SELECT current_timestamp FROM handle_session_user  where time_limit_session < 0 AND sesion.fk_id_person = handle_session_user.id) 
  WHERE time_out IS NULL;
  EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Some exception has occurred to set timestamp final session of user.');
END; 

BEGIN
  CLOSE_SESSION_USER;
END;
  
SELECT * FROM handle_session_user;