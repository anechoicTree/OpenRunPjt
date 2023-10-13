	const buttonUrlMap = {
		'faq_btn': '/ticket/admin/faq',
        'guide_btn': '/ticket/admin/guide',
        'notice_btn': '/ticket/admin/notice',
        'qna_btn': '/ticket/admin/qna',
        'sellerApproval_btn': '/ticket/admin/seller',
        'notice-create-btn': 'noticeForm',
        'notice-update-btn': 'noticeUpdateForm',
        'notice-delete-btn': 'noticeDelete'
    };
    
	const faqUrlMap = {
		'user': '1',
        'book': '2',
        'payment': '3',
        'etc': '4'
    };
    
	const noticeUrlMap = {
		'general': '10',
        'system': '11',
    };
    
	const guideUrlMap = {
		'book': '21',
	    'payment': '22',
	    'cancel': '23',
	    'delivery': '24'
    };
	
	const cudUrlMap = {
        'notice-create-btn': '/ticket/notice/noticeForm',
        'faq-create-btn': '/ticket/faq/faqForm',
        'guide-create-btn': '/ticket/guide/guideForm'
    };


    $(document).on('click', '.stitle', function() {
    	const buttonId = $(this).attr('id');
    	const url = buttonUrlMap[buttonId];
       	if (url) {
       	// Ajax 요청을 보냅니다.
       		$.ajax({
	            type: 'GET', // GET 요청 사용
	            url: url, // 로드할 파일의 경로
	            success: function(data) {
	                // 성공적으로 응답을 받았을 때 실행되는 콜백 함수
	                $('#view').html(data); // div 내용을 응답 데이터로 업데이트
	            },
	            error: function() {
	                // 오류 발생 시 실행되는 콜백 함수
	                alert('파일을 로드하는 동안 오류가 발생했습니다.');
	            }
       		});
       	}
    });
    
    	// 작성 버튼    
    $(document).on('click', '.cud-btn', function() {
    	const buttonId = $(this).attr('id');
    	const url = cudUrlMap[buttonId];
       	if (url) {
       	// Ajax 요청을 보냅니다.
       		$.ajax({
	            type: 'GET', // GET 요청 사용
	            url: url, // 로드할 파일의 경로
	            success: function(data) {
	                // 성공적으로 응답을 받았을 때 실행되는 콜백 함수
	                $('#view').html(data); // div 내용을 응답 데이터로 업데이트
	            },
	            error: function() {
	                // 오류 발생 시 실행되는 콜백 함수
	                alert('파일을 로드하는 동안 오류가 발생했습니다.');
	            }
       		});
       	}
    });
		

	