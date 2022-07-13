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
<title>결제 : ALL WE ADOPT</title>
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
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Gowun+Batang&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet">

<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

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

			<div id="imgArea">펀딩 대표 이미지?
				${rewardList[0].amount}<br>
				${prevOrder.orderAddress}
			</div>
	

			<!-- 상단 메뉴 영역. -->
			<div class="text-center mb-5" id="TOT">
				<h1 class="fw-bolder">결제하기</h1>
				<p class="lead fw-normal text-muted mb-0 lead">결제를 진행 할 수 있습니다</p>
			</div>


			<div class="container px-5">
				<div class=" rounded-3 py-5 px-4 px-md-5 mb-5">
					<div class="row gx-5 justify-content-center fundingPaymentArea">

						<div class="paymentWrapper">
							<!-- 선택한 리워드들 보여주는 부분 + 배송비 추가한 금액 보여주는 영역-->
							<div class="rewardInfo">

								<div class="rewardRow">
									<!-- 하나의 리워드 -->
									<h5 class="h5 fw-bolder rewardTitle">리워트 타이틀이 나오는 영역</h5>
									<span>해당 리워드의 소개가 나오는 영역</span>

									<div class="resultInfo">
										<span class="resultPay">200,000</span> <span>수량: 2</span>
									</div>
									<hr>
									<div class="deliveryFee">
										<span>4000 원</span> <span>배송비</span>
									</div>
								</div>
								<!-- 리워드 한 행 끝 -->

								<hr>
								<div class="finalPay">
									<h5 class="fw-bolder">최종 결제 금액</h5>
									<h5 class="fw-bolder">100,500 원</h5>
								</div>

							</div>
							<!-- 서포터 정보 조회 영역-->

							<div id="information">
								<div class="supporterWrapper">
									<h4 class="fw-bolder">펀딩 서포터</h4>
									<ul class="supporterInfo">
										<h3>Name</h3>
										<li>${loginMember.memberName}</li>

										<h3>Email</h3>
										<li>${loginMember.memberEmail}</li>

										<h3>Address</h3>
										<c:if test="${loginMember.memberAddress == null}"><li>등록된 주소가 없습니다.</li>	</c:if>
										<c:if test="${loginMember.memberAddress != null}"><li>${loginMember.memberAddress}</li></c:if>
										
										<h3>Phone</h3>
										<c:if test="${loginMember.memberTel == null}"><li>등록된 번호가 없습니다.</li>	</c:if>
										<c:if test="${loginMember.memberTel != null}"><li>${loginMember.memberTel}</li></c:if>

									</ul>
								</div>


								<!-- 리워드 정보 입력 영역-->
								<div class="parcelInfo">
									<h4 class="fw-bolder">리워드 배송지</h4>

									<span>이전 배송지 <input type="radio" name="destination"></span>
									<span>신규 배송지 <input type="radio" name="destination"></span>

									<div class="inputArea">
										<div class="inputName">
											<span>이름</span><br> <input type="text" name="inputName"
												placeholder="이름을 입력해주세요">
										</div>

										<div class="inputTel">
											<span>휴대전화</span><br> <input type="text" name="inputTel"
												placeholder="휴대폰번호를 입력해주세요">
										</div>

										<div class="inputTel">
											<span>전화번호</span><br> <input type="text" name="inputTel"
												placeholder="전화번호를 입력해주세요">
										</div>

										<div class="inputAddr">
											<span>주소</span><br>
											<button onclick="execDaumPostcode()" id="findPostcode">우편번호
												찾기</button>
											<!--    <p id="addressInfo" class="badge bg-primary text-wrap">(13536)경기 성남시 분당구 판교역로 4</p> -->
											<!-- p태그 형태로 보여지는 주소 값을 가져 가기 위한 hidden 태그 -->
											<input type="hidden" name="address" id="address" value="">

											<input type="text" name="detailAddress"
												placeholder="상세주소를 입력해주세요">
										</div>
									</div>
								</div>
							</div>



							<!-- 결제 정보 입력 영역-->

							<div class="paymentWrapper">
								<h4 class="fw-bolder">결제 방식 선택</h4>
								<div class="paymentMeans">
									<span> <input class="form-check-input" type="radio"
										name="payment" id="makeAdeposit"> <label
										class="form-check-label" for="makeAdeposit"> 무통장 입금 </label>
									</span> <span> <input class="form-check-input" type="radio"
										name="payment" id="simplePay"> <label
										class="form-check-label" for="simplePay"> 간편 결제 </label>
									</span> <span> <input class="form-check-input" type="radio"
										name="payment" id="phonePay"> <label
										class="form-check-label" for="phonePay"> 핸드폰 결제 </label>
									</span>
								</div>
							</div>


							<!-- 약관 입력 영역-->

							<div class="agreeWrapper">
								<h4 class="fw-bolder">약관 동의</h4>
								<br>
								<div>
									<input class="form-check-input" type="checkbox"> <a
										href="">전체 동의하기</a>
								</div>
								<div>
									<input class="form-check-input" type="checkbox" role="switch">
									<a href="">개인정보 제3자 제공 동의</a>
								</div>
								<div>
									<input class="form-check-input" type="checkbox" role="switch">
									<a href="">책임 규정에 대한 동의</a>
								</div>
							</div>

							<!-- 결제 버튼 영역 -->
							<div class="paymentBtnArea">
								<button id="goToPay">결제 하기</button>
							</div>
						</div>
						<!-- wrapper 끝 -->

					</div>
					<!-- 내부 영역! 끝 -->
				</div>
			</div>
		</section>
	</main>












	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="${contextPath}/resources/js/scripts.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

	<!-- iamport.payment.js -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<!-- 펀딩 작성 관련 JS -->
	<script src="${contextPath}/resources/js/funding/funding-payment.js"></script>
</body>

</html>