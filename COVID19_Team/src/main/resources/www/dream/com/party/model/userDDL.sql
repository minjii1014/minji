drop table T_User;
drop sequence seq4User_id;

--id, name, birth_date
--login_id, password, gender

create sequence seq4User_id;

create table T_User (
	party_id			numeric(22, 0),
	user_id				numeric(22, 0),
	email				varchar2(100),
	login_id			varchar2(100),
	password			varchar2(100),
	
	primary key (party_id, user_id, email, login_id) 	
);

create index idx_user_loginid on T_User(login_id);

insert into (2踰덈��꽣 �떆�옉 釉붾씪釉붾씪)
