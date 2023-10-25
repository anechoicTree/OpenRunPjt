<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/main/css/main.css" var="css" />
<c:url value="/resources/header.css" var="css2" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main</title>
<link rel="stylesheet" href="${css}">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	
	// URL 파라미터에서 카테고리 정보 읽어오기
	function getCategoryFromURL() {
	    var urlParams = new URLSearchParams(window.location.search);
	    return urlParams.get('category');
	}
   
   	$(document).ready(function() {
   		
   		var selectedCategory = getCategoryFromURL(); // URL에서 카테고리 정보 읽어오기
   		
   		<!-- 0. [연동] 헤더 Nav 카테고리 버튼과 필터링 연동 -->
   	    // selectedCategory 값에 따라 다른 카테고리를 필터링
   		if (selectedCategory === 'musical') {
   		    $('#cat1').prop('checked', true);
   		} else if (selectedCategory === 'concert') {
   		    $('#cat2').prop('checked', true);
   		} else if (selectedCategory === 'drama') {
   		    $('#cat3').prop('checked', true);
   		} else if (selectedCategory === 'classic') {
   		    $('#cat4').prop('checked', true);
   		} else if (selectedCategory === 'exhibition') {
   		    $('#cat5').prop('checked', true);
   		} else {
   		    // 다른 값이나 미선택 상태에 대한 처리
   		}

   		// 필터링 함수 호출
   		filterResults();
        
   		<!-- 1. [정렬] 버튼 ON/OFF 애니메이션 -->	
   		// 초기 설정: 모든 .sResult-btn-sorter-sub 요소들을 숨김
        $('.sResult-btn-sorter-sub').hide();
        // .sResult-btn-sorter-sub 요소 클릭 이벤트 핸들러
        $('.sResult-btn').click(function() {
            // 현재 클릭된 .sResult-btn의 바로 다음 .sResult-btn-sorter-sub 요소를 선택하고 토글 효과 적용(수치는 애니메이션 지속시간, ms)
            $(this).next('.sResult-btn-sorter-sub').slideToggle(200);
        });
   	
   		<!-- 2. [필터] 버튼 ON/OFF 애니메이션 -->
   		// 초기 설정: #filterPanel 요소를 숨김
        $('#filterPanel').hide();
   		// #filterButton 요소 클릭 이벤트 핸들러
   		$('#filterButton').click(function() {
   			$(this).next('#filterPanel').slideToggle(200);
   		})
   	    
        <!-- Datepicker 초기화 -->
        var startDate;
        var endDate;
        
        $("#dateRangePicker").datepicker({
            inline: true, // 항상 표시되는 캘린더
            onSelect: function (dateText, inst) {
                if (!startDate) {
                    startDate = new Date(dateText);
                    $("#startDate").val(dateText);
                    endDate = null;
                    $("#endDate").val("");
                } else if (!endDate || startDate > endDate) {
                    endDate = new Date(dateText);
                    $("#endDate").val(dateText);
                    filterResults();
                } else {
                    startDate = new Date(dateText);
                    $("#startDate").val(dateText);
                    endDate = null;
                    $("#endDate").val("");
                }

                // 선택된 날짜 범위 강조 표시 (예: 배경색 변경)
                var allDates = $("#dateRangePicker").find("td");
                allDates.removeClass("highlighted-date");
                if (startDate && endDate) {
                    allDates.each(function () {
                        var current = $(this).find('a').text();
                        var currentMonth = inst.selectedMonth + 1;
                        var currentDate = new Date(inst.selectedYear, currentMonth - 1, current);
                        if (currentDate >= startDate && currentDate <= endDate) {
                            $(this).addClass("highlighted-date");
                        }
                    });
                }
            }
        });

    	<!-- 3. [필터] 속성 체크시 필터링 ON/OFF 동작 -->
        // 체크박스 상태가 변경될 때 필터링 함수 호출
        $('input[type="checkbox"]').change(filterResults);

        function filterResults() {
            // 선택된 카테고리와 지역 값을 가져옴
            var selectedCategories = $('input[type="checkbox"][id^="cat"][value]:checked').map(function() {
                return $(this).val();
            }).get();
            var selectedLocations = $('input[type="checkbox"][id^="loc"][value]:checked').map(function() {
                return $(this).val();
            }).get();

            // 선택된 시작일과 종료일을 가져옴
            var startDate = new Date($('#startDate').val());
            var endDate = new Date($('#endDate').val());
            
            // 모든 결과 항목을 숨김
            $('.sResult-item').hide();
            // 선택된 카테고리 및 지역에 해당하는 결과 항목만 표시
            var filterResultsList = $('.sResult-item').filter(function() {
                var isCategoryMatched = selectedCategories.length === 0 || selectedCategories.includes($(this).attr('data-category'));
                var isLocationMatched = selectedLocations.length === 0 || selectedLocations.includes($(this).attr('data-location'));
                var itemDate = new Date($(this).find('.item-date').text()); // 항목의 날짜 값을 가져옴
	            var isDateMatched = !isNaN(startDate) && !isNaN(endDate) ? (itemDate >= startDate && itemDate <= endDate) : true;
	
	            return isCategoryMatched && isLocationMatched && isDateMatched;
            }).show();
            
       		// 필터링 결과가 없을 경우 "해당 결과가 없습니다" 문구 표시
            if (filterResultsList.length === 0) {
                $('#noResultsMessage').show();
            } else {
                $('#noResultsMessage').hide();
            }
        }
    });
   	
   	<!-- 4. [정렬] 속성 선택시 정렬 ON/OFF 동작 -->
   	$(document).ready(function() {
   	    // 조회순 버튼 클릭 이벤트
   	    $('button:contains("조회순")').on('click', function() {
   	        // .sResult-item 요소를 배열로 가져옵니다.
   	        var items = $('.sResult-item').toArray();

   	        // 조회순으로 오름차순 정렬
   	        items.sort(function(a, b) {
   	            var viewsA = parseInt($(a).data('views'));
   	            var viewsB = parseInt($(b).data('views'));

   	            return viewsB - viewsA; // 오름차순 정렬
   	        });

   	        // 정렬된 .sResult-item 요소를 다시 .sResult-items에 추가합니다.
   	        $('.sResult-items').empty().append(items);
   	    });
   	});
