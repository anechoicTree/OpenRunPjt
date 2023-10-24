<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/resources/common/css/sellerModifyProduct.css' />" rel="stylesheet" type="text/css">
<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
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
					<h3>상품 수정 요청</h3>
				</div>
				<div class="top_nav">
					<table>
						<tr>
							<th>상품등록</th>
							<th>상품 목록 조회</th>
							<th>상품 수정 요청</th>
						</tr>
					</table>
				</div>
				<div class="modify_product_form">
					<form action="<c:url value='/product/admin/modifyProductConfirm' />" name="modify_product_form" method="post" enctype="multipart/form-data">
						<div class="filebox">
							<input class="upload-name" value="상품이미지를 등록해주세요." placeholder="상품이미지를 등록해주세요." disabled>
							<label for="file">파일찾기</label>
							<input type="file" id="file" name="file" required>
						</div>
						<select name="p_category" class="select" required>
							<option value="" disabled selected>카테고리를 선택하세요.</option>
							<option value="1">뮤지컬</option>
							<option value="2">콘서트</option>
							<option value="3">연극</option>
							<option value="4">클래식/무용</option>
							<option value="5">전시/행사</option>
						</select>
						<select name="p_location" class="select" id="location" required>
							<option value="" disabled selected>공연지역을 선택해주세요.</option>
							<option value="1">전체</option>
							<option value="02">서울</option>
							<option value="031">경기</option>
							<option value="032">인천</option>
							<option value="033">강원</option>
							<option value="051">부산</option>
							<option value="053">대구</option>
							<option value="042">대전</option>
							<option value="052">울산</option>
							<option value="054">경북</option>
							<option value="055">경남</option>
							<option value="062">광주</option>
							<option value="043">충북</option>
							<option value="041">충남</option>
							<option value="063">전북</option>
							<option value="061">전남</option>
							<option value="064">제주</option>
						</select><br>
						
						<input type="date" name="p_perfo_start_date" value="공연 시작 일자를 선택해주세요."	 required> 
						<input type="date" name="p_perfo_end_date" value="공연 종료 일자를 선택해주세요." required> <br>
						
						<input type="date" name="p_resev_start_date" placeholder="예매 가능 일자를 선택해주세요." required> 
						<input type="date" name="p_resev_end_date" placeholder="예매 종료 일자를 선택해주세요." required> <br>
						
						<input type="time" name="p_resev_start_time" placeholder="예매 시작 시간을 선택해주세요." required> 
						<input type="time" name="p_resev_end_time" placeholder="예매 종료 시간을 선택해주세요." required> <br>
						
						<input type="text" name="p_viewing_grade" placeholder="관람등급을 입력해주세요." required> 
						<input type="text" name="p_viewing_time" placeholder="관람시간을 입력해주세요."> <br>
						
						<select name="p_hall" class="select" required>
							<option value="" disabled selected>공연장을 선택해주세요.</option>
							<option value="1 ">BLUE SQUARE</option>
							<option value="2">예술의 전당 </option>
							<option value="3">서울문화회관</option>
							<option value="4">중구문화재단</option>
						</select>
						<input type="text" name="p_seat_num" placeholder="좌석 수를 입력해주세요."> <br>
						<div id="left_only">
							<input type="text" name="p_seat_add" placeholder="좌석 등급을 추가하려면 버튼을 눌러주세요." > <br>
						</div>
						<input type="text" name="p_grade" placeholder="좌석 등급을 입력해주세요." required> 
						<input type="text" name="p_price" placeholder="좌석 금액을 입력해주세요." required> <br>
						<div class="inputTitle">
							<input type="text" name="p_name" placeholder="제목을 입력해주세요." required> <br>
						</div>
						<div>
							<textarea rows="5" cols="50" id="content" name = "p_content"></textarea>
							<script>
						    CKEDITOR.replace('content', { filebrowserUploadUrl : '${pageContext.request.contextPath}/adm/fileupload.do' });
						    CKEDITOR.instances.content.setData();
							</script>
						</div>
						<div id="buttons">
						<input type="submit" value="수정" onclick="modifyProductForm();"> 
						<input type="reset"	value="취소">
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