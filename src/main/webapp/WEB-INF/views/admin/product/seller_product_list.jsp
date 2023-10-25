<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.openrun.ticket.vo.ProductVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/resources/common/css/sellerProductList.css' />" rel="stylesheet" type="text/css">
<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../../../views/header.jsp" />
	<div>
		<jsp:include page="../../seller/seller_nav_side.jsp"/>
	</div>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>판매기간</th>
		</tr>	
		<c:forEach var="pdt" items="${productsList}">
			<tr>	
				<td>${pdt.p_no}</td>
				<td>${pdt.p_name}</td> <!-- 타이틀 누르면 p_no을 파라미터값으로 가져가서 해당 테이블 정보를 가져오는 링크 넣기 -->
				<td>${pdt.p_resev_start_date} ~ ${pdt.p_resev_end_date}</td>
				<%-- <c:choose>
					<c:when test="${inq.i_level == 2}" > --%>
						<td>
						<button type="submit" onclick="location.href='modifyProductForm?p_no=${pdt.p_no}'">수정</button>
						</td>
	<%-- 				 </c:when> 
					<c:otherwise>
						<td>
						<button>판매완료</button>
						</td>
					</c:otherwise>
				 </c:choose>  --%>
			</tr>
		</c:forEach>
	</table>
	<jsp:include page="../../../views/footer.jsp" />
</body>
</html>