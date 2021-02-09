drop table T_Reply;
drop sequence seq4Reply_id;

create sequence seq4Reply_id;
create table T_Reply(
	id					numeric(22,0) primary key,
	content				varchar2(4000),
	user_id				varchar2(500),
	original_id			numeric(22,0), -- 게시글 번호
	obj_type			varchar2(100),	-- 타입 종류 (reply, post)
	--	post인 경우 추가적인 정보
	title				varchar2(500),
	board_id			numeric(22, 0),
	view_count			numeric(22, 0),
	--공통 관리 정보
	reg_date			date default sysdate,
	update_date			date default sysdate
);

insert into T_Reply(id, content, user_id, original_id, obj_type, title, board_id, view_count)
values(seq4Reply_id.nextval, '일런', 'hong', null, 'post', '이런', 2, 5);
insert into T_Reply(id, content, user_id, original_id, obj_type, title, board_id, view_count)
values(seq4Reply_id.nextval, '삼런', 'cheol', null, 'post', '사런', 2, 5);

insert into T_Reply(id, content, user_id, original_id, obj_type)
values(seq4Reply_id.nextval, '오런', 2, 1, 'reply');