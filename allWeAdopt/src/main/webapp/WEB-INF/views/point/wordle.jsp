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

        <style>
             .button-pink{
                background-color: rgb(251, 131, 107);
                border: none;
            }
            .button-pink:hover{
                background-color: rgb(251, 131, 107);
                border: none;
            }
        </style>

    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

            <!-- 헤더 -->
            <jsp:include page="/WEB-INF/views/common/header.jsp" />

            <!-- 마이페이지 nav -->
            <jsp:include page="/WEB-INF/views/common/mypage-header.jsp" />

            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class=" rounded-3 py-5 px-4 px-md-5 mb-5">


<%-- --------------------------------------------------------------------------------- --%>
<ul class="nav">
    <li class="nav-item">
      <a class="nav-link active" aria-current="page" href="#">Wordle</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">roulette</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Link</a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled">Disabled</a>
    </li>
  </ul>


                        <div class="text-center mb-5">
                            <h1 class="fw-bolder">wordle</h1>
                            <p class="lead fw-normal text-muted mb-0">제시어를 맞쳐보세요!</p>
                        </div>

                        <div class="row gx-5 justify-content-center" id="wordleHeader">
                  
                            <span>단어를 입력해주세요</span>

                        </div>

                        <div class="row gx-5 justify-content-center">
                  
                            <div id="wordleWrapper">
                                <div class="wordleRow">
                                    <div class="inputWordle accurately">a</div>
                                    <div class="inputWordle">p</div>
                                    <div class="inputWordle">p</div>
                                    <div class="inputWordle similar">l</div>
                                    <div class="inputWordle">e</div>
                                </div>
                                <div class="wordleRow">
                                    <div class="inputWordle"></div>
                                    <div class="inputWordle"></div>
                                    <div class="inputWordle"></div>
                                    <div class="inputWordle"></div>
                                    <div class="inputWordle"></div>
                                </div>
                                <div class="wordleRow">
                                    <div class="inputWordle"></div>
                                    <div class="inputWordle"></div>
                                    <div class="inputWordle"></div>
                                    <div class="inputWordle"></div>
                                    <div class="inputWordle"></div>
                                </div>
                                <div class="wordleRow">
                                    <div class="inputWordle"></div>
                                    <div class="inputWordle"></div>
                                    <div class="inputWordle"></div>
                                    <div class="inputWordle"></div>
                                    <div class="inputWordle"></div>
                                </div>

                            </div>

                           </div>

<%-- --------------------------------------------------------------------------------- --%>

                    </div>
            </section>
        </main>

        <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>

    </body>
</html>
