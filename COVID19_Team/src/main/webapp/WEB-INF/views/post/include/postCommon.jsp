<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="www.dream.com.board.model.*" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div id="divIdentifier" class="form-group">
	<label>ID : </label>
	<!-- int, long 같은 것은 null 이면 문제가 발생 할까? 발생한다 그러니까 숫자로 들어가는거는 null안들어가도록 default값 아무거나 넣어라 -->
	<input type="number" name="postId" value="${post != null ? post.postId : 0}" readonly="readonly" class="form-control" >
</div>
<div class="form-group">
	<label>제목</label>
	<input id="title" name="postTitle" value="${post.postTitle}" class="form-control" >
</div>
<div class="form-group">
	<label>내용</label>
	<textarea id="txacontent" name="postContent" class="form-control" rows=3 >${post.postContent}</textarea>
</div>

<script type="text/javascript">

	//create read update
	function setOprationMode(oprationMode) {
		if ("read" === oprationMode) {
			$("#title").attr("readonly", true);
			$("#txacontent").attr("readonly", true);
			$("#hashTag").attr("readonly", true);
		} else if ("create" === oprationMode) {
			$("#divIdentifier").hide();
		}
	}
</script>
