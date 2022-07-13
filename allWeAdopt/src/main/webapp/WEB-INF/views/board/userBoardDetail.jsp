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
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
             <!-- 헤더 -->
            <jsp:include page="/WEB-INF/views/common/header.jsp" />

            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-3">
                            <div class="d-flex align-items-center mt-lg-5 mb-4">
                                <img class="img-fluid rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
                                <div class="ms-3">
                                    <div class="fw-bold">${board.memberName}</div>
                                    <button onclick="selectThisUser(${board.memberNo})">채팅</button>
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
                                        <div>
                                            <a href="#"><p class="modify">수정</p></a>
                                            <a href="#"><p class="delete">삭제</p></a>
                                        </div> 
                                    </div>
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2">${board.createDate}</div>
                                    <!-- Post categories-->
                                    <div class="tag-area">
                                        <div class="tag">
                                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">강아지</a>
                                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">중성화 여부</a>
                                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">성별</a>
                                        </div>
                                        <div class="like-area">
                                            <span class="dislike">&#x2661;</span>
                                            <span class="like">&#x2665;</span>
                                        </div>
                                    </div>
                                </header>
                                <!-- Preview image figure-->
                                <figure class="mb-4"><img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." /></figure>
                                <!-- Post content-->
                                <section class="mb-5">
                                    ${board.boardContent}
                                </section>
                            </article>

                            <!-- 공유 기능 -->
                            <div class="share-area">
                                <a href=""><img src="${contextPath}\resources\images\icon-twitter.png"></a>
                                <a href=""><img src="${contextPath}\resources\images\icon-kakao.png"></a>
                                <a href=""><img src="${contextPath}\resources\images\icon-facebook.png"></a>
                            </div>

                            <!-- 문의 버튼 -->
                            <div class="btn-area">
                                <button class="btnRegist">문의하기</button>
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
    </body>
</html>
