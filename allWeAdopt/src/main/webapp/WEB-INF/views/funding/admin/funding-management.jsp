<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>펀딩 관리 : ALL WE ADOPT</title>
        
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
        <link href="${contextPath}/resources/css/funding/funding-list.css" rel="stylesheet" />
 
        <!-- 폰트어썸 연결 -->
        <script src="https://kit.fontawesome.com/ea629e8085.js" crossorigin="anonymous"></script>
       </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->

  
	        <jsp:include page="/WEB-INF/views/common/admin-header.jsp" />

    <!-- --------------------------------------------헤더 영역 끝-------------------------------------------- -->
            <section class="py-4">


                <!-- 상단 메뉴 영역. -->
                <div class="text-center mb-5" id="TOT">
                    <h1 class="fw-bolder">펀딩관리</h1>
                    <p class="lead fw-normal text-muted mb-0 lead"> 펀딩을 작성할 수 있는 페이지 </p>
                </div>

                <!-- 상단 이미지 영역 -->
               
                
                <div class="container px-5">
                    <div class=" rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="row gx-5 justify-content-center fundingManagementArea">
                          
                          
                          <!-- 현재 진행중인 펀딩 -->
                          <div id="currentFunding">
                            <h2 class="h3 fw-bolder">현재 진행중 펀딩</h2>
                              <!-- 펀딩 이미지, 타이틀, 달성률 들어있는 박스 -->
                              <!-- 어디를 클릭하던지 현재 진행중인 페이지로 전송.-->
                            <a href="deliveryController">
                              
                              <!-- 펀딩 타이틀 이미지 들어오는 곳 -->
                              <%-- <div id="currentFundingTitle"><p>현재진행중인 펀딩 타이틀 이미지가 들어오는 곳</p></div> --%>
                              <div id="currentFundingTitle" style="background:url('weAllAdopt/')"></div>

                            </a>
                              <div class="btnArea">
                                <button type="button" class="btn btn-secondary" >진행중 펀딩 수정</button>
                                <button type="button" class="btn btn-secondary" onclick='location.href="deliveryController"'>배송 관리</button>
                              </div>

                          </div>
                          <!-- 진행 예정 펀딩 펀딩 -->
                          <div id="scheduleFunding" >
                            <h2 class="h3 fw-bolder">진행 예정 펀딩</h2>
                          
                            <table class="table scheduleFundingTable">
                              <thead>
                                <tr>
                                  <th scope="col">펀딩 번호</th>
                                  <th scope="col">카테고리</th>
                                  <th scope="col">펀딩 제목</th>
                                  <th scope="col">펀딩 예정 일정</th>
                                  <th scope="col">펀딩 금액</th>
                                </tr>
                              </thead>
                              <tbody class="scheduleFundingTbody">
                                <tr>
                                  <th scope="row">1</th>
                                  <td>장난감</td>
                                  <td><a href="">장난감 관련 펀딩입니다.</a></td>
                                  <td>2022/6</td>
                                  <td>1,000,000 WON</td>
                                </tr>
                                <tr>
                                  <th scope="row">2</th>
                                  <td>식품</td>
                                  <td><a href="">식품 관련 펀딩입니다.</a></td>
                                  <td>2022/7</td>
                                  <td>7,540,000 WON</td>
                                </tr>
                              </tbody>
                            </table>
                            
                            <div class="paginationArea">
                              <ul class="pagination pagination-sm">
                                <li class="page-item active" aria-current="page">
                                  <span class="page-link">1</span>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                              </ul>
                            </div>
                          </div>

                          <!-- 종료된 펀딩 -->
                          <div id="endedFunding" >
                            <h2 class="h3 fw-bolder">종료된 펀딩</h2>

                            <table class="table endedFundingTable">
                              <thead>
                                <tr>
                                  <th scope="col">펀딩 번호</th>
                                  <th scope="col">카테고리</th>
                                  <th scope="col">펀딩 제목</th>
                                  <th scope="col">펀딩 진행기간</th>
                                  <th scope="col">달성률</th>
                                  <th scope="col">달성금액</th>
                                </tr>
                              </thead>
                              <tbody class="endedFundingTbody">
                                <tr>
                                  <th scope="row">1</th>
                                  <td>장난감</td>
                                  <td><a href="">장난감 관련 펀딩입니다.</a></td>
                                  <td>2022/6</td>
                                  <td>100%</td>
                                  <td>1,000,000 WON</td>
                                </tr>
                                <tr>
                                  <th scope="row">2</th>
                                  <td>영양제</td>
                                  <td><a href="">영양제 관련 종료된 펀딩입니다.</a></td>
                                  <td>2022/5</td>
                                  <td>100%</td>
                                  <td>1,000,000 WON</td>
                                </tr>
                                <tr>
                                  <th scope="row">3</th>
                                  <td>카테고리</td>
                                  <td><a href="">~~ 관련 종료된 펀딩입니다.</a></td>
                                  <td>2022/6</td>
                                  <td>66%</td>
                                  <td>1,000,000 WON</td>
                                </tr>
                                <tr>
                                  <th scope="row">4</th>
                                  <td>카테고리</td>
                                  <td><a href="">~~ 관련 종료된 펀딩입니다.</a></td>
                                  <td>2022/6</td>
                                  <td>81%</td>
                                  <td>1,000,000 WON</td>
                                </tr>
                                <tr>
                                  <th scope="row">5</th>
                                  <td>카테고리</td>
                                  <td><a href="">~~ 관련 종료된 펀딩입니다.</a></td>
                                  <td>2022/6</td>
                                  <td>56%</td>
                                  <td>1,000,000 WON</td>
                                </tr>
                                <tr>
                                  <th scope="row">6</th>
                                  <td>카테고리</td>
                                  <td><a href="">~~ 관련 종료된 펀딩입니다.</a></td>
                                  <td>2022/6</td>
                                  <td>91%</td>
                                  <td>1,000,000 WON</td>
                                </tr>
                                <tr>
                                  <th scope="row">7</th>
                                  <td>카테고리</td>
                                  <td><a href="">~~ 관련 종료된 펀딩입니다.</a></td>
                                  <td>2022/6</td>
                                  <td>86%</td>
                                  <td>1,000,000 WON</td>
                                </tr>
                                <tr>
                                  <th scope="row">8</th>
                                  <td>카테고리</td>
                                  <td><a href="">~~ 관련 종료된 펀딩입니다.</a></td>
                                  <td>2022/6</td>
                                  <td>90%</td>
                                  <td>1,000,000 WON</td>
                                </tr>
                                <tr>
                                  <th scope="row">9</th>
                                  <td>카테고리</td>
                                  <td><a href="">~~ 관련 종료된 펀딩입니다.</a></td>
                                  <td>2022/6</td>
                                  <td>11%</td>
                                  <td>1,000,000 WON</td>
                                </tr>
                                <tr>
                                  <th scope="row">10</th>
                                  <td>카테고리</td>
                                  <td><a href="">~~ 관련 종료된 펀딩입니다.</a></td>
                                  <td>2022/6</td>
                                  <td>20%</td>
                                  <td>1,000,000 WON</td>
                                </tr>
                              </tbody>
                            </table>
                            
                            <div class="paginationArea">
                              <ul class="pagination pagination-sm">
                                <li class="page-item active" aria-current="page">
                                  <span class="page-link">1</span>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item"><a class="page-link" href="#">6</a></li>
                              </ul>
                            </div>
                          </div>
                          </divi>

                          
                        </div><!-- 내부 영역! 끝 -->
                    </div>
                </div>
            </section>
        </main>






        <!-- --------------------------------------------실제 컨텐츠 영역 끝-------------------------------------------- -->
        <!-- Footer-->
       
        <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />



        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
       
        <!-- 펀딩 작성 관련 JS -->
        <script src="/allWeAdopt/src/main/webapp/resources/js/funding/funding-write.js"></script>
    </body>
</html>
