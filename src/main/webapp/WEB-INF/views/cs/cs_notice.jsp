<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/cs/css/cs.css" var="css" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>[고객센터] 공지사항</title>
<link rel="stylesheet" href="${css}">

<script>
	var categoryNo = null; 

	// 1. 상세 페이지
	$(document).on('click', '.notice-link', function() {
		event.preventDefault(); // 기본 동작 중지 : 해시('#')이 추가되지 않고 주소 유지 가능
	    const noticeNo = $(this).data('notice-id');
	    // Ajax 요청을 보냄
	    $.ajax({
	        type: 'GET',
	        url: '/ticket/cs/notice/detail?noticeNo=' + noticeNo, // 공지사항 상세 정보를 가져오는 URL로 변경
	        success: function(data) {
	            $('#view').html(data); // div 내용을 응답 데이터로 업데이트
	        },
	        error: function() {
	            // 오류 발생 시 실행되는 콜백 함수
	            alert('파일을 로드하는 동안 오류가 발생했습니다.');
	        }
	    });
	});

	
	// 2. 각 카테고리 버튼에 대한 클릭 이벤트 리스너 추가
	$(document).on('click', '#notice-category-btn', function(event) {
	    event.preventDefault(); // 기본 동작 중지 : 해시('#')이 추가되지 않고 주소 유지 가능
	    const noticeId = $(this).data('id');
	    categoryNo = noticeUrlMap[noticeId];
	    var totalPages = ${totalPages}; // 총 페이지 수
		var currentPage = ${currentPage}; // 현재 페이지
	    
	    // Ajax 요청을 보냅니다.
	    $.ajax({
	        type: 'GET',
	        url: '/ticket/cs/notice/listNoticesByCategory?categoryNo=' + categoryNo, // 카테고리에 따른 공지사항 목록을 가져오는 URL로 변경
	        success: function(data) {
	    	    var totalPages = ${totalPages}; // 총 페이지 수
	    		var currentPage = ${currentPage}; // 현재 페이지
	            $('#view2').html(data);
	        },
	        error: function() {
	            // 오류 발생 시 실행되는 콜백 함수
	            alert('공지사항 목록을 로드하는 동안 오류가 발생했습니다.');
	        }
	    });
	});
	
</script>
</head>
<body>
	<div id="cs-container">
		<div id="cs-board">
			<div id="cs-board-title">
				<span>공지사항</span>
			</div>
			<div id="cs-board-category">
				<div id="cs-board-category-nav">
					<div class="category-box">
						<button class="category-btn" id="notice-category-btn" data-id="general">일반</button>
					</div>
					<div class="category-box">
						<button class="category-btn" id="notice-category-btn" data-id="system">시스템</button>
					</div>
					<div class="category-box">
					</div>
					<div class="category-box">
					</div>
					<div class="category-box">
					</div>
				</div>
			</div>
			<div id="view2">
			<%@ include file="cs_notice_list.jsp" %>
			</div>
		</div>		
		
	</div>
</body>
</html>