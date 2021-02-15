drop sequence seq4User_num;
drop sequence seq4Party_id;
drop table T_Party;

create sequence seq4Party_id;
create sequence seq4User_num;

create table T_Party (
	party_id			numeric(22,0) primary key,
	latitude			numeric(15, 22), -- 위도
	longitude			numeric(15, 22), -- 경도
	start_date			date default sysdate, -- 시작 시간
	thru_date			date default sysdate, -- 끝나는 시간
	
   --InfectedPerson인 경우 추가적인 정보
    address_name        varchar2(4000),
   
   --user인 경우 추가적인 정보
	user_num			numeric(22,0),
	email				varchar2(100),
	login_id			varchar2(100),
	password			varchar2(100)	
);

insert into T_Party(party_id, start_date,thru_date)
values(1, 2020-11-11, 2020-12-12);
insert into T_Party(party_id, email,login_id,password)
values(2, 'aaa', 'bbb', 'ccc');