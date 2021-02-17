<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>

<%@include file="../common/header.jsp"%>
			
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">게시글 상세 조회</h1>


<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-body">
		<form id="frm_modify_post" role="form" action="/post/modifyPost" method="post">
			<%@include file="./include/postCommon.jsp"%>
			
			
			<!-- data : 요소에 추가적으로 변수와 정보를 마음대로 추가 가능한 장치 -->
			<button type="submit" data-oper="modify" class="btn btn-default">수정</button>
			<button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>
			<%@include file="./include/pagingCommon.jsp"%>
			<input type = "hidden" name = "_csrf" value = "${_csrf.token}">
		</form>
	</div>
</div>
<%@include file="../common/footer.jsp"%>

		<script type="text/javascript">
			$(document).ready(function() {
				setOprationMode("update");
				
				var frmModifyPost = $("#frm_modify_post");
					
				$("button").on("click", function(e) {
					e.preventDefault();
					var oper = $(this).data("oper");
					if(oper === "remove"){
						frmModifyPost.attr("action", "/post/removePost");
					}else if(oper === "list"){
						self.location = "/post/listPost?boardId=${boardId}";
					}
					frmModifyPost.submit();
				});
			})
		</script>
    </body>
    <script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/25.0.0/classic/ckeditor.js"></script>
</html>
			

