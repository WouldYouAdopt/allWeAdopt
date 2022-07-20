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
        <title>나의 펀딩목록 : ALL WE ADOPT</title>
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
        <link href="${contextPath}/resources/css/funding/funding-order-detail.css" rel="stylesheet" />
       

    
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

	        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        
            <section class="py-4">
                <!-- 상단 메뉴 영역. -->
                <div class="text-center mb-5" id="TOT">
                    <h1 class="fw-bolder">펀딩 내역</h1>
                    <p class="lead fw-normal text-muted mb-0">참여하신 펀딩 내역을 조회하실 수 있습니다.</p>
                </div>

                <!-- 상단 이미지 영역 -->
               
                
                <div class="container px-5">
                    <div class=" rounded-3 py-5 px-4 px-md-5 mb-5">


                        <!-- 내부의  -->
                        <div class="row gx-5 justify-content-center" id="tableWrapper">

                            <table class="table  fundingList">
                                <thead>
                                  <tr>
                                    <th scope="col" class="dt1">펀딩번호</th>
                                    <th scope="col" class="dt2">결제번호</th> <%-- 주문번호칸이 따로 필요 없는것 같기도..? --%>
                                    <th scope="col" class="dt3">카테고리</th>
                                    <th scope="col" class="dt4">펀딩제목</th>
                                    <th scope="col" class="dt5">주문상태</th>
                                    <th scope="col">펀딩 결제일</th>
                                  </tr>
                                </thead>

                                <tbody>

                                  <c:choose>
                                    <c:when test='${empty fundingList}'>  
                                      <tr>
                                        <td colspan="6" style="font-size:24px; font-weight:bold;">참여하신 펀딩이 없습니다.</td>
                                      </tr>
                                   </c:when>      

                                   <c:otherwise>   
                                      <c:forEach var="funding" items="${fundingList}">
                                          <tr>
                                              <td>${funding.fundingNo}</td>
                                              <td>${funding.paymentNo}</td>
                                              <td>${funding.fundingCategory}</td>
                                              <td> 
                                                  <a href="detail/${funding.paymentNo}">${funding.fundingTitle}</a>    
                                              </td>
                                              <td>${funding.orderState}</td>
                                              <td>${funding.payDate}</td>
                                          </tr>
                                      </c:forEach>
                                   </c:otherwise>
                                  </c:choose>
                                    
                                </tbody>
                              </table>






                              <!-- 페이지 네이션 영역 시작 -->
                            <div class="pagination-area">

                                <c:set var="url" value="${boardCode}?cp="/>

                                <ul class="pagination">

                                <!-- 뒤로 가기 버튼 -->
                                <li>
                                    <a class="page-link" href="${url}${pagination.prevPage}" aria-label="Previous">
                                      <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>

                                  <!-- 범위가 정해진 일반 for문 사용 -->
                                  <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                                    <c:choose>
                                      <c:when test="${i == pagination.currentPage}">
                                      <li class="page-item"><a class="page-link" href="${url}${i}">${i}</a></li>
                                      </c:when>

                                      <c:otherwise>
                                      <li><a href="${url}${i}">${i}</a></li>        
                                      </c:otherwise>
                                      
                                    </c:choose>

                                  </c:forEach>

                                <!-- 다음으로 버튼 -->
                                <li class="page-item">
                                    <a class="page-link" href="${url}${pagination.nextPage}" aria-label="Next">
                                      <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                                </ul>

                            </div><!-- 페이지 네이션 영역 끝 -->

                            
                        </div>
                    </div>
                </div>
            </section>
        </main>
            


     
                        

        
        
            
            

        <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  
    </body>
    
</html>