drop table T_User;
drop sequence seq4userid;
drop index idx_user_loginid;

create sequence seq4userid; 

create table T_User (
	party_id			numeric(22, 0) not null,
	user_num			numeric(22, 0),
	email				varchar2(200) not null,
	user_id				varchar2(200),
	PASSWORD			varchar2(200) NOT NULL,
    AUTHORITY           VARCHAR2(50) DEFAULT 'ROLE_USER' NOT NULL,
    ENABLED             NUMBER(1) DEFAULT 1 ,
	
	primary key (user_id, ID) 	
);


create index idx_userInfo on T_user(user_id);


