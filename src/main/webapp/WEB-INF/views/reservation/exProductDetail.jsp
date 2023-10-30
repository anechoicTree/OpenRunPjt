<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>예시 예매하기 상품 리스트 </title>
<script>
$(document).ready(function() {
	$(document).on("click", "#button", function() {
    // 결제 버튼 클릭 시
        // 선택한 상품 정보를 데이터 속성에서 읽기
        var p_no = $(this).data('p_no');
    	console.log(p_no);
        window.location.href = "payment?p_no=" + p_no;
    });
});
</script>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<c:forEach items="${exProductDetail}" var="exProductDetail">
    <div class="product-item">
        <div class="product-name" data-product-name="${exProductDetail.p_name}">${exProductDetail.p_name}</div>
        <div class="product-location" data-product-location="${exProductDetail.p_location}">${exProductDetail.p_location}</div>
        <div class="product-start-date" data-product-start-date="${exProductDetail.p_perfo_start_date}">${exProductDetail.p_perfo_start_date}</div>
        <div class="product-price" data-product-price="${exProductDetail.p_price}">${exProductDetail.p_price}</div>
      <button class="pay-button" id="button" data-p_no="${exProductDetail.p_no}">결제하기</button>
    </div>
</c:forEach>
<jsp:include page="../common/footer.jsp" />
</body>
</html>