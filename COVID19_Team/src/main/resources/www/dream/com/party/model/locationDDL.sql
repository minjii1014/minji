drop table T_location;

create sequence seq4loaction 

create table T_location (
	-- ������ �������� �������� ����
	latitude			numeric(15, 8), -- ����
	longitude			numeric(15, 8), -- �浵
	start_date			date, -- ���� �ð�
	thru_date			date, -- ������ �ð�

	-- ������� ��� �߰����� ����
	id					varchar2(4000),
	-- �������� ��� �߰����� ����
	infected_id			numeric(15, 8),
    address_name        varchar2(4000),
    
    primary key(id, infected_id),
    constraint fk_prod_location foreign key (id) references T_User (id)
);

create table T_UserLocation (

);




insert into va ( star, thru
1��, star+1��