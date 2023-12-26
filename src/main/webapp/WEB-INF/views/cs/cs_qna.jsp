<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/cs/css/cs.css" var="css" />
<c:url value="/resources/common/js/commonJs.js" var="commonJs" />

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>[고객센터] 1:1 문의 </title>
	
	<link rel="stylesheet" href="${css}">
	
	<script src="${commonJs}"></script> 
	<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
	<script>
	function setCategoryNo() {
	    var categoryRadioButtons = document.getElementsByName("category");
	    var selectedCategoryNo = 0; // 기본값으로 0을 설정
	
	    // 라디오 버튼에서 선택된 카테고리를 찾아서 categoryNo를 설정
	    for (var i = 0; i < categoryRadioButtons.length; i++) {
	        if (categoryRadioButtons[i].checked) {
	            switch (categoryRadioButtons[i].value) {
	                case "회원":
	                    selectedCategoryNo = 91;
	                    break;
	                case "시스템":
	                    selectedCategoryNo = 92;
	                    break;
	                case "예매":
	                    selectedCategoryNo = 93;
	                    break;
	                case "결제":
	                    selectedCategoryNo = 94;
	                    break;
	                case "기타":
	                    selectedCategoryNo = 95;
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
	}	
	
	function validateForm() {
	    // 이메일 및 제목 필드의 값을 가져옴
	    var email = document.getElementsByName("email")[0].value.trim();
	    var title = document.getElementsByName("title")[0].value.trim();
	    var body = CKEDITOR.instances.textareaBody.getData().trim();
	    // 이메일 필드가 비어있는지 확인
	    if(email === "") {
	        alert("이메일을 입력해 주세요.");
	        return false; // 폼 제출을 차단
	    }
	    // 제목 필드가 비어있는지 확인
	    if(title === "") {
	        alert("제목을 입력해 주세요.");
	        return false; 
	    }
		// 본문 필드가 비어있는지 확인
	    if(body === "") {
	        alert("내용을 입력해 주세요.");
	        return false; 
	    }
	    // 모든 검사를 통과하면, true를 반환하여 폼 제출을 진행
	    return true;
	}

	</script>
</head>
<body>
<!-- onsubmit : return이 true면 전송 -->
<form action="/ticket/cs/insertQna" method="post" onsubmit="return validateForm();">
	<div id="cs-board-title">
		<span>1:1 문의 접수</span>
	</div>
    <div id="input-form-container">
    <table class="input-table" id="qna-input-table">
        <tr>
            <td class="input-title">
                유형
            </td>
            <td class="input-content" id="qna-category">
                <input type="radio" name="category" value="회원" id="q_user" checked onclick="setCategoryNo()">
                <label for="q_user">일반</label>
                
                <input type="radio" name="category" value="시스템" id="q_system" onclick="setCategoryNo()">
                <label for="q_system">시스템</label>
                
                <input type="radio" name="category" value="예매" id="q_book" onclick="setCategoryNo()">
                <label for="q_book">예매</label>
                
                <input type="radio" name="category" value="결제" id="q_payment" onclick="setCategoryNo()">
                <label for="q_payment">결제</label>
                
                <input type="radio" name="category" value="기타" id="q_etc" onclick="setCategoryNo()">
                <label for="q_etc">기타</label>
                
                <input type="hidden" id="categoryNo" name="categoryNo" value="91">
            </td>
        </tr>
        <tr>
            <td class="input-title">
                이메일
            </td>
            <td class="input-content">
                 <input type="email" class="textarea-title" name="email" size="72" placeholder="example@email.com">     
            </td>        
        </tr>
        <tr>
            <td class="input-title">
                제목
            </td>
            <td class="input-content">
                <textarea class="textarea-title" name="title" cols="72" rows="1"></textarea>     
            </td>        
        </tr>
        <tr>
            <td class="input-title" id="qna-body-title" colspan="2">
                내용
            </td>
        </tr>
        <tr>
           <td class="input-content-body" colspan="2">
                <textarea id="textareaBody" name="body" cols="72" rows="18"></textarea>
                <script>
					CKEDITOR.replace('textareaBody', { 
						removePlugins: 'elementspath, save, font, newpage, preview, print',
				        resize_enabled: false,
				        enterMode: CKEDITOR.ENTER_BR
			        });
					CKEDITOR.instances.textareaBody.setData();
				</script>        
            </td>    
        </tr>

        <tr align="right" valign="middle">
            <td colspan="5">
                <input class="form-btn" type="submit" value="접수" >
                <input class="form-btn" id="form-cancel-btn" type="button" value="취소" onclick="goBack()">            
            </td>
        </tr>
    </table> 
    </div>   
</form>
</body>
</html>