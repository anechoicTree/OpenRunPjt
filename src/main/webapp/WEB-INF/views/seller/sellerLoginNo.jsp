<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/seller/sellerLoginNo.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<title>판매자 승인예정</title>
</head>
<body>
		<jsp:include page="../loginHeader.jsp" />
		<div id="main_nav">
			<div id="main_title">
				<div>"${sellerLoginResult.s_business_name}"님의 <br>회원가입 승인이 진행 중 입니다</div>
				<div id="main_content">회원가입 승인이 일주일 이상 진행되고 있다면 문의해주세요</div>
			</div>
			<button class="next_button" onclick="location.href='홈으로 가기''">홈으로 가기</button>
		</div>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>