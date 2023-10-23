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

</head>
<body>
	<div id="cs-container">
		<div id="cs-board">         
			<div id="cs-board-title">
				<span>1:1 문의 상세 조회</span>
			</div>
		</div>
	</div>
	<form action="/ticket/admin/answerQna" method="post">
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
	                 <textarea class="textarea-title" name="title" cols="72" rows="1"> </textarea>     
	            </td>        
	        </tr>
	        <tr>
	            <td class="input-title" id="qna-body-title" colspan="4">본문</td>
	        </tr>
	        <tr>
	           <td class="input-content-body" colspan="4">
	                <textarea id="answerBody" name="body" cols="72" rows="18"></textarea>
	                <script>
						CKEDITOR.replace('answerBody', { 
							removePlugins: 'elementspath',
					        resize_enabled: false,
				        });
						CKEDITOR.instances.answerBody.setData();
					</script>        
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