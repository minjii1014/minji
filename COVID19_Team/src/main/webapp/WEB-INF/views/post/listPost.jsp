<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>

<%@include file="../common/header.jsp"%>

<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> DatabaTle Example
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<form id='frmPaging' action='/post/listPost' method="get">
				<input type="hidden" name="boardId" value="${boardId}">
				<button id="btnSearch" type="submit" class="btn btn-primary">검색</button>
			</form>
			<button id='btnRegisterPost' type="button" class="btn btn-primary">Register New Post</button>
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>제목</th>
						<th>내용</th>
						<th>작성자 아이디</th>
						<th>조회수</th>
						<th>등록일</th>
						<th>수정일</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="post" items="${listPost}">
						<tr>
							<td><a href='/post/postDetail?postId=${post.postId}'>${post.postTitle}</a></td>
							<td>${post.postContent}</td>
							<td>${post.userId.partyId}</td>
							<td>${post.viewCount}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${post.regDate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${post.updateDate}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료 되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
	</div>
</div>

<%@include file="../common/footer.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		var frmPaging = $("#frmPaging");

		checkModal(result);

		history.replaceState({}, null, null);

		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}
			$(".modal-body").html("게시글 " + result + "번이 등록되었습니다.");
			$("#myModal").modal("show");
		}

		$("#btnRegisterPost").on("click", function(e) {
			e.preventDefault();
			frmPaging.attr("action", "/post/registerPost");
			frmPaging.submit();
		});

	})
</script>
</body>
</html>

