<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/cs/css/admin_cs.css" var="css" />
<c:url value="/resources/admin/js/admin_notice.js" var="admin_notice" />
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>[고객센터] 공지사항</title>
<link rel="stylesheet" href="${css}">

<script src="${admin_notice}"></script>
<script>

	var categoryNo = null; 
	
	// 1. 상세 정보 확인
	$(document).on('click', '.notice-link', function() {
		event.preventDefault(); // 기본 동작 중지 : 해시('#')이 추가되지 않고 주소 유지 가능
		const noticeId = $(this).data('notice-id');
		$.ajax({
		    type: 'GET',
		    url: '/ticket/cs/notice/detail?noticeNo=' + noticeId, // 공지사항 상세 정보를 가져오는 URL로 변경
		    success: function(data) {
		        $('#view').html(data); // div 내용을 응답 데이터로 업데이트
		    },
		    error: function() {
		        // 오류 발생 시 실행되는 콜백 함수
		        //alert('파일을 로드하는 동안 오류가 발생했습니다.');
		    }
		});
	});
	
	// 2-1. 삭제
	$(document).ready(function () {
	    $("#notice-delete-btn").click(function () {
	        var selectedNotices = [];
	        // 체크된 체크박스 값을 배열에 추가
	        $("input[name='selectedNotices']:checked").each(function () {
	            selectedNotices.push($(this).val());
	        });
	        
	        if (selectedNotices.length === 0) {
	            alert("선택된 항목이 없습니다.");
	            return;
	        }
	
	        if (confirm("선택한 공지사항을 삭제하시겠습니까?")) {
	            // 선택한 공지사항을 서버로 보내 삭제 요청
	            $.ajax({
	                type: "POST",
	                url: "/ticket/notice/remove",
	                data: { selectedNotices: selectedNotices },
	                success: function (data) {
	                    //if (data === "success") {  오류 발생 중
	                    	$('#view').html(data);
	                    	alert("삭제가 완료되었습니다.");
	                        //location.reload();
	                    //} //else {	
	                        //alert("삭제 중 오류가 발생했습니다.");
	                    //}
	                },
	                //error: function () {
	                //    alert("서버와 통신 중 오류가 발생했습니다.");
	                //}
	            });
	        }
	    });
	});
	
	// 2-2. 수정
	$("#notice-update-btn").click(function () {
		var selectedNotices = $("input[name='selectedNotices']:checked");
		
		// 선택된 공지사항의 개수 확인
		if (selectedNotices.length !== 1) {
		    alert("수정할 항목을 하나만 선택하세요.");
		    return;
		}
		// 선택된 공지사항의 ID를 가져옴
		var noticeNo = selectedNotices.val();
		// 선택된 공지사항의 ID를 사용하여 공지사항 정보를 가져옴
		$.ajax({
		    type: "GET",
		    url: "/ticket/notice/noticeUpdateForm?noticeNo=" + noticeNo,
		    success: function (data) {
		        // 성공 시 공지사항 정보를 가지고 수정 페이지로 이동
		        $("#view").html(data);
		    },
		    //error: function () {
		        //alert("서버와 통신 중 오류가 발생했습니다.");
		    //}
		});
	});
	
	// 3. 카테고리 필터링
	$('.category-btn').click(function() {
		var url = "";
		var totalPages = ${totalPages}; // 총 페이지 수
		var currentPage = ${currentPage}; // 현재 페이지
		console.log("click");
		
		if ($(this).data('id') == "user") {
			url = "/ticket/admin/member/listUsers";
		} else if ($(this).data('id') === "seller") {
			url = "/ticket/admin/member/listSellers";
		} else {
			url = "errorPage";
		}
		
		$.ajax({
		    type: 'GET',
		    url: url,
		    success: function(data) {
		    	totalPages = ${totalPages}; // 총 페이지 수
		    	currentPage = ${currentPage}; // 현재 페이지
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
				<span>회원관리</span>
				<div>
					<div class="cud-btn-box">
						<button class="cud-btn" id="notice-update-btn">수정</button>
					</div>
				</div>	
			</div>
			<div id="cs-board-category">
				<div id="cs-board-category-nav">
					<div class="category-box">
						<button class="category-btn" id="member-category-btn" data-id="user">구매자 회원</button>
					</div>
					<div class="category-box">
						<button class="category-btn" id="member-category-btn" data-id="seller">판매자 회원</button>
					</div>
					<div class="category-box">
					</div>
					<div class="category-box">
					</div>
					<div class="category-box">
					</div>
	
				</div>
			</div>
		</div>
		<div id="view2">
			<%@ include file="admin_user_list.jsp" %>
		</div>
	</div>	
</body>
</html>