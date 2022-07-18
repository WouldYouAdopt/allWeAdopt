<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>



<c:set var="intro" value="쿠키" />

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

<<<<<<< HEAD
        <!-- main -->
        <link rel="stylesheet" href="${contextPath}/resources/css/default.css">
	    <link rel="stylesheet" href="${contextPath}/resources/css/main_study.css">
=======
        <!-- sweetalert-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
>>>>>>> 725c00c8d0ff285779ecb802893a93f127829ca3

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

        <%-- 카카오 로그인 --%>
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    </head>
	        <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <body class="before-load">
	<div class="loading">
		<svg class="loading-circle">
			<circle cx="50%" cy="50%" r="25"></circle>
		</svg>
	</div>
	<div class="container">
		<section class="scroll-section" id="scroll-section-0">
			<h1 id="count"></h1><h1 style="font-size: 34px;"><br>마리의 유기동물이</h1>
			<div class="sticky-elem sticky-elem-canvas">
				<canvas id="video-canvas-0" width="1920" height="1080"></canvas>
			</div>
			<div class="sticky-elem main-message a">
				<p>가족의 품으로</p>
			</div>
			<div class="sticky-elem main-message b">
				<p>갈 수 있도록</p>
			</div>
			<div class="sticky-elem main-message c">
				<p>All We Adopt</p>
			</div>
			<div class="sticky-elem main-message d">
				<p>로고</p>
			</div>
		</section>
		<section class="scroll-section" id="scroll-section-1">
			<p class="description">
				 
				<strong>매년<br>10만마리의 유기동물</strong><br>
				유기동물 수가 5년 연속 증가해 역대 최대치를 기록합니다. 검역본부가 12일 발표한 2019년 반려동물 보호와 복지관리 실태 에 따르면, 2019년도 연간 유기동물 발생 수는 총 135,791마리였다(유실동물 포함). 전국 지자체 284개 동물보호센터에 입소된 개체만 파악한 수치다. 역대 최초 12만 마리 돌파 1년 만에 13만 마리 돌파 국내 유기동물 발생 수는 2014년 81,147마리까지 감소했다가, 2015년부터 매년 증가하여 지난해 역대 최초로 12만 마리를 돌파했다. 그리고 1년 만에 다시 13만 6천마리까지 발생 수가 증가했다. 전년 대비 12%나 증가한 수치다. 우리나라에서만 매일 평균 372마리 동물이 버려지고 있습니다. 유기동물 발생 수도 증가했지만, 부족한 보호시설과 입양문화에 대한 인식부족으로, 많은 유기동물들이 증가하며, 안락사로 사망하고있습니다. 동물자유연대는 “첫손에 꼽히는 것이 손쉽게 동물을 구입할 수 있는 환경”이라며 “동물을 전시하고 판매하는 것은 동물도 돈만 주면 쉽게 구입할 수 있는 물건이라는 인식을 갖게 만들어 유기동물을 증가시키는 원인이 된다”고 지적합니다.
					현재 대한민국의 대다수의 반려동물은 입양이 아닌 펫샵의 구매로 이루어 지며, 전문가들은 “ 반려동물을 마치 껌을 사듯 돈만 있으면 누구나 다 살 수 있는 구조가 문제” 라면서 “말썽을 피우면 버리거나, 유행하는 견종이 바뀌면 버리고 구입하는 등 반려동물에 대안 인식부재”를 지적합니다. 이런 국민의 인색과 펫샵문화를 사라지게 하기위한 ‘allwe adopt’와 함께해보시는건 어떠세요?
					
			</p>
		</section>
		<section class="scroll-section" id="scroll-section-2">
			<div class="sticky-elem sticky-elem-canvas">
				<canvas id="video-canvas-1" width="1920" height="1080"></canvas>
			</div>
			<div class="sticky-elem main-message a">
				<p>
					<small>소중한 가족을 찾아줍니다.</small>
					
				</p>
			</div>
			<div class="sticky-elem desc-message b">
				<p>
					전국 500곳 이상의 보호소의 유기동물을 컨텍하여, 더 많은 동물이 가족의 곁으로 갈 수 있도록합니다.
				</p>
				<div class="pin"></div>
			</div>
			<div class="sticky-elem desc-message c">
				<p>
					가족을 잃은 반려동물들이 가족들 품으로 갈 수 있는 어답터 제보 서비스를 제공합니다.
				</p>
				<div class="pin"></div>
			</div>
		</section>
		<section class="scroll-section" id="scroll-section-3">
			<p class="mid-message" style="font-size: 34px;">
				<strong>우리집 근처의 동물병원 찾기</strong><br>
				All We Adopt에서 제공하는 우리집 주변의 <br>동물병원의 위치를 알 수 있어요.
			</p>

			
			
			<canvas class="image-blend-canvas" width="1920" height="1080"></canvas>
			<p class="canvas-caption">
				<strong>필요한 물건도 구매하고! 유기동물에게 기부하고!</strong><br>
				All We Adopt의 펀딩으로 우리아이에게 필요한 물건을 구매함과 동시에,
				아직 가족을 찾지못한 친구들을 위해 기부해보세요!
				<br>
				<br>
				그래프~~~~? 링크연결?
			</p>

			
		</section>
	</div>

	
        <script>
            let countBox = document.querySelector('#count'),
                count = 0;

            let counting = setInterval(function () {
                if (count == 10000) {
                    clearInterval(counting);
                    return false;
                }
                count += 100;
                countBox.innerHTML = new Intl.NumberFormat().format(count);
            }, 20);
        </script>


        <!-- main js -->
        <script src="${contextPath}/resources/js/main_study.js"></script>

        <script>
            const contextPath = "${contextPath}";
        </script>



        <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>




    </body>
    
</html>