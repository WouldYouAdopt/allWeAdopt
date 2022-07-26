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

            <%-- <section class="py-5">
                <div class="container px-5">
                    <div class="card border-0 shadow rounded-3 overflow-hidden">
                        <div class="card-body p-0">
                            <div class="row gx-0">
                                <!-- 분양소 메인 로고 (클릭 시 최상위 주소) -->
                                <a href="${contextPath}"><div class="col-lg-6 col-xl-7"><div class="bg-featured-blog" style="background-image: url('https://dummyimage.com/700x350/343a40/6c757d')"><img src="${contextPath}/resources/images/adopt-mainLogo.png" alt="main"></div></div></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section> --%>

            <img src="${contextPath}/resources/images/Pet-Friendly.jpg" class="img-fluid" alt="...">


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

                                <%-- <img class="img-fluid rounded-circle" src="${detail.profileImage}" alt="..." /> --%>

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

                                    <%-- <c:if test="${!empty detail.updateDate}">
                                        <div class="text-muted fst-italic mb-2">수정일 : ${detail.updateDate}</div>
                                    </c:if> --%>
                                    
                                    <!-- Post categories-->
                                    <%-- <a class="badge bg-secondary text-decoration-none link-light" href="#!">관심 등록</a> --%>

                                    <div class="md-10" style="margin:10px;"></div>

                                    <div>                                
                                        <a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();"><img src="${contextPath}\resources\images\icon-twitter.png"></a>
                                        <a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();"><img src="${contextPath}\resources\images\icon-facebook.png"></a>    
                                        <a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();"><img src="${contextPath}\resources\images\icon-kakao.png"></a>    
                                    </div>


                                    <%-- <c:if test="${!empty detail.thumbnail}">
                                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                            <button type="button" class="btn btn-outline-secondary btn-sm allButton"  data-bs-toggle="modal" data-bs-target="#makePam">전단지 만들기</button>
                                        </div>
                                    </c:if> --%>


                                    <%-- <a class="badge bg-secondary text-decoration-none link-light" href="#!">${detail.memberEmail}</a> --%>
                                </header>
                                <!-- Preview image figure-->
                                <%-- <figure class="mb-4"><img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." /></figure> --%>

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
                                                                            <!-- detail?type=1&cp=3&no=100 -->
                                                                            <!-- detail?no=1522&type=2 -->
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

                                <!-- onclick="history.back();"  뒤로가기 
                                    history.go(숫자) : 양수(앞으로가기), 음수(뒤로가기)
                                -->
                                <button id="goToListBtn" class="btn btn-outline-success allButton">목록으로</button>
                            </div>
                        </div>



                        <!-- Modal -->
                        <div class="modal fade" id="makePam" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">전단지</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <%-- <img src="${detail.thumbnail}" style="width: 450px; height: 400px;"/> --%>

                                    <p>
                                        <%-- <textarea onkeyup='writeText(this)' id='textArea' 
                                            placeholder='연락처를 입력해주세요' rows='2' cols='50'>
                                        </textarea> --%>
                                    </p>

                                    <div>
                                        <!--The parent container, image and container for text (to place over the image)-->
                                        <div class="mainContainer" id='mainContainer'>

                                            <!--The default image. You can select a different image too.-->
                                            <%-- <img src="default-pam.png" id="myimage2" alt="" />
                                            <img src="" id="myimage" alt="" /> --%>
                                            
                                            <img id="myimage" style="width: 100px; height: 100px; display: none;" src="${detail.thumbnail}" alt="myPet">
                                            <img id="myimage2" style="width: 20px; height: 20px; display: none;" src="${contextPath}\resources\images\pamphlet.png"alt="The Scream">

                                            <canvas id="myCanvas" width="1000" height="1000" ></canvas>

                                        </div>
                                    </div>



                                    <script>

                                    
                                    const phone = "${detail.phone}"
                                    // const date = "${detail.createDate}"
                                    const memberEmail = "${detail.memberEmail}"

                                    const petName = document.querySelector('.mb-5>p:nth-child(1)').innerText;
                                    const petAge = document.querySelector('.mb-5>p:nth-child(2)').innerText;
                                    const date = document.querySelector('.mb-5>p:nth-child(3)').innerText;
                                    const petChar = document.querySelector('.mb-5>p:nth-child(4)').innerText;
                                    const petPlace = document.querySelector('.mb-5>p:nth-child(5)').innerText;

                                    window.onload = function() {

                                    var c = document.getElementById("myCanvas");
                                    var ctx = c.getContext("2d");
                                    var img = document.getElementById("myimage");
                                    var img2 = document.getElementById("myimage2");
                                    ctx.drawImage(img2, 0, 0, 1000, 1000);
                                    ctx.drawImage(img, 25, 160, 380, 400);

                                    ctx.font = "70px Helvetica";
                                    ctx.fillStyle  = "red";
                                    ctx.fillText('01012341234', 160, 700);

                                    ctx.font = "40px Helvetica";
                                    ctx.fillStyle  = "black";
                                    ctx.fillText(petName, 410, 200);

                                    ctx.font = "40px Helvetica";
                                    ctx.fillStyle  = "black";
                                    ctx.fillText(petAge, 410, 260);

                                    ctx.font = "40px Helvetica";
                                    ctx.fillStyle  = "black";
                                    ctx.fillText('아이디 : '+ memberEmail, 410, 315);

                                    ctx.font = "40px Helvetica";
                                    ctx.fillStyle  = "red";
                                    ctx.fillText(date, 410, 370);

                                    ctx.font = "40px Helvetica";
                                    ctx.fillStyle  = "red";
                                    ctx.fillText(petPlace, 410, 430);

                                    ctx.font = "30px Helvetica";
                                    ctx.fillStyle  = "black";
                                    ctx.fillText(petChar, 20, 605);

                                    }


                                    </script>


                                </div>
                                <div class="modal-footer">
                                    <a id = "download" download="image.png">
                                        <button type="button" onclick="download()" class="btn btn-primary" style="background-color:#FB836B; border:0;">전단지 저장</button>                             
                                    </a>
                                </div>
                                </div>
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

    <%-- 카카오톡 공유하기 --%>

        
    </body>
    
</html>