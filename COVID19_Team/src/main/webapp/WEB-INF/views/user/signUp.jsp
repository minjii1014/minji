<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
									<form name="form" id="signUp_form"  role="form" method="post" >
										<div class="form-row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="inputFirstName">ID</label> <input class="form-control py-4" id="loginId"
														name="userId" type="text" placeholder="Enter your Id" />
												</div>
												<button id="id_check" class="btn btn-primary" type="button" onclick="idCheck()">중복체크</button>
											</div>
										</div>
										<div class="form-group">
											<label class="small mb-1" for="inputEmailAddress">Email</label>
											<input class="form-control py-4" id="inputEmailAddress"
												name="email" type="email" aria-describedby="emailHelp"
												placeholder="Enter email address" />
										</div>
										<div class="form-row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="inputPassword">Password</label>
													<input class="form-control py-4" id="inputPassword" 
														  name="password" type="password" placeholder="Enter password" />
												</div>
											</div>
											 <div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="inputConfirmPassword">Confirm
														Password</label> <input class="form-control py-4"
														id="inputConfirmPassword" type="password"
														placeholder="Confirm password" />
												</div>
											</div> 
											<br>
											<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
										    <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
										</div>
										<input type = "hidden" name = "_csrf" value = "${_csrf.token}">
									</form>
									<div class="form-group mt-4 mb-0">
											<button type="button" class="btn btn-primary btn-block" id="btnSignup" onclick="registerCheck()">회원가입</button>
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

function registerCheck() {
    if($.trim($('#loginId').val()) == '') {
        alert("아이디를 입력해주세요.");
        return false;
    }
    if($.trim($('#inputPassword').val()) == '') {
        alert("비밀번호를 입력해주세요.");
        return false;
    }
    if($.trim($('#inputEmailAddress').val()) == '') {
        alert("이메일을 입력해주세요.");
        return false;
    }
 
    if(confirm("회원가입을 하시겠습니까?")){
        $("#signUp_form").attr("action","/user/signUp");	
        $("#signUp_form").submit();    
        alert("회원가입이 완료되었습니다. 감사합니다.");
    }
}
	
$(function(){
	 $("#alert-success").hide(); 
	 $("#alert-danger").hide();
	 $("input").keyup(function(){ 
		 var pwd1=$("#inputPassword").val();
		 var pwd2=$("#inputConfirmPassword").val();
		 if(pwd1 != "" && pwd2 != ""){ 
			 if(pwd1 == pwd2){ 
				 $("#alert-success").show();
				 $("#alert-danger").hide();
			 }else{
				  $("#alert-success").hide();
				  $("#alert-danger").show();
		   }
	    }
     });
    });
 function idCheck() {

	 var token = $("meta[name='_csrf']").attr("content");
	 var header = $("meta[name='_csrf_header']").attr("content");
    
    var loginId = $("#loginId").val();
    var idck = 0;
    if(loginId.search(/\s/) != -1) { 
        alert("아이디에는 공백이 들어갈 수 없습니다.");        
    } else {             
        if(loginId.trim().length != 0) {
            $.ajax({
                type : 'POST', 
                data: loginId,
                url: "/user/idChk",
                beforeSend : function(xhr){
  				  xhr.setRequestHeader(header, token);
  				  },
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function(data) {    
                    if(data.cnt > 0) {
                        alert("해당 아이디 존재");    
                        $("#btnSignup").attr("disabled", "disabled");
                        window.location.reload();
                    } else {
                        alert("사용가능 아이디");
                        console.log(loginId);
                        $("#btnSignup").removeAttr("disabled");
                        idck = 1;
                    }            
                },
                error: function(error) {
                    alert("아이디를 입력해주세요. ajax error ");
                }        
            });
        } else {
            alert("아이디를 입력해주세요. ajax 실패");
        }        
    }
} 

</script>
<script  src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="/resources/table_js/scripts.js"></script>

</body>

</html>

