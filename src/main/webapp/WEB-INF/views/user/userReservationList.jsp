<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/user/reservationList.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>예매 내역 조회</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div id="main_nav">
	<div id="main_nav_container">
		<jsp:include page="side/side.jsp" />
			<div id="main_nav_sub">
				<div id="main_title">예매 내역 조회</div>
				
				<div id="category_button_container">
					<button class="category_button">전체</button>
					<button class="category_button">뮤지컬</button>
					<button class="category_button">콘서트</button>
					<button class="category_button">연극</button>
					<button class="category_button">클래식/무용</button>
					<button class="category_button">전시/행사</button>
				</div>
			<div id="main_content_sub">
				<div id="selectNoticeListContainer">
					<%@ include file="userReservationListContainer.jsp" %>
				</div>
			
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" />

</body>
</html>