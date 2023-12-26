<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/resources/cs/css/admin_cs.css" var="css" />
<c:url value="/resources/admin/js/admin_guide.js" var="admin_guide" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>[고객센터] 이용 가이드</title>
<link rel="stylesheet" href="${css}">

<script src="${admin_guide}"></script>
<script>

	var categoryNo = null; 
	
	// 1-1. 삭제
	$(document).ready(function () {
	       // "삭제" 버튼을 클릭했을 때
	       $("#guide-delete-btn").click(function () {
	           var selectedGuides = [];
	           // 체크된 체크박스 값을 배열에 추가
	           $("input[name='selectedGuides']:checked").each(function () {
	               selectedGuides.push($(this).val());
	           });
	           
	           if (selectedGuides.length === 0) {
	               alert("선택된 항목이 없습니다.");
	               return;
	           }
	
	           if (confirm("선택한 공지사항을 삭제하시겠습니까?")) {
	               // 선택한 공지사항을 서버로 보내 삭제 요청
	               $.ajax({
	                   type: "POST",
	                   url: "/ticket/guide/remove",
	                   data: { selectedGuides: selectedGuides },
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
	
	// 1-2. 수정
	$("#guide-update-btn").click(function () {
	    var selectedGuides = $("input[name='selectedGuides']:checked");
	
	    // 선택된 공지사항의 개수 확인
	    if (selectedGuides.length !== 1) {
	        alert("수정할 항목을 하나만 선택하세요.");
	        return;
	    }
	
	    // 선택된 공지사항의 ID를 가져옴
	    var guideNo = selectedGuides.val();
	
	    // 선택된 공지사항의 ID를 사용하여 공지사항 정보를 가져옴
	    $.ajax({
	        type: "GET",
	        url: "/ticket/guide/guideUpdateForm?guideNo=" + guideNo,
	        success: function (data) {
	            // 성공 시 공지사항 정보를 가지고 수정 페이지로 이동
	            $("#view").html(data);
	        },
	        //error: function () {
	            //alert("서버와 통신 중 오류가 발생했습니다.");
	        //}
	    });
	});
	
	// 2. 카테고리 필터링
	$(document).on('click', '#guide-category-btn', function(event) {
		event.preventDefault(); // 기본 동작 중지 : 해시('#')이 추가되지 않고 주소 유지 가능
		const guideId = $(this).data('id');
		categoryNo = guideUrlMap[guideId];
		var totalPages = ${totalPages}; // 총 페이지 수
		var currentPage = ${currentPage}; // 현재 페이지
		
		$.ajax({
		    type: 'GET',
		    url: '/ticket/admin/guide/listGuidesByCategory?categoryNo=' + categoryNo, // 카테고리에 따른 FAQ 목록을 가져오는 URL로 변경
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
				<span>이용 가이드</span>
				<div>
					<div class="cud-btn-box">
						<button class="cud-btn" id="guide-create-btn">작성</button><button class="cud-btn" id="guide-update-btn">수정</button><button class="cud-btn" id="guide-delete-btn">삭제</button>
					</div>
				</div>
			</div>
			<div id="cs-board-category">
				<div id="cs-board-category-nav">
					<div class="category-box">
						<button class="category-btn" id="guide-category-btn" data-id="book">예매 방법</button>
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
					</div>		
				</div>
			</div>
		</div>
		<div id="view2">
			<%@ include file="admin_guide_list.jsp" %>
		</div>
	</div>
</body>
</html>