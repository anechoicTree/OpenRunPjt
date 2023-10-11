<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/cs/css/cs.css" var="css" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>[고객센터] 이용 가이드</title>
<link rel="stylesheet" href="${css}">

<script>
	$(document).on('click', '#guide-category-btn', function(event) {
	    event.preventDefault(); // 기본 동작 중지 : 해시('#')이 추가되지 않고 주소 유지 가능
	    const guideId = $(this).data('id');
	    const categoryNo = guideUrlMap[guideId];
	    
	    // Ajax 요청을 보냅니다.
	    $.ajax({
	        type: 'GET',
	        url: '/ticket/cs/guide/listGuidesByCategory?categoryNo=' + categoryNo, // 카테고리에 따른 FAQ 목록을 가져오는 URL로 변경
	        success: function(data) {
	            $('#view2').html(data);
	        },
	        error: function() {
	            // 오류 발생 시 실행되는 콜백 함수
	            alert('FAQ 목록을 로드하는 동안 오류가 발생했습니다.');
	        }
	    });
	});
</script>	
</head>
<body>
	<div id="cs-container">
		<div id="cs-board">
			<div id="cs-board-title">
				<span>이용 가이드</span>
			</div>
			<div id="cs-board-category">
				<div id="cs-board-category-nav">
					<div class="category-box">
						<button class="category-btn" id="guide-category-btn" data-id="booking">예매 방법</button>
					</div>
					<div class="category-box">
						<button class="category-btn" id="guide-category-btn" data-id="payment">결제 방법</button>
					</div>
					<div class="category-box">
						<button class="category-btn" id="guide-category-btn" data-id="cancel">취소/환불</button>
					</div>
					<div class="category-box">
						<button class="category-btn" id="guide-category-btn" data-id="delivery">배송/발권</button>
					</div>
					<div class="category-box">
						<button class="" data-id=""></button>
					</div>
				</div>
			</div>
			<div id="view2">
				<%@ include file="cs_guide_list.jsp" %>
			</div>
		</div>
	</div>
</body>
</html>