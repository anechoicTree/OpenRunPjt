<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/resources/common/css/sellerAddProduct.css' />" rel="stylesheet" type="text/css">
<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../../../views/header.jsp" />

	<section>
		<div id="section_wrap">
			<div>
				<jsp:include page="../../seller/seller_nav_side.jsp"/>
			</div>
			<div>
				<div class="word">
					<h3>상품등록</h3>
				</div>
				<div class="top_nav">
					<table>
						<tr>
							<th>상품등록</th>
							<th>상품 목록 조회</th>
							<th>상품 수정 요청</th>
						</tr>
					</table>
				</div>
				<div class="register_product_form">
					<h3>상품이 등록되었습니다!</h3>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../../../views/footer.jsp" />
	
</body>
</html>