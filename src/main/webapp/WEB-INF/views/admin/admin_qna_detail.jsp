<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/cs/css/admin_cs.css" var="css" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[고객센터] 1:1 문의</title>
    <link rel="stylesheet" href="${css}">
    <script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
	    $(document).ready(function() {
	    	
			var isSubmitting = false; // 중복 제출을 체크하기 위한 Flag
			
	        $('form').on('submit', function(event) {
	            event.preventDefault(); // 기본 form 전송 동작을 중지
	
	            // 이미 요청이 진행 중이라면 중복 요청을 방지
	            if (isSubmitting) {
	                alert('이미 전송 중입니다. 잠시만 기다려주세요.');
	                return;
	            }
	            
	            var email = "${qna.email}"; // JSP에서 불러온 데이터
	            var title = $('#answerTitle').val();
	            var body = $('#answerBody').val();
	            
	         	// 요청 시작 전 Flag를 true로 설정
	            isSubmitting = true;
	         
	            $.ajax({
	                url: '/ticket/admin/qna/answerQna',
	                type: 'POST',
	                dataType: 'json',
	                data: {
	                    email: email,
	                    title: title,
	                    body: body
	                },
	                success: function(response) {
	                    if(response.status === 'success') {
	                    	$('#qna_btn').trigger('click'); // Success 응답시 버튼 클릭 동작 수행
	                        alert('전송 완료!');
	                        
	                    } else {
	                        alert('전송 실패');
	                    }
	                 	// 요청 완료 후 Flag를 false로 설정
	                    isSubmitting = false;
	                },
	                error: function(error) {
	                    alert('전송 실패: 서버에 문제가 발생했습니다.');
	                    // 에러 발생 시 Flag를 false로 설정
	                    isSubmitting = false;
	                },
	                complete: function() {
	                    // 요청 완료 후 Flag를 false로 설정
	                    isSubmitting = false;
	                }
	            });
	        });
	    });

	</script>

</head>
<body>
	<div id="cs-container">
		<div id="cs-board">         
			<div id="cs-board-title">
				<span>1:1 문의 상세 조회</span>
			</div>
		</div>
	</div>
	<form action="/ticket/admin/qna/answerQna" method="post">
    <div class="input-form-container">
	   <table class="input-table">
   			<tr>
   				<td class="input-title" colspan="4">문의</td>
   			</tr>
	        <tr>
	            <td class="input-title">이메일</td>
	            <td class="input-content" id="qna-category" colspan="3">${qna.email}</td>
	        </tr>
	        <tr>
	            <td class="input-title">유형</td>
	            <td class="input-content" colspan="3">${qna.category}</td> 
	        </tr>
	        <tr>
	            <td class="input-title">등록일</td>
	            <td class="input-content" colspan="3">${qna.regDate}</td>        
	        </tr>
	        <tr>
	            <td class="input-title">제목</td>
	            <td class="input-content" colspan="3">${qna.title}</td>
	        </tr>
	        <tr>
	            <td class="input-title" colspan="4">본문</td>
	        </tr>
	        <tr>
	            <td class="input-content" id="qna-q-body" colspan="4">${qna.body}</td> 
	        </tr>
			<tr class="contour-line"></tr>
     		<tr>
				<td class="input-title" colspan="4">답변</td>
			</tr>
	        <tr>
	            <td class="input-title">제목</td>
	            <td class="input-content" colspan="3">
	                 <textarea class="textarea-title" id="answerTitle" name="title" cols="72" rows="1"></textarea>     
	            </td>        
	        </tr>
	        <tr>
	            <td class="input-title" id="qna-body-title" colspan="4">본문</td>
	        </tr>
	        <tr>
	           <td class="input-content-body" colspan="4">
	                <textarea id="answerBody" name="body" cols="72" rows="18"></textarea>
	            </td>    
	        </tr>
	        
	        <tr align="right" valign="middle">
	            <td colspan="4">
	                <input class="form-btn" type="submit" value="전송" >
	                <input class="form-btn" id="form-cancel-btn" type="button" value="취소" onclick="goBack()">            
	            </td>
	        </tr>
		    </table>
	    </div>
	</form> 
</body>
</html>