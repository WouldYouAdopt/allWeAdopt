<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/assets/올위어답터.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />

        <%-- 쿼리 연결 --%>
	    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

        <!-- 폰트어썸 (폰트)-->
        <script src="https://kit.fontawesome.com/e4f51ae88c.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Gowun+Batang&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

        <!-- main css -->
        <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
        <link rel="stylesheet" href="${contextPath}/resources/css/board/userBoardDetail.css">
        <link href="${contextPath}/resources/css/shelter/shelter-main.css" rel="stylesheet" />

    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- 헤더 -->
           <c:if test="${empty adminMember}">
                <jsp:include page="/WEB-INF/views/common/header.jsp" />
                <c:set var="url" value="../board/detail/2/"/>
            </c:if>
            <c:if test="${!empty adminMember}">
                <jsp:include page="/WEB-INF/views/common/admin-header.jsp" />
                <c:set var="url" value="${contextPath}/admin/board/detail/2/"/>
            </c:if>

            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-3">
                            <div class="d-flex align-items-center mt-lg-5 mb-4">
                                <img class="img-fluid rounded-circle" src="${contextPath}${board.profileImage}" alt="..." />
                                <div class="ms-3">
                                    <div class="fw-bold">${board.memberName}</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <!-- Post title-->
                                    <div class="title-area">
                                        <h1 class="fw-bolder mb-1">${board.boardTitle}</h1>
                                        <c:if test="${(loginMember.memberNo == board.memberNo) || loginMember.memberType == 'A'}">
                                        <div>
                                            <a href="${board.boardNo}/boardModify"><p class="modify">수정</p></a>
                                            <a href="${board.boardNo}/boardDelete"><p class="delete" onclick="return deleteBtn()">삭제</p></a>
                                        </div> 
                                        </c:if>
                                    </div>
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2">${board.createDate}
                                    <c:if test="${!empty loginMember}">||
                                        <c:if test="${like==0}">
                                            <span id="likeIcon">&#x2661;</span>
                                            <c:set var="iconValue" value="0"/>
                                        </c:if>
                                         <c:if test="${like==1}">
                                            <span id="likeIcon">&#x2665;</span>
                                            <c:set var="iconValue" value="1"/>
                                        </c:if>
                                    </c:if>




                                    <input type="hidden" value="${iconValue}" class="iconValue" name="iconValue">
                                    </div>
                                    <!-- Post categories-->
                                    <div class="tag-area">
                                        <div class="tag">
                                            <a class="badge bg-secondary text-decoration-none link-light animal" href="#!">${board.animalType}</a>
                                            <c:if test="${!empty board.animalDetail}">
                                                <a class="badge bg-secondary text-decoration-none link-light animalDetail" href="#!">${board.animalDetail}</a>
                                            </c:if>
                                            <a class="badge bg-secondary text-decoration-none link-light gender" href="#!">
                                                <c:choose>
                                                    <c:when test="${board.gender eq 'M'}">
                                                        수컷
                                                    </c:when>
                                                    <c:otherwise>
                                                        암컷
                                                    </c:otherwise>
                                                </c:choose>
                                            </a>
                                            <c:if test="${board.neutering eq 'Y'}">
                                                <a class="badge bg-secondary text-decoration-none link-light neutering" href="#!">
                                                        중성화
                                                </a>
                                            </c:if>
                                        </div>

                                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                            <button type="button" class="btn btn-outline-secondary btn-sm allButton"  data-bs-toggle="modal" data-bs-target="#makePam">전단지 만들기</button>
                                        </div>


                                        



                                    </div>
                                </header>
                                
                                <!-- Post content-->
                                <section class="mb-5">
                                    ${board.boardContent}

                                    * 연락처 : ${board.phone} <br><br>
                                    * 지역 : ${board.area} ${board.areaDetail} <br><br>
                                    * 공유 기간 : ${board.boardPeriod} ~ ${board.boardPeriod2}
                                </section>


                            </article>

                            <!-- 공유 기능 -->
                            <div class="share-area">
                                <a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();"><img src="${contextPath}\resources\images\icon-twitter.png"></a>
                                <a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();"><img src="${contextPath}\resources\images\icon-facebook.png"></a>    
                                <a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();"><img src="${contextPath}\resources\images\icon-kakao.png"></a>    
                            </div>
                           
                            <!-- 문의 버튼 -->
                            <c:if test="${(board.memberNo!=loginMember.memberNo) && !empty loginMember}">
                                <div class="btn-area">
                                    <button class="btnRegist" onclick="selectThisUser(${board.memberNo})">문의하기</button>
                                </div>
                            </c:if>



                            
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
                                                            
                                                            <img id="myimage" style="width: 100px; height: 100px; display: none;" src="${board.thumbnail}" alt="myPet">
                                                            <img id="myimage2" style="width: 20px; height: 20px; display: none;" src="${contextPath}\resources\images\pamphlet.png" alt="The Scream">

                                                            <canvas id="myCanvas" width="1000" height="1000" ></canvas>

                                                        </div>
                                                    </div>



                                                    <script>

                                                    
                                                    const phone = "${board.phone}"
                                                    // const date = "${detail.createDate}"
                                                    const memberEmail = "${board.memberEmail}"

                                                    // const petName = document.querySelector('.mb-5>p:nth-child(1)').innerText;
                                                    const date = "${board.boardPeriod}"
                                                    const petPlace = "${board.area} ${board.areaDetail}"

                                                    window.onload = function() {

                                                    var c = document.getElementById("myCanvas");
                                                    var ctx = c.getContext("2d");
                                                    var img = document.getElementById("myimage");
                                                    var img2 = document.getElementById("myimage2");
                                                    ctx.drawImage(img2, 0, 0, 1000, 1000);
                                                    ctx.drawImage(img, 25, 160, 380, 400);

                                                    ctx.font = "70px Helvetica";
                                                    ctx.fillStyle  = "red";
                                                    ctx.fillText(phone, 160, 700);

                                                    ctx.font = "40px Helvetica";
                                                    ctx.fillStyle  = "black";
                                                    ctx.fillText('이름 : 또리', 410, 200);

                                                    ctx.font = "40px Helvetica";
                                                    ctx.fillStyle  = "black";
                                                    ctx.fillText('나이 : 4세', 410, 260);

                                                    ctx.font = "40px Helvetica";
                                                    ctx.fillStyle  = "black";
                                                    ctx.fillText('아이디 : ' + memberEmail , 410, 315);

                                                    ctx.font = "40px Helvetica";
                                                    ctx.fillStyle  = "red";
                                                    ctx.fillText('잃어버린 날짜 : ' + date, 410, 370);

                                                    ctx.font = "40px Helvetica";
                                                    ctx.fillStyle  = "red";
                                                    ctx.fillText('장소 : ' + petPlace, 410, 430);

                                                    ctx.font = "30px Helvetica";
                                                    ctx.fillStyle  = "black";
                                                    ctx.fillText("특징 : 사람을 좋아해요", 20, 605);

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
                </div>
            </section>
        </main>
       <!-- 푸터 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

        <script>
        const loginMember = ${loginMember.memberNo};
        const boardNo = ${board.boardNo};
        const contextPath = "${contextPath}";
        const thumbnail = "${board.thumbnail}";
        </script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></>
        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>
        <script src="${contextPath}/resources/js/board/userBoardDetail.js"></script>
        <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

        <script src="${contextPath}/resources/js/shelter.js"></script>



    </body>
</html>
