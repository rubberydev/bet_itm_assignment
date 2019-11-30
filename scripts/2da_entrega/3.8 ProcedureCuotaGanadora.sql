CREATE OR REPLACE FUNCTION DO_OPERATIONS_QUOTA_EARNED( value_bet in float, quota_1 in float, quota_2 in float, quota_3 in float, 
earned_quota in int, fk_category_bet in int, total_goal_local in int, total_goal_visit in int, total_goal_local_first_time in int, total_goal_visit_first_time in int, id_match in int )
RETURN float AS final_result float;
    total float := value_bet;
    quota_earned_defined number := 0;
BEGIN
    --Apuesta principal ID 1
    IF fk_category_bet = 1 and total_goal_local > total_goal_visit THEN
        DBMS_OUTPUT.PUT_LINE('gano el local');
        quota_earned_defined := 1;
    ELSIF fk_category_bet = 1 and total_goal_local < total_goal_visit THEN
        DBMS_OUTPUT.PUT_LINE('gano el visitante');
        quota_earned_defined := 3;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Empate');
        quota_earned_defined := 2;
    END IF;
  
        ---Más o menos (1.5) goles ID 7
    IF fk_category_bet = 7 and total_goal_local+total_goal_visit >1.5 THEN
        quota_earned_defined := 2 ;
    else
        quota_earned_defined :=3 ;
    END IF;

    ---Más o menos (0.5) goles ID 8
    IF fk_category_bet = 8 and total_goal_local+total_goal_visit >0.5 THEN
        quota_earned_defined := 2 ;
    else
        quota_earned_defined :=3 ;
    END IF;


    ---Más o menos (2.5) goles ID 9
    IF fk_category_bet = 9 and total_goal_local+total_goal_visit >2.5 THEN
        quota_earned_defined := 2 ;
    else
        quota_earned_defined :=3 ;
    END IF;


    -- Más o menos (3.5) goles ID 10
    IF fk_category_bet = 10 and total_goal_local+total_goal_visit >3.5 THEN
         quota_earned_defined := 2 ;
    else
         quota_earned_defined :=3 ;
    END IF;
    
    --¿Ambos equipos anotarán gol? ID 11
    IF fk_category_bet = 11 and total_goal_local > 0 and total_goal_visit > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Ambos equipos anotarán gol...');
        quota_earned_defined := 2;
    ELSE
       DBMS_OUTPUT.PUT_LINE('Ningun equipo anotará gol');
       quota_earned_defined := 3;
    END IF;
    
    --¿Quién ganará el primer tiempo? ID 12
    IF fk_category_bet = 12 and total_goal_local_first_time > total_goal_visit_first_time THEN
        DBMS_OUTPUT.PUT_LINE('ganará el primer tiempo el local..');
        quota_earned_defined := 1;
    ELSIF fk_category_bet = 12 and total_goal_local_first_time < total_goal_visit_first_time THEN
        DBMS_OUTPUT.PUT_LINE('gano el primer tiempo visitante');
        quota_earned_defined := 3;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Empate');
        quota_earned_defined := 2;
    END IF;
    
    --¿Quién ganará el segundo tiempo? ID 13
    IF fk_category_bet = 13 and total_goal_local > total_goal_visit THEN
        DBMS_OUTPUT.PUT_LINE('ganará el segundo tiempo el local..');
        quota_earned_defined := 1;
    ELSIF fk_category_bet = 13 and total_goal_local < total_goal_visit THEN
        DBMS_OUTPUT.PUT_LINE('gano el visitante');
        quota_earned_defined := 3;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Empate');
        quota_earned_defined := 2;
    END IF;
    
    ---¿Hay por lo menos un gol en cada tiempo? ID 15
    IF fk_category_bet = 15 and 
       (total_goal_local_first_time >= 1 or total_goal_visit_first_time >= 1) and  
       (total_goal_local >= 1 or total_goal_visit >= 0) THEN
        DBMS_OUTPUT.PUT_LINE('Hay por lo menos un gol en cada tiempo...');
        quota_earned_defined := 2;
    ELSE
        DBMS_OUTPUT.PUT_LINE('no hubo gol en algun tiempo');
        quota_earned_defined := 3;
    END IF;
    
  UPDATE quota_bet SET quota_bet.quota_earned = quota_earned_defined where fk_id_match = id_match;
  
  IF earned_quota = 1 and earned_quota = quota_earned_defined THEN
     total := value_bet + value_bet * quota_1;
    ELSIF earned_quota = 2 and earned_quota = quota_earned_defined THEN 
      total := value_bet + value_bet * quota_2;
    ELSIF earned_quota = 3 and earned_quota = quota_earned_defined THEN 
      total := value_bet + value_bet * quota_3; 
    ELSE
      RETURN total; 
  END IF;
  RETURN total;
