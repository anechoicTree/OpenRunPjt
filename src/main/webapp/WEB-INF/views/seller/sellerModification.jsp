<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/seller/modification.css'  var="css"/>
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
   		var inputField = document.getElementById("s_id");
   	 	inputField.readOnly = true;
	
	//은행명 option 설정
        var bankName = "${userLoginResult.s_bank_name}";
        var selectElement = document.getElementsByName("s_bank_name")[0];
        selectElement.value = bankName;
    });
	
	 $(document).ready(function() {
		 $(document).on("click", "#modificationButton", function(){
			 
			 if ($("#s_pw").val() == "") {
		            $("#s_pw").val("${sellerLoginResult.s_pw}");
		        }

		        if ($("#s_business_name").val() == "") {
		            $("#s_business_name").val("${sellerLoginResult.s_business_name}");
		        }

		        if ($("#s_business_reg_no").val() == "") {
		            $("#s_business_reg_no").val("${sellerLoginResult.s_business_reg_no}");
		        }

		        if ($("#s_phone").val() == "") {
		            $("#s_phone").val("${sellerLoginResult.s_phone}");
		        }

		        if ($("#s_email").val() == "") {
		            $("#s_email").val("${sellerLoginResult.s_email}");
		        }

		        if ($("#s_account_no").val() == "") {
		            $("#s_account_no").val("${sellerLoginResult.s_account_no}");
		        }

		        if ($("#s_address").val() == "") {
		            $("#s_address").val("${sellerLoginResult.s_address}");
		        }
             var modifiedData = {
            	s_id: $("#s_id").val(), 
            	s_pw: $("#s_pw").val(),
            	s_business_name: $("#s_business_name").val(),
            	s_business_reg_no: $("#s_business_reg_no").val(),
            	s_phone: $("#s_phone").val(),
            	s_email: $("#s_email").val(),
                s_bank_name: $("select[name='s_bank_name']").val(),
                s_account_no: $("#s_account_no").val(),
                s_address: $("#s_address").val()
             };

             $.ajax({
                 type: "POST",
                 url: "modificationSeller",
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
         });
     });
</script>
<jsp:include page="../common/header.jsp" />
<div id="main_nav">
	<div id="main_nav_container">
		<jsp:include page="../seller/seller_nav_side.jsp" />
	
	<div id="main_nav_sub">
		<div id="main_title">회원 정보수정</div>
			<div id="main_content_sub">
				<div id="modification_nav">	
				<form name="sellerModification" action="<c:url value='/sellerModification' />" method="POST"></form>
					<div id="modification_content">
						<div class="modification_form_container_sub">
							<div class="input_container">
								<span>아이디</span>
								<input class="input_text" type="text" id="s_id" value="${sellerLoginResult.s_id}">
							</div>
							<div class="create_explanation" id="create_explanation_id">아이디는 수정이 불가능 합니다</div>
						</div>
						<div class="modification_form_container_sub">
							<div class="input_container">
								<span>비밀번호</span>
								<input class="input_text" type="password" id="s_pw">
							</div>
							<div class="create_explanation">8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다</div>
						</div>
						<div class="modification_form_container_sub">
							<div class="input_container">
								<span>비밀번호 확인</span>
								<input class="input_text" type="password" id="s_pw_again">
							</div>
							<div class="create_explanation">8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다</div>
						</div>
						<div class="input_container">
							<span>사업자명</span>
							<input class="input_text" type="text" id="s_business_name" placeholder="${sellerLoginResult.s_business_name}">
						</div>
			
							<div class="input_container">
								<span>사업자등록번호</span>
								<input class="input_text" type="text" id="s_business_reg_no" placeholder="${sellerLoginResult.s_business_reg_no}" >
							</div>
						<div class="modification_form_container_sub">
							<div class="input_container">
								<span>휴대폰 번호</span>
								<input class="input_text" type="text" id="s_phone" placeholder="${sellerLoginResult.s_phone}">
							</div>
								<div class="create_explanation">ex)01012345678 형식으로 입력해 주세요</div>
						</div>
						<div class="modification_form_container_sub">
							<div class="input_container">
								<span>이메일</span>
								<input class="input_text" type="email" id="s_email" placeholder="${sellerLoginResult.s_email}">
							</div>
							<div class="create_explanation">이메일 형식으로 입력해주세요</div>
						<div class="modification_form_container_sub">
						<div class="input_container">
							<span>은행명</span>
							<select class="input_text" name="s_bank_name">
								<option value="">은행명</option>
								<option value="카카오뱅크">카카오뱅크</option>
								<option value="신한은행">신한은행</option>
								<option value="농협은행">농협은행</option>
							</select> 
						</div>
						<div class="input_container">
							<span>계좌번호</span>
							<input class="input_text" type="text" id="s_account_no" placeholder="${sellerLoginResult.s_account_no}">
						</div>
						<div class="input_container">
							<span>주소</span>
							<input class="input_text" type="text" id="s_address" placeholder="${sellerLoginResult.s_address}">
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