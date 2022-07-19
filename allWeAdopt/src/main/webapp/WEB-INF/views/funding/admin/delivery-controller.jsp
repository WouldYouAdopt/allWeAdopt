<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>배송 관리 : ALL WE ADOPT</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/올위어답터.ico" />

        <!-- main css -->
        <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">

        <!-- 폰트어썸 (폰트)-->
        <script src="https://kit.fontawesome.com/e4f51ae88c.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Gowun+Batang&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/main-style.css" rel="stylesheet" />
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
        <link href="${contextPath}/resources/css/funding/funding-orders.css" rel="stylesheet" />
       

        <%-- 달콤한 알림 --%>  
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

	        <jsp:include page="/WEB-INF/views/common/admin-header.jsp" />

        
                <section class="py-4">


                <!-- 상단 메뉴 영역. -->
                <div class="text-center mb-5" id="TOT">
                    <h1 class="fw-bolder">주문관리 리스트</h1>
                </div>

                <!-- nav bar  영역 -->
                <div id="controllerArea">
                    <!-- A태그 영역 -->
                    <div>
                      <a href="1" class="navController" id="bacc">신규 주문</a>
                      <a href="2" class="navController">배송준비</a>
                      <a href="3" class="navController">배송중</a>
                      <a href="4" class="navController">배송완료</a>
                      <a href="8" class="navController">반품/환불</a>
                    </div>

                    <!-- 작업 버튼 영역 -->
                    <div class="controllerBtnArea">

                    <c:choose >
                      <%-- 신규 주문 --%>
                      <c:when test="${orderCode == 1}">
                        <button type="button" class="btn btn-secondary" onclick="processing(2)">배송준비</button>
                        <button type="button" class="btn btn-secondary" onclick="processing(5)">결제취소</button>
                      </c:when>
                      <%-- 배송준비에서는 배송만 있음 주문 --%>
                      <c:when test="${orderCode == 2}">
                        <button type="button" class="btn btn-secondary" onclick="sendProcessing(3)">발송 처리</button>
                      </c:when>
                      <%-- 배송중에는 반품신청만 --%>
                      <c:when test="${orderCode == 4 || orderCode==3}">
                        <button type="button" class="btn btn-secondary">반품 처리</button>
                      </c:when>
                      <%-- 반품/환불  --%>
                      <c:when test="${orderCode == 8}">
                        <button type="button" class="btn btn-secondary">반품 처리</button>
                        <button type="button" class="btn btn-secondary">환불 처리</button>
                      </c:when>
                      
                        <%-- <button type="button" class="btn btn-secondary">반품처리</button>
                        <button type="button" class="btn btn-secondary">환불처리</button> --%>
                      </c:choose >

                    </div>

                </div>





                <div class="container px-5">
                    <div class=" rounded-3 py-5 px-4 px-md-5 mb-5">

                        <!-- 내부의  -->
                        <div class="row gx-5 justify-content-center">

                            <table class="table  fundingList">



                   <c:choose > <%-- 테이블 반복 영역 시잔 --%>


                      <c:when test="${orderCode == 1}"><%-- 신규 주문일때. --%>
    <thead>
    <tr>
    <th scope="col" class="dt1">
      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
    </th>
    <th scope="col" class="dt2">주문번호</th>
    <th scope="col" class="dt3">카테고리</th>
    <th scope="col" class="dt4">펀딩제목</th>
    <th scope="col" class="dt5">주문자</th>
    <th scope="col" class="dt6">주문상태</th>
    <th scope="col">결제일</th>
    <th scope="col">결제 금액</th>
    </tr>
    </thead>
    <tbody>
      <c:forEach var="o" items="${orderList}">
          <tr>
              <th scope="row">
                <input class="form-check-input" type="checkbox" value="${o.paymentNo}">
              </th>

              <td>${o.paymentNo}</td>
              <td>${o.fundingCategory}</td>
              
              <td>
                <a href="../detail/${o.paymentNo}">
                  ${o.fundingTitle}
                </a>
              </td>

              <td>${o.recipient}</td>
              <td>${o.orderState}</td>
              <td>${o.payDate}</td>
              <td>${o.fullPrice}</td>
          </tr>
      </c:forEach>
                      </c:when>              
                      
                      <c:when test="${orderCode == 2}"><%-- 배송준비 --%>  
                        <thead>
                          <tr >
                            <th scope="col" class="dt1">
                              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                            </th>
                            <th scope="col">주문번호</th>
                            <th scope="col">카테고리</th>
                            <th scope="col">펀딩제목</th>
                            <th scope="col">주문자</th>
                            <th scope="col">결제일</th>
                            <th scope="col">택배사</th>
                            <th scope="col">운송장 번호</th>

                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach var="o" items="${orderList}">
                              <tr>
                                  <th scope="row">
                                    <input class="form-check-input" type="checkbox" value="${o.paymentNo}">
                                  </th>

                                  <td>${o.paymentNo}</td>
                                  <td>${o.fundingCategory}</td>
                                  
                                  <td>
                                    <a href="../detail/${o.paymentNo}">${o.fundingTitle}</a>
                                  </td>

                                  <td>${o.recipient}</td>
                                  <td>${o.payDate}</td>
                                  
                                  <td class="parcel">
                                    <select class="form-select" class="parcelCompany" name="parcelCompany" aria-label="Default select example">
                                      <option value="04">CJ대한통운</option>
                                      <option value="04">롯데택배</option>
                                      <option value="04">우체국택배</option>
                                    </select>
                                  </td>
                                  
                                  <td class="parcel"><input type="text" value="" class="parcelNo" name="parcelNo"></td>

                              </tr>
                          </c:forEach>
                      </c:when>                
                  </c:choose ><%-- 테이블 반복 영역  끝--%>

                                  
               
                                </tbody>


                              </table>

                        </div>
                    </div>
                </div>
            </section>
        </main>
            


            

        <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <script>
        const fundingNo = "${fundingNo}";
        const orderCode = "${orderCode}";
        </script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></>
        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
          <script src="${contextPath}/resources/js/funding/funding-delivery.js"></script>
  
    </body>
    
</html>