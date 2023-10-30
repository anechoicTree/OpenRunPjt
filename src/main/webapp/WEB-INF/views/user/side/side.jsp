<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/user/side/side.css" var="css" />
<link rel="stylesheet" href="${css}" />

<!-- 사이드 메뉴바 -->
<div class="sidenav-container">
	<div class="sidenav-container-sub">
		<div class="side_main_title">마이페이지</div>
		<div class="side_nav_menu">
			<div class="sub_title">예매관리</div>
			<div class="content_nav">
				<button id="reservation_button" class="index_button" onClick="location.href='userReservationList'">예매 내역 조회</button>
				<button id="cancellation_button" class="index_button" onClick="location.href='userCancelReservationList'">취소 내역 조회</button>
			</div>
			<hr>
			<div class="sub_title">문의관리</div>
			<div class="content_nav"><!-- onClick="location.href='inquiry-check'" -->
				<button id="product_button" class="index_button" onClick="location.href='/ticket/user/exProduct'">상품 문의 조회</button>
				<button id="system_button" class="index_button" onClick="location.href='system-inquiry-check'">시스템 문의 조회</button>
			</div>
			<hr>
			<div class="sub_title">후기관리</div>
			<div class="content_nav">
				<button id="writeable_button" class="index_button" onClick="location.href='review1'">작성 가능한 후기</button>
				<button id="written_button" class="index_button" onClick="location.href='review2'">작성한 후기</button>
			</div>
			<hr>
			<div class="sub_title">회원정보</div>
			<div class="content_nav">
				<button id="modify_button" class="index_button" onclick="location.href='userModificationPwCheck'">회원정보 수정</button>
				<button id="wthdr_button" class="index_button" onclick="location.href='userWithdrawal'">회원탈퇴 </button>
			</div>
		</div>
		<div class="csbanner">
			<p>고객센터</p>
			<p>1588-4646</p>
			<p>평일/주말 11:00 ~ 24:00</p>
		</div>
	</div>
</div>
