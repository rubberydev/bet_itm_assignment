CREATE OR REPLACE FUNCTION DIFERENCIA_HORAS(HORA_1 TIMESTAMP, HORA_2 TIMESTAMP, time_limit_session INTEGER, calculate_limit_session INTEGER) RETURN NUMBER as
  dias integer;
  horas integer;
  tiempo_transcurrido INTERVAL DAY TO SECOND;
  total_diferencia integer;
BEGIN
  tiempo_transcurrido := hora_2 - hora_1;
  dias := EXTRACT(day from tiempo_transcurrido);
  horas := EXTRACT(hour from tiempo_transcurrido); 
  
  IF calculate_limit_session = 1 THEN
   total_diferencia := time_limit_session - abs(dias*24 + horas);
  ELSE
    total_diferencia := abs(dias*24 + horas);
  END IF;
  
  RETURN total_diferencia;
END;

CREATE VIEW HANDLE_SESSION_USER AS
SELECT sesion.id, 
     concat(person.name, concat(' ', person.first_last_name)) username, 
     sesion.email, 
     sesion.date_sesion initial_date_session, 
     sesion.time_out final_date_session, 
     DIFERENCIA_HORAS(current_timestamp, sesion.date_sesion, preference.limit_time_sesion, 0) AS time_elapsed,
     DIFERENCIA_HORAS(current_timestamp, sesion.date_sesion, preference.limit_time_sesion, 1) AS time_limit_session 
     FROM sesion 
INNER JOIN person ON person.id = sesion.fk_id_person
INNER JOIN preference ON person.id = preference.fk_id_person
WHERE sesion.time_out IS NULL
ORDER BY sesion.date_sesion;

