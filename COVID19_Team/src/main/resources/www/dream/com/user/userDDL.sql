drop sequence seq4Party_id;
drop sequence seq4Party_id;

drop table T_Party;
drop table T_Party_Type;

create sequence seq4Party_id;
create sequence seq4user_num;

--party_id, descript
create table T_Party (
	party_id			numeric(22, 0) not null,
	descript			varchar2(2000),
);
insert into T_Party(party_id, descript)
	values(seq4Party_id.nextval, '확진자');
insert into T_Party(party_id, descript)
	values(seq4Party_id.nextval, '일반회원');
insert into T_Party(party_id, descript)
	values(seq4Party_id.nextval, '관리자');


create table T_User (
	party_id			numeric(22, 0) not null,
    user_num			numeric(22, 0) not NULL UNIQUE,
	email				varchar2(200) not null,
	user_id			    varchar2(200) not null PRIMARY key,
	PASSWORD			varchar2(200) NOT NULL, 
    regdate             DATE DEFAULT SYSDATE,
    updatedate          DATE DEFAULT SYSDATE,
    ENABLED             char(1) DEFAULT  '1' 	
);














--권한 계층관계를 포함하는 정보로 정의
create table T_Authority_Type(
	name				varchar2(100),
	super_auth_name		varchar2(100),
	primary key(name)		
);
insert into T_Authority_Type(name, super_auth_name)
	values('ROLE_ADMIN', null);
insert into T_Authority_Type(name, super_auth_name)
	values('ROLE_MEMBER', 'ROLE_ADMIN');

create table T_Authority(
	party_id			numeric(22, 0),
	auth_name			varchar2(100),
	primary key(party_id, auth_name)		
);


--Spring Security가 알아서 사용하는 테이블
create table persistent_logins(
	username 			varchar2(100),
	series				varchar2(64) primary key,
	token				varchar2(64),
	last_used			timestamp
);
