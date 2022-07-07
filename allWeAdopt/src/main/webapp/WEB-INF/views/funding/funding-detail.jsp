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
        <title>ALL WE ADOPT</title>
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

            
            <!-- 펀딩 이미지, 타이틀, 달성률 들어있는 박스 -->
                <div class="fundingTitleBox">
                    <div class="fundingTitleImage" style="background: url(${contextPath}/resources/images/funding_sample/funding_title_img.png) 50% 0 ;"></div>
                    <div class="fundingTitleText">
                        우리아이 시원하게 여름 쿨매트
                    </div>
                    <div class="bottom-box">
                        <div class="rate-bar"></div>
                        <div class="rate-bar-pink"></div>
                        <div class="rate-text-box"><span class="rate-text"></span><span class="per">%</span></div>
                    </div>
                </div>

            <section class="py-4">



                <div class="container px-5">




                    <div class="row gx-5">



                            
                        <!-- 버튼들 -->
                        <div class="middle-btns">
                            <button class="nowSelect">펀딩 스토리</button>
                            <button>반환 / 정책</button>
                            <button>참여 서포터</button>
                            <button>종료된 펀딩</button>
                        </div>

                        
                        
                        <div class="line"></div>

                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article class="content-box">
                                <div>
                                    <img src="${contextPath}/resources/images/funding_sample/funding_title_img.png">
                                </div>
                                <img src="${contextPath}/resources/images/funding_sample/funding_content_img1.jpg">
                                <img src="${contextPath}/resources/images/funding_sample/funding_content_img2.jpg">
                                <img src="${contextPath}/resources/images/funding_sample/funding_content_img3.jpg">

                            </article>

                            <!-- 영역 분할 필요할때 -->
                            <section>
                                
                            </section>
                        </div>

                        <!-- 오른쪽 영역 -->
                        <div class="col-lg-3 sticky">
                            <!-- d-flex : flex 들어있는 class-->
                            <div class="align-items-center mb-4 fundingRight">
                                <div><span class="month">7월</span> 이달의 펀딩<br>우리아이 시원하게 여름 쿨매트</div>
        
                                <div class="period">
                                    <span class="pointText">12</span>일 남음
                                </div>
                                <div class="donation">
                                    달성금액 <br>
                                    <span class="pointText">320,000 /  880,000</span> 원
                                </div>
                                <div class="supporters">
                                    <span class="pointText">3</span>명의 서포터
                                </div>
                            </div>
                            <div class="align-items-center mb-4" >
                                <button class="fundingBtn">펀딩하기</button>
                                <button class="qnaBtn">문의</button>
                            </div>
                            <div class="reward-box">

                                <div class="reward">
                                    <div class="rew-number">
                                        리워드1
                                    </div>
                                    <div class="rew-price">
                                        108,000<span>원 펀딩</span>
                                    </div>
                                    <div class="rew-title">
                                        슈퍼얼리도그 쿨매트 러그형 S(100x200x1.5cm) 그레이
                                    </div>
                                    <div class="rew-content">
                                        몽뚜뚜 프리미엄 러그형 쿨매트! 3D매쉬 소재로 통풍이 잘되는 애견매트로 S(100x200x1.5cm) 사이즈는 싱글 침대에 함께 사용할 수 있습니다.<br>★ 쿨매트 : 그레이 색상
                                    </div>
                                    <div class="delivery-box">
                                        <span class="deli-title">배송비</span>
                                        <span class="deli-content">0원</span>
                                        <span class="deli-title">리워드 발송 시작일</span>
                                        <span class="deli-content">08월 01일 부터 순차발송</span>
                                    </div>
                                    <div class="stock-box">
                                        <span class="stock">현재 47개 남음 / 제한수량 50개</span>
                                        <span class="order-count">총 3개 펀딩 완료</span>
                                    </div>

                                    <div class="rewardOver">이 리워드 펀딩하기</div>
                                </div>


                                
                                <div class="reward">
                                    <div class="rew-number">
                                        리워드2
                                    </div>
                                    <div class="rew-price">
                                        108,000<span>원 펀딩</span>
                                    </div>
                                    <div class="rew-title">
                                        슈퍼얼리도그 쿨매트 러그형 M(150x250x1.5cm) 그레이
                                    </div>
                                    <div class="rew-content">
                                        몽뚜뚜 프리미엄 러그형 쿨매트! 3D매쉬 소재로 통풍이 잘되는 애견매트로 M(150x250x1.5cm) 사이즈는 싱글 침대에 함께 사용할 수 있습니다.<br>★ 쿨매트 : 그레이 색상
                                    </div>
                                    <div class="delivery-box">
                                        <span class="deli-title">배송비</span>
                                        <span class="deli-content">0원</span>
                                        <span class="deli-title">리워드 발송 시작일</span>
                                        <span class="deli-content">08월 01일 부터 순차발송</span>
                                    </div>
                                    <div class="stock-box">
                                        <span class="stock">현재 47개 남음 / 제한수량 50개</span>
                                        <span class="order-count">총 3개 펀딩 완료</span>
                                    </div>

                                    <div class="rewardOver">이 리워드 펀딩하기</div>
                                </div>
                                


                            </div>
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


        </script>
    </body>
    
</html>