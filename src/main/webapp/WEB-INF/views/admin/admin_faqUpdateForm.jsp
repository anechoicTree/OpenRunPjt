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
    // 공지사항 정보에서 카테고리 값을 가져옵니다.
    var categoryValue = "${faq.category}"; 

    // 카테고리 값에 따라 라디오 버튼 선택
    if (categoryValue === "회원") {
        document.getElementById("user").checked = true;
    } else if (categoryValue === "예매") {
        document.getElementById("book").checked = true;
    } else if (categoryValue === "결제") {
    	document.getElementById("payment").checked = true;
    } else if (categoryValue === "기타") {
    	document.getElementById("etc").checked = true;
    }
    
	function setCategoryNo() {
	    var categoryRadioButtons = document.getElementsByName("category");
	    var selectedCategoryNo = 0; // 기본값으로 0을 설정
	
	    // 라디오 버튼에서 선택된 카테고리를 찾아서 categoryNo를 설정
	    for (var i = 0; i < categoryRadioButtons.length; i++) {
	        if (categoryRadioButtons[i].checked) {
	            switch (categoryRadioButtons[i].value) {
	                case "회원":
	                    selectedCategoryNo = 1;
	                    break;
	                case "예매":
	                    selectedCategoryNo = 2;
	                    break;
	                case "결제":
	                    selectedCategoryNo = 3;
	                    break;
	                case "기타":
	                    selectedCategoryNo = 4;
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
        $('#faq_btn').trigger('click');
    });

    $(document).off('click', '#form-submit-btn').on('click', '#form-submit-btn', function(e) {
        e.preventDefault(); // 기본 제출 동작 방지
        
        $.ajax({
            url: '/ticket/faq/updateFaq',
            type: 'POST',
            data: $('form').serialize(),
            success: function(response) {
                if (response == "success") {
                    $('#faq_btn').trigger('click'); // Success 응답시 버튼 클릭 동작 수행
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
<form action="/ticket/faq/updateFaq" method="post">
    <div id="cs-board-title">
		<span>자주 묻는 질문 수정</span>
	</div>
	<div id="input-form-container">
    <table class="input-table" id="faq-input-table">
        <tr>
            <td class="input-title">
                유형
            </td>
            <td class="input-content" id="faq-category">
                <input type="radio" name="category" value="회원" id="user" checked  onclick="setCategoryNo()">
                <label for="user">회원</label>
                
           		<input type="radio" name="category" value="예매" id="book"  onclick="setCategoryNo()">
                <label for="book">시스템</label>
                
                <input type="radio" name="category" value="결제" id="payment"  onclick="setCategoryNo()">
                <label for="payment">결제</label>
                
                <input type="radio" name="category" value="기타" id="etc"  onclick="setCategoryNo()">
                <label for="etc">기타</label>
                
                <input type="hidden" id="categoryNo" name="categoryNo" value="1">
                <input type="hidden" name="faqNo" value="${faq.faqNo}">
            </td>
        </tr>
        <tr>
            <td class="input-title">
                제목
            </td>
            <td class="input-content">
                 <textarea id="textarea-title" name="title" cols="72" rows="1">${faq.title}</textarea>   
            </td>        
        </tr>
        <tr>
            <td class="input-title" id="faq-body">
                내용
            </td>
            <td class="input-content">
                <textarea id="textarea-body" name="body" cols="72" rows="20">${faq.body}</textarea>          
            </td>        
        </tr>

        <tr align="right" valign="middle">
            <td colspan="5">
                <input class="form-btn" id="form-submit-btn" type="submit" value="수정" >
                <input class="form-btn" id="form-cancel-btn" type="button" value="취소" >             
            </td>
        </tr>
    </table>
    </div>    
</form>
</body>
</html>
