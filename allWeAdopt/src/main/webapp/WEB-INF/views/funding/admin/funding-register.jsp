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
        <title>펀딩 등록 : ALL WE ADOPT</title>
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

    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

	        <jsp:include page="/WEB-INF/views/common/admin-header.jsp" />

        
                
            <section class="py-4">


                <!-- 상단 메뉴 영역. -->
                <div class="text-center mb-5" id="TOT">
                    <h1 class="fw-bolder">신규 펀딩 등록하기</h1>
                    <p class="lead fw-normal text-muted mb-0"> 펀딩을 작성할 수 있는 페이지 </p>
                </div>

                <!-- 상단 이미지 영역 -->
               
                
                <div class="container px-5">
                    <div class=" rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="row gx-5 justify-content-center">
<%-- ---------------------------------------------------------------------------------------------- --%>

<form action="register" method="post" id="submitEvent" name="submitEvent" enctype="multipart/form-data">
                      
                          
                          <!-- 펀딩 일정 입력 영역 -->
                          <div class="fundingScheduleArea">
                            <div>
                              <button type="button" class="btn  fundingBtn btn-outline-success" value=''>2022/08</button>
                              <button type="button" class="btn  fundingBtn btn-outline-success" value=''>2022/09</button>
                              <button type="button" class="btn fundingBtn btn-outline-success"  value=''>2022/10</button>
                            </div>
                          </div>
	
                          <!-- 썸네일 영역 -->
                          <div class="thumbnailArea"> 
                            <h4><i class="fa-regular fa-image"/></i> 썸네일을 등록 해주세요</h4>
                            <div class="intro"> 미등록 시 기본 이미지가 등록됩니다.</div>

                            <div class="previewArea">
                           	   	<c:if test="${detail.fundingThumbnail != null}">
                           	   		<img src="${contextPath}${detail.fundingThumbnail}" class="img-fluid" id="previewImage">
                           	   	</c:if>
                                <c:if test="${detail.fundingThumbnail == null}">
                              		<img src="" class="img-fluid" id="previewImage">
                                </c:if>
                            </div>

                            <div class="profile-area">
                              <label for="input-image">이미지 선택</label>
                              <input type="file" name="uploadImage" id="input-image" accept="image/*">
                              <button type="button" id="deleteBtn">이미지 삭제</button>
                            </div>

                          </div>
                          

                          <!-- 펀딩 카테고리 + 제목 입력 영역 -->
                          <div class="fundingTitle">
                            <h4><i class="fa-solid fa-angles-right"></i> 제목과 카테고리를 입력해주세요</h4>
                            <div class="intro">필수 입력 사항입니다.</div>
                            
                            <!-- 제목과 카테고리를 둘다 가두는 DIV -->
                            <div id="titleCategory">
                              <!-- 카테고리 영역-->
                              <div id="fundingCategory">
                                <select class="form-select" aria-label="Default select example" name="categoryNo">
                                  <option value="${detail.categoryNo}" selected>  
                                  	<c:if test="${detail.categoryName != null}">${detail.categoryName}</c:if>
                                  	<c:if test="${detail.categoryName == null}">카테고리</c:if>
                                  </option>
                                  <option value="1">건강</option>
                                  <option value="2">장난감</option>
                                  <option value="3">간식</option>
                                  <option value="4">사료</option>
                                  <option value="5">의류</option>
                                </select>
                              </div>
                              <input type="text" name="fundingTitle" id="fundingTitle" placeholder="제목을 입력해주세요" value="${detail.fundingTitle}">
                            </div>
                          </div>


                          <!-- 펀딩 소개 입력 (소제목 컬럼 ) -->
                          <div id="subheadArea">
                            <h4><i class="fa-solid fa-angles-right"></i> 펀딩 소개</h4>
                            <div class="intro">펀딩에 대해 간략한 소제목</div>
                            <textarea name="fundingMiniTitle" id="subheadInput">${detail.fundingMiniTitle}</textarea>
                          </div>



                          <!-- 펀딩 리워드 작성칸 + 배송비-->
                          <div id="rewardsArea" class="">

                            <h4><i class="fa-solid fa-gift"></i>펀딩 리워드 추가</h4>
                            <div class="intro">리워드를 추가 할 수 있습니다 </div>
                            
                            <div>
                              <button type="button" class="fa-solid fa-plus" id="addRewardBtn" onclick="addReward()"></button>
                            </div>

                            <table class="table table-bordered">
                              <thead>
                                <th>NO</th>
                                <th>리워드 타이틀</th>
                                <th>리워드 내용</th>
                                <th>리워드 금액</th>
                                <th>리워드 수량</th>
                                <th>추가하기</th>
                              </thead>




                              <tbody class="rewardsRows">
				<c:choose>
					
					<c:when test="${rewardList != null}">
						<c:forEach  var="r" items="${rewardList}">
							<tr>
								<td>${r.rewardNo}</td>
								<td><input type="text" value="${r.rewardTitle}"></td>
								<td><input type="text" value="${r.rewardContent}"></td>
								<td><input type="number" value="${r.rewardPrice}"></td>
								<td><input type="number" value="${r.maxRewardNo}"></td>
								<td><button type="button" class="rewardsAddBtn" onclick="addRewardList()">등록</button></td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:otherwise>
                                <tr>
                                  <td>1</td>
                                  <td><input type="text"></td>
                                  <td><input type="text"></td>
                                  <td><input type="number"></td>
                                  <td><input type="number"></td>
                                  <td><button type="button" class="rewardsAddBtn" onclick="addRewardList()">등록</button></td>
                                </tr>
                                <tr>
                                  <td>2</td>
                                  <td><input type="text"></td>
                                  <td><input type="text"></td>
                                  <td><input type="number"></td>
                                  <td><input type="number"></td>
                                  <td><button type="button" class="rewardsAddBtn"  onclick="addRewardList()">등록</button></td>
                                </tr>
					</c:otherwise>
				</c:choose>
                              </tbody>




                            </table>

                            <div id="deliveryFee">

                              <table>
                                <tr>
                                  <td><span><i class="fa-solid fa-truck"></i>배송비</span> </td>
                                  <td>:  <input type="number" id="delivery" name="deliveryFee" placeholder="배송비를 입력해주세요" value="${detail.deliveryFee}"></td>
                                </tr>
                                <tr>
                                  <td> <span><i class="fa-solid fa-truck"></i>목표 후원금</span> </td>
                                  <td>:<input name="targetDonation"  id="targetDonation" placeholder="목표 후원금을 입력해주세요" value=""></td>
                                </tr>
                              </table>

                            </div>
                          </div>

                          <!-- 섬머노트 작성칸 -->
                          <div id="summernoteArea">
                            
                            <h4><i class="fa-solid fa-file-lines"></i> 펀딩 내용</h4>
                            <div class="intro">펀딩 내용을 작성 할 수 있습니다. </div>

                            <textarea id="summernote" name="fundingContent"></textarea>  

                          </div>



                          <!-- 위에서 선택되는 진행 일정을 작성하는 영역 -->
                          <input type="hidden" name="fundingSeason" value="2020.09">
                          <%-- 리워드목록들 전달하는거  --%>
                          <input type="hidden" id="insertRewardList" name="insertRewardList">
                          <button class="btn btn-primary" id="writeBtn">Button</button>
</form>
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
            const contextPath = "${contextPath}";
            const currentContent = "${detail.fundingContent}";
            let dFee = "${detail.targetDonation}";
        </script>
 <!-- 펀딩 작성 관련 JS -->
        <script src="${contextPath}/resources/js/funding/funding-write.js"></script>

        <!-- 썸머노트 -->
        <script>
          
        </script>
 
        <script src="${contextPath}/resources/js/board/summerNote.js"></script>
    </body>
    
</html>