<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/resources/common/css/product_review.css' />" rel="stylesheet" type="text/css">
<jsp:include page="../include/calendar_js.jsp" />
</head>
<body>
	<jsp:include page="../../../views/common/header.jsp" />
	<section>
		<div id="section_wrap">
			<div class="product_all_wrap">
				<div class="product_name">
					<h3>${productVo.p_name}</h3>
				<hr>
				</div>
				
				<div class="product_img">
					<img src="<c:url value="/productUploadImg/${productVo.p_img}"/>">
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
					<div class="review_DB">
						<div class="row">
							<form method="post">
								<table class="table-bordered">
									<tbody>
										<tr>
											<td>
											<textarea class="form-control" placeholder="관람후기를 남겨보세요!" 
															name="com_content"	id="com_content" rows="" cols=""></textarea>
											</td>
										</tr>
										<tr>
											<td><input type="submit" class="table_btn" id="Comment_regist" value="댓글 쓰기"></td>
										</tr>
									</tbody>
								</table>
								<div class="comment_Box" style="border:1px solid gray;"> <!-- 댓글이 들어갈 박스 -->
							<script type="text/javascript">
							$('#Comment_regist').click(function() {
								
					   			//Json으로 전달할 파라미터 변수선언
					   			const com_bno = ${board_no};
					   			const com_writer = $('#com_writer').val();
					   			const com_content = $('#com_content').val();
					   			
					   			console.log(com_bno);
					   			console.log(com_writer);
					   			console.log(com_content);
					   		
					   			if(com_writer == ''){
					   				alert('로그인 후 이용해주세요');
					   				return;
					   			}else if(com_content == '') {
					   				alert('내용을 입력하세요');
					   			}
					   			
					   			$.ajax({
					   				type:'post',
					   				url:'<c:url value="/Comment/InsertComment"/>',
					   				data: JSON.stringify(
					   					{
					   						"com_bno":com_bno,
					   						"com_writer":com_writer,
					   						"com_content":com_content
					   					}		
					   				),
					   				contentType: 'application/json',
					   				success:function(data){
					   					console.log('통신성공' + data);
					   					if(data === 'InsertSuccess') {
					   						alert('댓글 등록이 완료되었습니다.');
					   						console.log('댓글 등록 완료');
					   						$('#com_writer').val(com_writer);
					   	   					$('#com_content').val('');
					   	   					getList();
					   					} else {
					   						alert('로그인 이후 이용해주시기 바랍니다.');
					   						console.log('댓글 등록 실패');
					   					}
					   				},
					   				error:function(){
					   					alert('통신실패');
					   				}
					   			});// 댓글 비동기 끝
					   			
							});// 댓글등록 이벤트 끝
							
							getList();
							</script>
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
	<jsp:include page="../../../views/common/footer.jsp" />
</body>
</html>