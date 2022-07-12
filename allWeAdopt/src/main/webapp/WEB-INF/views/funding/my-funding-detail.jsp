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
<title>펀딩목록 : ALL WE ADOPT</title>
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
<link
	href="${contextPath}/resources/css/funding/funding-order-detail.css"
	rel="stylesheet" />



</head>
<body class="d-flex flex-column">
	<main class="flex-shrink-0">

		<jsp:include page="/WEB-INF/views/common/header.jsp" />


		<section class="py-4">
			<!-- 상단 메뉴 영역. -->
			<div class="text-center mb-5" id="TOT">
				<h1 class="fw-bolder">펀딩 내역</h1>
				<p class="lead fw-normal text-muted mb-0">참여하신 펀딩 내역을 조회하실 수
					있습니다.</p>
			</div>

			<!-- 상단 이미지 영역 -->


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
											<th colspan="1" class="row-name">주문번호</th>
											<td colspan="5">h12313</td>

										</tr>
										<tr>
											<th colspan="1">펀딩 제목</th>
											<td colspan="5">강아지 용품 관련 펀딩입니다.</td>
										</tr>
										<tr>
											<th>신청 리워드</th>
											<td>1번 리워드</td>
											<th>수량</th>
											<td>2</td>
											<th>금액</th>
											<td>80,000</td>
										</tr>
										<tr>
											<th>신청 리워드</th>
											<td>2번 리워드</td>
											<th>수량</th>
											<td>1</td>
											<th>금액</th>
											<td>40,000</td>
										</tr>
									</tbody>
								</table>
							</article>

							<!-- 결제정보 테이블 -->
							<article id="order-info" class="detail-info">

								<h3 class="fw-bolder">결제 정보</h3>

								<table class="table">
									<tbody>
										<tr>
											<th>결제 일시</th>
											<td>2022.07.09</td>
										</tr>
										<tr>
											<th>결제 수단</th>
											<td>무통장입금</td>
										</tr>
										<tr>
											<th>총결제 금액</th>
											<td>200,000</td>
										</tr>
										<tr>
											<th>주문 상태</th>
											<td>배송중</td>
										</tr>
									</tbody>
								</table>
								<div id="btn-area">
									<button type="button" class="btn btn-secondary">반품 신청</button>
									<button type="button" class="btn btn-success">배송 조회</button>
									<p>배송 상태에 의해 버튼이 바뀜</p>
								</div>
							</article>
							<!-- 배송 정보 테이블 -->
							<article id="order-info" class="detail-info">
								<h3 class="fw-bolder">배송 정보</h3>
								<table class="table">
									<tbody>
										<tr>
											<th>수령인</th>
											<td>김현기</td>
										</tr>
										<tr>
											<th>전화번호-1</th>
											<td>010-1234-1234</td>
										</tr>
										<tr>
											<th>전화번호-2</th>
											<td>-</td>
										</tr>
										<tr>
											<th>주소</th>
											<td>(03163)서울특별시 종로구 인사동길 20-9 (인사동) 1002호</td>
										</tr>
									</tbody>
								</table>
							</article>


						</div>





					</div>
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

</body>

</html>