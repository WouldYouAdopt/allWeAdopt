<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>




<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>회원탈퇴</title>
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
        <link rel="stylesheet" href="${contextPath}/resources/css/myPage-updateInfo.css">

        <%-- 제이쿼리 cdn --%>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <%-- 리캡챠 --%>
         <%-- <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"async defer></script> --%>
         <script src="https://www.google.com/recaptcha/api.js"></script>

        <script>
        $(function() {
        $('#add_member_form').submit(function(e) {


                var captcha = 1;

                // 폼 제출 다음 수행.
                $.ajax({
                    url: '${contextPath}/member/myPage/VerifyRecaptcha',
                    type: 'post',
                    async : false,
                    data: {
                        
                        recaptcha: $("#g-recaptcha-response").val()
                        // recaptcha: document.querySelector('#g-recaptcha-response').value

                    },
                    success: function(data) {
                        console.log(data);
                        switch (data) {
                            case 0:
                                console.log("자동 가입 방지 봇 통과");
                                captcha = 0;
                                break;
                            case 1:
                                alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
                                return false;
                            default:
                                alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
                                break;
                        }
                    }
                });
                if(captcha != 0) {
                    return false;
                    e.preventDefault();
                } 
        });
        });


        const memberPw = document.getElementById("floatingInputValue");
        const pwMessage = document.getElementById("pwMessage");

        memberPw.addEventListener("input",function(){

            if(memberPw.value.length == 0 ){

                pwMessage.innerText = "비밀번호를 입력해주세요.";

                return;
            }





        });


        </script>

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
                    <div class=" rounded-3 py-5 px-4 px-md-5 mb-3">
                        <div class="text-center mb-5">
                            <h1 class="fw-bolder mb-3"> 정말 떠나실건가요?</h1>
                            <p class="lead fw-normal text-muted mb-0 fs-6" style="color: rgb(251, 131, 107)!important;">
                                ALL WE ADOPT를 떠나도<br> 반려동물에 대한 
                                사랑과 관심은 여전하실거라 믿어요!
                            </p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <form action="secession" method="post" name="frm"  class="form-floating" id="add_member_form" onsubmit="return secessionValidate()">

                                    <div class=" form-floating mb-3">
                                        <input type="password" class="form-control" id="floatingInputValue" name="memberPw" >
                                        <span id="pwMessage">비밀번호를 입력해주세요.</span>
                                        
                                        <c:if test="${  loginMember.memberType == 'M' }">
                                            <label for="floatingInputValue">비밀번호 입력</label>
                                        </c:if>
                                   
                                    </div>


                                    <div class="g-recaptcha" data-sitekey='6LfbI-MgAAAAAGAO7v9zg_Z68NxrIkKkTo1RwKhk'></div>
                                
                                    <button type="submit" class="btn col-xl-12" style="height: 50px; color: white; background-color: rgb(251, 131, 107);  "> ALL WE ADOPT 떠나기 </button>
                                    <%-- <button onclick="secessionOk();" class="btn col-xl-12" style="height: 50px; color: white; background-color: rgb(251, 131, 107);  "> ALL WE ADOPT 떠나기 </button> --%>
                                    
                                </form>
                                
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

        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

         <%-- <script src="${contextPath}/resources/js/myPage-Scession.js"></script> --%>


    </body>
</html>
