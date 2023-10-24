<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/user/userWithdrawalOk.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>구매자 회원탈퇴 비밀번호 확인</title>
</head>
<body>
<script>
$(document).ready(function() {
    $(document).on("click", "#userWithdrawalButton", function(e) {
        e.preventDefault();
        
        var u_id = $("#u_id").val();
        var u_pw = $("#u_pw").val();
        
        if (u_pw === '') {
            alert('비밀번호를 입력해주세요.');
            return;
        }
        
        var dataToSend = {
                u_pw: u_pw,
                u_id: u_id
            };
        $.ajax({
        	url: "withdrawalOkUser",
        	type: "POST",
        	data: dataToSend,
        	cache: false,
        	dataType: "text",
        	success: function(result) {
        		if (result === '1') {
					alert('회원 탈퇴 성공');
					console.log('회원 탈퇴 성공');
                 	window.location.href = "/ticket"
                } else {
                    alert('회원 탈퇴 실패');
                    console.log('회원 탈퇴 실패');
                 }
              }
        });
    });
});

</script>
<jsp:include page="../header.jsp" />
	<div id="main_nav">
	<div id="main_nav_container">
		<jsp:include page="side/side.jsp" />
		<div id="main_nav_sub">
			<div id="main_title">회원 탈퇴 비밀번호 확인</div>
			<div id="main_content_sub">
			<form id="userWithdrawal" name="userWithdrawal" action="<c:url value='/product/admin/withdrawalOkUser' />" method="POST" >
				<div id="withdrawal_nav">
					<div id="withdrawal_content">
					<input class="input_text" type="hidden" id="u_id" name="u_id" value="${userLoginResult.u_id}">
						<div id="withdrawal_content1">비밀번호
							<input class="input_text" type="password" id="u_pw" name="u_pw" placeholder="8~12자 영문, 숫자, 특수문자"><br>
						</div>
					</div>
					<button class="next_button" id="userWithdrawalButton" type="submit">확인</button>
				</div>
			</form>
			</div>
		</div>
	</div>
	</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>