</script>
</head>
<body>
	<%@ include file="./common/header.jsp" %>
    <div class="view">
    	<div class="sResult-container">
			<div class="sResult-board">
				<div class="sResult-board-title">
					통합검색
				</div>
				<div class="sResult-sorter">
					<button class="sResult-btn">정렬 ▼</button>
						<div class="sResult-btn-sorter-sub">
							<button>판매순</button>
							<button>조회순</button>
							<button>추천순</button>
						</div>
				</div>
				<div class="sResult-filter">
					<button class="sResult-btn" id="filterButton">필터 ▼</button>
						<div id="filterPanel">
							<div class="filterPanel-sub">
								<div class="filterPanel-title">카테고리</div>
								<div class="filterPanel-sub-option">
									<input type="checkbox" id="cat1" value="뮤지컬"><label for="cat1">뮤지컬</label>
									<input type="checkbox" id="cat2" value="콘서트"><label for="cat2">콘서트</label>
									<input type="checkbox" id="cat3" value="연극"><label for="cat3">연극</label>
									<input type="checkbox" id="cat4" value="클래식"><label for="cat4">클래식</label>
									<input type="checkbox" id="cat5" value="전시"><label for="cat5">전시</label>
								</div>
							</div>
							<div class="filterPanel-sub">
							    <div class="filterPanel-title">지역</div>
							    <div class="filterPanel-sub-option">
									<input type="checkbox" id="loc1" value="서울"><label for="loc1">서울</label>
									<input type="checkbox" id="loc2" value="경기"><label for="loc2">경기</label>
									<input type="checkbox" id="loc3" value="인천"><label for="loc3">인천</label>
									<input type="checkbox" id="loc4" value="강원"><label for="loc4">강원</label>
									<input type="checkbox" id="loc5" value="부산"><label for="loc5">부산</label>
									<input type="checkbox" id="loc6" value="대구"><label for="loc6">대구</label>
									<input type="checkbox" id="loc7" value="대전"><label for="loc7">대전</label>
									<input type="checkbox" id="loc8" value="울산"><label for="loc8">울산</label>
									<input type="checkbox" id="loc9" value="경북"><label for="loc9">경북</label>
									<input type="checkbox" id="loc10" value="경남"><label for="loc10">경남</label>
									<input type="checkbox" id="loc11" value="광주"><label for="loc11">광주</label>
									<input type="checkbox" id="loc12" value="충북"><label for="loc12">충북</label>
									<input type="checkbox" id="loc13" value="충남"><label for="loc13">충남</label>
									<input type="checkbox" id="loc14" value="전북"><label for="loc14">전북</label>
									<input type="checkbox" id="loc15" value="전남"><label for="loc15">전남</label>
									<input type="checkbox" id="loc16" value="제주"><label for="loc16">제주</label>
							    </div>
							</div>
							<div class="filterPanel-sub">
							    <div class="filterPanel-title">일자</div>
							    <div class="filter-date-input-container">
							        <div class="filter-date-input">
							        	<span>시작일</span><input class="filter-date" type="text" id="startDate" readonly>
						        	</div>
							        <div class="filter-date-input">
							        	<span>종료일</span><input class="filter-date" type="text" id="endDate" readonly>
						        	</div>
							    </div>
							    <div id="dateRangePicker"></div>
							</div>
						</div>
				</div>
			</div>
			<div class="sResult-content">
				<!-- 검색된 결과가 없을 경우의 메시지 -->
				<c:if test="${empty searchResults}">
				    <div class="sResult-txt">"${searchKeyword}"에 대한 검색결과가 존재하지 않습니다.</div>
				</c:if>
				<!-- 검색된 결과를 나열합니다 -->
				<c:if test="${!empty searchResults}">
			        <div class="sResult-items">
			            <c:forEach items="${searchResults}" var="search">
                            <div class="sResult-item" data-category="${search.category}" data-location="${search.location}" data-views="${search.views}">
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
   				<!-- 검색된 결과 필터링의 결과가 존재하지 않을 때 -->
				<div class="sResult-txt" id="noResultsMessage" style="display: none;">해당 필터의 결과가 없습니다</div>
			</div>
		</div>		
		
	</div>
	<%@ include file="./common/footer.jsp" %>
</body>
