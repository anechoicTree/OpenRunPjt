<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/user/reservationList.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>취소 내역 조회-카테고리</title>
<script>

//1. 상세 페이지
$(document).on('click', '#p_name', function(event) {
	event.preventDefault(); // 기본 동작 중지 : 해시('#')이 추가되지 않고 주소 유지 가능
    const r_no = $(this).data('reservation-id');
	console.log(r_no);
    $.ajax({
        type: 'GET',
        url: '/ticket/product/admin/userCancelReservationListDetail?r_no=' + r_no,
        	success: function(data) {
            $('#view').html(data); // div 내용을 응답 데이터로 업데이트
            console.log(data);
        },
        error: function() {
            // 오류 발생 시 실행되는 콜백 함수
            alert('파일을 로드하는 동안 오류가 발생했습니다.');
        }
    });
});

//2. 각 카테고리 버튼에 대한 클릭 이벤트 리스너 추가
$(document).on('click', '.category_button', function(event) {
    event.preventDefault(); // 기본 동작 중지 : 해시('#')이 추가되지 않고 주소 유지 가능
    console.log("클릭까지 됨");
    const productId = $(this).data('id');
    var p_category = productId;
    
    if (productId === '전체') {
        // "전체" 버튼을 누를 때
        p_category = '전체'; // 빈 문자열로 설정
    }
    
    var totalPages = ${totalPages}; // 총 페이지 수
	var currentPage = ${currentPage}; // 현재 페이지
    
    // Ajax 요청을 보냅니다.
    $.ajax({
        type: 'GET',
        url: '/ticket/product/admin/userCancelReservationListCategory?p_category=' + p_category, // 카테고리에 따른 공지사항 목록을 가져오는 URL로 변경
        success: function(data) {
    	    var totalPages = ${totalPages}; // 총 페이지 수
    		var currentPage = ${currentPage}; // 현재 페이지
            $('#selectNoticeListContainer').html(data);
        },
        error: function() {
            // 오류 발생 시 실행되는 콜백 함수
            alert('로드하는 동안 오류가 발생했습니다.');
        }
    });
});</script>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div id="main_nav">
	<div id="main_nav_container">
		<jsp:include page="side/side.jsp" />
			<div id="main_nav_sub">
				<div id="main_title">취소 내역 조회</div>
				
				<div id="view">
				<div id="category_button_container">
				
					<button class="category_button" data-id="전체">전체</button>
					<button class="category_button" data-id="뮤지컬">뮤지컬</button>
					<button class="category_button" data-id="콘서트">콘서트</button>
					<button class="category_button" data-id="연극">연극</button>
					<button class="category_button" data-id="클래식/무용">클래식/무용</button>
					<button class="category_button" data-id="전시/행사">전시/행사</button>
				</div>
				<div id="main_content_sub">
					<div id="selectNoticeListContainer">
						<%@ include file="userCancelReservationListContainer.jsp" %>
					</div>
				</div>
				</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" />

</body>
</html>