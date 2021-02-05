drop table T_Board;
drop sequence seq4Board_id;


create sequence seq4Board_id;
create table T_Board(
	id			numeric(8,0) primary key,
	name		varchar2(20)
);

insert into T_Board(id, name)
  values(seq4Board_id.nextval, 'COVID-19 Map');
insert into T_Board(id, name)
  values(seq4Board_id.nextval, '공지사항');
insert into T_Board(id, name)
<<<<<<< HEAD
  values(seq4Board_id.nextval, '자유 게시판');
=======
  values(seq4Board_id.nextval, '자유 게시판');
>>>>>>> refs/remotes/origin/main
