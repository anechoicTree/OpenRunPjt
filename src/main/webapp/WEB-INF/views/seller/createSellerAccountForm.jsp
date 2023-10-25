<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/seller/createSellerAccountForm.css'  var="css"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>판매자 회원가입 forme</title>
</head>
<body>
<script>
function sellerCheck() {
	
	let form = document.insertSeller;
	
     if (form.s_id.value === '') {
        alert('아이디를 입력해주세요');
        form.s_id.focus();
        return false;
    }
    if (form.s_pw.value === '') {
        alert('비밀번호를 입력해주세요');
        form.s_pw.focus();
        return false;
    }
    if (form.s_pw_again.value === '') {
        alert('비밀번호 확인을 입력해주세요');
        form.s_pw_again.focus();
        return false;
    }
    if (form.s_pw.value !== form.s_pw_again.value) {
        alert('비밀번호와 비밀번호 확인의 입력값이 다릅니다');
        form.s_pw.focus();
        form.s_pw.value = "";
        form.s_pw_again.value = "";
        return false;
    }
  	var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$/;
    if (!passwordRegex.test(form.s_pw.value)) {
        alert('비밀번호는 8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다');
        form.s_pw.focus();
        form.s_pw.value = "";
        form.s_pw_again.value = "";
        return false;
    }
    if (form.s_business_name.value === '') {
        alert('사업자명을 입력해주세요');
        form.s_business_name.focus();
        return false;
    }
    if (form.s_business_reg_no.value === '') {
        alert('사업자등록번호를 입력해주세요.');
        form.s_business_reg_no.focus();
        return false;
    }
    if (form.s_phone.value === '') {
        alert('휴대폰 번호를 입력해주세요');
        form.s_phone.focus();
        return false;
    }
    if (form.s_email_check.value === '') {
        alert('인증번호을 입력해주세요.');
        form.s_email_check.focus();
        return false;
    }
    if (form.s_email.value === '') {
        alert('이메일을 입력해주세요.');
        form.s_email.focus();
        return false;
    }
}
$(document).ready(function() {
	   $(document).on("click","#idCheckButton", function() {
		   var s_id = $("#s_id").val();

	       if (s_id === '') {
	           alert('아이디를 입력해주세요.');
	           return;
	       }
	       var regex = /^[a-z][a-z0-9]{5,19}$/;
	       if (!regex.test(s_id)) {
	           alert('아이디를 영문으로 시작하는 6~20자 영문(소문자), 숫자만 사용 가능합니다.');
	           return;
	       }
			
			$.ajax({
	           url : "idCheck", 
	           type: "POST",
	           data: {s_id: s_id},
	           cache : false,
	           dataType: "text",
	           success : function(result) {
	        	   if (result === '1') {
	                   alert('사용 가능한 아이디 입니다.');
	               } else {
	                   alert('이미 사용중인 아이디 입니다.');
	                   $("#s_id").val("");
	               }
	           }
		});
	   
	   });
	   
	});
var code = "";
$(document).ready(function() {
    $(document).on("click", "#emailSendButton", function() {
        
    	var s_email = $("#s_email").val();
    	
        $.ajax({
            type: "GET",
            url: "emailSend",
            data: {s_email: s_email},
            success:function(data){
            	if (data != null) {
                	alert("이메일이 발송되었습니다");
                	code = data;
            	}
            }
        });
    });
});

