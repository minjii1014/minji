drop sequence seq4Party_num;
drop sequence seq4Party_id;
drop table T_Party;



create sequence seq4Party_id
 start with 1
 increment by 1;

create sequence seq4Party_num
 start with 1
 increment by 1;
 
create table T_Party (
	party_num			numeric(22,0) primary key,
	party_id			numeric(22,0),
	latitude			numeric(22, 15), -- 위도
	longitude			numeric(22, 15), -- 경도
	start_date			date default sysdate, -- 시작 시간
	thru_date			date default sysdate, -- 끝나는 시간
	
   --InfectedPerson인 경우 추가적인 정보
    address_name        varchar2(4000),
   
   --user인 경우 추가적인 정보
	email				varchar2(100),
	login_id			varchar2(100),
	password			varchar2(100)	
);

insert into T_Party(party_id, start_date,thru_date)
values(1, 2020-11-11, 2020-12-12);
insert into T_Party(party_id, email,login_id,password)
values(2, 'aaa', 'bbb', 'ccc');







select DISTINCT d.LOGIN_ID 
  from T_PARTY m, T_PARTY d --m 은 확진사 d는 사용자 
 where m.party_id = 1 
   and d.LOGIN_ID = 'a'
   and m.latitude - 0.001 < d.latitude 
   and m.latitude + 0.001 > d.latitude 
   and m.longitude + 0.001 > d.longitude 
   and m.longitude - 0.001 < d.longitude;