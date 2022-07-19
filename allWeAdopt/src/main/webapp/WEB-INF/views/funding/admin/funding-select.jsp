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
        <title>펀딩 조회 : ALL WE ADOPT</title>
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
        <link href="${contextPath}/resources/css/funding/funding-write.css" rel="stylesheet" />

        <!-- include libraries(jQuery, bootstrap) -->
        <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>   

        <!-- summer note -->
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        
        <%-- 달콤한 알림 --%>  
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <style>
          h4{
            margin-top:30px;
          }

        </style>
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

	        <jsp:include page="/WEB-INF/views/common/admin-header.jsp" />

        
                
            <section class="py-4">


                <!-- 상단 메뉴 영역. -->
                <div class="text-center mb-5" id="TOT">
                    <h1 class="fw-bolder"> 펀딩 조회하기</h1>
                    <p class="lead fw-normal text-muted mb-0"> 종료된 펀딩 목록을 조회할 수 있습니다. </p>
                </div>

                <!-- 상단 이미지 영역 -->
               
                
                <div class="container px-5">
                    <div class=" rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="row gx-5 justify-content-center">
<%-- ---------------------------------------------------------------------------------------------- --%>

                        
                          <!-- 펀딩 일정 입력 영역 -->
                          <div class="fundingScheduleArea">
                              <p class="fundingSeason">${detail.fundingSeason}</p>
                          </div>

                          <!-- 썸네일 영역 -->
                          <div class="thumbnailArea"> 
                            <h4><i class="fa-regular fa-image"/></i> 썸네일</h4>

                            <div class="previewArea">
                           	   	<c:if test="${detail.fundingThumbnail != null}">
                           	   		<img src="${contextPath}${detail.fundingThumbnail}" class="img-fluid" id="previewImage">
                           	   	</c:if>
                                <c:if test="${detail.fundingThumbnail == null}">
                              		<img src="" class="img-fluid" id="previewImage">
                                </c:if>
                            </div>
                          </div>
                          

                          <!-- 펀딩 카테고리 + 제목 입력 영역 -->
                          <div class="fundingTitle">
                            <h4><i class="fa-solid fa-angles-right"></i> 제목  카테고리</h4>
                            
                            <!-- 제목과 카테고리를 둘다 가두는 DIV -->
                            <div id="titleCategory">
                              <!-- 카테고리 영역-->
                              <div id="fundingCategory">
                                <select class="form-select" disabled aria-label="Default select example" name="categoryNo">
                                  <option value="${detail.categoryNo}"  selected>  
                                  	${detail.categoryName}
                                  </option>
                                </select>
                              </div>
                              <input type="text" name="fundingTitle" id="fundingTitle"  disabled value="${detail.fundingTitle}">
                            </div>
                          </div>


                          <!-- 펀딩 소개 입력 (소제목 컬럼 ) -->
                          <div id="subheadArea">
                            <h4><i class="fa-solid fa-angles-right"></i> 펀딩 소개</h4>
                            <div class="intro">펀딩에 대해 간략한 소제목</div>
                            <textarea name="fundingMiniTitle" id="subheadInput" disabled>${detail.fundingMiniTitle}</textarea>
                          </div>



                          <!-- 펀딩 리워드 작성칸 + 배송비-->
                          <div id="rewardsArea" class="">

                            <h4><i class="fa-solid fa-gift"></i>펀딩 리워드 추가</h4>
                            <div class="intro">리워드를 추가 할 수 있습니다 </div>
                            
                            <div>
                            
                            </div>

                            <table class="table table-bordered">
                              <thead>
                                <th>NO</th>
                                <th>리워드 타이틀</th>
                                <th>리워드 내용</th>
                                <th>리워드 금액</th>
                                <th>리워드 수량</th>
                              </thead>




                              <tbody class="rewardsRows">
	
					
						<c:forEach  var="r" items="${detail.rewardList}">
							<tr>
								<td>${r.rewardNo}</td>
								<td><input type="text" disabled value="${r.rewardTitle}"></td>
								<td style="width:40%;"><input type="text" disabled value="${r.rewardContent}"></td>
								<td><input type="number" disabled value="${r.rewardPrice}"></td>
								<td><input type="number" disabled value="${r.maxRewardNo}"></td>
							</tr>
						</c:forEach>
					
		
                              </tbody>




                            </table>

                            <div id="deliveryFee">

                              <table>
                                <tr>
                                  <td><span><i class="fa-solid fa-truck"></i>배송비</span> </td>
                                  <td>: <input  disabled type="number" id="delivery" name="deliveryFee" value="${detail.deliveryFee}"></td>
                                </tr>
                                <tr>
                                  <td><span><i class="fa-solid fa-truck"></i>목표 후원금</span> </td>
                                  <td>: <input disabled name="targetDonation"  id="targetDonation" value=""></td>
                                </tr>
                                <tr>
                                  <td><span><i class="fa-solid fa-truck"></i>달성 후원금</span> </td>
                                  <td>: <input disabled value="${detail.fullPriceInt}"></td>
                                </tr>
                              </table>

                            </div>
                          </div>

                          <!-- 섬머노트 작성칸 -->
                          <div id="summernoteArea">
                            
                            <h4><i class="fa-solid fa-file-lines"></i> 펀딩 내용</h4>
                            <div class="intro">펀딩 내용을 작성 할 수 있습니다. </div>

                            <textarea id="textarea" disabled style="padding:20px; margin-top:40px" name="fundingContent"></textarea>  

                          </div>



                          <!-- 위에서 선택되는 진행 일정을 작성하는 영역 -->
                          <input type="hidden" id="fundingSeason" name="fundingSeason" value="${param.fundingSeason}">
          
<%-- ---------------------------------------------------------------------------------------------- --%>

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
  
      
        <script>
            let dFee = "${detail.targetDonation}";
            if(dFee != ''){
                    let i = dFee.replaceAll(",","");
                    i = parseInt(i);
                    dFee=i;
                    document.getElementById("targetDonation").value=i;
                }

      $('#textarea').summernote('code', '${detail.fundingContent}');
      $('#textarea').summernote('disable');
        </script>
 <!-- 펀딩 작성 관련 JS -->
        <%-- <script src="${contextPath}/resources/js/funding/funding-write.js"></script> --%>

        <!-- 썸머노트 -->
        <script>
          
        </script>
 
     <%--    <script src="${contextPath}/resources/js/board/summerNote.js"></script> --%>
    </body>
    
</html>