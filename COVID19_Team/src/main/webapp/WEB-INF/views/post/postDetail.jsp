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
					<button id="btnAddReply" data-originalid="${post.id}" class="btn btn-primary btn-xs fa-pull-right">댓글달기</button>
				</div>
				<div class="panel-body">
					<ul id="listReply" data-originalid="${post.id}" data-page_num="1" data-countofreply="${post.countOfReply}">	
						<!-- 프로그램에서 처리 "", 스타일 처리 ''  li 목록 및 마지막에 anchor -->
						댓글 개수는 "${post.countOfReply}"<br>
					</ul>
				</div>
			</div>
		</div>
	</div>
<!-- End of 댓글 목록 표시 구간 -->


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
					<input class="form-control" name='replyer' value='replyer' readonly="readonly">
				</div>
				<div class="form-group">
					<label>Reply Date</label> 
					<input class="form-control" name='replyDate' value=''>
				</div>				
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
<script type="text/javascript" src="\resources\js\util\dateGapDisplayService.js"></script>

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

		/** 댓글 목록 조회 및 출력 */
		var originalId = "${post.id}";
		var listReplyUL = $("#listReply");
		appendShowReplyListAnchor(listReplyUL);
		
		function appendShowReplyListAnchor(parentUl) {
			var originalid = parentUl.data("originalid");
			var replyCnt = parentUl.data("countofreply");
			if(replyCnt > 0){
				var strReplyLi = "<a>댓글 펼치기</a>";
				parentUl.append(strReplyLi);
			}
		}

		//댓글 또는 대댓글 펼치기
		$("#listReply").on("click", "a", function(e){
			var choosenUl = $(this).closest("ul");
			var originalId = choosenUl.data("originalid");
			var pageNum = choosenUl.data("page_num");
			choosenUl.remove($(this));
			showReplyList(pageNum, originalId, choosenUl, $(this));
			//page_num을 1올려주고 맨 마지막에 anchor를 다시 달아준다
			
		});
		
		var replyCurPageNum = 1;

		function showReplyList(pageNum, originalId, choosenUl, anchorOfShowMoreReply){
			//ajax 호출
			replyService.listReply(
				{originalId:originalId, page:(pageNum || 1)}, //타겟 정보
				function(pairOfCriteriaListReply){
					//pair에서 List<ReplyVO> 선택
					var listReply = pairOfCriteriaListReply.second;
					var strReplyLi = "";
					for(var i=0, len=listReply.length || 0; i < len; i++){ 
						strReplyLi += "<li class='left clearfix' data-id='" + listReply[i].id + "'>";
						strReplyLi += "<div><div class='header'><strong class='primary-font'>" + listReply[i].userId + "</strong>";
						//**시간전으로 표시
						strReplyLi += "<small class='fa-pull-right text-muted'>"
							+ dateGapDisplayService.displayTime(listReply[i].updateDate) 
							+ "</small>";
						strReplyLi += "<button type='button' class='fa-pull-right'>대댓달기</button>"
						strReplyLi += "</div>";
						strReplyLi += "<p>"+ listReply[i].content +"</p>";
						if(listReply[i].countOfReply > 0){
							/*
							<ul id="listReply" data-originalid="${post.id}" data-page_num="1">	
								<!-- 프로그램에서 처리 "", 스타일 처리 ''  li 목록 및 마지막에 anchor -->
								댓글 개수는 "${post.countOfReply}"
							</ul>
							*/
							strReplyLi += "<ul data-originalid='" + listReply[i].id + "'data-page_num='1'>댓글 " + listReply[i].countOfReply + "개 보기</ul>";
						}
						strReplyLi += "</div></li>";
					}
					listReplyUL.append(strReplyLi);
					var pageCriteria = pairOfCriteriaListReply.first;
					displayAnchorShowReplyList(pageCriteria, anchorOfShowMoreReply, choosenUl);
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

		//Nested li에서 일어난 이벤트가 이를 감싸고 있는 요소(부모 요소)에 할당된 위임 이벤트가 연속해서 처리되는 것을 막는다.
		//e.stopImmediatePropagation();
		
		//댓글 상세 조회
		$("#listReply").on("click", "li p", function(e){
			var choosenLi = $(this).closest("li");
			//showReplyList 함수 내 strReplyLi에서 추가된 li의 id
			var replyId = choosenLi.data("id");
			replyService.showReply(
				replyId,
				function(reply){
					modalReply.find("input[name='replyContent']").val(reply.content);
					modalReply.find("input[name='replyer']").val(reply.userId);
					modalReply.find("input[name='replyDate']")
					.val(dateGapDisplayService.displayTime(reply.updateDate))
					.attr("readonly", "readonly");
					//수정 또는 삭제시 댓글 아이디 전달 용도
					modalReply.data("id", replyId);
					//버튼 활성화 관리
					btnModifyReply.show();
					btnRemoveReply.show();
					btnRegisterReply.hide();
					btnCloseModal.show();
					modalReply.modal("show");
					replyDate.closest("div").hide();
				},
				function(erMsg){
					alert(erMsg);
				}
			);
		});
		 
		//등록 화면 열기
		$("#btnAddReply").on("click", function(e) {
			e.preventDefault();
			var originalid = $(this).data("originalid");
			openModal(originalid);
		});
		
		//댓글 등록 이벤트
		btnRegisterReply.on("click", function(e) {
			e.preventDefault();
 			var originalid = btnRegisterReply.data("originalid");
			
			//객체 생성(javascript 방식 객체 만들기, 속성 명칭:값)
			var reply = {originalId: originalid,
				content:modalReply.find("input[name='replyContent']").val()};
			replyService.registerReply(reply, function(result){
				alert("댓글이 등록되었습니다.");
				modalReply.modal("hide");
				showReplyList(1, originalId);
			});
		});

		//대댓글 버튼 이벤트
		listReplyUL.on("click", "li button", function(e) {
			e.preventDefault();
			var originalid = $(this).closest("li").data("id");
			openModal(originalid);
		});

		//모달창 띄우기
		function openModal(originalid){
			//신규 댓글 모달창 띄우기 전에 기존에 입력된 값 청소
			modalReply.find("input").val("");
			//신규 댓글 등록 시 작성일자는 현재 시간이 DB에서 자동으로 채워지니까 입력 받을 필요 없음
			replyDate.closest("div").hide();
			btnModifyReply.hide();
			btnRemoveReply.hide();
			btnRegisterReply.data("originalid", originalid);
			btnRegisterReply.show();
			btnCloseModal.show();
			//모달창 열기
			modalReply.modal("show");
			
		}
		
		//댓글 창 닫기
		btnCloseModal.on("click", function(e) {
			modalReply.modal("hide");
		});
		
		//댓글 수정 이벤트
		btnModifyReply.on("click", function(e) {
			e.preventDefault();
			var reply = {id: modalReply.data("id"),
				content:modalReply.find("input[name='replyContent']").val()};
			replyService.updateReply(reply, function(result){
				alert("댓글이 수정되었습니다.");
				modalReply.modal("hide");
				showReplyList(1, originalId);
			});
		});
		
		//댓글 삭제 이벤트
		btnRemoveReply.on("click", function(e) {
			e.preventDefault();
			replyService.deleteReply(modalReply.data("id"), function(result){
				alert("댓글이 삭제되었습니다.");
				modalReply.modal("hide");
				showReplyList(1, originalId);
			});
		});

		/* 댓글 더 펼치기 출력 하기 및 이벤트 처리*/
		var replyMoreListUp = $("#replyMoreListUp");
		function displayAnchorShowReplyList(pageCriteria, anchorOfShowMoreReply, choosenUl){
			if(pageCriteria.pageNum < pageCriteria.endPage || pageCriteria.hasNext){
				choosenUl.append(anchorOfShowMoreReply);
			}
		}

		//댓글 더보기 클릭시 펼치기
		replyMoreListUp.on("click", "a", function(e){
			e.preventDefault();
			var targetPageNum = $(this).attr("href");
			showReplyList(targetPageNum, originalId);
		});
		
		/* 대댓글 관련 처리 */
		//대댓글 목록 가져와서 댓글에 UL li로 추가
		$("#listReply").on("click", "li a", function(e){
			e.preventDefault();
			var choosenAnchor = $(this);
			//선택된 a태그에 달려있는 href
			var originalId = choosenAnchor.closest("li").data("id");
			showReplyOfReplyList(1, originalId, choosenAnchor.closest("li"));
		});
		
		function showReplyOfReplyList(pageNum, originalId, replyLi){
			replyService.listReply(
				{originalId:originalId, page:(pageNum || 1)}, //타겟 정보
				function(pairOfCriteriaListReply){
					//pair에서 List<ReplyVO> 선택
					var listReply = pairOfCriteriaListReply.second;
					var strReplyLi = "<ul>";
					for(var i=0, len=listReply.length || 0; i < len; i++){ 
						strReplyLi += "<li class='left clearfix' data-id='" + listReply[i].id + "'>";
						strReplyLi += "<div><div class='header'><strong class='primary-font'>" + listReply[i].userId + "</strong>";
						//**시간전으로 표시
						strReplyLi += "<small class='fa-pull-right text-muted'>"
							+ dateGapDisplayService.displayTime(listReply[i].updateDate) 
							+ "</small>";
						strReplyLi += "<button type='button' class='fa-pull-right' data-originalid='" +listReply[i].id + "'>대댓달기</button>"
						strReplyLi += "</div>";
						strReplyLi += "<p>"+ listReply[i].content +"</p>";
						if(listReply[i].countOfReply > 0){
							strReplyLi += "<a href='" + listReply[i].id + "'>댓글 개수는" + listReply[i].countOfReply + "</a>";
						}
						strReplyLi += "</div></li>";
					}
					strReplyLi += "</ul>";
					replyLi.append(strReplyLi);
					var moreListUp = pairOfCriteriaListReply.first;
					//displayMoreListUp(moreListUp);
				},
				function(erMsg){
					alert(erMsg);
				}
			);
		}
	});
</script>

</body>
    
</html>
			

