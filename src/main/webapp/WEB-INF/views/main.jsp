<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/main/css/main.css" var="css" />
<c:url value="/resources/header.css" var="css2" />
<!-- 더미 이미지 -->
<c:url value="/resources/common/image/img1.png" var="img1" />
<c:url value="/resources/common/image/img2.png" var="img2" />
<c:url value="/resources/common/image/img3.png" var="img3" />

<!-- <c:url value="/resources/main/js/main.js" var="js" /> -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main</title>
<link rel="stylesheet" href="${css}">


<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>

	/* 1. [배너] 아이템 목록 처리 */
	$(document).ready(function() {
	    var bannerIndex = 0;
	    var totalItems = $(".main-banner-item").length; // 전체 아이템 수
	    var visibleItems = 3; // 한 번에 보여질 아이템 수
	    var maxIndex = totalItems - visibleItems; // 최대 인덱스
	    
	    // 처음 로드 시 아이템 숨김 처리
	    $('.main-banner-item').each(function(index) {
	        if(index >= visibleItems) {
	            $(this).hide();
	        }
	    });
	    
	    // 필터링된 결과를 저장할 배열
	    var filteredItems = [];
	    
	 	// 화살표의 활성화/비활성화 상태를 설정하는 함수
	    function updateArrowStatus() {
	        if (bannerIndex === 0 && bannerIndex === maxIndex) {
	            $("#prev-btn").prop('disabled', true);
	            $("#next-btn").prop('disabled', true);
	        } 
	        if (bannerIndex === 0 && bannerIndex < maxIndex) {
	            $("#prev-btn").prop('disabled', true);
	            $("#next-btn").prop('disabled', false);
	        } 
	        if (bannerIndex !== 0 && bannerIndex < maxIndex) {
	            $("#prev-btn").prop('disabled', false);
	            $("#next-btn").prop('disabled', false);
	        } 
	        if (bannerIndex !== 0 && bannerIndex === maxIndex) {
	            $("#prev-btn").prop('disabled', false);
	            $("#next-btn").prop('disabled', true);
	        }
	    }
	    
	    /* 2. [필터] 카테고리 클릭시 필터링 동작 */
	    // 카테고리 버튼 클릭 시 필터링 함수 호출
	    $('.filter-btn').click(filterResults);

	    function filterResults() {
	    	// 클릭된 버튼의 value 값을 가져옴
	        var selectedCategory = $(this).val();
	        // 모든 결과 항목을 숨김
	        $('.main-banner-item').hide();
	        // 선택된 카테고리에 해당하는 결과 항목만 표시
	        filteredItems = $('.main-banner-item[data-category="' + selectedCategory + '"]').toArray();
	        // 배너 인덱스 초기화
	        bannerIndex = 0;
		    totalItems = $(filteredItems).length; // 필터링된 아이템 수
		    maxIndex = totalItems - visibleItems; // 최대 인덱스
		 	// 화살표 비활성화 처리 설정
		 	updateArrowStatus();
	        slideItems();
	    };
	    
	    /* 3. [배너] 화살표 버튼 클릭시 슬라이딩 동작 */
	    // 아이템 슬라이딩 함수
	    function slideItems() {
	        $('.main-banner-item').hide();
	        var itemsToShow = filteredItems.slice(bannerIndex, bannerIndex + visibleItems);
	        $(itemsToShow).show();
	     	// 슬라이드 후에 화살표 상태 업데이트
	        updateArrowStatus();
	    }
	    
		// 화살표 버튼 클릭 이벤트	
	    $('#next-btn').click(function() {
	        if(bannerIndex < maxIndex) {
	            bannerIndex++;
	            slideItems();
	        } 
	        // 화살표 비활성화 처리
	        if (bannerIndex === maxIndex) {
	            $(this).prop('disabled', true);
	        } else {
	            $('#prev-btn').prop('disabled', false); // 이전 화살표는 활성화
	        }
	    });
	
	    $('#prev-btn').click(function() {
	        if(bannerIndex > 0) {
	            bannerIndex--;
	            slideItems();
	        }
	        // 화살표 비활성화 처리
	        if (bannerIndex === 0) {
	            $(this).prop('disabled', true);
	        } else {
	            $('#next-btn').prop('disabled', false); // 다음 화살표는 활성화
	        }
	    });
	    
	    /* 4. [배너] 페이지 로드시 초기값 설정 */
	    // 페이지 로드시 필터링 초기값 뮤지컬로 설정, 2번 함수 이후에 위치 시켜줘야 제대로 동작
	    $('#cat1').click();
	    $('#cat1').addClass('active')

		// 페이지 로드시 화살표 초기상태 설정        
	 	if (bannerIndex === 0) {
	 		$("#prev-btn").prop('disabled', true);
	 	} 
		if (bannerIndex === maxIndex) {
	 		$("#next-btn").prop('disabled', true);
		}
		
	    /* 5. [버튼] 클릭 이벤트 처리 - 색상 변경 */
	    $('.filter-btn').click(function() {
	        // 모든 필터 버튼의 클래스 초기화 (글자색을 검정색으로 변경)
	        $('.filter-btn').removeClass('active');
	        
	        // 클릭된 버튼에 클래스 추가 (글자색을 보라색으로 변경)
	        $(this).addClass('active');
	    });
	});


