<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    // 공지사항 정보에서 카테고리 값을 가져옵니다.
    var categoryValue = "${notice.category}"; 

    // 카테고리 값에 따라 라디오 버튼 선택
    if (categoryValue === "일반") {
        document.getElementById("normalType").checked = true;
    } else if (categoryValue === "시스템") {
        document.getElementById("systemType").checked = true;
    }
    
    // 카테고리 넘버 설정
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
    }	
</script>
</head>
<body>
<form action="/ticket/notice/updateNotice" method="post">
    <br>
    <b><font size="6" color="gray">공지사항</font></b>
    <br>
    <table>
        <tr>
            <td class="title">
                유형
            </td>
            <td id="notice-category">
                <input type="radio" name="category" value="일반" id="normalType" checked onclick="setCategoryNo()">
                <label for="normalType">일반</label>
                
                <input type="radio" name="category" value="시스템" id="systemType" onclick="setCategoryNo()">
                <label for="systemType">시스템</label>
                
                <input type="hidden" id="categoryNo" name="categoryNo" value="10">
            </td>
        </tr>
        <tr>
            <td class="title">
                제목
            </td>
            <td id="notice-title">
                 <textarea name="title" cols="72" rows="1">${notice.title}</textarea>   
            </td>        
        </tr>
        <tr>
            <td id="notice-body">
                내용
            </td>
            <td>
                   <textarea name="body" cols="72" rows="20">${notice.body}</textarea>          
            </td>        
        </tr>

        <tr align="center" valign="middle">
            <td colspan="5">

                <input type="submit" value="등록" >
                <input type="button" value="취소" >            
            </td>
        </tr>
    </table>    
</form>
</body>
</html>
