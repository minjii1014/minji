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

create UNIQUE INDEX ix_auth_username on T_Authorities (username,authority);


insert into t_users (party_id, email, username, PASSWORD) VALUES( 2,'user00@na.com','user00','pw00');


insert into t_users (party_id, email, username, PASSWORD) VALUES( 2,'member00@na.com','member00','pw00');

insert into t_users (party_id, email, username, PASSWORD) VALUES( 2,'admin00@na.com','admin00','pw00');

insert into t_authorities(username, authority) VALUES ('user00', 'ROLE_USER');

insert into t_authorities(username, authority) VALUES ('member00', 'ROLE_MANAGER');

insert into t_authorities(username, authority) VALUES ('admin00', 'ROLE_MANAGER');

insert into t_authorities(username, authority) VALUES ('admin00', 'ROLE_ADMIN');

