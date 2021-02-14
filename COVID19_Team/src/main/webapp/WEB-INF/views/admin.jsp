<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>관리자 진입 가능 페이지</h1>
	<p>principa : <sec:authentication property="principal"/>
	<p>UserVO : <sec:authentication property="principal.user"/>
	<p>사용자이메일 : <sec:authentication property="principal.user.email"/>
	<p>사용자 아이디 : <sec:authentication property="principal.user.userId"/>
	<p>사용자 권한 리스트 : <sec:authentication property="principal.user.authList"/>
<br>	
<a href="/user/customLogout">LogOut</a>
</body>
</html>