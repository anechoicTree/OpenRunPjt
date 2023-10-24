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
<jsp:include page="../header.jsp" />
<div id="main_nav">
	<div id="main_nav_container">
	<jsp:include page="side/side.jsp" />
	
	<div id="main_nav_sub">
		<div id="main_title">회원 정보수정</div>
			<div id="main_content_sub">
				<div id="modification_nav">	
					<div id="modification_content">
						<div class="input_container">
							<span>아이디</span>
							<input class="input_text" type="text" id="u_id">
						</div>
						<div class="input_container">
							<span>비밀번호</span>
							<input class="input_text" type="password" id="u_pw">
						</div>
						<div class="input_container">
							<span>비밀번호 확인</span>
							<input class="input_text" type="password" id="u_pw_again">
						</div>
						<div class="input_container">
							<span>이름</span>
							<input class="input_text" type="text" id="u_name">
						</div>
						<div class="input_container">
							<span>생년월일</span>
							<input class="input_text" type="text" id="u_birth">
						</div>
						<div class="input_container">
							<span>휴대폰 번호</span>
							<input class="input_text" type="text" id="u_phone">
						</div>
						<div class="input_container">
							<span>이메일</span>
							<input class="input_text" type="u_email" id="u_email">
						</div>
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
							<input class="input_text" type="text" id="u_account_no">
						</div>
						<div class="input_container">
							<span>주소</span>
							<input class="input_text" type="text" id="u_address">
						</div>
						<button class="next_button" type="submit" >수정하기</button>
					</div>
				</div>
			</div>
	</div>
	
	</div>	
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>