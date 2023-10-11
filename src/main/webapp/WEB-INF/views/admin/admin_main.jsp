
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/resources/main/css/main.css" var="css" />
<c:url value="/resources/common/css/nav_side.css" var="css2" />
<c:url value="/resources/admin/js/admin_main.js" var="js_admin" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지</title>
<link rel="stylesheet" href="${css}">
<link rel="stylesheet" href="${css2}">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${js_admin}"></script>

</head>
<body>

    <%@ include file="../admin/common/admin_header.jsp" %>

    <!-- 사이드 메뉴바 -->
    <div class="body">
	    <div class="side">
	    	<div class="sidenav-container">
				<div class="sidenav-container-sub">
					<div class="sidenavtitle">관리메뉴</div>
					<div class="sidenavmenu">
						<div class="stitle" id="notice_btn">공지사항</div>
						<div class="stitle" id="guide_btn">이용 가이드</div>
						<div class="stitle" id="faq_btn">자주 묻는 질문</div>
						<div class="stitle" id="qna_btn">1:1문의</div>
						<div class="stitle" id="sellerApproval_btn">판매자 인증</div>
					</div>
				</div>
			</div>
	    </div>
	    <!--  동적으로 전환되어 보여지는 뷰 영역 -->
	    <div class="view" id="view">
	    	<%@ include file="admin_notice.jsp" %>
		</div>    	
    </div>
	
</body>
</html>