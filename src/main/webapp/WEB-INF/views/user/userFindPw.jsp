<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/user/findPw.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>구매자 비밀번호 찾기</title>
</head>
<body>
<script>
function findPwCheck() {
	
	let form = document.userFindPw;
	var birthRegex = /^\d{8}$/;
	
	if (form.u_id.value === '') {
        alert('아이디를 입력해주세요');
        form.u_id.focus();
        return false;
        
    }else if (form.u_name.value === '') {
	        alert('이름을 입력해주세요');
	        form.u_name.focus();
	        return false;

	 }else if (form.u_birth.value === '') {
	        alert('생년월일을 입력해주세요.');
	        form.u_birth.focus();
	        return false;
	  }else if (!birthRegex.test(form.u_birth.value)) {
	        alert('생년월일을 8자리 숫자로 입력해주세요.');
	        form.u_birth.focus();
	        form.u_birth.value = '';   
			return false;
	 }else if (form.u_email.value === '') {
	      alert('이메일을 입력해주세요.');
	      form.u_email.focus();
			return false;
	  }else if (form.u_email_check.value === '') {
	      alert('인증번호을 입력해주세요.');
	      form.u_email_check.focus();
	      return false;
	  }else {
		  return true;
	  }

}
var code = "";
$(document).ready(function() {
    $(document).on("click", "#emailSendButton", function() {
        
    	var u_email = $("#u_email").val();
    	
    	if (u_email === '') {
  	      	alert('이메일을 입력해주세요.');
  	    	$("#u_email").focus();
  			return false;
  	  	}
    	
        $.ajax({
            type: "GET",
            url: "emailSend",
            data: { u_email: u_email },
            success:function(data){
            	alert("이메일이 발송되었습니다");
            	code = data;
            }
        });
    });
});
$(document).ready(function() {
    $(document).on("click", "#emailCheckButton", function() {
        var u_email_check = $("#u_email_check").val();
		
        if (u_email_check === '') {
  	    	alert('인증번호을 입력해주세요.');
  	   		$("#u_email_check").focus();
  	    	return false;
       }
        
       if(u_email_check == code){                          
        	alert("인증번호가 일치합니다");
        } else {                                           
        	alert("인증번호가 일치하지 않습니다");
        	$("#u_email_check").val("");
        }
    });
});
$(document).ready(function() {
    $(document).on("click", "#findPwCheckButton", function(e) {
    	e.preventDefault();
    	   
        var u_name = $("#u_name").val();
        var u_birth = $("#u_birth").val();
        var u_id = $("#u_id").val();
        
        if(findPwCheck()){
        	
        	$.ajax({
            type: "POST",
            url: "findPwCheck",
            data: {u_id: u_id, u_name: u_name, u_birth: u_birth },
            dataType: "json",
            success: function(response) {
                if (response.result === '1') {
                	 console.log("u_id:", response.u_id); 
                	 alert("비밀번호 성공")
               
                	 window.location.href = "userPwChange?u_id=" + encodeURIComponent(response.u_id);
                } else {
                    alert("비밀번호 찾기 실패")
                }
            }
        });
        }
  
    });
});
</script>
<jsp:include page="../loginHeader.jsp" />
<div id="main_container">
	
	<div id="main_title">비밀번호 찾기</div>
	<div id="main_container_sub">
	
	<form name="userFindPw" action="<c:url value='/findPwCheck' />" method="POST" >
	<div id="find_pw_container">
		<div class="find_pw_container_sub">
			<div class="find_input_container">아이디
				<input class="input_text" type="text" id="u_id" placeholder="6~20자 영문, 숫자">
			</div>
			<div class="find_explanation">영문으로 시작하는 6~20자 영문(소문자), 숫자만 사용 가능합니다</div>
		</div>
		<div class="find_pw_container_sub">
				<div class="find_input_container">이름
					<input class="input_text" type="text" id="u_name"><br>
				</div>
		</div>
		<div class="find_pw_container_sub">
			<div class="find_input_container">생년월일
				<input class="input_text" type="text" id="u_birth" placeholder="8자리 숫자">
			</div>
			<div class="find_explanation">ex)YYYYMMDD 형식으로 입력해 주세요</div>
		</div>
		<div class="find_pw_container_sub">
			<div class="find_input_container">이메일
				<input class="input_text" type="text" id ="u_email" placeholder="ex)****@naver.com">
				<button type="button" id="emailSendButton" >보내기</button>
			</div>
			<div class="find_explanation">이메일 형식으로 입력해주세요</div>
		</div>
		<div class="find_pw_container_sub">
			<div class="find_input_container">인증번호
				<input class="input_text" type="text" id="u_email_check">
				<button type="button" id="emailCheckButton" >확인하기</button>
			</div>
		</div>
	<button class="next_button" id="findPwCheckButton" onclick="return false;">비밀번호 찾기</button>
	</div>
	</form>
		<div id="add_button_container">
			<button class="add_button" id="find_login" onclick="location.href='/ticket/loginForm'">로그인</button>
			<button class="add_button" id="find_password" onclick="location.href='userFindId'">아이디찾기</button>
			<button class="add_button" id="find_join" onclick="location.href='/ticket/joinMember'">회원가입</button>
		</div>	
	</div>
</div>
	 	<jsp:include page="../common/footer.jsp" />
</body>
</html>