END;



CREATE OR REPLACE PROCEDURE CALCULATE_QUOTA_EARNED(id_match Match.id%TYPE) 
AS
  c1 SYS_REFCURSOR;
  
  cursor cursor_validate_status_match is select count(*) from match where fk_id_status_event = 4 and id = id_match;
  aux_cursor_validate_status_match number;
BEGIN     
    open cursor_validate_status_match;
    fetch cursor_validate_status_match into aux_cursor_validate_status_match;

    IF aux_cursor_validate_status_match = 1 THEN
        OPEN c1 FOR SELECT
            category_bet.name,
            bet.value_bet,
        do_operations_quota_earned(bet.value_bet, 
            quota_bet.quota_1, 
            quota_bet.quota_2, 
            quota_bet.quota_3, 
            detail_bet.quota_bookmaker, 
            fk_id_category_bet,
            match.goal_local,
            match.goal_visit,
            match.goal_local_firts_time,
            match.goal_visit_firts_time,
            match.id) total_earnings,
            quota_bet.quota_1,
            quota_bet.quota_2,
            quota_bet.quota_3,
            quota_bet.quota_earned,
            detail_bet.quota_bookmaker,
            match.goal_local,
            match.goal_visit,
            match.goal_local_firts_time,
            match.goal_visit_firts_time
        FROM bet 
            INNER JOIN detail_bet on bet.id = detail_bet.fk_id_bet
            INNER JOIN quota_bet on quota_bet.id = detail_bet.fk_id_quota_bet
            INNER JOIN category_bet on quota_bet.fk_id_category_bet = category_bet.id
            INNER JOIN match on match.id = quota_bet.fk_id_match
            WHERE detail_bet.quota_bookmaker <> quota_bet.quota_earned and quota_bet.fk_id_match = id_match;
            SYS.DBMS_SQL.RETURN_RESULT (c1);
    ELSE
       dbms_output.put_line('Match has not been finished...');
    END IF;
END;

BEGIN
 CALCULATE_QUOTA_EARNED(1);
END;



--DEBUGGING
select * from quota_bet where fk_id_match = 1;
update quota_bet set quota_earned = 0 where fk_id_match = 1;

SELECT * FROM category_bet WHERE category_bet.ID IN (1,7,8,9,10,11,12,13,15);

SELECT distinct(category_bet.id),
      category_bet.name,
      --quota_bet.fk_id_match,
      quota_bet.quota_1,
      quota_bet.quota_2,
      quota_bet.quota_3
      FROM quota_bet 
      inner join category_bet on quota_bet.fk_id_category_bet = category_bet.id
WHERE category_bet.ID IN (1,7,8,9,10,11,12,13,15) --and quota_bet.fk_id_match = 1
order by category_bet.id;

update category_bet set name = 'Mas/Menos (1,5)' where id = 7;
update category_bet set name = 'Mas/Menos (0,5)' where id = 8;
update category_bet set name = 'Mas/Menos (2,5)' where id = 9;
update category_bet set name = 'Mas/Menos (3,5)' where id = 10;
update category_bet set name = 'Ambos equipos anotaran gol?' where id = 11;
update category_bet set name = 'Quien ganara el 1er tiempo?' where id = 12;
update category_bet set name = 'Quien ganara el 2do tiempo?' where id = 13;
update category_bet set name = 'Resultado del partido y ambos equipos anotan' where id = 14;
update category_bet set name = 'Hay por lo menos un gol en cada tiempo?' where id = 15;