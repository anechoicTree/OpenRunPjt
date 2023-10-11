<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/resources/cs/css/admin_cs.css" var="css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 인증</title>
</head>
<body>
	<div id="cs-board-list">
		<div id="cs-board-list-head-seller">
			<div class="cs-board-list-head-box"></div>
			<div class="cs-board-list-head-box">판매자ID</div>
			<div class="cs-board-list-head-box">사업자명</div>
			<div class="cs-board-list-head-box">사업자등록번호</div>
			<div class="cs-board-list-head-box">판매자 등급</div>
		</div>
		 
		<c:forEach var="seller" items="${sellersList}">     
			<div id="cs-board-list-row-seller">
                <div class="cs-board-list-row-box">
                    <input type="checkbox" name="selectedSellers" value="${seller.seller_no}">
                </div>
				<div class="cs-board-list-row-box">
            		<a href="#" class="notice-link" data-notice-id="${seller.seller_no}">${seller.s_id}</a>
        		</div>
        		<div class="cs-board-list-row-box">${seller.s_business_name}</div>
				<div class="cs-board-list-row-box">${seller.s_business_reg_no}</div>
				<div class="cs-board-list-row-box">${seller.s_level}</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>
