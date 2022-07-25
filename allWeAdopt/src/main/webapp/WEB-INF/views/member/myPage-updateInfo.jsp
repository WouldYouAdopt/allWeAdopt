<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%-- 문자열 관련 함수(메서드) 제공 JSTL (EL형식으로 작성) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

        <!-- signUp, myPage-updateInfo css -->
        <link rel="stylesheet" href="${contextPath}/resources/css/signUp-style.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/myPage-updateInfo.css">

        <!-- sweetalert-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

            <!-- 헤더 -->
            <jsp:include page="/WEB-INF/views/common/header.jsp" />

            <!-- 마이페이지 nav -->
            <jsp:include page="/WEB-INF/views/common/mypage-header.jsp" />


            <!-- 회원가입 페이지 -->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5" id="bg-light">
                        <div class="text-center mb-5">
                            <div class=" bg-gradient text-white rounded-3 mb-3"><img src="${contextPath}/resources/images/logo.png" id="signUpLogo"></div>
                            <h1 class="fw-bolder">회원 정보 수정</h1>
                        </div>
                        <div class="row gx-5 justify-content-center">

                            <div class="col-lg-8 col-xl-6">
                                <!-- 나의 정보 관리 폼 -->

                                <form action="${contextPath}/member/myPage/updateInfo/1" method="POST" id="updateInfo" enctype="multipart/form-data" onsubmit="return updateInfoValidate()">

                                    <div class="form-floating mb-3 confirm-area updateTitle">
                                        <p>나의 정보 관리</p>
                                    </div>

                                    <!-- 이메일 주소 -->
                                    <div class="form-floating mb-2 confirm-area">
                                        <input class="form-control" name="memberEmail" id="memberEmail" type="email" value="${loginMember.memberEmail}" readonly/>
                                        <label for="memberEmail"><span>* </span>이메일</label>
                                    </div>
                                    <div id="emailMsg" class="form-floating validate-area"></div>

                                    <!-- 이름 -->
                                    <div class="form-floating mb-2 confirm-area">
                                        <input class="form-control" name="memberName" id="memberName" type="text"  value="${loginMember.memberName}" />
                                        <label for="memberName"><span>* </span>이름 </label>
                                    </div>
                                    <div id="nameMsg" class="form-floating validate-area"></div>

                                    <!-- 포인트 잔액 -->
                                    <div class="form-floating mb-2 confirm-area">
                                        <input class="form-control" type="text"  value="${loginMember.memberPoint} p" readonly/>
                                        <label for="memberName"><span> </span>포인트 </label>
                                    </div>
                                    <div id="nameMsg" class="form-floating validate-area"></div>

                                    <!-- 회원정보에 전화번호가 있는 경우 -->
                                    <c:if test="${!empty loginMember.memberTel}">

                                        <!-- 전화번호 -->
                                        <div class="form-floating mb-3 confirm-area">
                                            <input class="form-control" name="memberTel" id="currTel" type="tel"  value="${loginMember.memberTel}" readonly/>
                                            <label for="currTel"><span>* </span>휴대폰 번호<span>(인증 완료)</span></label>
                                            <div class="spaceArea confirmBtnArea">
                                                <button id="changeBtn" type="button">변경</button>
                                            </div>
                                        </div>

                                        <!-- 전화번호 -->
                                        <div class="form-floating mb-3 confirm-area none" id="telBox">
                                            <input class="form-control" id="memberTel" type="tel" />
                                            <label for="memberTel" id="newTel"><span>*</span>휴대폰 번호(-제외) </label>
                                            <div class="spaceArea confirmBtnArea">
                                                <button id="confirmBtn" type="button">인증</button>
                                            </div>
                                        </div>

                                        <!-- 인증번호-->
                                        <div class="form-floating mb-2 confirm-area none" id="numBox">
                                            <input class="form-control" id="number" type="tel"  />
                                            <label for="number" id="cMessage"><span>* </span>인증번호</label>
                                        </div>
                                        <div id="telMsg" class="form-floating validate-area"></div>
                                        
                                    </c:if>

                                    <!-- 회원정보에 전화번호가 없는 경우 (카카오 로그인 후 번호 인증 이력 없는 경우) -->
                                    <c:if test="${empty loginMember.memberTel}">

                                        <!-- 전화번호 -->
                                        <div class="form-floating mb-3 confirm-area" id="telBox">
                                            <input class="form-control" name="memberTel" id="memberTel" type="tel" />
                                            <label for="memberTel" id="newTel">휴대폰 번호(-제외) </label>
                                            <div class="spaceArea confirmBtnArea">
                                                <button id="confirmBtn" type="button">인증</button>
                                            </div>
                                        </div>

                                        <!-- 인증번호-->
                                        <div class="form-floating mb-2 confirm-area" id="numBox">
                                            <input class="form-control" id="number" type="tel"  />
                                            <label for="number" id="cMessage"><span>* </span>인증번호</label>
                                        </div>
                                        <div id="telMsg" class="form-floating validate-area"></div>

                                    </c:if>                                    

                                    <!-- 주소 -->			<!--  fn:split(문자열, '구분자')  -->
					                <c:set var="addr"  value="${fn:split(loginMember.memberAddress, ',,')}"  />    

                                    <!-- 주소 (다음 api) -->
                                    <div class="form-floating mb-3 confirm-area">
                                        <input class="form-control" type="text" id="sample4_postcode" name="memberAddress" maxlength="6" value="${addr[0]}" >
                                        <label for="memberAddress">우편번호</label>
                                        <div class="spaceArea confirmBtnArea">
                                            <button type="button" onclick="sample4_execDaumPostcode()">검색</button>
                                        </div>
                                    </div>

                                    <div class="form-floating mb-3 confirm-area">
                                        <input class="form-control" type="text" name="memberAddress" id="sample4_roadAddress" value="${addr[1]}" >
                                        <label for="memberAddress">도로명주소</label>
                                    </div>

                                    <div class="form-floating mb-3 confirm-area">
                                        <input class="form-control" type="text" name="memberAddress" id="sample4_detailAddress" value="${addr[2]}" >
                                        <label for="memberAddress">상세주소</label>
                                    </div>
                                    <div class="form-floating validate-area"></div>

                                    <!-- 프로필 사진-->
                                    <div class="form-floating confirm-area profile-image-area">
                                        <div id="img-area">
                                            <c:if test="${empty loginMember.profileImage}">
                                                <img src="${contextPath}/resources/images/user.png" id="profileImg">
                                            </c:if>

                                            <c:if test="${!empty loginMember.profileImage && loginMember.memberType == 'M'}">
                                                <img src="${contextPath}/${loginMember.profileImage}" id="profileImg">
                                            </c:if>

                                            <c:if test="${!empty loginMember.profileImage && loginMember.memberType == 'K'}">
                                                <img src="${loginMember.profileImage}" id="profileImg">
                                            </c:if>

                                        </div>
                                        <div class="imageBtnArea">

                                            <c:if test="${loginMember.memberType == 'M'}">
                                                <input id="profileImage" type="file" name="uploadImage" accept="image/*" >
                                                <label for="profileImage">수정</label>
                                                <input type="hidden" id="deleteImage" name="deleteImage" value="0">
                                                <label for="deleteImage" id="del">삭제</label>
                                            </c:if>

                                            <c:if test="${loginMember.memberType == 'K'}">
                                                <input id="profileImage" type="file" name="uploadImage" accept="image/*">
                                                <label id="gray">수정</label>
                                                <input type="hidden" id="deleteImage" name="deleteImage" value="0">
                                                <label for="deleteImage" id="gray">삭제</label>
                                            </c:if>

                                        </div>
                                    </div>
                                    <div class="form-floating validate-area"></div>

                                    <!-- Submit Button-->
                                    <div class="d-grid">
                                        <button class="btn btn-primary btn-lg" id="submitButton1" type="submit">수정하기</button>
                                    </div>
                                </form>

                                <c:if test="${loginMember.memberType=='M'}">
                                    <!-- 비밀번호 변경 폼 -->
                                    <form action="${contextPath}/member/myPage/updateInfo/2" method="POST" id="updatePw" onsubmit="return updateInfoValidate2()">

                                        <div class="form-floating mb-3 confirm-area updateTitle">
                                            <p>비밀 번호 변경</p>
                                        </div>

                                        <!-- 현재 비밀번호 -->
                                        <div class="form-floating mb-3 confirm-area">
                                            <input class="form-control" name="inputPw" id="inputPw" type="password"   />
                                            <label for="inputPw"><span>* </span>비밀번호</label>
                                        </div>

                                        <!-- 새 비밀번호 -->
                                        <div class="form-floating mb-3 confirm-area">
                                            <input class="form-control" name="newPw" id="newPw" type="password"   />
                                            <label for="newPw"><span>* </span>새 비밀번호</label>
                                        </div>

                                        <!-- 비밀번호 확인-->
                                        <div class="form-floating mb-2 confirm-area">
                                            <input class="form-control" id="newPwConfirm" type="password"  />
                                            <label for="newPwConfirm"><span>* </span>새 비밀번호 확인</label>
                                        </div>
                                        <div id="pwMsg" class="form-floating validate-area"></div>

                                        <!-- Submit Button-->
                                        <div class="d-grid">
                                            <button class="btn btn-primary btn-lg" id="submitButton2" type="submit">변경하기</button>
                                        </div>
                                    </form>

                                </c:if>
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

            <c:if test="${empty loginMember.profileImage}">
                const memberProfile = "${contextPath}/resources/images/user.png";
            </c:if>
            <c:if test="${!empty loginMember.profileImage}">
                const memberProfile = "${contextPath}/${loginMember.profileImage}";
            </c:if>
            
        </script>
        
        <!-- jQuery 라이브러리 추가(CDN) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- 다음 주소 api-->
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>
        <script src="${contextPath}/resources/js/myPage-updateInfo.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
