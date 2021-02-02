drop table T_Post;
drop sequence seq4Post_id;

create sequence seq4Post_id;
--post_id,post_title,post_content,user_id,view_count,reg_date,update_date
create table T_Post(
	post_id			numeric(8,0) primary key,
	post_title		varchar2(20),
	post_content	varchar2(4000),
	user_id			numeric(22, 0),
	view_count		numeric(22, 0),
	board_id		numeric(22,0),
	reg_date		date default sysdate,
	update_date		date default sysdate
);

insert into t_post(post_id,post_title,post_content,user_id,view_count,board_id)
values (seq4Post_id.nextval, '¿©±â ¹¹¶ó°í ½è³ª', 2, 2, 2);
insert into t_post(post_id,post_title,post_content,user_id,view_count,board_id)
values (seq4Post_id.nextval, '¿©±â´Â ¶Ç ¹¹¶ó°í ½è³ª', 2, 5, 2);

