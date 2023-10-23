<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/cs/css/admin_cs.css" var="css" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[고객센터] 판매자 승인</title>
    <link rel="stylesheet" href="${css}">
    <script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>

</head>
<body>
	<div id="cs-container">
		<div id="cs-board">         
			<div id="cs-board-title">
				<span>판매자 승인 - 상세 조회</span>
			</div>
		</div>
	</div>
	<form action="/ticket/admin/answerQna" method="post">
    <div class="input-form-container">
	   <table class="input-table">
   			<tr>
   				<td class="input-title" colspan="4">판매자 정보</td>
   			</tr>
	        <tr>
	            <td class="input-title">판매자ID</td>
	            <td class="input-content" id="qna-category" colspan="3">${seller.s_id}</td>
	        </tr>
	        <tr>
	            <td class="input-title">사업자명</td>
	            <td class="input-content" colspan="3">${seller.s_business_name}</td> 
	        </tr>
	        <tr>
	            <td class="input-title">사업자번호</td>
	            <td class="input-content" colspan="3">${seller.s_business_reg_no}</td>        
	        </tr>
	        <tr>
	            <td class="input-title">주소</td>
	            <td class="input-content" colspan="3">${seller.s_address}</td>
	        </tr>
	        <tr>
	            <td class="input-title">전화번호</td>
	            <td class="input-content" colspan="3">${seller.s_phone}</td>
	        </tr>
    	    <tr>
	            <td class="input-title">이메일</td>
	            <td class="input-content" colspan="3">${seller.s_email}</td>
	        </tr>
          	<tr>
	            <td class="input-title">은행명</td>
	            <td class="input-content" colspan="3">${seller.s_bank_name}</td>
	        </tr>
	        <tr>
	            <td class="input-title">계좌번호</td>
	            <td class="input-content" colspan="3">${seller.s_account_no}</td>
	        </tr>
	        <tr>
	            <td class="input-title">가입일</td>
	            <td class="input-content" colspan="3">${seller.s_join_date}</td>
	        </tr>
	        <tr>
	            <td class="input-title">등급</td>
	            <td class="input-content" colspan="3">${seller.s_level}</td>
	        </tr>
	        
	        <tr align="right" valign="middle">
	            <td colspan="4">
	                <input class="form-btn" type="submit" value="승인" >
	                <input class="form-btn" id="form-cancel-btn" type="button" value="취소" onclick="goBack()">            
	            </td>
	        </tr>
		    </table>
	    </div>
	</form> 
</body>
</html>