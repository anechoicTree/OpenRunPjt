<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/resources/cs/css/admin_cs.css" var="css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[고객센터] 자주 묻는 질문</title>
</head>
<body>
	<div id="cs-board-list">
		<div id="cs-board-list-head">
			<div class="cs-board-list-head-box"></div>
			<div class="cs-board-list-head-box">카테고리</div>
			<div class="cs-board-list-head-box">제목</div>
			<div class="cs-board-list-head-box">등록일</div>
		</div>
		 
		<c:forEach var="faq" items="${faqsList}">     
			<div id="cs-board-list-row">
                <div class="cs-board-list-row-box">
                    <input type="checkbox" name="selectedFaqs" value="${faq.faqNo}">
                </div>
				<div class="cs-board-list-row-box">
					${faq.category}
				</div>
				<div class="cs-board-list-row-box">
            		<a href="#" class="faq-link" data-faq-id="${faq.faqNo}">${faq.title}</a>
        		</div>

			</div>
		</c:forEach>
	</div>
</body>
</html>