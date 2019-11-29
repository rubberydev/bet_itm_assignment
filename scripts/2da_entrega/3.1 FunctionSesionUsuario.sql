CREATE OR REPLACE FUNCTION Sesion_Usuario( id_user in integer)
RETURN integer AS Estado integer;
v_check integer;
BEGIN
  select count(fk_id_person) into v_check from legittrip.sesion where time_out>to_timestamp(SYSDATE) and fk_id_person=id_user;
  IF v_check > 0 THEN
      RETURN 1;
  ELSE
      RETURN 0;
  END IF;
END;


BEGIN
  SELECT Sesion_Usuario(1) FROM DUAL;
END;