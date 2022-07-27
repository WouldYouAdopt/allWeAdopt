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
        <title>내 포인트 조회</title>

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

        <!-- myPage-updateInfo.css-->
        <link rel="stylesheet" href="${contextPath}/resources/css/point/wordle.css">

        <!-- sweetalert-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        <!-- 제이쿼리 -->
		<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <style>
			
			button{border:0;margin:0;padding:0;}
			
			.title{margin-top:50px;text-align:center;}
			
			.box-roulette{ /* 전체 박스 */
				position:relative;
				margin:50px auto;
				width:500px;
				height:500px;
				border:10px solid #ccc;
				border-radius:50%;
				background:#ccc;
				overflow:hidden;
			}
			.box-roulette .markers{ /* 세모 만드는거구나 */
				position:absolute;
				left:50%; top:0;
				margin-left:-25px;
				width:0; height:0; 
				border:25px solid #fff;
				border-left-color:transparent;
				border-right-color:transparent;
				border-bottom-color:transparent;
				z-index:9999;
			}
			.box-roulette .roulette{ /* 룰렛 돌아가는 부분 */
				position:relative;
				width:100%; height:100%; overflow:hidden;
			}
			.box-roulette .item{ /* 무지개 각 칸 d i v */
				position:absolute;
				top:0;width:0;height:0;
				border:0 solid transparent;
				transform-origin:0 100%;
			}
			.box-roulette .label{ /* 룰렛에 글자구나  */
				position:absolute;
				left:0px;top:0;color:#fff;
				white-space:nowrap;
				transform-origin:0 0;
			}
			.box-roulette .label .text{
				display:inline-block;
				font-size:20px;
				font-weight:bold;
				line-height:1;
				vertical-align
				:middle;
			}
			
			#btn-start{
				display:block;
				position:absolute;
				left:50%;top:50%;
				margin:-50px 0 0 -50px;
				width:100px;height:100px;
				font-weight:bold;
				background:#fff;
				border-radius:50px;
				z-index:1;
				cursor:pointer;
			}

        </style>

    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

            <!-- 헤더 -->
            <jsp:include page="/WEB-INF/views/common/header.jsp" />

            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class=" rounded-3 py-5 px-4 px-md-5 mb-5">


<%-- --------------------------------------------------------------------------------- --%>
                        
						<jsp:include page="/WEB-INF/views/common/point-header.jsp" />

                        <div class="text-center mb-1">
                            <h1 class="fw-bolder">Roulette</h1>
                            <p class="lead fw-normal text-muted mb-0">100포인트로 All We Adopt 펀딩에 사용 가능한 포인트를 뽑아가세요!</p>
                        </div>

                        <div class="row gx-5 justify-content-center" id="wordleHeader">
                  
                            <span></span>

                        </div>

                        <div class="box-roulette">
							<div class="markers"></div>
							<button type="button" id="btn-start">
								<span class="fa-solid fa-paw">
							</button>
							<div class="roulette" id="roulette"></div>
						</div>

<%-- --------------------------------------------------------------------------------- --%>

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
     	<!-- 제이쿼리 로테이트 -->
        <script src="${contextPath}/resources/js/roulette.js"></script>
     	
        
        <script src="${contextPath}/resources/js/jQueryRotate.js"></script>
        
        
        <script>
        let memberPoint = "${loginMember.memberPoint}";
        </script>

    </body>
</html>
