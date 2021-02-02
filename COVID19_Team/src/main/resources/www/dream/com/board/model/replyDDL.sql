drop table T_Reply;
drop sequence seq4Reply_id;

create sequence seq4Reply_id;
create table T_Reply(
	reply_id		numeric(8,0) primary key,
	reply_content	varchar2(2000),
	user_id			numeric(22, 0),
	original_id		numeric(8,0),
	reg_date		date default sysdate,
	update_date		date default sysdate
);

insert into T_Reply(reply_id,reply_content,user_id,original_id)
values(seq4Reply_id.nextval, '첫번째 댓글', 2, 1);
insert into T_Reply(reply_id,reply_content,user_id,original_id)
values(seq4Reply_id.nextval, '두번째 댓글', 2, 1);