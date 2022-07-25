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
        <title>회원 정보 수정</title>

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
        <link rel="stylesheet" href="${contextPath}/resources/css/myPage-updateInfo.css">

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
                        <div class="text-center mb-5">
                            <h1 class="fw-bolder">비밀번호 확인</h1>
                            <p class="lead fw-normal text-muted mb-0">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 한 번 더 확인합니다.</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <form action="${contextPath}/member/myPage/updateInfo" method="POST" class="form-floating" onsubmit="return updateInfoValidate2()">

                                    <div class=" form-floating mb-3 pw-area">
                                        <input type="password" class="form-control" name="memberPw" id="inputPw" placeholder="비밀번호를 입력하세요." >
                                        <label for="memberPw">비밀번호</label>
                                        <div class="spaceArea confirmBtnArea">
                                            <button id="confirmBtn" >확인</button>

                                        </div>
                                    </div>
                                    
                                </form>
                                
                                <div class="mt-4" style="border-bottom: 1px solid black;"></div>
                            </div>
                            <div class="mt-4 notice-message">
                                <p>All We Adopt는 회원님의 개인정보를 신중히 취급하며,</p>
                                <p>회원님의 동의 없이는 기재하신 회원정보를 공개 및 변경하지 않습니다. </p>
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

        <script src="${contextPath}/resources/js/myPage-pwConfirm.js"></script>

        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
