<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>펀딩상세 조회 : ALL WE ADOPT</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="${contextPath}/resources/assets/올위어답터.ico" />

<!-- main css -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/main-style.css">

<!-- 폰트어썸 (폰트)-->
<script src="https://kit.fontawesome.com/e4f51ae88c.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Gowun+Batang&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet">

<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="${contextPath}/resources/css/main-style.css"	rel="stylesheet" />
<link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
<link	href="${contextPath}/resources/css/funding/funding-order-detail.css"	rel="stylesheet" />


	<%-- 제이쿼리 --%>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<%-- 달콤한 알림 --%>	
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- summer note -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


</head>
<body class="d-flex flex-column">
	<main class="flex-shrink-0">

		<jsp:include page="/WEB-INF/views/common/header.jsp" />
  
		<section class="py-4">

    	<!-- 상단 이미지 영역 -->	
		<div class="fundingTitleBox">
			<div class="fundingTitleImage"></div>
			<div class="fundingTitleText">우리아이 시원하게 여름 쿨매트</div>
		</div>




	   <!-- 상단 메뉴 영역. -->
        <div class="text-center mb-5" id="TOT">
            <h1 class="fw-bolder">주문관리 상세</h1>
            <p class="lead fw-normal text-muted mb-0">펀딩 상세 내역을 조회하는 페이지입니다.</p>
        </div>


	
			<div class="container px-5">
				<div class=" rounded-3 py-5 px-4 px-md-5 mb-5">


					<!-- 내부 영역  -->
					<div class="row gx-5 justify-content-center" id="tableWrapper">


						<!-- 내부의 태이블 3개 -->
						<div class="row gx-5 justify-content-center">

							<!-- 펀딩정보 테이블 -->
							<article id="funding-info" class="detail-info">
								<h3 class="fw-bolder">펀딩 정보</h3>
								<table class="table">
									<tbody>
										<tr>
											<th colspan="1" class="row-name">펀딩 제목</th>
											<td colspan="5">${detail.fundingTitle}</td>
										

										</tr>
										<tr>
											<th >카테고리</th>
											<td >${detail.fundingCategory}</td>

											<th  class="row-name">주문번호</th>
											<td  colspan="3">${detail.paymentNo}</td>
										</tr>
						
								
									  <c:forEach var="reward" items="${detail.rewardList}">
											<tr>	
												<th>신청 리워드</th>
												<td>${reward.rewardTitle}</td>
												<th>수량</th>
												<td>${reward.amount}</td>
												<th>금액</th>
												<td>${reward.fullPrice} 원</td>
											</tr>
                                      </c:forEach>

									</tbody>
								</table>
							</article>

						
<%-- -------------------------------------------------------------------------------------------------- --%>
<div id="twoTable"><%-- 결제 , 배송 정보 묶는 DIV 시작 --%>
							<!-- 결제정보 테이블 -->
							<article id="order-info" class="detail-info">

								<h3 class="fw-bolder">결제 정보</h3>

								<table class="table">
									<tbody>
										<tr>
											<th>결제 일시</th>
											<td>${detail.payDate}</td>
										</tr>
										<tr>
											<th>결제 수단</th>
											<td>${detail.payMethod}</td>
										</tr>
										<tr>
											<th>총결제 금액</th>
											<td>${detail.fullPrice}</td>
										</tr>
										<tr>
											<th>주문 상태</th>
											<td>${detail.orderState}</td>
										</tr>
									</tbody>
								</table>
								<div id="btn-area">
								
								<c:choose>
									
									<c:when test='${detail.orderState=="결제 완료"}'>
										<button type="button" class="btn btn-secondary" id="cancelPayment">결제 취소</button>
									</c:when>
									
									
									<c:when test='${detail.orderState=="배송 중"}'>
										<%-- <button type="button" class="btn btn-secondary" id="returnBtn">반품 신청</button> --%>
										<button type="button" class="btn btn-success" id="selectDelivery">배송 조회</button>
									</c:when>

									<c:when test='${detail.orderState=="배송 완료"}'>		
										<button type="button" class="btn btn-secondary" id="returnBtn">반품 신청</button>
										<button type="button" class="btn btn-secondary" id="refundBtn">환불 신청</button>
									</c:when>
									<c:when test='${detail.orderState=="환불 신청"}'>		
										<button type="button" class="btn btn-secondary">환불 진행 중</button>
									</c:when>

									<c:otherwise>
										<button type="button" class="btn">${detail.orderState} 진행 중</button>
									</c:otherwise>
									
								</c:choose>
									
								</div>
							</article>


							<!-- 배송 정보 테이블 -->
							<article id="delivery-info" class="detail-info">
								<h3 class="fw-bolder">배송 정보</h3>
								<table class="table">
									<tbody>
										<tr>
											<th>수령인</th>
											<td>${detail.recipient}</td>
										</tr>
										<tr>
											<th>전화번호-1</th>
											<td>${detail.orderPhoneMain}</td>
										</tr>
										<tr>
											<th>전화번호-2</th>
											<td>${detail.orderPhoneSub}</td>
										</tr>
										<tr>
											<th>주소</th>
											<td>${detail.orderAddress}</td>
										</tr>
									</tbody>
								</table>
							</article>
</div><%-- 결제 , 배송 정보 묶는 DIV 끝 --%>

    <div id="summernoteArea">
		<h3>사유를 입력해주세요</h3>
		<textarea id="summernote" name="returnReason"></textarea>  
		<div id="btnArea">
			<button id="returnSubmitBtn" onclick="sendReturn()">반품 신청</button>
			<button id="returnCancelBtn" onclick="location.href=''">반품 취소</button>
		</div>
	</div>

<%-- -------------------------------------------------------------------------------------------------- --%>
						</div>
	
	<%-- 배송정보 조회를 위한 form 태그 숨겨두기. --%>
<form action="http://info.sweettracker.co.kr/tracking/2" method="post" id="submitSweettracker">
	<input type="hidden" class="form-control" id="t_key" name="t_key" placeholder="API키" value="BZSIagSlyzWU3UEhwSNHBQ">
	<input type="hidden" class="form-control" name="t_code" id="t_code" placeholder="택배사 코드" value="04">
	<input type="hidden" class="form-control" name="t_invoice" id="t_invoice" placeholder="운송장 번호" value="649524304661"> 
</form>
<%-- 배송정보 조회를 위한 form 태그 숨겨두기. --%>




					</div>
				</div>
			</div>
		</section>
	</main>





	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		const paymentNo = '${paymentNo}';
	</script>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></>
	<!-- Core theme JS-->
	<script src="${contextPath}/resources/js/scripts.js"></script>

	<%-- 배송정보 관련 JS --%>
	<script src="	${contextPath}/resources/js/funding/funding-delivery.js"></script>
  

</body>

</html>