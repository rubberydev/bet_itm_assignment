CREATE or REPLACE VIEW RESUMEN_APUESTA AS 
with Resumen as
(
Select legittrip.bet.id,legittrip.bet.value_bet, Max_quota
,Max_quota*legittrip.bet.value_bet as Maximo_pagado,ROW_NUMBER() OVER (PARTITION BY bet.id ORDER BY bet.value_bet ASC) AS rn
from
Legittrip.Bet inner join legittrip.detail_bet on  legittrip.detail_bet.fk_id_bet=legittrip.bet.id  inner JOIN quota_bet
on legittrip.detail_bet.fk_id_quota_bet=legittrip.quota_bet.id CROSS APPLY (SELECT CASE  when quota_1>quota_2  and quota_1>quota_2  then quota_1
when quota_2>quota_1  and quota_2>quota_3  then quota_2 when quota_3>quota_1  and quota_3>quota_2  then quota_3 end Max_quota FROM dual) sub )
select id,value_bet,Max_quota,Maximo_pagado from Resumen  where rn=1;