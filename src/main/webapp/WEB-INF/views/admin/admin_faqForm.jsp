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
	            // 디버그: 선택된 categoryNo를 콘솔에 출력
	            console.log("Selected CategoryNo: " + selectedCategoryNo);
	        }
	    }
	    // 설정된 categoryNo를 숨겨진 필드에 설정
	    document.getElementById("categoryNo").value = selectedCategoryNo;
	    console.log(document.getElementById("categoryNo").value);
	}	
</script>

</head>
<body>
<form action="/ticket/faq/insertFaq" method="post">
	<div id="cs-board-title">
		<span>자주 묻는 질문</span>
	</div>
	<div id="input-form-container">
    <table class="input-table">
        <tr>
            <td class="input-title">
                유형
            </td>
            <td class="input-content" id="faq-category">
                <input type="radio" name="category" value="회원" id="user" checked onclick="setCategoryNo()">
                <label for="user">회원</label>
                
                <input type="radio" name="category" value="예매" id="book" onclick="setCategoryNo()">
                <label for="book">예매</label>
                
                <input type="radio" name="category" value="결제" id="payment" onclick="setCategoryNo()">
                <label for="payment">결제</label>
                
                <input type="radio" name="category" value="기타" id="etc" onclick="setCategoryNo()">
                <label for="etc">기타</label>
                
				<input type="hidden" id="categoryNo" name="categoryNo" value="1">
            </td>
        </tr>
        <tr>
            <td class="input-title">
                제목
            </td>
            <td class="input-content">
                 <textarea id="textarea-title" name="title" cols="72" rows="1"></textarea>     
            </td>        
        </tr>
        <tr>
            <td class="input-title" id="faq-body">
                내용
            </td>
            <td class="input-content">
                 <textarea id="textarea-body" name="body" cols="72" rows="24"></textarea>          
            </td>        
        </tr>

        <tr align="center" valign="middle">
            <td colspan="5">

                <input type="submit" value="등록" >
                <input type="button" value="취소" >            
            </td>
        </tr>
    </table>    
    </div>
</form>
</body>
</html>
