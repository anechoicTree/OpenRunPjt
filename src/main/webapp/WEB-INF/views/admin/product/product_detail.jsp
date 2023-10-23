<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/resources/common/css/product_detail.css' />" rel="stylesheet" type="text/css">
<%-- <link href="<c:url value='/resources/common/css/goods_detail.css' />" rel="stylesheet" type="text/css"> --%>
<jsp:include page="../include/calendar_js.jsp" />
<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
</head>
<body>
	<jsp:include page="../../../views/header.jsp" />
	<section>
		<div id="section_wrap">
			<div class="product_all_wrap">
				<div class="product_name">
					<h3>${productVo.p_name}</h3>
				<hr>
				</div>
				
				<div class="product_img">
					<img src="<c:url value="/productUploadImg/${productVo.p_img}" />" style="width : 200px;">
							<!-- DB에서 받아올 상품 썸네일 -->
				</div>
				<div class="product_table">
					<table>
							<tr>
								<th>장소</th>
								<td>${productVo.p_hall}</td>
							</tr>	
							<tr>	
								<th>공연기간</th>
								<td>${productVo.p_perfo_start_date} ~ ${productVo.p_perfo_end_date}</td>
							</tr>
							<tr>
								<th>공연시간</th>
								<td>${productVo.p_viewing_time}</td>
							</tr>
							<tr>
								<th>관람연령</th>
								<td>${productVo.p_viewing_grade}</td>
							</tr>
							<tr>	
								<th>가격</th>
								<td>${productVo.p_price}원</td>
							</tr>
							<tr>
								<th>유의사항</th>
								<td>${productVo.p_resev_start_date} ~ ${productVo.p_resev_end_date}까지<br>
									구매 가능합니다.</td>
							</tr>
					</table>
				</div>
				<div class="main_content">
					<div>
					<div class="product_content">
			              <button class="select_btn" data-id="content" onclick="location.href='productDetail?p_no=${productVo.p_no}'">공연정보</button>
			            </div>
			            <div class="sell_info">
			              <button class="content_btn" data-id="info" onclick="location.href='productSellInfo?p_no=${productVo.p_no}'">판매정보</button>
			            </div>
			            <div class="review">
			              <button class="content_btn" data-id="review" onclick="location.href='productReview?p_no=${productVo.p_no}'">관람후기</button>
			            </div>
			            <div class="place_info">
			              <button class="content_btn" data-id="place" onclick="location.href='productPlaceInfo?p_no=${productVo.p_no}'">장소안내</button>
			            </div>
					</div>
					<div class="editor_DB" style="width: 700px;">
							<div>${productVo.p_content}</div>
					</div>
				</div>
			</div>
			<div class="calendar">
					<jsp:include page="../../../views/calendar.jsp" />
				<!-- 위치 안움직이게 jQuery도 써야하는 것 같음 -->
			</div>
		</div>
	</section>
	<jsp:include page="../../../views/footer.jsp" />
</body>
</html>