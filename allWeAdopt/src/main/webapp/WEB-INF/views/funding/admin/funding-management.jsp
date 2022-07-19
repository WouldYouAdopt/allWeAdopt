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

            <!-- 헤더 -->
            <%-- <c:if test="${loginMember.memberType =='M' || loginMember.memberType == 'K'}">
                <jsp:include page="/WEB-INF/views/common/header.jsp" />
                <jsp:include page="/WEB-INF/views/common/mypage-header.jsp" />
            </c:if>
            <c:if test="${loginMember.memberType =='A'}"> --%>
                <jsp:include page="/WEB-INF/views/common/admin-header.jsp" />
            <%-- </c:if> --%>

    <!-- --------------------------------------------헤더 영역 끝-------------------------------------------- -->
            <section class="py-4">

                <!-- 상단 메뉴 영역. -->
                <div class="text-center mb-5 pt-5">
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
                            <a href="${contextPath}/admin/funding/register?fundingNo=${map.now.fundingNo}&fundingSeason=${map.now.fundingSeason}">

                              <%-- 달성 금액 : ${map.now.fullPrice}
                              달성 금액 : ${map.now.fullPriceInt} --%>
                              <!-- 펀딩 타이틀 이미지 들어오는 곳 -->
							
                              <div id="currentFundingTitle" style="background:url('${contextPath}${map.now.fundingThumbnail}') 50% 50%; background-size:cover;">
                              <p>[${map.now.categoryName}] ${map.now.fundingTitle} &nbsp;(${map.now.salesRate}% 달성중)</p>
                              </div>

                            </a>
                              <div class="btnArea">
                              
                                <button type="button" class="btn btn-secondary" onclick='location.href="register?fundingNo=${map.now.fundingNo}&fundingSeason=${map.now.fundingSeason}"'>진행중 펀딩 수정</button>
                                <button type="button" class="btn btn-secondary" onclick='location.href="delivery/${nowFundingNo}/1"'>배송 관리</button>
                              </div>

                          </div>
                          
                          <!-- 진행 예정 펀딩 펀딩 -->
                          
                          <div class="my-5">
                            <h2 class="h3 fw-bolder">진행 예정 펀딩</h2>
                         
                            <div class="d-flex justify-content-between">
                            	<c:forEach begin="0" end="2" var="i">
	                            	<c:if test="${map.nextSeason[0]==map.sList[i].fundingSeason}">
	                            		<c:set var="next0" value="${map.sList[i]}"/>                          	
	                            	</c:if>
	                            	<c:if test="${map.nextSeason[1]==map.sList[i].fundingSeason}">                             	
	                            		<c:set var="next1" value="${map.sList[i]}"/>                          	
	                            	</c:if> 
	                            	<c:if test="${map.nextSeason[2]==map.sList[i].fundingSeason}">                             	
	                            		<c:set var="next2" value="${map.sList[i]}"/>                          	
	                            	</c:if>                            	
                           		</c:forEach>
                           		
                           			<!-- 1달 뒤 펀딩 -->
                           			<!-- 예약없을때 -->
                           			<c:if test="${empty next0}">
                           			<div class="fundingInfoS">
	                            	<a href="${contextPath}/admin/funding/register?fundingSeason=${map.nextSeason[0]}">
		                            	<div class="fundingImgS">
		                            		<div class="textS">${map.nextSeason[0]}</div>
		                            	</div>
	                            		<div class="hover">펀딩 등록</div>
		                            	<div class="infoS"></div>
	                            	</a>
	                            	</div>
                           			</c:if>

                           			<!-- 예약있을때  -->
                           			<c:if test="${!empty next0}">
	                            	<div class="fundingInfoS">
			                            <a href="${contextPath}/admin/funding/register?fundingNo=${next0.fundingNo}&fundingSeason=${map.nextSeason[0]}">
		                            	<div class="fundingImgS" style="background:url('${contextPath}${next0.fundingThumbnail}') 50% 0; background-size:cover;">
		                            		<div class="textS">${map.nextSeason[0]}</div>
		                            	</div>
		                            	<div class="hover">펀딩 수정</div>
		                            	<div class="infoS">[${next0.categoryName}] ${next0.fundingTitle}</div>
		                            	</a>
	                            	</div>
	                            	<!-- <a href=""><span class="preview">미리보기</span></a> -->
	                            	</c:if>
	                            	
	                            	
	                            	<!-- 2달 뒤 펀딩 -->
                           			<c:if test="${empty next1}">
                           			<div class="fundingInfoS">
	                            	<a href="${contextPath}/admin/funding/register?fundingSeason=${map.nextSeason[1]}">
		                            	<div class="fundingImgS">
		                            		<div class="textS">${map.nextSeason[1]}</div>
		                            	</div>
		                            	<div class="hover">펀딩 등록</div>
		                            	<div class="infoS"></div>
	                            	</a>
	                            	</div>
                           			</c:if>
                           			<c:if test="${!empty next1}">
	                            	<div class="fundingInfoS">
			                            <a href="${contextPath}/admin/funding/register?fundingNo=${next1.fundingNo}&fundingSeason=${map.nextSeason[1]}">
		                            	<div class="fundingImgS" style="background:url('${contextPath}${next1.fundingThumbnail}') 50% 0; background-size:cover;">
		                            		<div class="textS">${map.nextSeason[1]}</div>
		                            	</div>
		                            	<div class="hover">펀딩 수정</div>
		                            	<div class="infoS">[${next1.categoryName}] ${next0.fundingTitle}</div>
		                            	</a>
	                            	</div>
	                            	</c:if>
	                            	
	                            	
	                            	<!-- 3달 뒤 펀딩 -->
                           			<c:if test="${empty next2}">
                           			<div class="fundingInfoS">
	                            	<a href="${contextPath}/admin/funding/register?fundingSeason=${map.nextSeason[2]}">
		                            	<div class="fundingImgS">
		                            		<div class="textS">${map.nextSeason[2]}</div>
		                            	</div>
		                            	<div class="hover">펀딩 등록</div>
		                            	<div class="infoS"></div>
	                            	</a>
	                            	</div>
                           			</c:if>
                           			<c:if test="${!empty next2}">
	                            	<div class="fundingInfoS">
			                            <a href="${contextPath}/admin/funding/register?fundingNo=${next2.fundingNo}&fundingSeason=${map.nextSeason[2]}">
		                            	<div class="fundingImgS" style="background:url('${contextPath}${next0.fundingThumbnail}') 50% 0; background-size:cover;">
		                            		<div class="textS">${map.nextSeason[2]}</div>
		                            	</div>
		                            	<div class="hover">펀딩 수정</div>
		                            	<div class="infoS">[${next2.categoryName}] ${next2.fundingTitle}</div>
		                            	</a>
	                            	</div>
	                            	</c:if>
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
                                  <td><a href="${contextPath}/admin/funding/select?fundingNo=${map.endList[i].fundingNo}">${map.endList[i].fundingTitle}</a></td>
                                  <td>${map.endList[i].fundingSeason}</td>
                                  <td>${map.endList[i].salesRate}%</td>
                                  <td>${map.endList[i].fullPriceInt}WON</td>
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
        <script src="${contextPath}/resources/js/funding/funding-management.js"></script>
    </body>
</html>
