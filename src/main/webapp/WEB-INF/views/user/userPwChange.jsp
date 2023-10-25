<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/user/pwChange.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>구매자 비밀번호 변경</title>
</head>
<body>
<script>
function userPwChange() {
    let form = document.userPwChange;
    var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$/;

    if (form.u_new_pw.value === '') {
        alert('새로운 비밀번호를 입력해주세요');
        form.u_new_pw.focus();
        form.u_new_pw.value = '';
        return false;
    } else if (form.u_new_pw_again.value === '') {
        alert('새로운 비밀번호 확인을 입력해주세요');
        form.u_new_pw_again.focus();
        return false;
    }else if (!passwordRegex.test(form.u_new_pw.value)) {
        alert('비밀번호는 8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다');
        form.u_pw.focus();
        form.u_pw.value = "";
        form.u_pw_again.value = "";
        return false;
	} else if (form.u_new_pw.value !== form.u_new_pw_again.value) {
        alert('새로운 비밀번호와 새로운 비밀번호 확인의 입력값이 다릅니다');
        form.u_new_pw.focus();
        form.u_new_pw.value = '';
        form.u_new_pw_again.value = '';
        return false;
    } else {
        return true;
    }
}

$(document).ready(function() {
    $(document).on("click", "#pwChangeButton", function(e) {
        e.preventDefault();

        var u_new_pw = $("#u_new_pw").val();
        var u_id = "${param.u_id}";
        
        var dataToSend = {
                u_pw: u_new_pw,
                u_id: u_id
            };
        
        console.log(dataToSend);

        if (userPwChange()) {
            $.ajax({
                url: "userPwChange",
                type: "POST",
                data: dataToSend,
                cache: false,
                dataType: "text",
                success: function(result) {
                    if (result === '1') {
                        alert('비밀번호가 변경되었습니다');
                        window.location.href = "/ticket/loginForm"
                    } else {
                        alert('비밀번호 변경에 실패 했습니다\n잠시 후 다시 시도해 주세요');
                        $("#u_new_pw").val("");
                        $("#u_new_pw_again").val("");
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
	
	<div id="main_nav_sub">
		<div id="main_title">비밀번호 변경</div>
		<div id="main_content">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</div>
		
		<div id="main_content_sub">
			<div id="modify_pw_nav">	
			
			<form name="userPwChange"  id ="userPwChange" method="POST" action="/userPwChange">
			<div id="modify_pw_nav_sub">
				<div id="modify_pw_content">
					<div id="modify_pw_content1">새로운 비밀번호
						<input class="input_text" type="text" id="u_new_pw" placeholder="8~12자 영문, 숫자, 특수문자">
					</div>
					<div id="modify_pw_content2">새로운 비밀번호 확인
						<input class="input_text" type="text" id="u_new_pw_again" placeholder="8~12자 영문, 숫자, 특수문자">
					</div>
					
				</div>
				<button class="next_button" id="pwChangeButton"  onclick="return false;">확인</button>
			</div>
			</form>
			</div>
		</div>
		</div>
		</div>
	</div>
	<div id="footer_nav">
	 	<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>