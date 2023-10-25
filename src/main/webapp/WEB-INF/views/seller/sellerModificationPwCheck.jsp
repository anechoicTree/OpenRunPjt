<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/seller/modificationPwCheck.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>회원 정보 수정 비밀번호 인증</title>
</head>
<body>
<script>
$(document).ready(function() {
    $(document).on("click", "#sellerModificationPwCheckButton", function(e) {
        e.preventDefault();
        
        var s_id = $("#s_id").val();
        var s_pw = $("#s_pw").val();
        
        if (s_pw === '') {
            alert('비밀번호를 입력해주세요.');
            return;
        }
		var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$/;
		
		if (!passwordRegex.test(s_pw)) {
	        alert('비밀번호는 8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다');
	        return;
		}
        var dataToSend = {
        		s_pw: s_pw,
                s_id: s_id
            };
        $.ajax({
        	url: "modificationPwCheckSeller",
        	type: "POST",
        	data: dataToSend,
        	cache: false,
        	dataType: "text",
        	success: function(result) {
        		if (result === '1') {
					alert('회원 정보수정 비밀번호 인증 성공');
					console.log('회원 정보수정 비밀번호 인증 성공');
                 	window.location.href = "sellerModification";
                } else {
                    alert('회원 정보수정 비밀번호 인증 실패');
                    console.log('회원 정보수정 비밀번호 인증 실패');
                 }
              }
        });
    });
});
</script>
<jsp:include page="../common/header.jsp" />
	<div id="main_nav">
	<div id="main_nav_container">
		<jsp:include page="../seller/seller_nav_side.jsp" />
		<div id="main_nav_sub">	
			<div id="main_title">회원 정보 수정 비밀번호 인증</div>
			<div id="main_content_sub">
				<div id="content_nav">
				<form id="sellerModificationPwCheck" name="sellerModificationPwCheck" action="<c:url value='/product/admin/modificationPwCheck' />" method="POST" >
					<input class="input_text" type="hidden" id="s_id" name="s_id" value="${sellerLoginResult.s_id}">
					<div id="modification_content">비밀번호
						<input class="input_text" type="password" id="s_pw" name="s_pw" placeholder="8~12자 영문, 숫자, 특수문자">
					</div>
					<button class="next_button" id="sellerModificationPwCheckButton" type="submit">확인</button>
				</form>
				</div>
			</div>	
		</div>
	</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>