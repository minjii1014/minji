select *
  from (
	   select rownum rn, post_id, post_title
		 from T_Post
 		where rownum <= 20
 		order by post_id desc)
  where rn > 10;
  