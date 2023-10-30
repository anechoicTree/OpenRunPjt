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
<title>예매 내역 조회-공연 상세</title>
<script>

$(document).on("click", ".next_button", function() {

 	 var merchant_uid = $(this).data("pay-no");
    console.log(merchant_uid);

    $.ajax({
        type: "POST",
        url: "/ticket/product/admin/cancelPayment/" + merchant_uid,
        dataType: "text",
    }).done(function (result) {
        console.log(result);
        if (parseInt(result) === 1) {
            alert("결제가 취소 되었습니다");
            window.location.href = "/ticket";
        } else {
            alert("결제 취소 실패");
        }
    });
  });
</script>
</head>
<body>
	
	<c:forEach items="${reservationListDetail}" var="reservationListDetail">
	<div id="detail_container">
		<div id="detail_container_sub">
			<div id="img">
				<img src='${reservationListDetail.p_content}'/>
			</div>
			<div>
				<div class="detail_content_nav" id="detail_content_nav1">
					<div class="content">상품명 :<span>${reservationListDetail.p_name}</span> </div>
					<div class="content">장소 : <span>${reservationListDetail.p_location}</span> </div>
					<div class="content">관람일 : <span>${reservationListDetail.p_perfo_start_date}</span> </div>
					<div class="content">공연시간 : <span>${reservationListDetail.p_viewing_time}</span> </div>
					<div class="content">관람연령 : <span>${reservationListDetail.p_viewing_grade}</span> </div>
					<div class="content">가격 : <span>${reservationListDetail.p_price}</span> </div>
				</div>
				<div class="detail_content_nav" id="detail_content_nav2">	
					<div class="content">예매번호 : <span>${reservationListDetail.pay_no}</span></div>
					<div class="content">갯수 : <span>${reservationListDetail.r_count}</span></div>
					<div class="content">총 결제 가격 : <span>${reservationListDetail.r_amount}</span></div>
					<div class="content">결제일 : <span>${reservationListDetail.r_date}</span></div>
				</div>
				<div class="detail_content_nav" id="detail_content_nav3">
      				<div class="content">이름 : <span> ${userLoginResult.u_name} </span></div>
       				<div class="content">생년월일 : <span> ${userLoginResult.u_birth} </span></div>
       				<div class="content">휴대폰 번호 : <span> ${userLoginResult.u_phone} </span></div>
       				<div class="content">이메일 : <span> ${userLoginResult.u_email}</span></div>
     			</div>
     		</div>
     	</div>
     	<div id="buttom_container">
     			<button class="next_button" id="button" data-pay-no="${reservationListDetail.pay_no}"> 취소하기 </button>
     		</div>
     </div>
     </c:forEach>
</body>
</html>