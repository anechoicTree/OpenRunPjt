<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/cs/css/cs.css" var="css" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[고객센터] 공지사항</title>
    <link rel="stylesheet" href="${css}">

</head>
<body>
	<div id="cs-container">
		<div id="cs-board">         
			<div id="cs-board-title">
				<span>공지사항 상세 조회</span>
			</div>
			<div id="cs-board-detail">
				<div id="cs-board-detail-head-notice">
					<div class="cs-board-detail-head-box">${notice.category}</div>
					<div class="cs-board-detail-head-box" id="detail-title">${notice.title}</div>
					<div class="cs-board-detail-head-box">${notice.regDate}</div>
				</div>
			    <div class="cs-board-detail-content">
			        <div>
			        	${notice.body}
			       	</div>
		    	</div>
			</div>
		</div>
	</div>
</body>
</html>