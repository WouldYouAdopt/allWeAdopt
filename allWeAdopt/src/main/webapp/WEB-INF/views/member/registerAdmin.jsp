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
        <title>관리자 등록</title>

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

        <!-- signUp css -->
        <link rel="stylesheet" href="${contextPath}/resources/css/signUp-style.css">

        <!-- sweetalert-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </head>
    <body class="d-flex flex-column">

        <main class="flex-shrink-0">

            <!-- 헤더 -->
            <jsp:include page="/WEB-INF/views/common/admin-header.jsp" />

            <!-- 회원가입 페이지 -->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5" id="bg-light">
                        <div class="text-center mb-5">
                            <div class=" bg-gradient text-white rounded-3 mb-3"><img src="${contextPath}/resources/images/logo.png" id="signUpLogo"></div>
                            <h1 class="fw-bolder">관리자 계정 등록</h1>
                            <p class="lead fw-normal text-muted mb-0" id="welcome">ALL WE ADOPT 관리자 계정 등록</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">

                                <form action="${contextPath}/member/registerAdmin" id="signUpForm" method="POST" enctype="multipart/form-data" onsubmit="return signUpValidate()">

                                    <!-- 이메일 주소 -->
                                    <div class="form-floating mb-2 confirm-area">
                                        <input class="form-control" name="memberEmail" id="memberEmail" type="email" placeholder="name@example.com"  />
                                        <label for="memberEmail"><span>* </span>이메일</label>
                                    </div>
                                    <div id="emailMsg" class="form-floating validate-area"></div>

                                    <!-- 이름 -->
                                    <div class="form-floating mb-2 confirm-area">
                                        <input class="form-control" name="memberName" id="memberName" type="text" placeholder="Enter your name..."  />
                                        <label for="memberName"><span>* </span>이름 </label>
                                    </div>
                                    <div id="nameMsg" class="form-floating validate-area"></div>

                                    <!-- 관리자용 가짜 전화번호 -->
                                    <input type="hidden" name="memberTel" value="01000000000">

                                    <!-- Submit Button-->
                                    <div class="d-grid"><button class="btn btn-primary btn-lg" id="signUpBtn" >등록</button></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <script>
            const contextPath = "${contextPath}";
        </script>

        <!-- jQuery 라이브러리 추가(CDN) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>
        <script src="${contextPath}/resources/js/registerAdmin.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
