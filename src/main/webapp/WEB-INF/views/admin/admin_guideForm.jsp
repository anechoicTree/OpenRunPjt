<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/cs/css/admin_cs.css" var="css" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${css}">

<script>

function setCategoryNo() {
    var categoryRadioButtons = document.getElementsByName("category");
    var selectedCategoryNo = 0; // 기본값으로 0을 설정

    // 라디오 버튼에서 선택된 카테고리를 찾아서 categoryNo를 설정
    for (var i = 0; i < categoryRadioButtons.length; i++) {
        if (categoryRadioButtons[i].checked) {
            switch (categoryRadioButtons[i].value) {
                case "예매":
                    selectedCategoryNo = 21;
                    break;
                case "결제":
                    selectedCategoryNo = 22;
                    break;
                case "취소":
                    selectedCategoryNo = 23;
                    break;
                case "배송":
                    selectedCategoryNo = 23;
                    break;
                default:
                    selectedCategoryNo = 0; // 다른 경우에 대한 기본값
                    break;
            }
        }
    }
    // 설정된 categoryNo를 숨겨진 필드에 설정
    document.getElementById("categoryNo").value = selectedCategoryNo;
}	


	$(document).on('click', '#form-cancel-btn', function() {
	    $('#guide_btn').trigger('click');
	});
	
	$(document).off('click', '#form-submit-btn').on('click', '#form-submit-btn', function(e) {
	    e.preventDefault(); // 기본 제출 동작 방지

	    var formData = new FormData($('form')[0]); // FormData 객체를 사용하여 폼 데이터를 가져옵니다.

	    $.ajax({
	        url: '/ticket/guide/insertGuide',
	        type: 'POST',
	        data: formData,
	        processData: false, // 데이터 처리 방식을 false로 설정
	        contentType: false, // 컨텐츠 타입을 false로 설정
	        success: function(response) {
	            if (response == "success") {
	                $('#guide_btn').trigger('click'); // Success 응답시 버튼 클릭 동작 수행
	                $('form')[0].reset(); // 폼 초기화
	            } else {
	                alert('Failed to submit form'); // 다른 응답시 알림 표시
	            }
	        },
	        error: function() {
	            alert('Error occurred while submitting the form');
	        }
	    });
	});



</script>
</head>
<body>
<form action="/ticket/guide/insertGuide" method="post" enctype="multipart/form-data">
	<div id="cs-board-title">
		<span>이용 가이드 등록</span>
	</div>
    <div id="input-form-container">
    <table class="input-table" id="guide-input-table">
        <tr>
            <td class="input-title">
                유형
            </td>
            <td class="input-content" id="guide-category">
                <input type="radio" name="category" value="예매" id="bookType" checked onclick="setCategoryNo()">
                <label for="bookType">예매 방법</label>
                
                <input type="radio" name="category" value="결제" id="paymentType" onclick="setCategoryNo()">
                <label for="paymentType">결제 방법</label>
                
                <input type="radio" name="category" value="취소" id="cancelType" onclick="setCategoryNo()">
                <label for="cancelType">취소/환불</label>
                
                <input type="radio" name="category" value="배송" id="deliveryType" onclick="setCategoryNo()">
                <label for="deliveryType">배송/발권</label>
                
                <input type="hidden" id="categoryNo" name="categoryNo" value="21">
            </td>
        </tr>

        <tr>
            <td class="input-title">
                이미지 업로드
            </td>
            <td class="input-content">
                <input type="file" name="guideImage" accept="image/*" required>
            </td>
        </tr>


        <tr align="right" valign="middle">
            <td colspan="5">
                <input class="form-btn" id="form-submit-btn" type="submit" value="등록" >
                <input class="form-btn" id="form-cancel-btn" type="button" value="취소" >           
            </td>
        </tr>
    </table> 
    </div>   
</form>
</body>
</html>
