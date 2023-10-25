<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/user/findIdOk.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<title>구매자 아이디 찾기 성공</title>
</head>
<body>

	<jsp:include page="../loginHeader.jsp" />
		
	<div id="main_container">
		<div id="main_container_sub">
		<div id="main_title">
  			<div>"${param.u_name}"님의 <br>아이디는"${param.u_id}"입니다</div>
		</div>
		<div id="button_nav">
			<button class="next_button" id="findPw" onclick="location.href='userFindPw'">비밀번호 찾기</button>
			<button class="next_button" id="userLogin"  onclick="location.href='/ticket/loginForm'">로그인 하기</button>
		</div>
		</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>