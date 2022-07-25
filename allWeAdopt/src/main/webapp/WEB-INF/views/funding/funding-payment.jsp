<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>결제 : ALL WE ADOPT</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="${contextPath}/resources/assets/올위어답터.ico" />

<%-- FastBoot --%>
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" />


<!-- main css -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/main-style.css">

<!-- 폰트어썸 (폰트)-->
<script src="https://kit.fontawesome.com/e4f51ae88c.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Gowun+Batang&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet">

<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

<%-- 달콤한 알림 --%>	
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="${contextPath}/resources/css/main-style.css"
	rel="stylesheet" />
<link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/funding/funding-payment.css"
	rel="stylesheet" />



</head>
<body class="d-flex flex-column">
	<main class="flex-shrink-0">

		<jsp:include page="/WEB-INF/views/common/header.jsp" />

	
		<!-- --------------------------------------------헤더 영역 끝-------------------------------------------- -->
		<section class="py-4">
			<!--  background: url(/allWeAdopt/src/main/webapp/resources/images/funding_sample/funding_title_img.png) 20% 10% ; -->
			<div id="imgArea">
				<img alt="" src="${contextPath}${funding.fundingThumbnail}"	style="width: 100%; max-height: 100%; object-fit: cover"><br>
				<span id="fundingTitle" style="display:none;">"${funding.fundingTitle}"</span>
			</div>


			<!-- 상단 메뉴 영역. -->
			<div class="text-center mb-5" id="TOT">
				<h1 class="fw-bolder">결제하기</h1>
				<p class="lead fw-normal text-muted mb-0 lead">결제를 진행 할 수 있습니다</p>
			</div>

