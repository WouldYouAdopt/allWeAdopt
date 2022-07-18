<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>펀딩 관리 : ALL WE ADOPT</title>
        
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
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
        <link href="${contextPath}/resources/css/funding/funding-list.css" rel="stylesheet" />
        
        <style>
        .row > * {
        	padding: 0 !important;
        }
        </style>
 
       </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->

  
	        <!-- 헤더 -->
            <c:if test="${loginMember.memberType =='A'}">
                <jsp:include page="/WEB-INF/views/common/admin-header.jsp" />
            </c:if>

    <!-- --------------------------------------------헤더 영역 끝-------------------------------------------- -->
            <section class="py-4">


                <!-- 상단 메뉴 영역. -->
                <div class="text-center mb-5" id="TOT">
                    <h1 class="fw-bolder">펀딩관리</h1>
                    <p class="lead fw-normal text-muted mb-0 lead"> 펀딩리스트를 관리하고 새로운 펀딩을 등록할 수 있습니다 </p>
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
                            <a href="${contextPath}/admin/funding/register?fundingNo=${map.now.fundingNo}">
                              
                              사진 : <img src="${contextPath}${map.now.fundingThumbnail}"><br>
                              타이틀 : ${map.now.fundingTitle}
                              달성률 : ${map.now.salesRate}
                              달성 금액 : ${map.now.fullPrice}
                              달성 금액 : ${map.now.fullPriceInt}
                              <!-- 펀딩 타이틀 이미지 들어오는 곳 -->

                              <div id="currentFundingTitle" style="background:url('${contextPath}/admin/funding/register?fundingNo=${map.now.fundingNo}')"></div>

                            </a>
                              <div class="btnArea">
                                <button type="button" class="btn btn-secondary" >진행중 펀딩 수정</button>
                                <button type="button" class="btn btn-secondary" onclick='location.href="deliveryController"'>배송 관리</button>
                              </div>

                          </div>
                          
                          <!-- 진행 예정 펀딩 펀딩 -->
                          
                          <div class="my-5">
                            <h2 class="h3 fw-bolder">진행 예정 펀딩</h2>
                            펀딩 등록 안되어 있어도 펀딩 시즌 날짜 들어가 있어야함.. 오늘날짜>다음달 구하기 해서 3달 정보 가져오기. 시즌으로 대조해서 해당 시즌에 값 넣기
                         
                            <div class="d-flex justify-content-between">
                            	<c:forEach begin="0" end="${fn:length(map.sList)-1}" var="i">
                            	<a href="${contextPath}/admin/funding/register?fundingNo=${map.sList[0].fundingNo}">
                            	<div class="fundingInfoS">
	                            	<div class="fundingImgS" style="background:url('${contextPath}${map.sList[0].fundingThumbnail}') 50% 0; background-size:cover;">
	                            		<div class="textS">${map.sList[0].fundingSeason}</div>
	                            	</div>
	                            	<div class="infoS">[${map.sList[0].categoryName}] ${map.sList[0].fundingTitle}</div>
                            	</div>
                            	</a>
                            	</c:forEach>
                            	
                            	<div class="fundingInfoS">
	                            	<div class="fundingImgS" style="background:url('${contextPath}/resources/images/fundingThumbnail/funding_sample4.png') 50% 0; background-size:cover;">
	                            		<div class="textS">2022/09</div>
	                            	</div>
	                            	<div class="infoS">[카테고리] 제목은 떠야지</div>
                            	</div>
                            	
                            	<div class="fundingInfoS">
	                            	<div class="fundingImgS registBtn">
	                            		<div class="textS">2022/10</div>
	                            	</div>
	                            	<div class="infoS">마우스오버시 [등록하기]로 바뀌기 js에서</div>
	                            	
                            </div>
                           
                            <!-- <table class="table scheduleFundingTable">
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
                            </table> -->
                            
                            <!-- <div class="paginationArea">
                              <ul class="pagination pagination-sm">
                                <li class="page-item active" aria-current="page">
                                  <span class="page-link">1</span>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                              </ul>
                            </div> -->
                          </div>
                        </div>



                        <!-- 종료된 펀딩 -->
                        <div id="scheduleFunding" >
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
                              
                              	<c:forEach var="i" begin="0" end="${fn:length(map.endList)-1}">
                                <tr>
                                  <th scope="row">${map.endList[i].fundingNo}</th>
                                  <td>${map.endList[i].categoryName}</td>
                                  <td><a href="${contextPath}/admin/funding/register?fundingNo=${map.endList[i].fundingNo}">${map.endList[i].fundingTitle}</a></td>
                                  <td>${map.endList[i].fundingSeason}</td>
                                  <td>${map.endList[i].salesRate}%</td>
                                  <td>${map.endList[i].fullPrice}WON</td>
                                </tr>
                              	</c:forEach>
                                
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
