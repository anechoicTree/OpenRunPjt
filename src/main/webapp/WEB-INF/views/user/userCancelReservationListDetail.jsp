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
 <script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<title>취소 내역 조회-공연 상세</title>
</head>
<body>
	
	<c:forEach items="${cancelReservationListDetail}" var="cancelReservationListDetail">
	<div id="detail_container">
		<div id="detail_container_sub">
			<div id="img">
				<img src='${cancelReservationListDetail.p_content}'/>
			</div>
			<div>
				<div class="detail_content_nav" id="detail_content_nav1">
					<div class="content">상품명 :<span>${cancelReservationListDetail.p_name}</span> </div>
					<div class="content">장소 : <span>${cancelReservationListDetail.p_location}</span> </div>
					<div class="content">관람일 : <span>${cancelReservationListDetail.p_perfo_start_date}</span> </div>
					<div class="content">공연시간 : <span>${cancelReservationListDetail.p_viewing_time}</span> </div>
					<div class="content">관람연령 : <span>${cancelReservationListDetail.p_viewing_grade}</span> </div>
					<div class="content">가격 : <span>${cancelReservationListDetail.p_price}</span> </div>
				</div>
				<div class="detail_content_nav" id="detail_content_nav2">	
					<div class="content">예매번호 : <span>${cancelReservationListDetail.pay_no}</span></div>
					<div class="content">갯수 : <span>${cancelReservationListDetail.r_count}</span></div>
					<div class="content">총 결제 가격 : <span>${cancelReservationListDetail.r_amount}</span></div>
					<div class="content">결제일 : <span>${cancelReservationListDetail.r_date}</span></div>
				</div>
				<div class="detail_content_nav" id="detail_content_nav3">
      				<div class="content">이름 : <span> ${userLoginResult.u_name} </span></div>
       				<div class="content">생년월일 : <span> ${userLoginResult.u_birth} </span></div>
       				<div class="content">휴대폰 번호 : <span> ${userLoginResult.u_phone} </span></div>
       				<div class="content">이메일 : <span> ${userLoginResult.u_email}</span></div>
     			</div>
     			<div class="detail_content_nav" id="detail_content_nav4">
     				<div class="content" id="r_cancel_date">취소일 : <span> ${cancelReservationListDetail.r_cancel_date} </span></div>
     			</div>
     		</div>
     	</div>
     </div>
     </c:forEach>
</body>
</html>