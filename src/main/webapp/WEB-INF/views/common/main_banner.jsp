<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/main/css/main_banner.css" var="css" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${css}">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script> 
	
</script>

</head>
<body>
	<div class="main-banner-container">
		<div class="main-banner-container-sub">
			<div id="main-banner-title">티켓 랭킹</div>
			<div class="filter">
				<ul id="filter-list">
					<li class="filter-item">
						<button class="filter-btn" id="">뮤지컬</button>
					</li>
					<li class="filter-item">
						<button class="filter-btn" id="">콘서트</button>
					</li>
					<li class="filter-item">
						<button class="filter-btn" id="">연극</button>
					</li>
					<li class="filter-item">
						<button class="filter-btn" id="">클래식/무용</button>
					</li>
					<li class="filter-item">
						<button class="filter-btn" id="">전시/행사</button>
					</li>
				</ul>
			</div>
			<div class="wrapper">
				<i id="left" class="fa-solid fa-angle-left"></i>
					 <div class="performance-list">
					 </div>
				<i id="right" class="fa-solid fa-angle-right"></i>
			</div>
		</div>	
	</div>
</body>
</html>