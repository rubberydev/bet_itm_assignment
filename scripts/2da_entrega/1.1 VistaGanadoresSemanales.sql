CREATE VIEW GANADORES_SEMANALES AS 
select person.name || ' ' || person.first_last_name || ' ' || person.second_last_name as nombre_completo, SUM(bet.total_earned) AS valor_acumulado from Bet  
inner join person on bet.fk_id_person = person.id
where status = 'Ganado' and date_bet 
between trunc(sysdate, 'DAY') and trunc(sysdate, 'DAY')+6
group by person.name || ' ' || person.first_last_name || ' ' || person.second_last_name
order by valor_acumulado desc;

