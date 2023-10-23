<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/resources/common/css/sellerModifyProduct.css' />" rel="stylesheet" type="text/css">
<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../../../views/header.jsp" />

	<section>
		<div id="section_wrap">
			<div>
				<jsp:include page="../../seller/seller_nav_side.jsp"/>
			</div>
			<div>
				<div class="word">
					<h3>문의관리</h3>
				</div>
				<div class="top_nav">
					<table>
						<tr>
							<th>문의 목록 조회</th>
						</tr>
					</table>
				</div>
				<div class="inquiry_table">
					<form action="<c:url value='/product/admin/inquiryProductList' />" name="inquiry_list" method="post" enctype="multipart/form-data">
						<div>
							<img src="/resources/image/filter.png"/>
							<p>옵션</p>
						</div>
						<table>
						   <colgroup>
						      <col width="10%">
						      <col width="*">
						      <col width="15%">
						      <col width="15%">
						   </colgroup>
						   <tr>
						      <td>글번호</td>
						      <td>제 목</td>
						      <td>작성자</td>
						      <td>작성일</td>
						   </tr>
						   
						   <!-- a태그에서 데이터를 넘길때에는 ? 를 쓴다. 
						       boardNum이라는 글번호를 가지고 가겠다. -->
						      <!-- 게시글 개수만큼 만들어줘야한다.taglib만들어주고. -->
						      <c:forEach items="${list }" var="board">
						      <tr>
						          <td>${board.boardNum }</td>
						          <td><a href="boardDetail.do?boardNum=${board.boardNum }">${board.title }</a></td>
						          <td>${board.writer }</td>
						          <td>${board.createDate }</td>
						      </tr>
						      </c:forEach>
						         
						   
						</table>
						<input type="button" value="글쓰기" onclick="location.href='regBoardForm.do';">
					</form>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../../../views/footer.jsp" />
</body>
</html>