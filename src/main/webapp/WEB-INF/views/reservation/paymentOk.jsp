<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/reservation/paymentOk.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<title>결제 하기 완료</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
		<div id="main_container">
			<div id="main_container_sub">
				<div id="main_content">결제 완료 되었습니다</div>
				<div id="main_content_sub">자세한 내용은 마이페이지에서 확인해주세요</div>
				<button class="home_button" onclick="location.href='/ticket'">홈으로 가기 </button>
			</div>
		</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>