</script>
</head>
<body>
	<%@ include file="./common/header.jsp" %>
    <div class="view">
    	<div class="main-banner-container">
			<div class="main-banner-container-sub">
				<span id="main-banner-title">티켓 랭킹</span>
				<div class="filter">
					<ul id="filter-list">
						<li class="filter-item">
							<button class="filter-btn" id="cat1" value="뮤지컬">뮤지컬</button>
						</li>
						<li class="filter-item">
							<button class="filter-btn" id="cat2" value="콘서트">콘서트</button>
						</li>
						<li class="filter-item">
							<button class="filter-btn" id="cat3" value="연극">연극</button>
						</li>
						<li class="filter-item">
							<button class="filter-btn" id="cat4" value="클래식">클래식/무용</button>
						</li>
						<li class="filter-item">
							<button class="filter-btn" id="cat5" value="전시">전시/행사</button>
						</li>
					</ul>
				</div>
				<div class="main-banner-container-sub-sub">
					<button id="prev-btn" class="slider-arrow">&lt;</button> <!-- 왼쪽 화살표 추가 -->
					<div class="main-banner-body">
						<!-- 검색된 결과를 나열합니다 -->
						<c:if test="${!empty searchResults}">
					        <div class="main-banner-items">
					            <c:forEach items="${searchResults}" var="search">
		                            <div class="main-banner-item" data-category="${search.category}" data-location="${search.location}" data-views="${search.views}">
					                	<div class="item-img">
		                	           		<!-- DB에서 가져온 이미지 주소를 사용하여 이미지 표시 -->
		       							    <img src="${pageContext.request.contextPath}${search.img}" alt="${search.title}">
					                	</div>
					                    <div class="item-number">${search.cno}</div>
					                    <div class="item-category">${search.title}</div>
					                    <div class="item-title">${search.rsvStart}</div>
					                    <div class="item-body">${search.rsvEnd}</div>
					                    <div class="item-date">${search.pfmDate}</div>
					                    <div class="item-views">${search.views}</div>
					                    <div class="item-location">${search.location}</div>
					                    <div class="item-category">${search.category}</div>
					                </div>
					            </c:forEach>
					        </div>
					    </c:if>
				    </div>
				    <button id="next-btn" class="slider-arrow">&gt;</button> <!-- 오른쪽 화살표 추가 -->
			    </div>
			</div>
		</div>	
	</div>
	<%@ include file="./common/footer.jsp" %>
</body>
