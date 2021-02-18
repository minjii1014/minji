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
					<ul id="listReply" data-originalid="${post.id}" data-page_num="1" data-countofreply="${post.countOfReply}">	
						<!-- 프로그램에서 처리 "", 스타일 처리 ''  li 목록 및 마지막에 anchor -->
						댓글 개수는 "${post.countOfReply}"
						<button class="btnAddReply" class="btn btn-primary btn-xs fa-pull-right">댓글달기</button>
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
		showReplyListAnchor(listReplyUL);
		
		function showReplyListAnchor(parentUl) {
			var replyCnt = parentUl.data("countofreply");
			if(replyCnt > 0){
				var strShowReply = "<a>댓글 펼치기</a>";
				parentUl.append(strShowReply);
			}
		}

		//댓글 또는 대댓글 펼치기
		$("#listReply").on("click", "a", function(e){
			var choosenAnchor = $(this);
			var choosenUl = $(this).closest("ul");
			choosenAnchor.remove();
			var originalId = choosenUl.data("originalid");
			var pageNum = choosenUl.data("page_num");
			showReplyList(pageNum, originalId, choosenAnchor, choosenUl);
			//page_num을 1올려주고 맨 마지막에 anchor를 다시 달아준다
			
		});

		function showReplyList(pageNum, originalId, anchorOfShowMoreReply, choosenUl){
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
						strReplyLi += "</div>";
						strReplyLi += "<p>"+ listReply[i].content +"</p>";
						strReplyLi += "<ul data-originalid='" + listReply[i].id + 
			              "' data-page_num='1' data-countofreply='" +  listReply[i].countOfReply +
			              "'>댓글 " + listReply[i].countOfReply + "개 더보기 ";
						strReplyLi += "<button class='btnAddReply' class='btn btn-primary btn-xs fa-pull-right'>대댓글달기</button> ";
						if(listReply[i].countOfReply > 0){
							strReplyLi += "<a>댓글 펼치기</a>";
						}
						strReplyLi += "</ul>";
						strReplyLi += "</div></li>";
					}
					choosenUl.append(strReplyLi);
					
					var pageCriteria = pairOfCriteriaListReply.first;
					if(pageCriteria.pageNum < pageCriteria.endPage || pageCriteria.hasNext){
						choosenUl.append(anchorOfShowMoreReply);
						choosenUl.data('page_num', pageNum + 1);
					}
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
		var ulOfModalControl;
		var liOfModalControl;
		$("#listReply").on("click", "li p", function(e){
			ulOfModalControl = $(this).closest("ul");
			liOfModalControl = $(this).closest("li");
			//showReplyList 함수 내 strReplyLi에서 추가된 li의 id
			var replyId = liOfModalControl.data("id");
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

		
		 
		//댓글 등록 화면 열기
		$("ul").on("click", ".btnAddReply", function(e) {
			//Nested li에서 일어난 이벤트가 이를 감싸고 있는 요소(부모 요소)에 할당된 위임 이벤트가 연속해서 처리되는 것을 막을 것이야.
			e.stopImmediatePropagation();

			ulOfModalControl = $(this).closest("ul");
			var originalid = ulOfModalControl.data("originalid");
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

		//댓글 등록 이벤트
		btnRegisterReply.on("click", function(e) {
			e.preventDefault();
 			var originalid = btnRegisterReply.data("originalid");
			
			//객체 생성(javascript 방식 객체 만들기, 속성 명칭:값)
			var reply = {originalId: originalid,
				content:modalReply.find("input[name='replyContent']").val()};
			modalReply.modal("hide");
			replyService.registerReply(reply, function(result){
				alert("댓글이 등록되었습니다.");
				
				var anchorForListReplyOfReply =  ulOfModalControl.children('a')[0];
				//지금 막 달은 댓글은 첫 페이지 최상단에 나타나야 함.
				//이에 기존 UL에 담긴 Li 들은 모두 청소 하고 
				var listReply = ulOfModalControl.find('li');
				listReply.remove();
				//ulOfModalControl.remove(ulOfModalControl.find('li'));
				//1페이지를 조회하여 보여주도록 제어한다.
				//만약에 댓글의 개수가 페이지당 출력 개수를 초과할 경우
				var countOfReply = result.second;
				ulOfModalControl.data("countofreply", countOfReply);
				var pageSize = result.third;
				
				if(countOfReply > pageSize){
					//다음 펼치기는 2쪽(page_num = 2)으로 설정
					ulOfModalControl.data("page_num", 2)			
				}
				
				showReplyList(1, originalid, anchorForListReplyOfReply, ulOfModalControl);
			});
		});
		
		//댓글 수정 이벤트
		btnModifyReply.on("click", function(e) {
			e.preventDefault();
			var reply = {id: modalReply.data("id"),
				content:modalReply.find("input[name='replyContent']").val()};
			replyService.updateReply(reply, function(result){
				alert("댓글이 수정되었습니다.");
				modalReply.modal("hide");
				var replyContent = liOfModalControl.find('p')[0];
	            replyContent.textContent = reply.content;
			});
		});
		
		//댓글 삭제 이벤트
		btnRemoveReply.on("click", function(e) {
			e.preventDefault();
			replyService.deleteReply(modalReply.data("id"), function(result){
				alert("댓글이 삭제되었습니다.");
				modalReply.modal("hide");
				liOfModalControl.remove();
			});
		});

		/* 댓글 더 펼치기 출력 하기 및 이벤트 처리*/
		var replyMoreListUp = $("#replyMoreListUp");
		function displayMoreListUp(pageCriteria){
			var anchorHtml = "<a href='" + (pageCriteria.pageNum + 1)
				+"'>답글 더보기. 총 개수는" + pageCriteria.totalDataCount + "</a>";
			if(pageCriteria.pageNum < pageCriteria.endPage || pageCriteria.hasNext){
				replyMoreListUp.html(anchorHtml);
			}else{
				replyMoreListUp.hide();
			}
		}

		//댓글 더보기 클릭시 펼치기
		replyMoreListUp.on("click", "a", function(e){
			e.preventDefault();
			var targetPageNum = $(this).attr("href");
			showReplyList(targetPageNum, originalId);
		});
		
	});
</script>

</body>
    
</html>
			

