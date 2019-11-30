create or replace procedure ACTUALIZAR_DATO (TABLE_NAME IN VARCHAR2, ID_T int) AS

CONDITION  VARCHAR2(100);
FILTRO INTEGER;
TABLA VARCHAR2(100);
Existe_Tabla VARCHAR2(100);
Existe_ID INTEGER;

BEGIN
  TABLA := TABLE_NAME;
  FILTRO := ID_T;
  CONDITION := ' WHERE ID = ';
  Existe_Tabla := NULL;  
  Existe_ID := 0;
    
  select table_name into Existe_Tabla from user_tables where table_name = TABLA;  
  --DBMS_OUTPUT.PUT_LINE ('TABLA = ' || Existe_Tabla);
     
  select B.ID into Existe_ID from BET B where ID = ID_T;  
  --DBMS_OUTPUT.PUT_LINE ('TABLA = ' || Existe_ID);
    
  EXECUTE IMMEDIATE 'UPDATE ' || TABLA || ' SET FLAG = ''D''' || CONDITION || FILTRO;
  DBMS_OUTPUT.PUT_LINE ('TABLA MODIFICADA = ' || TABLA || ' En el campo ID = ' || FILTRO);
 
 EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('La Tabla o el ID No existe'); 
   WHEN OTHERS THEN 
      dbms_output.put_line('Error!'); 
END;

EXEC ACTUALIZAR_DATO ('BET', 1008);