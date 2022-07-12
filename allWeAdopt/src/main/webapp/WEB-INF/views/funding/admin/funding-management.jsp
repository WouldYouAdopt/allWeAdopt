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
        <title>펀딩목록 : ALL WE ADOPT</title>
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
                      <a href="#" class="navController" id="bacc">신규 주문</a>
                      <a href="#" class="navController">주문 확인</a>
                      <a href="#" class="navController">배송 준비중</a>
                      <a href="#" class="navController">배송중</a>
                      <a href="#" class="navController">배송완료</a>
                    </div>

                    <!-- 작업 버튼 영역 -->
                    <div class="controllerBtnArea">
                      <button type="button" class="btn btn-secondary">발송 처리</button>
                       <button type="button" class="btn btn-secondary">반품처리</button>
                      <button type="button" class="btn btn-secondary">환불처리</button>
                    </div>

                </div>





                <div class="container px-5">
                    <div class=" rounded-3 py-5 px-4 px-md-5 mb-5">

                        <!-- 내부의  -->
                        <div class="row gx-5 justify-content-center">

                            <table class="table  fundingList">
                                <thead>
                                  <tr>
                                    <th scope="col" class="dt1">
                                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                    </th>
                                    <th scope="col" class="dt2">주문번호</th>
                                    <th scope="col" class="dt3">카테고리</th>
                                    <th scope="col" class="dt4">펀딩제목</th>
                                    <th scope="col" class="dt5">주문상태</th>
                                    <th scope="col">펀딩 결제일</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <th scope="row">
                                      <input class="form-check-input" type="checkbox" value="">
                                    </th>
                                    <td>h12132</td>
                                    <td>간식</td>
                                    <td class="fundi ngTitle"><a href="">간식 관련 펀딩 제목입니다.</a></td>
                                    <td>결제 완료</td>
                                    <td>2022//09/21</td>
                                  </tr>
                            
                                  <tr>
                                    <th scope="row">
                                      <input class="form-check-input" type="checkbox" value="">
                                    </th>
                                    <td>h12132</td>
                                    <td>간식</td>
                                    <td class="fundi ngTitle"><a href="">간식 관련 펀딩 제목입니다.</a></td>
                                    <td>결제 완료</td>
                                    <td>2022//09/21</td>
                                  </tr>
                             
                            
                                  <tr>
                                    <th scope="row">
                                      <input class="form-check-input" type="checkbox" value="">
                                    </th>
                                    <td>h12132</td>
                                    <td>간식</td>
                                    <td class="fundi ngTitle"><a href="">간식 관련 펀딩 제목입니다.</a></td>
                                    <td>결제 완료</td>
                                    <td>2022//09/21</td>
                                  </tr>
                             
                            
                                  <tr>
                                    <th scope="row">
                                      <input class="form-check-input" type="checkbox" value="">
                                    </th>
                                    <td>h12132</td>
                                    <td>간식</td>
                                    <td class="fundi ngTitle"><a href="">간식 관련 펀딩 제목입니다.</a></td>
                                    <td>결제 완료</td>
                                    <td>2022//09/21</td>
                                  </tr>
                             
               
                                </tbody>
                              </table>


                              <!-- 페이지 네이션 영역 시작 -->
                            <div class="pagination-area">
                              <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                  <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                      <span aria-hidden="true">&laquo;</span>
                                    </a>
                                  </li>
                                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                                  <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                      <span aria-hidden="true">&raquo;</span>
                                    </a>
                                  </li>
                                </ul>
                              </nav>
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