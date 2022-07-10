<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>비밀번호 재설정</title>

               
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
                            <h1 class="fw-bolder">비밀번호 재설정</h1>
                            <p class="lead fw-normal text-muted mb-0">가입한 이메일 주소를 입력해주세요.</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <!-- https://startbootstrap.com/solution/contact-forms-->
                                <!-- to get an API token!-->
                                <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                                        <!-- Name input-->
                                        <div class=" form-floating mb-3">
                                            <input class="form-control" id="name" type="text" data-sb-validations="required" />
                                            <label for="name">이메일 주소</label>
                                            <div class="invalid-feedback" data-sb-feedback="name:required">이메일을 입력해주세요.</div>
                                        </div>
                                        <div class=" form-floating input-group">
                                            <input class="form-control" id="num" type="text" data-sb-validations="required"   />
                                            <label for="num">인증번호 입력</label>
                                            <button class="btn bg-pink" id="button-newsletter" type="button" style="border-top-right-radius: 4px; border-bottom-right-radius: 4px; color : white;">인증번호 발송</button>
                                            <div class="invalid-feedback" data-sb-feedback="num:required" >인증번호 입력해주세요.</div>
                                        </div>
    
                                        <div class="mt-3"></div>

                                    <!-- This is what your users will see when the form-->
                                    <!-- has successfully submitted-->
                                    <div class="d-none" id="submitSuccessMessage">
                                        <div class="text-center mb-3">
                                            <div class="fw-bolder">인증번호 확인이 완료되었습니다!</div>
                                            아래 입력창에서 비밀번호 재설정을 해주세요.
                                            <br />
                                        </div>
                                    </div>
                                    <!-- Submit error message-->
                                    <!-- This is what your users will see when there is-->
                                    <!-- an error submitting the form-->
                                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                                    <!-- Submit Button-->
                                    <div class="d-grid"><button class="btn bg-pink btn-lg disabled text-white" id="submitButton" type="submit">확인</button></div>
                                    
                                    
                                </form>
                                
                                
                                <div class="mt-4"></div> 
                                <div class="mt-4"></div> 
                                <div class="mt-4"></div> 
                                
                                <!-- 비밀번호 재설정 -->
                                <!-- <div class="text-center mb-3">
                                    <p class="lead fw-normal text-muted mb-0">변경할 비밀번호를 입력해주세요.</p>
                                </div> -->
                                
                                <div class=" form-floating mb-3">
                                    <input class="form-control" id="name" type="text" data-sb-validations="required" />
                                    <label for="name">새 비밀번호</label>
                                    <div class="invalid-feedback" data-sb-feedback="name:required">비밀번호를 입력해주세요.</div>
                                </div>
                                <div class=" form-floating mb-3">
                                    <input class="form-control" id="name" type="text" data-sb-validations="required" />
                                    <label for="name">새 비밀번호 확인</label>
                                    <div class="invalid-feedback" data-sb-feedback="name:required">비밀번호를 확인해주세요.</div>
                                </div>
                                <button class="btn button-pink col-xl-12" style="height: 50px; color: white;"> 비밀번호 변경 </button>
                                
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
        <script src="js/scripts.js"></script>

        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
