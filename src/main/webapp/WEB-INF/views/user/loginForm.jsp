<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:url value='/resources/common/loginForm.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<title>로그인</title> 
</head>
<body>
	<jsp:include page="../loginHeader.jsp" />
	<div id="main_container">
		<div id="main_title">로그인</div>
		
		<div id="main_container_sub">
			<button id="user" onclick="location.href='user/userLogin'">구매자 로그인</button>
			<div id="main_content_nav">
				<div id="main_content1"> 간편로그인</div>
				<%--간편 회원가입 아래 라인--%>
				
					<button class="sns_button" id="naver" >네이버로 로그인</button>
					<button class="sns_button" id="kakao">카카오로 로그인</button>
			
				<div id="sns_line"></div><%--SNS계정 회원가입 아래 라인 --%>
			</div>
				<button class="join_button" id="seller" onclick="location.href='seller/sellerLogin'">판매자 로그인</button>
		</div>
		</div>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>