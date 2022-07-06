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
        <title>회원 정보 수정</title>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/올위어답터.ico" />

        <!-- main css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main-style.css">

        <!-- 폰트어썸 (폰트)-->
        <script src="https://kit.fontawesome.com/e4f51ae88c.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Gowun+Batang&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />

        <!-- signUp, myPage-updateInfo css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signUp-style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage-updateInfo.css">

    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">


            <!-- 회원가입 페이지 -->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5" id="bg-light">
                        <div class="text-center mb-5">
                            <div class=" bg-gradient text-white rounded-3 mb-3"><img src="${pageContext.request.contextPath}/resources/images/logo.png" id="signUpLogo"></div>
                            <h1 class="fw-bolder">회원 정보 수정</h1>
                        </div>
                        <div class="row gx-5 justify-content-center">

                            <div class="col-lg-8 col-xl-6">
                                <!-- 나의 정보 관리 폼 -->
                                <form id="updateInfo" data-sb-form-api-token="API_TOKEN">

                                    <div class="form-floating mb-3 confirm-area updateTitle">
                                        <p>나의 정보 관리</p>
                                    </div>

                                    <!-- 이메일 주소 -->
                                    <div class="form-floating mb-3 confirm-area updateInfo">
                                        <input class="form-control" id="email" type="email" placeholder="name@example.com" readonly />
                                        <label for="email"><span>* </span>이메일</label>
                                    </div>

                                    <!-- 이름 -->
                                    <div class="form-floating mb-3 confirm-area">
                                        <input class="form-control" id="name" type="text" placeholder="Enter your name..."  />
                                        <label for="name"><span>* </span>이름 </label>
                                    </div>

                                    <!-- 전화번호 -->
                                    <div class="form-floating mb-3 confirm-area">
                                        <input class="form-control" id="phone" type="tel" placeholder="(010) 456-7890"  />
                                        <label for="phone"><span>* </span>전화번호(-제외) </label>
                                        <div class="spaceArea confirmBtnArea">
                                            <button id="confirmBtn">인증</button>
                                        </div>
                                    </div>

                                    <!-- 인증번호-->
                                    <div class="form-floating mb-3 confirm-area">
                                        <input class="form-control" id="number" type="tel" placeholder="(010) 456-7890"  />
                                        <label for="number"><span>* </span>인증번호</label>
                                    </div>

                                    <!-- 주소 (다음 api) -->
                                    <div class="form-floating mb-3 confirm-area">
                                        <input class="form-control" type="text" id="sample4_postcode" name="memberAddress" maxlength="6">
                                        <label for="memberAddress">우편번호</label>
                                        <div class="spaceArea confirmBtnArea">
                                            <button type="button" onclick="sample4_execDaumPostcode()">검색</button>
                                        </div>
                                    </div>

                                    <div class="form-floating mb-3 confirm-area">
                                        <input class="form-control" type="text" name="memberAddress" id="sample4_roadAddress">
                                        <label for="memberAddress">도로명주소</label>
                                    </div>

                                    <div class="form-floating mb-3 confirm-area">
                                        <input class="form-control" type="text" name="memberAddress" id="sample4_detailAddress">
                                        <label for="memberAddress">상세주소</label>
                                    </div>

                                    <!-- 프로필 사진 추가-->
                                    <div class="form-floating mb-3 confirm-area">
                                        <div class="profile-image-area">
                                            <img src="${pageContext.request.contextPath}/resources/images/user.png" id="profileImg">

                                            <div class="imageBtnArea">
                                                <input id="input-image" type="file" name="uploadImage" accept="image/*">
                                                <label for="input-image">수정</label>
                                                <input type="hidden" id="delete-image" name="profileDelete">
                                                <label for="delete-image">삭제</label>
                                            </div>

                                        </div>
                                    </div>   

                                    <!-- Submit success message-->
                                    <!---->
                                    <!-- This is what your users will see when the form-->
                                    <!-- has successfully submitted-->
                                    <div class="d-none" id="submitSuccessMessage">
                                        <div class="text-center mb-3">
                                            <div class="fw-bolder">나의 정보 수정 완료!</div>
                                            To activate this form, sign up at
                                            <br />
                                            <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                        </div>
                                    </div>
                                    <!-- Submit error message-->
                                    <!---->
                                    <!-- This is what your users will see when there is-->
                                    <!-- an error submitting the form-->
                                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">나의 정보 수정 실패!</div></div>
                                    <!-- Submit Button-->
                                    <div class="d-grid"><button class="btn btn-primary btn-lg disabled" id="submitButton1" type="submit">수정하기</button></div>
                                </form>

                                <!-- 비밀번호 변경 폼 -->
                                <form id="updatePw" data-sb-form-api-token="API_TOKEN">

                                    <div class="form-floating mb-3 confirm-area updateTitle">
                                        <p>비밀 번호 변경</p>
                                    </div>

                                    <!-- 비밀번호 -->
                                    <div class="form-floating mb-3 confirm-area">
                                        <input class="form-control" id="pw" type="password" placeholder="Enter your name..."  />
                                        <label for="pw"><span>* </span>현재 비밀번호</label>
                                        <div class="invalid-feedback" data-sb-feedback="pw:required">Password is required.</div>
                                    </div>

                                    <!-- 새 비밀번호-->
                                    <div class="form-floating mb-3 confirm-area">
                                        <input class="form-control" id="newPw" type="password" placeholder="Enter your name..."  />
                                        <label for="newPw"><span>* </span>새 비밀번호</label>
                                    </div>

                                    <!-- 새 비밀번호 확인-->
                                    <div class="form-floating mb-3 confirm-area">
                                        <input class="form-control" id="newPwConfirm" type="password" placeholder="Enter your name..."  />
                                        <label for="newPwConfirm"><span>* </span>새 비밀번호 확인</label>
                                    </div>

                                    <!-- Submit success message-->
                                    <!---->
                                    <!-- This is what your users will see when the form-->
                                    <!-- has successfully submitted-->
                                    <div class="d-none" id="submitSuccessMessage">
                                        <div class="text-center mb-3">
                                            <div class="fw-bolder">Form submission successful!</div>
                                            To activate this form, sign up at
                                            <br />
                                            <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                        </div>
                                    </div>
                                    <!-- Submit error message-->
                                    <!---->
                                    <!-- This is what your users will see when there is-->
                                    <!-- an error submitting the form-->
                                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                                    <!-- Submit Button-->
                                    <div class="d-grid"><button class="btn btn-primary btn-lg disabled" id="submitButton2" type="submit">변경하기</button></div>
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
        
        <!-- 다음 주소 api-->
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/myPage-updateInfo.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
