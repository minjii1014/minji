<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page session="false" %>
<%@include file="../common/header.jsp"%>

<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">게시글 등록하기</h1>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-body">
			<form id="frmPost" role="form" action="/post/registerPost" method="post">
				<div class="form-group">
					<label>제목</label>
					<input id="title" name="title" value="${post.title}" class="form-control" >
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea id="txacontent" name="content" class="form-control" rows="5" cols="40" >${post.content}</textarea>
				</div>
				<div class="form-group" >
					<label>Writer</label>
					<input class="form-control" name="writer" value='<sec:authentication property="principal.username"/>' readonly="readonly">
				</div>
				<button id='btnRegistPost' type="submit" class="btn btn-default">등록</button>
				<button type="reset" class="btn btn-default">취소</button>
				
				<input type="hidden" name="boardId" value="${boardId}">
				<input type = "hidden" name = "_csrf" value = "${_csrf.token}">
			</form>
			<%@include file="./include/pagingCommon.jsp"%>
		</div>
	</div>

<%@include file="../common/footer.jsp"%>
<script src="https://cdn.ckeditor.com/ckeditor5/25.0.0/classic/ckeditor.js"></script>	
		<script type="text/javascript">
			$(document).ready(function() {
				//create read update
				setOprationMode("create");
		
				var frmPost = $("#frmPost");
				
				$("#btnRegistPost").on("click", function(e){
					e.preventDefault();
					frmPost.submit();
				});
				
			})
		</script>
    </body>
    <script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
</html>
			

