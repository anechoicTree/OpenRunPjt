<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/seller/findId.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>판매자 아이디 찾기</title>
</head>
<body>
<script>
function findIdCheck() {
	
	let form = document.sellerFindId;
	var birthRegex = /^\d{8}$/;
	 if (form.s_business_name.value === '') {
 			alert('사업자명을 입력해주세요');
	        form.s_business_name.focus();
	        return false;

	 }else if (form.s_business_reg_no.value === '') {
	        alert('사업자등록번호를 입력해주세요.');
	        form.s_business_reg_no.focus();
	        return false;
	  }else if (form.s_email.value === '') {
	      alert('이메일을 입력해주세요.');
	      form.s_email.focus();
			return false;
	  }else if (form.s_email_check.value === '') {
	      alert('인증번호을 입력해주세요.');
	      form.s_email_check.focus();
	      return false;
	  }else {
		  return true;
	  }

}
var code = "";
$(document).ready(function() {
    $(document).on("click", "#emailSendButton", function() {
        
    	var s_email = $("#s_email").val();
    	
    	if (s_email=== '') {
  	      alert('이메일을 입력해주세요.');
  	    $("#s_email").focus();
  			return false;
  	  }
    	
        $.ajax({
            type: "GET",
            url: "emailSend",
            data: { s_email: s_email },
            success:function(data){
            	alert("이메일이 발송되었습니다");
            	code = data;
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
 $(document).ready(function() {
    $(document).on("click", "#findIdCheckButton", function(e) {
    	e.preventDefault();
    	   
        var s_business_name = $("#s_business_name").val();
        var s_business_reg_no = $("#s_business_reg_no").val();
       
        console.log("s_business_name:", s_business_name);
        console.log("s_business_reg_no:", s_business_reg_no);
        
        if(findIdCheck()){
        	
        	$.ajax({
            type: "POST",
            url: "findIdCheck",
            data: { s_business_name: s_business_name, s_business_reg_no: s_business_reg_no },
            dataType: "json",
            success: function(response) {
                if (response.result === '1') {
                	console.log("s_business_name:", response.s_business_name); 
                	console.log("s_id:", response.s_id); 
                    window.location.href = "sellerFindIdOk?s_business_name=" + encodeURIComponent(response.s_business_name) + "&s_id=" + encodeURIComponent(response.s_id);
                } else {
                    alert("아이디 찾기 실패")
                }
            }
        });
        }
  
    });
});
</script>
	<jsp:include page="../loginHeader.jsp" />
	
<div id="main_container">
	<div id="main_title">아이디 찾기</div>
	<div id="main_container_sub">
	<!-- onsubmit = 유효성 검사 . value= controller이동  -->
	<form name="sellerFindId" action="<c:url value='/findIdCheck' />" method="POST" >
	<div id="find_id_container">		
		<div class="find_id_container_sub">
			<div class="find_input_container">사업자명
				<input class="input_text" type="text"  id="s_business_name">
			</div>
		</div>
		<div class="find_id_container_sub">
			<div class="find_input_container">사업자등록번호
				<input class="input_text" type="text" id="s_business_reg_no">
			</div>
		</div>
		<div class="find_id_container_sub">
			<div class="find_input_container">이메일
				<input class="input_text" type="text" id ="s_email" placeholder="ex)****@naver.com">
				<button type="button" id="emailSendButton">보내기</button>
			</div>
			<div class="find_explanation">이메일 형식으로 입력해주세요</div>
		</div>
		<div class="find_id_container_sub">
			<div class="find_input_container">인증번호
				<input class="input_text" type="text"  id="s_email_check">
				<button type="button" id="emailCheckButton">확인하기</button>
			</div>
		</div>
	
	<button class="next_button" id="findIdCheckButton" onclick="return false;">아이디 찾기</button>
	</div>
	</form>
		<div id="add_button_container">
			<button class="add_button" id="find_login" onclick="location.href='/ticket/loginForm'">로그인</button>
			<button class="add_button" id="find_password" onclick="location.href='sellerFindPw'">비밀번호찾기</button>
			<button class="add_button" id="find_join" onclick="location.href='/ticket'">회원가입</button>
		</div>	
	</div>
	</div>
	 	<jsp:include page="../common/footer.jsp" />
</body>
</html>