drop table C_Location;
drop sequence seq4Location_id;

create sequence seq4Location_id;

--id, name, birth_date
--login_id, password, gender

create table C_Location (
	id				numeric(22, 0) primary key,
	latitude		numeric(22,0),   -- 위도
	longitude 		numeric(22,0)   -- 경도	
);

create index idx_location_id on C_Location(id);

insert into C_Location(id, latitude, longitude)
 values(1, 123, 123);