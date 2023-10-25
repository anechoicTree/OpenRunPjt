<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/seller/pwChange.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>판매자 비밀번호 변경</title>
</head>
<body>
<script>
function sellerPwChange() {
    let form = document.sellerPwChange;
    var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$/;

    if (form.s_new_pw.value === '') {
        alert('새로운 비밀번호를 입력해주세요');
        form.s_new_pw.focus();
        form.s_new_pw.value = '';
        return false;
    } else if (form.s_new_pw_again.value === '') {
        alert('새로운 비밀번호 확인을 입력해주세요');
        form.s_new_pw_again.focus();
        return false;
    } else if (!passwordRegex.test(form.s_new_pw.value)) {
        alert('비밀번호는 8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다');
        form.s_pw.focus();
        form.s_pw.value = "";
        form.s_pw_again.value = "";
        return false;
	}else if (form.s_new_pw.value !== form.s_new_pw_again.value) {
        alert('새로운 비밀번호와 새로운 비밀번호 확인의 입력값이 다릅니다');
        form.s_new_pw.focus();
        form.s_new_pw.value = '';
        form.s_new_pw_again.value = '';
        return false;
    } else {
        return true;
    }
}

$(document).ready(function() {
    $(document).on("click", "#pwChangeButton", function(e) {
        e.preventDefault();

        var s_new_pw = $("#s_new_pw").val();
        var s_id = "${param.s_id}";

        var dataToSend = {
                s_pw: s_new_pw,
                s_id: s_id
            };
        
        console.log(dataToSend);

        if (sellerPwChange()) {
            $.ajax({
                url: "sellerPwChange",
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
                        $("#s_new_pw").val("");
                        $("#s_new_pw_again").val("");
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
			
			<form name="sellerPwChange" method="POST" action="/sellerPwChange">
			<div id="modify_pw_nav_sub">
				<div id="modify_pw_content">
					<div id="modify_pw_content1">새로운 비밀번호
						<input class="input_text" type="password" id="s_new_pw" placeholder="8~12자 영문, 숫자, 특수문자"><br>
					</div>
					<div id="modify_pw_content2">새로운 비밀번호 확인
						<input class="input_text" type="password" id="s_new_pw_again" placeholder="8~12자 영문, 숫자, 특수문자"><br>
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