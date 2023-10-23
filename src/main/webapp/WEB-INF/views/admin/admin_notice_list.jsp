<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/resources/cs/css/admin_cs.css" var="css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[고객센터] 공지사항</title>
<link rel="stylesheet" href="${css}">

<script>
	var totalPages = ${totalPages}; // 총 페이지 수
	var currentPage = ${currentPage}; // 현재 페이지

	// 1. 페이지 이동 버튼
	$(document).ready(function() { // 페이지 로드 시 초기 버튼 상태 업데이트
	    updatePageButtons(currentPage);
	});
	
	function changePage(page) {
		var url;
		if (categoryNo) {
			url = "/ticket/admin/notice/listNoticesByCategory?categoryNo=" + categoryNo + "&page=" + page;
		} else {
			url = "/ticket/admin/notice/listNotices?page=" + page;
		}
	    $.ajax({
	        type: 'GET',
	        url: url,
	        success: function(data) {
	            $('#view2').html(data);
	            //updatePageButtons(currentPage); 테스트중
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
	    $('.page-buttons').each(function() {
	        var pageNum = parseInt($(this).val());
	        if (pageNum == currentPage) {
	            $(this).addClass('active'); // 현재 페이지를 강조 표시
	        } else {
	            $(this).removeClass('active');
	        }
	    });
	}
</script>
</head>
<body>
	<div id="cs-board-list">
		<div id="cs-board-list-head">
			<div class="cs-board-list-head-box"></div>
			<div class="cs-board-list-head-box">카테고리</div>
			<div class="cs-board-list-head-box">제목</div>
			<div class="cs-board-list-head-box">등록일</div>
		</div>
		 
		<c:forEach var="notice" items="${noticesList}">     
			<div id="cs-board-list-row">
                <div class="cs-board-list-row-box">
                    <input type="checkbox" name="selectedNotices" value="${notice.noticeNo}">
                </div>
				<div class="cs-board-list-row-box">
					${notice.category}
				</div>
				<div class="cs-board-list-row-box">
            		<a href="#" class="notice-link" data-notice-id="${notice.noticeNo}">${notice.title}</a>
        		</div>
				<div class="cs-board-list-row-box">
					${notice.regDate}
				</div>
			</div>
		</c:forEach>
	</div>
	<div id="cs-board-page">
		<!-- 이전 페이지로 이동하는 버튼 -->
		<button id="notice-prev-btn" class="move-buttons" onclick="changePage(${currentPage - 1})">&lt;</button>
		
		<!-- 페이지 번호 버튼들 -->
		<c:forEach var="pageNum" begin="1" end="${totalPages}">
		    <button id="notice-page-buttons" class="page-buttons" onclick="changePage(${pageNum})" value="${pageNum}">${pageNum}</button>
		</c:forEach>
		
		<!-- 다음 페이지로 이동하는 버튼 -->
		<button id="notice-next-btn" class="move-buttons" onclick="changePage(${currentPage + 1})">&gt;</button>
	</div>
</body>
</html>
