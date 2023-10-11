	$(document).on('click', '.guide-link', function() {
		event.preventDefault(); // 기본 동작 중지 : 해시('#')이 추가되지 않고 주소 유지 가능
	    const guideId = $(this).data('guide-id');
	    
	    // Ajax 요청을 보냅니다.
	    $.ajax({
	        type: 'GET',
	        url: '/ticket/cs/guide/detail?guideNo=' + guideId, // 이용가이드 상세 정보를 가져오는 URL로 변경
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
        url: "/ticket/admin/guide/listGuides?page=" + page,
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
        $('#guide-prev-btn').prop('disabled', true);
    } else {
        $('#guide-prev-btn').prop('disabled', false);
    }

    // 다음 페이지로 이동하는 버튼 활성화 여부 결정
    if (currentPage >= totalPages) {
        $('#guide-next-btn').prop('disabled', true);
    } else {
        $('#guide-next-btn').prop('disabled', false);
    }

    // 페이지 번호 버튼들 업데이트
    $('.guide-page-buttons').each(function() {
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
	        // "삭제" 버튼을 클릭했을 때
	        $("#guide-delete-btn").click(function () {
	            var selectedGuides = [];
	            // 체크된 체크박스 값을 배열에 추가
	            $("input[name='selectedGuides']:checked").each(function () {
	                selectedGuides.push($(this).val());
	            });
	            
	            if (selectedGuides.length === 0) {
	                alert("선택된 항목이 없습니다.");
	                return;
	            }

	            if (confirm("선택한 공지사항을 삭제하시겠습니까?")) {
	                // 선택한 공지사항을 서버로 보내 삭제 요청
	                $.ajax({
	                    type: "POST",
	                    url: "/ticket/guide/remove",
	                    data: { selectedGuides: selectedGuides },
	                    success: function (data) {
	                        //if (data === "success") {  오류 발생 중
	                        	$('#view').html(data);
	                        	alert("삭제가 완료되었습니다.");
	                            //location.reload();
	                        //} //else {	
	                            //alert("삭제 중 오류가 발생했습니다.");
	                        //}
	                    },
	                    //error: function () {
	                    //    alert("서버와 통신 중 오류가 발생했습니다.");
	                    //}
	                });
	            }
	        });
	    });
	 
	// 수정 버튼 클릭 시 실행
	 $("#guide-update-btn").click(function () {
	     var selectedGuides = $("input[name='selectedGuides']:checked");

	     // 선택된 공지사항의 개수 확인
	     if (selectedGuides.length !== 1) {
	         alert("수정할 항목을 하나만 선택하세요.");
	         return;
	     }

	     // 선택된 공지사항의 ID를 가져옴
	     var guideNo = selectedGuides.val();

	     // 선택된 공지사항의 ID를 사용하여 공지사항 정보를 가져옴
	     $.ajax({
	         type: "GET",
	         url: "/ticket/guide/guideUpdateForm?guideNo=" + guideNo,
	         success: function (data) {
	             // 성공 시 공지사항 정보를 가지고 수정 페이지로 이동
	             $("#view").html(data);
	         },
	         //error: function () {
	             //alert("서버와 통신 중 오류가 발생했습니다.");
	         //}
	     });
	 });
	
	// 각 카테고리 버튼에 대한 클릭 이벤트 리스너 추가
	$(document).on('click', '#guide-category-btn', function(event) {
	    event.preventDefault(); // 기본 동작 중지 : 해시('#')이 추가되지 않고 주소 유지 가능
	    const guideId = $(this).data('id');
	    const categoryNo = guideUrlMap[guideId];
	    
	    // Ajax 요청을 보냅니다.
	    $.ajax({
	        type: 'GET',
	        url: '/ticket/admin/guide/listGuidesByCategory?categoryNo=' + categoryNo, // 카테고리에 따른 FAQ 목록을 가져오는 URL로 변경
	        success: function(data) {
	            $('#view2').html(data);
	        },
	        error: function() {
	            // 오류 발생 시 실행되는 콜백 함수
	            alert('공지사항 목록을 로드하는 동안 오류가 발생했습니다.');
	        }
	    });
	});
	
