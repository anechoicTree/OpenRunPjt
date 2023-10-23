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
$(document).ready(function(){
    var bannerIndex = 0;

    $('#next-btn').click(function(){
        bannerIndex++;
        if(bannerIndex > 2) { // 3개의 배너만 있다고 가정했을 때, 인덱스 2를 넘으면 0으로 리셋
            bannerIndex = 0;
        }
        moveBanner();
    });

    $('#prev-btn').click(function(){
        bannerIndex--;
        if(bannerIndex < 0) {
            bannerIndex = 2;
        }
        moveBanner();
    });

    function moveBanner() {
        var moveAmount = -bannerIndex * 100; // 각 배너가 100%의 너비를 가진다고 가정
        $('.main-banner-body').css('transform', 'translateX(' + moveAmount + '%)');
    }
});
</script>
</head>
<body>
	<%@ include file="./common/header.jsp" %>
    <div class="view">
    	<div class="main-banner-container">
			<div class="main-banner-container-sub">
				<div id="main-banner-title">티켓 랭킹</div>
					<div class="filter">
						<ul id="filter-list">
							<li class="filter-item">
								<button class="filter-btn" id="">뮤지컬</button>
							</li>
							<li class="filter-item">
								<button class="filter-btn" id="">콘서트</button>
							</li>
							<li class="filter-item">
								<button class="filter-btn" id="">연극</button>
							</li>
							<li class="filter-item">
								<button class="filter-btn" id="">클래식/무용</button>
							</li>
							<li class="filter-item">
								<button class="filter-btn" id="">전시/행사</button>
							</li>
						</ul>
					</div>
					<div class="main-banner-body">
						<div class="ticket-info">
			           		<!-- 더미 이미지 삽입 -->
							<img src="${img1}">
						</div>
						<div class="ticket-info">
							<!-- 더미 이미지 삽입 -->
							<img src="${img2}">
						</div>
						<div class="ticket-info">
							<!-- 더미 이미지 삽입 -->
							<img src="${img3}">
						</div>
					</div><br>
					
					<div class="main-banner-body">
		                <c:forEach items="${selectList}" var="ticket">
		                	<div class="banner-list">
					            <div class="ticket-info">
									<strong>티켓 번호:</strong> ${ticket.ticketNo}
								</div>
								<div class="ticket-info">
								    <strong>카테고리 번호:</strong> ${ticket.categoryNo}
								</div>
								<div class="ticket-info">
								    <strong>티켓 이름:</strong> ${ticket.ticketName}
								</div>
				            </div>
		                </c:forEach>
					</div>
				</div>
			</div>	
		</div>
	</div>
	<%@ include file="./common/footer.jsp" %>
	<%@ include file="./common/commonJs.jsp" %>
</body>
