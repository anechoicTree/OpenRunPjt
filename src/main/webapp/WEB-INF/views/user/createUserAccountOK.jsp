<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/user/createUserAccountOK.css'  var="css"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<title>사용자 회원가입 완료 페이지</title>
</head>
<body>
	<jsp:include page="../loginHeader.jsp" />

	<div id="main_container">
		<div id="main_container_sub">
			<div id="main_title">"${u_name}"님의 <br> 회원가입이 성공적으로 완료되었습니다</div>
			<button class="next_button" onclick="location.href='/ticket/loginForm'">로그인하기</button>
		</div>
	</div>
	
	 	<jsp:include page="../common/footer.jsp" />
	</body>
</html>