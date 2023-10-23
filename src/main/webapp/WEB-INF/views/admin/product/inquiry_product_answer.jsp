<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/resources/common/css/sellerInquiryAnswer.css' />" rel="stylesheet" type="text/css">
<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
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
							<th>답변 작성</th>
						</tr>
					</table>
				</div>
				<div class="inquiry_product_form">
					<form action="<c:url value='/product/admin/inquiryProductAnswer' />" name="inquiry_product_answer" method="post" enctype="multipart/form-data">
						<div>
							글번호 : ${board.boardNum }<br>
							제목 : ${board.title } <br>
							내용 : ${board.content }<br>
							작성자 : ${board.writer }<br>
							작성일 : ${board.createDate }<br>
							 
							<input type="button" value="삭제하기" onclick="location.href='delete.do?boardNum=${board.boardNum }';">
							<!-- 어떤걸 삭제할건지 보드 번호를 가져가야해서 ?뒤에 문장이나옴. -->
							<input type="button" value="수정" onclick="location.href='updateBoardForm.do?boardNum=${board.boardNum }';">
							<!-- 상세보기 페이지로 넘어갈때도 글번호 데이터를 넘겨서 가져가야해서 ?뒤에 문장을쓴다. -->
						</div>
						<div>
							<textarea rows="5" cols="50" id="editor1" name = "editor"></textarea>
							<script>
	               		         CKEDITOR.replace( 'editor1' );
							</script>
						</div>
					</form>
				</div>

			</div>
		</div>
	</section>
	<jsp:include page="../../../views/footer.jsp" />
	
	
	
	<script type="text/javascript">
		$("#file").on('change',function(){
			  var fileName = $("#file").val();
			  $(".upload-name").val(fileName);
			});
	</script>
</body>
</html>