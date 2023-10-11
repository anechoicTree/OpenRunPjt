<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<jsp:include page="../../main.jsp" />
	<section>
		
		<div id="section_wrap">
			
			<div class="word">
			
				<h3>LOGIN FORM</h3>
				
			</div>
			
			<div class="login_form">
			
				<form action="<c:url value='/admin/member/loginConfirm' />" name="login_form" method="post">
					
					<input type="text"		name="a_m_id" 		placeholder="INPUT ADMIN ID."> <br>
					<input type="password"	name="a_m_pw" 		placeholder="INPUT ADMIN PW."> <br>
					<input type="button"	value="login" onclick="loginForm();"> 
					<input type="reset"		value="reset">
					
				</form>
				
			</div>
		</div>
		
	</section>
</body>
</html>