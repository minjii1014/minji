drop table T_location;

create sequence seq4loaction 

create table T_location (
	-- 유저와 감염자의 공통적인 정보
	latitude			numeric(15, 8), -- 위도
	longitude			numeric(15, 8), -- 경도
	start_date			date, -- 시작 시간
	thru_date			date, -- 끝나는 시간

	-- 사용자일 경우 추가적인 정보
	id					varchar2(4000),
	-- 감염자일 경우 추가적인 정보
	infected_id			numeric(15, 8),
    address_name        varchar2(4000),
    
    primary key(id, infected_id),
    constraint fk_prod_location foreign key (id) references T_User (id)
);

create table T_UserLocation (

);




insert into va ( star, thru
1일, star+1일