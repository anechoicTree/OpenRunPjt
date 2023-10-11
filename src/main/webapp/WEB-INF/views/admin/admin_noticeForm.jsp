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
                case "일반":
                    selectedCategoryNo = 10;
                    break;
                case "시스템":
                    selectedCategoryNo = 11;
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

console.log(document.getElementById("categoryNo").value);
</script>
</head>
<body>
<form action="/ticket/notice/insertNotice" method="post">
	<div id="cs-board-title">
		<span>공지사항</span>
	</div>
    <div id="input-form-container">
    <table class="input-table" id="notice-input-table">
        <tr>
            <td class="input-title">
                유형
            </td>
            <td class="input-content" id="notice-category">
                <input type="radio" name="category" value="일반" id="normalType" checked onclick="setCategoryNo()">
                <label for="normalType">일반</label>
                
                <input type="radio" name="category" value="시스템" id="systemType" onclick="setCategoryNo()">
                <label for="systemType">시스템</label>
                
                <input type="hidden" id="categoryNo" name="categoryNo" value="10">
            </td>
        </tr>
        <tr>
            <td class="input-title">
                제목
            </td>
            <td class="input-content">
                 <textarea id="textarea-title"  name="title" cols="72" rows="1"> </textarea>     
            </td>        
        </tr>
        <tr>
            <td class="input-title" id="notice-body">
                내용
            </td>
            <td class="input-content">
                 <textarea id="textarea-body" name="body" cols="72" rows="24"> </textarea>          
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
