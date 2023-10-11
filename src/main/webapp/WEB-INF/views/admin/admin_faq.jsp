<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/resources/cs/css/admin_cs.css" var="css" />
<c:url value="/resources/admin/js/admin_faq.js" var="admin_faq" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>[고객센터] 자주 묻는 질문</title>
<link rel="stylesheet" href="${css}">

<script src="${admin_faq}"></script>
<script>
var totalPages = ${totalPages}; // 총 페이지 수
var currentPage = ${currentPage}; // 현재 페이지
</script>
</head>
<body>
	<div id="cs-container">
		<div id="cs-board">
			<div id="cs-board-title">
				<span>자주 묻는 질문</span>
			</div>
			<div id="cs-board-category">
				<div id="cs-board-category-nav">
					<div class="category-box">
						<button class="category-btn" id="faq-category-btn" data-id="user">회원</button>
					</div>
					<div class="category-box">
						<button class="category-btn" id="faq-category-btn" data-id="book">예매</button>
					</div>
					<div class="category-box">
						<button class="category-btn" id="faq-category-btn" data-id="payment">결제</button>
					</div>
					<div class="category-box">
						<button class="category-btn" id="faq-category-btn" data-id="etc">기타</button>
					</div>
					<div class="category-box">
						<button class="" data-id=""></button>
					</div>
				</div>
			</div>
			<div id="view2">
				<%@ include file="admin_faq_list.jsp" %>
			</div>
		</div>
		<div>
			<div class="cud-btn-box">
				<button class="cud-btn" id="faq-create-btn">작성</button><button class="cud-btn" id="faq-update-btn">수정</button><button class="cud-btn" id="faq-delete-btn">삭제</button>
			</div>
		</div>		
		<div id="cs-board-page">
		<!-- 이전 페이지로 이동하는 버튼 -->
			<button id="faq-prev-btn" class="move-buttons" onclick="changePage(${currentPage - 1})">&lt;</button>
			
			<!-- 페이지 번호 버튼들 -->
			<c:forEach var="pageNum" begin="1" end="${totalPages}">
			    <button class="faq-page-buttons page-buttons" onclick="changePage(${pageNum})" value="${pageNum}">${pageNum}</button>
			</c:forEach>
			
			<!-- 다음 페이지로 이동하는 버튼 -->
			<button id="faq-next-btn" class="move-buttons" onclick="changePage(${currentPage + 1})">&gt;</button>
		</div>
	</div>
</body>
</html>