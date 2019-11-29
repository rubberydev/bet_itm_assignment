CREATE OR REPLACE view DETALLES_APUESTAS AS
SELECT
       B.DATE_BET,
       B.STATUS, 
       Q.QUOTA_1, 
       Q.QUOTA_2, 
       Q.QUOTA_3, 
       C.NAME, 
       t1.name_team TEAM_VISIT,
       t2.name_team TEAM_LOCAL
FROM Bet B
  inner join DETAIL_BET D on B.ID = D.FK_ID_BET
  inner join QUOTA_BET Q on Q.ID = D.FK_ID_QUOTA_BET
  inner join CATEGORY_BET C on  C.ID = Q.FK_ID_CATEGORY_BET
  inner join MATCH M on M.ID = Q.FK_ID_MATCH
  inner join TEAM T1 on M.FK_ID_TEAM_VISIT = T1.ID 
  inner join TEAM T2 ON M.FK_ID_TEAM_LOCAL = T2.ID;
  --where B.ID = 4;

SELECT * FROM DETALLES_APUESTAS;