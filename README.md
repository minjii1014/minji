# minji

i'm genius

select DISTINCT d.LOGIN_ID
  from T_PARTY m, T_PARTY d  --m 은 확진사 d는 사용자
 where m.party_id = 1
   and d.LOGIN_ID = 'a'  
   and m.latitude - 0.001 < d.latitude
   and m.latitude + 0.001 > d.latitude
   and m.longitude + 0.001 > d.longitude
   and m.longitude - 0.001 < d.longitude;
