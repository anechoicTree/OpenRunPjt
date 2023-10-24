<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/resources/common/css/sellerInquiryAnswer.css' />" rel="stylesheet" type="text/css">
<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
			<script>
			    function registerInquiryForm() {
			        CKEDITOR.instances.i_answer.updateElement();
			        document.register_inquiry_form.submit();
			    }
			</script>
</head>
<body>
	<jsp:include page="../../../views/header.jsp" />

	<section>
		<div id="section_wrap">
			<div>
				<jsp:include page="../../seller/seller_nav_side.jsp"/>
			</div>
			<form action="<c:url value='/product/seller/registerInquiryConfirm' />" name="register_inquiry_form" method="post">
				<input type="hidden" name="i_no" value="${productQnaVO.i_no}" />
				<table>
					<tr>
						<th>번호</th>
						<td>${productQnaVO.i_no}</td>
						<th>작성일</th>
						<td>${productQnaVO.i_regdate}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${productQnaVO.i_title}</td>
					</tr>
					<tr>
						<th>문의내용</th>
					</tr>
					<tr>
						<td>${productQnaVO.i_content}</td>
					</tr>
				
					<tr>
						<th>문의답변</th>
					</tr>
					<tr>
						<td>
							<textarea rows="5" cols="50" id="i_answer" name = "i_answer"></textarea>
							<script>
						    CKEDITOR.replace('i_answer', { filebrowserUploadUrl : '${pageContext.request.contextPath}/adm/fileupload.do' });
							</script>
						</td>
					<tr>
				</table>
			</form>
			<div id="buttons">
				<input type="submit" value="등록" onclick="registerInquiryForm();"> 
				<!-- <button type="submit" onclick="registerInquiryForm()">등록</button> -->
				<button type="reset">취소</button>
			</div>
		</div>
	</section>
	<jsp:include page="../../../views/footer.jsp" />
</body>
</html>