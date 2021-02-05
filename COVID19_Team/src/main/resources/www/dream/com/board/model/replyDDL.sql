drop table T_Reply;
drop sequence seq4Reply_id;

create sequence seq4Reply_id;
create table T_Reply(
	id				numeric(22,0) primary key,
	content			varchar2(4000),
	user_id			numeric(22, 0),
	original_id		numeric(22,0), --�썝湲� �븘�씠�뵒
	obj_type		varchar2(100),	--reply, post
	--	post�씪 寃쎌슦�쓽 異붽� �젙蹂�
	title				varchar2(500),
	board_id			numeric(22, 0),
	view_count			numeric(22, 0),
	--怨듯넻 愿�由� �젙蹂�
	reg_date		date default sysdate,
	update_date		date default sysdate
);

insert into T_Reply(id, content, user_id, original_id, obj_type, title, board_id, view_count)
values(seq4Reply_id.nextval, '일런', 2, null, 'post', '이런', 2, 5);
insert into T_Reply(id, content, user_id, original_id, obj_type, title, board_id, view_count)
values(seq4Reply_id.nextval, '삼런', 2, null, 'post', '사런', 2, 5);

insert into T_Reply(id, content, user_id, original_id, obj_type)
values(seq4Reply_id.nextval, '오런', 2, 1, 'reply');