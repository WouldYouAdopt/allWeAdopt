<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>로그인</title>

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

        <!-- signUp & login css -->
        <link rel="stylesheet" href="${contextPath}/resources/css/signUp-style.css">

        <%-- 카카오 로그인 --%>
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width,initial-scale=1">



    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

            <jsp:include page="/WEB-INF/views/common/header.jsp" />

            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class=" rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <h1 class="fw-bolder">login</h1>
                            <p class="lead fw-normal text-muted mb-0">가입한 이메일 주소를 입력해주세요.</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <form class="form-floating" action="login" method="post" name="login-form" onsubmit="return loginValidate()">

                                    <div class=" form-floating mb-3">
                                         <input name="memberEmail" type="email" class="form-control" id="floatingInputValue" placeholder="name@example.com" >
                                        <label for="floatingInputValue">이메일 입력</label>
                                    </div>
                                    <div class=" form-floating mb-3">
                                        <input name="memberPw" type="password" class="form-control" id="floatingInputValue2" placeholder="비밀번호를 입력하세요." >
                                        <label for="floatingInputValue2">비밀번호 입력</label>
                                    </div>
                                    <button class="btn button-pink col-xl-12" style="height: 50px; color: white;"> 로그인 </button>

                            
                                    <div class="mt-3"></div>

                                    <div class=" btn col-xl-12" style="height: 50px; background-color: #fae100; "  onclick="kakaoLogin();">
                                        <a id="kakao-login-btn " href="javascript:void(0)" style=" color:black; line-height: 2; text-decoration: none;" >
                                            카카오 로그인
                                        </a>
                                    </div>
                            


                                    
                                </form>
                                
                                <div class="mt-4" style="border-bottom: 1px solid black;"></div>

                                <div class="d-flex  justify-content-between mt-3">
                                    <div><a href="changePw" class="text-decoration-none" style=" color : rgb(251, 131, 107);">비밀번호 재설정</a> </div>
                                    <div><a href="signUp"class="text-decoration-none" style=" color : rgb(251, 131, 107);">회원가입</a> </div>
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
        <%-- <script src="js/scripts.js"></script> --%>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>


        

        <%-- 카카오 로그인2 --%>
        <script>
            //카카오로그인
            function kakaoLogin() {

                $.ajax({
                    // url: '/login/getKakaoAuthUrl',
                    url: 'kakaoLogin',
                    type: 'get',
                    async: false,
                    dataType: 'text',
                    success: function (res) {
                        location.href = res;
                        console.log(res);
                    }
                });
            }
        </script>


         <!-- 카카오 로그아웃 : 로그아웃 기능은 실제 로그아웃을 하는 기능이 아닌, 토큰을 만료시켜서, 카카오의 다른 기능을 사용하지 못하도록 하는 것. -->
        <%-- <script type="text/javascript">
            function kakaoLogout() {
              if (!Kakao.Auth.getAccessToken()) {
                alert('Not logged in.')
                return;
              }
              Kakao.Auth.logout(function() {
                alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
              })
            }
          </script> --%>
          <!-- 로그아웃 버튼 누르면 : (웹페이지 자체의 서버세션 종료 : 기존로그아웃처럼 그게 피요할거다!) -->

    </body>
</html>
