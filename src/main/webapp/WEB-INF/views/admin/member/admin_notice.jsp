<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/cs/css/cs.css" var="css" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>[고객센터] 공지사항</title>
<link rel="stylesheet" href="${css}">
</head>
<body>
	<div id="cs-container">
		<div id="cs-board">
			<div id="cs-board-title">
				<span>공지사항</span>
			</div>
			<div id="cs-board-category">
				<div id="cs-board-category-nav">
					<div class="category-box">
						<button class="category-btn" data-id="all">전체</button>
					</div>
					<div class="category-box">
						<button class="category-btn" data-id="general">일반</button>
					</div>
					<div class="category-box">
						<button class="category-btn" data-id="system">시스템</button>
					</div>
					<div class="category-box">
						<button class="" data-id=""></button>
					</div>
					<div class="category-box">
						<button class="" data-id=""></button>
					</div>
				</div>
			</div>
			<div id="as-board-list">
				<c:forEach items="${listInPage}" var="notice">
					<div class="as-board-list-board level${notice.notice_level}">
						<div><c:if test="${notice.notice_level eq 1}"><span class="notice_top">공지</span></c:if></div>
						<div>
							<a href="/as/notice/detail?no=${notice.notice_code}">${notice.notice_title}</a>
						</div>
						<div>${notice.notice_date}</div>
					</div>
				</c:forEach>
			</div>
			<div id="as-board-list-page-buttons">
				<button id="notice-prev-btn" class="move-buttons">&lt;</button>
				<c:forTokens delims="/" items="${pageBtnNum}" var="i">
					<c:choose>
						<c:when test="${i eq pagination.pageNum}">
							<input type="hidden" id="page-num" value="${pagination.pageNum}" />
							<input type="hidden" id="max-num" value="${pagination.maxNum}" />
							<button class="notice-page-buttons page-buttons selected"
								value="${i}">${i}</button>
						</c:when>
						<c:otherwise>
							<button class="notice-page-buttons page-buttons" value="${i}">${i}</button>
						</c:otherwise>
					</c:choose>
				</c:forTokens>
				<button id="notice-next-btn" class="move-buttons">&gt;</button>
			</div>
		</div>
	</div>
</body>
</html>