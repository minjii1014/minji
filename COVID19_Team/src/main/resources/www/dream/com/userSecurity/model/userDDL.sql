drop table T_Users;
drop sequence seq4userid;
drop index idx_user_loginid;

create sequence seq4userid; 

create table T_Users (
	party_id			numeric(22, 0) not null,
    user_num			numeric(22, 0) not NULL UNIQUE,
	email				varchar2(200) not null,
	user_id			    varchar2(200) not null PRIMARY key,
	PASSWORD			varchar2(200) NOT NULL, 
    regdate             DATE DEFAULT SYSDATE,
    updatedate          DATE DEFAULT SYSDATE,
    ENABLED             char(1) DEFAULT  '1' 		
);

create table T_Authorities (
	user_id			varchar2(200) not null,
	auth			varchar2(200) NOT NULL,   
    CONSTRAINT fk_user_auth FOREIGN KEY(user_id) REFERENCES T_Users(user_id)
	);
	
create table persistent_logins (
    username varchar2(200) not null,
    series VARCHAR2(200) PRIMARY KEY,
    token VARCHAR2(200) not NULL,
    last_used TIMESTAMP not null
);

create UNIQUE INDEX ix_auth_username on T_Authorities (user_id);


insert into t_users (party_id, user_num, email, user_id, PASSWORD) VALUES( 2,SEQ4USERID.nextval, 'a@naver.com','a','a');

insert into t_authorities(user_id, auth) VALUES ('a', 'ROLE_ADMIN');