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
		<button data-oper="modify" class="btn btn-default" onclick="location.href='/post/modifyPost?postId=${post.postId}'">수정</button>
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
					<ul id="listReply" data-originalId="${post.postId}">
						<li>
							<button class="btnAddReply" class="btn btn-primary btn-xs fa-pull-right">댓글달기</button>
							<br>
						</li>
						<!-- 프로그램에서 처리 "", 스타일 처리 ''  li 목록 및 마지막에 anchor -->
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End of 댓글 목록 표시 구간 -->
</div>
<!-- /.container-fluid -->

<!-- 댓글 상세조회, 입력, 수정, 삭제 모달창 -->
<div id="modalReply" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        		<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>	<!-- End of modal-header -->
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label> 
					<input class="form-control" name='replyContent' value='New Reply!!!!'>
				</div>
				<div class="form-group">
					<label>Replyer</label> 
					<input class="form-control" id='replyer' value='replyer' readonly="readonly">
				</div>
				<div class="form-group">
					<label>Reply Date</label> 
					<input class="form-control" name='replyDate' value=''>
				</div>
				
				<input id='replyerId' type="hidden">
				
			</div>	<!-- End of modal-body -->
			<div class="modal-footer">
				<button id='btnModifyReply' type="button" class="btn btn-warning">Modify</button>
				<button id='btnRemoveReply' type="button" class="btn btn-danger">Remove</button>
				<button id='btnRegisterReply' type="button" class="btn btn-primary">Register</button>
				<button id='btnCloseModal' type="button" class="btn btn-default">Close</button>
			</div>	<!-- End of modal-footer -->
		</div>	<!-- End of modal-content -->
	</div>	<!-- End of modal-dialog -->
</div>
<!-- End of 댓글 입력 모달창 -->
		
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

		var choosenUl = $(this).closest("ul");
		function showReplyList(originalId, choosenUl) {
			replyService.listReply(
				{originalId:originalId},
				function(pairOfCriteriaListReply){
					var listReply = pairOfCriteriaListReply.second;
					var strReplyLi = "";
					for (var i = 0, len = listReply.length || 0; i < len; i++) {
						strReplyLi += "<li class='left clearfix' data-replyId='" + listReply[i].replyId + "'>";
						strReplyLi += "<div><div class='header'><strong class='primary-font'>" 
							+ listReply[i].userId
							+ "</strong>";
						strReplyLi += "<small class='fa-pull-right text-muted'>" 
							+ dateGapDisplayService.displayTime(listReply[i].updateDate) 
							+ "</small>";
						strReplyLi += "</div>";
						strReplyLi += "<p>" + listReply[i].replyContent + "</p>";
							
						strReplyLi += "</div></li>";
					}
					choosenUl.append(strReplyLi);
				},
				function(erMsg){
					alert(erMsg);
				}
			);
		}
		
		/** 댓글 관련 이벤트 처리 영역 */
		var modalReply = $("#modalReply");
		var replyDate = modalReply.find("input[name='replyDate']");
		var btnModifyReply = $("#btnModifyReply");
		var btnRemoveReply = $("#btnRemoveReply");
		var btnRegisterReply = $("#btnRegisterReply");
		var btnCloseModal = $("#btnCloseModal");

		//댓글 등록할 수 있도록 화면 열어 주세요
		var ulOfModalControl;
		var liOfModalControl;
		
		$("ul").on("click", ".btnAddReply", function(e) {
			//Nested li에서 일어난 이벤트가 이를 감싸고 있는 요소(부모 요소)에 할당된 위임 이벤트가 연속해서 처리되는 것을 막을 것이야.
			e.stopImmediatePropagation();

			ulOfModalControl = $(this).closest("ul");
			var originalId = ulOfModalControl.data("originalId");
			openModal(originalId);
		});
		
		function openModal(originalId) {
			//신규 댓글 모달창 띄우기 전에 기존에 입력된 값 청소
			modalReply.find("input").val("");

			//신규 댓글 등록 시 작성일자는 현재 시간이 DB에서 자동으로 채워지니까 입력 받을 필요는 없지요
			replyDate.closest("div").hide();

			btnModifyReply.hide();
			btnRemoveReply.hide();
			btnRegisterReply.data("originalId", originalId);
			btnRegisterReply.show();
			btnCloseModal.show();

			modalReply.modal("show");
		}
		
		//댓글 창 닫기
		btnCloseModal.on("click", function(e) {
			modalReply.modal("hide");
		});

		btnRegisterReply.on("click", function(e) {
			e.preventDefault();

			var originalId = btnRegisterReply.data("originalId");

			var reply = {originalId:originalId,
					replyContent:modalReply.find("input[name='replyContent']").val()};
			modalReply.modal("hide");
			
			replyService.registerReply(reply, function(result){
				alert(result);

				ulOfModalControl.remove(ulOfModalControl.find('li'));
				
				showReplyList(originalId, ulOfModalControl);
			});
		});
	});

</script>
    </body>
</html>
			

