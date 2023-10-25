<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:url value='/resources/common/createAccountAgreementForm.css'  var="css"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${css}" rel="stylesheet">
<title>판매자 회원가입 약관 동의</title>
</head>
<body>
	<jsp:include page="../loginHeader.jsp" />
	
	<div id="checkbox_group">
	
		<div id="maint_title">약관동의</div>
		<div id="checkbox_content">
  			<input type="checkbox" id="checkbox_all" class="checkbox">
  			<label id="check_all">약관전체 동의</label>
  			
  			<div id="main_content1">5opn Run 필수 동의 항목</div><br>
  		
  				<input type="checkbox" id="checkbox_1" class="checkbox" >
  				<label class="checkcontent" >[필수]이용약관 > </label><br>
  			
  				<input type="checkbox" id="checkbox_2" class="checkbox" >
  				<label class="checkcontent">[필수] 전자금융 거래 이용약관 ></label><br>
  			
  				<input type="checkbox" id="checkbox_3" class="checkbox" >
  				<label class="checkcontent">[필수] 개인정보 수집 동의서 ></label><br>
  				
  				<input type="checkbox" id="checkbox_4" class="checkbox"  >
  				<label class="checkcontent">[필수] 개인정보 제3자 제공 동의 ></label><br>
  		
  			<div id="main_content2">5opn Run 선택 동의 항목</div><br>	
  		
  				<input type="checkbox" id="checkbox_5" class="checkbox" >
  				<label class="checkcontent">[선택] 개인정보 수집 동의서 > </label><br>
  		
  				
  				<input type="checkbox" id="checkbox_6" class="checkbox" >
  				<label class="checkcontent">[선택] 위치기반 서비스 이용약관 ></label><br>
  		</div>
				<button  class="next_button"  onclick="Submit()">다음단계</button>
		
		</div>
	<div id="footer_nav">
		<jsp:include page="../common/footer.jsp" />
	</div>
	
	<script type="text/javascript">
        const checkboxAll = document.getElementById("checkbox_all");
        const checkboxes = document.querySelectorAll(".checkbox:not(#checkbox_all)");
        const nextButton = document.getElementById("next_button");

        checkboxAll.addEventListener("change", function () {
            checkboxes.forEach(function (checkbox) {
                checkbox.checked = checkboxAll.checked;
            });
        });

        checkboxes.forEach(function (checkbox) {
            checkbox.addEventListener("change", function () {
                if (!checkbox.checked) {
                    checkboxAll.checked = false;
                } else {
                    const allChecked = [...checkboxes].every((cb) => cb.checked);
                    checkboxAll.checked = allChecked;
                }
            });
        });
        
        function Submit() {
            const requiredCheckboxes = [
                document.getElementById("checkbox_1"),
                document.getElementById("checkbox_2"),
                document.getElementById("checkbox_3"),
                document.getElementById("checkbox_4")
            ];

            const allChecked = requiredCheckboxes.every((checkbox) => checkbox.checked);

            if (!allChecked) {
                alert("필수 동의 항목을 모두 선택해주세요");
            } else {
                location.href = "createSellerAccountForm";
            }
        }
    </script>
</body>
</html>