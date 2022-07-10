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
        <link href="${contextPath}/resources/css/funding/funding-detail.css" rel="stylesheet" />

        <style>
            .nav-text-color{
                /* color: rgb(251, 131, 107); */
                color: black;
            }
           
            .secession-button{
                border: 1px solid rgba(255, 255, 255, 0.3);
                border-radius: 5px;
            }
            .nav-text-color:hover {
                color: rgb(251, 131, 107);
            }
            .bg-pink {
            —bs-bg-opacity: 1;
            background-color: rgb(251, 131, 107);
            }


            .st0{fill:#373737;}
            .st1{fill:#FB836B;}
            .st2{fill:none;stroke:#373737;stroke-width:7.3;stroke-miterlimit:10;}

        </style>
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

	        <jsp:include page="/WEB-INF/views/common/header.jsp" />

            


            <section class="py-4">



                <div class="container px-5">


                     	<div class="text-center py-5">
                            <h1 class="fw-bolder">현재 진행중인 펀딩</h1>
                            <p class="lead fw-normal text-muted mb-0">한 달에 한번의 펀딩, 이번달 All We Adopt의 펀딩을 소개합니다.</p>
                        </div>
                    

                        <!-- 펀딩 이미지, 타이틀, 달성률 들어있는 박스 -->
                        <a href="${contextPath}/funding/detail?page=1">
	                        <div class="fundingTitleBox nowList">
	                            <div class="fundingTitleImage" style="background: url(${contextPath}/resources/images/funding_sample/funding_title_img.png) 50% 0 ;"></div>
	                            <div class="fundingTitleText">
	                                이달의 펀딩<br>우리아이 여름 쿨매트                            
	                            </div>
	                            <div class="bottom-box">
	                                <div class="rate-bar"></div>
	                                <div class="rate-bar-pink"></div>
	                                <div class="rate-text-box"><span class="rate-text"></span><span class="per">%</span></div>
	                            </div>
	                        </div>
                        </a>
                        
                        
                        
                        
                        
                        
				</div>
				</section>
                        
                        
                        
                        
                <section class="py-5">
                      <div class="text-center py-5">
                            <h1 class="fw-bolder">종료된 펀딩 둘러보기</h1>
                            <p class="lead fw-normal text-muted mb-0">지금까지 All We Adopt가 소개한 펀딩을 둘러보세요.</p>
                        </div>  
                <div class="container px-5">
                    <!-- <h2 class="fw-bolder fs-5 mb-4" style="text-align:right">Featured Stories</h2> -->
                    <div class="row gx-5 mb-5" style="
    overflow: auto;
    overflow-y:hidden;
    flex-wrap:nowrap; ;
">
                    
                    
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
                                <div class="card-body pt-4 px-4 pb-0">
                                    <div class="badge bg-gradient mb-2 pd-3" style="background:rgb(251, 131, 107)">성공</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="${contextPath}/funding/detail/202206"><div class="h5 card-title mb-3">안꼬이는 리드줄과 폭신한 하네스</div></a>
                                    <p class="card-text mb-0">반려견 하네스로 돌아온 반려견 리드줄 최고 평점 메이커 리드퍼피! 차분한 색상의 파스텔톤 하네스를 앙꼬줄과 같이 만나보세요!</p>
                                </div>
                                <div class="card-footer p-4 pt-4 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <div class="small">
                                                <div class="fw-bold">달성률 120% / 880,000원</div>
                                                <div class="text-muted">진행 기간 2022.02. 01 ~ 2022.02.28</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
                                <div class="card-body pt-4 px-4 pb-0">
                                    <div class="badge bg-gradient mb-2 pd-3" style="background:rgb(251, 131, 107)">성공</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><div class="h5 card-title mb-3">안꼬이는 리드줄과 폭신한 하네스</div></a>
                                    <p class="card-text mb-0">반려견 하네스로 돌아온 반려견 리드줄 최고 평점 메이커 리드퍼피! 차분한 색상의 파스텔톤 하네스를 앙꼬줄과 같이 만나보세요!</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <div class="small">
                                                <div class="fw-bold">달성률 120% / 880,000원</div>
                                                <div class="text-muted">진행 기간 2022.02. 01 ~ 2022.02.28</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
                                <div class="card-body pt-4 px-4 pb-0">
                                    <div class="badge bg-gradient mb-2 pd-3" style="background:rgb(251, 131, 107)">성공</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><div class="h5 card-title mb-3">안꼬이는 리드줄과 폭신한 하네스</div></a>
                                    <p class="card-text mb-0">반려견 하네스로 돌아온 반려견 리드줄 최고 평점 메이커 리드퍼피! 차분한 색상의 파스텔톤 하네스를 앙꼬줄과 같이 만나보세요!</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <div class="small">
                                                <div class="fw-bold">달성률 120% / 880,000원</div>
                                                <div class="text-muted">진행 기간 2022.02. 01 ~ 2022.02.28</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
                                <div class="card-body pt-4 px-4 pb-0">
                                    <div class="badge bg-gradient mb-2 pd-3" style="background:rgb(251, 131, 107)">성공</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><div class="h5 card-title mb-3">안꼬이는 리드줄과 폭신한 하네스</div></a>
                                    <p class="card-text mb-0">반려견 하네스로 돌아온 반려견 리드줄 최고 평점 메이커 리드퍼피! 차분한 색상의 파스텔톤 하네스를 앙꼬줄과 같이 만나보세요!</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <div class="small">
                                                <div class="fw-bold">달성률 120% / 880,000원</div>
                                                <div class="text-muted">진행 기간 2022.02. 01 ~ 2022.02.28</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
<!--                     <div class="text-end mb-5 mb-xl-0">
                        <a class="text-decoration-none" href="#!">
                            More stories
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div> -->
                    
                    
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
        <script>
            // 달성률 카운트
            $(function() {
                var cnt0 = 0;
                counterFn();

                function counterFn() {

                    id0 = setInterval(count0Fn, 30);

                    function count0Fn() {
                        cnt0++;
                        if (cnt0 > 82) {
                            clearInterval(id0);
                        } else {
                            $(".rate-text").text(cnt0);
                        }
                    }
                }
		    });


			

					    
				

			    

        </script>
    </body>
    
</html>