<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/seller/createSellerAccountOK.css'  var="css"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<title>판매자 회원가입 완료 페이지</title>
</head>
<body>
	<jsp:include page="../loginHeader.jsp" />

	<div id="main_container">	
		<div id="main_container_sub">
			<div id="main_title">
				<div>"${s_business_name}"님의 <br> 회원가입 승인요청이 성공적으로 완료 되었습니다</div>
				<div id="main_content">회원가입 승인 완료까지 1~3일 정도 소요될 수 있습니다</div>
			</div>
				<button class="next_button" onclick="location.href='/ticket'">홈으로 가기</button>
		</div>
	</div>
	 	<jsp:include page="../common/footer.jsp" />
	</body>
</html>