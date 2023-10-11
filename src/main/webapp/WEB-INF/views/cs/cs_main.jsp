<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/resources/main/css/main.css" var="css" />
<c:url value="/resources/common/css/nav_side.css" var="css2" />
<c:url value="/resources/cs/js/cs_sideNav.js" var="sideNave_js" />
<%@ include file="../common/commonCss.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객센터</title>
<link rel="stylesheet" href="${css}">
<link rel="stylesheet" href="${css2}">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:out value='${sideNav_js}' />"></script> 
<script type="text/javascript">

	// 각 카테고리 버튼에 대한 클릭 이벤트 리스너 추가
	const noticeUrlMap = {
		'general': '10',
        'system': '11',
    };

	const faqUrlMap = {
			'user': '1',
		    'fbook': '2',
		    'payment': '3',
		    'etc': '4',
	};
	
	const guideUrlMap = {
			'booking': '21',
			'payment': '22',
			'cancel': '23',
			'delivery': '24'
	};
	
	const buttonUrlMap = {
		'faq_btn': 'faq',
        'guide_btn': 'guide',
        'notice_btn': 'notice',
        'qna_btn': 'qna',
        // 다른 버튼들도 추가할 수 있습니다.
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
    
	<!-- [사이드 메뉴] 공지사항 하위 버튼 매핑 -->
	$(document).on('click', '#notice_general_btn', function() {
	    $('.category-btn[data-id="general"]').trigger('click');
	});
	
	$(document).on('click', '#notice_system_btn', function() {
	    $('.category-btn[data-id="system"]').trigger('click');
	});

    <!-- [사이드 메뉴] FAQ 하위 버튼 매핑 -->
	$(document).on('click', '#faq_user_btn', function() {
	    $('.category-btn[data-id="user"]').trigger('click');
	});
	
	$(document).on('click', '#faq_book_btn', function() {
	    $('.category-btn[data-id="fbook"]').trigger('click');
	});
	
	$(document).on('click', '#faq_payment_btn', function() {
	    $('.category-btn[data-id="payment"]').trigger('click');
	});
	
	$(document).on('click', '#faq_etc_btn', function() {
	    $('.category-btn[data-id="etc"]').trigger('click');
	});

	<!-- [사이드 메뉴] 이용 가이드 하위 버튼 매핑 -->
	$(document).on('click', '#guide_booking_btn', function() {
	    $('.category-btn[data-id="booking"]').trigger('click');
	});
	
	$(document).on('click', '#guide_payment_btn', function() {
	    $('.category-btn[data-id="payment"]').trigger('click');
	});
	
	$(document).on('click', '#guide_cancel_btn', function() {
	    $('.category-btn[data-id="cancel"]').trigger('click');
	});
	
	$(document).on('click', '#guide_delivery_btn', function() {
	    $('.category-btn[data-id="delivery"]').trigger('click');
	});
	
</script>

</head>
<body>
<!--  +"<td><input type='checkbox' name='_selected_all_'/></td>"+-->

    <%@ include file="../common/header.jsp" %>

    <!-- 상단 메뉴바 
    <div class="topnav">
        <a class="active" href="/admin/api">관리자 페이지</a>
        <input type="button" value="로그아웃" onclick="location.href='/logout'">
    </div>
    -->
    <!-- 사이드 메뉴바 -->
    <div class="body">
	    <div class="side">
	    	<div class="sidenav-container">
				<div class="sidenav-container-sub">
					<div class="sidenavtitle">고객센터</div>
					<div class="sidenavmenu">
						<div class="stitle" id="notice_btn">공지사항</div>
						<div class="ssub">
							<button id="notice_general_btn" class="indexbtn">일반</button>
							<button id="notice_system_btn" class="indexbtn">시스템</button>
						</div>
						<div class="stitle" id="guide_btn">이용 가이드</div>
						<div class="ssub">
							<button id="guide_booking_btn" class="indexbtn" >예매 방법</button>
							<button id="guide_payment_btn" class="indexbtn">결제 방법</button>
							<button id="guide_cancel_btn" class="indexbtn">취소/환불</button>
							<button id="guide_delivery_btn" class="indexbtn">배송/발권</button>
						</div>
						<div class="stitle" id="faq_btn" data-id="faq_btn">자주 묻는 질문</div>
						<div class="ssub">
							<button id="faq_user_btn" class="indexbtn">회원</button>
							<button id="faq_book_btn" class="indexbtn">예매</button>
							<button id="faq_payment_btn" class="indexbtn">결제</button>
							<button id="faq_etc_btn" class="indexbtn">기타</button>
						</div>
						<div class="stitle" id="qna_btn">1:1문의하기</div>
					</div>
					<div class="csbanner">
						<p>고객센터</p>
						<p>1588-4646</p>
						<p>평일/주말 11:00 ~ 24:00</p>
					</div>
				</div>
			</div>
	    </div>
	    <div class="view" id="view">
	    
		</div>    	
    </div>
    <%@ include file="../common/footer.jsp" %>
	
</body>
</html>