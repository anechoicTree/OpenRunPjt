<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>예시 예매하기 상품 </title>
<script>
$(document).on('click', '.reservation_list_content#p_name', function(e) {
    e.preventDefault();
    const p_no = $(this).prev("#p_no").text();
    console.log(p_no);
    window.location.href = "exProductDetail?p_no=" + p_no;
});
</script>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<c:forEach items="${exProduct}" var="exProduct">
	<div class="reservation_list_content" id="p_no" >${exProduct.p_no}</div>
	<div class="reservation_list_content" id="p_name">${exProduct.p_name}</div>
	<div class="reservation_list_content">${exProduct.p_perfo_start_date}</div>
	<div class="reservation_list_content">${exProduct.p_resev_end_date}</div>
</c:forEach>
<jsp:include page="../common/footer.jsp" />
</body>
</html>