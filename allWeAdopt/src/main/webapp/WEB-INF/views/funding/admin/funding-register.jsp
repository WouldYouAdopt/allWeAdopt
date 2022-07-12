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
                          
                          <form action=""></form>
                          <!-- 펀딩 일정 입력 영역 -->
                          <div class="fundingScheduleArea">
                            <div>
                              <button type="button" class="btn fundingBtn btn-secondary" value='unable'>2022/06</button>
                              <button type="button" class="btn  fundingBtn btn-outline-success" value=''>2022/07</button>
                              <button type="button" class="btn  fundingBtn btn-outline-success" value=''>2022/08</button>
                              <button type="button" class="btn  fundingBtn btn-outline-success" value=''>2022/09</button>
                              <button type="button" class="btn fundingBtn btn-outline-success"  value=''>2022/10</button>
                            </div>
                          </div>

                          <!-- 썸네일 영역 -->
                          <div class="thumbnailArea"> 
                            <div>썹네일을 입력해주세요</div>

                            <div class="previewArea">
                              <img src="" class="img-fluid" id="previewImage">
                            </div>

                            <div class="profile-area">
                              <label for="input-image">이미지 선택</label>
                              <input type="file" name="uploadImage" id="input-image" accept="image/*">
                              <button id="deleteBtn">이미지 삭제</button>
                            </div>

                          </div>
                          

                          <!-- 펀딩 카테고리 + 제목 입력 영역 -->
                          <div class="fundingTitle">

                            <div class="intro">제목과 카테고리를 입력해주세요</div>
                            
                            <!-- 제목과 카테고리를 둘다 가두는 DIV -->
                            <div id="titleCategory">
                              <!-- 카테고리 영역-->
                              <div id="fundingCategory">
                                <select class="form-select" aria-label="Default select example">
                                  <option selected>카테고리</option>
                                  <option value="1">건강</option>
                                  <option value="2">장난감</option>
                                  <option value="3">간식</option>
                                  <option value="4">사료</option>
                                  <option value="5">의류</option>
                                </select>
                              </div>
                              <input type="text" name="" id="" placeholder="제목을 입력해주세요">
                            </div>
                          </div>


                          <!-- 펀딩 소개 입력 (소제목 컬럼 ) -->
                          <div id="subheadArea">
                            <div>펀딩 소개</div>
                            <div class="intro">펀딩에 대해 간략한 소제목</div>
                            <textarea name="" id="subheadInput"></textarea>
                          </div>



                          <!-- 펀딩 리워드 작성칸 + 배송비-->
                          <div id="rewardsArea" class="">

                            <div>펀딩 리워드 추가</div>
                            
                            
                            <div>
                              <button class="fa-solid fa-plus" id="addRewardBtn" onclick="addReward()"></button>
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
                                <tr>
                                  <td>1</td>
                                  <td><input type="text"></td>
                                  <td><input type="text"></td>
                                  <td><input type="text"></td>
                                  <td><input type="text"></td>
                                </tr>
                                <tr>
                                  <td>2</td>
                                  <td><input type="text"></td>
                                  <td><input type="text"></td>
                                  <td><input type="text"></td>
                                  <td><input type="text"></td>
                                </tr>
                              </tbody>

                            </table>

                            <div id="deliveryFee">
                              <span>배송비 : </span><input type="text" placeholder="배송비를 입력해주세요">
                            </div>
                          </div>

                          <!-- 섬머노트 작성칸 -->
                          <div id="summernoteArea">
                            
                            <div><h5>펀딩 내용</h5></div>
                            <textarea name="" id="">섬머노트 추가 예정</textarea>

                          </div>


                          <!-- 위에서 선택되는 진행 일정을 작성하는 영역 -->
                          <input type="hidden" name="예정일" value="onsubmit함수 수행 시 대입될 예정">

                          <button class="btn btn-primary" id="writeBtn">Button</button>
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
  
        <!-- 펀딩 작성 관련 JS -->
        <script src="${contextPath}/resources/js/funding/funding-write.js"></script>
    </body>
    
</html>