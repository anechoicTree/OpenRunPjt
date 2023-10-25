<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/resources/common/css/product_review.css' />" rel="stylesheet" type="text/css">
<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../include/calendar_js.jsp" />
<script>
	function addReply(p_no, r_writer, r_content) {
	    // r_writer 값이 비어있는지 확인
	    if (!r_writer || r_writer.trim() === '') {
	        alert("로그인이 필요합니다.");
	    } else {
	        console.log("r_writer 값: " + r_writer);
	
	        // 서버로 데이터를 전송
	        $.ajax({
	            type: "POST",
	            url: "/product/seller/addReply",
	            data: { p_no: p_no, r_writer: r_writer, r_content: r_content },
	            success: function(data) {
	                // 성공적으로 처리한 후의 동작
	                alert("댓글이 추가되었습니다.");
	                // 페이지 새로 고침 또는 댓글 목록을 업데이트하는 코드 추가
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                alert("댓글 추가 중 오류가 발생했습니다.");
	                console.log(jqXHR, textStatus, errorThrown);
	            }
	        });
	    }
	}
</script>
</head>
<body>
	<jsp:include page="../../../views/header.jsp" />
	<section>
		<div id="section_wrap">
			<div class="product_all_wrap">
				<div class="product_name">
					<h3>${productVO.p_name}</h3>
				<hr>
				</div>
				
				<div class="product_img">
					<img src="<c:url value="/productUploadImg/${productVO.p_img}"/>" style="width : 200px;">
							<!-- DB에서 받아올 상품 썸네일 -->
				</div>
				<div class="product_table">
					<table>
							<tr>
								<th>장소</th>
								<td>${productVO.p_hall}</td>
							</tr>	
							<tr>	
								<th>공연기간</th>
								<td>${productVO.p_perfo_start_date} ~ ${productVO.p_perfo_end_date}</td>
							</tr>
							<tr>
								<th>공연시간</th>
								<td>${productVO.p_viewing_time}</td>
							</tr>
							<tr>
								<th>관람연령</th>
								<td>${productVO.p_viewing_grade}</td>
							</tr>
							<tr>	
								<th>가격</th>
								<td>${productVO.p_price}원</td>
							</tr>
							<tr>
								<th>유의사항</th>
								<td>${productVO.p_resev_start_date} ~ ${productVO.p_resev_end_date}까지<br>
									구매 가능합니다.</td>
							</tr>
					</table>
				</div>
				<div class="main_content">
					<div>
						<div class="product_content">
			              <button class="select_btn" data-id="content" onclick="location.href='productDetail?p_no=${productVO.p_no}'">공연정보</button>
			            </div>
			            <div class="sell_info">
			              <button class="content_btn" data-id="info" onclick="location.href='productSellInfo?p_no=${productVO.p_no}'">판매정보</button>
			            </div>
			            <div class="review">
			              <button class="content_btn" data-id="review" onclick="location.href='productReview?p_no=${productVO.p_no}'">관람후기</button>
			            </div>
			            <div class="place_info">
			              <button class="content_btn" data-id="place" onclick="location.href='productPlaceInfo?p_no=${productVO.p_no}'">장소안내</button>
			            </div>
					</div>
					<div class="review_DB">
						<div class="row">
							<form action="<c:url value='/product/seller/addReply' />" name="add_reply_form" method="post">
							<input type="hidden" name="p_no" value="${productVO.p_no}" /> 
								<table class="table-bordered">
									<tbody>
										<tr>
											<td>
											<textarea class="form-control" placeholder="관람후기를 남겨보세요!" 
															name="com_content"	id="com_content" rows="" cols=""></textarea>
											</td>
										</tr>
										<tr>
											<td><input type="button" class="table_btn" id="Comment_regist" value="댓글 쓰기" 
    										onclick="addReply(${productVO.p_no}, '${userVO.u_id}', $('#com_content'));"></td>
										</tr>
									</tbody>
								</table>
								<div id="reply-list">
								<!-- 댓글 들어갈 곳 -->
								</div>
								
							</form>
						</div>
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