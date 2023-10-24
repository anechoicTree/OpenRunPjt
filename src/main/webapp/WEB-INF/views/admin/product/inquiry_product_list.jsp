<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/resources/common/css/sellerInquiryAnswer.css' />" rel="stylesheet" type="text/css">
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
			<th>등록일</th>
		</tr>	
		<c:forEach var="inq" items="${productQnasList}">
			<tr>	
				<td>${inq.i_no}</td>
				<td>${inq.i_title}</td> <!-- 타이틀 누르면 i_no을 파라미터값으로 가져가서 해당 테이블 정보를 가져오는 링크 넣기 -->
				<td>${inq.i_regdate}</td>
				<c:choose>
					<c:when test="${inq.i_level == 2}" >
						<td>
						<button type="submit" onclick="location.href='registerInquiryForm?i_no=${inq.i_no}'">등록</button>
						</td>
					</c:when>
					<c:otherwise>
						<td>
						<button>등록완료</button>
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
	<jsp:include page="../../../views/footer.jsp" />
</body>
</html>