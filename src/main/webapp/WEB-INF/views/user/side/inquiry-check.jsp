<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의관리</title>
<link rel="stylesheet" href="user/side/inquiry.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="inquiry-container">
	<jsp:include page="side.jsp" />
	<div class ="inquiry-title"><h3 style="postion:relative;right:200px;top:100px;">문의관리</h3>
		<div class="inquiry-menu"><a href="/ticket/inquiry-check">상품 문의 조회</a></div>
		<div class="inquiry-menu2"><a href="/ticket/system-inquiry-check" style="color :#000000">시스템 문의 조회</a></div>
	</div>
	<div class ="filter-container">
		<div class="filter-menu" style="font-weight:700;">전체</div>
		<div class="filter-menu">답변대기</div>
		<div class="filter-menu">답변완료</div>
	</div>
	<div class="content-container">
		<div class="inquiry-content"></div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>