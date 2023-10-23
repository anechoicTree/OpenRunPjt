<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/common/css/fragments.css" var="css" />
<c:url value="/resources/common/css/nav_side.css" var="css2" />
<link rel="stylesheet" href="${css}" />
<link rel="stylesheet" href="${css2}" />

<!-- 사이드 메뉴바 -->
<div class="sidenav-container">
	<div class="sidenav-container-sub">
		<div class="sidenavtitle">마이페이지</div>
		<div class="sidenavmenu">
			<div class="stitle">상품관리</div>
			<div class="ssub">
				<button id="menu_padd_btn" class="indexbtn">상품등록</button>
				<button id="menu_liview_btn" class="indexbtn">상품 목록 조회</button>
				<button id="menu_pmod_btn" class="indexbtn">상품 수정 요청</button>
			</div>
			<div class="stitle">매출관리</div>
			<div class="ssub">
				<button id="menu_order_btn" class="indexbtn">주문/구매 현황</button>
				<button id="menu_sales_btn" class="indexbtn">매출 현황</button>
				<button id="menu_adj_btn" class="indexbtn">매출정산 내역</button>
			</div>
			<div class="stitle">문의관리</div>
			<div class="ssub">
				<button id="menu_qna_btn" class="indexbtn">문의 목록 조회</button>
			</div>
			<div class="stitle">회원정보</div>
			<div class="ssub">
				<button id="menu_smod_btn" class="indexbtn">회원정보 수정</button>
				<button id="menu_squit_btn" class="indexbtn">회원탈퇴</button>
			</div>
		</div>
		<div class="csbanner">
			<p>고객센터</p>
			<p>1588-4646</p>
			<p>평일/주말 11:00 ~ 24:00</p>
		</div>
	</div>
</div>