<%-- ------------------------------------------------------------------------------------------------------- --%>
<form  method="post" id="submitEvent" name="submitEvent"><%-- action="pay/progress" --%>
			<div class="container px-5">
				<div class=" rounded-3 py-5 px-4 px-md-5 mb-5">
					<div class="row gx-5 justify-content-center fundingPaymentArea">

						<div class="paymentWrapper">
							<!-- 선택한 리워드들 보여주는 부분 + 배송비 추가한 금액 보여주는 영역-->
							<div class="rewardInfo">
								<c:set var="fullPrice" value="0" />

								<c:forEach var="reward" items="${rewardList}">
									<div class="sujin"><!-- 수진만듦 기능 깨지면 삭제할것 -->
									<h5 class="h5 fw-bolder rewardTitle">${reward.rewardTitle}</h5>
									<span>${reward.rewardContent}</span>

									<div class="resultInfo">
										<span class="resultPay">${reward.fullPrice} 원 </span> <span>수량 :
											${reward.amount}</span>
									</div>
									</div>
									
									<input type="hidden" value="${fullPrice = fullPrice+reward.fullPrice}">
								</c:forEach>

								<div class="deliveryFee" style="margin-top: 20px;">
									<span>${funding.deliveryFee} 원 </span> <span>배송비</span>
								</div>
								<!-- 리워드 한 행 끝 -->

								<hr>
								<div class="finalPay">
									<h5 class="fw-bolder">최종 결제 금액</h5>
									<h5 class="fw-bolder">${fullPrice}원</h5>
 
								</div>

							</div>
							<!-- 서포터 정보 조회 영역-->

							<div id="information">
								<div class="supporterWrapper">
									<h4 class="fw-bolder">펀딩 서포터</h4>
									<hr style="width:346px; margin-bottom:18px;">
									<ul class="supporterInfo">
										<h3>Name</h3>
										<li>${loginMember.memberName}</li>

										<h3>Email</h3>
										<li id="memberEmail">${loginMember.memberEmail}</li>

										<h3>Address</h3>
										<c:if test="${loginMember.memberAddress == null}">
											<li>등록된 주소가 없습니다.</li>
										</c:if>
										<c:if test="${loginMember.memberAddress != null}">
											<li>${fn:replace(loginMember.memberAddress, ',,', ' ')}</li>
										</c:if>

										<h3>Phone</h3>
										<c:if test="${loginMember.memberTel == null}">
											<li>등록된 번호가 없습니다.</li>
										</c:if>
										<c:if test="${loginMember.memberTel != null}">
											<li>${loginMember.memberTel}</li>
										</c:if>

									</ul>

								</div>


		

														
								<!-- 리워드 정보 입력 영역-->
								<div class="parcelInfo">
									<h4 class="fw-bolder" style="margin-bottom:10px;">
										리워드 배송지
										<span style="margin: 0; padding: 3px; font-size: 12px; font-weight: 400;">
											* 기호는 필수 작성 영역입니다
										</span>
									</h4>
									
									<hr style="margin-bottom: 0px;">
									
									<span>
										<input type="radio" name="destination" id="prevDestination">
										<label for="prevDestination">이전 배송지 &nbsp;</label> 
									</span>
									<span>
										<input type="radio" name="destination" id="newDestination">
										<label for="newDestination">신규 배송지 &nbsp;</label> 
									</span> 
									<span>
										<input type="radio" name="destination" id="supportDestination">
										<label for="supportDestination">서포터 정보와 동일 </label> 
									</span>

									<div class="inputArea">

										<div class="inputName">
											<span>*이름</span><br> 
											<input type="text" id="inputName"	name="recipient" placeholder="이름을 입력해주세요">
										</div>

										<div class="inputTel">
											<span>*휴대전화</span><br> 
											<input type="text"	id="inputTelMain" name="orderPhoneMain"	placeholder="휴대폰번호를 입력해주세요">
										</div>

										<div class="inputTel">
											<span>전화번호</span><br> 
											<input type="text"	id="inputTelSub" name="orderPhoneSub" placeholder="전화번호를 입력해주세요">
										</div>

										<div class="inputAddr">
											<span>*주소</span><br>
											<div id="postCodeArea">
												<button type="button" onclick="DaumPostcode()" id="findPostcode">우편번호 찾기</button>
												<input type="text" name="orderAddress" id="postCode" placeholder="우편번호" style="margin-bottom:5px;"><br>
											</div>
											<input type="text" name="orderAddress" id="Address"	placeholder="주소" style="margin-bottom:10px;">
											<input type="text" name="orderAddress" id="detailAddress"	placeholder="상세주소를 입력해주세요">
											
										</div>
									</div>
								</div>
							</div>

							<!-- 사용 포인트 입력 영역-->



							<div class="pointWrapper">
								<h4 class="fw-bolder">포인트 사용</h4>
								<p class="lead fw-small text-muted mb-0 lead">사용하실 포인트를 입력해주세요 </p>
								
								<div id="pointArea">
									<div id="havePointArea">
										<span>보유</span>
										<input type="number" value="10000" id="inputPoint" disabled>
									</div>
									<div id="usePointArea">
										<span>사용</span>
										<input type="number" value="" id="inputPoint">
									</div>
								</div>
								
							</div>
							<input type="hidden" name="point" value="0">
							<!-- 사용 포인트 입력 영역-->

							<!-- 결제 정보 입력 영역-->

							<div class="">
								<h4 class="fw-bolder">결제 방식 선택</h4>
								<div class="paymentMeans">
								
									<span> 
										<input class="form-check-input payment" type="radio" name="pay-Method" id="makeAdeposit" value="none">  
										<label 	class="btn payBtn" for="makeAdeposit">
											<div class="fa-solid fa-won-sign fa-3x fa-fw"></div>
											<p class="pp">계좌 이체</p>
										</label>
									</span> 
									
									<span> 
										<input class="form-check-input payment" type="radio" name="pay-Method" id="Pay" value="pay">
										<label	class="btn payBtn" for="Pay"> 
											<div class="fa-solid fa-credit-card fa-3x fa-fw "></div>
											<p class="pp">일반 결제</p>
											<%-- fa-spin 스핀 --%>
										</label>
									</span> 
									
									<span> 
										<input class="form-check-input payment" type="radio" name="pay-Method" id="kakaoPay" value="kakaoPay"> 
										<label	class="btn payBtn " for="kakaoPay">
											<div class="fa-solid fa-comment-dollar fa-3x fa-fw"></div>
											<p class="pp">카카오결제</p>
										</label>
									</span>
								</div>
							</div>


							<!-- 약관 입력 영역-->

							<div class="agreeWrapper">
								<h4 class="fw-bolder">약관 동의</h4>
								<br>
								<div>
									<input class="form-check-input" type="checkbox" id="allAgree">
									<label for="allAgree">&nbsp;전체 동의하기</label>
								</div>
								<div>
									<%-- Personal Information Agree --%>
									<input class="form-check-input" type="checkbox" id="PIA">
									<a href="javaScript:void(0)">&nbsp;개인정보 제3자 제공 동의</a>
								</div>
								<div>
									<%-- Liability Regulation Agree --%>
									<input class="form-check-input" type="checkbox" id="LRA">
									<a href="javaScript:void(0)">&nbsp;책임 규정에 대한 동의</a>
								</div>
							</div>








						<!-- 펀딩번호 -->
						<input type="hidden" name="fundingNo" value="${funding.fundingNo}">
						<!-- 회원번호 -->
						<input type="hidden" id="memberNo" name="memberNo" value="${loginMember.memberNo}">
						<!-- 모든 리워드가격 -->
						<input type="hidden" id="fullPrice" name="fullPrice" value="${fullPrice}">
						
						
						<!-- 결제방식 -->
						<input type="hidden" name="payMethod" id="pay_method" value="" >
						<!-- 결제번호(PK으로 생성) -->
						<%-- <input type="hidden" name="payNo" id="merchant_uid" type="number" > --%>

						<input type="hidden" name="nameAnonymous" id="nameAnonymous" value="${nameAnonymous}">
						<input type="hidden" name="priceAnonymous" id="priceAnonymous" value="${priceAnonymous}">

						


	<%-- 이름 익명 : ${nameAnonymous}<br> 
	가격 비공개 : ${priceAnonymous}<br>
 --%>










							<!-- 결제 버튼 영역 -->
							<div class="paymentBtnArea">
								<button type="submit" id="goToPay" onclick="submitValidate()">결제 하기</button>
							</div>
						</div>
						
					
						
						
</form>
<%-- ------------------------------------------------------------------------------------------------------- --%>
						<!-- wrapper 끝 -->

					</div>
					<!-- 내부 영역! 끝 -->
				</div>
			</div>
		</section>
	</main>










	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script type="text/javascript">
		const prevOrder = JSON.parse('${prevOrder}');
		const supportName = '${loginMember.memberName}';
		const supportTel = '${loginMember.memberTel}';
		const supportAddress = '${loginMember.memberAddress}';
	</script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="${contextPath}/resources/js/scripts.js"></script>
	<%-- 카카오 우편번호 연결 --%>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<%-- -------------------------------------------- --%>
	<%-- 쿼리 연결 --%>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript"	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<%-- -------------------------------------------- --%>
	
	<!-- 펀딩 작성 관련 JS -->
	<script src="${contextPath}/resources/js/funding/funding-payment.js"></script>
</body>

</html>