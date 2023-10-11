<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/cs/css/cs.css" var="css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[고객센터] 이용 가이드</title>
</head>
<body>
	<div id="cs-board-image">
	
	</div>

	<div id="cs-board-list">
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