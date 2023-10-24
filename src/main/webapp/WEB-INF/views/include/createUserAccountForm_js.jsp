<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

	function createUserAccountForm() {
		console.log('createUserAccountForm() 입력완료');
		
		let form = document.createUserAccountForm;
		
		if (form.u_id.value == '') {
			alert('아이디를 입력해주세요')
			form.u_id.focus();
			
		} else if (form.u_pw.value == '') {
			alert('비밀번호를 입력해주세요');
			form.u_pw.focus();
			
		} else if (form.u_pw_again.value == '') {
			alert('비밀번호 확인을 입력해주세요');
			form.u_pw_again.focus();
			
		} else if (form.u_pw.value != form.u_pw_again.value) {
			alert('비밀번호와 비밀번호 확인의 입력값이 다릅니다');
			form.u_pw.focus();
			
		} else if (form.u_name.value == '') {
			alert('이름을 입력해주세요');
			form.u_name.focus();
			
		} else if (form.u_birth.value == '') {
			alert('생일을 입력해주세요.');
			form.u_birth.focus();
			
		} else if (form.u_address.value == '') {
			alert('주소를 입력해주세요.');
			form.u_address.focus();
			
		} else if (form.u_phone.value == '') {
			alert('휴대폰 번호를 입력해주세요');
			form.u_phone.focus();
			
		} /* else if (form.a_m_mail.value == '') {
		alert('인증번호를 입력해주세요.');
		form.a_m_mail.focus();
		
		} */
			else if (form.u_email.value == '') {
			alert('이메일을 입력해주세요');
			form.u_email.focus();
			
		} else if (form.u_bank_name.value == '') {
			alert('은행을 선택해주세요');
			form.u_bank_name.focus();
			
		} else if (form.u_account_no.value == '') {
			alert('계좌번호를 입력해주세요');
			form.u_account_no.focus();	
		}else {
			form.submit();
			
		}
		
	}

</script>