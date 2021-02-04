drop table T_Reply;
drop sequence seq4Reply_id;

create sequence seq4Reply_id;
create table T_Reply(
	id				numeric(22,0) primary key,
	content			varchar2(4000),
	user_id			numeric(22, 0),
	original_id		numeric(22,0), --원글 아이디
	obj_type		varchar2(100),	--reply, post
	--	post일 경우의 추가 정보
	title				varchar2(500),
	board_id			numeric(22, 0),
	view_count			numeric(22, 0),
	--공통 관리 정보
	reg_date		date default sysdate,
	update_date		date default sysdate
);

insert into T_Reply(id, content, user_id, original_id, obj_type, title, board_id, view_count)
values(seq4Reply_id.nextval, '첫번째 내용', 2, null, 'post', '첫번째 글', 2, 5);
insert into T_Reply(id, content, user_id, original_id, obj_type, title, board_id, view_count)
values(seq4Reply_id.nextval, '두번째 내용', 2, null, 'post', '번째 글', 2, 5);

insert into T_Reply(id, content, user_id, original_id, obj_type)
values(seq4Reply_id.nextval, '첫번째 댓글', 2, 1, 'reply');