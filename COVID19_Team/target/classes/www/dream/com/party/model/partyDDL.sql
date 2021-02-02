drop table T_Party;
drop sequence seq4Party_id;

create sequence seq4Party_id;

--id, �벑濡앹씪, �닔�젙�씪, login_id, password
create table T_Party (
	party_id			numeric(22,0) primary key,
   --InfectedPerson인 경우 추가적인 정보
   start_date		    timestamp default sysdate, -- 시작점
   thru_date		    timestamp default '9999-12-31', -- 끝점
   --user인 경우 추가적인 정보
	email				varchar2(100),
	login_id			varchar2(100),
	password			varchar2(100)	
);

insert into T_Party(party_id, start_date,thru_date)
values(1, 2020-11-11, 2020-12-12);
insert into T_Party(party_id, email,login_id,password)
values(2, 'aaa', 'bbb', 'ccc');