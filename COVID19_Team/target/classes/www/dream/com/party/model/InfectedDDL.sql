drop table T_InfectedPerson;

--id, �벑濡앹씪, �닔�젙�씪
create table T_InfectedPerson (
   party_id		       numeric(5, 0),
   start_date		   timestamp default sysdate, -- 시작점
   thru_date		   timestamp default '9999-12-31' -- 끝점 
);