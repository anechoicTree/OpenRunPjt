<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.openrun.ticket.product.ProductVO"%>
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

	<section>
		<div id="section_wrap">
			<div>
				<jsp:include page="../../seller/seller_nav_side.jsp"/>
			</div>
			<div>
				<div class="word">
					<h3>상품 목록 조회</h3>
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
				<div class="show_product_list">
					<form action="<c:url value='/product/admin/showProductList' />" name="show_product_list" method="post" enctype="multipart/form-data">
						<table>
							<thead>
								<tr>
									<th>공연 이미지</th>
									<th>상품명</th>
									<th>잔여석</th>
									<th>판매기간</th>
									<th>판매상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${productVos}">
									<tr>
										<td>${item.p_img}</td>
										<td>
											<c:url value='/product/admin/productDetail' var='detail_url'>
												<c:param name='p_no' value='${item.p_no}'/>
											</c:url>
											<a href="${detail_url}">${item.p_name}</a>
										</td>
										<td>${item.p_seat}</td>
										<td>${item.p_resev_start_date} ~ ${item.p_resev_end_date}까지</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../../../views/footer.jsp" />
</body>
</html>