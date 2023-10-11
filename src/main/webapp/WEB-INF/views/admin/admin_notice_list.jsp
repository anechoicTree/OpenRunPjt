<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/resources/cs/css/admin_cs.css" var="css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[고객센터] 공지사항</title>
</head>
<body>
	<div id="cs-board-list">
		<div id="cs-board-list-head">
			<div class="cs-board-list-head-box"></div>
			<div class="cs-board-list-head-box">카테고리</div>
			<div class="cs-board-list-head-box">제목</div>
			<div class="cs-board-list-head-box">등록일</div>
		</div>
		 
		<c:forEach var="notice" items="${noticesList}">     
			<div id="cs-board-list-row">
                <div class="cs-board-list-row-box">
                    <input type="checkbox" name="selectedNotices" value="${notice.noticeNo}">
                </div>
				<div class="cs-board-list-row-box">
					${notice.category}
				</div>
				<div class="cs-board-list-row-box">
            		<a href="#" class="notice-link" data-notice-id="${notice.noticeNo}">${notice.title}</a>
        		</div>
        		<!-- 
				<div class="cs-board-list-row-box notice-link" data-notice-id="${notice.noticeNo}">
            		<span>${notice.title}</span>
        		</div>
        		 -->
				<div class="cs-board-list-row-box">
					${notice.regDate}
				</div>
				<!-- 
				<div class="cs-board-list-row"><a href="${contextPath}/notice/remove?noticeNo=${notice.noticeNo}">삭제하기</a></div>
				 -->
			</div>
		</c:forEach>
	</div>
</body>
</html>
