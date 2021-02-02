drop sequence seq4User_id;

drop table C_Infected_Person;

create sequence seq4User_id;

--id, name, birth_date
--login_id, password, gender

create table C_Infected_Person (
	id					numeric(22, 0) CONSTRAINT pk_party primary key	
);

create index idx_user_loginid on C_User(login_id);
