<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/seller/sellerWithdrawalOk.css'  var="css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>판매자 회원탈퇴 비밀번호 확인</title>
</head>
<body>
<script>
$(document).ready(function() {
    $(document).on("click", "#sellerWithdrawalButton", function(e) {
        e.preventDefault();
        
        var s_pw = $("#s_pw").val();
        var seller_no = ${sellerLoginResult.seller_no};
        
        console.log("s_pw:", s_pw); 
        console.log("seller_no:", seller_no);
        
        $.ajax({
            type: "POST",
            url: "withdrawalOk",
            data: { s_pw:s_pw, seller_no:seller_no }, 
            contentType: "json",
            success: function(result) {
                if (result === '1'){
                    alert("정상적으로 탈퇴 되었습니다");
                    window.location.href = "/ticket";
                } else {
                    alert("탈퇴 실패");
                }
            }
        });
    });
});

</script>
<jsp:include page="../header.jsp" />
	<div id="main_nav">
	<div id="main_nav_container">
		<jsp:include page="../seller/seller_nav_side.jsp" />
		<div id="main_nav_sub">
			<div id="main_title">회원 탈퇴 비밀번호 확인</div>
			<div id="main_content_sub">
			<form name="sellerWithdrawal" action="<c:url value='/product/admin/withdrawalOk' />" method="POST" >
				<div id="withdrawal_nav">
					<div id="withdrawal_content">
						<div id="withdrawal_content1">비밀번호
							<input class="input_text" type="password" id="s_pw" name="s_pw" placeholder="8~12자 영문, 숫자, 특수문자"><br>
						</div>
					</div>
					<button class="next_button" id="sellerWithdrawalOkButton" type="submit">확인</button>
				</div>
			</form>
			</div>
		</div>
	</div>
	</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>