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
                    
                    <p>게이지바 폭 줄이기, 펀딩 내용 보이게, 현재 펀딩금액, 남은날짜 텍스트 추가 </p>
                        <!-- 펀딩 이미지, 타이틀, 달성률 들어있는 박스 -->
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
                        
                        
                        
                        <div class="text-center py-5">
                            <h1 class="fw-bolder">종료된 펀딩 둘러보기</h1>
                            <p class="lead fw-normal text-muted mb-0">지금까지 All We Adopt가 소개한 펀딩을 둘러보세요.</p>
                        </div>
                        
                        
                        </div>
                        </section>
                        
                        



                            
                        




        

        </main>
        
        <section class="py-5">
                <div class="container px-5">
                    <h2 class="fw-bolder fs-5 mb-4">Featured Stories</h2>
                    <div class="row gx-5">
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
                                <img class="card-img-top" src="https://dummyimage.com/600x350/adb5bd/495057" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">실패</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><div class="h5 card-title mb-3">Another blog post title</div></a>
                                    <p class="card-text mb-0">This text is a bit longer to illustrate the adaptive height of each card. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Josiah Barclay</div>
                                                <div class="text-muted">March 23, 2022 &middot; 4 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/6c757d/343a40" alt="..." />
                                <div class="card-body pt-4 px-4 pb-0">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">성공</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><div class="h5 card-title mb-3">The last blog post title is a little bit longer than the others</div></a>
                                    <p class="card-text mb-0">Some more quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Evelyn Martinez</div>
                                                <div class="text-muted">April 2, 2022 &middot; 10 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-end mb-5 mb-xl-0">
                        <a class="text-decoration-none" href="#!">
                            More stories
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </section>
            
            

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

            // 리워드 마우스 오버
            const rewards = document.getElementsByClassName("reward");
            const rewardOvers = document.getElementsByClassName("rewardOver");

            for(var i=0; i<rewards.length; i++){
                rewards[i].addEventListener("mouseover",function(){
                    this.lastElementChild.classList.add('visable');
                })

                rewards[i].addEventListener("mouseout",function(){
                    this.lastElementChild.classList.remove('visable');
                })
            }
			
            // 스크롤 reward 끝에 닿으면 버튼 보이게?
            // 스크롤Y 값이 header (헤더)
            //				+.fundingTitleBox(펀딩타이틀)
            //				+.middle-btns(중간버튼)
            //				+... 더할값이 많네 .... 담에 계산 해야지..
            		
            var fixBox = document.querySelector('.fixbox');
            
           	// window.scrollY 가 div 합보다 크거나 같을때 반환
            document.addEventListener('scroll', function() {
            	
    		    if(window.scrollY > 1600){
    		    	fixBox.classList.add('visable');
    		    }else{
    		    	fixBox.classList.remove('visable');
    		    }
            });

					    
				

			    

        </script>
    </body>
    
</html>