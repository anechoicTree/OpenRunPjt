<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/seller/sellerWithdrawal.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<title>판매자 회원탈퇴</title>
</head>
<body>
<jsp:include page="../header.jsp" />
	<div id="main_nav">
		<div id="main_nav_container">
			<jsp:include page="../seller/seller_nav_side.jsp" />
		<div id="main_nav_sub">
			<div id="main_title">회원 탈퇴</div>	
			<div id="main_content_sub">
				<div id="withdrawal_nav">
				<div id="withdrawal_content">	
					<div class="content">아이디 : <span> ${sellerLoginResult.s_id} </span></div>
          	 		<div class="content">사업자명 : <span> ${sellerLoginResult.s_business_name} </span></div>
          	  		<div class="content">사업자등록번호 : <span> ${sellerLoginResult.s_business_reg_no} </span></div>
            		<div class="content">휴대폰 번호 : <span> ${sellerLoginResult.s_phone}</span></div>
           			<div class="content">이메일 : <span> ${sellerLoginResult.s_email}</span></div>
					<div id="button_nav">
						<div id="button_sub">
							<button class="next_button" id="sellerWithdrawalButton"  onclick="location.href='sellerWithdrawalOk'">탈퇴하기</button>
						</div>
						</div>
						<div id="sub_content">탈퇴하려는 회원정보가 맞다면 탈퇴하기 버튼을 눌러주세요</div>
			
				</div>
				</div>
			</div>
		</div>
		
		</div>	
	</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>