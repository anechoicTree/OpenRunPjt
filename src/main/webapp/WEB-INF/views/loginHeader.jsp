<%@ page import="com.openrun.ticket.vo.UserVO"%> 
<%@ page import="com.openrun.ticket.vo.SellerVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:url value="/resources/loginHeader.css" var="css" />
<c:url value="/resources/common/image/logo.png" var="logo" />


<link rel="stylesheet" href="${css}">

<div class="header-container">
	<div class="header-container-sub"> 

	<!-- 상단 로고, 로그인 / 회원가입 / 고객센터 -->
	<div id="main-user-nav">
		<div></div><!-- 로고 좌측 여백입니다 -->
		<!-- 로그인 성공시 로그아웃, 마이페이지, 고객센터로 바뀌어야함 -->
		<!-- 로그인 후 -->
		<%
		UserVO userLoginResult = (UserVO) session.getAttribute("userLoginResult");
				SellerVO sellerLoginResult = (SellerVO) session.getAttribute("sellerLoginResult");
		%>
		<% 
		if (userLoginResult != null){
		%>
		<ul id="user-nav">
			<li class="user-nav-item">
			    <button class="user-nav-btn" id="login" onclick="location.href='user/logOut'">로그아웃</button>
				<button class="user-nav-btn" id="join" onclick="location.href='/ticket/product/admin/userWithdrawal'">마이페이지</button>
				<button class="user-nav-btn" id="as" onclick="location.href='cs/main'">고객센터</button>
			</li>	
		</ul>
		<%
		}
		%>
		
		<%
    	if (sellerLoginResult != null){
		%>
		<ul id="user-nav">
			<li class="user-nav-item">
			    <button class="user-nav-btn" id="login" onclick="location.href='seller/logOut'">로그아웃</button>
				<button class="user-nav-btn" id="join" onclick="location.href='/ticket/product/admin/registerProductForm'">마이페이지</button>
				<button class="user-nav-btn" id="as" onclick="location.href='cs/main'">고객센터</button>
			</li>	
		</ul>
		<%
		}
		%>
		<!-- 로그인 전 -->
		<%
		if(userLoginResult == null && sellerLoginResult == null){
		%>
		<ul id="user-nav">
			<li class="user-nav-item">
			    <button class="user-nav-btn" id="login" onclick="location.href='/ticket/loginForm'">로그인</button>
				<button class="user-nav-btn" id="join" onclick="location.href='/ticket/joinMember'">회원가입</button>
				<button class="user-nav-btn" id="as" onclick="location.href='cs/main'">고객센터</button>
			</li>	
		</ul>
	
		<%
		}
		%>
		
		<%-- 		
		<%
		if(sellerLoginResult == null){
		%>
		<ul id="user-nav">
			<li class="user-nav-item">
			    <button class="user-nav-btn" id="login" onclick="location.href='/ticket/loginForm'">로그인</button>
				<button class="user-nav-btn" id="join" onclick="location.href='/ticket'">회원가입</button>
				<button class="user-nav-btn" id="as" onclick="location.href='user/reservationCancel'">고객센터</button>
			</li>	
		</ul>
		
			<%
		}
		%> 
		--%>		
	</div>
	
	<div id="main-title">
		<div id="main-logo">
			<img src="${logo}" alt="로고"  onclick="location.href='/ticket'"/>
		</div>
		<div>
		</div>
	</div>
	</div>
</div>