drop table T_MoveInfo

create table T_MoveInfo (
	party_id			numeric(22, 0),
	start_date			timestamp default sysdate,
	thru_date			timestamp default '9999-12-31',
	latitude			numeric(15, 8),--위도
	longitude			numeric(15, 8),--경도
	primary key(party_id, start_date),
	constraint fk_prod_moveInfo foreign key (party_id) references T_Party (party_id)
);
drop index idx_MoveInfo;
create index idx_MoveInfo on T_MoveInfo(latitude, longitude);

--확진자(1번)의 이동 정보
insert into T_MoveInfo(party_id, start_date, thru_date, latitude, longitude ,altitude)
  values(1, '2000.01.01.01.01.01', '2000.01.01.02.01.01', 37.5, 126.9, 0.008);
insert into T_MoveInfo(party_id, start_date, thru_date, latitude, longitude ,altitude)
  values(1, '2000.01.01.02.01.01', '2000.01.01.02.02.01', 37.4, 126.9, 0.008);
insert into T_MoveInfo(party_id, start_date, thru_date, latitude, longitude ,altitude)
  values(1, '2000.01.01.02.02.01', '2000.01.01.02.03.01', 37.3, 126.9, 0.008);
insert into T_MoveInfo(party_id, start_date, latitude, longitude ,altitude)
  values(1, '2000.01.01.02.03.01', 37.3, 126.7, 0.008);
  
--안전 멤버(2번)의 이동 정보
insert into T_MoveInfo(party_id, start_date, thru_date, latitude, longitude ,altitude)
  values(2, '2000.01.01.00.01.01', '2000.01.01.04.01.01', 38.5, 126.9, 0.008);
insert into T_MoveInfo(party_id, start_date, latitude, longitude ,altitude)
  values(2, '2000.01.01.04.01.02', 38.6, 126.9, 0.008);
  
--위험 멤버(3번)의 이동 정보
insert into T_MoveInfo(party_id, start_date, thru_date, latitude, longitude ,altitude)
  values(3, '2000.01.01.00.01.01', '2000.01.01.02.02.01', 37.3, 126.9, 0.008);
insert into T_MoveInfo(party_id, start_date, latitude, longitude ,altitude)
  values(3, '2000.01.01.02.02.02', 37.8, 126.9, 0.008);

 
--확진자와 동선이 겹치는 위험 멤버를 도출하시오
select distinct m.party_id
  from T_MoveInfo m, T_MoveInfo d
 where m.party_id = 3
   and d.party_id != 3
   and m.thru_date >= d.start_date
   and m.start_date <= d.thru_date
   and m.latitude - 0.001 < d.latitude
   and m.latitude + 0.001 > d.latitude
   and m.longitude + 0.001 > d.longitude
   and m.longitude - 0.001 < d.longitude;
   
insert into T_MoveInfo
select seq4Party_id.nextval, start_date, thru_date, latitude, longitude, altitude
  from T_MoveInfo;
  
