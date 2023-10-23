<%@ page import="com.openrun.ticket.vo.UserVO"%> 
<%@ page import="com.openrun.ticket.vo.SellerVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/header.css" var="css" />
<c:url value="/resources/common/image/logo.png" var="logo" />
<c:url value="/resources/common/image/search_btn.png" var="search_btn" />
<link rel="stylesheet" href="${css}">

<div class="header-container">
	<div class="header-container-sub"> 

	<!-- 상단 로고, 로그인 / 회원가입 / 고객센터 -->
	<div id="main-user-nav">
		<div></div><!-- 로고 좌측 여백입니다 -->
		<!-- 로그인 성공시 로그아웃, 마이페이지, 고객센터로 바뀌어야함 -->
		
		<!-- 로그인 전 -->
		<%
		UserVO userLoginResult = (UserVO) session.getAttribute("userLoginResult");
				SellerVO sellerLoginResult = (SellerVO) session.getAttribute("sellerLoginResult");
		%>
		<% 
		if (userLoginResult != null){
		%>
			<ul id="user-nav">
			<li class="user-nav-item">
			    <button class="user-nav-btn" id="login" onclick="location.href='exLoginOut'">로그아웃</button>
				<button class="user-nav-btn" id="join" onclick="location.href='receiveType'">마이페이지</button>
				<button class="user-nav-btn" id="as" onclick="location.href=''">고객센터</button>
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
			    <button class="user-nav-btn" id="login" onclick="location.href='exLoginOut'">로그아웃</button>
				<button class="user-nav-btn" id="join" onclick="location.href='receiveType'">마이페이지</button>
				<button class="user-nav-btn" id="as" onclick="location.href=''">고객센터</button>
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
			    <button class="user-nav-btn" id="login" onclick="location.href='loginForm'">로그인</button>
				<button class="user-nav-btn" id="join" onclick="location.href='joinMember'">회원가입</button>
				<button class="user-nav-btn" id="as">고객센터</button>
			</li>	
		</ul>
		<%
		}
		%>
	</div>
	
	<div id="main-title">
		<div id="main-logo">
			<img src="${logo}" alt="로고" />
		</div>
		<div>
		</div>
	</div>
	</div>
	<!-- 네비바 -->
	<div id="main-nav-back">
	<div id="main-nav">
		<div id="main-nav-item1">
			<div class="main-nav-btn">
				<button class="menu-btn" data-id="home">홈</button>
			</div>
			<div class="main-nav-btn">
				<button class="menu-btn" data-id="musical">뮤지컬</button>
			</div>
			<div class="main-nav-btn">
				<button class="menu-btn" data-id="concert">콘서트</button>
			</div>
			<div class="main-nav-btn">
				<button class="menu-btn" data-id="drama">연극</button>
			</div>
			<div class="main-nav-btn">
				<button class="menu-btn" data-id="classic">클래식/무용</button>
			</div>
			<div class="main-nav-btn">
				<button class="menu-btn" data-id="exhibition">전시/행사</button>
			</div>
			<div class="main-nav-btn">
				<button class="menu-btn" data-id="ranking">랭킹</button>
			</div>
			<div class="main-nav-btn">
				<button class="menu-btn" data-id="area">지역</button>
			</div>
			<div class="main-nav-btn">
				<button class="menu-btn" data-id="hall">공연장</button>
			</div>
		</div>
		<div id="main-nav-item2">
			<div class="search">
				<!-- 나중에 input 태그 form 추가하세요 -->
				<form id="search" action="">
				<div>
					<input type="text" id="search-box"/>
					<input type="image" id="search-submit" src="${search_btn}" alt="검색" />
				</div>
				</form>
			</div>
		</div>
	</div>
	</div>

</div>