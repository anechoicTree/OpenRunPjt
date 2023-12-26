<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/cs/css/cs.css" var="css" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>[고객센터] 이용 가이드</title>
	<link rel="stylesheet" href="${css}">
</head>
<body>
	<div id="cs-board-list-guide">
		<!-- 
		<div id="cs-board-image"> DUMMY 상단 설명 이미지 넣을 공간</div>
		 -->
		<br>
		
		<c:forEach var="guide" items="${guidesList}">     
		    <div id="cs-board-list-row-guide">
		        <div class="cs-board-list-row-box-img">
		            <img src="${pageContext.request.contextPath}${guide.imgPath}" alt="${guide.imgOriginName}" class="guide-image"/>
		        </div>
		    </div>
		</c:forEach>
	</div>
</body>
</html>