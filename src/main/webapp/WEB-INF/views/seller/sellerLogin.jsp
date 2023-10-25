<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/common/login.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>판매자 로그인</title>
</head>
<body>
<script>
$(document).ready(function() {
    $(document).on("click", "#loginSellerButton", function(e) {
        e.preventDefault();

        var s_id = $("#s_id").val();
        var s_pw = $("#s_pw").val();

        if (s_id === '') {
            alert('아이디를 입력해주세요.');
            return;
        }
        if (s_pw === '') {
            alert('비밀번호를 입력해주세요.');
            return;
        }
        $.ajax({
            type: "POST",
            url: "idCheck",
            data: { s_id: s_id },
            dataType: "text",
            success: function(result) {
                if (result === '1') {
                	 console.log(result + "id");
                    alert('아이디가 존재하지 않습니다. 회원가입을 해주세요');
                } else {
                	$.ajax({
                	    type: "POST",
                	    url: "loginSeller",
                	    data: { s_id: s_id, s_pw: s_pw },
                	    dataType: "json",
                	    success: function(response) {
                	    	console.log(result)
                	         if (response.result === '1') { // 로그인 성공
                   				 var s_level = response.s_level;
                   				 console.log(s_level);
                    			if (s_level === '2') {
                       				 alert("로그인 성공-승인 진행중");
                        			window.location.href = "sellerLoginNo";
                    			} else {
                    				alert("로그인 성공");
                       				 window.location.href = "exLoginOk";
                    			}
                			} else if (response.result === '0') { // 로그인 실패
                   				 alert("로그인 실패. 아이디 또는 비밀번호가 일치하지 않습니다.");
               				}
                	    }
                	});
                }
            }
        });
    });
});
</script>
	<jsp:include page="../loginHeader.jsp" />
	
		<div id="main_nav">
		<div id="main_title">로그인</div>
		<div id="login_form_container">
		
		<form name="loginSeller" action="loginSeller" method="POST">
		<div id="login_form_container_sub">
			<div class="login_input_container">아이디
				<input class="input_text" type="text" name="s_id"  id="s_id" autocomplete="off"  placeholder="6~20자 영문, 숫자"><br>
			</div>
			<div class="login_input_container">비밀번호
				<input class="input_text" type="password" name="s_pw" id="s_pw" autocomplete="off"  placeholder="8~12자 영문, 숫자, 특수문자"><br>
			</div>
			<button class="next_button" id="loginSellerButton" type="submit">로그인하기</button>
		</div>
		</form>
			<div id="add_button_container">
		
					<button class="add_button" id="find_id" onclick="location.href='sellerFindId'">아이디찾기</button>
					<button class="add_button" id="find_password" onclick="location.href='sellerFindPw'">비밀번호찾기</button>
					<button class="add_button" id="join" onclick="location.href='/ticket'">회원가입</button>
			</div>	
		</div>
		</div>

		<jsp:include page="../common/footer.jsp" />

</body>
</html>