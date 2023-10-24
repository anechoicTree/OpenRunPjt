<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/user/userWithdrawal.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<title>구매자 회원탈퇴</title>
</head>
<body>
<jsp:include page="../header.jsp" />
	<div id="main_nav">
		<div id="main_nav_container">
			<jsp:include page="side/side.jsp" />
		<div id="main_nav_sub">
			<div id="main_title">회원 탈퇴</div>	
			<div id="main_content_sub">
				<div id="withdrawal_nav">
				<div id="withdrawal_content">	
					<div class="content">아이디 : <span> ${userLoginResult.u_id} </span></div>
          	 		<div class="content">이름 : <span> ${userLoginResult.u_name} </span></div>
          	  		<div class="content">생년월일 : <span> ${userLoginResult.u_birth} </span></div>
            		<div class="content">휴대폰 번호 : <span> ${userLoginResult.u_phone}</span></div>
           			<div class="content">이메일 : <span> ${userLoginResult.u_email}</span></div>
					<div id="button_nav">
						<div id="button_sub">
							<button class="next_button" id="userWithdrawalButton"  onclick="location.href='userWithdrawalOk'">탈퇴하기</button>
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