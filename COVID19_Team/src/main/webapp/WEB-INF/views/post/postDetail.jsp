<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>

<%@include file="../common/header.jsp"%>

<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">게시글 상세조회</h1>

<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-body">
		<%@include file="./include/postCommon.jsp"%>
		
		<!-- data : 요소에 추가적으로 변수와 정보를 마음대로 추가 가능한 장치 -->
		<button data-oper="modify" class="btn btn-default" onclick="location.href='/post/modifyPost?id=${post.id}'">수정</button>
		<button id="btnGotoList" class="btn btn-info">목록</button>
		<%@include file="./include/pagingCommon.jsp"%>
	</div>
</div>

<!-- 댓글 목록 표시 구간 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw">Reply</i>
				</div>
				<div class="panel-body">
					<ul id="listReply">
						<li class='left clearfix' data-id='12'>
							<div>
								
							</div>
						</li>
						<!-- 프로그램에서 처리 "", 스타일 처리 ''  li 목록 및 마지막에 anchor -->
					</ul>
				</div>
			</div>
		</div>
	</div>
<!-- End of 댓글 목록 표시 구간 -->
	
		
<%@include file="../common/footer.jsp"%>        
		
<script type="text/javascript" src="\resources\js\reply\replyService.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//create read update
		setOprationMode("read");

		var frmPaging = $("#frmPaging");
		//게시글(PostVo) 수정
		$("#modify").on("click", function(e) {
			e.preventDefault();

			frmPaging.append("<input type='hidden' name='id' value='" + $(this).data("id") + "'>");
			frmPaging.attr("action", "/post/modifyPost");
			frmPaging.submit();

		});

		var originalId = "${post.id}";
		replyService.listReply(
			{originalId:originalId},
			function(listReply){
				for(var i=0, len=listReply.length || 0; i < len; i++){
					console.log(listReply[i]);
				}
			},
			function(erMsg){
				alert(erMsg);
			}
		);

		replyService.showReply(
				7,
				function(reply){
					alert(reply);
				},
				function(erMsg){
					alert(erMsg);
				}
			);
		
		replyService.updateReply(
				{id:7, content:"프로그램으로 자동 변경하기"},
				function(result){
					alert(result);
				},
				function(erMsg){
					alert(erMsg);
				}
			);
		
	});

</script>
    </body>
</html>
			

