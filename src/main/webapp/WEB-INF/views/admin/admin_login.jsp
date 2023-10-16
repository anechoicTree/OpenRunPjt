<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/resources/admin/css/admin_form.css" var="css" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 로그인 실패나 성공시 메시지를 받아서 출력하는 자바스크립트 구문 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    $(function(){
        var responseMessage = "<c:out value="${message}" />";
        if (responseMessage != ""){
            alert(responseMessage)
        }
    })
</script>
 
<link rel="stylesheet" href="${css}">
 
<title>[관리자] 로그인</title>
</head>
<body>
<form action ="admin_loginCheck" method = "post">
	<div class="admin-login-container">
		<div id="admin-login-title">관리자 로그인</div>
		<div class="admin-login-box">
			<div>
				<div class="admin-login-label">관리자 ID</div>
				<input class="admin-login-input" type="text" name="admin_id" placeholder="관리자 ID">
			</div>
			<div>
				<div class="admin-login-label">관리자 PW</div>
				<input class="admin-login-input" type="password" name="admin_pass" placeholder="관리자 비밀번호">
			</div>
		</div>
		<div class="form-btn">
			<button type="submit" name="submit" >로그인</button>
		</div>

		<!-- 로그인 유지 기능
		<div class = "row">
	        <label>
	            <input type = "checkbox" name = "useCookie"> 로그인유지
	        </label>
		</div>
		 -->
	</div>
</form>
</body>
 
</html>
