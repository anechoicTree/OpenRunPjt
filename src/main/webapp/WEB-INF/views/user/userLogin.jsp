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
<title>구매자 로그인</title>
</head>
<body>
<script>
$(document).ready(function() {
    $(document).on("click", "#loginUserButton", function(e) {
        e.preventDefault();

        var u_id = $("#u_id").val();
        var u_pw = $("#u_pw").val();

        if (u_id === '') {
            alert('아이디를 입력해주세요.');
            return;
        }
        if (u_pw === '') {
            alert('비밀번호를 입력해주세요.');
            return;
        }
        $.ajax({
            type: "POST",
            url: "idCheck",
            data: { u_id: u_id },
            dataType: "text",
            success: function(result) {
                if (result === '1') {
                    alert('아이디가 존재하지 않습니다. 회원가입을 해주세요');
                } else {
                    $.ajax({
                        type: "POST",
                        url: "loginUser",
                        data: { u_id: u_id, u_pw: u_pw },
                        dataType: "text",
                        success: function(result) {
                            if (result === '1') {
                                alert("로그인 성공");
                                window.location.href = "/ticket";
                            } else {
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
		
		<form name="loginUser" action="loginUser" method="POST">
		<div id="login_form_container_sub">
			<div class="login_input_container" >아이디
				<input class="input_text" type="text" name="u_id"  id="u_id" placeholder="6~20자 영문, 숫자" autocomplete="off">
			</div>
			<div class="login_input_container">비밀번호
				<input class="input_text" type="password"  name="u_pw" id="u_pw" placeholder="8~12자 영문, 숫자, 특수문자" ><br>
			</div>
			<button class="next_button" id="loginUserButton" type="submit">로그인하기</button>
		</div>
		</form>
			<div id="add_button_container">
					<button class="add_button" id="find_id" onclick="location.href='userFindId'">아이디찾기</button>
					<button class="add_button" id="find_password" onclick="location.href='userFindPw'">비밀번호찾기</button>
					<button class="add_button" id="login_join" onclick="location.href='/ticket/joinMember'">회원가입</button>
			</div>	
		</div>
	</div>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>