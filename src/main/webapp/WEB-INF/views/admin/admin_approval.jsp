<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/cs/css/admin_cs.css" var="css" />
<c:url value="/resources/admin/js/admin_approval.js" var="admin_approval" />
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>판매자 승인</title>
<link rel="stylesheet" href="${css}">

<script src="${admin_approval}"></script>
<script>
var totalPages = ${totalPages}; // 총 페이지 수
var currentPage = ${currentPage}; // 현재 페이지
</script>
</head>
<body>
	<div id="cs-container">
		<div id="cs-board">
			<div id="cs-board-title">
				<span>판매자 인증</span>
			</div>
			<div id="view2">
				<%@ include file="admin_approval_list.jsp" %>
			</div>
		</div>
		<div>
			<div class="cud-btn-box">
				<button class="cud-btn" id="seller-approval-btn">승인</button>
			</div>
		</div>		
		<div id="cs-board-page">
		<!-- 이전 페이지로 이동하는 버튼 -->
			<button id="seller-prev-btn" class="move-buttons" onclick="changePage(${currentPage - 1})">&lt;</button>
			
			<!-- 페이지 번호 버튼들 -->
			<c:forEach var="pageNum" begin="1" end="${totalPages}">
			    <button class="seller-page-buttons page-buttons" onclick="changePage(${pageNum})" value="${pageNum}">${pageNum}</button>
			</c:forEach>
			
			<!-- 다음 페이지로 이동하는 버튼 -->
			<button id="seller-next-btn" class="move-buttons" onclick="changePage(${currentPage + 1})">&gt;</button>
		</div>
	</div>
</body>
</html>