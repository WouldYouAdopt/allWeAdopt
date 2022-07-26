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
        <link rel="stylesheet" href="${contextPath}/resources/css/point/wordle-style.css">
        <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.4/dist/web/variable/pretendardvariable.css" />

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

        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet"/>
 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

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
                            <a class="nav-link" href="${contextPath}/point/wordle">Wordle</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" href="${contextPath}/point/roulette">roulette</a>
                            </li>

                            <!-- 로그인한 회원만 조회 가능. -->
                            <c:if test="${ !empty sessionScope.loginMember }">
                                <li class="nav-item">
                                <a class="nav-link" href="${contextPath}/member/myPage/point">내 포인트 조회</a>
                                </li>
                            </c:if>
                        </ul>

                        <h1> Wordle </h1>

                        <div id="game-board">

                        </div>

                        <div id="keyboard-cont">
                            <div class="first-row">
                                <button class="keyboard-button">q</button>
                                <button class="keyboard-button">w</button>
                                <button class="keyboard-button">e</button>
                                <button class="keyboard-button">r</button>
                                <button class="keyboard-button">t</button>
                                <button class="keyboard-button">y</button>
                                <button class="keyboard-button">u</button>
                                <button class="keyboard-button">i</button>
                                <button class="keyboard-button">o</button>
                                <button class="keyboard-button">p</button>
                            </div>
                            <div class="second-row">
                                <button class="keyboard-button">a</button>
                                <button class="keyboard-button">s</button>
                                <button class="keyboard-button">d</button>
                                <button class="keyboard-button">f</button>
                                <button class="keyboard-button">g</button>
                                <button class="keyboard-button">h</button>
                                <button class="keyboard-button">j</button>
                                <button class="keyboard-button">k</button>
                                <button class="keyboard-button">l</button>
                            </div>
                            <div class="third-row">
                                <button class="keyboard-button">Del</button>
                                <button class="keyboard-button">z</button>
                                <button class="keyboard-button">x</button>
                                <button class="keyboard-button">c</button>
                                <button class="keyboard-button">v</button>
                                <button class="keyboard-button">b</button>
                                <button class="keyboard-button">n</button>
                                <button class="keyboard-button">m</button>
                                <button class="keyboard-button">Enter</button>
                            </div>
                    </div>

<%-- --------------------------------------------------------------------------------- --%>

                    </div>
            </section>
        </main>

        <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <script>
        
        const contextPath = "${contextPath}";

        </script>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

        <script src="${contextPath}/resources/js/words.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>

        <!-- Bootstrap core JS-->
        <script src="${contextPath}/resources/js/wordle.js"></script>

    </body>
</html>
