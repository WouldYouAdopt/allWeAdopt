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
        <title>2048</title>

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
        <link rel="stylesheet" href="${contextPath}/resources/css/point/2048-style.css">
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

            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class=" rounded-3 py-5 px-4 px-md-5 mb-5">


<%-- --------------------------------------------------------------------------------- --%>
                                                   
                        <jsp:include page="/WEB-INF/views/common/point-header.jsp" />

                        <h1 style="font-weight: 700;text-align:center;"> 2048 </h1>
                        <p class="lead fw-normal text-muted mb-0" style="text-align:center;">화살표 키를 이용해 타일을 이동하여 2048에 도달해보세요!</p>                    
                        <p class="lead fw-normal text-muted mb-0" style="text-align:center;">3000점 이상 득점시 500p를 드립니다 🐹</p>
                        


                        <div class="d-flex justify-content-center">
                            <div class="d-flex flex-column justify-content-center align-items-center">

                                <table id="titleBar" border=0>
                                    <tr>
<!--                                         <td id="titlePad">
                                            <p id="title">2048</p>
                                        </td> -->
                                        <td id="highScorePad">
                                            <p id="scoreType2">최고점수</p>
                                            <p id="score2">${highScore}</p>
                                        </td>
                                        <td id="scorePad">
                                            <p id="scoreType">Score</p>
                                            <p id="score"></p>
                                        </td>
                                    </tr>
                                </table>

                                <table id="board" border=0>
                                    <tr>
                                        <td id="00"></td>
                                        <td id="01"></td>
                                        <td id="02"></td>
                                        <td id="03"></td>
                                    </tr>
                                    <tr>
                                        <td id="10"></td>
                                        <td id="11"></td>
                                        <td id="12"></td>
                                        <td id="13"></td>
                                    </tr>
                                    <tr>
                                        <td id="20"></td>
                                        <td id="21"></td>
                                        <td id="22"></td>
                                        <td id="23"></td>
                                    </tr>
                                    <tr>
                                        <td id="30"></td>
                                        <td id="31"></td>
                                        <td id="32"></td>
                                        <td id="33"></td>
                                    </tr>
                                </table>
                                <p id="info" style="font-size:1px;">2048 Copyright (c) YJYOON All rights reserved.</p>

                            </div>
                        
                        </div>

<%-- --------------------------------------------------------------------------------- --%>

                    </div>
            </section>
        </main>

        <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        
        <script>
        const contextPath = "${contextPath}";

        let memberPoint = "${loginMember.memberPoint}";  
        </script>
        

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

        <script src="${contextPath}/resources/js/2048.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>

    </body>
</html>
