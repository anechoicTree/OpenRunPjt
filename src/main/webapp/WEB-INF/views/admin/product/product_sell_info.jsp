<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/resources/common/css/product_sell_info.css' />" rel="stylesheet" type="text/css">
<jsp:include page="../include/calendar_js.jsp" />
</head>
<body>
	<jsp:include page="../../../views/common/header.jsp" />
	<section>
		<div id="section_wrap">
			<div class="product_all_wrap">
				<div class="product_name">
					<h3>${productVo.p_name}</h3>
				<hr>
				</div>
				
				<div class="product_img">
					<img src="<c:url value="/productUploadImg/${productVo.p_img}"/>">
							<!-- DB에서 받아올 상품 썸네일 -->
				</div>
				<div class="product_table">
					<table>
							<tr>
								<th>장소</th>
								<td>${productVo.p_hall}</td>
							</tr>	
							<tr>	
								<th>공연기간</th>
								<td>${productVo.p_perfo_start_date} ~ ${productVo.p_perfo_end_date}</td>
							</tr>
							<tr>
								<th>공연시간</th>
								<td>${productVo.p_viewing_time}</td>
							</tr>
							<tr>
								<th>관람연령</th>
								<td>${productVo.p_viewing_grade}</td>
							</tr>
							<tr>	
								<th>가격</th>
								<td>${productVo.p_price}원</td>
							</tr>
							<tr>
								<th>유의사항</th>
								<td>${productVo.p_resev_start_date} ~ ${productVo.p_resev_end_date}까지<br>
									구매 가능합니다.</td>
							</tr>
					</table>
				</div>
				<div class="main_content">
					<div>
						<div class="product_content">
			              <button class="select_btn" data-id="content" onclick="location.href='productDetail?p_no=${productVo.p_no}'">공연정보</button>
			            </div>
			            <div class="sell_info">
			              <button class="content_btn" data-id="info" onclick="location.href='productSellInfo?p_no=${productVo.p_no}'">판매정보</button>
			            </div>
			            <div class="review">
			              <button class="content_btn" data-id="review" onclick="location.href='productReview?p_no=${productVo.p_no}'">관람후기</button>
			            </div>
			            <div class="place_info">
			              <button class="content_btn" data-id="place" onclick="location.href='productPlaceInfo?p_no=${productVo.p_no}'">장소안내</button>
			            </div>
					</div>
					<div class="sell_detail" style="width: 700px;">
						<div id="agency_info">
							<h3>기획사 정보</h3>
							<p>주최/주관 : ${sellerVO.s_comName}</p>
						</div>
						<div id="product_info"> <!-- 표 한번 정리해야됨 -->
							<h3>상품관련 정보</h3>
							<table>
								<tr>
									<th>주최/기획</th>
									<td>${sellerVo.s_comName}</td>
									<th>고객문의</th>
									<td>1588-8282</td>
								</tr>
								<tr>
									<th>공연시간</th>
									<td>${productVo.p_viewing_time}</td>
									<th>관람등급</th>
									<td>${productVo.p_viewing_grade}</td>
								</tr>
								<tr>
									<th>주연</th>
									<td>스테이씨</td>
									<th>공연장소</th>
									<td>${productVo.p_hall}</td>
								</tr>
								<tr>
									<th>예매수수료</th>
									<td>장당 2,000원</td>
									<th>배송료</th>
									<td>현장수령 무료, 배송 3,200원</td>
								</tr>
								<tr>
									<th>유효기간/이용조건</th>
									<td>${productVo.p_perfo_start_date} ~ ${productVo.p_perfo_end_date}
											예매한 공연 날짜, 회차에 한해 이용가능</td>
								</tr>
								<tr>
									<th>예매취소조건</th>
									<td>취소일자에 따라서 아래와 같이 취소수수료가 부과됩니다.예매 일 기준보다 관람일 기준이 우선 적용됩니다. 단, 예매 당일 밤 12시 이전 취소 시에는 취소수수료가 없으며, 예매 수수료도 환불됩니다.(취소기한 내에 한함)
										<table>
											<tr>
												<th>취소일</th>
												<th>취소수수료</th>
											</tr>
											<tr>
												<td>예매 후 7일 이내</td>
												<td>없음</td>
											</tr>
											<tr>
												<td>예매 후 8일 이내 ~ 관람일 10일전까지</td>
												<td>장당 4,000원(티켓금액의 10%한도)</td>
											</tr>
											<tr>
												<td>관람일 9일전 ~ 관람일 7일전까지</td>
												<td>티켓금액의 10%</td>
											</tr>
											<tr>
												<td>관람일 6일전 ~ 관람일 3일전까지</td>
												<td>티켓금액의 20%</td>
											</tr>
											<tr>
												<td>관람일 1일전까지</td>
												<td>티켓금액의 30%</td>
											</tr>
										</table>									
									</td>
								</tr>
								<tr>
									<th>취소환불방법</th>
									<td>
										<ul>
											<li>My티켓 > 예매/취소내역에서 직접 취소 또는 고객센터 (1588-8282)를 통해서 예매를 취소할 수 있습니다.</li>
											<li>티켓이 배송된 이후에는 인터넷 취소가 안되며, 취소마감 시간 이전에 티켓이 인터파크 티켓 고객센터로 반송되어야 취소 가능합니다. 취소수수료는 도착일자 기준으로 부과되며, 배송료는 환불되지 않습니다.</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th>배송티켓 안내</th>
									<td>
										<ul>
											<li>티켓 배송 (배송상태 : 배송 준비중 이후) 후에는 주소 변경이 불가합니다.</li>
											<li>부득이하게 주소 변경이 필요하신 경우 각 배송사에 수취 거절 요청 후,고객센터(1588-8282)로 재배송 신청할 수 있습니다.(배송비 3,200원 추가 부과) </li>
										</ul>
									</td>
								</tr>
							</table>
						</div>
						<div id="seller_info">
							<h3>판매자 정보</h3>
							<table>
								<tr>
									<th>상호</th>
									<td>${sellerVo.s_comName}</td>
									<th>대표자명</th>
									<td>${sellerVo.s_name}</td>
								</tr>
								<tr>
									<th>사업자등록번호</th>
									<td>${sellerVo.s_corRegiNum}</td>
									<th>E-mail</th>
									<td>${sellerVo.s_email}</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>${sellerVo.s_number}</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${sellerVo.s_addr}</td>
								</tr>
							</table>
						</div>
						<div id="resev_info">
							<h3>예매 유의사항</h3>
								<ul>
									<li>다른 이용자의 원활한 예매 및 취소에 지장을 초래할 정도로 반복적인 행위를 지속하는 경우 회원의 서비스 이용을 제한할 수 있습니다.</li>
									<li>일부 상품의 판매 오픈 시 원활한 서비스 제공을 위하여 인터파크페이, I-point, NOL 포인트, 문화예매권 등의 특정 결제수단 이용이 제한될 수 있습니다.</li>
								</ul>
						</div>
						<div id="ticket_info">
							<h3>티켓수령 안내</h3>
							<h4>예약 번호 입장</h4>	
								<ul>
									<li>공연 당일 현장 교부처에서 예약번호 및 본인 확인 후 티켓을 수령하실 수 있습니다.</li>
									<li>상단 예매확인/취소 메뉴에서 예매내역을 프린트하여 가시면 편리합니다.</li>
								</ul>
							<h4>티켓배송</h4>
								<ul>
									<li>예매완료(결제익일) 기준 4~5일 이내에 배송됩니다. (주말, 공휴일을 제외한 영업일 기준)</li>
									<li>배송 중 전달 불가사항이 발생할 시에는 반송되며, 본인 수령 불가 시 경우에 따라 대리 수령도 가능합니다.</li>
									<li>공연 3일 전까지 티켓을 배송받지 못하신 경우 고객센터(1588-8282)로 연락 주시기 바랍니다.</li>
									<li>반송이 확인되지 않은 티켓은 현장에서도 수령하실 수 없으며, 공연 관람 및 환불이 불가합니다.</li>
									<li>티켓 배송 (배송상태 : 배송 준비중 이후) 후에는 주소 변경이 불가합니다.</li>
									<li>부득이하게 주소 변경이 필요하신 경우 각 배송사에 수취 거절 요청 후, 고객센터(1588-8282)로 재배송 신청할 수 있습니다.(배송비 3,200원 추가 부과)</li>
								</ul>	
						</div>
						<div id="resev_cancle_info">
							<h3>예매 취소 시 유의사항</h3>
							<p>①예매 후 7일까지 취소 시에는 취소수수료가 없습니다.<br>
							② 관람일 기준은 아래와 같이 취소수수료가 적용됩니다.</p>
							<ul>
								<li>~관람일 10일전까지 : 뮤지컬/콘서트/클래식 장당 4,000원, 연극/전시 등 장당 2,000원(단, 최대 티켓금액의 10% 한도)</li>
								<li>관람일 9일전 ~ 관람일 7일전까지 : 티켓금액의 10%</li>
								<li>관람일 6일전 ~ 관람일 3일전까지 : 티켓금액의 20%</li>
								<li>관람일 2일전 ~ 관람일 1일전까지 : 티켓금액의 30%</li>
							</ul>
							<p>- ①번과 ②번 모두 해당되는 경우, ②번 기준이 우선 적용됩니다.<br>
							- ②번의 경우에도 예매 당일 밤 12시 이전 취소 시에는 취소수수료가 없습니다. (취소기간 내에 한함)</p>
							
							<ul>
								<li>취소 시 예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다. </li>
								<li>웹 취소가능시간 이후에는 취소가 불가합니다.단, 관람일 당일 취소가능 한 상품의 경우 관람일 당일 취소 시에는 티켓금액의 90%가 과금됩니다.</li>
								<li>상품의 특성에 따라서, 취소수수료 정책이 달라질 수 있습니다.(각 상품 예매 시 취소수수료 확인)</li>
								<li>배송 및 반송처리 된 티켓의 배송료는 환불되지 않습니다.</li>
								<li>금주 주말 (토/일)공연 취소를 원할 경우 내사수령 바랍니다. 우편으로 보낼 시 우체국이 토요일 근무를 안하는 관계로 수취인(인터파크)수령이 불가능하여 취소처리가 되지 않을 수 있습니다.</li>
								<li>취소는 관람일 하루 전(평일/주말/공휴일 오후 5시, 토요일 오전 11시 이전)까지 직접 취소가 가능합니다.배송이 시작된 티켓의 경우 티켓이 인터파크 티켓 고객센터로 공연 전일까지 반송되어야 취소가능하며,취소수수료는 도착일자 기준으로 부과됩니다.(※ 단, 배송료는 환불되지 않으며 일괄배송 상품의 경우 취소에 대한 자세한 문의는 고객센터로 문의해주시기 바랍니다.)</li>
								<li>(공연 전일이 휴일인 경우, 휴일 전날까지) 반송이 확인되지 않은 티켓은 현장에서도 수령하실 수 없으며, 공연 관람 및 환불이 불가합니다.</li>
							</ul>
							
							<h4>티켓 반송 주소</h4>
							<p>(12345) 서울특별시 강남구 강남대로 어딘가, 멋진빌딩(12345) 오픈런티켓 고객센터 환불담당자<br>
								* 예매 및 예매취소, 티켓 반송 서비스는 소비자기본법에 따른 소비자분쟁 해결기준(공정위 고시)에 따릅니다.</p>
						</div>
						<div id="refund_info" >
							<h3>환불 안내</h3>
							<h4>신용카드의 경우</h4>
								<ul>
									<li>일반적으로 당사의 취소 처리가 완료되고 4~5일 후 카드사의 취소가 확인됩니다. (체크카드 동일)</li>
									<li>예매 취소 시점과 해당 카드사의 환불 처리기준에 따라 취소금액의 환급방법과 환급일은 다소 차이가 있을 수 있으며,예매 취소시 기존에 결제하였던 내역을 취소하며
									 최초 결제하셨던 동일카드로 취소 시점에 따라 취소수수료와 배송료를 재승인 합니다.</li>
								</ul>
							<h4>무통장입금의 경우</h4>	
								<ul>
									<li>예매 취소 시에 환불 계좌번호를 남기고, 그 계좌를 통해 취소수수료를 제외한 금액을 환불 받습니다.취소 후 고객님의 계좌로 입금까지 대략 5~7일 정도가 소요됩니다. (주말 제외)</li>
									<li>환불은 반드시 예매자 본인 명의의 계좌로만 받으실 수 있습니다.단, 예매자 본인 명의의 계좌가 없을 경우에는 직계 가족 명의의 계좌에 한하여 가능하며,이 경우 관계를 증명할 수 있는 
									증빙서류를 예매자 본인이 팩스나 우편 등으로 인터파크 티켓 본사로 보내주셔야 합니다.
									(예매자 본인 외 가족이 증빙서류를 보내주셨을 경우, 이로 인해 문제 발생 시 환불 접수한 가족 본인에게 모든 책임이 있습니다.)</li>
								</ul>
							<h4>휴대폰결제의 경우</h4>	
								<ul>
									<li>취소 신청 후 바로 취소 처리가 되며 취소 수수료를 제외한 티켓 금액 및 예매수수료/핸드폰결제이용료가 취소 가능합니다.</li>
									<li>예매 취소 시 기존에 결제하셨던 내역을 취소하며 결제하셨던 동일 정보로 
									취소 시점에 따라 취소수수료가 재승인 합니다.(티켓이 배송된 경우는 배송료 포함하여 재승인 합니다.)</li>
								</ul>
							<p>환불 지연 등에 따른 배상급 지급에 대한 사항은 전자상거래 등에서의 소비자 보호에 관한 법률 및 소비자기본법에 따른 소비자분쟁 해결기준(공정위 고시)에 따르며 관련 문의는 고객센터로 연락주시기 바랍니다.</p>
							<h4>무통장입금 시 주의사항</h4>
								<ul>
									<li>입금 시 총 결제금액을 정확히 입금하여야 합니다. 입금금액이 다를 경우 예매내역은 자동취소 되며, 입금된 금액은 추후 환불 처리됩니다.2건 이상 예매시에도, 각 예매 건 별로 입금을 하셔야 합니다.</li>
									<li>입금 시, 입금자명으로 주문자명과 동일하게 입금해주시기 바랍니다.</li>
									<li>수표는 정상적으로 입금되지 않고 입금 오류가 발생하오니, 현금으로 입금을 해주시기 바랍니다.</li>
									<li>예매일 익일 오후 23시 59분까지 입금하지 않으시면 자동으로 예매취소 되며, 상품에 따라 입금 기한이 상이 할 수 있으니 My 티켓에서 입금 마감시간을 확인해주시기 바랍니다. (단, 오후 17시 이후에는 무통장입금 문의 대응이 어려울 수 있으니, 이전시간 입금을 권장합니다.)</li>
									<li>주말/공휴일은 은행 영업일이 아니고, ATM기기 중 가상계좌입금이 안 되는 경우가 있으니 인터넷뱅킹, 폰뱅킹이 어려우신 고객님은 결제방법을 다른 결제수단을 선택하시기 바랍니다.</li>
									<li>은행에 무통장 입금 시에는 입금증에 반드시 전화번호를 기입하시기 바랍니다.</li>
									<li>입금 후에는 반드시 입금확인 메일이나 예매확인/취소에서 입금확인내역을 확인 후 공연장으로 가시기 바랍니다.</li>
									<li>무통장입금 시 입급확인까지 일정시간이 소요될 수 있습니다.</li>
								</ul>	
						</div>
					</div>
				</div>
			</div>
			<div class="calendar">
					<jsp:include page="../../../views/calendar.jsp" />
				<!-- 위치 안움직이게 jQuery도 써야하는 것 같음 -->
			</div>
		</div>
	</section>
	<jsp:include page="../../../views/common/footer.jsp" />
</body>
</html>