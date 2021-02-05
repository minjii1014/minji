drop table T_User;

create sequence seq4user; 

create table T_User (
	party_id			numeric(22, 0) not null,
	user_id				numeric(22, 0),
	id					varchar2(200),
	email				varchar2(200) not null,
	password			varchar2(200) not null,
	authority			varchar2(50) default 'ROLE_USER' not null, -- ±ÇÇÑ
	enable				number(1) default 1,
	
	primary key (id)
);


create index idx_userInfo on T_user(user_id);


