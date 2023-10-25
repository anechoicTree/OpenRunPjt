<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

	function createSellerAccountForm() {
		console.log('createSellerAccountForm() 입력완료');
		
		let form = document.createSellerAccountForm;
		
		if (form.s_id.value == '') {
			alert('아이디를 입력해주세요');
			form.s_id.focus();
			
		} else if (form.s_pw.value == '') {
			alert('비밀번호를 입력해주세요');
			form.s_pw.focus();
			
		} else if (form.s_pw_again.value == '') {
			alert('비밀번호 확인을 입력해주세요');
			form.s_pw_again.focus();
			
		} else if (form.s_pw.value != form.s_pw_again.value) {
			alert('비밀번호와 비밀번호 확인의 입력값이 다릅니다');
			form.s_pw.focus();
			
		} else if (form.s_business_name.value == '') {
			alert('사업자명을 입력해주세요');
			form.s_business_name.focus();
			
		} else if (form.s_business_reg_no.value == '') {
			alert('사업자 등록번호를 입력해주세요.');
			form.s_business_reg_no.focus();
			
		} else if (form.s_phone.value == '') {
			alert('휴대폰 번호를 입력해주세요');
			form.s_phone.focus();
			
		} /* else if (form.a_m_mail.value == '') {
			alert('인증번호를 입력해주세요.');
			form.a_m_mail.focus();
			
		} */
			else if (form.s_email.value == '') {
			alert('이메일을 입력해주세요.');
			form.s_email.focus();
			
		}else {
			form.submit();
			
		}
		
	}

</script>