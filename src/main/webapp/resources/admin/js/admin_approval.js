	$(document).on('click', '.seller-link', function() {
		event.preventDefault(); // 기본 동작 중지 : 해시('#')이 추가되지 않고 주소 유지 가능
	    const sellerId = $(this).data('seller-id');
	    
	    // Ajax 요청을 보냅니다.
	    $.ajax({
	        type: 'GET',
	        url: '/ticket/cs/seller/detail?sellerNo=' + sellerId, // 공지사항 상세 정보를 가져오는 URL로 변경
	        success: function(data) {
	            $('#view').html(data); // div 내용을 응답 데이터로 업데이트
	        },
	        error: function() {
	            // 오류 발생 시 실행되는 콜백 함수
	            //alert('파일을 로드하는 동안 오류가 발생했습니다.');
	        }
	    });
	});
	
function changePage(page) {
    $.ajax({
        type: 'GET',
        url: "/ticket/admin/seller/listSellers?page=" + page,
        success: function(data) {
            $('#view').html(data);
            updatePageButtons(page); // 페이지 버튼 업데이트 함수 호출
        },
        error: function() {
            alert('페이지를 이동할 수 없습니다.');
        }
    });
}

function updatePageButtons(currentPage) {

    // 이전 페이지로 이동하는 버튼 활성화 여부 결정
    if (currentPage <= 1) {
        $('#seller-prev-btn').prop('disabled', true);
    } else {
        $('#seller-prev-btn').prop('disabled', false);
    }

    // 다음 페이지로 이동하는 버튼 활성화 여부 결정
    if (currentPage >= totalPages) {
        $('#seller-next-btn').prop('disabled', true);
    } else {
        $('#seller-next-btn').prop('disabled', false);
    }

    // 페이지 번호 버튼들 업데이트
    $('.seller-page-buttons').each(function() {
        var pageNum = parseInt($(this).val());
        if (pageNum === currentPage) {
            $(this).addClass('active'); // 현재 페이지를 강조 표시
        } else {
            $(this).removeClass('active');
        }
    });
}

// 페이지 로드 시 초기 버튼 상태 업데이트
$(document).ready(function() {
    updatePageButtons(currentPage);
});

	
	 $(document).ready(function () {
	        // "인증" 버튼을 클릭했을 때
	        $("#seller-approval-btn").click(function () {
	            var selectedSellers = [];
	            // 체크된 체크박스 값을 배열에 추가
	            $("input[name='selectedSellers']:checked").each(function () {
	                selectedSellers.push($(this).val());
	            });
	            
	            if (selectedSellers.length === 0) {
	                alert("선택된 항목이 없습니다.");
	                return;
	            }
	
	            if (confirm("선택한 판매자 회원을 인증하시겠습니까?")) {
	                // 선택한 판매자의 회원 등급을 1레벨(인증완료)로 수정
	                $.ajax({
	                    type: "POST",
	                    url: "/ticket/seller/approval",
	                    data: { selectedSellers: selectedSellers },
	                    success: function (data) {
	                        //if (data === "success") { 
	                        	$('#view').html(data);
	                        	alert("인증이 완료되었습니다.");
	                            //location.reload();
	                        //} //else {	
	                            //alert("인증 중 오류가 발생했습니다.");
	                        //}
	                    },
	                    //error: function () {
	                    //    alert("서버와 통신 중 오류가 발생했습니다.");
	                    //}
	                });
	            }
	        });
	    });
	
	
