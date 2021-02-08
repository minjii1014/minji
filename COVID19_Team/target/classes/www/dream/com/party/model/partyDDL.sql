drop table T_Party;
drop sequence seq4Party_id;

create sequence seq4Party_id;

create table T_Party (
	party_id			numeric(22,0) primary key,	
	
   --InfectedPerson인 경우 추가적인 정보
   
   --user인 경우 추가적인 정보
    user_id				numeric(22,0),
	email				varchar2(100),
	login_id			varchar2(100),
	password			varchar2(100)	
);

insert into T_Party(party_id, start_date,thru_date)
values(1, 2020-11-11, 2020-12-12);
insert into T_Party(party_id, email,login_id,password)
values(2, 'aaa', 'bbb', 'ccc');