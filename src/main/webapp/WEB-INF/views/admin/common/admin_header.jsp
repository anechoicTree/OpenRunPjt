<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/admin/css/admin_fragments.css" var="css" />
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
		<ul id="user-nav">
			<li class="user-nav-item">
			    <button class="user-nav-btn" id="login" onclick="location.href='/ticket/admin/admin_logout'">로그아웃</button>
			</li>	
		</ul>
	</div>
	
	<div id="main-title">
		<div id="main-logo">
			<img src="${logo}" alt="로고" />
		</div>
		<div></div>
		<div id="main-admin">관리자 모드</div>
	</div>
	</div>
	<!-- 네비바: 관리자 모드에서는 사용안함 / css 때문에 남겨둠 / 여유되면 수정 필요 -->
	<div id="main-nav-back">
		<div id="main-nav">
			<div id="main-nav-item1"></div>
		</div>
	</div>

</div>