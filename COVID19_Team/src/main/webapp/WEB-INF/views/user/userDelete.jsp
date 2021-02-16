<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Page Title - SB Admin</title>
<link href="/resources/table_css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Create
										Account</h3>
								</div>
								<div class="card-body">
								<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal.user.userId" var="userId" />
								<sec:authentication property="principal.user.email" var="email" />
								<sec:authentication property="principal.user.password" var="password" />
									<form name="form" action="/user/userDelete" id="signUp_form"  role="form" method="post" >
										<div class="form-row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="inputFirstName">ID</label> <input class="form-control py-4" id="loginId"
														name="userId" type="text" value="${userId }" readonly="readonly" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="small mb-1" for="inputEmailAddress">Email</label>
											<input class="form-control py-4" id="inputEmailAddress"
												name="email" type="email" aria-describedby="emailHelp"
												placeholder="Enter email address" value="${email }" readonly="readonly" />
										</div>
										<div class="form-row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="inputPassword">Password</label>
													<input class="form-control py-4" id="inputPassword" 
														  name="password" type="password" placeholder="Enter password" />
												</div>
											</div>
										</div>
										<input type = "hidden" name = "_csrf" value = "${_csrf.token}">
									</form>
									</sec:authorize>
									<div>
										<c:if test="${result == removeFalse}">
											비밀번호가 맞지 않습니다.
										</c:if>
									</div>
									<div class="form-group mt-4 mb-0">
											<button type="submit" class="btn btn-primary btn-block" id="btnSignup">회원탈퇴</button>
											<button type="button" class="btn btn-primary btn-block" id="btnCancel">취소하기</button>
									</div>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<a href="login.html">Have an account? Go to login</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2020</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	// 취소
	$("#btnCancel").on("click", function(){
		
		location.href = "/";
				    
	})

	$("#btnSignup").on("click", function(){
		if($("#inputPassword").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#inputPassword").focus();
			return false;
		}	
	});
	
		
	
})

</script>
<script  src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="/resources/table_js/scripts.js"></script>

</body>

</html>