$(document).ready(function() {
    $(document).on("click", "#emailCheckButton", function() {
        var s_email_check = $("#s_email_check").val();
		
        if(s_email_check == code){                          
        	alert("인증번호가 일치합니다");
        } else {                                           
        	alert("인증번호가 일치하지 않습니다");
        	$("#s_email_check").val("");
        }
    });
});
</script>
	<jsp:include page="../loginHeader.jsp" />
	<div id="main_nav">
	<form name="insertSeller" action="insertSeller" method="POST" onsubmit="return sellerCheck()">
	
	<div id="main_title">회원가입 정보입력</div>
			<div class="create_form_container_sub">
				<div class="create_input_container">
				<span class="symbol">*</span>
				<span class="slabel">아이디</span>
					<input class="input_text" type="text" name="s_id" id="s_id" placeholder="6~20자 영문, 숫자" autocomplete="off">
					<button type="button" id="idCheckButton">중복 확인</button>
				</div>
				<div class="create_explanation">영문으로 시작하는 6~20자 영문(소문자), 숫자만 사용 가능합니다</div>
			</div>
			<div class="create_form_container_sub">
				<div class="create_input_container">
				<span class="symbol">*</span>
				<span class="slabel">비밀번호</span>
					<input class="input_text" type="password" name="s_pw" placeholder="8~12자 영문, 숫자, 특수문자"><br>
				</div>
				<div class="create_explanation">8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다</div>
			</div>
			<div class="create_form_container_sub">
				<div class="create_input_container">
				<span class="symbol">*</span>
				<span class="slabel">비밀번호 확인</span>
					<input class="input_text" type="password" name="s_pw_again"><br>
				</div>
			</div>
			<div class="create_form_container_sub">
				<div class="create_input_container">
				<span class="symbol">*</span>
				<span class="slabel">사업자명</span>
					<input class="input_text" type="text" name="s_business_name" autocomplete="off"><br>
				</div>
			</div>
			<div class="create_form_container_sub">
				<div class="create_input_container">
				<span class="symbol">*</span>
				<span class="slabel">사업자등록번호</span>
					<input class="input_text" type="text" name="s_business_reg_no" autocomplete="off"><br>
				</div>
			</div>
			<div class="create_form_container_sub">
				<div class="create_input_container">
				<span class="symbol">*</span>
				<span class="slabel">휴대폰 번호</span>
					<input class="input_text" type="text" name="s_phone" placeholder="ex)010-1234-5678" autocomplete="off"><br>
				</div>
				<div class="create_explanation">ex)010-1234-5678 형식으로 입력해 주세요</div>
			</div>
			<div class="create_form_container_sub">
				<div class="create_input_container">
				<span class="symbol">*</span>
				<span class="slabel">이메일</span>
					<input class="input_text" type="email" name="s_email" id="s_email" placeholder="ex)****@naver.com" autocomplete="off">
					<button type="button" id="emailSendButton">보내기</button>
				</div>
				<div class="create_explanation">이메일 형식으로 입력해주세요</div>
			</div>
				<div class="create_form_container_sub">
				<div class="create_input_container">
				<span class="symbol">*</span>
				<span class="slabel">인증번호</span>
					<input class="input_text" type="text" name="s_email_check" id="s_email_check" autocomplete="off">
					<button type="button" id="emailCheckButton">확인하기</button>
				</div>
			</div>
			<div class="create_form_container_sub">
				<div class="create_input_container">
				<span class="slabel">은행명</span>
				<select class="input_text" name="s_bank_name" >
						<option value="">은행명</option>
						<option value="카카오뱅크">카카오뱅크</option>
						<option value="신한은행">신한은행</option>
						<option value="농협은행">농협은행</option>
					</select> <br>
				</div>
			</div>
			<div class="create_form_container_sub">
				<div class="create_input_container">
				<span class="slabel">계좌번호</span>
					<input class="input_text" type="text" name="s_account_no" autocomplete="off"><br>
				</div>
			</div>
			<div class="create_form_container_sub">
				<div class="create_input_container">
				<span class="slabel">주소</span>
					<input class="input_text" type="text" name="s_address" autocomplete="off"><br>
				</div>
			</div>
		<button class="next_button" type="submit">승인신청</button>
		</form>
		</div>
		<div id="footer_nav">
			<jsp:include page="../common/footer.jsp" />
		</div>
</body>
</html>