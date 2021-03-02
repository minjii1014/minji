drop sequence seq4User_num;
drop sequence seq4Party_id;
drop table T_Party;

create sequence seq4Party_id;
create sequence seq4User_num;

create table T_Party (
	party_num			numeric(22,0) primary key,
	party_id			numeric(22,0),
	latitude			numeric(22, 15), -- 위도
	longitude			numeric(22, 15), -- 경도
	start_date			varchar2(1000), -- 시작 시간
	thru_date			varchar2(1000), -- 끝나는 시간
	
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