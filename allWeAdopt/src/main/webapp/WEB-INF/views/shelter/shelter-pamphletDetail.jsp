<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>ALL WE ADOPT</title>
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
        <link href="${contextPath}/resources/css/main-style.css" rel="stylesheet" />
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />

        <link href="${contextPath}/resources/css/shelter/shelter-reply.css" rel="stylesheet" />

        <link href="${contextPath}/resources/css/shelter/shelter-main.css" rel="stylesheet" />

        <!-- sweetalert-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>




        <style>
            .nav-text-color{
                /* color: rgb(251, 131, 107); */
                color: black;
            }
           
            .secession-button{
                border: 1px solid rgba(255, 255, 255, 0.3);
                border-radius: 5px;
            }
            .nav-text-color:hover {
                color: rgb(251, 131, 107);
            }
            .bg-pink {
            —bs-bg-opacity: 1;
            background-color: rgb(251, 131, 107);
            }


            .st0{fill:#373737;}
            .st1{fill:#FB836B;}
            .st2{fill:none;stroke:#373737;stroke-width:7.3;stroke-miterlimit:10;}

        </style>
    </head>

    <body class="d-flex flex-column">
        <main class="flex-shrink-0">

            <jsp:include page="/WEB-INF/views/common/header.jsp" />
            <!-- Navigation-->


            <img src="${contextPath}/resources/images/Pet-Friendly.jpg" class="img-fluid" alt="shelter-pamphlet" styles="width: 100%;">


            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-3">
                            <div class="d-flex align-items-center mt-lg-5 mb-4">

                                    <%-- 작성자 이미지 --%>
                                    <c:if test="${empty detail.profileImage}">
                                        <img src="${contextPath}/resources/images/user.png" id="member-profile" style="width : 35px; height : 35px; ">	
                                    </c:if>     

                                    <c:if test="${!empty detail.profileImage && detail.memberType == 'K'}">
                                        <img src="${detail.profileImage}" id="member-profile" style="width : 35px; height : 35px; border:0.5px solid #ccc; border-radius:50%;">
                                    </c:if>

                                    <%-- 사용자 설정 프로필이미지 --%>
                                    <c:if test="${!empty detail.profileImage && detail.memberType == 'M'}">
                                        <img src="${contextPath}/${detail.profileImage}" id="member-profile" style="width : 35px; height : 35px; ">
                                    </c:if>


                                <div class="ms-3">
                                    <div class="fw-bold">${detail.memberName}</div>
                                    <div class="text-muted">${detail.memberEmail}</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <!-- Post title-->
                                    <h1 class="fw-bolder mb-1">${detail.boardTitle}</h1>
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2">
                                        작성일 : ${detail.createDate} /
                                        <c:if test="${!empty detail.updateDate}">수정일 : ${detail.updateDate}</c:if>

                                    </div>


                                    <div class="md-10" style="margin:10px;"></div>

                                    <%-- <div>                                
                                        <a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();"><img src="${contextPath}\resources\images\icon-twitter.png"></a>
                                        <a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();"><img src="${contextPath}\resources\images\icon-facebook.png"></a>    
                                        <a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();"><img src="${contextPath}\resources\images\icon-kakao.png"></a>    
                                    </div> --%>

                                </header>


                                <div class="md-10" style="margin:10px;"></div>

                                <!-- Post content-->
                                <section class="mb-5">
                                    ${detail.boardContent}       
                                </section>

                            </article>



                            <!-- 댓글 -->
                            <jsp:include page="/WEB-INF/views/shelter/shelter-reply.jsp"/>



                            <!-- 버튼 영역-->
                            <div class="board-btn-area">

                                <c:if test="${loginMember.memberNo == detail.memberNo}">

                                    <%-- cp가 없을 경우에 대한 처리 --%>
                                    <c:if test="${empty param.cp}">
                                        <!-- 파라미터에 cp가 없을 경우 1 -->
                                        <c:set var="cp" value="1" />
                                    </c:if>

                                    <c:if test="${!empty param.cp}">
                                        <!-- 파라미터에 cp가 있을 경우 param.cp -->
                                        <c:set var="cp" value="${param.cp}" />
                                    </c:if>


                                    <button id="updateBtn" class="btn btn-outline-success allButton" onclick="location.href='../write?mode=update&cp=${cp}&no=${detail.boardNo}'">수정</button>                       
                                    <button id="deleteBtn" class="btn btn-outline-success allButton">삭제</button>
                                </c:if>

                                <button id="goToListBtn" class="btn btn-outline-success allButton">목록으로</button>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </main>
        <!-- Footer-->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <%-- <script src="js/scripts.js"></script> --%>

        <!-- jQuery 추가 -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
 


    <script>

        // 최상위 주소
        const contextPath = "${contextPath}";
        
        // 게시글 번호
        const boardNo = "${detail.boardNo}"; // "500"

        // 로그인한 회원 번호
        const loginMemberNo = "${loginMember.memberNo}";
        // -> 로그인 O  : "10";
        // -> 로그인 X  : "";  (빈문자열)

        const thumbnail = "${detail.thumbnail}";

    </script>

    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="${contextPath}/resources/js/shelterReply.js"></script>
    <script src="${contextPath}/resources/js/shelter.js"></script>
    <script src="${contextPath}/resources/js/shelterWrite.js"></script>

    <%-- 카카오톡 공유하기 --%>

        
    </body>
    
</html>