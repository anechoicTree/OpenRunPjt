<%@ page import="com.openrun.ticket.vo.UserVO"%> 
<%@ page import="com.openrun.ticket.vo.SellerVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/joinMember.css'  var="css"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<title>회원가입페이지</title>
</head>
<body>
	<jsp:include page="loginHeader.jsp" />
	<div id="main_container">
		<div id="main_title">회원가입</div>
		<div id="main_container_sub">
				<button id="user" onclick="location.href='user/createUserAccountAgreementForm'">구매자 회원가입</button>
				<div id="main_content_nav">
					<div id="main_content1"> 간편회원가입</div>
					<%--간편 회원가입 아래 라인 --%>
		
						<button class="sns_button" id="naver">네이버로 가입</button>
						<button class="sns_button" id="kakao">카카오로 가입</button>

					<div id="main_content2">SNS계정 회원가입(만 14세 이상 가능)</div>
					<div id="sns_line"></div><%--SNS계정 회원가입 아래 라인 --%>
				</div>
					<button class="join_button" id="seller" onclick="location.href='seller/createSellerAccountAgreementForm'">판매자 회원가입</button>
			</div>
		</div>
		<jsp:include page="./common/footer.jsp" />

</body>
</html>