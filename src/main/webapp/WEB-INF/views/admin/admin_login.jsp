<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/resources/cs/css/cs.css" var="css" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 
<title>[관리자] 로그인</title>
 
</head>
 
 
<br>
<br>
<br>
<br>
<br>
 
<center>
<table border="1" width="400">
 
<tr>
<td>
<br>
<center>
<span style="color:green; font-weight : bold;">관리자 로그인</span>
</center>
 
<center>
<!-- 로그인창 -->
<form action ="admin_loginCheck" method = "post">
<center>
<br>
-관리자 아이디- <input type = "text" name="admin_id" placeholder="  ID를 입력하세요 "><br><br>
-관리자 비밀번호- <input type = "password" name="admin_pass" placeholder="  비밀번호를 입력하세요 "><br><br>
<button type = "submit" name = "submit" >로그인</button>
 
<br>
<br>
<div class = "row">
    <div class="col-xs-8">
        <div class="checkbox icheck">
        <label>
            <input type = "checkbox" name = "useCookie"> 로그인유지
        </label>
        </div>
    </div>
</div>
</center>
 
<center>
 
 
</form>
 
</center>
</td>
</tr>
</table>
</center>
</body>
 
 
<!-- 로그인 실패나 성공시 메시지를 받아서 출력하는 자바스크립트 구문 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
    $(function(){
        var responseMessage = "<c:out value="${message}" />";
        if (responseMessage != ""){
            alert(responseMessage)
        }
    })
</script>
 
 
 
</html>
