<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기관리</title>
<link rel="stylesheet" href="resources/css/review.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />

<div class="review-container">
	<jsp:include page="side.jsp" />
	<div class ="review-title"><h3 style="postion:relative;right:200px;top:100px;">후기관리</h3>
		<div class="review-menu"><a href="/ticket/review1">작성 가능한 후기</a></div>
		<div class="review-menu2"><a href="/ticket/review2" style="color :#000000">내가 작성한 후기</a></div>
	</div>
	<div class ="filter-container">
		<div class="filter-menu" style="font-weight:700;">전체</div>
		<div class="filter-menu">공연중</div>
		<div class="filter-menu">공연종료</div>
	</div>
	<div class="content-container">
		<div class="review-content"></div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>