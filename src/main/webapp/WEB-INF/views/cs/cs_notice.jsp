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
var totalPages = ${totalPages}; // 총 페이지 수
var currentPage = ${currentPage}; // 현재 페이지
</script>

<script>
	$(document).on('click', '.notice-link', function() {
		event.preventDefault(); // 기본 동작 중지 : 해시('#')이 추가되지 않고 주소 유지 가능
	    const noticeNo = $(this).data('notice-id');
	    
	    // Ajax 요청을 보냅니다.
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
	
	function changePage(page) {
	    $.ajax({
	        type: 'GET',
	        url: "/ticket/cs/notice/listNotices?page=" + page, // 페이지 변경을 위한 URL
	        success: function(data) {
	            //$('#cs-board-list').html(data); // 게시물 목록을 응답 데이터로 업데이트
	            $('#view').html(data);
	        },
	        error: function() {
	            // 오류 발생 시 실행되는 콜백 함수
	            alert('페이지를 로드하는 동안 오류가 발생했습니다.');
	        }
	    });
	}
	
	function updatePageButtons(currentPage) {

	    // 이전 페이지로 이동하는 버튼 활성화 여부 결정
	    if (currentPage <= 1) {
	        $('#notice-prev-btn').prop('disabled', true);
	    } else {
	        $('#notice-prev-btn').prop('disabled', false);
	    }

	    // 다음 페이지로 이동하는 버튼 활성화 여부 결정
	    if (currentPage >= totalPages) {
	        $('#notice-next-btn').prop('disabled', true);
	    } else {
	        $('#notice-next-btn').prop('disabled', false);
	    }

	    // 페이지 번호 버튼들 업데이트
	    $('.notice-page-buttons').each(function() {
	        var pageNum = parseInt($(this).val());
	        if (pageNum === currentPage) {
	            $(this).addClass('active'); // 현재 페이지를 강조 표시
	        } else {
	            $(this).removeClass('active');
	        }
	    });
	}

	// 페이지 로드 시 초기 버튼 상태 업데이트
	$(document).ready(function() {
	    updatePageButtons(currentPage);
	});
	
	
	
	// 각 카테고리 버튼에 대한 클릭 이벤트 리스너 추가
	$(document).on('click', '#notice-category-btn', function(event) {
	    event.preventDefault(); // 기본 동작 중지 : 해시('#')이 추가되지 않고 주소 유지 가능
	    const noticeId = $(this).data('id');
	    const categoryNo = noticeUrlMap[noticeId];
	    
	    // Ajax 요청을 보냅니다.
	    $.ajax({
	        type: 'GET',
	        url: '/ticket/cs/notice/listNoticesByCategory?categoryNo=' + categoryNo, // 카테고리에 따른 공지사항 목록을 가져오는 URL로 변경
	        success: function(data) {
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
						<button class="" data-id=""></button>
					</div>
					<div class="category-box">
						<button class="" data-id=""></button>
					</div>
					<div class="category-box">
						<button class="" data-id=""></button>
					</div>
				</div>
			</div>
			<div id="view2">
			<%@ include file="cs_notice_list.jsp" %>
			</div>
		</div>		
		<div id="cs-board-page">
		<!-- 이전 페이지로 이동하는 버튼 -->
			<button id="notice-prev-btn" class="move-buttons" onclick="changePage(${currentPage - 1})">&lt;</button>
			
			<!-- 페이지 번호 버튼들 -->
			<c:forEach var="pageNum" begin="1" end="${totalPages}">
			    <button class="notice-page-buttons page-buttons" onclick="changePage(${pageNum})" value="${pageNum}">${pageNum}</button>
			</c:forEach>
			
			<!-- 다음 페이지로 이동하는 버튼 -->
			<button id="notice-next-btn" class="move-buttons" onclick="changePage(${currentPage + 1})">&gt;</button>
		</div>
	</div>
</body>
</html>