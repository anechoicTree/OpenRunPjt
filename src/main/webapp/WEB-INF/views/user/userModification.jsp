<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/user/modification.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>구매자 회원 정보 수정</title>
</head>
<body>
<script>
	//아이디 변경 불가 설정
	$(document).ready(function() {
   		var inputField = document.getElementById("u_id");
   	 	inputField.readOnly = true;
	
	//은행명 option 설정
        var bankName = "${userLoginResult.u_bank_name}";
        var selectElement = document.getElementsByName("u_bank_name")[0];
        selectElement.value = bankName;
    });
	function modificationUser(){
		if ($("#u_pw").val() == "") {
            $("#u_pw").val("${userLoginResult.u_pw}");
        }
	 	if ($("#u_pw_again").val() == "") {
            $("#u_pw_again").val("${userLoginResult.u_pw}");
        }
	 	 var u_pw = $("#u_pw").val();
	     var u_pw_again = $("#u_pw_again").val();
		let form = document.modificationUser;
	    var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$/;
		
		if (!passwordRegex.test(u_pw)) {
	        alert('비밀번호는 8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다');
	        return false;
		}else if (u_pw !== u_pw_again) {
	        alert('비밀번호와 비밀번호 확인의 입력값이 다릅니다');

	        return false;
	    } else {
	        return true;
	    };
		
	}
	 $(document).ready(function() {
		 $(document).on("click", "#modificationButton", function(){
			 
			 if ($("#u_pw").val() == "") {
		            $("#u_pw").val("${userLoginResult.u_pw}");
		        }

		        if ($("#u_name").val() == "") {
		            $("#u_name").val("${userLoginResult.u_name}");
		        }

		        if ($("#u_birth").val() == "") {
		            $("#u_birth").val("${userLoginResult.u_birth}");
		        }

		        if ($("#u_phone").val() == "") {
		            $("#u_phone").val("${userLoginResult.u_phone}");
		        }

		        if ($("#u_email").val() == "") {
		            $("#u_email").val("${userLoginResult.u_email}");
		        }

		        if ($("#u_account_no").val() == "") {
		            $("#u_account_no").val("${userLoginResult.u_account_no}");
		        }

		        if ($("#u_address").val() == "") {
		            $("#u_address").val("${userLoginResult.u_address}");
		        }
             var modifiedData = {
            	u_id: $("#u_id").val(), 
                u_pw: $("#u_pw").val(),
                u_name: $("#u_name").val(),
                u_birth: $("#u_birth").val(),
                u_phone: $("#u_phone").val(),
                u_email: $("#u_email").val(),
                u_bank_name: $("select[name='u_bank_name']").val(),
                u_account_no: $("#u_account_no").val(),
                u_address: $("#u_address").val()
             };
             if (modificationUser()) {
             $.ajax({
                 type: "POST",
                 url: "modificationUser",
                 data: modifiedData,
                 dataType: "text",
                 success: function(response) {
                     if (response === '1') {
                    	 console.log
                         alert("회원 정보 수정을 성공했습니다");
                    	 console.log('회원 정보 수정 성공');
                    	 window.location.href = "/ticket"
                     } else {
                         alert("회원 정보 수정을 실패했습니다.");
                         console.log('회원 정보 수정 실패');
                     }
                 }
             });
            }
         });
     });
</script>
<jsp:include page="../common/header.jsp" />
<div id="main_nav">
	<div id="main_nav_container">
	<jsp:include page="side/side.jsp" />
	
	<div id="main_nav_sub">
		<div id="main_title">회원 정보수정</div>
			<div id="main_content_sub">
				<div id="modification_nav">	
				<form name="modificationUser" action="<c:url value='modificationUser' />" method="POST"></form>
					<div id="modification_content">
						<div class="modification_form_container_sub">
							<div class="input_container">
								<span>아이디</span>
								<input class="input_text" type="text" id="u_id" value="${userLoginResult.u_id}" autocomplete="off">
							</div>
							<div class="create_explanation" id="create_explanation_id">아이디는 수정이 불가능 합니다</div>
						</div>
						<div class="modification_form_container_sub">
							<div class="input_container">
								<span>비밀번호</span>
								<input class="input_text" type="password" id="u_pw">
							</div>
							<div class="create_explanation">8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다</div>
						</div>
						<div class="modification_form_container_sub">
							<div class="input_container">
								<span>비밀번호 확인</span>
								<input class="input_text" type="password" id="u_pw_again">
							</div>
							<div class="create_explanation">8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다</div>
						</div>
						<div class="input_container">
							<span>이름</span>
							<input class="input_text" type="text" id="u_name" placeholder="${userLoginResult.u_name}" autocomplete="off">
						</div>
						<div class="modification_form_container_sub">
							<div class="input_container">
								<span>생년월일</span>
								<input class="input_text" type="text" id="u_birth" placeholder="${userLoginResult.u_birth}"  autocomplete="off">
							</div>
							<div class="create_explanation">ex)YYYYMMDD 형식으로 입력해 주세요</div>
						</div>
						<div class="modification_form_container_sub">
							<div class="input_container">
								<span>휴대폰 번호</span>
								<input class="input_text" type="text" id="u_phone" placeholder="${userLoginResult.u_phone}" autocomplete="off">
							</div>
								<div class="create_explanation">ex)01012345678 형식으로 입력해 주세요</div>
						</div>
						<div class="modification_form_container_sub">
							<div class="input_container">
								<span>이메일</span>
								<input class="input_text" type="email" id="u_email" placeholder="${userLoginResult.u_email}" autocomplete="off">
							</div>
							<div class="create_explanation">이메일 형식으로 입력해주세요</div>
						<div class="modification_form_container_sub">
						<div class="input_container">
							<span>은행명</span>
							<select class="input_text" name="u_bank_name">
								<option value="">은행명</option>
								<option value="카카오뱅크">카카오뱅크</option>
								<option value="신한은행">신한은행</option>
								<option value="농협은행">농협은행</option>
							</select> 
						</div>
						<div class="input_container">
							<span>계좌번호</span>
							<input class="input_text" type="text" id="u_account_no" placeholder="${userLoginResult.u_account_no}" autocomplete="off">
						</div>
						<div class="input_container">
							<span>주소</span>
							<input class="input_text" type="text" id="u_address" placeholder="${userLoginResult.u_address}" autocomplete="off">
						</div>
						<button class="next_button" id="modificationButton"  type="submit" >수정하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>