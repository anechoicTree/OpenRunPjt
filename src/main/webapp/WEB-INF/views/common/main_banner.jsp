<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/main/css/main_banner.css" var="css" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${css}">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script> 
/* 이미지 삽입 */
$(".image_wrap").each(function(i, obj){
	
	const bobj = $(obj);
	
	if(bobj.data("bookid")){
		const uploadPath = bobj.data("path");
		const uuid = bobj.data("uuid");
		const fileName = bobj.data("filename");
		
		const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
		
		$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
	} else {
		$(this).find("img").attr('src', '/resources/img/goodsNoImage.png');
	}
	
});
</script>

</head>
<body>
	<!-- 
	<div class="main-banner-container">
		<div class="main-banner-container-sub">
			<div id="main-banner-title">티켓 랭킹</div>
			<div class="filter">
				<ul id="filter-list">
					<li class="filter-item">
						<button class="filter-btn" id="">뮤지컬</button>
					</li>
					<li class="filter-item">
						<button class="filter-btn" id="">콘서트</button>
					</li>
					<li class="filter-item">
						<button class="filter-btn" id="">연극</button>
					</li>
					<li class="filter-item">
						<button class="filter-btn" id="">클래식/무용</button>
					</li>
					<li class="filter-item">
						<button class="filter-btn" id="">전시/행사</button>
					</li>
				</ul>
			</div>
			<div class="wrapper">
				<i id="left" class="fa-solid fa-angle-left"></i>
					 <div class="performance-list">
					 </div>
				<i id="right" class="fa-solid fa-angle-right"></i>
			</div>
		</div>	
	</div>
	 -->
	<div class="ls_wrap">
				<div class="ls_div_subject">
					티켓 랭킹2
				</div>
				<div class="ls_div">
					<c:forEach var="guide" items="${guidesList}">
							<div class="ls_div_content_wrap">
								<div class="ls_div_content">
									<div class="image_wrap" data-bookid="" data-path="" data-uuid="" data-filename="">
										<img src="${pageContext.request.contextPath}${guide.imgPath}" alt="${guide.imgOriginName}" class="guide-image"/>
									</div>									
								</div>
							</div>					
					</c:forEach>					
				</div>
			</div>
</body>
</html>