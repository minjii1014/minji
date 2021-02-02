<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<form id='frmPaging' action='/post/listPost' method="get">
	<input type=hidden name="boardId" value="${post.boardId}">
</form>

<script type="text/javascript">
	$(document).ready(function() {
		// 목록으로 돌아가기 버튼
		var frmPaging = $("#frmPaging");
		$("#btnGotoList").on("click", function(e) {
			e.preventDefault();
			frmPaging.submit();
		});
	})
</script>